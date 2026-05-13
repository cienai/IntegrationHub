$ErrorActionPreference = 'Stop'

$mappingText = @"
description	measure_ref
Total monetary value of opportunities that have been successfully closed as won.	meas.ssr_history_won_amt
Count of opportunities that have been closed with a won outcome.	meas.ssr_history_won_count
Estimated (potential) annual contract value of all active opportunities, including those not yet won.	meas.trueai_potential_acv
Percentage of historical opportunities that resulted in a win out of total closed opportunities.	meas.ssr_history_win_rate
Total number of sales opportunities tracked in the pipeline.	meas.total_opp_count
Total monetary value of all open opportunities currently in the sales pipeline.	meas.ssr_history_pipeline_amt
Estimated success rate of open opportunities based on historical win performance.	meas.ssr_history_open_pipeline_success_rate
Number of open opportunities currently in the sales pipeline.	meas.ssr_history_mgmt_pipeline_count
Average number of days open opportunities have remained in the pipeline.	meas.open_pipeline_avg_days_in_stage
Total number of recorded sales activities across all activity types.	meas.stkhlds_all_act_count
Number of email activities logged by the sales team.	meas.stkhlds_all_act_email_count
Number of meetings conducted and recorded as sales activities.	meas.stkhlds_all_act_meeting_count
Total duration, in hours, of recorded sales activities.	meas.ssr_history_duration_hrs
Booking value generated from new customers with no prior business relationship.	meas.opp_nnb_amt
Booking value generated from selling additional products or services to existing customers.	meas.opp_cross_sale_amt
Reduction in booking value resulting from customers purchasing lower-tier products or services.	meas.opp_downgrade_amt
Booking value associated with renewing existing customer contracts.	meas.opp_renewal_amt
Annualized value of recurring revenue from active customer contracts.	meas.opp_arr_amt
Booking value that does not fall into standard booking type classifications.	meas.opp_nd_amt
Booking value from non-recurring, one-time sales transactions.	meas.opp_one_time_amt
Additional booking value generated from existing customers expanding their contracts.	meas.opp_expansion_amt
Monthly recurring revenue generated from active subscriptions or contracts.	meas.opp_mrr_amt
Total booking value generated from customers with an existing business relationship.	meas.opps_non_nnb_amt
Amount from New Logo Bookings	meas.ssr_history_won_amt_new_logo
Win Rate of New Logo Bookings	meas.ssr_history_amt_new_logo_win_rate
Number of New Logo Won Deals	meas.exp_rpts_all_new_logo_won_deals
Amount from Existing Bookings	meas.ssr_history_won_amt_existing_customer_selling
Win Rate of Existing Customer Bookings	meas.ssr_history_win_rate_existing_customer
Number of Existing Customer Deals	meas.exp_rpts_existing_customer_won_deals
Rep Performance Status	
Skills & Behaviors Discovery Skill Score	meas.ai_scores_ci_discovery_skill
Skills & Behaviors Engagement Ability Score	meas.ai_scores_ci_engagement_ability
Skills & Behaviors Closing Ability Score	meas.ai_scores_ci_closing_ability
Skills & Behaviors Deal Maximizing Score	meas.ai_scores_ci_deal_maxing
Skills & Behaviors Work Effort Score	meas.ai_scores_ci_work_effort
Skills & Behaviors Time Management Score	meas.ai_scores_ci_time_management
Skills & Behaviors Value Received Score	
Pipeline Amount from Prospecting and Post-Sales Support	meas.ssr_history_generated_pipeline_amt
Average Total Pipeline Amount	meas.ssr_history_pipeline_amt_avg
Open Pipeline Amount Available	meas.open_pipeline_booking_amt
Adjusted Open Pipeline Amount Available	meas.ssr_history_adj_pipeline_amt
Average Expected Pipeline Win Rate	meas.ssr_history_open_pipeline_success_rate
Open Pipeline Opportunity Count	meas.open_pipeline_count_id
Generated Leads	meas.ssr_history_mgmt_leads_gen_count
Territory Account	
Leads Received	
Accounts Received	
Opps Received	
Quality Adjusted Pipeline	
Activity Capture Level (ACL) Score	meas.users_history_avg_ci_act_capt_lvl
Adjusted Duration taking in to account adjustment factors	meas.ssr_history_duration_hrs
Time Spent in Engaged Activities	meas.ssr_history_all_eng_duration_hrs
# of Emails sent	meas.stkhlds_all_act_email_count
# of Phone Calls made	meas.stkhlds_all_act_phone_calls
# of Meetings had	meas.stkhlds_all_act_meeting_count
# of Other activities made	
# of Social Media activities made	meas.stkhlds_all_act_social_media_count
# of ND activities	meas.stkhlds_all_act_nd_count
# of Prospecting activities made	meas.users_activities_prospecting_count
# of New Logo Selling activities made	meas.users_activities_new_logo_count
# of Post-Sales Support activities made	meas.users_activities_post_sales_count
# of Existing Customer Selling activities made	meas.users_activities_existing_customer_count
# of Internal activities made	meas.users_activities_internal_count
Adjusted Duration in Prospecting step	meas.ssr_history_duration_hrs_prospecting
Adjusted Duration in New Logo step	meas.ssr_history_duration_hrs_new_logo
Adjusted Duration in Post-Sales step	meas.ssr_history_duration_hrs_post_sales
Adjusted Duration in Existing Customers step	meas.ssr_history_duration_hrs_existing_customer_selling
Value Received from others	
Value Created by rep	meas.ssr_history_vi_value_created
Value Delivered to others	meas.ssr_history_vi_value_delivered
Average of all Skills & Behaviors scores	
Geometric Mean – S&B Scores	meas.ai_scores_ci_sb_mean
Geometric Score	
Rep tenure in months	meas.data_logs_users_tenure
"@

$lines = $mappingText -split "`r?`n" | Where-Object { $_.Trim().Length -gt 0 }
$rows = @()
foreach($line in $lines | Select-Object -Skip 1){
  $m = [regex]::Match($line, '^(?<desc>.*?)(?:\t+|\s{2,})(?<ref>meas\.[A-Za-z0-9_\.]+)?$')
  if($m.Success){
    $desc = $m.Groups['desc'].Value.Trim()
    $ref = $m.Groups['ref'].Value.Trim()
  } else {
    $desc = $line.Trim(); $ref = ''
  }
  $rows += [pscustomobject]@{description=$desc; measure_ref=$ref}
}

$modelRoot = "powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition"
$files = Get-ChildItem -Path $modelRoot -Recurse -File -Filter *.tmdl

$measureIndex = @{}
foreach($f in $files){
  $content = Get-Content -LiteralPath $f.FullName
  for($i=0; $i -lt $content.Count; $i++){
    $line = $content[$i]
    $mm = [regex]::Match($line, "^\s*measure\s+'?(?<name>[^'=]+?)'?\s*=")
    if($mm.Success){
      $name = $mm.Groups['name'].Value.Trim()
      $start = $i
      $j = $i + 1
      while($j -lt $content.Count -and -not [regex]::IsMatch($content[$j], '^\s*measure\s+')){ $j++ }
      $block = $content[$start..([Math]::Min($j-1,$content.Count-1))] -join "`n"
      $measureIndex[$name] = [pscustomobject]@{
        Name = $name
        Formula = $block
        File = $f.FullName
      }
      $i = $j - 1
    }
  }
}

function Get-IssueAndMatch {
  param($desc,$formula,$exists)
  if(-not $exists){ return @('No','Low','Missing measure','Missing from semantic model source.') }
  if([string]::IsNullOrWhiteSpace($desc)){ return @('Unclear','Low','Unclear business definition','Description is blank or missing.') }

  $d = $desc.ToLowerInvariant()
  $f = $formula.ToLowerInvariant()

  $hasCount = $f -match 'distinctcount\(|   =  -match 'countx\\('\n|   =  -match 'countx\\('\n  $hasAvg = $f -match 'average\(|averagex\('
  $hasSum = $f -match '\bsum\(|sumx\('
  $hasDivide = $f -match '\bdivide\('
  $hasDate = $f -match 'dateadd\(|dates|eomonth|datediff|startof|endof|ytd|qtd|mtd'
  $hasProspecting = $f -match 'prospecting'
  $hasNewLogo = $f -match 'new logo|new_logo'
  $hasExisting = $f -match 'existing customer|existing_customer'

  if($d -match 'win rate|percentage|rate'){
    if($hasDivide -or $f -match 'win_rate'){ return @('Yes','High','Correct','Rate/percentage logic appears aligned (uses ratio or rate measure).') }
    return @('No','Medium','Formula mismatch','Description expects a rate/percentage but formula does not show ratio logic.')
  }
  if($d -match 'count|number of|# of|total number'){
    if($hasCount){ return @('Yes','High','Correct','Count-style aggregation matches description intent.') }
    if($hasSum -or $hasAvg){ return @('Partially','Medium','Aggregation issue','Description suggests count, formula appears non-count aggregation.') }
    return @('Unclear','Low','Unclear business definition','Could not reliably infer aggregation from formula.')
  }
  if($d -match 'average'){
    if($hasAvg){ return @('Yes','High','Correct','Average aggregation appears aligned.') }
    return @('Partially','Medium','Aggregation issue','Description suggests average, formula does not clearly use AVERAGE/AVERAGEX.')
  }
  if($d -match 'amount|value|revenue|booking|acv|arr|mrr|monetary|pipeline'){
    if($hasSum -or $f -match '_amt|pipeline|acv|arr|mrr'){ 
      if(($d -match 'new logo' -and -not $hasNewLogo) -or ($d -match 'existing' -and -not $hasExisting) -or ($d -match 'prospecting' -and -not $hasProspecting)){
        return @('Partially','Medium','Filter context issue','Amount logic exists, but explicit segment filter in description is not obvious in formula body.')
      }
      return @('Yes','Medium','Correct','Amount/value logic appears aligned.')
    }
    return @('No','Medium','Formula mismatch','Description suggests monetary aggregation but formula does not clearly show it.')
  }
  if($d -match 'duration|days|time spent|tenure'){
    if($f -match 'duration|datediff|tenure|hours|hrs'){ return @('Yes','Medium','Correct','Time/duration logic appears aligned.') }
    return @('Partially','Low','Date logic issue','Description is time-based but formula does not clearly expose date/duration logic.')
  }

  return @('Unclear','Low','Unclear business definition','Business description is not specific enough to validate confidently from formula alone.')
}

$out = @()
foreach($r in $rows){
  $ref = $r.measure_ref
  if([string]::IsNullOrWhiteSpace($ref)){
    $out += [pscustomobject]@{
      description = $r.description
      measure_ref = $ref
      measure_exists = 'No'
      current_measure_formula = ''
      dependent_measures_reviewed = ''
      does_formula_match_description = 'Unclear'
      confidence = 'Low'
      issue_type = 'Unclear business definition'
      comment = 'No measure_ref provided in mapping row; cannot validate against model.'
      suggested_change = 'Provide explicit measure_ref for this description.'
      suggested_new_measure_name = ''
      suggested_new_measure_formula = 'Needs business confirmation'
      files_checked = ($files.FullName -join '; ')
    }
    continue
  }

  $m = $measureIndex[$ref]
  $exists = $null -ne $m
  $formula = if($exists){ ($m.Formula -replace "`r?`n", ' ') -replace '\s+', ' ' } else { '' }

  $deps = @()
  if($exists){
    $depMatches = [regex]::Matches($m.Formula, '\[(meas\.[^\]]+)\]')
    $deps = $depMatches | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
  }

  $depReviewed = @()
  $depFiles = @()
  foreach($d in $deps){
    if($measureIndex.ContainsKey($d)){
      $depReviewed += "$d(Found)"
      $depFiles += $measureIndex[$d].File
    } else {
      $depReviewed += "$d(Missing)"
    }
  }

  $eval = Get-IssueAndMatch -desc $r.description -formula $m.Formula -exists $exists
  $match = $eval[0]; $conf = $eval[1]; $issue = $eval[2]; $comment = $eval[3]

  $suggestedChange = ''
  $suggestedFormula = ''
  $suggestedName = ''
  if(-not $exists){
    $suggestedChange = 'Add the missing measure to semantic model or update mapping to existing measure.'
    $suggestedFormula = 'Needs business confirmation'
  } elseif($match -in @('No','Partially')){
    $suggestedChange = 'Review DAX against business definition; align aggregation/filter/date context or adjust description/name.'
    $suggestedFormula = 'Needs business confirmation'
    if($issue -eq 'Naming mismatch'){ $suggestedName = $ref + '_revised' }
  }

  $filesChecked = @()
  if($exists){ $filesChecked += $m.File }
  $filesChecked += $depFiles
  $filesChecked = $filesChecked | Sort-Object -Unique

  $out += [pscustomobject]@{
    description = $r.description
    measure_ref = $ref
    measure_exists = if($exists){'Yes'}else{'No'}
    current_measure_formula = $formula
    dependent_measures_reviewed = ($depReviewed -join '; ')
    does_formula_match_description = $match
    confidence = $conf
    issue_type = $issue
    comment = $comment
    suggested_change = $suggestedChange
    suggested_new_measure_name = $suggestedName
    suggested_new_measure_formula = $suggestedFormula
    files_checked = ($filesChecked -join '; ')
  }
}

$outPath = Join-Path (Get-Location) 'measure_description_validation_report.csv'
$out | Export-Csv -LiteralPath $outPath -NoTypeInformation -Encoding UTF8
Write-Output "WROTE: $outPath"
Write-Output ("ROWS: " + $out.Count)

