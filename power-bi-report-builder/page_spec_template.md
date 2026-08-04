# Power BI Page Spec Template

## Summary

Briefly describe the purpose of this page in one or two sentences.

---

## Business Question

What business question should this page answer?

---

## Audience

Who is this page primarily designed for?

Examples:

- Executive Leadership
- Sales Managers
- Revenue Operations
- Customer Success
- Individual Sales Reps

---

## Decision Supported

After reviewing this page, what decision should the user be able to make?

---

## Expected Outcome

Describe what the audience should understand after reading the page.

Examples:

- Identify the reps requiring coaching.
- Understand which opportunity characteristics consistently outperform.
- Prioritize pipeline cleanup efforts.

---

## Narrative Hierarchy

What should the page explain first, second, and third?

Lead with:

Support with:

Drill into:

Evidence:

Use this section to prevent detailed rows or outliers from becoming the executive headline unless the page is explicitly about those details.

Examples:

- Lead with: Overall participation health.
- Support with: Distribution by participation bucket and team-level comparison.
- Drill into: Outlier representatives below threshold.
- Evidence: Detailed representative-level table.

---

## Target Report

Report:

Page Name:

Navigation Location:

Related Existing Page:

Golden Layout:

Declared Layout Exceptions:

Primary AI Score:

Supporting AI Scores:

Should this be:

- New page
- Existing page enhancement
- Existing page replacement

---

## Data Contract

Population:

Grain:

Time Period:

Comparison Baseline:

Required Filters:

Minimum Sample Size:

Source of Truth:

---

## Verification Contract

Required Verification Queries:

Expected Outputs:

Comparison Rules:

Allowed Self-Corrections:

Verification Blockers:

---

## Metrics

| Metric | Existing Measure | Notes |
|---------|------------------|------|
| | Yes / No | |

---

## Dimensions

| Dimension | Source | Notes |
|-----------|--------|------|
| | | |

---

## Existing Assets To Reuse

Reference Pages:

Reference Visuals:

Golden Elements To Copy:

Golden Elements To Replace:

Reference Footer:

Reference Saved Queries:

Reference AI Score:

---

## Interpretation Rules

The page **may** conclude:

-

The page **must not** conclude:

-

Important assumptions or caveats:

-

---

## Information Design

Recommended page structure.

Executive Insight

Primary KPI Cards

Primary Analysis

Supporting Analysis

Detail Table

Peek Inside - Trust Your Data

Reuse existing page patterns where appropriate.

---

## Builder Constraints

- Reuse governed semantic model measures whenever possible.
- Do not create page-specific calculated tables without justification.
- Copy approved golden visual patterns before introducing new ones.
- Preserve canonical coordinates, padding, fonts, fills, borders, and alignment unless listed under Declared Layout Exceptions.
- Do not copy page-specific DAX, measures, thresholds, or business logic from a reference page.
- Reuse report navigation and page chrome.
- Follow `design_system.md`, the applicable golden package, and theme boundaries.

---

## Acceptance Criteria

The page is ready for review when:

- [ ] Business question is clearly answered.
- [ ] Theme applied correctly.
- [ ] Existing navigation reused.
- [ ] Applicable golden layout copied or intentional deviations declared.
- [ ] No unnecessary calculated tables.
- [ ] Source of Truth documented for every metric.
- [ ] Required verification queries executed.
- [ ] Generated output compared against expected output.
- [ ] Failed checks corrected and re-tested, or blocker documented.
- [ ] No truncated text.
- [ ] No unnecessary scrollbars.
- [ ] Validation checklist passes.
- [ ] Page is consistent with existing report patterns.

---

## Builder Deliverables

The completed implementation should include:

- Summary of work completed
- Existing measures reused
- New semantic model measures created
- Existing visuals reused
- New visuals created
- Existing saved queries reused
- New calculated tables, with justification
- Validation checklist results
- Verification query results
- Self-correction log, including failed checks, diagnosis, changes made, and final result
- Manual review items

---

## Notes

Anything else the builder should know.
