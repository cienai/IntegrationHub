 
# Tables — Dataset: Azure Data Lake - Sales Performance

This lists semantic model tables found under `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/`.

Note: LocalDateTable_* files are excluded.

---

 - `act_capture_level_summary`
 - `ai_conf_pred_qual_summary`
 - `aliasing`
 - `all_act_support`
 - `auto_currency_format` (calculation group)
 - `cal_end_dates`
 - `cal_start_dates`
 - `companies_history`
 - `DimDiscountTier`
 - `Discount_opps_validation`
 - `groups`
 - `heatmap_graphics`
 - `last_refresh_date`
 - `managers_direct`
 - `managers_total`
 - `metadata_ai_scores`
 - `metadata_ai_scores_analysis_categories`
 - `metadata_ai_scores_category_links`
 - `metadata_config`
 - `metadata_graphics`
 - `metadata_heatmap_items`
 - `metadata_performance_metrics`
 - `metadata_performance_metrics_slicer`
 - `metadata_reference_values`
 - `metadata_rule_list`
 - `open_pipeline`
 - `opp_line_items`
 - `opps`
 - `opps_stages`
 - `orders_opps`
 - `performance_metric_1`
 - `performance_metric_2`
 - `performance_metric_format` (calculation group)
 - `products`
 - `quality_buckets`
 - `rep_details_week`
 - `rep_overview_table`
 - `report_versions`
 - `ssr`
 - `ssr_company_sizes`
 - `ssr_history`
 - `ssr_history_stakeholders`
 - `ssr_history_success_factors`
 - `strat_summary`
 - `time_intelligence` (calculation group)
 - `users`
 - `users_activities`
 - `users_history`
 - `users_managers`

---

If you want, I can also add any additional non-LocalDate tables not shown in the current folder snapshot and keep this list updated as the model evolves.

---

## Table Relations (from `definition/relationships.tmdl`)

- Source: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/relationships.tmdl`
- Only factual pairs are listed: From/To table and column. Date-related links to `LocalDateTable_*` exist in the source file but are intentionally omitted here for simplicity.

| From Table | From Column | To Table | To Column |
|---|---|---|---|
| `ssr_history` | `step_owner_id` | `users` | `_sys_doc_id` |
| `ssr_history` | `_sys_ssr_id` | `ssr` | `_sys_doc_id` |
| `strat_summary` | `_sys_user_id` | `users` | `_sys_doc_id` |
| `opp_line_items` | `crm_product_id` | `products` | `_sys_doc_id` |
| `users_activities` | `_sys_user_id` | `users` | `_sys_doc_id` |
| `opp_line_items` | `crm_opp_id` | `opps` | `_sys_doc_id` |
| `ssr_history` | `step_name_bucket_num` | `quality_buckets` | `step_name_bucket_num` |
| `users_history` | `_sys_user_id` | `managers_direct` | `_sys_doc_id` |
| `ssr_history` | `'col.sales_steps_opp_id'` | `opps` | `_sys_doc_id` |
| `open_pipeline` | `crm_opp_id` | `opps` | `_sys_doc_id` |
| `metadata_ai_scores_category_links` | `analysis_category_id` | `metadata_ai_scores_analysis_categories` | `_sys_doc_id` |
| `metadata_ai_scores_category_links` | `score_id` | `metadata_ai_scores` | `_sys_doc_id` |
| `ssr_history_success_factors` | `_sys_ssr_history_id` | `ssr_history` | `_sys_doc_id` |
| `ssr` | `trueai_company_size` | `ssr_company_sizes` | `trueai_company_size` |
| `ssr_history` | `opp_erp` | `orders_opps` | `Flag` |

