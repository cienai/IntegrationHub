param(
    [string]$QueriesPath = "C:\Users\filip\OneDrive\Desktop\New Queries.xlsx",
    [string]$AiScoresPath = "C:\Users\filip\Downloads\metadata_ai_scores.xlsx",
    [string]$RepoRoot = (Resolve-Path ".").Path,
    [string]$OutPath = (Join-Path (Resolve-Path ".").Path "New Queries - Production Readiness Review - Concrete Fixes.xlsx")
)

Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName System.Web

function Convert-ColRefToIndex([string]$ref) {
    $letters = ($ref -replace '[^A-Z]', '')
    $n = 0
    foreach ($ch in $letters.ToCharArray()) {
        $n = ($n * 26) + ([int][char]$ch - [int][char]'A' + 1)
    }
    return $n
}

function Get-ZipText($zip, [string]$path) {
    $entry = $zip.GetEntry($path)
    if (-not $entry) { return $null }
    $stream = $entry.Open()
    try {
        $reader = [System.IO.StreamReader]::new($stream)
        try { return $reader.ReadToEnd() } finally { $reader.Dispose() }
    } finally { $stream.Dispose() }
}

function Read-XlsxWorkbook([string]$path) {
    $zip = [System.IO.Compression.ZipFile]::OpenRead($path)
    try {
        [xml]$sharedXml = Get-ZipText $zip "xl/sharedStrings.xml"
        $shared = @()
        if ($sharedXml) {
            foreach ($si in $sharedXml.sst.si) {
                $parts = @()
                if ($si.t) { $parts += [string]$si.t }
                foreach ($r in $si.r) { if ($r.t) { $parts += [string]$r.t } }
                $shared += ($parts -join "")
            }
        }

        [xml]$wb = Get-ZipText $zip "xl/workbook.xml"
        [xml]$rels = Get-ZipText $zip "xl/_rels/workbook.xml.rels"
        $relMap = @{}
        foreach ($rel in $rels.Relationships.Relationship) {
            $relMap[$rel.Id] = "xl/" + ([string]$rel.Target).TrimStart("/")
        }

        $result = @{}
        foreach ($sheet in $wb.workbook.sheets.sheet) {
            $rid = $sheet.GetAttribute("id", "http://schemas.openxmlformats.org/officeDocument/2006/relationships")
            $sheetPath = $relMap[$rid]
            [xml]$sheetXml = Get-ZipText $zip $sheetPath
            $rows = @()
            foreach ($row in $sheetXml.worksheet.sheetData.row) {
                $values = @{}
                foreach ($c in $row.c) {
                    $idx = Convert-ColRefToIndex $c.r
                    $v = [string]$c.v
                    if ($c.t -eq "s" -and $v -ne "") {
                        $v = $shared[[int]$v]
                    } elseif ($c.t -eq "inlineStr") {
                        $v = [string]$c.is.t
                    }
                    $values[$idx] = $v
                }
                $rows += ,$values
            }

            if ($rows.Count -eq 0) {
                $result[[string]$sheet.name] = @()
                continue
            }
            $headers = @{}
            foreach ($key in $rows[0].Keys) { $headers[$key] = [string]$rows[0][$key] }
            $objects = @()
            for ($i = 1; $i -lt $rows.Count; $i++) {
                $obj = [ordered]@{}
                foreach ($key in ($headers.Keys | Sort-Object {[int]$_})) {
                    $name = $headers[$key]
                    if ([string]::IsNullOrWhiteSpace($name)) { continue }
                    $obj[$name] = if ($rows[$i].ContainsKey($key)) { [string]$rows[$i][$key] } else { "" }
                }
                if (($obj.Values | Where-Object { -not [string]::IsNullOrWhiteSpace([string]$_) }).Count -gt 0) {
                    $objects += [pscustomobject]$obj
                }
            }
            $result[[string]$sheet.name] = $objects
        }
        return $result
    } finally {
        $zip.Dispose()
    }
}

function Get-TmdlModelIndex([string]$modelPath) {
    $index = [ordered]@{ Path=$modelPath; Tables=@{}; Measures=@{}; Columns=@{}; Relationships=@(); Text="" }
    $tableFiles = Get-ChildItem -Path (Join-Path $modelPath "definition\tables") -Filter *.tmdl -File -ErrorAction SilentlyContinue
    $allText = New-Object System.Text.StringBuilder
    foreach ($file in $tableFiles) {
        $text = Get-Content -Raw -LiteralPath $file.FullName
        [void]$allText.AppendLine($text)
        $tableName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
        if ($text -match "(?m)^\s*table\s+'?([^'\r\n]+)'?") { $tableName = $Matches[1].Trim() }
        $index.Tables[$tableName.ToLowerInvariant()] = $tableName
        $cols = New-Object System.Collections.Generic.List[string]
        foreach ($m in [regex]::Matches($text, "(?m)^\s*column\s+'?([^'\r\n=]+)'?")) {
            $col = $m.Groups[1].Value.Trim()
            $cols.Add($col)
            $index.Columns[("$tableName|$col").ToLowerInvariant()] = "$tableName[$col]"
        }
        foreach ($m in [regex]::Matches($text, "(?m)^\s*measure\s+'?([^'\r\n=]+)'?\s*=")) {
            $measure = $m.Groups[1].Value.Trim()
            $expr = ""
            $index.Measures[$measure.ToLowerInvariant()] = [pscustomobject]@{ Table=$tableName; Name=$measure; Expression=$expr; File=$file.FullName }
        }
    }
    $relFiles = Get-ChildItem -Path (Join-Path $modelPath "definition\relationships.tmdl") -File -ErrorAction SilentlyContinue
    foreach ($file in $relFiles) {
        $text = Get-Content -Raw -LiteralPath $file.FullName
        [void]$allText.AppendLine($text)
        foreach ($m in [regex]::Matches($text, "(?ms)relationship\s+\S+.*?(?=relationship\s+\S+|\z)")) {
            $index.Relationships += $m.Value.Trim()
        }
    }
    $index.Text = $allText.ToString()
    return [pscustomobject]$index
}

function Get-VisualRefs([string]$text) {
    $measures = New-Object System.Collections.Generic.HashSet[string]
    $fields = New-Object System.Collections.Generic.HashSet[string]
    foreach ($m in [regex]::Matches($text, '"Property"\s*:\s*"([^"]+)"')) {
        $prop = $m.Groups[2].Value
        if (-not $prop) { $prop = $m.Groups[1].Value }
        if ($prop -match '^(?i)(meas\.|measure_|meas_)') { [void]$measures.Add($prop) }
        else { [void]$fields.Add($prop) }
    }
    return [pscustomobject]@{ Measures=@($measures); Fields=@($fields) }
}

function Get-ReportIndex([string]$srcRoot, [string[]]$InterestingProps) {
    $reports = @{}
    $pagePathMap = @{}
    foreach ($dir in Get-ChildItem -Path $srcRoot -Directory -Filter "*.Report" -ErrorAction SilentlyContinue) {
        $pages = @{}
        foreach ($pageDir in Get-ChildItem -Path (Join-Path $dir.FullName "definition\pages") -Directory -ErrorAction SilentlyContinue) {
            $pageJson = Join-Path $pageDir.FullName "page.json"
            $display = $pageDir.Name
            $pageText = ""
            if (Test-Path $pageJson) {
                $pageText = Get-Content -Raw -LiteralPath $pageJson
                try {
                    $pj = $pageText | ConvertFrom-Json
                    if ($pj.displayName) { $display = $pj.displayName }
                } catch {}
            }
            $visuals = [System.Collections.ArrayList]::new()
            $pages[$display.ToLowerInvariant()] = [pscustomobject]@{ Name=$display; Text=$pageText; Path=$pageDir.FullName; Visuals=$visuals; Report=$dir.BaseName }
            $pagePathMap[$pageDir.FullName.ToLowerInvariant()] = $pages[$display.ToLowerInvariant()]
        }
        $reports[$dir.BaseName.ToLowerInvariant()] = [pscustomobject]@{ Name=$dir.BaseName; Pages=$pages; Path=$dir.FullName }
    }
    $visualMap = @{}
    $rg = Get-Command rg -ErrorAction SilentlyContinue
    if ($rg -and $InterestingProps.Count -gt 0) {
        $pattern = (($InterestingProps | Where-Object { $_ } | Sort-Object -Unique | Select-Object -First 250 | ForEach-Object { [regex]::Escape($_) }) -join '|')
        $rgArgs = @($pattern, $srcRoot, '-g', 'visual.json', '--no-heading', '--line-number')
        $lines = & rg @rgArgs
        foreach ($line in $lines) {
            if ($line -notmatch '^(.*visual\.json):\d+:\s*.*"Property"\s*:\s*"([^"]+)"') { continue }
            $path = $Matches[1]
            $prop = $Matches[2]
            $visualDir = Split-Path -Parent $path
            $pageDir = Split-Path -Parent (Split-Path -Parent $visualDir)
            $page = $pagePathMap[$pageDir.ToLowerInvariant()]
            if (-not $page) { continue }
            if (-not $visualMap.ContainsKey($path)) {
                $visualMap[$path] = [pscustomobject]@{
                    Name = Split-Path -Leaf $visualDir
                    Path = $path
                    Measures = [System.Collections.ArrayList]::new()
                    Fields = [System.Collections.ArrayList]::new()
                    VisualType = ""
                    Page = $page
                }
                [void]$page.Visuals.Add($visualMap[$path])
            }
            if ($prop -match '^(?i)(meas\.|measure_|meas_)') { [void]$visualMap[$path].Measures.Add($prop) }
            else { [void]$visualMap[$path].Fields.Add($prop) }
        }
    }
    return $reports
}

function Get-DaxRefs([string]$dax) {
    $tables = New-Object System.Collections.Generic.HashSet[string]
    $columns = New-Object System.Collections.Generic.List[string]
    $measures = New-Object System.Collections.Generic.HashSet[string]
    foreach ($m in [regex]::Matches($dax, "'([^']+)'\s*\[([^\]]+)\]")) {
        [void]$tables.Add($m.Groups[1].Value)
        $columns.Add($m.Groups[1].Value + "[" + $m.Groups[2].Value + "]")
    }
    foreach ($m in [regex]::Matches($dax, "(?<!')\b([A-Za-z_][A-Za-z0-9_ ]*)\s*\[([^\]]+)\]")) {
        [void]$tables.Add($m.Groups[1].Value.Trim())
        $columns.Add($m.Groups[1].Value.Trim() + "[" + $m.Groups[2].Value + "]")
    }
    foreach ($m in [regex]::Matches($dax, "(?<![A-Za-z0-9_'])\[([^\]]+)\]")) {
        [void]$measures.Add($m.Groups[1].Value.Trim())
    }
    return [pscustomobject]@{ Tables=@($tables); Columns=@($columns | Sort-Object -Unique); Measures=@($measures | Sort-Object -Unique) }
}

function Summarize-Dax([string]$dax, $refs) {
    $shape = if ($dax -match "(?is)\bTOPN\s*\(\s*(\d+)") { "Top $($Matches[1]) rows" }
        elseif ($dax -match "(?is)\bROW\s*\(") { "Single-row scalar result" }
        elseif ($dax -match "(?is)\bSUMMARIZECOLUMNS\s*\(") { "Grouped table result" }
        elseif ($dax -match "(?is)\bEVALUATE\s+\{") { "Small literal/scalar table" }
        else { "Table/scalar DAX result" }
    $groupCols = @()
    if ($dax -match "(?is)SUMMARIZECOLUMNS\s*\((.*?)(ORDER\s+BY|$)") {
        foreach ($col in [regex]::Matches($Matches[1], "'?[^,\(\)]+'?\[[^\]]+\]")) { $groupCols += $col.Value }
    }
    $filters = @()
    foreach ($fn in "FILTER","TREATAS","KEEPFILTERS","DATESINPERIOD","DATEADD","ALL","REMOVEFILTERS") {
        if ($dax -match "(?i)\b$fn\s*\(") { $filters += $fn }
    }
    $parts = @($shape)
    if ($refs.Tables.Count) { $parts += ("tables: " + (($refs.Tables | Sort-Object -Unique) -join ", ")) }
    if ($groupCols.Count) { $parts += ("grouped by: " + (($groupCols | Sort-Object -Unique) -join ", ")) }
    if ($refs.Measures.Count) { $parts += ("measures: " + (($refs.Measures | Sort-Object -Unique) -join ", ")) }
    if ($filters.Count) { $parts += ("filters/functions: " + (($filters | Sort-Object -Unique) -join ", ")) }
    return $parts -join "; "
}

function Test-ColumnExists($model, [string]$table, [string]$column) {
    return $model.Columns.Contains(("$table|$column").ToLowerInvariant())
}

function Choose-Model($row, $models) {
    $sm = [string]$row.semantic_model
    if ($sm) {
        foreach ($m in $models) {
            if ($m.Path -like "*$sm*" -or $sm -like "*$([System.IO.Path]::GetFileNameWithoutExtension($m.Path))*") { return $m }
        }
    }
    if ($sm -match "Automatic|Enhancement") { return ($models | Where-Object { $_.Path -match "Automatic Data Enhancement" } | Select-Object -First 1) }
    if ($sm -match "Sales|Performance") { return ($models | Where-Object { $_.Path -match "Sales Performance" } | Select-Object -First 1) }
    return $models[0]
}

function Get-AiScoreNotes($row, $metadataRows, $refs, $model) {
    $scores = @()
    foreach ($n in 1..5) {
        $v = [string]$row.("ai_score_$n")
        if (-not [string]::IsNullOrWhiteSpace($v)) { $scores += $v }
    }
    $scoreRefs = @($refs.Columns + $refs.Measures | Where-Object { $_ -match "(?i)(ai|score|prediction|rank|probability)" })
    $notes = @()
    if ($scores.Count) { $notes += "Workbook AI scores: " + (($scores | Select-Object -Unique) -join ", ") } else { $notes += "No ai_score_1..5 values supplied." }
    if ($scoreRefs.Count) { $notes += "DAX score-like refs: " + (($scoreRefs | Select-Object -Unique) -join ", ") } else { $notes += "DAX does not visibly reference score-like fields/measures." }
    $matched = @()
    foreach ($s in $scores) {
        if ([string]::IsNullOrWhiteSpace($s)) { continue }
        $needle = [regex]::Escape($s)
        $hit = $metadataRows | Where-Object { ($_ | ConvertTo-Json -Compress) -match $needle } | Select-Object -First 1
        if ($hit) { $matched += $s }
    }
    if ($matched.Count) { $notes += "Metadata contains listed score(s): " + (($matched | Select-Object -Unique) -join ", ") }
    return $notes -join " "
}

function Get-AiScoreIssue($row, $metadataRows, $refs) {
    $scores = @()
    foreach ($n in 1..5) {
        $v = [string]$row.("ai_score_$n")
        if (-not [string]::IsNullOrWhiteSpace($v)) { $scores += $v }
    }
    $scoreRefs = @($refs.Columns + $refs.Measures | Where-Object { $_ -match "(?i)(ai|score|prediction|rank|probability|propensity|likelihood)" })
    $missingMeta = @()
    foreach ($s in $scores) {
        $needle = [regex]::Escape($s)
        $hit = $metadataRows | Where-Object { ($_ | ConvertTo-Json -Compress) -match $needle } | Select-Object -First 1
        if (-not $hit) { $missingMeta += $s }
    }
    if ($scores.Count -gt 0 -and $scoreRefs.Count -eq 0) {
        return [pscustomobject]@{
            Issue = "AI score metadata is listed, but the DAX does not visibly use an AI score field or measure."
            Impact = "A reviewer may assume the query is ranked, filtered, or explained by AI scores when the result is actually driven only by the DAX fields/measures."
            Fix = "Confirm intent. If AI scores are only Agentic metadata, leave the DAX unchanged and document that in the description. If the score is meant to affect the output, add the relevant score column/measure to the DAX as a filter, grouping, sort, or returned column."
        }
    }
    if ($scores.Count -eq 0 -and $scoreRefs.Count -gt 0) {
        return [pscustomobject]@{
            Issue = "The DAX references score-like fields/measures, but ai_score_1..ai_score_5 are empty."
            Impact = "Agentic/discovery metadata will not reflect that this query depends on scoring logic."
            Fix = "Populate the appropriate ai_score columns from metadata_ai_scores.xlsx so the query can be discovered and governed correctly."
        }
    }
    if ($missingMeta.Count -gt 0) {
        return [pscustomobject]@{
            Issue = "One or more listed AI scores were not found in metadata_ai_scores.xlsx: " + (($missingMeta | Select-Object -Unique) -join ", ")
            Impact = "The query may point to an obsolete, misspelled, or undocumented score."
            Fix = "Correct the ai_score value to the canonical score name from metadata_ai_scores.xlsx, or add the missing score to the metadata if it is legitimate."
        }
    }
    return $null
}

function Get-BusinessConcept([string]$name, [string]$description, $refs) {
    $text = (($name, $description, ($refs.Tables -join " "), ($refs.Measures -join " ")) -join " ").ToLowerInvariant()
    if ($text -match "pipeline|opportunit|deal") { return "Pipeline/opportunity performance" }
    if ($text -match "prospect|lead") { return "Prospecting and lead follow-up" }
    if ($text -match "account|company|customer") { return "Account/company analysis" }
    if ($text -match "skill|rep|seller|user") { return "Sales rep skill or behavior analysis" }
    if ($text -match "quality|dqa|data") { return "Data quality assessment" }
    if ($text -match "enhancement|automatic|ai") { return "Automatic data enhancement / AI scoring" }
    return "Business analytical query over the referenced model entities"
}

function Get-ReportAlignment($row, $reports, $refs) {
    $reportName = [string]$row.Report
    $pageName = [string]$row.'Report Page'
    if ([string]::IsNullOrWhiteSpace($reportName)) { return "No Report listed; cannot confirm placement." }
    $report = $null
    foreach ($key in $reports.Keys) {
        if ($key -eq $reportName.ToLowerInvariant() -or $key -like "*$($reportName.ToLowerInvariant())*" -or $reportName.ToLowerInvariant() -like "*$key*") { $report = $reports[$key]; break }
    }
    if (-not $report) { return "Listed report '$reportName' was not found in PBIP report folders." }
    if ([string]::IsNullOrWhiteSpace($pageName)) { return "Report '$($report.Name)' found; no page listed." }
    $page = $null
    foreach ($key in $report.Pages.Keys) {
        if ($key -eq $pageName.ToLowerInvariant() -or $key -like "*$($pageName.ToLowerInvariant())*" -or $pageName.ToLowerInvariant() -like "*$key*") { $page = $report.Pages[$key]; break }
    }
    if (-not $page) { return "Report '$($report.Name)' found, but page '$pageName' was not found." }
    $hits = @()
    foreach ($x in @($refs.Tables + $refs.Measures)) {
        if ($x -and $page.Text -match [regex]::Escape($x)) { $hits += $x }
    }
    if ($hits.Count) { return "Report/page found; page definition references related fields/measures: " + (($hits | Select-Object -Unique | Select-Object -First 8) -join ", ") }
    return "Report/page found by PBIP page metadata; visual-level overlap not exhaustively scanned in this static pass."
}

function Get-ReportIssue($row, $reports) {
    $reportName = [string]$row.Report
    $pageName = [string]$row.'Report Page'
    if ([string]::IsNullOrWhiteSpace($reportName)) {
        return [pscustomobject]@{
            Issue = "No Report value is listed."
            Impact = "The query cannot be confidently tied to a production report context."
            Fix = "Fill the Report column with the production report that owns this business question."
        }
    }
    $report = $null
    foreach ($key in $reports.Keys) {
        if ($key -eq $reportName.ToLowerInvariant() -or $key -like "*$($reportName.ToLowerInvariant())*" -or $reportName.ToLowerInvariant() -like "*$key*") { $report = $reports[$key]; break }
    }
    if (-not $report) {
        return [pscustomobject]@{
            Issue = "Listed report was not found in PBIP files: $reportName"
            Impact = "The query may be assigned to a report that does not exist in this repository, or the report name is inconsistent."
            Fix = "Update the Report value to match one of the PBIP .Report folder names, or add/provide the missing report files."
        }
    }
    if ([string]::IsNullOrWhiteSpace($pageName)) {
        return [pscustomobject]@{
            Issue = "Report exists, but Report Page is blank."
            Impact = "The query is harder to route to the right business context and may appear in the wrong Agentic topic/page."
            Fix = "Fill Report Page with the exact page display name from the PBIP report."
        }
    }
    foreach ($key in $report.Pages.Keys) {
        if ($key -eq $pageName.ToLowerInvariant() -or $key -like "*$($pageName.ToLowerInvariant())*" -or $pageName.ToLowerInvariant() -like "*$key*") { return $null }
    }
    return [pscustomobject]@{
        Issue = "Listed page was not found in report '$($report.Name)': $pageName"
        Impact = "The query may belong to a different page/report, or the page name is stale."
        Fix = "Replace Report Page with the exact PBIP page display name, or move the query to the correct report/page owner."
    }
}

function Normalize-Name([string]$s) {
    if ($null -eq $s) { return "" }
    return ($s.ToLowerInvariant() -replace '[^a-z0-9]+','_').Trim('_')
}

function Get-QueryUsageRefs($refs) {
    $measures = New-Object System.Collections.Generic.HashSet[string]
    $fields = New-Object System.Collections.Generic.HashSet[string]
    foreach ($m in $refs.Measures) {
        if ($m) { [void]$measures.Add((Normalize-Name $m)) }
    }
    foreach ($c in $refs.Columns) {
        if ($c -match '^(.*?)\[(.*)\]$') {
            $name = $Matches[2]
            if ($name -match '^(?i)(meas\.|measure_|meas_)') { [void]$measures.Add((Normalize-Name $name)) }
            else {
                [void]$fields.Add((Normalize-Name ($Matches[1] + "_" + $name)))
                [void]$fields.Add((Normalize-Name $name))
            }
        }
    }
    return [pscustomobject]@{ Measures=@($measures); Fields=@($fields) }
}

function Score-VisualMatch($queryUsage, $visual) {
    $vm = @($visual.Measures | ForEach-Object { Normalize-Name $_ })
    $vf = @($visual.Fields | ForEach-Object { Normalize-Name $_ })
    $measureHits = @($queryUsage.Measures | Where-Object { $vm -contains $_ })
    $fieldHits = @($queryUsage.Fields | Where-Object { $vf -contains $_ })
    $measureTotal = [math]::Max(1, $queryUsage.Measures.Count)
    $fieldTotal = [math]::Max(1, $queryUsage.Fields.Count)
    $measureRatio = $measureHits.Count / $measureTotal
    $fieldRatio = if ($queryUsage.Fields.Count -eq 0) { 1 } else { $fieldHits.Count / $fieldTotal }
    $score = ($measureHits.Count * 4) + ($fieldHits.Count * 2)
    if ($measureRatio -ge 0.8 -and $fieldRatio -ge 0.5) { $level = "Strong match" }
    elseif ($measureRatio -ge 0.5 -and ($fieldHits.Count -gt 0 -or $queryUsage.Fields.Count -eq 0)) { $level = "Partial match" }
    elseif ($measureHits.Count -gt 0) { $level = "Weak match" }
    else { $level = "No match" }
    return [pscustomobject]@{
        Level=$level
        Score=$score
        MeasureHits=$measureHits
        FieldHits=$fieldHits
        MeasureRatio=$measureRatio
        FieldRatio=$fieldRatio
        Visual=$visual
    }
}

function Get-ExpectedReportPage($row, $reports) {
    $reportName = [string]$row.Report
    $pageName = [string]$row.'Report Page'
    $report = $null
    foreach ($key in $reports.Keys) {
        if ($key -eq $reportName.ToLowerInvariant() -or $key -like "*$($reportName.ToLowerInvariant())*" -or $reportName.ToLowerInvariant() -like "*$key*") { $report = $reports[$key]; break }
    }
    if (-not $report) { return $null }
    if ([string]::IsNullOrWhiteSpace($pageName)) { return $null }
    foreach ($key in $report.Pages.Keys) {
        if ($key -eq $pageName.ToLowerInvariant() -or $key -like "*$($pageName.ToLowerInvariant())*" -or $pageName.ToLowerInvariant() -like "*$key*") { return $report.Pages[$key] }
    }
    return $null
}

function Get-ReportUsageAlignment($row, $refs, $reports) {
    $queryUsage = Get-QueryUsageRefs $refs
    $expectedPage = Get-ExpectedReportPage $row $reports
    $expectedBest = $null
    if ($expectedPage) {
        foreach ($v in $expectedPage.Visuals) {
            $m = Score-VisualMatch $queryUsage $v
            if (-not $expectedBest -or $m.Score -gt $expectedBest.Score) { $expectedBest = $m }
        }
    }
    $best = $null
    foreach ($rk in $reports.Keys) {
        foreach ($pk in $reports[$rk].Pages.Keys) {
            foreach ($v in $reports[$rk].Pages[$pk].Visuals) {
                $m = Score-VisualMatch $queryUsage $v
                if (-not $best -or $m.Score -gt $best.Score) {
                    $m | Add-Member -NotePropertyName Report -NotePropertyValue $reports[$rk].Name -Force
                    $m | Add-Member -NotePropertyName Page -NotePropertyValue $reports[$rk].Pages[$pk].Name -Force
                    $best = $m
                }
            }
        }
    }
    if ($expectedBest) {
        $expectedBest | Add-Member -NotePropertyName Report -NotePropertyValue ([string]$row.Report) -Force
        $expectedBest | Add-Member -NotePropertyName Page -NotePropertyValue $expectedPage.Name -Force
    }

    $level = "No match"
    $source = "No matching visual found in available report JSON."
    $recommend = "Do not approve as report-backed until a matching report visual/page is identified or the query is documented as a new synthetic/curated query."
    $evidence = "Query measures: " + (($queryUsage.Measures | Select-Object -First 10) -join ", ") + "; query fields: " + (($queryUsage.Fields | Select-Object -First 10) -join ", ")
    $anchor = $best

    if ($expectedBest -and $expectedBest.Level -ne "No match") {
        $level = $expectedBest.Level
        $anchor = $expectedBest
        $source = "Expected spreadsheet page matches best: $($expectedBest.Report) / $($expectedBest.Page), visual $($expectedBest.Visual.Name) ($($expectedBest.Visual.VisualType))."
        $recommend = if ($level -eq "Strong match") { "Keep the current Report and Report Page mapping; this query appears report-backed." } else { "Keep mapping only after confirming the different grouping/filtering is intentional." }
        $evidence += "; matched measures: " + (($expectedBest.MeasureHits | Select-Object -First 8) -join ", ") + "; matched fields: " + (($expectedBest.FieldHits | Select-Object -First 8) -join ", ")
    } elseif ($best -and $best.Level -ne "No match") {
        $level = $best.Level
        $anchor = $best
        $source = "Better match found outside listed page: $($best.Report) / $($best.Page), visual $($best.Visual.Name) ($($best.Visual.VisualType))."
        $recommend = "Spreadsheet mapping is likely incorrect or too broad. Reconnect this saved query to $($best.Report) / $($best.Page), or explain why it intentionally differs from report usage."
        $evidence += "; matched measures: " + (($best.MeasureHits | Select-Object -First 8) -join ", ") + "; matched fields: " + (($best.FieldHits | Select-Object -First 8) -join ", ")
    } elseif ($queryUsage.Measures.Count -gt 0) {
        $level = "Weak match"
        $source = "Measures may exist in the model, but this combination was not found together in report visuals."
        $recommend = "Treat as potentially synthetic/unsupported. Either align it to an existing visual/page pattern or document it as a new governed query with owner approval."
    }

    return [pscustomobject]@{
        Level=$level
        Source=$source
        Evidence=$evidence
        Recommendation=$recommend
        ExpectedPageFound=[bool]$expectedPage
        BestReport=if ($best) { $best.Report } else { "" }
        BestPage=if ($best) { $best.Page } else { "" }
        QueryMeasures=$queryUsage.Measures
        QueryFields=$queryUsage.Fields
        AnchorMeasures=if ($anchor -and $anchor.Visual) { @($anchor.Visual.Measures | ForEach-Object { Normalize-Name $_ } | Select-Object -Unique) } else { @() }
        AnchorFields=if ($anchor -and $anchor.Visual) { @($anchor.Visual.Fields | ForEach-Object { Normalize-Name $_ } | Select-Object -Unique) } else { @() }
        MatchedMeasures=if ($anchor) { $anchor.MeasureHits } else { @() }
        MatchedFields=if ($anchor) { $anchor.FieldHits } else { @() }
    }
}

function Get-ConcreteChange($usage, $refs, $row, $missing) {
    $queryMeasures = @($usage.QueryMeasures | Where-Object { $_ } | Select-Object -Unique)
    $queryFields = @($usage.QueryFields | Where-Object { $_ } | Select-Object -Unique)
    $anchorMeasures = @($usage.AnchorMeasures | Where-Object { $_ } | Select-Object -Unique)
    $anchorFields = @($usage.AnchorFields | Where-Object { $_ } | Select-Object -Unique)
    $matchedMeasures = @($usage.MatchedMeasures | Where-Object { $_ } | Select-Object -Unique)
    $matchedFields = @($usage.MatchedFields | Where-Object { $_ } | Select-Object -Unique)
    $unmatchedMeasures = @($queryMeasures | Where-Object { $matchedMeasures -notcontains $_ })
    $unmatchedFields = @($queryFields | Where-Object { $matchedFields -notcontains $_ })

    if ($missing.Count -gt 0 -and $usage.Level -in @("Weak match","No match")) {
        return "First make the DAX executable: replace or remove unresolved references (" + (($missing | Sort-Object -Unique | Select-Object -First 6) -join ", ") + "). Then re-check report alignment against the listed page."
    }

    if ($usage.Level -eq "Strong match") {
        if ($usage.Source -match "Better match found outside listed page") {
            return "Change the spreadsheet Report/Page mapping to the matched page: $($usage.BestReport) / $($usage.BestPage). Keep the DAX measure and field set because it already mirrors that visual pattern."
        }
        return "No DAX change recommended. Keep the same measures and grouped fields; only live-test execution and row counts before approval."
    }

    if ($usage.Level -eq "Partial match") {
        $parts = @()
        if ($usage.Source -match "Better match found outside listed page") {
            $parts += "Change the spreadsheet Report/Page mapping to $($usage.BestReport) / $($usage.BestPage), or confirm that the listed page is intentionally different."
        }
        if ($unmatchedMeasures.Count -gt 0) {
            $parts += "Remove or justify query measure(s) not present in the closest visual: " + (($unmatchedMeasures | Select-Object -First 6) -join ", ") + "."
        }
        if ($anchorMeasures.Count -gt 0) {
            $parts += "To mirror the closest visual more tightly, use its measure set: " + (($anchorMeasures | Select-Object -First 8) -join ", ") + "."
        }
        if ($unmatchedFields.Count -gt 0) {
            $parts += "Review grouped/filter fields not found in that visual: " + (($unmatchedFields | Select-Object -First 8) -join ", ") + ". Remove them if the saved query is meant to mirror the report visual."
        }
        if ($anchorFields.Count -gt 0) {
            $parts += "Consider grouping/filtering by the closest visual fields instead: " + (($anchorFields | Select-Object -First 8) -join ", ") + "."
        }
        return ($parts -join " ")
    }

    if ($usage.Level -eq "Weak match") {
        if ($usage.BestReport) {
            $parts = @("Do not approve this as-is as report-backed. The closest visual is on $($usage.BestReport) / $($usage.BestPage), but it only shares part of the query.")
            if ($matchedMeasures.Count -gt 0) {
                $parts += "If this query should mirror that visual, keep the matched measure(s): " + (($matchedMeasures | Select-Object -First 6) -join ", ") + "."
            }
            if ($unmatchedMeasures.Count -gt 0) {
                $parts += "Remove/split out unsupported measure(s): " + (($unmatchedMeasures | Select-Object -First 8) -join ", ") + "."
            }
            if ($anchorMeasures.Count -gt 0) {
                $parts += "Use the closest visual's measure set instead: " + (($anchorMeasures | Select-Object -First 8) -join ", ") + "."
            }
            if ($unmatchedFields.Count -gt 0) {
                $parts += "Drop or justify grouped/filter fields not seen with the matched measure(s): " + (($unmatchedFields | Select-Object -First 8) -join ", ") + "."
            }
            if ($anchorFields.Count -gt 0) {
                $parts += "Use the closest visual's dimensions/filters where relevant: " + (($anchorFields | Select-Object -First 8) -join ", ") + "."
            }
            $parts += "Alternative: mark this saved query as synthetic/new and require business-owner approval."
            return ($parts -join " ")
        }
        return "No report visual uses this measure/field combination. Either split the query into smaller queries that each mirror an existing visual, or document it as a new synthetic query with explicit owner approval and expected output examples."
    }

    return "No report visual match was found. Rebuild the DAX from an existing report visual on the intended page, or remove the saved query from the production set until a report-backed owner/use case is identified."
}

function New-Issue([string]$issue, [string]$impact, [string]$fix) {
    return [pscustomobject]@{ Issue=$issue; Impact=$impact; Fix=$fix }
}

function Get-DaxIssues([string]$dax, $refs) {
    $items = @()
    if ([string]::IsNullOrWhiteSpace($dax)) {
        $items += New-Issue "The query text is blank." "There is nothing to validate or run in production." "Add the intended DAX query, then rerun this review."
        return $items
    }
    if ($dax -notmatch "(?i)\bEVALUATE\b") {
        $items += New-Issue "The query does not contain an EVALUATE statement." "Power BI DAX queries must normally start from EVALUATE to return a table; this may be a fragment rather than a runnable production query." "Wrap the intended table expression in EVALUATE, or replace the fragment with the full DAX query used by the Data Story."
    }
    if ($dax -match "(?i)\bTOPN\s*\(" -and $dax -notmatch "(?i)ORDER\s+BY") {
        $items += New-Issue "TOPN is used without a final ORDER BY." "TOPN chooses rows by its internal sort expression, but the displayed row order can still be unstable or confusing for reviewers/users." "Add an ORDER BY clause that matches the business ranking, for example ORDER BY [Measure] DESC and then a stable tie-breaker column."
    }
    if ($dax -match "(?i)TODAY\s*\(|NOW\s*\(") {
        $items += New-Issue "The query uses TODAY() or NOW()." "The answer changes depending on the refresh/run date, so two reviewers can see different outputs without any model change." "Document the rolling date rule in the description, or replace it with an explicit date/filter parameter if the story needs a fixed reporting period."
    }
    if ($dax -match "(?i)SELECTEDVALUE\s*\(") {
        $items += New-Issue "SELECTEDVALUE is used and may return blank or fallback values." "If the filter context contains multiple values, the query can silently return blank/default logic instead of the intended business segment." "Add an explicit fallback value and document it, or use a filter that guarantees a single selected value."
    }
    if ($dax -match "(?i)DISTINCTCOUNT\s*\(" -and $dax -match "(?i)SUMMARIZECOLUMNS") {
        $items += New-Issue "The query combines DISTINCTCOUNT with grouped output." "The count may be correct, but it is sensitive to the grouping grain and relationships; users may interpret it as additive when it is not." "Confirm the grain with sample rows. If users will total rows, add wording that distinct counts are non-additive or provide a separate total measure."
    }
    if ($dax -match "(?i)SUMMARIZECOLUMNS\s*\(" -and $dax -notmatch "(?i)(KEEPFILTERS|TREATAS|FILTER)\s*\(") {
        $items += New-Issue "The grouped query has no obvious explicit business filter." "It may return all-time/all-entity results when the name or report page implies a narrower context." "Confirm whether page/report filters are intentionally omitted. If not, add explicit filters for the target period, segment, status, owner, or page context."
    }
    return $items
}

function Get-MissingRefIssues($missing, $model) {
    $items = @()
    foreach ($x in ($missing | Sort-Object -Unique)) {
        if ($x -match "^table '(.+)'$") {
            $items += New-Issue "Referenced table does not exist in the selected semantic model: $($Matches[1])" "The DAX will fail at execution, or it is assigned to the wrong semantic model." "Correct the table name, switch the semantic_model value to the model that contains it, or add/provide the missing table before production approval."
        } elseif ($x -match "^column '(.+)'$") {
            $items += New-Issue "Referenced column does not exist in the selected semantic model: $($Matches[1])" "The DAX will fail, and the business grouping/filter may be pointing at an old or renamed field." "Replace the column with the current model column, or update the semantic model if this field is genuinely required."
        } elseif ($x -match "^measure \[(.+)\]$") {
            $items += New-Issue "Referenced measure does not exist in the selected semantic model: [$($Matches[1])]" "The DAX will fail, or it is using a measure name from another model/version." "Replace the measure with the current approved measure, create the missing measure through the normal model change process, or correct the semantic_model assignment."
        }
    }
    return $items
}

function New-ReviewRows {
    param($queryRows, $metadataRows, $models, $reports)
    $out = @()
    foreach ($row in $queryRows) {
        $dax = [string]$row.query
        $refs = Get-DaxRefs $dax
        $model = Choose-Model $row $models
        $missing = @()
        foreach ($t in $refs.Tables) {
            if (-not $model.Tables.Contains($t.ToLowerInvariant())) { $missing += "table '$t'" }
        }
        foreach ($c in $refs.Columns) {
            if ($c -match "^(.*?)\[(.*)\]$") {
                $refTable = $Matches[1]
                $refName = $Matches[2]
                if (-not (Test-ColumnExists $model $refTable $refName)) {
                    if ($model.Measures.Contains($refName.ToLowerInvariant())) {
                        # DAX commonly allows table-qualified measures, e.g. 'table'[measure].
                    } else {
                        $missing += "column '$c'"
                    }
                }
            }
        }
        foreach ($m in $refs.Measures) {
            if (-not $model.Measures.Contains($m.ToLowerInvariant())) {
                $isOutputAlias = $false
                if ($dax -match ('(?is)"' + [regex]::Escape($m) + '"\s*,')) { $isOutputAlias = $true }
                if ($dax -match ('(?is)ORDER\s+BY\s+.*\[' + [regex]::Escape($m) + '\]')) { $isOutputAlias = $true }
                if (-not $isOutputAlias) { $missing += "measure [$m]" }
            }
        }

        $issueItems = @()
        if ($missing.Count) { $issueItems += @(Get-MissingRefIssues $missing $model) }
        $issueItems += @(Get-DaxIssues $dax $refs)

        $ai = Get-AiScoreNotes $row $metadataRows $refs $model
        $aiIssue = Get-AiScoreIssue $row $metadataRows $refs
        if ($aiIssue) { $issueItems += $aiIssue }
        $reportIssue = Get-ReportIssue $row $reports
        if ($reportIssue) { $issueItems += $reportIssue }
        $usage = Get-ReportUsageAlignment $row $refs $reports
        $usageIssue = $null
        if ($usage.Level -eq "Strong match") {
            $usageIssue = New-Issue "Strong report-usage match found." "The saved query uses a measure/dimension combination that appears in the expected report context, so it is more trustworthy as a production query." $usage.Recommendation
        } elseif ($usage.Level -eq "Partial match") {
            $usageIssue = New-Issue "Partial report-usage match found." "The saved query shares important measures with a report visual, but the grouping/filtering is not the same. It may still be valid, but it is not a clean mirror of the report." $usage.Recommendation
            $issueItems = @($usageIssue) + $issueItems
        } elseif ($usage.Level -eq "Weak match") {
            $usageIssue = New-Issue "Weak report-usage match: measures exist but this combination is not used together in report visuals." "This suggests the query may be synthetic, exploratory, or disconnected from the report page users already trust." $usage.Recommendation
            $issueItems = @($usageIssue) + $issueItems
        } else {
            $usageIssue = New-Issue "No report-usage match found for this query." "The query appears unsupported by existing report visuals, so production approval should not rely on report context." $usage.Recommendation
            $issueItems = @($usageIssue) + $issueItems
        }
        $concreteChange = Get-ConcreteChange $usage $refs $row $missing

        $rating = "Production Ready"
        if ($usage.Level -eq "Strong match") { $rating = "Production Ready" }
        elseif ($usage.Level -eq "Partial match") { $rating = "Needs Minor Fixes" }
        elseif ($usage.Level -eq "Weak match") { $rating = "Needs Major Fixes" }
        elseif ($usage.Level -eq "No match") { $rating = "Needs Major Fixes" }
        if ($missing.Count -gt 0 -and $usage.Level -in @("Weak match","No match")) { $rating = "Needs Major Fixes" }
        elseif ($missing.Count -gt 0 -and $usage.Level -in @("Strong match","Partial match")) {
            $issueItems += New-Issue "Some model references did not resolve in static TMDL validation, but report usage was a better signal." "This may be a parser limitation, a table-qualified measure, an alias, or a real execution issue. It should not outweigh a strong visual/page match unless execution fails." "Run the DAX once. Only treat the unresolved field as a blocker if Power BI fails to execute or the referenced object is genuinely absent."
            if ($rating -eq "Production Ready") { $rating = "Needs Minor Fixes" }
        }
        if ([string]::IsNullOrWhiteSpace($dax)) { $rating = "Blocked / Cannot Validate" }
        if (-not $model) {
            $rating = "Blocked / Cannot Validate"
            $issueItems += New-Issue "No semantic model was available for this row." "References cannot be validated." "Provide or correct the semantic_model value and ensure the matching .SemanticModel folder is available in the repository."
        }

        $business = Get-BusinessConcept ([string]$row.name) ([string]$row.description) $refs
        $reportNote = Get-ReportAlignment $row $reports $refs
        $desc = [string]$row.description
        $recommendedName = ""
        $recommendedDescription = ""
        if ([string]::IsNullOrWhiteSpace([string]$row.name) -or ([string]$row.name).Length -lt 8) {
            $recommendedName = $business
        }
        if ([string]::IsNullOrWhiteSpace($desc) -or $desc.Length -lt 30) {
            $recommendedDescription = "Returns $business as a $((Summarize-Dax $dax $refs).Split(';')[0].ToLowerInvariant()) using the listed semantic model fields and measures."
        }
        $primary = if ($usageIssue) { $usageIssue } elseif ($issueItems.Count) { $issueItems[0] } else { New-Issue "No production-blocking issue found in static review." "The DAX references resolved against the selected semantic model, and no obvious static query-shape problem was detected." "Run the query against Power BI once to confirm row counts, sample values, and business owner acceptance before final approval." }
        $allIssues = ($issueItems | ForEach-Object { "Issue: $($_.Issue)`nWhy it matters: $($_.Impact)" }) -join "`n`n"
        if ([string]::IsNullOrWhiteSpace($allIssues)) { $allIssues = "No specific issue found from static validation." }
        $allFixes = ($issueItems | ForEach-Object { "Fix: $($_.Fix)" }) -join "`n`n"
        if ([string]::IsNullOrWhiteSpace($allFixes)) { $allFixes = "No DAX/model change recommended from static review. Live-test the query and confirm sample output with the business owner." }

        $out += [pscustomobject][ordered]@{
            '_sys_doc_id' = [string]$row.'_sys_doc_id'
            name = [string]$row.name
            rating = $rating
            primary_issue = $primary.Issue
            why_it_matters = $primary.Impact
            how_to_fix = $primary.Fix
            concrete_recommended_change = $concreteChange
            report_usage_alignment = $usage.Level
            expected_or_best_report_page = $usage.Source
            report_match_evidence = $usage.Evidence
            what_query_returns = (Summarize-Dax $dax $refs) + "; business concept: $business"
            model_validation = if ($missing.Count) { "Validated against $([System.IO.Path]::GetFileName($model.Path)); unresolved: " + (($missing | Sort-Object -Unique) -join ", ") } else { "Referenced tables/columns/measures found in $([System.IO.Path]::GetFileName($model.Path)) based on TMDL scan." }
            ai_score_validation = $ai
            business_alignment = "Name/description appear aligned to: $business. Report alignment: $reportNote"
            potential_issues = $allIssues
            recommended_fixes = $concreteChange + "`n`n" + $allFixes
            recommended_name = $recommendedName
            recommended_description = $recommendedDescription
            final_notes = "Static review only using workbook metadata, TMDL semantic model files, and PBIP report visual/page JSON. No model/query changes were made. Rating prioritizes report usage: Strong match = same/similar measure and dimension pattern on the listed page; Partial = same measures but different grouping/filtering; Weak = measures exist but not together in visuals; No match = unsupported by report visuals. Missing model refs are blockers only when they prevent execution or validation."
        }
    }
    return $out
}

function ConvertTo-ExcelCellRef([int]$row, [int]$col) {
    $s = ""
    while ($col -gt 0) {
        $mod = ($col - 1) % 26
        $s = [char]([int][char]'A' + $mod) + $s
        $col = [math]::Floor(($col - $mod) / 26)
    }
    return "$s$row"
}

function Escape-Xml([string]$s) {
    return [System.Security.SecurityElement]::Escape($s)
}

function Write-SimpleXlsx($rows, [string]$path) {
    if (Test-Path $path) { Remove-Item -LiteralPath $path -Force }
    $tmp = Join-Path ([System.IO.Path]::GetTempPath()) ("xlsx_" + [guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $tmp | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $tmp "_rels") | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $tmp "xl\_rels") | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $tmp "xl\worksheets") | Out-Null
    $headers = @('_sys_doc_id','name','rating','primary_issue','why_it_matters','how_to_fix','concrete_recommended_change','report_usage_alignment','expected_or_best_report_page','report_match_evidence','what_query_returns','model_validation','ai_score_validation','business_alignment','potential_issues','recommended_fixes','recommended_name','recommended_description','final_notes')
    $sheetRows = New-Object System.Text.StringBuilder
    $r = 1
    [void]$sheetRows.Append("<row r=""1"">")
    for ($c=1; $c -le $headers.Count; $c++) {
        $ref = ConvertTo-ExcelCellRef $r $c
        [void]$sheetRows.Append("<c r=""$ref"" t=""inlineStr""><is><t>$(Escape-Xml $headers[$c-1])</t></is></c>")
    }
    [void]$sheetRows.Append("</row>")
    foreach ($row in $rows) {
        $r++
        [void]$sheetRows.Append("<row r=""$r"">")
        for ($c=1; $c -le $headers.Count; $c++) {
            $h = $headers[$c-1]
            $val = [string]$row.$h
            $ref = ConvertTo-ExcelCellRef $r $c
            [void]$sheetRows.Append("<c r=""$ref"" t=""inlineStr""><is><t>$(Escape-Xml $val)</t></is></c>")
        }
        [void]$sheetRows.Append("</row>")
    }
    $lastRef = ConvertTo-ExcelCellRef ([math]::Max(1,$r)) $headers.Count
    Set-Content -LiteralPath (Join-Path $tmp "[Content_Types].xml") -Encoding UTF8 -Value '<?xml version="1.0" encoding="UTF-8"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/><Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/></Types>'
    Set-Content -LiteralPath (Join-Path $tmp "_rels\.rels") -Encoding UTF8 -Value '<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/></Relationships>'
    Set-Content -LiteralPath (Join-Path $tmp "xl\workbook.xml") -Encoding UTF8 -Value '<?xml version="1.0" encoding="UTF-8"?><workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><sheets><sheet name="Review" sheetId="1" r:id="rId1"/></sheets></workbook>'
    Set-Content -LiteralPath (Join-Path $tmp "xl\_rels\workbook.xml.rels") -Encoding UTF8 -Value '<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/></Relationships>'
    $sheetXml = '<?xml version="1.0" encoding="UTF-8"?><worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><dimension ref="A1:' + $lastRef + '"/><sheetViews><sheetView workbookViewId="0"/></sheetViews><sheetFormatPr defaultRowHeight="15"/><cols>' +
        '<col min="1" max="2" width="24" customWidth="1"/><col min="3" max="3" width="22" customWidth="1"/><col min="4" max="10" width="65" customWidth="1"/><col min="11" max="19" width="55" customWidth="1"/></cols><sheetData>' +
        $sheetRows.ToString() + '</sheetData></worksheet>'
    Set-Content -LiteralPath (Join-Path $tmp "xl\worksheets\sheet1.xml") -Encoding UTF8 -Value $sheetXml
    $zip = [System.IO.Compression.ZipFile]::Open($path, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        foreach ($file in Get-ChildItem -Path $tmp -Recurse -File) {
            $rel = $file.FullName.Substring($tmp.Length + 1).Replace("\", "/")
            [void][System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $file.FullName, $rel, [System.IO.Compression.CompressionLevel]::Optimal)
        }
    } finally {
        $zip.Dispose()
    }
    Remove-Item -LiteralPath $tmp -Recurse -Force
}

$workbook = Read-XlsxWorkbook $QueriesPath
$queryRows = @($workbook.Values | Select-Object -First 1)
if ($queryRows.Count -eq 1 -and $queryRows[0] -is [array]) { $queryRows = $queryRows[0] }
$metadataWorkbook = Read-XlsxWorkbook $AiScoresPath
$metadataRows = @()
foreach ($v in $metadataWorkbook.Values) { $metadataRows += @($v) }
$srcRoot = Join-Path $RepoRoot "powerbi\src"
$models = @(Get-ChildItem -Path $srcRoot -Directory -Filter "*.SemanticModel" | ForEach-Object { Get-TmdlModelIndex $_.FullName })
$interestingProps = New-Object System.Collections.Generic.HashSet[string]
$skipProps = @('date','year','month','quarter','name','id','key','split','value','count','total','status','type','category','amount','currency_convert')
foreach ($qr in $queryRows) {
    $rr = Get-DaxRefs ([string]$qr.query)
    foreach ($m in $rr.Measures) {
        if ($m) {
            $nm = Normalize-Name $m
            if ($nm.Length -ge 6 -and $skipProps -notcontains $nm) { [void]$interestingProps.Add($m); [void]$interestingProps.Add($nm) }
        }
    }
    foreach ($c in $rr.Columns) {
        if ($c -match '^(.*?)\[(.*)\]$') {
            $prop = $Matches[2]
            $np = Normalize-Name $prop
            if ($np.Length -ge 6 -and $skipProps -notcontains $np) {
                [void]$interestingProps.Add($prop)
                [void]$interestingProps.Add($np)
            }
        }
    }
}
$reports = Get-ReportIndex $srcRoot @($interestingProps)
$reviewRows = New-ReviewRows $queryRows $metadataRows $models $reports
Write-SimpleXlsx $reviewRows $OutPath

[pscustomobject]@{
    QueryRows = $queryRows.Count
    MetadataRows = $metadataRows.Count
    Models = ($models | ForEach-Object { [System.IO.Path]::GetFileName($_.Path) }) -join "; "
    Output = $OutPath
} | Format-List
