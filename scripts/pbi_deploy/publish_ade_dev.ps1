param(
    [string]$ConfigPath = "C:\Users\martin\Desktop\IntegrationHub\scripts\pbi_deploy\publish_ade_dev.config.json",
    [string]$WorkspaceId = "6385a2ee-e799-451e-a0fe-dc12761a2d81",
    [string]$DatasetPath = "C:\Users\martin\Desktop\IntegrationHub\powerbi\Dataset - Azure Data Lake - Automatic Data Enhancement.pbix",
    [string]$ReportPath = "C:\Users\martin\Desktop\IntegrationHub\powerbi\Automatic Data Enhancement Report.pbix",
    [string]$DatasetName = "Dataset - Azure Data Lake - Automatic Data Enhancement",
    [string]$ReportName = "Automatic Data Enhancement Report"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Write-Log {
    param(
        [string]$Message,
        [string]$Color = "White"
    )

    $timestamp = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
    Write-Host "[$timestamp] $Message" -ForegroundColor $Color
}

function Assert-FileExists {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "File not found: $Path"
    }
}

function Get-RequiredValue {
    param(
        [object]$Config,
        [string]$Name,
        [string]$CurrentValue
    )

    $value = $CurrentValue
    if ([string]::IsNullOrWhiteSpace($value) -and $null -ne $Config) {
        $configValue = $Config.$Name
        if ($null -ne $configValue) {
            $value = [string]$configValue
        }
    }
    if ([string]::IsNullOrWhiteSpace($value)) {
        throw "Missing required config value: $Name"
    }

    return $value
}

function Remove-WorkspaceReportByName {
    param(
        [guid]$WorkspaceId,
        [string]$Name
    )

    $report = Get-PowerBIReport -WorkspaceId $WorkspaceId | Where-Object { $_.Name -eq $Name } | Select-Object -First 1
    if ($null -ne $report) {
        Write-Log "Removing report '$Name' ($($report.Id))" "Yellow"
        Invoke-PowerBIRestMethod -Method Delete -Url "https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/reports/$($report.Id)" | Out-Null
    }
}

function Load-Config {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        return $null
    }

    return Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json
}

function Resolve-ConfigOverrides {
    param(
        [object]$Config
    )

    if ($null -eq $Config) {
        return
    }

    if (-not [string]::IsNullOrWhiteSpace($Config.workspaceId)) {
        $script:WorkspaceId = [string]$Config.workspaceId
    }
    if (-not [string]::IsNullOrWhiteSpace($Config.datasetPath)) {
        $script:DatasetPath = [string]$Config.datasetPath
    }
    if (-not [string]::IsNullOrWhiteSpace($Config.reportPath)) {
        $script:ReportPath = [string]$Config.reportPath
    }
    if (-not [string]::IsNullOrWhiteSpace($Config.datasetName)) {
        $script:DatasetName = [string]$Config.datasetName
    }
    if (-not [string]::IsNullOrWhiteSpace($Config.reportName)) {
        $script:ReportName = [string]$Config.reportName
    }
}

if ($null -eq $ConfigPath -or [string]::IsNullOrWhiteSpace($ConfigPath)) {
    throw "ConfigPath cannot be empty."
}

$config = Load-Config -Path $ConfigPath
Resolve-ConfigOverrides -Config $config

Assert-FileExists -Path $DatasetPath
Assert-FileExists -Path $ReportPath

$tenantId = Get-RequiredValue -Config $config -Name "tenantId" -CurrentValue $null
$clientId = Get-RequiredValue -Config $config -Name "clientId" -CurrentValue $null
$clientSecret = Get-RequiredValue -Config $config -Name "clientSecret" -CurrentValue $null

Write-Log "Authenticating service principal" "Green"
$secureSecret = ConvertTo-SecureString $clientSecret -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($clientId, $secureSecret)
Connect-PowerBIServiceAccount -ServicePrincipal -Tenant $tenantId -Credential $credential | Out-Null

$workspace = Get-PowerBIWorkspace -Id $WorkspaceId
Write-Log "Publishing to workspace '$($workspace.Name)' ($WorkspaceId)" "Green"

Write-Log "Importing dataset PBIX '$DatasetName'" "Yellow"
New-PowerBIReport -Path $DatasetPath -Name $DatasetName -WorkspaceId $WorkspaceId -ConflictAction CreateOrOverwrite | Out-Null

$dataset = Get-PowerBIDataset -WorkspaceId $WorkspaceId | Where-Object { $_.Name -eq $DatasetName } | Select-Object -First 1
if ($null -eq $dataset) {
    throw "Dataset not found after import: $DatasetName"
}
Write-Log "Dataset ready: $($dataset.Name) ($($dataset.Id))" "Green"

# Importing a dataset PBIX also creates a report with the dataset name; remove it
# so the workspace keeps the thin ADE report as the canonical report artifact.
Remove-WorkspaceReportByName -WorkspaceId $WorkspaceId -Name $DatasetName

Write-Log "Importing report PBIX '$ReportName'" "Yellow"
New-PowerBIReport -Path $ReportPath -Name $ReportName -WorkspaceId $WorkspaceId -ConflictAction CreateOrOverwrite | Out-Null

$report = Get-PowerBIReport -WorkspaceId $WorkspaceId | Where-Object { $_.Name -eq $ReportName } | Select-Object -First 1
if ($null -eq $report) {
    throw "Report not found after import: $ReportName"
}
Write-Log "Report ready: $($report.Name) ($($report.Id))" "Green"

$rebindBody = @{ datasetId = $dataset.Id } | ConvertTo-Json
Write-Log "Rebinding report '$ReportName' to dataset '$DatasetName'" "Yellow"
Invoke-PowerBIRestMethod -Method Post -Url "https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/reports/$($report.Id)/Rebind" -Body $rebindBody | Out-Null

Write-Log "ADE dataset and report published successfully." "Green"
