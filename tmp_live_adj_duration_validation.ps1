$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$msgFile = Join-Path $root 'tmp_device_code_message.txt'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$errFile = Join-Path $root 'tmp_device_code_error.txt'
$resultFile = Join-Path $root 'tmp_live_adj_duration_validation.csv'

Remove-Item $msgFile, $tokFile, $errFile, $resultFile -ErrorAction SilentlyContinue

$msalPath = 'C:\Program Files\DAX Studio\bin\Microsoft.Identity.Client.dll'
$adomdPath = 'C:\Program Files\DAX Studio\bin\Microsoft.AnalysisServices.AdomdClient.dll'

[System.Reflection.Assembly]::LoadFrom($msalPath) | Out-Null
[System.Reflection.Assembly]::LoadFrom($adomdPath) | Out-Null

$typeSource = @"
using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.Identity.Client;

public static class DeviceCodeBridge
{
    public static string MessageFile;

    public static Task Handle(DeviceCodeResult result)
    {
        File.WriteAllText(MessageFile, result.Message);
        return Task.CompletedTask;
    }
}
"@

Add-Type -TypeDefinition $typeSource -ReferencedAssemblies $msalPath
[DeviceCodeBridge]::MessageFile = $msgFile

$clientId = '04f0c124-f2bc-4f59-8241-bf6df9866bbd'
$scopes = New-Object 'System.Collections.Generic.List[string]'
$scopes.Add('https://analysis.windows.net/powerbi/api/.default') | Out-Null

$app = [Microsoft.Identity.Client.PublicClientApplicationBuilder]::Create($clientId).
    WithAuthority([Microsoft.Identity.Client.AzureCloudInstance]::AzurePublic, 'organizations').
    WithDefaultRedirectUri().
    Build()

$queryTemplate = @"
EVALUATE
VAR FilteredRows =
    SELECTCOLUMNS(
        CALCULATETABLE(
            ssr_history,
            ssr_history[step_name] IN {
                "Prospecting",
                "New Logo Selling",
                "Post-Sales Support",
                "Existing Customer Selling"
            }
        ),
        "Rule Value",
            VAR RuleText = "" & ssr_history[stkhlds_all_adj_dur_rule]
            RETURN
                SWITCH(
                    RuleText,
                    "133001", "133001",
                    "133002", "133002",
                    "133003", "133003",
                    "133004", "133004",
                    "blank / other"
                )
    )
VAR TotalRows = COUNTROWS(FilteredRows)
VAR WeightedAverage = [meas.ai_scores_adj_duration_factor1_value]
VAR Buckets =
    DATATABLE(
        "Rule Value", STRING,
        {
            {"133001"},
            {"133002"},
            {"133003"},
            {"133004"},
            {"blank / other"}
        }
    )
VAR Counts =
    GROUPBY(
        FilteredRows,
        [Rule Value],
        "Count", COUNTX(CURRENTGROUP(), 1)
    )
VAR Joined = NATURALLEFTOUTERJOIN(Buckets, Counts)
RETURN
    SELECTCOLUMNS(
        ADDCOLUMNS(
            Joined,
            "Model", "__MODEL__",
            "Filtered Rows", TotalRows,
            "CountSafe", COALESCE([Count], 0),
            "Percent", DIVIDE(COALESCE([Count], 0), TotalRows),
            "Weighted Average", WeightedAverage
        ),
        "Model", [Model],
        "Filtered Rows", [Filtered Rows],
        "Rule Value", [Rule Value],
        "Count", [CountSafe],
        "Percent", [Percent],
        "Weighted Average", [Weighted Average]
    )
ORDER BY [Rule Value]
"@

function Invoke-ModelQuery {
    param(
        [string]$WorkspaceName,
        [string]$DatasetName,
        [string]$ModelLabel,
        [Microsoft.AnalysisServices.AdomdClient.AccessToken]$AccessToken
    )

    $query = $queryTemplate.Replace('__MODEL__', $ModelLabel.Replace('"', '""'))
    $conn = New-Object Microsoft.AnalysisServices.AdomdClient.AdomdConnection
    $conn.ConnectionString = "Data Source=powerbi://api.powerbi.com/v1.0/myorg/$WorkspaceName;Initial Catalog=$DatasetName;"
    $conn.AccessToken = $AccessToken
    $conn.Open()

    try {
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = $query
        $reader = $cmd.ExecuteReader()
        $rows = New-Object System.Collections.Generic.List[object]

        while ($reader.Read()) {
            $row = [PSCustomObject]@{
                Model = [string]$reader.GetValue(0)
                FilteredRows = [string]$reader.GetValue(1)
                RuleValue = [string]$reader.GetValue(2)
                Count = [string]$reader.GetValue(3)
                Percent = [string]$reader.GetValue(4)
                WeightedAverage = [string]$reader.GetValue(5)
            }
            $rows.Add($row) | Out-Null
        }

        $reader.Close()
        return $rows
    }
    finally {
        $conn.Close()
    }
}

try {
    $method = [DeviceCodeBridge].GetMethod('Handle')
    $callback = [System.Delegate]::CreateDelegate([System.Func[Microsoft.Identity.Client.DeviceCodeResult,System.Threading.Tasks.Task]], $method)
    $auth = $app.AcquireTokenWithDeviceCode($scopes, $callback).ExecuteAsync().GetAwaiter().GetResult()
    Set-Content -Path $tokFile -Value $auth.AccessToken

    $accessToken = New-Object Microsoft.AnalysisServices.AdomdClient.AccessToken($auth.AccessToken, $auth.ExpiresOn, $null)
    $allRows = New-Object System.Collections.Generic.List[object]

    Invoke-ModelQuery -WorkspaceName 'Dev' -DatasetName 'Dataset - Azure Data Lake - Sales Performance' -ModelLabel 'Utility' -AccessToken $accessToken | ForEach-Object { $allRows.Add($_) | Out-Null }
    Invoke-ModelQuery -WorkspaceName 'Dev' -DatasetName 'Dataset - Azure Data Lake - Automatic Data Enhancement' -ModelLabel 'ADE' -AccessToken $accessToken | ForEach-Object { $allRows.Add($_) | Out-Null }

    $allRows | Export-Csv -Path $resultFile -NoTypeInformation
}
catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
