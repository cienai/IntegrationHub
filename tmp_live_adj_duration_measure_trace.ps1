$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$resultFile = Join-Path $root 'tmp_live_adj_duration_measure_trace.csv'
$errFile = Join-Path $root 'tmp_device_code_error.txt'

Remove-Item $resultFile -ErrorAction SilentlyContinue

$adomdPath = 'C:\Program Files\DAX Studio\bin\Microsoft.AnalysisServices.AdomdClient.dll'
[System.Reflection.Assembly]::LoadFrom($adomdPath) | Out-Null

if (-not (Test-Path $tokFile)) {
    throw "Access token file not found: $tokFile"
}

$token = (Get-Content $tokFile -Raw).Trim()
$expires = [DateTimeOffset]::UtcNow.AddMinutes(30)
$accessToken = New-Object Microsoft.AnalysisServices.AdomdClient.AccessToken($token, $expires, $null)

$queryUtility = @"
EVALUATE
CALCULATETABLE(
    ROW(
        "Score Name", MAX(metadata_ai_scores[score_name]),
        "Boost Expo", MAX(metadata_ai_scores[boost_expo]),
        "Adj Factor1", [meas.ai_scores_adj_duration_factor1_value],
        "Adj Measure", [meas.ai_scores_adj_duration],
        "AI Score", [meas.ai_score],
        "Factor1 Helper", [meas.ai_scores_factor1_value],
        "Score Measure Name", [meas.ai_score_measure_name]
    ),
    metadata_ai_scores[score_name] = "Adjusted Duration"
)
"@

$queryAde = @"
EVALUATE
CALCULATETABLE(
    ROW(
        "Score Name", MAX(metadata_ai_scores[score_name]),
        "Boost Expo", MAX(metadata_ai_scores[boost_expo]),
        "Adj Factor1", [meas.ai_scores_adj_duration_factor1_value],
        "Adj Measure", [meas.ai_scores_adj_duration],
        "AI Score", [meas.ai_score],
        "Readiness AI Score", [meas.readiness_ai_score],
        "Factor1 Helper", [meas.ai_scores_factor1_value],
        "Score Measure Name", [meas.ai_score_measure_name]
    ),
    metadata_ai_scores[score_name] = "Adjusted Duration"
)
"@

function Invoke-Trace {
    param(
        [string]$WorkspaceName,
        [string]$DatasetName,
        [string]$ModelLabel,
        [string]$QueryText,
        [bool]$HasReadiness
    )

    $conn = New-Object Microsoft.AnalysisServices.AdomdClient.AdomdConnection
    $conn.ConnectionString = "Data Source=powerbi://api.powerbi.com/v1.0/myorg/$WorkspaceName;Initial Catalog=$DatasetName;"
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
                ScoreName = [string]$reader.GetValue(0)
                BoostExpo = [string]$reader.GetValue(1)
                AdjFactor1 = [string]$reader.GetValue(2)
                AdjMeasure = [string]$reader.GetValue(3)
                AIScore = [string]$reader.GetValue(4)
                ReadinessAIScore = if ($HasReadiness) { [string]$reader.GetValue(5) } else { '' }
                Factor1Helper = if ($HasReadiness) { [string]$reader.GetValue(6) } else { [string]$reader.GetValue(5) }
                ScoreMeasureName = if ($HasReadiness) { [string]$reader.GetValue(7) } else { [string]$reader.GetValue(6) }
            }) | Out-Null
        }
        $reader.Close()
        return $rows
    }
    finally {
        $conn.Close()
    }
}

try {
    $allRows = New-Object System.Collections.Generic.List[object]
    Invoke-Trace -WorkspaceName 'Dev' -DatasetName 'Dataset - Azure Data Lake - Sales Performance' -ModelLabel 'Utility' -QueryText $queryUtility -HasReadiness $false | ForEach-Object { $allRows.Add($_) | Out-Null }
    Invoke-Trace -WorkspaceName 'Dev' -DatasetName 'Dataset - Azure Data Lake - Automatic Data Enhancement' -ModelLabel 'ADE' -QueryText $queryAde -HasReadiness $true | ForEach-Object { $allRows.Add($_) | Out-Null }
    $allRows | Export-Csv -Path $resultFile -NoTypeInformation
}
catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
