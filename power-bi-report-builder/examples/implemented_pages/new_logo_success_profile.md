# Page Spec: New Logo Success Profile

## Page Identity

- Page name: New Logo Success Profile
- Target report: Strategy Report
- Target report section: Near Sales Process Steps and New Business segmentation
- Canvas size: 1280 x 1900
- Page order: After Sales Process Steps
- Related existing pages: Sales Process Steps, New Business segmentation pages, Peek Inside - Trust Your Data

## Business Question

How do successful New Logo opportunities differ from the overall New Logo opportunity population in the selected context?

## Audience And Decision

- Primary audience: GTM and sales leadership.
- Decision supported: Understand which independent opportunity characteristics are overrepresented or underrepresented among successful New Logo opportunities.
- Action the user should be able to take: Identify where successful New Logo wins are disproportionately concentrated and decide what deserves deeper review.
- Time-to-understand target: Main pattern visible within 5 seconds.

## Analytical Contract

| Field | Type | Source of truth | Definition |
| --- | --- | --- | --- |
| Dimension | Dimension | Semantic model calculated table | Grouping family, initially Industry and Company Size. |
| Characteristic | Dimension | Semantic model calculated table | Bucket or member within the dimension. |
| Direction | Measure | Semantic model | Overrepresented when difference is positive; underrepresented when negative. |
| Share Of Successful New Logo Opportunities | Measure | Semantic model | Characteristic share of all successful New Logo opportunities. |
| Share Of All New Logo Opportunities | Measure | Semantic model | Characteristic share of all New Logo opportunities. |
| New Logo Difference | Measure | Semantic model | Successful share minus all-opportunity share. |
| New Logo Success Index | Measure | Semantic model | Successful share divided by all-opportunity share. |
| Business Impact | Measure | Semantic model | Volume-based label using successful count. |
| Successful New Logo Count | Measure | Semantic model | Count of won/successful New Logo opportunities. |
| All New Logo Count | Measure | Semantic model | Count of all New Logo opportunities, won and lost. |
| Dimension Sort | Column | Semantic model calculated table | Sort key for dimension display. |
| Include Row | Measure | Semantic model | 1 when support and difference thresholds are met. |

## Scope

- Included population: New Logo opportunities in the selected report period/context.
- Successful population: Won or successful New Logo opportunities.
- Baseline population: All New Logo opportunities in context, including won and lost.
- Initial dimensions: Industry and Company Size only.
- Excluded dimensions: Stakeholders, Opportunity Size, Sales Cycle, Lead Source, and any dimensions without agreed definitions.
- Required filters: Visuals should use Include Row = 1 where appropriate.
- Required thresholds: Successful count >= 25, all count >= 100, absolute difference >= 2 percentage points.
- Known caveats: Rows are independent descriptive differences, not tested combinations.

## Narrative Hierarchy

- Lead with: Which characteristics are meaningfully overrepresented or underrepresented among successful New Logo opportunities.
- Support with: Difference in successful share versus all-opportunity share.
- Drill into: Dimension-level rows for Industry and Company Size.
- Evidence: Detail matrix with shares, success index, counts, and caveats.

## Visual Plan

- Executive insight: Short context note explaining the business question.
- Executive cards: Strongest overrepresented characteristic, strongest underrepresented characteristic, highest business impact characteristic.
- Primary chart: Diverging bar chart showing New Logo Difference.
- Supporting table: Ranked insights by dimension and characteristic.
- Detail matrix: Analytical contract fields with counts and impact.
- AI score block: New Logo Selling Success Predictions.
- Footer: Peek Inside - Trust Your Data, data-quality scores, configuration items, and interpretation caveats.
- Navigation: Use Strategy Report header template with Back/Next or section navigation as applicable.

## Interpretation Rules

- Allowed language: "Successful New Logo opportunities are disproportionately concentrated in X."
- Allowed language: "X is overrepresented among successful New Logo opportunities compared with all New Logo opportunities."
- Prohibited language: "X causes success."
- Prohibited language: "The ideal opportunity is X + Y + Z."
- Causality caveat: Descriptive, not causal.
- Combination caveat: Do not infer combined profiles unless combinations are explicitly measured.

## Acceptance Criteria

- Business: Page answers the difference-between-successful-and-overall New Logo question.
- Model: Measures are official measures in the Sales Performance Power BI model.
- Layout: Header, page title, footer, cards, chart, and tables fit a 1280 x 1900 canvas with no overlap.
- Visual behavior: Detail visuals use Include Row = 1 if buckets otherwise show unsupported rows.
- Validation: PBIP JSON parses, lightweight layout validation passes, and Power BI Desktop review confirms visuals bind and render.
