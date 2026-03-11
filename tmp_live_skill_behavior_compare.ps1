$ErrorActionPreference = 'Stop'

$root = 'c:\Users\martin\Desktop\IntegrationHub'
$tokFile = Join-Path $root 'tmp_pbi_token.txt'
$resultFile = Join-Path $root 'tmp_live_skill_behavior_compare.csv'
$errFile = Join-Path $root 'tmp_device_code_error.txt'

Remove-Item $resultFile -ErrorAction SilentlyContinue

$adomdPath = 'C:\Program Files\DAX Studio\bin\Microsoft.AnalysisServices.AdomdClient.dll'
[System.Reflection.Assembly]::LoadFrom($adomdPath) | Out-Null

if (-not (Test-Path $tokFile)) {
    throw "Access token file not found: $tokFile"
}

$token = (Get-Content $tokFile -Raw).Trim()
$expires = [DateTimeOffset]::UtcNow.AddMinutes(30)
$accessToken = New-Object Microsoft.AnalysisServices.AdomdClient.AccessToken($token, $expires, $null)

$dateFilter = @"
KEEPFILTERS(
    FILTER(
        ALL('cal_end_dates'[date]),
        'cal_end_dates'[date] >= DATE(2025, 1, 1) &&
        'cal_end_dates'[date] <= DATE(2025, 2, 24)
    )
)
"@

$scoreFilter = @"
KEEPFILTERS(
    TREATAS(
        {
            "Closing Ability",
            "Discovery Skill",
            "Engagement Ability",
            "Work Effort",
            "Time Allocation",
            "Activity Capture Level",
            "Deal Maximizing"
        },
        metadata_ai_scores[score_name]
    )
)
"@

$sharedRows = @"
ADDCOLUMNS(
    VALUES(metadata_ai_scores[score_name]),
    "Boost Expo", CALCULATE(MAX(metadata_ai_scores[boost_expo])),
    "Factor Measure Name", CALCULATE([meas.ai_score_measure_name]),
    "Factor1 Helper", CALCULATE([meas.ai_scores_factor1_value]),
    "Raw Factor Numeric",
        CALCULATE(
            SWITCH(
                SELECTEDVALUE(metadata_ai_scores[score_name]),
                "Closing Ability", [meas.ai_scores_ci_closing_ability_factor1_value],
                "Discovery Skill", [meas.ai_scores_ci_discovery_skill_factor1_value],
                "Engagement Ability", [meas.ai_scores_ci_engagement_ability_factor1_value],
                "Work Effort", [meas.ai_scores_ci_work_effort_factor1_value],
                "Time Allocation",
                    CALCULATE(
                        AVERAGE(users_history[ci_time_alloc_conf]),
                        users[trueai_user_role_function] IN {"AM","AE","SDR"}
                    ),
                "Activity Capture Level", [meas.ai_scores_ci_act_capt_lvl_factor1_value],
                "Deal Maximizing", [meas.ai_scores_ci_deal_maxing_factor1_value],
                BLANK()
            )
        ),
    "Direct Score",
        CALCULATE(
            SWITCH(
                SELECTEDVALUE(metadata_ai_scores[score_name]),
                "Closing Ability", [meas.ai_scores_ci_closing_ability],
                "Discovery Skill", [meas.ai_scores_ci_discovery_skill],
                "Engagement Ability", [meas.ai_scores_ci_engagement_ability],
                "Work Effort", [meas.ai_scores_ci_work_effort],
                "Time Allocation", [meas.ai_scores_ci_time_alloc],
                "Activity Capture Level", [meas.ai_scores_ci_act_capt_lvl],
                "Deal Maximizing", [meas.ai_scores_ci_deal_maxing],
                BLANK()
            )
        )
)
"@

$queryUtility = @"
EVALUATE
CALCULATETABLE(
    SELECTCOLUMNS(
        ADDCOLUMNS(
            __ROWS__,
            "Model", "Utility",
            "Wrapped Display Score", CALCULATE([meas.ai_score])
        ),
        "Model", [Model],
        "Score Name", metadata_ai_scores[score_name],
        "Boost Expo", [Boost Expo],
        "Factor Measure Name", [Factor Measure Name],
        "Factor1 Helper", [Factor1 Helper],
        "Raw Factor Numeric", [Raw Factor Numeric],
        "Direct Score", [Direct Score],
        "Wrapped Display Score", [Wrapped Display Score]
    ),
    __DATE_FILTER__,
    __SCORE_FILTER__
)
ORDER BY [Score Name]
"@

$queryAde = @"
EVALUATE
CALCULATETABLE(
    SELECTCOLUMNS(
        ADDCOLUMNS(
            __ROWS__,
            "Model", "ADE",
            "Wrapped Display Score", CALCULATE([meas.readiness_ai_score])
        ),
        "Model", [Model],
        "Score Name", metadata_ai_scores[score_name],
        "Boost Expo", [Boost Expo],
        "Factor Measure Name", [Factor Measure Name],
        "Factor1 Helper", [Factor1 Helper],
        "Raw Factor Numeric", [Raw Factor Numeric],
        "Direct Score", [Direct Score],
        "Wrapped Display Score", [Wrapped Display Score]
    ),
    __DATE_FILTER__,
    __SCORE_FILTER__
)
ORDER BY [Score Name]
"@

$queryUtility = $queryUtility.Replace('__ROWS__', $sharedRows).Replace('__DATE_FILTER__', $dateFilter).Replace('__SCORE_FILTER__', $scoreFilter)
$queryAde = $queryAde.Replace('__ROWS__', $sharedRows).Replace('__DATE_FILTER__', $dateFilter).Replace('__SCORE_FILTER__', $scoreFilter)

function Invoke-Trace {
    param(
        [string]$WorkspaceName,
        [string]$DatasetName,
        [string]$QueryText
    )

    $conn = New-Object Microsoft.AnalysisServices.AdomdClient.AdomdConnection
    $conn.ConnectionString = "Data Source=powerbi://api.powerbi.com/v1.0/myorg/$WorkspaceName;Initial Catalog=$DatasetName;"
    $conn.AccessToken = $accessToken
    $conn.Open()

    try {
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = $QueryText
        $reader = $cmd.ExecuteReader()
        $rows = New-Object System.Collections.Generic.List[object]
        while ($reader.Read()) {
            $obj = [ordered]@{}
            for ($i = 0; $i -lt $reader.FieldCount; $i++) {
                $obj[$reader.GetName($i)] = [string]$reader.GetValue($i)
            }
            $rows.Add([PSCustomObject]$obj) | Out-Null
        }
        $reader.Close()
        return $rows
    }
    finally {
        $conn.Close()
    }
}

try {
    $allRows = New-Object System.Collections.Generic.List[object]
    Invoke-Trace -WorkspaceName 'Dev' -DatasetName 'Dataset - Azure Data Lake - Sales Performance' -QueryText $queryUtility | ForEach-Object { $allRows.Add($_) | Out-Null }
    Invoke-Trace -WorkspaceName 'Dev' -DatasetName 'Dataset - Azure Data Lake - Automatic Data Enhancement' -QueryText $queryAde | ForEach-Object { $allRows.Add($_) | Out-Null }
    $allRows | Export-Csv -Path $resultFile -NoTypeInformation
}
catch {
    Set-Content -Path $errFile -Value ($_ | Out-String)
    throw
}
