# Decision Support Framework

This framework helps us turn a business question into something people can use to make a decision.

It is not tied to Power BI. The same thinking can be used for a Power BI page, a web app, a slide, a written brief, or any other format.

## The Problem

Without a framework, the work usually looks like this:

1. Start with a business question.
2. Codex guesses what to build.
3. A page gets created.
4. We spend many rounds fixing layout, wording, logic, and missing context.

## The Goal

We want the work to look like this:

1. Start with a business question.
2. Write a clear spec.
3. Agree on the data and definitions.
4. Pick the right information pattern.
5. Build the page, tool, slide, or write-up.
6. Check it before review.
7. Finish with something useful.

## Main Idea

Build decision-support experiences, not just reports.

Every chart, table, card, note, and score should help the user understand something, decide something, or take the next step.

## What This Framework Covers

This folder covers the parts that are true no matter where the final thing is built:

- What question are we answering?
- Who is this for?
- What decision should it support?
- What data is allowed to support the answer?
- What can we say, and what should we avoid saying?
- What pattern should we use to explain the answer?
- How do we check if the work is good enough?

## What It Does Not Cover

The platform-specific builder handles the actual implementation details.

For Power BI, that lives in `../power-bi-report-builder` and covers:

- PBIP files.
- Power BI visual JSON.
- Theme files.
- Semantic model measures.
- Report layout.
- Power BI Desktop review.

## End-To-End Flow

For Power BI, the full flow is:

1. Define the business question.
2. Identify the audience, decision, and intended action.
3. Agree on the data contract.
4. Write the page spec in a way that is not tied to one tool.
5. Pick the information design patterns.
6. Check the spec against Decision Support QA.
7. Hand the approved spec to the Power BI builder.
8. Inspect the existing PBIP report and Power BI model.
9. Reuse approved page and visual patterns.
10. Build the bindings, layout, interactions, and theme.
11. Run automated PBIP checks.
12. Do the final Power BI Desktop inspection.
