# AGENTS.md

Use this when Codex is building or changing a Power BI page.

The goal is not to make a page that merely has charts on it. The goal is to make a page that helps someone understand, decide, or act.

## Before Building

1. Read the GitHub issue or approved decision-support page spec.
2. Inspect the target PBIP report.
3. Inspect the Power BI semantic model objects used by the page.
4. Load the approved golden-page layout when one applies. For executive analysis pages, use `golden_pages/executive_analysis_v1/`.
5. Confirm the target report, page section, canvas size, page order, and any declared layout exceptions.
6. Map every metric and dimension to its source of truth.
7. Identify the narrative hierarchy before choosing visuals.

## Narrative Hierarchy

Before building cards, charts, or tables, decide what the page should explain first.

Use the spec's narrative hierarchy:

- Lead with: the highest-level answer for the audience.
- Support with: the main pattern or comparison.
- Drill into: lower-level details or outliers.
- Evidence: the table, notes, or detail view that proves the claim.

Do not promote individual reps, accounts, opportunities, transactions, or other detailed rows into the executive headline unless the business question is explicitly about those details. Outliers usually belong below the organizational or segment-level story.

## While Building

1. Copy canonical page chrome and required visual patterns from the golden layout before creating new visuals.
2. Reuse existing measures and dimensions first.
3. Add new Power BI model objects only when the spec defines a new business concept.
4. Replace only page-specific titles, labels, bindings, filters, sort order, and narrative text in copied visuals.
5. Do not copy page-specific DAX, thresholds, or business logic from the golden reference page.
6. Assemble footers from approved modules only. Keep the RepOverlap Peek Inside banner, separator, colored thresholds, and version strip as constants; module count may vary for score/configuration/footnotes, but do not leave empty placeholder panels.
7. Use `design_system.md` for approved implementation rules and `theme_contract.md` for theme boundaries.
8. Use `visual_json_patterns/` only when the golden layout does not already contain the needed pattern.
9. Keep Power BI visual JSON edits small and focused.

## Source Of Truth

- Use Power BI model measures instead of report-local calculations for business logic.
- Do not copy an existing measure and rename it to solve a visual problem.
- If a visual needs an include/exclude rule, decide whether that rule belongs in the model or only in the visual.
- Keep DAX query test files aligned with the Power BI model.

## PBIP Rules

- Edit source files under `powerbi/src/`.
- Treat visual JSON as fragile.
- Preserve existing report behavior unless the spec says to change it.
- Do not alter golden reference pages during ordinary builder runs.
- Keep changes scoped to the page and model objects needed for the request.
- Run JSON parsing, `git diff --check`, and applicable layout validation after edits.
- Say clearly when Power BI Desktop review is still required.

## Closed-Loop Data Verification

After implementation, execute all required verification checks.

If a check fails:

1. Compare the page binding, filter context, visual calculation, and verification source.
2. Identify the most likely root cause.
3. Correct only implementation-level issues that are within the approved page specification.
4. Re-run the failed check.
5. Repeat for no more than three correction attempts.
6. Record every correction and its result.

Codex may correct wrong visual bindings, wrong measure selection, missing or incorrect filters, quarter/date sorting, formatting and display units, max/min card logic, chart/table inconsistencies, accidental duplicated filters, and page-local calculations that disagree with governed measures.

Codex must not silently change governed business definitions, approved thresholds, canonical measures, the ticket's analytical contract, source data, or production semantic-model logic merely to make a test pass.

If the source of truth and the page disagree, determine whether the issue is the page implementation, verification query, filter context, source-of-truth mapping, or governed model logic. Only page implementation, verification query, and filter context should normally be auto-corrected. A suspected issue in governed model logic must be reported for manual review.

Do not mark the page complete while required checks are failing. If checks still fail after three correction attempts, stop and produce a blocker report.

## Done Means

The page is done only when:

- It answers the business question.
- It uses the approved data definitions.
- It follows the report layout and theme rules.
- It matches the applicable golden layout or documents approved deviations.
- Automated checks pass.
- Required verification checks pass, or a real blocker is documented.
- The self-correction log records failed checks, diagnoses, changes made, and final results.
- Any remaining Power BI Desktop review items are called out.
