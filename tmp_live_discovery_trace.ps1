$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$resultFile = Join-Path $root 'tmp_live_discovery_trace.csv'
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

$dateFilter = @"
KEEPFILTERS(
    FILTER(
        ALL('cal_end_dates'[date]),
        'cal_end_dates'[date] >= DATE(2025, 1, 1) &&
        'cal_end_dates'[date] <= DATE(2025, 2, 24)
    )
)
"@

$queryUtility = @"
EVALUATE
CALCULATETABLE(
    ROW(
        "Model", "Utility",
        "Score Name", MAX(metadata_ai_scores[score_name]),
        "Boost Expo", MAX(metadata_ai_scores[boost_expo]),
        "Raw Factor", [meas.ai_scores_ci_discovery_skill_factor1_value],
        "Direct Score", [meas.ai_scores_ci_discovery_skill],
        "Wrapped Score", [meas.ai_score],
        "Factor1 Helper", [meas.ai_scores_factor1_value]
    ),
    metadata_ai_scores[score_name] = "Discovery Skill",
    __DATE_FILTER__
)
"@

$queryAde = @"
EVALUATE
CALCULATETABLE(
    ROW(
        "Model", "ADE",
        "Score Name", MAX(metadata_ai_scores[score_name]),
        "Boost Expo", MAX(metadata_ai_scores[boost_expo]),
        "Raw Factor", [meas.ai_scores_ci_discovery_skill_factor1_value],
        "Direct Score", [meas.ai_scores_ci_discovery_skill],
        "Wrapped Score", [meas.readiness_ai_score],
        "AI Score", [meas.ai_score],
        "Factor1 Helper", [meas.ai_scores_factor1_value]
    ),
    metadata_ai_scores[score_name] = "Discovery Skill",
    __DATE_FILTER__
)
"@

$queryUtility = $queryUtility.Replace('__DATE_FILTER__', $dateFilter)
$queryAde = $queryAde.Replace('__DATE_FILTER__', $dateFilter)

function Invoke-Trace {
    param(
        [string]$WorkspaceName,
        [string]$DatasetName,
        [string]$QueryText
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
            $obj = [ordered]@{}
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

try {
    $allRows = New-Object System.Collections.Generic.List[object]
    Invoke-Trace -WorkspaceName 'Dev' -DatasetName 'Dataset - Azure Data Lake - Sales Performance' -QueryText $queryUtility | ForEach-Object { $allRows.Add($_) | Out-Null }
    Invoke-Trace -WorkspaceName 'Dev' -DatasetName 'Dataset - Azure Data Lake - Automatic Data Enhancement' -QueryText $queryAde | ForEach-Object { $allRows.Add($_) | Out-Null }
    $allRows | Export-Csv -Path $resultFile -NoTypeInformation
}
catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
