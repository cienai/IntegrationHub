# Generic Code Change Executor

Use for Engineering tickets that do not require a specialized Power BI or semantic-model workflow.

## Flow

1. Reproduce the current behavior with the command or steps from the ticket.
2. Identify the smallest affected code path.
3. Confirm allowed and prohibited changes.
4. Implement the scoped change.
5. Run formatting, syntax, unit, or repository checks named by the ticket.
6. Compare expected and actual behavior.
7. Self-correct implementation-level failures up to three attempts.
8. Produce handoff.

## Guardrails

- Do not touch Power BI artifacts unless the ticket explicitly allows it.
- Do not refactor unrelated code.
- Do not claim success without a passing verification command or documented blocker.
