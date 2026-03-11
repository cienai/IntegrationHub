$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$outFile = Join-Path $root 'tmp_live_rep_skills_components_2024.csv'
$errFile = Join-Path $root 'tmp_live_rep_skills_components_2024.err.txt'

Remove-Item $outFile, $errFile -ErrorAction SilentlyContinue

$adomdPath = 'C:\Program Files\DAX Studio\bin\Microsoft.AnalysisServices.AdomdClient.dll'
[System.Reflection.Assembly]::LoadFrom($adomdPath) | Out-Null

$token = (Get-Content $tokFile -Raw).Trim()
$expires = [DateTimeOffset]::UtcNow.AddMinutes(30)
$accessToken = New-Object Microsoft.AnalysisServices.AdomdClient.AccessToken($token, $expires, $null)

function Invoke-Dax {
    param(
        [string]$DatasetName,
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
            $obj = [ordered]@{}
            for ($i = 0; $i -lt $reader.FieldCount; $i++) {
                $obj[$reader.GetName($i)] = [string]$reader.GetValue($i)
            }
            $rows.Add([PSCustomObject]$obj) | Out-Null
        }
        $reader.Close()
        return $rows
    } finally { $conn.Close() }
}

$rows = @(
    'Closing Ability',
    'Discovery Skill',
    'Engagement Ability',
    'Work Effort',
    'Time Allocation',
    'Activity Capture Level',
    'Deal Maximizing',
    'Prospecting Success Predictions',
    'Existing Customer Selling Success Predictions',
    'New Logo Selling Success Predictions',
    'Post-Sales Support Success Predictions',
    'Adjusted Duration'
)

$utilityParts = @()
$adeParts = @()
foreach ($r in $rows) {
    $utilityParts += "ROW(""RowLabel"", ""$r"", ""Value"", CALCULATE([meas.ai_score], __DATE_FILTER, metadata_ai_scores[score_name] = ""$r""))"
    $adeParts += "ROW(""RowLabel"", ""$r"", ""Value"", CALCULATE([meas.readiness_ai_score], __DATE_FILTER, metadata_ai_scores[score_name] = ""$r""))"
}

$utilityQuery = @"
DEFINE
    VAR __DATE_FILTER =
        FILTER(
            ALL('cal_end_dates'[date]),
            'cal_end_dates'[date] >= DATE(2024, 1, 1) &&
            'cal_end_dates'[date] <= DATE(2024, 12, 31)
        )
EVALUATE
UNION(
$(($utilityParts -join ",`n"))
)
"@

$adeQuery = @"
DEFINE
    VAR __DATE_FILTER =
        FILTER(
            ALL('cal_end_dates'[date]),
            'cal_end_dates'[date] >= DATE(2024, 1, 1) &&
            'cal_end_dates'[date] <= DATE(2024, 12, 31)
        )
EVALUATE
UNION(
$(($adeParts -join ",`n"))
)
"@

try {
    $allRows = New-Object System.Collections.Generic.List[object]
    Invoke-Dax -DatasetName 'Dataset - Azure Data Lake - Sales Performance' -QueryText $utilityQuery | ForEach-Object {
        $allRows.Add([PSCustomObject]@{ Model='Utility'; RowLabel=$_.'[RowLabel]'; Value=$_.'[Value]' }) | Out-Null
    }
    Invoke-Dax -DatasetName 'Dataset - Azure Data Lake - Automatic Data Enhancement' -QueryText $adeQuery | ForEach-Object {
        $allRows.Add([PSCustomObject]@{ Model='ADE'; RowLabel=$_.'[RowLabel]'; Value=$_.'[Value]' }) | Out-Null
    }
    $allRows | Export-Csv -Path $outFile -NoTypeInformation
} catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
