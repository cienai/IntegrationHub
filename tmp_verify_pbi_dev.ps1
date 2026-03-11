$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$msgFile = Join-Path $root 'tmp_device_code_message.txt'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$errFile = Join-Path $root 'tmp_device_code_error.txt'
$resultFile = Join-Path $root 'tmp_live_query_result.txt'

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

try {
    $method = [DeviceCodeBridge].GetMethod('Handle')
    $callback = [System.Delegate]::CreateDelegate([System.Func[Microsoft.Identity.Client.DeviceCodeResult,System.Threading.Tasks.Task]], $method)
    $auth = $app.AcquireTokenWithDeviceCode($scopes, $callback).ExecuteAsync().GetAwaiter().GetResult()
    Set-Content -Path $tokFile -Value $auth.AccessToken

    $conn = New-Object Microsoft.AnalysisServices.AdomdClient.AdomdConnection
    $conn.ConnectionString = 'Data Source=powerbi://api.powerbi.com/v1.0/myorg/Dev;Initial Catalog=Dataset - Azure Data Lake - Automatic Data Enhancement;'
    $conn.AccessToken = New-Object Microsoft.AnalysisServices.AdomdClient.AccessToken($auth.AccessToken, $auth.ExpiresOn, $null)
    $conn.Open()

    $cmd = $conn.CreateCommand()
    $cmd.CommandText = @"
EVALUATE
ROW(
    "ScoreRows", COUNTROWS('metadata_ai_scores'),
    "RepOrgScore", [meas.ai_scores_rep_org_calibration]
)
"@
    $reader = $cmd.ExecuteReader()
    $rows = New-Object System.Collections.Generic.List[string]
    while ($reader.Read()) {
        $vals = @()
        for ($i = 0; $i -lt $reader.FieldCount; $i++) {
            $vals += ('{0}={1}' -f $reader.GetName($i), $reader.GetValue($i))
        }
        $rows.Add(($vals -join '; '))
    }
    $reader.Close()
    $conn.Close()

    Set-Content -Path $resultFile -Value ($rows -join [Environment]::NewLine)
}
catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
