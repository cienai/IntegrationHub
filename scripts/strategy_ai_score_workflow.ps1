param(
  [string]$PdfPath,
  [string]$MetadataCsvPath,
  [string]$TargetSpreadsheetPath,
  [string]$OutputDir = "outputs/ai_score_workflow",
  [string]$ReportDefinitionPagesDir = "powerbi/src/Strategy Report.Report/definition/pages"
)

$ErrorActionPreference = 'Stop'

function Ensure-Dir([string]$path) {
  if (-not (Test-Path $path)) { New-Item -ItemType Directory -Path $path | Out-Null }
}

function Normalize([string]$s) {
  if ([string]::IsNullOrWhiteSpace($s)) { return "" }
  return ($s.ToLowerInvariant() -replace "\s+", " " -replace "[^a-z0-9\s\-]", "").Trim()
}

function Get-ScoreCandidatesFromText([string]$text, [object[]]$metaRows) {
  $hits = New-Object System.Collections.Generic.List[object]
  foreach ($r in $metaRows) {
    $score = [string]$r.score_name
    if ([string]::IsNullOrWhiteSpace($score)) { continue }
    if ($text -match [regex]::Escape($score)) {
      $hits.Add([pscustomobject]@{ score_name = $score; measure = [string]$r.measure; confidence = "high"; note = "exact score_name match in extracted text" }) | Out-Null
    }
  }
  return ,$hits
}

function Infer-ScoreCandidatesFromPageName([string]$pageName, [hashtable]$scoreToMeasure) {
  $n = Normalize $pageName
  $out = New-Object System.Collections.Generic.List[object]

  $rules = @(
    @{ pat = 'prospecting'; score = 'Prospecting Success Predictions' },
    @{ pat = 'new logo|new business'; score = 'New Logo Selling Success Predictions' },
    @{ pat = 'post sales support|post-sales support'; score = 'Post-Sales Support Success Predictions' },
    @{ pat = 'existing customer|existing business|expansion'; score = 'Existing Customer Selling Success Predictions' },
    @{ pat = 'potential acv|acv'; score = 'Potential ACV' },
    @{ pat = 'time allocation'; score = 'Time Allocation' },
    @{ pat = 'activity capture'; score = 'Activity Capture Level' },
    @{ pat = 'adjusted duration|time spent'; score = 'Adjusted Duration' },
    @{ pat = 'performance tier'; score = 'Performance Tiers' },
    @{ pat = 'ramping'; score = 'Ramping Success' },
    @{ pat = 'time management'; score = 'Time Management' },
    @{ pat = 'deal maximizing|bookings & productivity'; score = 'Deal Maximizing' },
    @{ pat = 'vi |value intelligence'; score = 'VI Amount' }
  )

  foreach ($rule in $rules) {
    if ($n -match $rule.pat) {
      $score = $rule.score
      if ($scoreToMeasure.ContainsKey($score)) {
        $out.Add([pscustomobject]@{
          score_name = $score
          measure = [string]$scoreToMeasure[$score]
          confidence = 'medium'
          note = "inferred from page display name"
        }) | Out-Null
      }
    }
  }

  return ,$out
}

Ensure-Dir $OutputDir

if (-not (Test-Path $MetadataCsvPath)) { throw "Metadata CSV not found: $MetadataCsvPath" }
$meta = Import-Csv -Path $MetadataCsvPath
if ($meta.Count -eq 0) { throw "Metadata CSV is empty: $MetadataCsvPath" }

$scoreToMeasure = @{}
foreach ($r in $meta) {
  $score = [string]$r.score_name
  $measure = [string]$r.measure
  if (-not [string]::IsNullOrWhiteSpace($score) -and -not [string]::IsNullOrWhiteSpace($measure)) {
    $scoreToMeasure[$score] = $measure
  }
}

$issues = New-Object System.Collections.Generic.List[object]
$records = New-Object System.Collections.Generic.List[object]

# 1) Try PDF text extraction if pdftotext exists
$pdftotext = $null
try { $pdftotext = (Get-Command pdftotext -ErrorAction Stop).Source } catch {}

if ($PdfPath -and (Test-Path $PdfPath) -and $pdftotext) {
  $txtOut = Join-Path $OutputDir "pdf_text_pages.txt"
  & $pdftotext -layout $PdfPath $txtOut
  $raw = Get-Content -Raw -Path $txtOut
  $pages = $raw -split "`f"

  for ($i = 0; $i -lt $pages.Count; $i++) {
    $p = $pages[$i]
    $hits = Get-ScoreCandidatesFromText -text $p -metaRows $meta
    if ($hits.Count -eq 0) {
      $issues.Add([pscustomobject]@{ type='no_scores_found'; source='pdf'; page_number=($i+1); detail='No score_name matched in page text' }) | Out-Null
      continue
    }
    foreach ($h in $hits) {
      $records.Add([pscustomobject]@{
        report_pdf = [System.IO.Path]::GetFileName($PdfPath)
        report_display_name = 'Strategy Report'
        system_name = 'Strategy Report.Report'
        page_number = $i + 1
        page_tab_name = ''
        ai_score_label = $h.score_name
        ai_score_value = ''
        ai_score_measure = $h.measure
        confidence = $h.confidence
        notes = $h.note
        source = 'pdf_text'
      }) | Out-Null
    }
  }
} else {
  $issues.Add([pscustomobject]@{ type='pdf_extractor_unavailable'; source='runtime'; page_number=''; detail='pdftotext not found; used report-definition fallback mapping.' }) | Out-Null
}

# 2) Fallback/augmentation from report definition pages
if (Test-Path $ReportDefinitionPagesDir) {
  $pageFiles = Get-ChildItem -Path $ReportDefinitionPagesDir -Recurse -Filter page.json -File
  foreach ($pf in $pageFiles) {
    $j = Get-Content -Raw -Path $pf.FullName | ConvertFrom-Json
    $pageId = [string]$j.name
    $pageDisplay = [string]$j.displayName

    $inferred = Infer-ScoreCandidatesFromPageName -pageName $pageDisplay -scoreToMeasure $scoreToMeasure
    if ($inferred.Count -eq 0) {
      $issues.Add([pscustomobject]@{ type='no_scores_inferred'; source='report_definition'; page_number=''; detail="No score inferred for page '$pageDisplay' ($pageId)" }) | Out-Null
      continue
    }

    foreach ($h in $inferred) {
      $records.Add([pscustomobject]@{
        report_pdf = if ($PdfPath) { [System.IO.Path]::GetFileName($PdfPath) } else { '' }
        report_display_name = 'Strategy Report'
        system_name = 'Strategy Report.Report'
        page_number = ''
        page_tab_name = $pageDisplay
        ai_score_label = $h.score_name
        ai_score_value = ''
        ai_score_measure = $h.measure
        confidence = $h.confidence
        notes = $h.note
        source = 'report_definition_inference'
      }) | Out-Null
    }
  }
} else {
  $issues.Add([pscustomobject]@{ type='missing_report_definition'; source='filesystem'; page_number=''; detail="Path not found: $ReportDefinitionPagesDir" }) | Out-Null
}

# dedupe
$recordsDedup = $records | Sort-Object report_display_name,page_tab_name,ai_score_label,ai_score_measure -Unique

$intermediatePath = Join-Path $OutputDir "intermediate_ai_score_extraction.csv"
$recordsDedup | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $intermediatePath

# validation summary
$conflicts = $recordsDedup | Group-Object report_display_name,page_tab_name,ai_score_label | Where-Object { $_.Count -gt 1 }
foreach ($c in $conflicts) {
  $issues.Add([pscustomobject]@{ type='duplicate_or_conflict'; source='validation'; page_number=''; detail="Duplicate candidates for $($c.Name)" }) | Out-Null
}

$validationPath = Join-Path $OutputDir "validation_issues.csv"
$issues | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $validationPath

# 3) Optional target spreadsheet update (CSV only in this environment)
$updatedTargetPath = ''
if ($TargetSpreadsheetPath -and (Test-Path $TargetSpreadsheetPath)) {
  $ext = [System.IO.Path]::GetExtension($TargetSpreadsheetPath).ToLowerInvariant()
  if ($ext -eq '.csv') {
    $target = Import-Csv -Path $TargetSpreadsheetPath
    if ($target.Count -gt 0 -and ($target[0].PSObject.Properties.Name -contains 'name')) {
      foreach ($row in $target) {
        $rowName = [string]$row.name
        $cands = $recordsDedup | Where-Object { $_.page_tab_name -eq $rowName } | Select-Object -First 5
        if ($cands.Count -gt 0) {
          for ($i=1; $i -le 5; $i++) {
            $col = "ai_score_$i"
            if (-not ($row.PSObject.Properties.Name -contains $col)) { $row | Add-Member -NotePropertyName $col -NotePropertyValue '' }
            $row.$col = if ($i -le $cands.Count) { [string]$cands[$i-1].ai_score_measure } else { '' }
          }
        }
      }
      $updatedTargetPath = Join-Path $OutputDir ("updated_" + [System.IO.Path]::GetFileName($TargetSpreadsheetPath))
      $target | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $updatedTargetPath
    } else {
      $issues.Add([pscustomobject]@{ type='target_not_updated'; source='target_update'; page_number=''; detail='CSV target missing required column: name' }) | Out-Null
      $issues | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $validationPath
    }
  } else {
    $issues.Add([pscustomobject]@{ type='target_not_updated'; source='target_update'; page_number=''; detail='XLSX in-place update not supported in this runtime. Exported intermediate + validation for controlled merge.' }) | Out-Null
    $issues | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $validationPath
  }
}

$summary = [pscustomobject]@{
  intermediate_csv = $intermediatePath
  validation_csv = $validationPath
  updated_target = $updatedTargetPath
  extracted_rows = ($recordsDedup | Measure-Object).Count
  issue_rows = ($issues | Measure-Object).Count
}
$summary | ConvertTo-Json -Depth 4 | Set-Content -Path (Join-Path $OutputDir 'run_summary.json')
$summary | Format-List
