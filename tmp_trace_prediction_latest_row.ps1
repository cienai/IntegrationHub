$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$outFile = Join-Path $root 'tmp_trace_prediction_latest_row.csv'
$errFile = Join-Path $root 'tmp_trace_prediction_latest_row.err.txt'

Remove-Item $outFile, $errFile -ErrorAction SilentlyContinue

$adomdPath = 'C:\Program Files\DAX Studio\bin\Microsoft.AnalysisServices.AdomdClient.dll'
[System.Reflection.Assembly]::LoadFrom($adomdPath) | Out-Null

$token = (Get-Content $tokFile -Raw).Trim()
$expires = [DateTimeOffset]::UtcNow.AddMinutes(30)
$accessToken = New-Object Microsoft.AnalysisServices.AdomdClient.AccessToken($token, $expires, $null)

function Invoke-Dax {
    param(
        [string]$DatasetName,
        [string]$ModelLabel
    )

    $query = @"
EVALUATE
TOPN(
    1,
    SELECTCOLUMNS(
        companies_history,
        "ProcessedAsOf", companies_history[_sys_processed_as_of],
        "NewLogoAUC", companies_history[di_pred_new_logo_auc],
        "NewLogoR2", companies_history[di_pred_new_logo_r2],
        "PostSalesAUC", companies_history[di_pred_post_sales_auc],
        "PostSalesR2", companies_history[di_pred_post_sales_r2]
    ),
    [ProcessedAsOf], DESC
)
"@

    $conn = New-Object Microsoft.AnalysisServices.AdomdClient.AdomdConnection
    $conn.ConnectionString = "Data Source=powerbi://api.powerbi.com/v1.0/myorg/Dev;Initial Catalog=$DatasetName;"
    $conn.AccessToken = $accessToken
    $conn.Open()

    try {
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = $query
        $reader = $cmd.ExecuteReader()
        $rows = New-Object System.Collections.Generic.List[object]
        while ($reader.Read()) {
            $rows.Add([PSCustomObject]@{
                Model = $ModelLabel
                ProcessedAsOf = [string]$reader.GetValue(0)
                NewLogoAUC = [string]$reader.GetValue(1)
                NewLogoR2 = [string]$reader.GetValue(2)
                PostSalesAUC = [string]$reader.GetValue(3)
                PostSalesR2 = [string]$reader.GetValue(4)
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
    $rows = New-Object System.Collections.Generic.List[object]
    Invoke-Dax -DatasetName 'Dataset - Azure Data Lake - Sales Performance' -ModelLabel 'Utility' | ForEach-Object { $rows.Add($_) | Out-Null }
    Invoke-Dax -DatasetName 'Dataset - Azure Data Lake - Automatic Data Enhancement' -ModelLabel 'ADE' | ForEach-Object { $rows.Add($_) | Out-Null }
    $rows | Export-Csv -Path $outFile -NoTypeInformation
}
catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
