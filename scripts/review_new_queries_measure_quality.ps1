param(
    [string]$QueriesPath = "C:\Users\filip\OneDrive\Desktop\New Queries.xlsx",
    [string]$AiScoresPath = "C:\Users\filip\Downloads\metadata_ai_scores.xlsx",
    [string]$RepoRoot = (Resolve-Path ".").Path,
    [string]$OutPath = (Join-Path (Resolve-Path ".").Path "New Queries - Primary DAX Real Measure Filter Analysis.xlsx")
)

Add-Type -AssemblyName System.IO.Compression.FileSystem

function Convert-ColRefToIndex([string]$ref) {
    $letters = ($ref -replace '[^A-Z]', '')
    $n = 0
    foreach ($ch in $letters.ToCharArray()) { $n = ($n * 26) + ([int][char]$ch - [int][char]'A' + 1) }
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
        foreach ($rel in $rels.Relationships.Relationship) { $relMap[$rel.Id] = "xl/" + ([string]$rel.Target).TrimStart("/") }
        $result = @{}
        foreach ($sheet in $wb.workbook.sheets.sheet) {
            $rid = $sheet.GetAttribute("id", "http://schemas.openxmlformats.org/officeDocument/2006/relationships")
            [xml]$sheetXml = Get-ZipText $zip $relMap[$rid]
            $rows = @()
            foreach ($row in $sheetXml.worksheet.sheetData.row) {
                $values = @{}
                foreach ($c in $row.c) {
                    $idx = Convert-ColRefToIndex $c.r
                    $v = [string]$c.v
                    if ($c.t -eq "s" -and $v -ne "") { $v = $shared[[int]$v] }
                    elseif ($c.t -eq "inlineStr") { $v = [string]$c.is.t }
                    $values[$idx] = $v
                }
                $rows += ,$values
            }
            if ($rows.Count -eq 0) { $result[[string]$sheet.name] = @(); continue }
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
                if (($obj.Values | Where-Object { -not [string]::IsNullOrWhiteSpace([string]$_) }).Count -gt 0) { $objects += [pscustomobject]$obj }
            }
            $result[[string]$sheet.name] = $objects
        }
        return $result
    } finally { $zip.Dispose() }
}

function Normalize-Name([string]$s) {
    if ($null -eq $s) { return "" }
    return (($s.ToLowerInvariant() -replace '^meas[._]','') -replace '[^a-z0-9]+','_').Trim('_')
}

function Get-Tokens([string]$s) {
    $stop = @('meas','measure','trueai','sys','doc','id','sum','avg','average','num','value','date','year','month','quarter','current','selected','filter','string','query','name','description','provides','returns','supports','common','questions','show','which','what','where','when','from','with','between','over','time','the','and','for','are','does','how','more','less','than','into','using')
    return @((Normalize-Name $s).Split('_') | Where-Object { $_.Length -ge 3 -and $stop -notcontains $_ } | Select-Object -Unique)
}

function Get-DaxRefs([string]$dax) {
    $tables = New-Object System.Collections.Generic.HashSet[string]
    $columns = New-Object System.Collections.Generic.List[string]
    $measures = New-Object System.Collections.Generic.HashSet[string]
    foreach ($m in [regex]::Matches($dax, "'([^']+)'\s*\[([^\]]+)\]")) {
        [void]$tables.Add($m.Groups[1].Value)
        $name = $m.Groups[2].Value.Trim()
        if ($name -match '^(?i)(meas\.|measure_|meas_)') { [void]$measures.Add($name) } else { $columns.Add($m.Groups[1].Value + "[" + $name + "]") }
    }
    foreach ($m in [regex]::Matches($dax, "(?<!')\b([A-Za-z_][A-Za-z0-9_]*)\s*\[([^\]]+)\]")) {
        [void]$tables.Add($m.Groups[1].Value.Trim())
        $name = $m.Groups[2].Value.Trim()
        if ($name -match '^(?i)(meas\.|measure_|meas_)') { [void]$measures.Add($name) } else { $columns.Add($m.Groups[1].Value.Trim() + "[" + $name + "]") }
    }
    foreach ($m in [regex]::Matches($dax, "(?<![A-Za-z0-9_'])\[([^\]]+)\]")) {
        $name = $m.Groups[1].Value.Trim()
        if ($dax -match ('(?is)"' + [regex]::Escape($name) + '"\s*,')) { continue }
        [void]$measures.Add($name)
    }
    return [pscustomobject]@{ Tables=@($tables); Columns=@($columns | Sort-Object -Unique); Measures=@($measures | Sort-Object -Unique) }
}

function Read-ModelMeasures([string]$srcRoot) {
    $measures = @{}
    foreach ($model in Get-ChildItem -Path $srcRoot -Directory -Filter "*.SemanticModel") {
        foreach ($file in Get-ChildItem -Path (Join-Path $model.FullName "definition\tables") -Filter *.tmdl -File -ErrorAction SilentlyContinue) {
            $table = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
            $lines = Get-Content -LiteralPath $file.FullName
            for ($i=0; $i -lt $lines.Count; $i++) {
                if ($lines[$i] -match "^\s*measure\s+'?([^'=]+)'?\s*=" -or $lines[$i] -match "^\s*measure\s+'?([^'\r\n]+)'?\s*$") {
                    $name = $Matches[1].Trim()
                    $comments = @()
                    for ($j=$i-1; $j -ge 0 -and $j -ge $i-8; $j--) {
                        if ($lines[$j] -match '^\s*///\s*(.*)') { $comments = @($Matches[1].Trim()) + $comments }
                        elseif ([string]::IsNullOrWhiteSpace($lines[$j])) { continue }
                        else { break }
                    }
                    $block = @($lines[$i])
                    for ($k=$i+1; $k -lt $lines.Count -and $k -lt $i+80; $k++) {
                        if ($lines[$k] -match '^\s*(measure|column|partition|hierarchy)\s') { break }
                        $block += $lines[$k]
                    }
                    $text = $block -join "`n"
                    $folder = if ($text -match 'displayFolder:\s*(.+)') { $Matches[1].Trim() } else { "" }
                    $format = if ($text -match 'formatString:\s*(.+)') { $Matches[1].Trim() } else { "" }
                    $isHelper = ($comments -join " ") -match 'AI_EXCLUDE|helper|internal reuse|field-pass-through' -or $folder -match 'helper|_filter|_date|debug'
                    $key = (Normalize-Name $name)
                    $measures[$key] = [pscustomobject]@{
                        Name=$name; Table=$table; Model=$model.Name; Comments=($comments -join " ");
                        Folder=$folder; Format=$format; IsHelper=[bool]$isHelper; Text=$text; Tokens=(Get-Tokens ($name + " " + ($comments -join " ") + " " + $folder))
                    }
                }
            }
        }
    }
    return $measures
}

function Get-MeasureByName($measureIndex, [string]$name) {
    $key = Normalize-Name $name
    if ($measureIndex.ContainsKey($key)) { return $measureIndex[$key] }
    return $null
}

function Get-MetricType([string]$name) {
    $n = Normalize-Name $name
    if ($n -match 'rate|ratio|pct|percent|win_rate|success_rate|conversion|penetration|lift') { return "rate" }
    if ($n -match 'count|headcount|deals|opps|leads|records|distinct') { return "count" }
    if ($n -match 'amt|amount|bookings|revenue|price|pipeline|arr|nrr|churn|acv|value') { return "amount" }
    if ($n -match 'hours|duration|time|days|age') { return "duration" }
    if ($n -match 'score|prediction|propensity|readiness|confidence|quality') { return "score" }
    return "other"
}

function Test-MeasureCompatible([string]$currentName, $candidate, [string]$businessText) {
    $curType = Get-MetricType $currentName
    $candType = Get-MetricType $candidate.Name
    if ($curType -ne "other" -and $candType -ne "other" -and $curType -ne $candType) { return $false }
    $candNorm = Normalize-Name $candidate.Name
    $bizNorm = Normalize-Name $businessText
    foreach ($token in @('sply','prior','previous','yoy','growth','delta','variance','change')) {
        if ($candNorm -match "(^|_)$token($|_)" -and $bizNorm -notmatch "(^|_)$token($|_)") { return $false }
    }
    foreach ($token in @('new_logo','existing','expansion','churned','prospecting','open','won','lost')) {
        if ($candNorm -match $token -and (Normalize-Name $currentName) -notmatch $token -and $bizNorm -notmatch $token) { return $false }
    }
    return $true
}

function Build-MeasureTokenIndex($measureIndex) {
    $idx = @{}
    foreach ($m in $measureIndex.Values) {
        foreach ($t in $m.Tokens) {
            if (-not $idx.ContainsKey($t)) { $idx[$t] = [System.Collections.ArrayList]::new() }
            [void]$idx[$t].Add($m)
        }
    }
    return $idx
}

function Find-Alternatives($measureIndex, $tokenIndex, [string]$measureName, [string]$businessText) {
    $curKey = Normalize-Name $measureName
    $tokens = @(Get-Tokens ($measureName + " " + $businessText))
    if ($tokens.Count -eq 0) { return @() }
    $rows = @()
    $candidateSet = @{}
    foreach ($t in $tokens) {
        if ($tokenIndex.ContainsKey($t)) {
            foreach ($m in $tokenIndex[$t]) { $candidateSet[(Normalize-Name $m.Name)] = $m }
        }
    }
    $candidatePool = @($candidateSet.Values | Select-Object -First 250)
    foreach ($m in $candidatePool) {
        $key = Normalize-Name $m.Name
        if ($key -eq $curKey) { continue }
        if (-not (Test-MeasureCompatible $measureName $m $businessText)) { continue }
        $hits = @($tokens | Where-Object { $m.Tokens -contains $_ })
        if ($hits.Count -eq 0) { continue }
        $score = $hits.Count * 10
        if (-not $m.IsHelper) { $score += 8 } else { $score -= 12 }
        if ($m.Comments -match 'Purpose:|Calculation Logic:|Dynamic Behavior:|Format/Type:') { $score += 6 }
        if ($m.Name -match 'data_story|agentic|summary|readiness|score') { $score += 4 }
        if ($m.Name -match 'threshold|active|won|open|new_logo|churn|pipeline|bookings|revenue|success') { $score += 3 }
        if ((Normalize-Name $m.Name) -match 'sply|prior|previous|yoy|delta|variance' -and (Normalize-Name $businessText) -notmatch 'sply|prior|previous|yoy|delta|variance') { $score -= 30 }
        $rows += [pscustomobject]@{ Measure=$m; Score=$score; Hits=($hits -join ", ") }
    }
    return @($rows | Sort-Object Score -Descending | Select-Object -First 5)
}

function Get-BusinessQuestion($row, $refs) {
    $name = [string]$row.name
    $desc = [string]$row.description
    if ($desc.Length -gt 20 -and $desc -notmatch '^(?i)\s*(meas\.|measure\.|\[|CALCULATE|SUMMARIZECOLUMNS|EVALUATE)') { return $desc }
    $meas = if ($refs.Measures.Count) { " using " + (($refs.Measures | Select-Object -First 4) -join ", ") } else { "" }
    $dims = if ($refs.Columns.Count) { " by " + (($refs.Columns | Select-Object -First 4) -join ", ") } else { "" }
    return "Answers the business question implied by '$name'$meas$dims."
}

function Get-FilterAdvice([string]$dax, $row, $refs) {
    $nameDesc = (([string]$row.name) + " " + ([string]$row.description)).ToLowerInvariant()
    $missing = @()
    $recs = @()
    if ($nameDesc -match 'annual|year|yoy|fy|fiscal|quarter|month|period|trend' -and $dax -notmatch '(cal_end_dates|cal_start_dates|TimePeriod|DateRanges|DATESINPERIOD|DATEADD)') {
        $missing += "Date/period filter is not explicit."
        $recs += "Add the model's standard date context, preferably `cal_end_dates[Date]` / `cal_end_dates[Year]` or the relevant TimePeriod calculation-group filter used by the report, so the query does not return all-time results."
    }
    if ($nameDesc -match 'open pipeline|open opp|active' -and $dax -notmatch '(is_open|open|active|status)') {
        $missing += "Open/active-status filter is not explicit."
        $recs += "Add the model's open/active status filter for the entity being counted; otherwise closed/inactive records may be included."
    }
    if ($nameDesc -match 'won|bookings|closed won' -and $dax -notmatch 'trueai_is_won|is_won|won') {
        $missing += "Won/bookings filter is not explicit."
        $recs += "Add the standardized won/bookings filter, for example `opps[trueai_is_won] = TRUE()` when the business question is closed-won bookings."
    }
    if ($dax -match '(DIVIDE|/)' -and $dax -notmatch '(NOT\s+ISBLANK|ISBLANK|<> BLANK|REMOVEFILTERS)') {
        $missing += "Blank/zero denominator handling is not obvious at query level."
        $recs += "Prefer a standardized rate/ratio measure that already handles blanks, or add explicit blank filtering to avoid misleading rows."
    }
    if ($missing.Count -eq 0) { $missing = @("No obvious missing filter from static review.") }
    if ($recs.Count -eq 0) { $recs = @("No filter change recommended unless business owner requires a narrower period/status/scope.") }
    return [pscustomobject]@{ Missing=($missing -join " "); Recommendations=($recs -join " ") }
}

function Get-AiAdvice($row, $refs, $metadataRows, $measureIndex, [string]$businessText) {
    $listed = @()
    foreach ($n in 1..5) { $v = [string]$row.("ai_score_$n"); if (-not [string]::IsNullOrWhiteSpace($v)) { $listed += $v } }
    $scoreLike = @($refs.Columns + $refs.Measures | Where-Object { $_ -match '(?i)score|prediction|propensity|likelihood|trueai' })
    $analysis = @()
    if ($listed.Count) { $analysis += "Listed AI scores: " + (($listed | Select-Object -Unique) -join ", ") + "." } else { $analysis += "No ai_score_1..5 metadata values are listed." }
    if ($scoreLike.Count) { $analysis += "DAX uses score-like fields/measures: " + (($scoreLike | Select-Object -Unique) -join ", ") + "." }
    else { $analysis += "DAX does not visibly use an AI score field/measure." }
    $better = @("No better AI score recommended from static review. Keep the listed AI score metadata unless a business owner confirms a different canonical score from metadata_ai_scores.xlsx.")
    return [pscustomobject]@{ Analysis=($analysis -join " "); Better=($better -join ", ") }
}

function Get-PageMap([string]$srcRoot) {
    $map = @{}
    foreach ($report in Get-ChildItem -Path $srcRoot -Directory -Filter "*.Report" -ErrorAction SilentlyContinue) {
        foreach ($pageDir in Get-ChildItem -Path (Join-Path $report.FullName "definition\pages") -Directory -ErrorAction SilentlyContinue) {
            $pageName = $pageDir.Name
            $pageJson = Join-Path $pageDir.FullName "page.json"
            if (Test-Path $pageJson) {
                try {
                    $pj = Get-Content -Raw -LiteralPath $pageJson | ConvertFrom-Json
                    if ($pj.displayName) { $pageName = $pj.displayName }
                } catch {}
            }
            $map[$pageDir.FullName.ToLowerInvariant()] = [pscustomobject]@{
                Report = $report.BaseName
                Page = $pageName
            }
        }
    }
    return $map
}

function Get-VisualPageFromPath([string]$visualPath, $pageMap) {
    $visualDir = Split-Path -Parent $visualPath
    $visualsDir = Split-Path -Parent $visualDir
    $pageDir = Split-Path -Parent $visualsDir
    $key = $pageDir.ToLowerInvariant()
    if ($pageMap.ContainsKey($key)) { return $pageMap[$key] }
    return $null
}

function Build-ReportUsageIndex([string]$srcRoot, [string[]]$measureNames) {
    $pageMap = Get-PageMap $srcRoot
    $idx = @{}
    $rg = Get-Command rg -ErrorAction SilentlyContinue
    foreach ($measure in ($measureNames | Where-Object { $_ } | Select-Object -Unique)) {
        $mKey = Normalize-Name $measure
        $idx[$mKey] = [System.Collections.ArrayList]::new()
        if (-not $rg) { continue }
        $lines = & rg -F $measure $srcRoot -g visual.json --no-heading --line-number 2>$null
        foreach ($line in $lines) {
            if ($line -notmatch '^(.*visual\.json):\d+:') { continue }
            $path = $Matches[1]
            $page = Get-VisualPageFromPath $path $pageMap
            if (-not $page) { continue }
            $visualId = Split-Path -Leaf (Split-Path -Parent $path)
            [void]$idx[$mKey].Add([pscustomobject]@{
                Report = $page.Report
                Page = $page.Page
                Visual = $visualId
            })
        }
    }
    return $idx
}

function Summarize-MeasureUsage($measureUsageIndex, [string[]]$measures) {
    $parts = @()
    foreach ($m in ($measures | Where-Object { $_ } | Select-Object -Unique)) {
        $key = Normalize-Name $m
        $hits = if ($measureUsageIndex.ContainsKey($key)) { @($measureUsageIndex[$key]) } else { @() }
        if ($hits.Count -eq 0) {
            $parts += "[$m]: not found in report visual JSON by exact measure-name scan."
        } else {
            $pages = @($hits | ForEach-Object { "$($_.Report) / $($_.Page)" } | Select-Object -Unique | Select-Object -First 5)
            $parts += "[$m]: used in $($hits.Count) visual reference(s); pages: " + ($pages -join "; ")
        }
    }
    if ($parts.Count -eq 0) { return "No explicit model measures detected, so report measure usage could not be assessed." }
    return $parts -join "`n"
}

function Get-FilterEvidence([string]$dax) {
    $items = @()
    foreach ($m in [regex]::Matches($dax, "(?is)TREATAS\s*\((.{0,250}?)\)")) {
        $items += "TREATAS(" + (($m.Groups[1].Value -replace '\s+',' ').Trim()) + ")"
    }
    foreach ($m in [regex]::Matches($dax, "(?is)KEEPFILTERS\s*\((.{0,250}?)\)")) {
        $items += "KEEPFILTERS(" + (($m.Groups[1].Value -replace '\s+',' ').Trim()) + ")"
    }
    foreach ($m in [regex]::Matches($dax, "(?i)'?([A-Za-z_][A-Za-z0-9_ ]*)'?\[([^\]]+)\]\s*(=|<>|IN)\s*([^,\)\r\n]+)")) {
        $items += "$($m.Groups[1].Value.Trim())[$($m.Groups[2].Value.Trim())] $($m.Groups[3].Value) $($m.Groups[4].Value.Trim())"
    }
    foreach ($fn in @("REMOVEFILTERS","ALL","ALLSELECTED","DATESINPERIOD","DATEADD","TOPN","ORDER BY")) {
        if ($dax -match ("(?i)\b" + [regex]::Escape($fn) + "\b")) { $items += "Uses $fn" }
    }
    if ($items.Count -eq 0) { return "No explicit filter clauses detected beyond grouping context." }
    return ($items | Select-Object -Unique) -join "`n"
}

function Get-RealFilterReview([string]$dax, $row, $refs) {
    $nameDesc = (([string]$row.name) + " " + ([string]$row.description)).ToLowerInvariant()
    $issues = @()
    $fixes = @()

    $hasDate = $dax -match '(?i)(cal_end_dates|cal_start_dates|DateRanges|TimePeriod|DATESINPERIOD|DATEADD|MTD|QTD|YTD|SPLY|Year\])'
    $hasWon = $dax -match '(?i)(trueai_is_won|is_won|won)'
    $hasOpen = $dax -match '(?i)(is_open|open_pipeline|open|stage|status)'
    $hasMaster = $dax -match '(?i)(trueai_ssr_is_master|is_master|master)'
    $hasTopOrder = $dax -match '(?is)TOPN\s*\(' -and $dax -match '(?i)ORDER\s+BY'

    if ($nameDesc -match 'mtd|qtd|ytd|sply|rolling|period|trend|annual|year' -and -not $hasDate) {
        $issues += "The business question is period-based, but the DAX does not show an explicit date/calendar/calculation-group filter."
        $fixes += "Add the same date logic used by the production report, e.g. `cal_end_dates[Date]`/`cal_end_dates[Year]` or the applicable TimePeriod calculation-group filter. Without this, the query can drift into all-time output."
    }
    if ($nameDesc -match 'bookings|won|win rate|closed won|revenue' -and -not $hasWon) {
        $issues += "The business question depends on won/booking logic, but the query does not visibly apply a won filter."
        $fixes += "Confirm that the selected measure already enforces won logic. If not, add the standardized won filter such as `opps[trueai_is_won] = TRUE()` or use a measure whose definition already applies it."
    }
    if ($nameDesc -match 'open pipeline|open opp|untouched/open|open leads' -and -not $hasOpen) {
        $issues += "The business question is about open records, but the DAX does not visibly apply an open/status filter."
        $fixes += "Add the model's approved open/status filter for the entity in scope, or switch to a measure that already restricts to open pipeline/leads."
    }
    if ($nameDesc -match 'master records|master' -and -not $hasMaster) {
        $issues += "The description mentions master records, but master-record filtering is not visible."
        $fixes += "Add/keep the standard master-record filter, e.g. `ssr[trueai_ssr_is_master] = TRUE()` where applicable."
    }
    if ($nameDesc -match 'top|bottom|rank|pareto' -and $dax -match '(?is)TOPN\s*\(' -and -not $hasTopOrder) {
        $issues += "The query ranks rows with TOPN but does not include a final ORDER BY."
        $fixes += "Add final `ORDER BY` on the ranking measure and a stable tie-breaker so production output is deterministic."
    }
    if ($dax -match '(?i)DISTINCTCOUNT\s*\(' -and $dax -match '(?i)SUMMARIZECOLUMNS') {
        $issues += "DISTINCTCOUNT is used in grouped output; totals may be non-additive across groups."
        $fixes += "Keep only if the grouped grain is intended. Add reviewer note or use a standardized distinct-count measure if one exists for the entity."
    }
    if ($issues.Count -eq 0) { $issues += "Visible filters are broadly consistent with the query name/description from static review." }
    if ($fixes.Count -eq 0) { $fixes += "No concrete filter change recommended from static DAX review; validate against the report page context and sample output." }
    return [pscustomobject]@{ Issues=($issues -join " "); Fixes=($fixes -join " ") }
}

function Get-MeasureEvidence($measureIndex, $measureUsageIndex, [string[]]$currentMeasures) {
    $parts = @()
    foreach ($cm in ($currentMeasures | Where-Object { $_ } | Select-Object -Unique)) {
        $m = Get-MeasureByName $measureIndex $cm
        if ($m) {
            $usage = if ($measureUsageIndex.ContainsKey((Normalize-Name $cm))) { @($measureUsageIndex[(Normalize-Name $cm)]).Count } else { 0 }
            $flags = @()
            if ($m.IsHelper) { $flags += "helper/internal" } else { $flags += "production-visible" }
            if ($m.Folder) { $flags += "folder=$($m.Folder)" }
            if ($m.Comments) { $flags += "doc=$($m.Comments.Substring(0, [Math]::Min(180, $m.Comments.Length)))" }
            $parts += "[$cm] exists in $($m.Model) table $($m.Table); $($flags -join '; '); exact report visual refs=$usage."
        } else {
            $parts += "[$cm] was not resolved as a semantic-model measure; it may be a query alias, table-qualified reference not parsed cleanly, or stale/unavailable measure."
        }
    }
    if ($parts.Count -eq 0) { return "No explicit semantic-model measures detected." }
    return $parts -join "`n"
}

function New-ReviewRows($queryRows, $metadataRows, $measureIndex, $tokenIndex, $measureUsageIndex) {
    $out = @()
    $rowNum = 0
    $altCache = @{}
    foreach ($row in $queryRows) {
        $rowNum++
        Write-Host "Reviewing row $rowNum / $($queryRows.Count): $($row.name)"
        $dax = [string]$row.query
        $refs = Get-DaxRefs $dax
        $businessQuestion = Get-BusinessQuestion $row $refs
        $businessText = ([string]$row.name) + " " + ([string]$row.description) + " " + $businessQuestion
        $currentMeasures = @($refs.Measures | Select-Object -Unique)
        $measureAnalyses = @()
        $recommended = @()
        $specificChanges = @()
        foreach ($cm in $currentMeasures) {
            $cur = Get-MeasureByName $measureIndex $cm
            if ($cur -and -not $cur.IsHelper) {
                $measureAnalyses += "[$cm] is a semantic-model measure and is not flagged as helper/internal. No replacement is recommended from static review; judge it by its definition, report usage, and whether the surrounding query filters match the business question."
                $recommended += "[$cm] (keep)"
            } elseif ($cur) {
                $tag = if ($cur.IsHelper) { "It is flagged as helper/internal. No exact, safe production replacement was identified automatically; do not substitute a fuzzy-similar measure without business validation." } else { "No better semantic-model measure was found." }
                $measureAnalyses += "[$cm]: $tag"
                $recommended += if ($cur.IsHelper) { "Validate [$cm]; replace only with an exact business-approved production measure" } else { "[$cm] (keep, but confirm owner intent)" }
                if ($cur.IsHelper) {
                    $specificChanges += "Do not approve helper/internal measure [$cm] in Primary DAX without owner validation. Either replace it with the exact business-facing KPI measure used in reports, or document why this helper measure is intentionally exposed."
                }
            } else {
                $measureAnalyses += "[$cm] was not resolved as a model measure in this static measure index; validate whether it is an output alias, table-qualified measure, or stale reference."
                $recommended += "Validate [$cm]"
                $specificChanges += "Validate [$cm] manually. If it is intended as a model measure, replace it with the exact approved semantic-model measure with the same business definition; if it is only a query alias, leave it as alias text."
            }
        }
        if ($currentMeasures.Count -eq 0) {
            $measureAnalyses += "No explicit measures were detected; query may rely on raw columns/aggregations."
            $recommended += "Prefer a semantic-model measure over raw aggregation when a business KPI is being reported."
            $specificChanges += "Replace raw aggregations with approved measures from the semantic model for the same business concept."
        }
        $filter = Get-FilterAdvice $dax $row $refs
        $realFilter = Get-RealFilterReview $dax $row $refs
        $filterEvidence = Get-FilterEvidence $dax
        $measureEvidence = Get-MeasureEvidence $measureIndex $measureUsageIndex $currentMeasures
        $reportUsage = Summarize-MeasureUsage $measureUsageIndex $currentMeasures
        $ai = Get-AiAdvice $row $refs $metadataRows $measureIndex $businessText
        $logic = @()
        if ($dax -match '(?i)DISTINCTCOUNT\s*\(') { $logic += "Uses DISTINCTCOUNT; confirm the grouped grain is non-additive and matches the business entity being counted." }
        if ($dax -match '(?i)TOPN\s*\(' -and $dax -notmatch '(?i)ORDER\s+BY') { $logic += "Uses TOPN without final ORDER BY; add ORDER BY for stable production output." }
        if ($dax -match '(?i)SUMMARIZECOLUMNS\s*\(') { $logic += "Returns grouped table output; grouped fields should match the business question and not mix unrelated entity grains." }
        if ($logic.Count -eq 0) { $logic += "DAX shape is reasonable from static review; main quality decision is whether the chosen measures are the best semantic-model measures." }
        if ($specificChanges.Count -eq 0) { $specificChanges += "No measure replacement recommended. Use current measures unless live execution or business-owner validation proves the measure definition is wrong." }
        if ($realFilter.Fixes -notmatch '^No concrete filter change') { $specificChanges += $realFilter.Fixes }
        $usedCounts = @($currentMeasures | ForEach-Object { if ($measureUsageIndex.ContainsKey((Normalize-Name $_))) { @($measureUsageIndex[(Normalize-Name $_)]).Count } else { 0 } })
        $anyReportUse = ($usedCounts | Where-Object { $_ -gt 0 } | Measure-Object).Count -gt 0
        $priority = if (($specificChanges -join " ") -match '\bReplace\s+\[|raw aggregations|TOPN|date logic|won filter|open/status|master-record|DISTINCTCOUNT') { "Medium" } elseif (-not $anyReportUse -and $currentMeasures.Count -gt 0) { "Medium" } else { "Low" }
        $confidence = if ($currentMeasures.Count -gt 0 -and ($measureAnalyses -join " ") -notmatch 'not resolved') { "Medium" } else { "Low" }
        $assessment = if (-not $anyReportUse -and $currentMeasures.Count -gt 0) { "Measure(s) exist but were not found in report visuals by exact scan; validate whether this Primary DAX is report-backed or intentionally new." } elseif ($priority -eq "Medium") { "Needs targeted measure/filter validation before production approval." } else { "Measures and visible filters appear reasonable from static review; live-test output and owner acceptance." }
        $out += [pscustomobject][ordered]@{
            '_sys_doc_id' = [string]$row.'_sys_doc_id'
            name = [string]$row.name
            business_question = $businessQuestion
            current_measures_used = if ($currentMeasures.Count) { ($currentMeasures -join ", ") } else { "No explicit measures detected" }
            measure_evidence = $measureEvidence
            report_usage_evidence = $reportUsage
            recommended_measures = ($recommended | Select-Object -Unique) -join "`n"
            measure_analysis = ($measureAnalyses -join "`n")
            filters_detected = $filterEvidence
            filter_logic_review = $realFilter.Issues
            filter_recommendations = $realFilter.Fixes
            ai_score_analysis = $ai.Analysis
            better_ai_scores = $ai.Better
            business_logic_review = ($logic -join " ")
            specific_dax_changes = ($specificChanges | Select-Object -Unique) -join "`n"
            expected_business_impact = if ($priority -eq "Medium") { "Reduces risk of approving a query whose measures are not report-used or whose filters do not match the stated business question." } else { "Keeps the Primary DAX aligned to existing semantic-model measures while requiring normal live-output validation." }
            confidence = $confidence
            priority = $priority
            overall_assessment = $assessment
        }
    }
    return $out
}

function ConvertTo-ExcelCellRef([int]$row, [int]$col) {
    $s = ""
    while ($col -gt 0) { $mod = ($col - 1) % 26; $s = [char]([int][char]'A' + $mod) + $s; $col = [math]::Floor(($col - $mod) / 26) }
    return "$s$row"
}

function Escape-Xml([string]$s) { return [System.Security.SecurityElement]::Escape($s) }

function Write-SimpleXlsx($rows, [string]$path) {
    if (Test-Path $path) { Remove-Item -LiteralPath $path -Force }
    $tmp = Join-Path ([System.IO.Path]::GetTempPath()) ("xlsx_" + [guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $tmp | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $tmp "_rels") | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $tmp "xl\_rels") | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $tmp "xl\worksheets") | Out-Null
    $headers = @('_sys_doc_id','name','business_question','current_measures_used','measure_evidence','report_usage_evidence','recommended_measures','measure_analysis','filters_detected','filter_logic_review','filter_recommendations','ai_score_analysis','better_ai_scores','business_logic_review','specific_dax_changes','expected_business_impact','confidence','priority','overall_assessment')
    $sheetRows = New-Object System.Text.StringBuilder
    [void]$sheetRows.Append('<row r="1">')
    for ($c=1; $c -le $headers.Count; $c++) { $ref = ConvertTo-ExcelCellRef 1 $c; [void]$sheetRows.Append("<c r=""$ref"" t=""inlineStr""><is><t>$(Escape-Xml $headers[$c-1])</t></is></c>") }
    [void]$sheetRows.Append('</row>')
    $r = 1
    foreach ($row in $rows) {
        $r++; [void]$sheetRows.Append("<row r=""$r"">")
        for ($c=1; $c -le $headers.Count; $c++) { $h=$headers[$c-1]; $ref=ConvertTo-ExcelCellRef $r $c; [void]$sheetRows.Append("<c r=""$ref"" t=""inlineStr""><is><t>$(Escape-Xml ([string]$row.$h))</t></is></c>") }
        [void]$sheetRows.Append('</row>')
    }
    $lastRef = ConvertTo-ExcelCellRef ([math]::Max(1,$r)) $headers.Count
    Set-Content -LiteralPath (Join-Path $tmp "[Content_Types].xml") -Encoding UTF8 -Value '<?xml version="1.0" encoding="UTF-8"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/><Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/></Types>'
    Set-Content -LiteralPath (Join-Path $tmp "_rels\.rels") -Encoding UTF8 -Value '<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/></Relationships>'
    Set-Content -LiteralPath (Join-Path $tmp "xl\workbook.xml") -Encoding UTF8 -Value '<?xml version="1.0" encoding="UTF-8"?><workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><sheets><sheet name="Measure Quality Review" sheetId="1" r:id="rId1"/></sheets></workbook>'
    Set-Content -LiteralPath (Join-Path $tmp "xl\_rels\workbook.xml.rels") -Encoding UTF8 -Value '<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/></Relationships>'
    $sheetXml = '<?xml version="1.0" encoding="UTF-8"?><worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><dimension ref="A1:' + $lastRef + '"/><sheetViews><sheetView workbookViewId="0"/></sheetViews><sheetFormatPr defaultRowHeight="15"/><cols><col min="1" max="2" width="25" customWidth="1"/><col min="3" max="16" width="62" customWidth="1"/><col min="17" max="19" width="22" customWidth="1"/></cols><sheetData>' + $sheetRows.ToString() + '</sheetData></worksheet>'
    Set-Content -LiteralPath (Join-Path $tmp "xl\worksheets\sheet1.xml") -Encoding UTF8 -Value $sheetXml
    $zip = [System.IO.Compression.ZipFile]::Open($path, [System.IO.Compression.ZipArchiveMode]::Create)
    try { foreach ($file in Get-ChildItem -Path $tmp -Recurse -File) { $rel=$file.FullName.Substring($tmp.Length+1).Replace("\","/"); [void][System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip,$file.FullName,$rel,[System.IO.Compression.CompressionLevel]::Optimal) } }
    finally { $zip.Dispose() }
    Remove-Item -LiteralPath $tmp -Recurse -Force
}

Write-Host "Reading query workbook..."
$workbook = Read-XlsxWorkbook $QueriesPath
$queryRows = @($workbook.Values | Select-Object -First 1)
if ($queryRows.Count -eq 1 -and $queryRows[0] -is [array]) { $queryRows = $queryRows[0] }
Write-Host "Reading AI score metadata..."
$metadataWorkbook = Read-XlsxWorkbook $AiScoresPath
$metadataRows = @()
foreach ($v in $metadataWorkbook.Values) { $metadataRows += @($v) }
$srcRoot = Join-Path $RepoRoot "powerbi\src"
Write-Host "Indexing semantic-model measures..."
$measureIndex = Read-ModelMeasures $srcRoot
Write-Host "Indexed $($measureIndex.Count) measures."
Write-Host "Building measure token index..."
$tokenIndex = Build-MeasureTokenIndex $measureIndex
Write-Host "Building exact report-usage index for Primary DAX measures..."
$allQueryMeasures = New-Object System.Collections.Generic.HashSet[string]
foreach ($qr in $queryRows) {
    $rr = Get-DaxRefs ([string]$qr.query)
    foreach ($m in $rr.Measures) { if ($m) { [void]$allQueryMeasures.Add($m) } }
}
$measureUsageIndex = Build-ReportUsageIndex $srcRoot @($allQueryMeasures)
$reviewRows = New-ReviewRows $queryRows $metadataRows $measureIndex $tokenIndex $measureUsageIndex
Write-Host "Writing output workbook..."
Write-SimpleXlsx $reviewRows $OutPath
[pscustomobject]@{ QueryRows=$queryRows.Count; MeasuresIndexed=$measureIndex.Count; Output=$OutPath } | Format-List
