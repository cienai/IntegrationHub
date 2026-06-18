Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$RepoRoot = Split-Path -Parent $PSScriptRoot
$OutputPath = Join-Path $RepoRoot "Measure Description Governance Tracker.xlsx"

$SemanticModels = @(
    @{
        Name = "Dataset - Azure Data Lake - Sales Performance"
        Path = Join-Path $RepoRoot "powerbi\src\Dataset - Azure Data Lake - Sales Performance.SemanticModel\definition\tables"
    },
    @{
        Name = "Dataset - Azure Data Lake - Automatic Data Enhancement"
        Path = Join-Path $RepoRoot "powerbi\src\Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel\definition\tables"
    }
)

$HelperDescription = "Technical/helper measure used to support report calculations or visuals. Not intended for direct business-user or AI-agent selection."
$PassThroughDescription = "Field pass-through measure that exposes the underlying column value in measure form. Not intended for direct AI-agent selection unless explicitly required by a report visual."

function ConvertTo-XmlText {
    param([AllowNull()][string]$Text)
    if ($null -eq $Text) { return "" }
    return [System.Security.SecurityElement]::Escape($Text)
}

function ConvertTo-CleanText {
    param([AllowNull()][string]$Text)
    if ($null -eq $Text) { return "" }
    $clean = $Text -replace "`r`n", "`n"
    $clean = $clean -replace "`r", "`n"
    $clean = $clean -replace "``````", ""
    $clean = $clean -replace "^\s+", ""
    $clean = $clean -replace "\s+$", ""
    return $clean
}

function Get-TableNameFromFile {
    param([string[]]$Lines, [string]$Fallback)
    foreach ($line in $Lines) {
        if ($line -match '^\s*table\s+(.+?)\s*$') {
            return ($Matches[1].Trim("'"))
        }
    }
    return [System.IO.Path]::GetFileNameWithoutExtension($Fallback)
}

function Get-MeasureNameAndRemainder {
    param([string]$Line)
    $text = $Line.Trim()
    if ($text -match "^measure\s+'([^']+)'\s*(?:=\s*(.*))?$") {
        return @{ Name = $Matches[1]; Remainder = $(if ($Matches.ContainsKey(2)) { $Matches[2] } else { "" }) }
    }
    if ($text -match '^measure\s+(.+?)\s*=\s*(.*)$') {
        return @{ Name = $Matches[1].Trim(); Remainder = $Matches[2] }
    }
    if ($text -match '^measure\s+(.+?)\s*$') {
        return @{ Name = $Matches[1].Trim(); Remainder = "" }
    }
    return $null
}

function Get-ExistingDescription {
    param([string[]]$Lines, [int]$StartIndex)
    $desc = New-Object System.Collections.Generic.List[string]
    for ($i = $StartIndex - 1; $i -ge 0; $i--) {
        $trim = $Lines[$i].Trim()
        if ($trim -match '^///\s?(.*)$') {
            $desc.Insert(0, $Matches[1])
            continue
        }
        if ($trim -eq "") { continue }
        break
    }
    return (($desc.ToArray()) -join " ").Trim()
}

function Get-DaxExpression {
    param([string[]]$BlockLines, [string]$Remainder)
    $expr = New-Object System.Collections.Generic.List[string]
    $rem = $Remainder.Trim()

    if ($rem.StartsWith('```')) {
        $afterTick = $rem.Substring(3)
        if ($afterTick.Trim().Length -gt 0) { $expr.Add($afterTick) }
        $inside = $true
        for ($i = 1; $i -lt $BlockLines.Count; $i++) {
            $line = $BlockLines[$i]
            if ($inside -and $line -match '```') {
                $before = ($line -split '```', 2)[0]
                if ($before.Trim().Length -gt 0) { $expr.Add($before) }
                break
            }
            if ($inside) { $expr.Add($line) }
        }
        return (ConvertTo-CleanText (($expr.ToArray()) -join "`n"))
    }

    if ($rem.Length -gt 0) {
        return (ConvertTo-CleanText $rem)
    }

    for ($i = 1; $i -lt $BlockLines.Count; $i++) {
        $line = $BlockLines[$i]
        if ($line -match '^\s*(formatString|displayFolder|lineageTag|isHidden|dataCategory|annotation|changedProperty|summarizeBy)\s*:') { break }
        if ($line.Trim().Length -eq 0) { continue }
        $expr.Add($line)
    }
    return (ConvertTo-CleanText (($expr.ToArray()) -join "`n"))
}

function Get-MeasuresFromTmdl {
    param([hashtable]$Model)
    $rows = New-Object System.Collections.Generic.List[object]
    $files = Get-ChildItem -Path $Model.Path -Filter *.tmdl -File -ErrorAction Stop
    foreach ($file in $files) {
        $lines = [System.IO.File]::ReadAllLines($file.FullName)
        $tableName = Get-TableNameFromFile -Lines $lines -Fallback $file.Name
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -notmatch '^\s*measure\s+') { continue }
            $parsed = Get-MeasureNameAndRemainder -Line $lines[$i]
            if ($null -eq $parsed) { continue }

            $block = New-Object System.Collections.Generic.List[string]
            $block.Add($lines[$i])
            for ($j = $i + 1; $j -lt $lines.Count; $j++) {
                if ($lines[$j] -match '^\t(?!\t)(measure|column|partition|hierarchy|calculationGroup|calculationItem)\b') { break }
                $block.Add($lines[$j])
            }

            $rows.Add([pscustomobject]@{
                ModelName = $Model.Name
                TableName = $tableName
                MeasureName = $parsed.Name
                DaxExpression = Get-DaxExpression -BlockLines $block.ToArray() -Remainder $parsed.Remainder
                ExistingDescription = Get-ExistingDescription -Lines $lines -StartIndex $i
                SourceFile = $file.FullName.Substring($RepoRoot.Length + 1)
            })
        }
    }
    return $rows
}

function Get-MeasureUsageNames {
    $usage = @{}
    $reportFiles = Get-ChildItem -Path (Join-Path $RepoRoot "powerbi\src") -Recurse -File -Include *.json -ErrorAction Stop |
        Where-Object { $_.FullName -like "*.Report*" }
    foreach ($file in $reportFiles) {
        $text = [System.IO.File]::ReadAllText($file.FullName)
        foreach ($m in [regex]::Matches($text, '"(?:queryRef|Name|Property|Measure|measure)"\s*:\s*"([^"]+)"')) {
            $value = $m.Groups[1].Value
            if ($value -match '\[([^\]]+)\]') { $usage[$Matches[1]] = $true }
            $parts = $value -split '\.'
            foreach ($part in $parts) {
                if ($part -match '^meas\.') { $usage[$part] = $true }
            }
        }
        foreach ($m in [regex]::Matches($text, 'meas\.[A-Za-z0-9_%\-\s]+')) {
            $usage[$m.Value.Trim()] = $true
        }
    }
    return $usage
}

function Test-FieldPassThrough {
    param([string]$MeasureName, [string]$Dax)
    $d = ($Dax -replace '\s+', ' ').Trim()
    if ($d -match '^(CALCULATE\s*\(\s*)?(MAX|MIN|SELECTEDVALUE|FIRSTNONBLANK|LASTNONBLANK)\s*\(\s*[\w ''-]+\[[^\]]+\]') { return $true }
    if ($d -match '^MAXX\s*\(\s*TOPN\s*\(') { return $true }
    if ($MeasureName -match '(name|title|role|group|currency|logo|version|as_of|processed_asof|deep_link|sub_type|sales_type)$') { return $true }
    return $false
}

function Test-WeakDescription {
    param([AllowNull()][string]$Description)
    if ([string]::IsNullOrWhiteSpace($Description)) { return $true }
    $d = $Description.Trim()
    if ($d -match '^(todo|tbd|n/a|na|none|blank|description pending)\.?$') { return $true }
    if ($d -match 'See DAX expression|Calculates the measure based on current filter context') { return $true }
    if ($d.Length -lt 8) { return $true }
    return $false
}

function Get-MeasureType {
    param([string]$Name, [string]$Dax)
    $n = $Name.ToLowerInvariant()
    if ($n -match 'deprecated|legacy') { return "Deprecated / Legacy Measure" }
    if (Test-FieldPassThrough -MeasureName $Name -Dax $Dax) { return "Field Pass-Through Measure" }
    if ($n -match 'format|display|label|title|tooltip|color|rgb|hex|text|string|filter_string|concat|concate') { return "Formatting / Display Measure" }
    if ($n -match 'debug|dump|test|check|selector|selected|sel_|context|relative_|aliasing|sort|rank|previous|prev_|prior_|last_|next_|current_week|last_week|next_week|mtd|qtd|ytd') { return "Helper / Technical Measure" }
    if ($n -match 'score|rate|ratio|pct|percent|prob|confidence|win_rate|conversion|attainment|achievement|improvement') { return "KPI / Score Measure" }
    if ($n -match 'date|month|quarter|year|week|period') { return "Time Intelligence Measure" }
    return "Core Business Measure"
}

function Get-Status {
    param([string]$Name, [string]$Dax, [string]$ExistingDescription, [string]$MeasureType)
    $n = $Name.ToLowerInvariant()
    $d = $Dax.ToLowerInvariant()
    if ($n -match 'deprecated|legacy|do_not_use') { return "Deprecated / Do Not Use" }
    if ($MeasureType -eq "Field Pass-Through Measure") { return "Field Pass-Through Measure" }
    if ($MeasureType -in @("Helper / Technical Measure", "Formatting / Display Measure") -or $n -match 'debug|dump|test|helper|filter_string|aliasing') { return "Redundant / Helper Measure" }
    if ($d -match '\bblank\s*\(\s*\)|todo|fixme|hardcod|date\s*\(\s*2010|/\*|_test') { return "Needs DAX Review" }
    if (Test-WeakDescription -Description $ExistingDescription) { return "Needs Description Update" }
    return "Good"
}

function Get-RecommendedDescription {
    param([string]$Name, [string]$Dax, [string]$MeasureType, [string]$ExistingDescription)
    if ($MeasureType -eq "Field Pass-Through Measure") { return $PassThroughDescription }
    if ($MeasureType -in @("Helper / Technical Measure", "Formatting / Display Measure", "Deprecated / Legacy Measure")) { return $HelperDescription }
    if (-not (Test-WeakDescription -Description $ExistingDescription)) { return $ExistingDescription }

    $friendly = $Name -replace '^meas\.', ''
    $friendly = $friendly -replace '_', ' '
    $friendly = ($friendly.Substring(0,1).ToUpperInvariant() + $friendly.Substring([Math]::Min(1, $friendly.Length)))
    $d = ($Dax -replace '\s+', ' ').Trim()

    if ($d -match '(?i)\bSUM\s*\(\s*([^\)]+)\)') {
        return "Sums $friendly in the current filter context."
    }
    if ($d -match '(?i)\bDISTINCTCOUNT\s*\(\s*([^\)]+)\)') {
        return "Distinct count of $friendly in the current filter context."
    }
    if ($d -match '(?i)\bCOUNT\s*\(') {
        return "Counts $friendly in the current filter context."
    }
    if ($d -match '(?i)\bAVERAGE\s*\(') {
        return "Averages $friendly in the current filter context."
    }
    if ($d -match '(?i)\bDIVIDE\s*\(|/') {
        return "Returns the $friendly ratio or percentage in the current filter context."
    }
    return "Returns $friendly in the current filter context."
}

function Get-Issues {
    param([string]$Name, [string]$Dax, [string]$ExistingDescription, [string]$Status, [string]$MeasureType, [bool]$Used)
    $issues = New-Object System.Collections.Generic.List[string]
    if ([string]::IsNullOrWhiteSpace($ExistingDescription)) {
        $issues.Add("Missing measure description.")
    } elseif (Test-WeakDescription -Description $ExistingDescription) {
        $issues.Add("Description is placeholder-like or too short to identify the measure output.")
    }
    if ($MeasureType -eq "Field Pass-Through Measure") {
        $issues.Add("Measure appears to expose a single underlying column value and should be excluded from broad AI discovery.")
    }
    if ($MeasureType -in @("Helper / Technical Measure", "Formatting / Display Measure")) {
        $issues.Add("Measure appears to be a technical helper or visual-support measure and should be filtered out for AI-agent selection.")
    }
    if ($Name -match 'debug|dump|test|check') {
        $issues.Add("Name indicates debug, test, dump, or validation usage; validate before production use.")
    }
    if ($Dax -match '(?i)\bBLANK\s*\(\s*\)') {
        $issues.Add("DAX may intentionally return BLANK; confirm whether this measure is obsolete or placeholder logic.")
    }
    if ($Dax -match 'date\s*\(\s*2010|=\s*78\b|=\s*60\b') {
        $issues.Add("DAX contains a hard-coded value or date; validate that the assumption is still correct.")
    }
    if ($Dax -match '(?i)SELECTEDVALUE|HASONEVALUE|ISFILTERED|ALLSELECTED|TREATAS|USERELATIONSHIP|REMOVEFILTERS|ALL\s*\(') {
        $issues.Add("DAX depends on specific filter-context behavior; description should explain intended report context.")
    }
    if (-not $Used) {
        $issues.Add("No local report-definition reference found; production deployment usage not validated.")
    }
    if ($issues.Count -eq 0 -and $Status -eq "Good") {
        $issues.Add("No major governance issue found from static TMDL review.")
    }
    return (($issues.ToArray()) -join " ")
}

function Get-AiRating {
    param([string]$Status, [string]$MeasureType, [bool]$Used)
    if ($Status -in @("Deprecated / Do Not Use", "Redundant / Helper Measure", "Field Pass-Through Measure")) { return "Do Not Use" }
    if ($Status -eq "Needs DAX Review") { return "Low" }
    if ($Status -eq "Needs Description Update") { return "Medium" }
    if (-not $Used) { return "Medium" }
    if ($MeasureType -in @("Core Business Measure", "KPI / Score Measure", "Time Intelligence Measure")) { return "High" }
    return "Low"
}

function Get-AiNotes {
    param([string]$Status, [string]$MeasureType, [string]$Dax, [bool]$Used)
    if ($Status -eq "Deprecated / Do Not Use") { return "AI agents should not use this measure directly unless a report owner confirms it is still supported." }
    if ($MeasureType -eq "Field Pass-Through Measure") { return "AI agents should avoid direct selection because this is a field pass-through measure intended for visual-specific display context." }
    if ($Status -eq "Redundant / Helper Measure") { return "AI agents should not use this measure directly; it supports calculations, labels, filters, rankings, or visual behavior." }
    $notes = New-Object System.Collections.Generic.List[string]
    if ($Status -eq "Needs DAX Review") { $notes.Add("Use only after DAX validation because static review found placeholder, debug, hard-coded, or context-sensitive logic.") }
    elseif ($Status -eq "Needs Description Update") { $notes.Add("AI agents may use with caution after the description is improved to explain business meaning and filter behavior.") }
    else { $notes.Add("AI agents can use this measure directly when the requested business question matches the measure name and grain.") }
    if ($Dax -match '(?i)SELECTEDVALUE|HASONEVALUE|ISFILTERED|ALLSELECTED|TREATAS|USERELATIONSHIP|REMOVEFILTERS|ALL\s*\(') {
        $notes.Add("It has explicit filter-context logic, so results may change outside the intended report visual or slicer context.")
    }
    if (-not $Used) { $notes.Add("No local report usage was detected, so production relevance is unconfirmed.") }
    return (($notes.ToArray()) -join " ")
}

function Get-RecommendedAction {
    param([string]$Status, [string]$MeasureType, [bool]$Used)
    switch ($Status) {
        "Good" { if ($Used) { return "Keep as-is" } else { return "Validate with report usage" } }
        "Needs Description Update" { return "Update description" }
        "Needs DAX Review" { return "Review DAX logic" }
        "Redundant / Helper Measure" { return "Mark as helper / exclude from AI" }
        "Field Pass-Through Measure" { return "Mark as helper / exclude from AI" }
        "Deprecated / Do Not Use" { return "Deprecate / avoid using" }
        default { return "Validate with report usage" }
    }
}

function New-WorksheetXml {
    param([object[]]$Rows, [string[]]$Headers)
    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine('<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
    [void]$sb.AppendLine('<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">')
    [void]$sb.AppendLine('<sheetViews><sheetView workbookViewId="0"><pane ySplit="1" topLeftCell="A2" activePane="bottomLeft" state="frozen"/></sheetView></sheetViews>')
    [void]$sb.AppendLine('<sheetFormatPr defaultRowHeight="15"/>')
    [void]$sb.AppendLine('<cols>')
    $widths = @(28,38,90,55,70,75,24,14,20,70,26,28)
    for ($i = 0; $i -lt $widths.Count; $i++) {
        $col = $i + 1
        [void]$sb.AppendLine("<col min=""$col"" max=""$col"" width=""$($widths[$i])"" customWidth=""1""/>")
    }
    [void]$sb.AppendLine('</cols>')
    [void]$sb.AppendLine('<sheetData>')
    [void]$sb.AppendLine('<row r="1">')
    for ($c = 0; $c -lt $Headers.Count; $c++) {
        $cellRef = "{0}1" -f ([char](65 + $c))
        [void]$sb.AppendLine("<c r=""$cellRef"" t=""inlineStr"" s=""1""><is><t>$(ConvertTo-XmlText $Headers[$c])</t></is></c>")
    }
    [void]$sb.AppendLine('</row>')
    $r = 2
    foreach ($row in $Rows) {
        [void]$sb.AppendLine("<row r=""$r"">")
        for ($c = 0; $c -lt $Headers.Count; $c++) {
            $header = $Headers[$c]
            $cellRef = "{0}{1}" -f ([char](65 + $c)), $r
            $value = [string]$row.$header
            if ($value.Length -gt 32767) {
                $value = $value.Substring(0, 32720) + "`n[TRUNCATED: Excel cell limit exceeded; see source TMDL for full expression.]"
            }
            [void]$sb.AppendLine("<c r=""$cellRef"" t=""inlineStr"" s=""2""><is><t xml:space=""preserve"">$(ConvertTo-XmlText $value)</t></is></c>")
        }
        [void]$sb.AppendLine('</row>')
        $r++
    }
    [void]$sb.AppendLine('</sheetData>')
    $lastRow = [Math]::Max(1, $Rows.Count + 1)
    [void]$sb.AppendLine("<autoFilter ref=""A1:L$lastRow""/>")
    [void]$sb.AppendLine('</worksheet>')
    return $sb.ToString()
}

function Add-ZipEntry {
    param([System.IO.Compression.ZipArchive]$Zip, [string]$Name, [string]$Content)
    $entry = $Zip.CreateEntry($Name)
    $stream = $entry.Open()
    $writer = [System.IO.StreamWriter]::new($stream, [System.Text.UTF8Encoding]::new($false))
    $writer.Write($Content)
    $writer.Dispose()
    $stream.Dispose()
}

function Export-Xlsx {
    param([object[]]$Rows, [string]$Path)
    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem

    if (Test-Path $Path) { Remove-Item -LiteralPath $Path -Force }
    $fs = [System.IO.File]::Open($Path, [System.IO.FileMode]::CreateNew)
    $zip = [System.IO.Compression.ZipArchive]::new($fs, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        $headers = @(
            "Table Name",
            "Measure Name",
            "Measure Code / DAX Expression",
            "Existing Measure Description",
            "Recommended Measure Description",
            "Comments / Issues Found",
            "Status",
            "On Prod Y/N",
            "AI Usability Rating",
            "AI Usability Notes",
            "Measure Type",
            "Recommended Action"
        )
        Add-ZipEntry $zip "[Content_Types].xml" '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/><Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/><Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/></Types>'
        Add-ZipEntry $zip "_rels/.rels" '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/></Relationships>'
        Add-ZipEntry $zip "xl/_rels/workbook.xml.rels" '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/></Relationships>'
        Add-ZipEntry $zip "xl/workbook.xml" '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><sheets><sheet name="Measure Tracker" sheetId="1" r:id="rId1"/></sheets></workbook>'
        Add-ZipEntry $zip "xl/styles.xml" '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><fonts count="2"><font><sz val="11"/><name val="Calibri"/></font><font><b/><sz val="11"/><name val="Calibri"/></font></fonts><fills count="2"><fill><patternFill patternType="none"/></fill><fill><patternFill patternType="solid"><fgColor rgb="FFD9EAF7"/><bgColor indexed="64"/></patternFill></fill></fills><borders count="1"><border><left/><right/><top/><bottom/><diagonal/></border></borders><cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs><cellXfs count="3"><xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/><xf numFmtId="0" fontId="1" fillId="1" borderId="0" xfId="0" applyFont="1" applyFill="1" applyAlignment="1"><alignment wrapText="1" vertical="top"/></xf><xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0" applyAlignment="1"><alignment wrapText="1" vertical="top"/></xf></cellXfs><cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles></styleSheet>'
        Add-ZipEntry $zip "xl/worksheets/sheet1.xml" (New-WorksheetXml -Rows $Rows -Headers $headers)
    }
    finally {
        $zip.Dispose()
        $fs.Dispose()
    }
}

$allMeasures = New-Object System.Collections.Generic.List[object]
foreach ($model in $SemanticModels) {
    foreach ($measure in (Get-MeasuresFromTmdl -Model $model)) {
        $allMeasures.Add($measure)
    }
}

$usageNames = Get-MeasureUsageNames
$trackerRows = New-Object System.Collections.Generic.List[object]

foreach ($m in $allMeasures | Sort-Object ModelName, TableName, MeasureName) {
    $used = $usageNames.ContainsKey($m.MeasureName)
    $measureType = Get-MeasureType -Name $m.MeasureName -Dax $m.DaxExpression
    $status = Get-Status -Name $m.MeasureName -Dax $m.DaxExpression -ExistingDescription $m.ExistingDescription -MeasureType $measureType
    $aiRating = Get-AiRating -Status $status -MeasureType $measureType -Used $used
    $comments = "Source model: $($m.ModelName). Source file: $($m.SourceFile). " + (Get-Issues -Name $m.MeasureName -Dax $m.DaxExpression -ExistingDescription $m.ExistingDescription -Status $status -MeasureType $measureType -Used $used)

    $trackerRows.Add([pscustomobject]@{
        "Table Name" = $m.TableName
        "Measure Name" = $m.MeasureName
        "Measure Code / DAX Expression" = $m.DaxExpression
        "Existing Measure Description" = $m.ExistingDescription
        "Recommended Measure Description" = Get-RecommendedDescription -Name $m.MeasureName -Dax $m.DaxExpression -MeasureType $measureType -ExistingDescription $m.ExistingDescription
        "Comments / Issues Found" = $comments
        "Status" = $status
        "On Prod Y/N" = $(if ($used) { "Y" } else { "Unknown" })
        "AI Usability Rating" = $aiRating
        "AI Usability Notes" = Get-AiNotes -Status $status -MeasureType $measureType -Dax $m.DaxExpression -Used $used
        "Measure Type" = $measureType
        "Recommended Action" = Get-RecommendedAction -Status $status -MeasureType $measureType -Used $used
    })
}

Export-Xlsx -Rows $trackerRows.ToArray() -Path $OutputPath

$summary = $trackerRows | Group-Object Status | Sort-Object Name | ForEach-Object { "$($_.Name): $($_.Count)" }
Write-Host "Wrote $($trackerRows.Count) measure rows to $OutputPath"
Write-Host ($summary -join "; ")
