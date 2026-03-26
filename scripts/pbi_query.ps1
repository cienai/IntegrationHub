param(
    [string]$DatasetId,
    [string]$Dax,
    [string]$DaxFile,
    [string]$EnvFile = ".env.pbi.local",
    [switch]$ListDatasets,
    [string]$OutFile,
    [ValidateSet("Auto", "ServicePrincipal", "Interactive", "DeviceCode")]
    [string]$AuthMode = "Auto"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Load-EnvFile {
    param([Parameter(Mandatory = $true)][string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "Env file not found: $Path"
    }

    Get-Content -LiteralPath $Path | ForEach-Object {
        $line = $_.Trim()
        if ([string]::IsNullOrWhiteSpace($line)) { return }
        if ($line.StartsWith("#")) { return }
        $eq = $line.IndexOf("=")
        if ($eq -lt 1) { return }

        $key = $line.Substring(0, $eq).Trim()
        $val = $line.Substring($eq + 1).Trim()
        if (
            ($val.StartsWith('"') -and $val.EndsWith('"')) -or
            ($val.StartsWith("'") -and $val.EndsWith("'"))
        ) {
            $val = $val.Substring(1, $val.Length - 2)
        }
        [System.Environment]::SetEnvironmentVariable($key, $val, "Process")
    }
}

function Get-RequiredEnv {
    param([Parameter(Mandatory = $true)][string]$Name)
    $value = [System.Environment]::GetEnvironmentVariable($Name, "Process")
    if ([string]::IsNullOrWhiteSpace($value)) {
        $value = [System.Environment]::GetEnvironmentVariable($Name, "User")
    }
    if ([string]::IsNullOrWhiteSpace($value)) {
        throw "Missing required setting: $Name"
    }
    return $value
}

function Get-PbiToken {
    param(
        [Parameter(Mandatory = $true)][string]$TenantId,
        [Parameter(Mandatory = $true)][string]$ClientId,
        [Parameter(Mandatory = $true)][string]$ClientSecret
    )

    $tokenUrl = "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token"
    $body = @{
        client_id     = $ClientId
        client_secret = $ClientSecret
        scope         = "https://analysis.windows.net/powerbi/api/.default"
        grant_type    = "client_credentials"
    }

    $resp = Invoke-RestMethod -Method Post -Uri $tokenUrl -Body $body -ContentType "application/x-www-form-urlencoded"
    return $resp.access_token
}

function Get-PbiTokenDeviceCode {
    param(
        [Parameter(Mandatory = $true)][string]$TenantId,
        [Parameter(Mandatory = $true)][string]$ClientId
    )

    $deviceUrl = "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/devicecode"
    $scope = "https://analysis.windows.net/powerbi/api/.default offline_access openid profile"
    $deviceResp = Invoke-RestMethod -Method Post -Uri $deviceUrl -Body @{
        client_id = $ClientId
        scope = $scope
    } -ContentType "application/x-www-form-urlencoded"

    Write-Output ""
    Write-Output "Sign in required."
    Write-Output "1) Open: $($deviceResp.verification_uri)"
    Write-Output "2) Enter code: $($deviceResp.user_code)"
    Write-Output ""

    $tokenUrl = "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token"
    $interval = [int]$deviceResp.interval
    if ($interval -lt 1) { $interval = 5 }
    $deadline = (Get-Date).AddSeconds([int]$deviceResp.expires_in)

    while ((Get-Date) -lt $deadline) {
        Start-Sleep -Seconds $interval
        try {
            $tokenResp = Invoke-RestMethod -Method Post -Uri $tokenUrl -Body @{
                grant_type = "urn:ietf:params:oauth:grant-type:device_code"
                client_id = $ClientId
                device_code = $deviceResp.device_code
            } -ContentType "application/x-www-form-urlencoded" -ErrorAction Stop
            if ($tokenResp.access_token) {
                return $tokenResp.access_token
            }
        } catch {
            $errText = ($_ | Out-String)
            if ($errText -match "authorization_pending" -or $errText -match "slow_down") {
                continue
            }
            throw
        }
    }

    throw "Device code login timed out."
}

function Get-TokenFromPowerBIModule {
    if (-not (Get-Command Connect-PowerBIServiceAccount -ErrorAction SilentlyContinue)) {
        throw "Power BI module not available. Install with: Install-Module MicrosoftPowerBIMgmt -Scope CurrentUser"
    }
    if (-not (Get-Command Get-PowerBIAccessToken -ErrorAction SilentlyContinue)) {
        throw "Get-PowerBIAccessToken not found. Install/update MicrosoftPowerBIMgmt module."
    }

    Connect-PowerBIServiceAccount | Out-Null
    $tokenObj = Get-PowerBIAccessToken
    if ($null -eq $tokenObj) {
        throw "Interactive login succeeded but no access token was returned."
    }

    # Handle common return shapes across module versions
    if ($tokenObj.PSObject.Properties.Name -contains "AuthorizationHeader") {
        $hdr = [string]$tokenObj.AuthorizationHeader
        if ($hdr -match "^Bearer\s+(.+)$") { return $Matches[1] }
    }
    if ($tokenObj.PSObject.Properties.Name -contains "AccessToken") {
        return [string]$tokenObj.AccessToken
    }
    if ($tokenObj -is [string]) {
        if ($tokenObj -match "^Bearer\s+(.+)$") { return $Matches[1] }
        return $tokenObj
    }

    throw "Could not parse access token returned by Get-PowerBIAccessToken."
}

function Get-AuthHeaders {
    param([Parameter(Mandatory = $true)][string]$AccessToken)
    return @{
        Authorization = "Bearer $AccessToken"
        "Content-Type" = "application/json"
    }
}

if (Test-Path -LiteralPath $EnvFile) {
    Load-EnvFile -Path $EnvFile
}

$groupId = Get-RequiredEnv -Name "PBI_GROUP_ID"

$token = $null
switch ($AuthMode) {
    "ServicePrincipal" {
        $tenantId = Get-RequiredEnv -Name "PBI_TENANT_ID"
        $clientId = Get-RequiredEnv -Name "PBI_CLIENT_ID"
        $clientSecret = Get-RequiredEnv -Name "PBI_CLIENT_SECRET"
        $token = Get-PbiToken -TenantId $tenantId -ClientId $clientId -ClientSecret $clientSecret
    }
    "Interactive" {
        $token = Get-TokenFromPowerBIModule
    }
    "DeviceCode" {
        $tenantId = Get-RequiredEnv -Name "PBI_TENANT_ID"
        $clientId = Get-RequiredEnv -Name "PBI_CLIENT_ID"
        $token = Get-PbiTokenDeviceCode -TenantId $tenantId -ClientId $clientId
    }
    default { # Auto
        $tenantId = [System.Environment]::GetEnvironmentVariable("PBI_TENANT_ID", "Process")
        if ([string]::IsNullOrWhiteSpace($tenantId)) { $tenantId = [System.Environment]::GetEnvironmentVariable("PBI_TENANT_ID", "User") }
        $clientId = [System.Environment]::GetEnvironmentVariable("PBI_CLIENT_ID", "Process")
        if ([string]::IsNullOrWhiteSpace($clientId)) { $clientId = [System.Environment]::GetEnvironmentVariable("PBI_CLIENT_ID", "User") }
        $clientSecret = [System.Environment]::GetEnvironmentVariable("PBI_CLIENT_SECRET", "Process")
        if ([string]::IsNullOrWhiteSpace($clientSecret)) { $clientSecret = [System.Environment]::GetEnvironmentVariable("PBI_CLIENT_SECRET", "User") }

        if (
            -not [string]::IsNullOrWhiteSpace($tenantId) -and
            -not [string]::IsNullOrWhiteSpace($clientId) -and
            -not [string]::IsNullOrWhiteSpace($clientSecret)
        ) {
            $token = Get-PbiToken -TenantId $tenantId -ClientId $clientId -ClientSecret $clientSecret
        } else {
            if (
                -not [string]::IsNullOrWhiteSpace($tenantId) -and
                -not [string]::IsNullOrWhiteSpace($clientId)
            ) {
                $token = Get-PbiTokenDeviceCode -TenantId $tenantId -ClientId $clientId
            } else {
                $token = Get-TokenFromPowerBIModule
            }
        }
    }
}

$headers = Get-AuthHeaders -AccessToken $token

if ($ListDatasets) {
    $url = "https://api.powerbi.com/v1.0/myorg/groups/$groupId/datasets"
    $datasets = Invoke-RestMethod -Method Get -Uri $url -Headers $headers
    $datasets.value | Select-Object id, name | Format-Table -AutoSize
    exit 0
}

if ([string]::IsNullOrWhiteSpace($DatasetId)) {
    throw "DatasetId is required unless -ListDatasets is used."
}

if (-not [string]::IsNullOrWhiteSpace($Dax) -and -not [string]::IsNullOrWhiteSpace($DaxFile)) {
    throw "Use only one of -Dax or -DaxFile."
}

if ([string]::IsNullOrWhiteSpace($Dax) -and [string]::IsNullOrWhiteSpace($DaxFile)) {
    throw "Provide -Dax or -DaxFile."
}

if (-not [string]::IsNullOrWhiteSpace($DaxFile)) {
    if (-not (Test-Path -LiteralPath $DaxFile)) {
        throw "DAX file not found: $DaxFile"
    }
    $Dax = Get-Content -LiteralPath $DaxFile -Raw
}

$queryUrl = "https://api.powerbi.com/v1.0/myorg/groups/$groupId/datasets/$DatasetId/executeQueries"
$payload = @{
    queries = @(
        @{
            query = $Dax
        }
    )
    serializerSettings = @{
        includeNulls = $true
    }
} | ConvertTo-Json -Depth 10

$result = Invoke-RestMethod -Method Post -Uri $queryUrl -Headers $headers -Body $payload

if (-not [string]::IsNullOrWhiteSpace($OutFile)) {
    $result | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $OutFile -Encoding UTF8
    Write-Output "Saved query response to: $OutFile"
    exit 0
}

$rows = $result.results[0].tables[0].rows
if ($null -eq $rows -or $rows.Count -eq 0) {
    Write-Output "Query completed. No rows returned."
    exit 0
}

$rows | Format-Table -AutoSize
