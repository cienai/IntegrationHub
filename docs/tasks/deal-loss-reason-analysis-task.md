# [Dashboard] Deal Loss Reason Analysis: replace crowded charts with actionable table + metric fixes

## Context
Issue identified from stakeholder email review of the Deal Loss Reasons screen for Project Redwood (CoID/company currently analyzed). Feedback says current visuals are hard to interpret when many loss reasons exist.

## Problem Statement
Current page is visually dense and includes non-actionable categories (`(Blank)`, `No Response`), which makes insights unclear and weak for decision-making.

## Current Behavior
- KPI number formatting is inconsistent/hard to scan (`152.00K`, `109.56K`, `42.44K`).
- `% of deals have loss reason` is ambiguous (not clear if denominator is all deals vs lost deals).
- `Biggest Loss Driver` can surface `No Response`, which is non-actionable.
- Loss reason charts are crowded and difficult to read at high cardinality.
- Pie chart for revenue by loss reason is cluttered.
- Loss trend is generic and not tied to specific loss reasons.

## Desired Behavior
- Replace/augment key loss-reason charts with a sortable table focused on actionability.
- Exclude `(Blank)` and `No Response` by default from top reason/driver insights.
- Clarify KPI definitions (especially denominator for loss-reason coverage).
- Use compact readable KPI formatting (`152K`, `109K`, `42K`).
- Standardize loss reason dimension used in visuals (TrueAI standardized vs CRM raw) and apply consistently.
- Add reason-aware trend insight (e.g., top reasons by month/group), instead of generic total-only trend.

## Scope & Constraints
In scope:
- Tactical Report page: Deal Loss Reason Analysis.
- Visual and metric logic updates on this page.
- Default filter behavior for `(Blank)`/`No Response`.
- Definition text/tooltips for KPI logic.

Out of scope:
- Historical data backfill/reclassification.
- Cross-dashboard redesign outside this page.

## Acceptance Criteria
- [ ] KPI cards use compact format (`K`) with no unnecessary decimals.
- [ ] Loss reason coverage % explicitly uses Lost Deals as denominator (or clearly labeled if different).
- [ ] `(Blank)` and `No Response` are excluded by default from Biggest Loss Driver and top-reason insights.
- [ ] A table visual exists with at least: `Loss Reason`, `Lost Deals`, `% of Lost Deals`, `Revenue Lost` (sortable).
- [ ] Existing crowded pie/high-cardinality visuals are removed or de-prioritized in favor of the table.
- [ ] Loss reason source is standardized and documented (TrueAI standardized vs CRM raw), and used consistently.
- [ ] Trend section is improved to show monthly movement of top loss reasons (with `(Blank)`/`No Response` excluded).
- [ ] No regressions to page-level filters (`Sales Type`, `User Role`, `Group`, `Propensity`).

## Notes / References
- Source: stakeholder email feedback with annotated screenshots (Deal Loss Reason Analysis page).
- Key asks: use tables, exclude blank/no-response, clarify percentage logic, improve trend usefulness.

## Impact Level
High (user-facing, potentially misleading interpretation)
