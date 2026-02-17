# Hard Rename Notes: propensity -> propensity

## Summary
This change hard-renames the specified propensity fields to propensity across semantic models, measures, metadata exports, and report artifacts. Old identifiers are removed (no aliases), and label/description text has been updated from ?Propensity/Propensity? to ?Propensity/propensity? where applicable.

## Mapping Table
| Old | New |
| --- | --- |
| trueai_propensity | trueai_propensity |
| trueai_propensity_num | trueai_propensity_num |
| entity_propensity | entity_propensity |
| entity_propensity_num | entity_propensity_num |
| step_next_propensity | step_next_propensity |
| step_next_propensity_num | step_next_propensity_num |
| di_pred_new_logo_propensity_tiers | di_pred_new_logo_propensity_tiers |
| di_pred_post_sales_propensity_tiers | di_pred_post_sales_propensity_tiers |
| di_pred_prospecting_propensity_tiers | di_pred_prospecting_propensity_tiers |
| di_pred_existing_customer_propensity_tiers | di_pred_existing_customer_propensity_tiers |
| col.propensity_min_max_tier | col.propensity_min_max_tier |
| meas.ssr_history_propensity_highest_count | meas.ssr_history_propensity_highest_count |
| meas.ssr_history_propensity_high_count | meas.ssr_history_propensity_high_count |
| meas.ssr_history_propensity_mid_count | meas.ssr_history_propensity_mid_count |
| meas.ssr_history_propensity_low_count | meas.ssr_history_propensity_low_count |
| meas.ssr_history_propensity_lowest_count | meas.ssr_history_propensity_lowest_count |

## Validation Steps Performed
1. Searched repo for the old identifiers outside the allowlist docs (`docs/hard_rename_map_qual_to_propensity.yml`, `docs/hard_rename_propensity_to_propensity_impact.md`, `docs/hard_rename_propensity_to_propensity_notes.md`) and confirmed zero occurrences.
2. Searched for general ?Propensity/propensity? label text and replaced with ?Propensity/propensity? where used in descriptions or labels.
3. Verified report artifacts under `powerbi/src/**.Report/**` reference the new field names.

## Rollback Plan
Revert the commit that contains this hard rename.

## Release Checklist (Hard Rename)
- Merge semantic model + measures + metadata in same release
- Communicate ?breaking change? to report owners
- Trigger refresh/rebuild of semantic layer
- Republish or refresh impacted reports
- Monitor refresh failures for missing-field errors
