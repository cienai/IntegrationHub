# Analytical Contract

The analytical contract is the data contract.

It says what data is allowed to support the answer.

It connects the business question to the finished page. It keeps us from making claims that the data does not support.

## Why This Matters

Before we build anything, we need to agree on:

- Who or what we are analyzing.
- What each row means.
- What time period applies.
- What we compare against.
- Which metrics are official.
- Which filters and sample-size rules apply.
- What the data cannot prove.

## Population And Grain

Answer these:

- What is included?
- What is excluded?
- What does one row represent?
- Are rows independent, grouped, or model-generated?

Example: one row might be one opportunity, one account, one rep, one month, or one characteristic bucket.

## Time Period

Answer these:

- What date range applies?
- Does the report filter control the date range?
- Is the date range fixed in the logic?
- How do we handle incomplete periods?

## Comparison Baseline

Answer these:

- What are we comparing against?
- Is the baseline all records, a prior period, a target, a peer group, or a model prediction?
- For percentages, what is the numerator?
- For percentages, what is the denominator?

## Metric Definitions

For every metric, define:

- What it means in business language.
- Whether higher is better, lower is better, or neither.
- How it should be formatted.
- Whether it is describing what happened, predicting what may happen, explaining a likely reason, or proving cause and effect.

## Filters And Thresholds

Define:

- Required page filters.
- Required visual filters.
- Include or exclude flags.
- Minimum sample size.
- Minimum volume.
- How blanks, unknowns, or uncategorized values should work.

## Source Of Truth

For every field, say where it comes from:

- Existing official metric or dimension.
- New official metric or dimension.
- Derived value used only for display.

If an official metric already exists, use it. Do not recreate it under a new name.

## Official Vs Display-Only

Official metrics can support conclusions.

Derived or report-local values should only help with display unless they are promoted into the official model.

Examples:

- OK for display: dynamic title text, sort helper, color rule.
- Not OK as report-local logic: revenue, bookings, win rate, churn, pipeline, success count, forecast risk.

## What We See Vs What Caused It

Be clear about what the data can prove.

- Descriptive means "this is what we see."
- Predictive means "the model estimates this."
- Causal means "this caused that."

Most report pages describe what happened or show a prediction. They do not prove cause and effect.

Do not say something caused success unless we actually tested cause and effect.

## Make The Numbers Match

Numbers that claim to show the same thing should match.

Check that:

- Cards match source measures.
- Tables match cards when filtered the same way.
- Saved DAX queries match Power BI model measures.
- Differences are explained by filters, grain, date logic, relationships, or intentional business logic.

## Known Limits

Document anything that could change how someone reads the page:

- Small sample sizes.
- Missing data.
- Model coverage gaps.
- Provisional definitions.
- Business rules still waiting for approval.

## Contract Table

| Field | Type | Grain | Source of truth | Status | Plain-English definition | How to validate |
| --- | --- | --- | --- | --- | --- | --- |
|  | Metric/Dimension/Flag |  |  | Existing/New/Derived |  |  |

## Rule

If a conclusion cannot be traced back to this contract, it does not belong on the page.
