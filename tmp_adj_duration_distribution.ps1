$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$outFile = Join-Path $root 'tmp_adj_duration_distribution.csv'
$errFile = Join-Path $root 'tmp_adj_duration_distribution.err.txt'

Remove-Item $outFile, $errFile -ErrorAction SilentlyContinue

$adomdPath = 'C:\Program Files\DAX Studio\bin\Microsoft.AnalysisServices.AdomdClient.dll'
[System.Reflection.Assembly]::LoadFrom($adomdPath) | Out-Null

$token = (Get-Content $tokFile -Raw).Trim()
$expires = [DateTimeOffset]::UtcNow.AddMinutes(30)
$accessToken = New-Object Microsoft.AnalysisServices.AdomdClient.AccessToken($token, $expires, $null)

function Invoke-Dax {
    param(
        [string]$DatasetName,
        [string]$ModelLabel,
        [string]$QueryText
    )

    $conn = New-Object Microsoft.AnalysisServices.AdomdClient.AdomdConnection
    $conn.ConnectionString = "Data Source=powerbi://api.powerbi.com/v1.0/myorg/Dev;Initial Catalog=$DatasetName;"
    $conn.AccessToken = $accessToken
    $conn.Open()
    try {
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = $QueryText
        $reader = $cmd.ExecuteReader()
        $rows = New-Object System.Collections.Generic.List[object]
        while ($reader.Read()) {
            $obj = [ordered]@{ Model = $ModelLabel }
            for ($i = 0; $i -lt $reader.FieldCount; $i++) {
                $obj[$reader.GetName($i)] = [string]$reader.GetValue($i)
            }
            $rows.Add([PSCustomObject]$obj) | Out-Null
        }
        $reader.Close()
        return $rows
    } finally { $conn.Close() }
}

$utilityQuery = @"
DEFINE
    VAR __DATE_FILTER =
        FILTER(
            ALL('cal_end_dates'[date]),
            'cal_end_dates'[date] >= DATE(2023, 1, 1) &&
            'cal_end_dates'[date] < DATE(2026, 1, 1)
        )
    VAR __SSR_FILTER =
        CALCULATETABLE(
            ssr_history,
            __DATE_FILTER,
            ssr_history[step_name] IN {
                "Prospecting",
                "New Logo Selling",
                "Post-Sales Support",
                "Existing Customer Selling"
            }
        )
    VAR __TOTAL = COUNTROWS(__SSR_FILTER)
    VAR __WEIGHTED =
        AVERAGEX(
            __SSR_FILTER,
            SWITCH(
                ssr_history[stkhlds_all_adj_dur_rule],
                "133002", 0.4,
                "133001", 0.7,
                "133003", 0.97,
                "133004", 0.86
            )
        )
EVALUATE
UNION(
    ROW("RuleValue","__TOTAL__","Count",__TOTAL,"Percent",1,"WeightedAverage",__WEIGHTED,"MeasureFactor",[meas.ai_scores_adj_duration_factor1_value],"DisplayScore",CALCULATE([meas.ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("RuleValue","133001","Count",COUNTROWS(FILTER(__SSR_FILTER, ssr_history[stkhlds_all_adj_dur_rule]="133001")),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER, ssr_history[stkhlds_all_adj_dur_rule]="133001")), __TOTAL),"WeightedAverage",__WEIGHTED,"MeasureFactor",[meas.ai_scores_adj_duration_factor1_value],"DisplayScore",CALCULATE([meas.ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("RuleValue","133002","Count",COUNTROWS(FILTER(__SSR_FILTER, ssr_history[stkhlds_all_adj_dur_rule]="133002")),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER, ssr_history[stkhlds_all_adj_dur_rule]="133002")), __TOTAL),"WeightedAverage",__WEIGHTED,"MeasureFactor",[meas.ai_scores_adj_duration_factor1_value],"DisplayScore",CALCULATE([meas.ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("RuleValue","133003","Count",COUNTROWS(FILTER(__SSR_FILTER, ssr_history[stkhlds_all_adj_dur_rule]="133003")),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER, ssr_history[stkhlds_all_adj_dur_rule]="133003")), __TOTAL),"WeightedAverage",__WEIGHTED,"MeasureFactor",[meas.ai_scores_adj_duration_factor1_value],"DisplayScore",CALCULATE([meas.ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("RuleValue","133004","Count",COUNTROWS(FILTER(__SSR_FILTER, ssr_history[stkhlds_all_adj_dur_rule]="133004")),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER, ssr_history[stkhlds_all_adj_dur_rule]="133004")), __TOTAL),"WeightedAverage",__WEIGHTED,"MeasureFactor",[meas.ai_scores_adj_duration_factor1_value],"DisplayScore",CALCULATE([meas.ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("RuleValue","blank / other","Count",COUNTROWS(FILTER(__SSR_FILTER, NOT(ssr_history[stkhlds_all_adj_dur_rule] IN {"133001","133002","133003","133004"}))),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER, NOT(ssr_history[stkhlds_all_adj_dur_rule] IN {"133001","133002","133003","133004"}))), __TOTAL),"WeightedAverage",__WEIGHTED,"MeasureFactor",[meas.ai_scores_adj_duration_factor1_value],"DisplayScore",CALCULATE([meas.ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration"))
)
"@

$adeQuery = @"
DEFINE
    VAR __DATE_FILTER =
        FILTER(
            ALL('cal_end_dates'[date]),
            'cal_end_dates'[date] >= DATE(2023, 1, 1) &&
            'cal_end_dates'[date] < DATE(2026, 1, 1)
        )
    VAR __SSR_FILTER_CURRENT =
        CALCULATETABLE(
            ssr_history,
            __DATE_FILTER,
            ssr_history[step_name] IN {
                "Prospecting",
                "New Logo Selling",
                "Post-Sales Support",
                "Existing Customer Selling"
            }
        )
    VAR __SSR_FILTER_FIXED =
        CALCULATETABLE(
            ssr_history,
            __DATE_FILTER,
            ssr_history[step_name] IN {
                "Prospecting",
                "New Logo Selling",
                "Post-Sales Support",
                "Existing Customer Selling"
            },
            CROSSFILTER(ssr_history[_sys_filt_start_date], cal_end_dates[date], NONE),
            TREATAS(VALUES(cal_end_dates[date]), ssr_history[_sys_filt_end_date])
        )
    VAR __TOTAL_CURRENT = COUNTROWS(__SSR_FILTER_CURRENT)
    VAR __TOTAL_FIXED = COUNTROWS(__SSR_FILTER_FIXED)
    VAR __WEIGHTED_CURRENT =
        AVERAGEX(
            __SSR_FILTER_CURRENT,
            SWITCH(
                VALUE(ssr_history[stkhlds_all_adj_dur_rule]),
                133002, 0.4,
                133001, 0.7,
                133003, 0.97,
                133004, 0.86
            )
        )
    VAR __WEIGHTED_FIXED =
        AVERAGEX(
            __SSR_FILTER_FIXED,
            SWITCH(
                VALUE(ssr_history[stkhlds_all_adj_dur_rule]),
                133002, 0.4,
                133001, 0.7,
                133003, 0.97,
                133004, 0.86
            )
        )
EVALUATE
UNION(
    ROW("Variant","Current","RuleValue","__TOTAL__","Count",__TOTAL_CURRENT,"Percent",1,"WeightedAverage",__WEIGHTED_CURRENT,"MeasureFactor",CALCULATE([meas.ai_scores_adj_duration_factor1_value], __DATE_FILTER),"DisplayScore",CALCULATE([meas.readiness_ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("Variant","Current","RuleValue","133001","Count",COUNTROWS(FILTER(__SSR_FILTER_CURRENT, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133001)),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER_CURRENT, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133001)), __TOTAL_CURRENT),"WeightedAverage",__WEIGHTED_CURRENT,"MeasureFactor",CALCULATE([meas.ai_scores_adj_duration_factor1_value], __DATE_FILTER),"DisplayScore",CALCULATE([meas.readiness_ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("Variant","Current","RuleValue","133002","Count",COUNTROWS(FILTER(__SSR_FILTER_CURRENT, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133002)),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER_CURRENT, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133002)), __TOTAL_CURRENT),"WeightedAverage",__WEIGHTED_CURRENT,"MeasureFactor",CALCULATE([meas.ai_scores_adj_duration_factor1_value], __DATE_FILTER),"DisplayScore",CALCULATE([meas.readiness_ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("Variant","Current","RuleValue","133003","Count",COUNTROWS(FILTER(__SSR_FILTER_CURRENT, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133003)),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER_CURRENT, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133003)), __TOTAL_CURRENT),"WeightedAverage",__WEIGHTED_CURRENT,"MeasureFactor",CALCULATE([meas.ai_scores_adj_duration_factor1_value], __DATE_FILTER),"DisplayScore",CALCULATE([meas.readiness_ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("Variant","Current","RuleValue","133004","Count",COUNTROWS(FILTER(__SSR_FILTER_CURRENT, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133004)),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER_CURRENT, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133004)), __TOTAL_CURRENT),"WeightedAverage",__WEIGHTED_CURRENT,"MeasureFactor",CALCULATE([meas.ai_scores_adj_duration_factor1_value], __DATE_FILTER),"DisplayScore",CALCULATE([meas.readiness_ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("Variant","Current","RuleValue","blank / other","Count",COUNTROWS(FILTER(__SSR_FILTER_CURRENT, NOT(VALUE(ssr_history[stkhlds_all_adj_dur_rule]) IN {133001,133002,133003,133004}))),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER_CURRENT, NOT(VALUE(ssr_history[stkhlds_all_adj_dur_rule]) IN {133001,133002,133003,133004}))), __TOTAL_CURRENT),"WeightedAverage",__WEIGHTED_CURRENT,"MeasureFactor",CALCULATE([meas.ai_scores_adj_duration_factor1_value], __DATE_FILTER),"DisplayScore",CALCULATE([meas.readiness_ai_score], __DATE_FILTER, metadata_ai_scores[score_name]="Adjusted Duration")),
    ROW("Variant","FixedEndDate","RuleValue","__TOTAL__","Count",__TOTAL_FIXED,"Percent",1,"WeightedAverage",__WEIGHTED_FIXED,"MeasureFactor",__WEIGHTED_FIXED,"DisplayScore",BLANK()),
    ROW("Variant","FixedEndDate","RuleValue","133001","Count",COUNTROWS(FILTER(__SSR_FILTER_FIXED, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133001)),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER_FIXED, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133001)), __TOTAL_FIXED),"WeightedAverage",__WEIGHTED_FIXED,"MeasureFactor",__WEIGHTED_FIXED,"DisplayScore",BLANK()),
    ROW("Variant","FixedEndDate","RuleValue","133002","Count",COUNTROWS(FILTER(__SSR_FILTER_FIXED, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133002)),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER_FIXED, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133002)), __TOTAL_FIXED),"WeightedAverage",__WEIGHTED_FIXED,"MeasureFactor",__WEIGHTED_FIXED,"DisplayScore",BLANK()),
    ROW("Variant","FixedEndDate","RuleValue","133003","Count",COUNTROWS(FILTER(__SSR_FILTER_FIXED, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133003)),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER_FIXED, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133003)), __TOTAL_FIXED),"WeightedAverage",__WEIGHTED_FIXED,"MeasureFactor",__WEIGHTED_FIXED,"DisplayScore",BLANK()),
    ROW("Variant","FixedEndDate","RuleValue","133004","Count",COUNTROWS(FILTER(__SSR_FILTER_FIXED, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133004)),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER_FIXED, VALUE(ssr_history[stkhlds_all_adj_dur_rule])=133004)), __TOTAL_FIXED),"WeightedAverage",__WEIGHTED_FIXED,"MeasureFactor",__WEIGHTED_FIXED,"DisplayScore",BLANK()),
    ROW("Variant","FixedEndDate","RuleValue","blank / other","Count",COUNTROWS(FILTER(__SSR_FILTER_FIXED, NOT(VALUE(ssr_history[stkhlds_all_adj_dur_rule]) IN {133001,133002,133003,133004}))),"Percent",DIVIDE(COUNTROWS(FILTER(__SSR_FILTER_FIXED, NOT(VALUE(ssr_history[stkhlds_all_adj_dur_rule]) IN {133001,133002,133003,133004}))), __TOTAL_FIXED),"WeightedAverage",__WEIGHTED_FIXED,"MeasureFactor",__WEIGHTED_FIXED,"DisplayScore",BLANK())
)
"@

try {
    $rows = New-Object System.Collections.Generic.List[object]
    Invoke-Dax -DatasetName 'Dataset - Azure Data Lake - Sales Performance' -ModelLabel 'Utility' -QueryText $utilityQuery | ForEach-Object { $rows.Add($_) | Out-Null }
    Invoke-Dax -DatasetName 'Dataset - Azure Data Lake - Automatic Data Enhancement' -ModelLabel 'ADE' -QueryText $adeQuery | ForEach-Object { $rows.Add($_) | Out-Null }
    $rows | Export-Csv -Path $outFile -NoTypeInformation
} catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
