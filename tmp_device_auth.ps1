$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$msgFile = Join-Path $root 'tmp_device_code_message.txt'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$errFile = Join-Path $root 'tmp_device_code_error.txt'

Remove-Item $msgFile, $tokFile, $errFile -ErrorAction SilentlyContinue

$msalPath = 'C:\Program Files\DAX Studio\bin\Microsoft.Identity.Client.dll'
[System.Reflection.Assembly]::LoadFrom($msalPath) | Out-Null

$typeSource = @"
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
}
catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
