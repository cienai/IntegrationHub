# Measure Description Audit

## Scoring Methodology
Each score is on a 1?5 scale.
- Accuracy: Checks whether the description reflects DAX operations and context modifiers (e.g., CALCULATE, ALL, REMOVEFILTERS, USERELATIONSHIP). Missing or incorrect context handling caps Accuracy at 3.
- Completeness: Verifies that all referenced columns and measures are listed. Missing dependencies cap Completeness at 3.
- Agentic Clarity: Evaluates whether the Dynamic Behavior line explains conditional logic or filter/slicer-driven behavior. If it says there is no dynamic behavior while context is modified, Clarity is capped at 2.

Calculations are based on parsing the DAX expression for:
- Column references: `Table[Column]`
- Measure references: `[Measure]`
- Context modifiers: `CALCULATE`, `ALL`, `REMOVEFILTERS`, `KEEPFILTERS`, `ALLEXCEPT`, `ALLSELECTED`, `USERELATIONSHIP`, `CROSSFILTER`, `TREATAS`
- Decision logic: `IF`, `SWITCH`, and filter/slicer state functions (`SELECTEDVALUE`, `ISFILTERED`, `HASONEVALUE`, `ISCROSSFILTERED`)

## Summary
- Total measures audited: 2339
- Measures below 4 in any category: 0
- Accuracy distribution: {1: 0, 2: 0, 3: 0, 4: 0, 5: 2339}
- Completeness distribution: {1: 0, 2: 0, 3: 0, 4: 0, 5: 2339}
- Agentic clarity distribution: {1: 0, 2: 0, 3: 0, 4: 0, 5: 2339}


## meas.account_trueai_dupe_rate

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/accounts.tmdl`
Table: `accounts`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.account_trueai_completeness_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/accounts.tmdl`
Table: `accounts`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.accounts_trueai_non_dupe_counts

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/accounts.tmdl`
Table: `accounts`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_act_per_step_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_dur_per_step_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_expected_dur_per_step_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_duration

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_expected_duration

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capture

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_duration_weekly_rep_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_expected_duration_weekly_rep_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_act_capt_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_act_capt_score_industry_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_act_capt_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_act_capt_score_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capture_adjustment_factor

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_applicable_reps

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_activity_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_summary_time_alloc_eng

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_summary_time_alloc_non_eng

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.no_activities_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_capture_level_summary.tmdl`
Table: `act_capture_level_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_alloc_reps

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_alloc_reps_w_act_capt_level

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_alloc_captured_durations_h

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_alloc_adj_durations_h

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_alloc_avg_dur

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_rep_w_act_capt_level_pct

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_alloc_hours_weekly

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_alloc_user_months_w_time_alloc

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_alloc_capture_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_rep_act_capture_value_pct

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.tot_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_time_alloc_hours_weekly_test

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/act_time_alloc_summary.tmdl`
Table: `act_time_alloc_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.nlp_avg_confidence

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_nlp_summary.tmdl`
Table: `ai_conf_nlp_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.nlp_classfied_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_nlp_summary.tmdl`
Table: `ai_conf_nlp_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.nlp_classified_records

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_nlp_summary.tmdl`
Table: `ai_conf_nlp_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.nlp_not_classified_due_to_ambiguity_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_nlp_summary.tmdl`
Table: `ai_conf_nlp_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.nlp_not_classified_due_to_missing_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_nlp_summary.tmdl`
Table: `ai_conf_nlp_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.nlp_not_classified_records_due_to_ambiguity

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_nlp_summary.tmdl`
Table: `ai_conf_nlp_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.nlp_not_classified_records_due_to_missing

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_nlp_summary.tmdl`
Table: `ai_conf_nlp_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.nlp_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_nlp_summary.tmdl`
Table: `ai_conf_nlp_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.nlp_score_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_nlp_summary.tmdl`
Table: `ai_conf_nlp_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.nlp_total_records

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_nlp_summary.tmdl`
Table: `ai_conf_nlp_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_conf_overall_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_pred_qual_summary.tmdl`
Table: `ai_conf_pred_qual_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_conf_overall_score_instry_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_pred_qual_summary.tmdl`
Table: `ai_conf_pred_qual_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_conf_overall_score_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_pred_qual_summary.tmdl`
Table: `ai_conf_pred_qual_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_conf_score_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_pred_qual_summary.tmdl`
Table: `ai_conf_pred_qual_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pred_qual_score_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_pred_qual_summary.tmdl`
Table: `ai_conf_pred_qual_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pred_qual_trueai_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_pred_qual_summary.tmdl`
Table: `ai_conf_pred_qual_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_with_scores

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_with_scores_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_with_scores_ae

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_with_scores_am

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_with_scores_sdr

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_with_scores_ae_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_with_scores_am_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_with_scores_sdr_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_avg_confidence

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_score_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_ae

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_am

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.skills_reps_sdr

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ai_conf_skills_summary.tmdl`
Table: `ai_conf_skills_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_string

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_asof

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_year_full

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.context_min

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.context_max

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_company_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_currency

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_reference_date

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_partner_product_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_partner_co_id

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_partner_base64_logo

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_copyright_msg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_partner_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.company_history_trueai_platform_version

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.company_history_as_of

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_processed_asof

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getFiscalYearOffset

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.fiscal_year_contional_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_existing_customer_selling_auc

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_prospecting_auc

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_post_sales_support_auc

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_new_logo_selling_auc

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_existing_customer_selling_r2

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_prospecting_r2

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_post_sales_support_r2

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_new_logo_selling_r2

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.fiscal_year_conditional_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_adj_duration

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_reset_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_adj_duration_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_act_capt_lvl_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_closing_ability

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_closing_ability_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_deal_maxing

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_deal_maxing_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_discovery_skill

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_discovery_skill_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_engagement_ability

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_engagement_ability_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_time_management

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_time_management_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_work_effort

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_ci_work_effort_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_getFiscal_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_accts_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_accts_industry_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_accts_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_accts_leadsource_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_leads_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_leads_industry_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_leads_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_leads_leadsource_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_opps_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_opps_industry_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_opps_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_opps_leadsource_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_ssr_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_ssr_industry_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_ssr_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_ssr_leadsource_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_success_prob

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_scores_success_prob_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_completeness_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/completeness_summary.tmdl`
Table: `completeness_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_completeness_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/completeness_summary.tmdl`
Table: `completeness_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_completeness_score_industry_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/completeness_summary.tmdl`
Table: `completeness_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_completeness_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/completeness_summary.tmdl`
Table: `completeness_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_completeness_geo_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/completeness_summary.tmdl`
Table: `completeness_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_completeness_marketing_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/completeness_summary.tmdl`
Table: `completeness_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_completeness_contact_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/completeness_summary.tmdl`
Table: `completeness_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_completeness_contact_method_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/completeness_summary.tmdl`
Table: `completeness_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_completeness_score_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/completeness_summary.tmdl`
Table: `completeness_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_consistency_count_address_city

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_consistency_count_address_country

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_consistency_count_address_state

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_consistency_count_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_consistency_count_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_consistency_count_title

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_consistency_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_consistency_score_industry_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_count_address_city

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_count_address_country

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_count_address_state

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_count_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_count_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_count_title_concat

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_improvement_country

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_improvement_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_improvement_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_improvement_title

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_score_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_consistency_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_consistency_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/consistency_summary.tmdl`
Table: `consistency_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.contact_trueai_completeness_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/contacts.tmdl`
Table: `contacts`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_dupe_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/dupe_summary.tmdl`
Table: `dupe_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_dupe_score_industry_avg_display

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/dupe_summary.tmdl`
Table: `dupe_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_dupe_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/dupe_summary.tmdl`
Table: `dupe_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_dupe_score_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/dupe_summary.tmdl`
Table: `dupe_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_dupe_problem_records

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/dupe_summary.tmdl`
Table: `dupe_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_dupe_problem_records_pct

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/dupe_summary.tmdl`
Table: `dupe_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_records

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/dupe_summary.tmdl`
Table: `dupe_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_corrected_records

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/dupe_summary.tmdl`
Table: `dupe_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_dupe_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/dupe_summary.tmdl`
Table: `dupe_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_dupe_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/dupe_summary.tmdl`
Table: `dupe_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_refresh_date

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/Last Refresh Date.tmdl`
Table: `'Last`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lead_crm_converted_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lead_crm_conversion_rate

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lead_crm_no_leadsource_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lead_crm_no_leadsource_rate

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lead_trueai_dupe_rate

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lead_trueai_company_dupe_rate

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lead_trueai_completeness_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lead_trueai_dupe_counts

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lead_trueai_non_dupe_counts

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.leads_trueai_unique_company_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.leads_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/leads.tmdl`
Table: `leads`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_industry_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_industry_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_industry_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_leadsource_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_adj_duration_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_booking_calibration_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_act_capt_lvl_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_closing_ability_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_deal_maxing_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_discovery_skill_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_engagement_ability_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_alloc_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_management_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_work_effort_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_existing_customer_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_general_score_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_industry_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_leadsource_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_line_items_products_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_list_price_items_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_new_logo_selling_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_histories_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_industry_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_leadsource_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_performance_tiers_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_post_sales_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_potential_ACV_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_prospecting_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ramping_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_rep_org_calibration_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_revenue_calibration_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_industry_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_leadsource_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_success_analysis_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_vi_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_leadsource_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_adj_duration_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_booking_calibration_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_act_capt_lvl_conf_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_closing_ability_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_deal_maxing_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_discovery_skill_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_engagement_ability_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_allocation_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_management_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_work_effort_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_existing_customer_selling_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_general_score_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_industry_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_leadsource_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_new_logo_selling_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_history_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_industry_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_leadsource_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_performance_tiers_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_post_sales_support_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_potential_acv_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_prospecting_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ramping_count_rate_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_rep_org_calibration_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_revenue_calibration_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_sales_process_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_industry_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_leadsource_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_success_factor_analysis_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_booking_calibration_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_allocation_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_existing_customer_selling_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_new_logo_selling_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_history_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_post_sales_support_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_prospecting_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ramping_perf_conf_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_rep_org_calibration_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_revenue_calibration_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_success_factor_analysis_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_line_items_products_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_list_price_items_non_default_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_sales_process_any_rules_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_sales_process_any_rules_std_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_leadsource_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_adj_duration

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_adj_duration_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_booking_calibration

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_booking_calibration_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_act_capt_lvl_conf

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_act_capt_lvl_conf_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_closing_ability

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_closing_ability_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_deal_maxing

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_deal_maxing_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_discovery_skill

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_discovery_skill_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_engagement_ability

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_engagement_ability_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_alloc

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_alloc_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_management

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_management_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_work_effort

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_work_effort_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_general_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_general_score_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_industry_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_leadsource_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_line_items_products

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_line_items_products_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_line_items_products_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_list_price

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_list_price_items_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_list_price_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_new_logo_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_history

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_history_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_industry_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_leadsource_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_performance_tiers

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_performance_tiers_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_potential_acv

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_potential_acv_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_existing_customer_selling_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_new_logo_selling

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_new_logo_selling_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_post_sales_support

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_post_sales_support_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_prospecting_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ramping

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ramping_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_rep_org_calibration

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_rep_org_calibration_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_revenue_calibration

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_revenue_calibration_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_sales_process

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_sales_process_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_industry

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_industry_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_leadsource_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_success_factor_analysis

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_success_factor_analysis_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.average_ai_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_act_capt_lvl_text

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.analysis_cat_weighted_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores_analysis_categories.tmdl`
Table: `metadata_ai_scores_analysis_categories`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.metadata_score_weighting_pct

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_ai_scores_category_links.tmdl`
Table: `metadata_ai_scores_category_links`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rules_list_std_crm_owner_rule_applied_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_rule_list.tmdl`
Table: `metadata_rule_list`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rules_list_non_crm_owner_rule_applied_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_rule_list.tmdl`
Table: `metadata_rule_list`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rules_list_total_crm_owner_rule_applied_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/metadata_rule_list.tmdl`
Table: `metadata_rule_list`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_trueai_completeness_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.report_versions_current_ver

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/report_versions.tmdl`
Table: `report_versions`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_score_industry_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_sales_process_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_sales_process_score_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_all_ade_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_all_ade_score_industry_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_all_ade_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_all_ade_score_improvement

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_sales_process_score

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_any_rules_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_ownership_rules_std_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_ownership_rules_non_std_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_end_rules_non_std_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_end_rules_std_count 

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_outcome_rules_non_std_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_outcome_rules_std_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_any_rules_non_std_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_sales_process_any_rules_std_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/sales_process_summary.tmdl`
Table: `sales_process_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_trueai_conversion_rate

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_trueai_converted_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_trueai_no_leadsource_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_trueai_no_leadsource_rate

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_has_leads_and_accounts_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_unique_with_only_accounts

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_non_unique_with_only_accounts

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_leads_accts_counts

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## Last Data Date

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_summary

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_touched_accounts

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_adj_dur_conf

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_total_count

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_duration_per_act_min

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_duration_adjusted_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_count_avg

File: `powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_string_full

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## DumpFilters cal_end_dates

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.dynamic_date_period

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.context_date_min

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.context_date_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.context_prev_period_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.context_prev_period_min

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.first_filt_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.end_of_prev_year_as_of

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_string

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.relative_year

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_date_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.relative_month

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.relative_qtr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.relative_week

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.relative_day

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_first_of_year_date_string

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_year

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_date_min

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_new_terminations_pos

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.prior_year

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.active_user_filter_string

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_page_filter_string

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_labels_accounts_cust_field_1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_labels_accounts_cust_field_2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_labels_accounts_cust_field_3

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_labels_opps_cust_field_1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_labels_opps_cust_field_2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_labels_opps_cust_field_3

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_string_full_updated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.target_screen_filter_string

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.criteria_active_filters_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_lead_gen_w_thresh

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_threshold_filter_less_than_3%

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_threshold_filter_lead_less_than_3%

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_threshold_filter_less_than_3%_updated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_date_of_previous_quarter

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_date_previous_quarter

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.check_dates

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_labels_leads_cust_fiel_1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_labels_leads_cust_fiel_2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_labels_leads_cust_fiel_3

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_role_aliased_effectiveness_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_role_aliased_performance_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_user_role

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.cal_end_sel_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_filter_string

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_context_min_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_context_max_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_string_as_of

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.date_filter_string

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_string_as_of_full

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_end_dates.tmdl`
Table: `cal_end_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_selected_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_start_dates.tmdl`
Table: `cal_start_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sel_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/cal_start_dates.tmdl`
Table: `cal_start_dates`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_reference_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_currency

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_partner_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_partner_co_id

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_partner_product_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_partner_base64_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_copyright_msg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_not_init

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.company_history_trueai_platform_version

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_company_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.company_history_company_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.company_history_as_of

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_history_processed_asof

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.metadata_config_reset_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.metadata_config_ramp_months

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.metadata_config_churned_years

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.metadata_config_new_logo_selling_def

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.metadata_config_lead_abandonment_cycle

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getFiscalYearOffset

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.fiscal_year_conditional_text

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_score_getFiscal_text

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_ae_am_average_annual_booking

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_sdr_annual_avg_pipeline_created

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_ae_average_annual_booking

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_am_average_annual_booking

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_ci_annual_avg_bookings

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_ci_annual_avg_pipeline_created

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_reset_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_adj_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_created_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_repeat_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_new_logo_lead_vi_value_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_existing_customer_lead_vi_value_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_new_logo_pre_vi_value_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_existing_customer_pre_vi_value_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_new_logo_sell_vi_value_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_existing_customer_sell_vi_value_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_lead_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_pre_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_sell_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_new_logo_lead_pre_sell_vi_value_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_existing_customer_lead_pre_sell_vi_value_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_total_vi_value_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_lead_actual_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_pre_actual_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_sell_actual_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_new_logo_actual_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_existing_customer_actual_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_new_logo_expected_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_new_logo_diff_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_existing_customer_expected_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_existing_customer_diff_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.vi_value_Lead_expected_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.vi_value_pre_expected_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.vi_value_sell_expected_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_lead_diff_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_pre_diff_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_sell_diff_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_tuning_shares_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_reps_w_ta

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pi_reps_count_w_ta

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.vi_lead_combined_matrix_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.vi_pre_combined_matrix_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.vi_sell_combined_matrix_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.vi_lead_pre_sell_combined_matrix_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sh_explicit_pre_vi_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.untouched_prospecting_pred_vi_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.post_sales_pred_amount_vi_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sh_actual_combined_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sh_expected_combined_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sh_diff_combined_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sh_explicit_pre_vi_amt_1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_new_logo_pre_vi_value_amt_1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_existing_customer_pre_vi_value_amt_1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sh_total_actual_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sh_total_expected_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sh_total_diff_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.vi_lead_pre_sell_total_actual_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.vi_lead_pre_sell_total_expected_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.vi_lead_pre_sell_total_diff_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.in_last_12m_from_reference_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl`
Table: `companies_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas._debug_fmt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/DimDiscountTier.tmdl`
Table: `DimDiscountTier`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas._test_number

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/DimDiscountTier.tmdl`
Table: `DimDiscountTier`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas._debug_force_number

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/DimDiscountTier.tmdl`
Table: `DimDiscountTier`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas._debug_force_format_string

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/DimDiscountTier.tmdl`
Table: `DimDiscountTier`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas._debug_force_format_source

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/DimDiscountTier.tmdl`
Table: `DimDiscountTier`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas._debug_selected_format

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/DimDiscountTier.tmdl`
Table: `DimDiscountTier`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_refresh_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/last_refresh_date.tmdl`
Table: `last_refresh_date`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_industry

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_adj_duration

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_booking_calibration

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_act_capt_lvl_conf

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_closing_ability

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_deal_maxing

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_discovery_skill

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_engagement_ability

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_alloc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_management

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_work_effort

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_general_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_industry

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_line_items_products

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_list_price

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_history

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_industry

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_performance_tiers

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_potential_acv

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_new_logo_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_post_sales_support

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_pred_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ramping

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_rep_org_calibration

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_revenue_calibration

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_industry

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_success_factor_analysis

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_vi

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_allocation_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_existing_customer_selling_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_line_items_products_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_list_price_items_non_default_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_new_logo_selling_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_post_sales_support_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_prospecting_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ramping_perf_conf_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_success_factor_analysis_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_vi_tuning_share_diff_factor2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_industry_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_accts_leadsource_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_adj_duration_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_act_capt_lvl_conf_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_closing_ability_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_deal_maxing_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_discovery_skill_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_engagement_ability_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_allocation_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_time_management_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_work_effort_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_existing_customer_selling_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_general_score_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_industry_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_leads_leadsource_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_line_items_products_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_list_price_items_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_new_logo_selling_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_history_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_industry_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_leadsource_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_performance_tiers_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_post_sales_support_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_potential_acv_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_prospecting_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ramping_count_rate_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_rep_org_calibration_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_revenue_calibration_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_industry_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ssr_leadsource_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_success_factor_analysis_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_vi_step_diff_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_score_formula

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_score_measure_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_factor1_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_factor2_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_factor3_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_factor3_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_text

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.average_ai_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_revenue_calibration_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_booking_calibration_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_rep_org_calibration_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_rep_org_calibration_factor3_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_booking_calibration_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_rep_org_calibration_test

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_sales_process

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_sales_process_any_rules_count_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_sales_process_any_rules_std_count_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_ci_act_capt_lvl_factor1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_scores_opps_history_factor2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_score_text_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores.tmdl`
Table: `metadata_ai_scores`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.analysis_cat_weighted_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores_analysis_categories.tmdl`
Table: `metadata_ai_scores_analysis_categories`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.metadata_score_weighting_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_ai_scores_category_links.tmdl`
Table: `metadata_ai_scores_category_links`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_score_kpi1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ai_score_kpi2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp1_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp1_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp1_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp1_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp10_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp10_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp10_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp10_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp11_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp11_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp11_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp11_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp12_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp12_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp12_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp12_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp13_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp13_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp13_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp13_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp14_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp14_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp14_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp14_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp15_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp15_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp15_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp15_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp16_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp16_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp16_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp16_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp17_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp17_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp18_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp18_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp2_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp2_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp2_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp2_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp3_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp3_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp3_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp3_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp4_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp4_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp4_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp4_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp5_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp5_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp5_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp5_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp6_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp6_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp6_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp6_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp7_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp7_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp7_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp7_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp8_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp8_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp8_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp8_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp9_kpi1_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp9_kpi1_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp9_kpi2_denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp9_kpi2_nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.check_kpi1_kpi2_weight

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getHeatmapConditionalColor

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getHeatmapConditionalColor_new

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getHeatmapKPI_AIScore

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getHeatmapKPI1_formula_used

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getHeatmapKPI2_formula_used

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getHeatmapRawScore

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getHeatmapScore

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKP2_Score_chng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1_Score_change_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1_score_cy

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1_score_cy_5q

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1_score_delta

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1_score_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1Denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1Denominator_Value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1Nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1Nominator_Value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1Weight

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2_Score_change_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2_score_cy

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2_score_cy_5q

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2_score_delta

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2_score_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2Denominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2Denominator_Value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2Nominator

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2Nominator_Value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2Weight

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_booking_growth_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_rounded_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_trust_data_pi

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.how_kpi1_calculated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.how_kpi1_component_considered

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.how_kpi1_score_calculation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.how_kpi2_calculated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.how_kpi2_component_considered

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.how_kpi2_score_calculation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.hypothesis_final_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.hypothesis_is_confirmed

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.KPI1_AI_score_bucket

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi1_ai_score_trust

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi1_ai_score_trust_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi1_score_cy

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.KPI2_AI_score_bucket

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi2_ai_score_trust

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi2_ai_score_trust_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.loading

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.combined_score_concatenated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.combined_score_top

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.combined_score_top_w_text

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1_value_cy

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1_value_delta

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI1_value_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2_value_cy

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2_value_delta

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.getKPI2_value_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi_combined_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi_combined_score_calculation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi_score_combined_text

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi1_score_change_text

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi1_score_last_3_month

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi1_score_last_3_prior_month

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi1_value_delta_concatenated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi1_value_delta_top

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi2_score_change_text

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi2_score_last_3_month

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi2_score_last_3_prior_month

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi2_value_delta_concatenated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.kpi2_value_delta_top

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp1_kpi1_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp1_kpi2_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp10_kpi1_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp10_kpi2_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp11_kpi1_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp11_kpi2_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp12_kpi1_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp12_kpi2_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp13_kpi1_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp13_kpi2_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp14_kpi1_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp15_kpi1_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp16_kpi1_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp16_kpi2_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp17_kpi1_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp18_kpi1_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp2_kpi1_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp2_kpi2_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp3_kpi1_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp4_kpi1_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp5_kpi1_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp6_kpi1_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp6_kpi2_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp7_kpi1_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp8_kpi1_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp8_kpi2_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp9_kpi1_denominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calc_hyp9_kpi2_nominator_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_combined_record_count_flag

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_kpi1_min_record_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_kpi1_min_record_factor_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_kpi1_record_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_kpi1_record_count_flag

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_kpi2_min_record_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_kpi2_min_record_factor_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_kpi2_record_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_kpi2_record_count_flag

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_ai_model_score_validation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_description

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_getKPI1_denominator_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_getKPI1_nominator_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_getKPI1_Score_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_getKPI1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_getKPI2_denominator_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_getKPI2_nominator_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_getKPI2_Score_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_getKPI2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_growth_category

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_growth_category_base64

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_growth_category_hypo_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_hypothesis_confirmed

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_hypothesis_id

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi_report_location

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi_screen

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_ai_score_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_calculation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_def_short

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_denominator_def

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_long_def

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_max_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_min_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_nominator_def

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_reference_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_score_calculation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_score_trend_calculation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_standard_dev_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_value_trend

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_weight_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi1_whats_better

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_ai_score_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_calculation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_def_short

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_denominator_def

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_long_def

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_max_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_min_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_nominator_def

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_reference_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_score_calculation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_score_trend_calculation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_standard_dev_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_value_trend

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_weight_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_kpi2_whats_better

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_score_new

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_score_w_na_nd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.hypothesis_is_confirmed_details

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_kpi1_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_kpi1_min

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_kpi1_ref_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_kpi1_sd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_kpi2_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_kpi2_min

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_kpi2_ref_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_kpi2_sd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.get_category_base64

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.get_growth_category

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.heatmap_details_score_used_analysis

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_heatmap_items.tmdl`
Table: `metadata_heatmap_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_model_rule_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_rule_list.tmdl`
Table: `metadata_rule_list`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_model_rule_count_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_rule_list.tmdl`
Table: `metadata_rule_list`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_model_rule_total_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_rule_list.tmdl`
Table: `metadata_rule_list`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.total_current_model_rule_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_rule_list.tmdl`
Table: `metadata_rule_list`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.total_current_model_rule_count_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/metadata_rule_list.tmdl`
Table: `metadata_rule_list`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_engagement_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_last_eng_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_sel_date_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opp_sel_date_count_rob

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_last_eng_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_stkhlds_involved

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_quality_bucket

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_pipeline_current_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_tbl_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_expected_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_total_expected_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_total_expected_value_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_avg_win_prob

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_total_expected_value_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_count_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_count_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_avg_win_prob_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_avg_win_prob_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_pipeline_amt_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_pushed_pulled_day

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_pushed_pulled_day_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_pushed_pulled_day_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_avg_pace_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_trueai_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_list_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_avg_pace_score_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_avg_pace_score_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_pipeline_amt_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_age_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_age_days_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_age_days_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_initial_close_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_all_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_all_act_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_detail_sale_type

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_trueai_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_meeting_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_meeting_act_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_phone_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_phone_act_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_email_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_email_act_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_social_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_social_act_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_all_act-non_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_phone_act-non_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_email_act-non_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_meeting_act-non_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_social_act-non_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_act_eng_counts

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_act_non_eng_counts

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_act_eng_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.closed_opps_age_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.step_sub_type

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_creator_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_details_screen_age

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_details_screen_pushed_pulled

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_last_eng_date_filter

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.closed_opps_pushed_pulled_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_crm_deep_link

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_details_opps_rep_involved

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_account_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_details_most_recent_step_outcome

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_details_most_recent_step_sub_type

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_count_tbl_filter

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_concate_measure

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_age_days_filter

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## Days Difference

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_trueai_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_details_most_recent_sales_type

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_pace_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_details_avg_pace_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_items_trueai_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_pace_score_test

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_stage_sort_index

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_avg_days_in_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_deals_reached_next_stage_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_deals_reached_stage_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_lost_deals_in_stage_tot_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_lost_deals_in_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_total_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_lost_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_won_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_lost_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_booking_amt_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_count_id

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_discount_id

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_crm_opp_id

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_deals_reached_stage_count_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_lost_deals_in_stage_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_lost_booking_amt_in_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_stages_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_deals_skip_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_deals_skip_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_total_deals_won

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_deals_stage_count_won

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_deals_accumulated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_histories_crm_stage_names

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_details_screen_trueai_pushed_pulled

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_pipeline_sum_days_in_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl`
Table: `open_pipeline`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_won_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_lost_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_won_new_logo_existing_cust_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_new_logo_existing_customer_selling_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_existing_customer_selling_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_new_logo_selling_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_post_sales_support_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_prospecting_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_all_step_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_trueai_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_line_items_trueai_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_book_amt_opp_line_book_amt_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_crm_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_is_open

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_order

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_rec

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_step_by_step

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_step_by_step_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_opps_step_by_step_slicer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_opps_is_open

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.total_opp_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_booking_lost_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_avg_deal_size_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_of_crm_deep_link

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_cust_num1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_cust_num2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_cust_num3

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_cust_num4

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_cust_num5

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_cust_num6

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_cust_num7

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.won_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_booking_amt_total

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lost_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_booking_amt_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_sales_cycle_avg_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lost_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_lost_amt_in_stage_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_booking_lost_amt_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_max_stages

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_win_rate_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_booking_amt_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_booking_amt_reached_next_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_total_crm_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_optimal_disc_level

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_optimal_discount_deal_count_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_over_discounted_deal_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_no_discount_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_over_discount_deal_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_optimal_discount_deal_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_no_discount_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_under_discount_deal_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_under_discount_deal_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.optimal_discount_tier_background

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_optimal_discount_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_over_discount_amount

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_under_discount_amount

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_discount_avg_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_discount_avg_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_avg_discount_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas._diagnostic_delta_test

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_over_discounted_total

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_disc_avg_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_valid_amount

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_optimal_disc_label

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_deals_in_optimal_tier

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_excess_over_discount_amount

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.optimal_discount_pct_midpoint

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_excess_over_discount_amount_by_tier

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_nd_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_nnb_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_downgrade_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_cross_sale_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_renewal_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_arr_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_one_time_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_mrr_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_expansion_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_non_nnb_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl`
Table: `opps`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_line_item_discount_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_line_item_discount_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.discount_line_opps

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_line_item_dis_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_line_item_total_price_after_discount

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_lines_item_discount_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.delta_expected_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_average_discount_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_avg_deals_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_deal_discount_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_deals_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_delta_expected_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_tot_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_line_items_avg_discount_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_line_item_total_price_before_discount

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_line_items_trueai_list_price

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.avg_discount_pct_change

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opp_line_items_trueai_total_price

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opp_line_items.tmdl`
Table: `opp_line_items`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_1_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.selected_metric_coef

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.avg_opp_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_generated_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_open_pipeline_amount_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_open_pipeline_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_2_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.companies_currency

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_min_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_w_max_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_min_generated_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_generated_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_open_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_open_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_open_pipeline_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_open_pipeline_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_1_min

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_2_min

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_1_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_2_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.new_logo_avg_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_w_max_new_logo_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_w_min_new_logo_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.existing_customer_selling_avg_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_w_max_existing_customer_selling_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_w_min_existing_customer_selling_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_average_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_generated_leads

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_generated_leads

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_generated_leads

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_average_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_average_adj_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_adj_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_adj_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_average_open_pipeline_success_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_open_pipeline_success_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_open_pipeline_success_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_adj_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_adj_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_adj_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_eng_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_eng_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_eng_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_average_email_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_email_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_email_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_average_phone_call_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_phone_call_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_phone_call_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_average_meeting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_meeting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_meeting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_average_social_media_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_social_media_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_social_media_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_average_nd_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_nd_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_nd_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_prospecting_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_new_logo_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_post_sales_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_existing_customer_selling_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_internal_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_post_sales_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_prospecting_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_new_logo_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_existing_customer_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_internal_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_post_sales_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_prospecting_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_new_logo_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_existing_customers_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_internal_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_prospecting_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_new_logo_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_post_sales_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_avg_existing_customer_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_existing_customer_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_prospecting_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_new_logo_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_max_post_sales_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_prospecting_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_new_logo_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_post_sales_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_min_existing_customer_adj_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas._debug_is_group_applied

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.slicer_placeholder

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.restricted_line_chart_only_performance_metric_value_secondary

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_min

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_median

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_std_deviation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_sum

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_correlation_metric1_vs_metric2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rank_reps_by_selected_sorting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_avg_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_count_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_max_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_min_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_median_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_std_deviation_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_sum_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_1.tmdl`
Table: `performance_metric_1`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.selected_string_full_metrics

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.selected_string_metric_2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sort_performace_metric

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.selected_metric_1_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.selected_metric_2_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.selected_string_metric_1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_sum

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_min

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_median

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_std_deviation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_secondary_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.concat_selected_perf_metric1_and_metric2_names

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_sort_select_dynamic_slicer_label

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_avg_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_count_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_max_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_median_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_min_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_std_dev_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performance_metric_value_secondary_sum_peer

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/performance_metric_2.tmdl`
Table: `performance_metric_2`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_unique_accounts

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_unique_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_total_price

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_avg_qty

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_avg_list_price

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_avg_unit_price

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_total_list_price

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_avg_sales_cycle

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_avg_time_spent_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_total_time_spent_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_booking_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_account_penetration_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_included_won_deals_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_all_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_win_deals_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.product_family_avg_expected_win_rate_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/products.tmdl`
Table: `products`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_prob_lower_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_prob_upper_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_buckets_step_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket__new_logo_r2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_existing_customer_selling_r2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket__prospecting_r2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_post_sales_r2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_new_logo_auc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_existing_customer_selling_auc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_prospecting_auc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_post_sales_auc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_buckets_bucket_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_min_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.lead_gen_success_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_conditional_background_color

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_combined_r2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_combined_auc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_conditional_r2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.quality_bucket_conditional_auc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/quality_buckets.tmdl`
Table: `quality_buckets`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.report_versions_current_ver

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/report_versions.tmdl`
Table: `report_versions`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_week_of

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_phone_call_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_start

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_phone_call_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_start

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_phone_call_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_start

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_call_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_email_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_email_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_email_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_email_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_social_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_social_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_social_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_social_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_meeting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_meeting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_meeting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_meeting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_time_spent

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_time_spent

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_time_spent

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_eng_time_spent

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_eng_time_spent

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_eng_time_spent

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_time_spent

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_eng_time_spent

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_won_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_won_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_won_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_lost_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_lost_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_lost_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_won_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_lost_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_won_opps_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_won_opps_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_won_opps_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_won_opps_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_touched_accts_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_touched_accts_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_touched_accts_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_touched_accts_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.last_week_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.current_week_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.next_week_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_rep_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_rep_group

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_rep_manager_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_rep_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_rep_role

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_user_pipeline_amt_peers_rank_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_user_pipeline_amt_peers_rank_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_user_pipeline_amt_peers_rank_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_user_booking_amt_peers_rank_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_user_booking_amt_peers_rank_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_user_booking_amt_peers_rank_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_user_combined_success_prob

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_user_combined_success_prob_w_peers

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_generated_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_last_quarter_perf

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sel_rep_details_open_leads

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prior_3months_prospecting_time

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prior_3months_new_logo_time

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prior_3months_post_sales_time

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prior_3months_existing_customer_time

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prior_3months_internal_time

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_user_pi_timelineness_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_current_month_new_logo_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.peer_rank_per_user_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## User Rank

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_current_month_prospecting_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_current_month_post_sales_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_current_month_existing_customer_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_current_month_internal_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prev_month_new_logo_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prev_month_prospecting_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prev_month_post_sales_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prev_month_existing_customer_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prev_month_internel_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prev_last_month_new_logo_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prev_last_month_prospecting_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prev_last_month_post_sales_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prev_last_month_existing_cutomer_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_details_prev_last_month_internal_purpose_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_details_week.tmdl`
Table: `rep_details_week`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_metric_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_overview_table.tmdl`
Table: `rep_overview_table`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_overview_table.tmdl`
Table: `rep_overview_table`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_min

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_overview_table.tmdl`
Table: `rep_overview_table`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.rep_overview_max

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/rep_overview_table.tmdl`
Table: `rep_overview_table`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_trueai_conversion_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_trueai_converted_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_trueai_no_leadsource_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_trueai_no_leadsource_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## measure.ssr_touched_accounts

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_new_logo_won_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_hsitory_accounts_per_prospecting_rep

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_touch_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_crm_opp_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.leadsource_record_count_sort

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.record_counts

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_crm_contact_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_crm_lead_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_crm_account_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_trueai_potential_acv

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr.tmdl`
Table: `ssr`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_churned_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_churned_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_new_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_retained_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_retained_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_new_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_ending_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_starting_amount

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_touched_accounts

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_acct_count_untouched

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_churned_avg_age_months

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_cagr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_period_growth_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_retained_avg_acct_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_retained_avg_acct_age

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_new_growth_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_churned_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_acct_ltv

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_starting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_post_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_per_acct_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_avg_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_touched_accounts_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_acct_count_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_acct_count_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_acct_count_post_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_acct_count_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_per_acct_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_per_acct_post_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_per_acct_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_post_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_avg_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_avg_post_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_avg_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_post_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_post_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_untouched

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_per_acct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_avg_combined_prospecting_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_reps_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_reps_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_reps_post_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_reps_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_avg_combined_post_sales_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_existing_customer_selling_annual_purchases_acct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_combined_post_sales_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_combined_prospecting_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_ending_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_prev_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_retention_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_mkt_gen

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_mkt_gen_probability_of_conversion 

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_mkt_gen_vi_vc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_sales_gen_probability_of_conversion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_sales_gen_vi_vc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_inbound

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_outbound

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_inbound_probability_of_conversion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_inbound_vi_vc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_outbound_probability_of_conversion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_outbound_vi_vc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_created_per_hr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_per_step

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_created_per_rep

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_rep_week

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_reps

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_pipeline_amount_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_pipeline_count_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_cycle_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_cycle_avg_success

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_cycle_avg_failure

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_avg_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_pipeline_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_count_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_cycle_initially_expected

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_propensity_highest_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_propensity_high_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_propensity_mid_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_propensity_low_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_propensity_lowest_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_per_prior_step

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_failure_lost_stage_early_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_failure_lost_stage_late_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_failure_lost_stage_mid_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_activity_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_phone_call_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_phone_call_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_email_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_social_media_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_meeting_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_email_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_social_media_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_meeting_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_title_function_most_common

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_title_level_most_common

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_title_function_most_common_portion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_title_level_most_common_portion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_title_function_second_common

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_title_level_second_common

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_title_function_second_common_portion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_title_level_second_common_portion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_row_filler

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_title_level__most_common_highest

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_title_level__most_common_highest_portion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_prior_step_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_prosp_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_post_sales_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_untouched

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_lead_gen

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_for_new_logo_and_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_combined_new_logo_and_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_ending_avg_acct_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_ending_max_acct_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_pareto_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_pareto_count_tot

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_pareto_percentage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_pareto_percentage_remaining

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rep_users_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_pipeline_amt_user_eop_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_new_business

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_existing_business

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_new_business_sold_to

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_new_business_won

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_new_business_prospected_to

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_existing_business_supported

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_existing_business_upsold_to

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_existing_business_won

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ytd_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_success_count_true

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_success_count_false

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_avg_combined_prospecting_post_sales_support

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_avg_combined_prospecting_post_sales_support_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_gen_vi_vc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_probability_of_conversion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_touched

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_touched_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_touched_avg_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_is_open_pipeline

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_win_prob

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_adj_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_age

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_days_pushed

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_count_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_count_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_amt_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_age_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_adj_amt_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_days_pushed_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_win_prob_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_win_prob_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_adj_amt_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_age_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_amt_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_asof_open_pipeline_days_pushed_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_asof_open_pipeline_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_all_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_all_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_last_year_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_all_closed_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_all_expected_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_all_new_logo_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_all_new_logo_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_all_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_all_lead_gen

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_last_year_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_last_year_closed_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_last_year_expected_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_last_year_new_logo_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_last_year_new_logo_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_last_year_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_last_year_lead_gen

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_prior_to_last_year_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_prior_to_last_year_closed_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_prior_to_last_year_expected_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_prior_to_last_year_new_logo_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_prior_to_last_year_new_logo_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_prior_to_last_year_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_prior_to_last_year_lead_gen

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_prior_to_last_year_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_current_year_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_current_year_closed_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_current_year_expected_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_current_year_new_logo_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_current_year_new_logo_won_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_current_year_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_current_year_lead_gen

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_current_year_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_vi_value_created

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_pipeline_post_sales_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_pipeline_prospecting_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_pipeline_post_sales_renewals_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_pipeline_post_sales_expansion_sale_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_won_new_logo_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_won_existing_customer_selling_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_lost_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_table_row_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## OLD.meas.ssr_history_duration_hrs_per_step

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_stakeholders_most_common_first_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_won_amt_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_won_amt_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_avg_won_amt_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_rev_avg_won_amt_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_adj_dur_conf

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_list_reps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_tot_open_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_user_booking_amt_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_user_booking_amt_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_user_booking_amt_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_deal_size

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_avg_sales_cycle

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_open_pipe_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.active_list_owner_user_role_aliased

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_user_full_name_role_group

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_history_active_hire_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_deals_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.manager_direct_active_mgr_full_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_user_pipeline_amt_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_user_pipeline_amt_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_active_user_pipeline_amt_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.peer_booking_amt_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_user_peers_avg_booking_amt_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_user_peers_avg_booking_amt_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_user_peers_avg_booking_amt_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_user_peers_avg_pipeline_amt_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_user_peers_avg_pipeline_amt_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_user_peers_avg_pipeline_amt_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_full_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_rep_day

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_new_logo_pros

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_count_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_ssr_id_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_avg_mkt_sales_probability_of_conversion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_unique_reps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_unique_reps_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_reps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_per_acct_post_sales_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_per_acct_prospect_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_spent_avg_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_spent_avg_eng_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_spent_weekly_avg_non_eng_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_eng_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_dur_hr_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_eng_dur_hr_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_dur_hr_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_eng_dur_hr_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_non_eng_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_non_eng_dur_hr_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_non_eng_dur_hr_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_eng_rate_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_eng_rate_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_avg_eng_rate_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_peers_avg_eng_rate_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_peers_avg_eng_rate_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_peers_avg_eng_rate_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_new_logo_avg_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_prospecting_avg_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_existing_customer_selling_avg_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_post_sales_avg_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_internal_avg_dur_hr_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_new_logo_avg_dur_hr_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_prospecting_avg_dur_hr_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_post_sales_avg_dur_hr_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_existing_customer_selling_avg_dur_hr_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_internal_avg_dur_hr_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_new_logo_avg_dur_hr_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_prospecting_avg_dur_hr_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_post_sales_avg_dur_hr_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_existing_customer_selling_avg_dur_hr_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_internal_avg_dur_hr_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_internal_avg_dur_hr_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_new_logo_avg_dur_hr_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_prospecting_avg_dur_hr_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_post_sales_avg_dur_hr_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_existing_customer_selling_avg_dur_hr_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_internal_avg_dur_hr_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_new_logo_avg_dur_hr_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_prospecting_avg_dur_hr_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_post_sales_avg_dur_hr_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_existing_customer_selling_avg_dur_hr_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_internal_avg_dur_hr_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_new_logo_avg_dur_hr_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_prospecting_avg_dur_hr_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_post_sales_avg_dur_hr_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_weekly_existing_customer_selling_avg_dur_hr_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_updated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mkt_leads_probability_of_conversion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sales_leads_probability_of_conversion

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_new_logo_sales_process_step

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_prospecting_sales_process_step

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_post_sales_sales_process_step

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_existing_customer_selling_sales_process_step

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_probability_of_conversion_w_thresh

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_new_logo_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_accts_per_rep_post_sales_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_created_first_touched_age

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_total_adj_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_last_engage_age_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_propensity

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_target_acct_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_count_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_count_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_count_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_count_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_count_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_count_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_count_mtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_count_qtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_count_ytd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pred_conv_rate_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pred_conv_rate_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pred_conv_rate_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pred_conv_rate_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pred_conv_rate_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pred_conv_rate_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pred_conv_rate_mtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pred_conv_rate_qtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pred_conv_rate_ytd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_time_spent_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_time_spent_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_time_spent_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_time_spent_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_time_spent_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_time_spent_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_time_spent_mtd_sply_dif

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_time_spent_qtd_sply_dif

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_time_spent_ytd_sply_dif

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_eng_time_spent_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_total_adj_eng_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_eng_time_spent_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_eng_time_spent_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_eng_time_spent_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_eng_time_spent_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_eng_time_spent_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_eng_time_spent_mtd_sply_dif

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_eng_time_spent_qtd_sply_dif

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_eng_time_spent_ytd_sply_dif

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_converted_acct_count_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_target_converted_acct_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_converted_acct_count_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_converted_acct_count_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_converted_acct_count_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_converted_acct_count_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_converted_acct_count_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_converted_acct_count_mtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_converted_acct_count_qtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_converted_acct_count_ytd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_target_abandoned_acct_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_abandoned_acct_count_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_abandoned_acct_count_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_abandoned_acct_count_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_abandoned_acct_count_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_abandoned_acct_count_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_abandoned_acct_count_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_abandoned_acct_count_mtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_abandoned_acct_count_qtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_abandoned_acct_count_ytd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_target_disqualified_acct_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_disqualified_acct_count_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_disqualified_acct_count_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_disqualified_acct_count_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_disqualified_acct_count_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_disqualified_acct_count_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_disqualified_acct_count_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_disqualified_acct_count_mtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_disqualified_acct_count_qtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_disqualified_acct_count_ytd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_adj_eng_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_adj_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_adj_non_eng_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_opp_initial_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_new_logo_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_pipeline_count_eop_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_pipeline_win_rate_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_filter_screen

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_stkhlds_tot_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_latest_outcome

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_pipeline_success_count_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_count_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_won_amt_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_pipeline_success_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_reps_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sales_booking_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_users_tot

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_total_all_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_success_prob

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_owner_full_name_with_acl

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_owner_avg_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_time_effort_src

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_time_effort_conf

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_failure_lost_stage_nd_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mkt_leads_inbound

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_dept_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_gen_vi_vc_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_touched_updated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_touched_ratio_updated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_inbound_leads_touched_avg_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_prospecting_inbound

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_prospecting_inbound

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.all_stkhlds_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.all_stkhlds_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_currency

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.crm_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_addr_location

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_closed_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_trueai_book_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_trueai_sales_type

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_trueai_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.owner_full_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_outcome

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.step_owner_group

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.step_owner_role

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.step_owner_user_role_aliased

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.step_users_total

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_contacts_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_first_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_last_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_last_eng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_contact_card_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_contact_first_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_contact_first_eng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_contact_last_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_contact_last_eng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_contact_seniority

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_contact_title_department

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_contact_title_seniority

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_full_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_seconary_contact_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_secondary_contact_card_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_secondary_contact_first_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_secondary_contact_first_eng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_secondary_contact_last_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_secondary_contact_last_eng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_secondary_contact_title_department

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_secondary_contact_title_seniority

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.tot_pushed_pulled_close_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_addr_city

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_addr_state

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_company_size

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_curr_acv

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_first_purchase

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_leadsource_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_potential_acv

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_propensity

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_deals_lost_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_deals_won_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_opps_rev_avg_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_opps_step_cycle_avg_success

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_counts

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_email_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_eng_counts

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_eng_email_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_eng_meeting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_eng_social_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_meeting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_phone_calls

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_phone_eng_calls

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_social_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_eng_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_non_eng_counts

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_non_eng_email

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_non_eng_meeting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_non_eng_phone_calls

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_non_eng_social_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_non_eng_act_counts

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_secondary_full_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.tot_lost_amt_opps

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.tot_won_amt_opps

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_label

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_label_entity_cust_field_1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.aliasing_labels_cust_field

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.bucket_num

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_greater_than_thresh

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_last_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_secondary_last_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.test_done.average_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_social_media_engagement_rate-test

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_meeting_avg_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_social_media_avg_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_phone_call_avg_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_email_avg_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_activity_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_activity_avg_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_next_step_bucket

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.total_opps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.total_won_opps

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.total_opps_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_average_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_count_sys_doc_id

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.adj_dur_confidence

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.adj_dur_confidence_status_number

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_unsuccessful_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_dur_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_step_post_sales_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sel_date_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sel_date_count2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sel_date_most_recent_start_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sel_date_pipeline_generated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_leads_gen_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sales_engineer_success_prob_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_not_sales_engineer_success_prob_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_leads_gen_conv_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_next_steps_prob

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_acct_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_leadgen_conversion_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mkt_leads_touched

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_generated_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_won_amt_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_won_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_won_count_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_won_amt_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_won_cycle_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_won_cycles_days_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_win_rate_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pushed_pulled_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_pushed_pulled_days_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_initial_actual_booking_diff_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_avg_initial_actual_amt_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_avg_won_amt_per_rep

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_pipeline_amt_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_rate_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_avg_won_amt_per_rep_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_leads_gen_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_leads_gen_time

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_leads_gen_conv_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_leads_gen_count_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_leads_gen_time_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_leads_gen_conv_rate_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_pipeline_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_pipeline_avg_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_pipeline_avg_win_prob

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_expected_win_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_generated_pipeline_amt_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_pipeline_count_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_pipeline_avg_amt_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_pipeline_avg_win_prob_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_expected_win_amt_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_new_logo_existing_customer_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_first_touched_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_cal_end_sel_date_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_total_open_leads_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_target_screen_step_outcome

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_total_untouched_leads_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_owner_full_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_owner_group

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_open_leads_accts_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_open_leads_accts_added_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_open_leads_accts_first_touch_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_leads_accts_stkhlds_contact_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_open_trueai_industry

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_open_lead_crm_leadsource

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_leads_accts_quality_bucket

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_leads_accts_stkhlds_act_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_open_leads_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_lead_accts_last_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_leads_accts_total_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_open_leads_accts_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_open_leads_accts_potential_acv

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.step_outcome

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_total_ignored_leads_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_total_abandoned_leads_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_open_leads_avg_prediction_conv_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.filter_cal_start_dates_with_end_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sel_date_count3

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sel_date_card_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_accts_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sel_date_count4

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_leads_time_to_touch_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.open_leads_tbl_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_first_touch_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_top_250_leads

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_last_act_days

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_won_amt_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_won_amt_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_won_amt_mtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_won_amt_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_won_amt_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_won_amt_qtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_won_amt_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_won_amt_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_won_amt_ytd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_pipeline_amt_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_pipeline_amt_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_pipeline_amt_mtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_pipeline_amt_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_pipeline_amt_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_pipeline_amt_qtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_pipeline_amt_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_pipeline_amt_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mgmt_rpt_pipeline_amt_ytd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_activity_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_activity_avg_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_activity_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_email_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_email_avg_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_email_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_meeting_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_meeting_avg_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_meeting_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_phone_call_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_phone_call_avg_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_phone_call_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_social_media_avg_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_social_media_avg_eng_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ta_ssr_history_all_social_media_engagement_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_asof_open_pipeline_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.avg_time_spent_per_step

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_w_first_touch

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_asof_open_pipeline_expected_value

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.avg_time_spent_per_deal_ratio_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.avg_time_spent_per_deal_ratio_new_logo_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.avg_time_spent_per_deal_ratio_post_sales_support

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.avg_time_spent_per_deal_ratio_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_leads_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mkt_inbound_leads_with_first_touch

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_count_mkt_prospecting_inbound

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_inbound_mkt_leads_touched_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_rate_mkt_prospecting_inbound

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.annual_booking_mrr_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.annual_booking_mrr_won_amt_text

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.annual_booking_mrr_new_logo_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.annual_booking_mrr_existing_customer_selling_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_eng_duration_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_all_phone_call_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_social_media_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_all_act_nd_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mrr_won_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mrr_won_amt_new_logo

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_mrr_won_amt_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_deals_stage_accumulation

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_deals_stage

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_duration_hrs_lost_deals

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_dur_hrs_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_involvement_per_opp_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_acts_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_acts_avg_ae

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_acts_avg_am

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_acts_avg_mgmt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_acts_avg_sdr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_acts_avg_other

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_dur_hrs_avg_sdr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_dur_hrs_avg_ae

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_dur_hrs_avg_other

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_dur_hrs_avg_mgmt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_dur_hrs_avg_am

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_owner_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_owner_avg_ae

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_owner_avg_am

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_owner_avg_mgmt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.opps_per_owner_avg_other

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_involvement_per_opp

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.total_opps_count_dist

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.trueai_potential_acv_per_step_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas._debug_selected_metric

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.dynamic_metric_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sum_opp_renewal_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sum_opp_one_time_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sum_opp_cross_sale_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sum_opp_nd_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sum_opp_downgrade_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_sum_opp_expansion_amt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.pipeline_amt_sum

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history.tmdl`
Table: `ssr_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_first_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_last_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_first_eng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_last_eng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_seniority

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_title_dept

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_name_and_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_name_and_title_most_senior

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_most_senior_title_dept

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_most_senior_first_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_most_senior_last_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_most_senior_last_eng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_most_senior_seniority

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_primary_dur_involvement

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_secondary_dur_involvement

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_most_senior_dur_involvement

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.other_stkhlds_involv_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.stkhlds_full_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.other_stkhlds_title_dept

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.other_stkhlds_seniority

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.other_stkhlds_last_eng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.prim_stkhlds_dur_involvement

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sec_stkhlds_dur_involvement

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_stakeholders.tmdl`
Table: `ssr_history_stakeholders`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_impact

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_impact_positive

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_impact_negative

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_impact_neutral

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_factors_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_factors_all_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_factors_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.success_prob_factors_most_impact_str

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_feature_impact

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_success_prob_factors_pct_how_many

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.top_factor_name_by_impact

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/ssr_history_success_factors.tmdl`
Table: `ssr_history_success_factors`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_delta_prev_period

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_trend_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_display_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_display_key_metric_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_score_display_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_key_metric_display_pct_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_display_reference_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_delta_12mo_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_key_metric_display_ratio_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_display_reference_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_concern_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_concern_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_trend_display

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## measure.strat_summary_industry_score_display

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_key_metric_display_hrs_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_key_metric_display_decimal_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_display_reference_hrs

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_display_reference_decimal

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_score_display_eop_existing_cust_exp

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_score_display_eop_for_new_logo_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_score_display_eop_for_rep_perf

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_score_display_eop_for_sales_and_market

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_score_display_eop_for_target_and_segment

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.strat_summary_all_score

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/strat_summary.tmdl`
Table: `strat_summary`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.fiscal_config_offset

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/time_intelligence.tmdl`
Table: `time_intelligence`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_user_roles_concat

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_user_roles_concat_w_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_user_roles_concat_w_count_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_user_roles_function_concat_w_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_rep_stats_bookings

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_rep_stats_bookings 1

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_table_row_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_is_active

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_overview_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate_mtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate_qtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_win_rate_ytd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_rate_mtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_rate_mtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_mtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_rate_qtd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_rate_qtd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_qtd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_rate_ytd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_rate_ytd_sply

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_overview_avg_pred_conv_ytd_sply_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ssr_history_actual_win_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_trueai_full_name

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl`
Table: `users`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_adj_total_eng_dur_hr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_reps_all_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_reps_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_adj_dur_per_reps

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_adj_eng_dur_per_reps

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_adj_non_eng_dur_per_reps

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_adj_total_non_eng_dur_hr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_reps_count_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_trueai_total_dur_hr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_trueai_dur_per_reps

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_avg_capture_adj_factor

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_avg_prep_factor

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_adj_total_dur_hr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_bar_date_filter

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_reps_all_distinct_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.act_capt_lvl_reps_distinct_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_email_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_email_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_call_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_call_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_social_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_social_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ci_act_capt_lvl_latest_month

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ci_act_capt_lvl_most_latest_previous

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_avg_ci_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ci_act_capt_lvl_latest_previous_diff

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_call_dur_weekly

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_email_dur_weekly

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_social_dur_weekly

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_meeting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_meeting_dur

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_trueai_meeting_dur_weekly

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_prospecting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_new_logo_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_post_sales_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_existing_customer_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_activities_internal_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_activities.tmdl`
Table: `users_activities`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_mgr_count_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_new_hires_reached_performer_within_12_months

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_new_terminations

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_individual_contrib_count_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_rep_mgr_ratio

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_new_terminations_within_12_months

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_ci_perf_tier_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_net_new_users

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_ci_perf_annual_avg_bookings

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_bop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_change

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_new_hires

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_new_terminations_within_12_months_avg_tenure

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_new_hires_reached_performer_success_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_new_terminations_within_12_months_failure_rate

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_new_hires_reached_performer_within_12_months_avg_tenure

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_ci_perf_annual_avg_pipeline_created

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ramping_reps_count_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_history_period_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_vi_value_received_all_prior_time

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_history_user_new_hires_reached_perf_in_12_month

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_history_user_new_hires_didnt_reach_perf_in_12_month

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_history_user_new_hires_terminated_in_12_month

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ci_perf_avg_attainment

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_ae

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_am

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_sdr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_all_sales_roles

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_mgr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_other

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_dept_mkt

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_dept_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_dept_other

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_change_perc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_nd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_w_actlvl_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_w_actlvl_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_w_time_allocation_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_w_time_allocation_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sys.user_id_for_am

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.di.trueai_opps_won_amt_am_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sys.user_id_for_ae

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sys.user_id_for_sdr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sys.user_id_for_nd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sys.user_id_for_other

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.di.trueai_opps_won_amt_ae_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.di.trueai_opps_won_amt_sdr_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.di.trueai_opps_won_amt_nd_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.di.trueai_opps_won_amt_mgr_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.sys.user_id_for_mgr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.di.trueai_opps_won_amt_other_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_trueai_user_role_account_executive

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_trueai_user_role_account_manager

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_trueai_user_role_sales_manager

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_trueai_user_role_nd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_trueai_user_role_sales_development_rep

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_history_count_dept_sales

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_trueai_user_role_account_executive_in_group_nd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_trueai_user_role_all_salesteam

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_trueai_user_role_other

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.count_trueai_user_role_sales_executive

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_dept_support

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_dept_ops

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_eop_for_dept_nd

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_won_amt_user_eop_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_pipeline_amt_user_eop_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_won_amt_user_eop_avg_for_new_logo_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_won_amt_user_eop_avg_for_existing_acv

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_won_amt_user_eop_avg_for_new_acv

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.user_history_user_new_hires_terminated_in_12_month_pos

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_won_amt_user_eop_avg_for_existing_customer_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler2

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler3

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler4

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler5

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler6

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler7

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler8

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler9

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler10

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler11

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler12

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler13

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler14

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_row_filler15

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_turnover_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.time_allocation_total_not_eng

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ta_potential_vs_actual

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_turnover_pct_regrettable

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_new_terminations_regrettable

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_user_role_function_concat_w_count_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_all_avg_perf_tier

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_last_year_avg_perf_tier

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_prior_to_last_year_avg_perf_tier

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.exp_rpts_current_year_avg_perf_tier

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_all

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calibration_user_role_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_ci_perf_annual_avg_bookings_account_executive

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_ci_perf_annual_avg_bookings_account_manager

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_ci_perf_annual_avg_pipeline_created_sdr

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.perf_consider_mrasure

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calibration_department_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.calibration_group_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_ci_perf_status

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_12_Mos_ci_perf_status

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_count_rep_eop

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ramping_reps_details_title

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_w_time_allocation_prospecting_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_w_time_allocation_prospecting_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_w_time_allocation_new_logo_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_w_time_allocation_new_logo_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_w_time_allocation_prospect_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_all_time_allocation_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_user_rep_mgr_ratio_updated

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_users_tenure

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.data_logs_users_ramping_status

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ci_time_alloca_avg_existing_cust_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_time_allocation_confidence

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_time_allocation_confidence_status

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.time_allocation_confidence

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.peek_inside_text_supports_aab

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.peek_inside_text_supports_aapc

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.peek_inside_text_supports_ramping_time

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.peek_inside_text_supports_trueai_reference_date

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_r2_bg_color

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_auc_bg_color

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_avg_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ci_time_alloca_avg_prospecting

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ci_time_alloca_avg_new_logo_selling

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ci_time_alloca_avg_post_sales_support

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.users_history_ci_time_alloca_avg_internel

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_without_act_lvl_count

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_without_act_lvl_pct

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.reps_has_ci_act_capt_lvl

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.ci_act_capt_lvl_pi_owner_act

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.underperformer_annual_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.performer_annual_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.overperformer_annual_avg

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.

## meas.min_user_role_alias

File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl`
Table: `users_history`

Accuracy Score: 5/5
Completeness Score: 5/5
Agentic Clarity Score: 5/5

Issues Found:
- None

Recommendation:
No changes recommended.
