# Performance Correlation – Outcome Anchor, Bands, Top Drivers

This guide explains how to use the new measures and toggle table to make the Correlation Scores view decision-ready without altering calculations or redesigning the core matrix.

## What was added
- Measures (in `performance_metric_1` table):
  - `meas.selected_outcome_name`: shows chosen outcome metric (from secondary metric list)
  - `meas.correlation_abs`: absolute value of correlation
  - `meas.correlation_band`: strength band (Strong/Moderate/Weak)
  - `meas.correlation_is_meaningful`: 1 when correlation ≥ 0.3
  - `meas.meaningful_filter_applied`: 1 when toggle = "Meaningful only"
  - `meas.correlation_for_display`: blanked-out correlation when filter demands meaningful only
- Disconnected toggle table:
  - `correlation_filter_toggle[ShowMeaningfulOnly]` with values: All, Meaningful only

## Outcome Selector (Results Anchor)
- Use the existing "Metric 2" selection (secondary metric) slicer bound to `metadata_performance_metrics_secondary[metric_name]` as the outcome selector.
- Display `meas.selected_outcome_name` in a card to reinforce the anchor.

## Strength Bands & Filtering
- On the matrix visual that shows `performance_metric_1` vs selected metric 2 correlations:
  - Replace value field with `meas.correlation_for_display` (so weak items blank out when filtered).
  - Add conditional formatting → `Rules` using `meas.correlation_band` via field value or use color scale by `meas.correlation_abs` and custom legend.
- Add a slicer bound to `correlation_filter_toggle[ShowMeaningfulOnly]`.
  - Default = All; Selecting "Meaningful only" hides correlations < 0.3.

## Top Drivers Summary
- Create a table visual with rows = performance metric (from `performance_metric_1`) and values:
  - `meas.correlation_abs`
  - (Optional) raw `meas.correlation_for_display`
- Sort by `meas.correlation_abs` descending.
- Create two variants or add a visual-level filter:
  - Top Positive: filter `meas.correlation_for_display` ≥ 0
  - Top Negative: filter `meas.correlation_for_display` < 0

## Contextual Guidance (Tooltips)
- Add a tooltip page or use report page tooltips.
- Display: selected outcome (`meas.selected_outcome_name`), raw correlation, `meas.correlation_band`, and short guidance text.

## Wiring Steps (Utility Box Report)
1. Add a card showing `meas.selected_outcome_name` near the correlation matrix title.
2. Add the `correlation_filter_toggle[ShowMeaningfulOnly]` slicer (horizontal buttons recommended).
3. Matrix:
   - Values: `meas.correlation_for_display`
   - Rows/Columns: keep existing metric fields as-is.
   - Conditional formatting: color by `meas.correlation_abs` or band via rules.
4. Top Drivers:
   - Create two small tables (Positive/Negative), each filtered by sign; sort by `meas.correlation_abs` desc; show top N.

## Notes
- No changes to underlying correlation calculations.
- All additions are opt-in; existing visuals continue to work until you swap in `meas.correlation_for_display`.
- Thresholds: Strong ≥ 0.5, Moderate ≥ 0.3, Weak < 0.3 (includes ≤ 0.1). Adjust in DAX if needed.
