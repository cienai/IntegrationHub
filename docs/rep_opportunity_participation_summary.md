# `rep_opportunity_participation_summary`

## Implementation notes

The canonical semantic-model table
`rep_opportunity_participation_summary` returns one row per representative. The
saved query is a projection of that table, which allows saved-query consumers
and Power BI report visuals to use the same definition.

- **Claimed participation:** the current standardized opportunity owner,
  `opps[trueai_owner_id]`, for active opportunity records. The model contains no
  opportunity-team, overlay, specialist, or manual opportunity-assignment table.
  Historical step owners are therefore not treated as currently claimed.
- **Observed participation:** the sum of
  `ssr_history[step_owner_act]`, attributed by
  `ssr_history[step_owner_id]` and `ssr_history[entity_opp_id]`. Duration,
  activity-bearing sales-step count, step end date, and activity-capture level
  provide supporting evidence. `ssr_history` is filtered through the established
  `ssr[trueai_ssr_is_master] = TRUE()` pattern.
- **Identifiers:** opportunity joins use `opps[_sys_doc_id]` /
  `ssr_history[entity_opp_id]`; representative joins use
  `users[_sys_doc_id]`, `opps[trueai_owner_id]`, and
  `ssr_history[step_owner_id]`. Names are display fields only.
- **Relationships reused:** `ssr_history[step_owner_id] -> users[_sys_doc_id]`,
  `ssr_history[col.sales_steps_opp_id] -> opps[_sys_doc_id]`, and the
  `ssr_history` / `cal_end_dates` validity relationship. Virtual joins are used
  only to reconcile current opportunity ownership with historical, owner-level
  step aggregates.
- **Representative attributes:** `users[trueai_full_name]`,
  `users[trueai_group]`, and the existing calculated manager column
  `users[col.rep_details_rep_manager_name]`.
- **Pipeline:** `opps[trueai_booking_amt]`, once per representative-opportunity
  claim. The same opportunity can appear for only its current owner in this
  implementation.
- **Scoring (0-100):** activity count contributes up to 50 points (10 per
  activity), distinct activity-bearing steps up to 20 (5 per step), recency up
  to 20 (20 within 90 days, 10 within 180 days), and activity-capture quality
  5 or 10 points (10 at capture level >= 0.70).
- **Categories:** current claimed owners are Confirmed at score >= 60 with
  evidence in the last 90 days, Light below 60 with recent evidence, Inactive
  when attributable evidence exists but the latest activity-bearing step is
  older than 90 days, Claimed - No Evidence when opportunity history/capture
  data exists but no owner evidence does, and Insufficient Data when history or
  capture coverage is unavailable. An observed historical step owner who is not
  the current owner is Unclaimed.
- **Representative status:** Healthy requires a confirmed rate >= 70%, average
  score >= 60, and no unsupported pipeline. At Risk is a confirmed rate below
  40% or any unsupported pipeline. Remaining evaluable representatives are
  Monitor; a fully unevaluable claimed portfolio is Insufficient Data.
- **Date handling:** the summary is materialized at model refresh. Placeholder
  dates from 2050 onward are excluded when deriving the report date, and the
  recency anchor is the earlier of the refresh date and the maximum valid model
  date. Page-level date slicers do not recalculate this materialized summary.

Reusable semantic-model measures support report aggregation: Total Claimed
Associations, Total Confirmed Opportunities, Overall Confirmed Participation
Rate, Total Claimed Without Evidence, Total Inactive Contributors, Total
Unclaimed Contributions, Total Unsupported Pipeline, Selected Average
Participation Score, and Representative Count.

`Average Contributors per Opportunity` is intentionally omitted. The model
exposes only one formal current owner per opportunity; returning `1` would look
like a meaningful overlap metric while concealing the absence of team-assignment
data.

## Data limitations

- `ssr_history` stores aggregated owner activity rather than raw activity IDs.
  The query avoids step duplication by aggregating first, but cannot independently
  audit source-level activity deduplication.
- Activity-type counts in `ssr_history` are stakeholder-wide at the sales-step
  grain, not demonstrably representative-attributed. They are not used for the
  representative score.
- The latest attributable activity timestamp is unavailable. Recency uses the
  end date of the latest activity-bearing sales step as a supported proxy.
- No reliable opportunity-update, distinct-active-day, or representative-level
  stakeholder-engagement field exists at representative-opportunity grain.
- The model has test indicators, but no established saved-query exclusion
  convention for their string values was found; the query does not guess those
  values.
- The 90-day recency window and status/score thresholds are initial configurable
  assumptions requiring product-owner confirmation.

## Validation checklist

Static validation should confirm that every referenced table and column exists,
the final projection contains one row per `Rep ID`, and no Cartesian product is
used. Representative aggregation uses a distinct representative grain followed
by `GENERATE`; this avoids unsupported filtered `CURRENTGROUP()` expressions.
Runtime validation should reconcile sampled current owners to `opps`,
sampled observed contributors to `ssr_history`, all available categories,
pipeline values, score bounds, and representative uniqueness.

## Tactical Report page

`Tactical Report.Report` includes the visible page **Rep Opportunity
Participation & Overlap Analysis**. It binds only to the canonical summary table
and uses the Tactical Report theme and existing visual-container patterns.

The page contains Team, Manager, Status, and Rep slicers; six KPI cards; a
representative summary table; unsupported-pipeline, team-integrity, and status
distribution charts; a score-versus-pipeline scatter plot; and explanatory
assumption/status panels. The existing page navigators discover the page through
`pages.json`.

Because the source remains representative-grain, the page does not claim to show
individual opportunity overlap. True opportunity-overlap analysis still
requires an opportunity-grain supporting query.
