$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$outFile = Join-Path $root 'tmp_validate_five_scores.csv'
$errFile = Join-Path $root 'tmp_validate_five_scores.err.txt'

Remove-Item $outFile -ErrorAction SilentlyContinue
Remove-Item $errFile -ErrorAction SilentlyContinue

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
            $rows.Add([PSCustomObject]@{
                Model = $ModelLabel
                Score = [string]$reader.GetValue(0)
                Value = [string]$reader.GetValue(1)
            }) | Out-Null
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
    ROW("Score", "Adjusted Duration", "Value", CALCULATE([meas.ai_score], metadata_ai_scores[score_name] = "Adjusted Duration")),
    ROW("Score", "New Logo Selling Success Predictions", "Value", CALCULATE([meas.ai_score], metadata_ai_scores[score_name] = "New Logo Selling Success Predictions")),
    ROW("Score", "Post-Sales Support Success Predictions", "Value", CALCULATE([meas.ai_score], metadata_ai_scores[score_name] = "Post-Sales Support Success Predictions")),
    ROW("Score", "SSR Industry Consolidation", "Value", CALCULATE([meas.ai_score], metadata_ai_scores[score_name] = "SSR Industry Consolidation")),
    ROW("Score", "SSR Lead Source Consolidation", "Value", CALCULATE([meas.ai_score], metadata_ai_scores[score_name] = "SSR Lead Source Consolidation"))
)
"@

$adeQuery = @"
EVALUATE
UNION(
    ROW("Score", "Adjusted Duration", "Value", CALCULATE([meas.readiness_ai_score], metadata_ai_scores[score_name] = "Adjusted Duration")),
    ROW("Score", "New Logo Selling Success Predictions", "Value", CALCULATE([meas.readiness_ai_score], metadata_ai_scores[score_name] = "New Logo Selling Success Predictions")),
    ROW("Score", "Post-Sales Support Success Predictions", "Value", CALCULATE([meas.readiness_ai_score], metadata_ai_scores[score_name] = "Post-Sales Support Success Predictions")),
    ROW("Score", "SSR Industry Consolidation", "Value", CALCULATE([meas.readiness_ai_score], metadata_ai_scores[score_name] = "SSR Industry Consolidation")),
    ROW("Score", "SSR Lead Source Consolidation", "Value", CALCULATE([meas.readiness_ai_score], metadata_ai_scores[score_name] = "SSR Lead Source Consolidation"))
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
