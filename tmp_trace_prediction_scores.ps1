$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$outFile = Join-Path $root 'tmp_trace_prediction_scores.csv'
$errFile = Join-Path $root 'tmp_trace_prediction_scores.err.txt'

Remove-Item $outFile, $errFile -ErrorAction SilentlyContinue

$adomdPath = 'C:\Program Files\DAX Studio\bin\Microsoft.AnalysisServices.AdomdClient.dll'
[System.Reflection.Assembly]::LoadFrom($adomdPath) | Out-Null

$token = (Get-Content $tokFile -Raw).Trim()
$expires = [DateTimeOffset]::UtcNow.AddMinutes(30)
$accessToken = New-Object Microsoft.AnalysisServices.AdomdClient.AccessToken($token, $expires, $null)

function Invoke-Dax {
    param(
        [string]$DatasetName,
        [string]$ModelLabel,
        [string]$QueryText
    )

    $conn = New-Object Microsoft.AnalysisServices.AdomdClient.AdomdConnection
    $conn.ConnectionString = "Data Source=powerbi://api.powerbi.com/v1.0/myorg/Dev;Initial Catalog=$DatasetName;"
    $conn.AccessToken = $accessToken
    $conn.Open()

    try {
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = $QueryText
        $reader = $cmd.ExecuteReader()
        $rows = New-Object System.Collections.Generic.List[object]
        while ($reader.Read()) {
            $obj = [ordered]@{ Model = $ModelLabel }
            for ($i = 0; $i -lt $reader.FieldCount; $i++) {
                $obj[$reader.GetName($i)] = [string]$reader.GetValue($i)
            }
            $rows.Add([PSCustomObject]$obj) | Out-Null
        }
        $reader.Close()
        return $rows
    }
    finally {
        $conn.Close()
    }
}

$utilityQuery = @"
EVALUATE
UNION(
    CALCULATETABLE(
        ROW(
            "Score", "New Logo Selling Success Predictions",
            "BoostExpo", MAX(metadata_ai_scores[boost_expo]),
            "Factor1", [meas.ai_scores_new_logo_selling_factor1_value],
            "Factor2", [meas.ai_scores_new_logo_selling_factor2_value],
            "DirectScore", [meas.ai_scores_pred_new_logo_selling],
            "WrappedScore", [meas.ai_score]
        ),
        metadata_ai_scores[score_name] = "New Logo Selling Success Predictions"
    ),
    CALCULATETABLE(
        ROW(
            "Score", "Post-Sales Support Success Predictions",
            "BoostExpo", MAX(metadata_ai_scores[boost_expo]),
            "Factor1", [meas.ai_scores_post_sales_support_factor1_value],
            "Factor2", [meas.ai_scores_post_sales_support_factor2_value],
            "DirectScore", [meas.ai_scores_pred_post_sales_support],
            "WrappedScore", [meas.ai_score]
        ),
        metadata_ai_scores[score_name] = "Post-Sales Support Success Predictions"
    )
)
"@

$adeQuery = @"
EVALUATE
UNION(
    CALCULATETABLE(
        ROW(
            "Score", "New Logo Selling Success Predictions",
            "BoostExpo", MAX(metadata_ai_scores[boost_expo]),
            "Factor1", [meas.ai_scores_new_logo_selling_factor1_value],
            "Factor2", [meas.ai_scores_new_logo_selling_factor2_value],
            "DirectScore", [meas.ai_scores_pred_new_logo_selling],
            "ReadinessScore", [meas.readiness_ai_score]
        ),
        metadata_ai_scores[score_name] = "New Logo Selling Success Predictions"
    ),
    CALCULATETABLE(
        ROW(
            "Score", "Post-Sales Support Success Predictions",
            "BoostExpo", MAX(metadata_ai_scores[boost_expo]),
            "Factor1", [meas.ai_scores_post_sales_support_factor1_value],
            "Factor2", [meas.ai_scores_post_sales_support_factor2_value],
            "DirectScore", [meas.ai_scores_pred_post_sales_support],
            "ReadinessScore", [meas.readiness_ai_score]
        ),
        metadata_ai_scores[score_name] = "Post-Sales Support Success Predictions"
    )
)
"@

try {
    $rows = New-Object System.Collections.Generic.List[object]
    Invoke-Dax -DatasetName 'Dataset - Azure Data Lake - Sales Performance' -ModelLabel 'Utility' -QueryText $utilityQuery | ForEach-Object { $rows.Add($_) | Out-Null }
    Invoke-Dax -DatasetName 'Dataset - Azure Data Lake - Automatic Data Enhancement' -ModelLabel 'ADE' -QueryText $adeQuery | ForEach-Object { $rows.Add($_) | Out-Null }
    $rows | Export-Csv -Path $outFile -NoTypeInformation
}
catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
