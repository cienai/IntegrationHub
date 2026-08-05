# Semantic Model Rules

The Power BI semantic model is where reusable business logic should live.

Power BI pages should not quietly recreate important calculations inside one visual or one page.

## Order Of Preference

When a page needs a metric, dimension, flag, or threshold, use this order:

1. Reuse an existing official measure or field.
2. Add a new reusable Power BI model object if the business concept is new.
3. Use report-local logic only for display or formatting.
4. Avoid page-specific calculated tables.
5. Never rebuild business logic that already exists as an official measure.
6. Document every new model object.
7. Check summaries against their source measures.

## Measures

- Use existing measures first.
- Do not create a second measure that means the same thing.
- If the official measure is wrong, fix the official measure.
- Add a new measure only when the spec defines a new business idea.
- Put new measures where future builders can find and reuse them.

## Dimensions And Buckets

- Use existing dimensions and buckets first.
- Do not invent new buckets directly on a report page.
- If a bucket is needed, define it in the data contract first.
- Treat blank, unknown, and uncategorized values consistently.

## Calculated Tables

- Avoid page-specific calculated tables.
- Use a calculated table only when it creates a reusable analytical surface.
- Document the table grain, filters, and intended reuse.
- Do not use calculated tables to hide missing measures or broken relationships.

## Report-Local Logic

Report-local logic is OK for:

- Visual titles.
- Display labels.
- Sort helpers.
- Color rules.
- Presentation-only filters.

Report-local logic is not OK for:

- Revenue.
- Bookings.
- Pipeline.
- Conversion.
- Success.
- Churn.
- Forecast definitions.
- Population membership.
- Business thresholds used in conclusions.
- AI score interpretation.

## Document New Model Objects

For every new model object, document:

- What it means.
- What one row or value represents.
- What filters it assumes.
- Where it should be reused.
- How it relates to existing measures.
- How to check that it is correct.

## Reconciliation

Numbers that should match need to match.

Check that:

- Headline cards match source measures.
- Tables and matrices match the same source measures when filtered the same way.
- Saved DAX query tests match report visuals.
- Any difference has a clear reason.
