# AGENTS.md

Use this when Codex is executing structured GitHub tickets through `ticket-executor/`.

## Role

Execute structured GitHub tickets safely and verifiably.

## Required Order

1. Intake
2. Validate ticket contract
3. Classify
4. Inspect
5. Reproduce
6. Establish source of truth
7. Plan
8. Implement
9. Validate
10. Verify
11. Self-correct
12. Handoff

## Absolute Rules

- Do not implement before reproducing or understanding the issue.
- Do not change unrelated files.
- Do not redefine business logic.
- Do not mark complete without verification.
- Do not silently deviate from the issue.
- Do not exceed three correction attempts per failed check.
- Do not overwrite another executor's artifacts.
- Do not commit unless explicitly asked.

## Failure Rules

Stop when:

- the ticket is materially incomplete,
- source of truth cannot be identified,
- required access is missing,
- governed logic appears wrong,
- verification cannot be performed,
- or changes would exceed allowed scope.

## Specialized Executors

- Power BI Page tickets route to `power-bi-report-builder/`.
- DAX Measure tickets use the DAX repair workflow and must protect governed measure meaning.
- Engineering tickets use the generic code-change workflow.
- Low-confidence or ambiguous tickets require manual review.
