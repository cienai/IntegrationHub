$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$outFile = Join-Path $root 'tmp_live_readiness_2024.csv'
$errFile = Join-Path $root 'tmp_live_readiness_2024.err.txt'

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
    ROW("RowLabel","Utility Insight Readiness","MeasurePath","metadata_ai_scores[meas.average_ai_score]","Value",CALCULATE([meas.average_ai_score], __DATE_FILTER)),
    ROW("RowLabel","Utility Segmentation & SAM","MeasurePath","metadata_ai_scores[meas.average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Segmentation and SAM Analysis']","Value",CALCULATE([meas.average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Segmentation and SAM Analysis")),
    ROW("RowLabel","Utility Product Mix","MeasurePath","metadata_ai_scores[meas.average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Product Analysis']","Value",CALCULATE([meas.average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Product Analysis")),
    ROW("RowLabel","Utility Pipeline","MeasurePath","metadata_ai_scores[meas.average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Opportunity and Pipeline Analysis']","Value",CALCULATE([meas.average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Opportunity and Pipeline Analysis")),
    ROW("RowLabel","Utility Rep Performance","MeasurePath","metadata_ai_scores[meas.average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Rep Performance Analysis']","Value",CALCULATE([meas.average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Rep Performance Analysis")),
    ROW("RowLabel","Utility Rep Skills & Behaviors","MeasurePath","metadata_ai_scores[meas.average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Rep Skills and Behaviors Analysis']","Value",CALCULATE([meas.average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Rep Skills and Behaviors Analysis")),
    ROW("RowLabel","Utility Calibration","MeasurePath","metadata_ai_scores[meas.average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Calibration Analysis']","Value",CALCULATE([meas.average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Calibration Analysis"))
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
    ROW("RowLabel","ADE Insight Readiness","MeasurePath","metadata_ai_scores[meas.readiness_average_ai_score]","Value",CALCULATE([meas.readiness_average_ai_score], __DATE_FILTER)),
    ROW("RowLabel","ADE Summary Insights Readiness","MeasurePath","metadata_ai_scores[meas.readiness_average_ai_score]","Value",CALCULATE([meas.readiness_average_ai_score], __DATE_FILTER)),
    ROW("RowLabel","ADE Segmentation & SAM","MeasurePath","metadata_ai_scores[meas.readiness_average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Segmentation and SAM Analysis']","Value",CALCULATE([meas.readiness_average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Segmentation and SAM Analysis")),
    ROW("RowLabel","ADE Product Mix","MeasurePath","metadata_ai_scores[meas.readiness_average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Product Analysis']","Value",CALCULATE([meas.readiness_average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Product Analysis")),
    ROW("RowLabel","ADE Pipeline","MeasurePath","metadata_ai_scores[meas.readiness_average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Opportunity and Pipeline Analysis']","Value",CALCULATE([meas.readiness_average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Opportunity and Pipeline Analysis")),
    ROW("RowLabel","ADE Rep Performance","MeasurePath","metadata_ai_scores[meas.readiness_average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Rep Performance Analysis']","Value",CALCULATE([meas.readiness_average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Rep Performance Analysis")),
    ROW("RowLabel","ADE Rep Skills & Behaviors","MeasurePath","metadata_ai_scores[meas.readiness_average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Rep Skills and Behaviors Analysis']","Value",CALCULATE([meas.readiness_average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Rep Skills and Behaviors Analysis")),
    ROW("RowLabel","ADE Calibration","MeasurePath","metadata_ai_scores[meas.readiness_average_ai_score] + metadata_ai_scores_analysis_categories[category_name='Calibration Analysis']","Value",CALCULATE([meas.readiness_average_ai_score], __DATE_FILTER, metadata_ai_scores_analysis_categories[category_name] = "Calibration Analysis"))
)
"@

try {
    $rows = New-Object System.Collections.Generic.List[object]
    Invoke-Dax -DatasetName 'Dataset - Azure Data Lake - Sales Performance' -QueryText $utilityQuery | ForEach-Object { $rows.Add($_) | Out-Null }
    Invoke-Dax -DatasetName 'Dataset - Azure Data Lake - Automatic Data Enhancement' -QueryText $adeQuery | ForEach-Object { $rows.Add($_) | Out-Null }
    $rows | Export-Csv -Path $outFile -NoTypeInformation
} catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
