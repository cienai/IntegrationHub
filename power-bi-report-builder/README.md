# Power BI Report Builder

This folder is for building Power BI pages from approved decision-support specs.

The plain business thinking lives in `../decision-support-framework`. This folder handles the Power BI-specific work.

## What This Builder Does

It turns an approved spec into:

- A PBIP report page.
- Semantic model bindings.
- Power BI visual JSON.
- Theme-based formatting.
- Page layout.
- Closed-loop verification and validation checks.

## What Goes Where

- `AGENTS.md`: the step-by-step workflow for Codex.
- `design_system.md`: approved visual implementation rules extracted from canonical pages.
- `pbip_layout_rules.md`: where things go on the Power BI canvas.
- `theme_contract.md`: colors, fonts, and theme rules.
- `semantic_model_rules.md`: how to use measures and model objects.
- `validation_checklist.md`: what to check before saying the page is ready.
- `golden_pages/`: canonical page layouts and reusable visual inventories.
- `visual_json_patterns/`: reusable Power BI visual patterns.
- `tools/`: scripts that start builder runs, inspect PBIP files, validate output, and clean up report layout.
- `examples/implemented_pages/`: specs and notes for real pages we have built.
- `page_spec_template.md`: the working contract for a requested Power BI page.
- `issue_template.md`: a thin GitHub issue wrapper that points to the page spec.
- `runbook.md`: how to run the builder and cleanup scripts.

## Build Flow

1. Read the GitHub issue or approved page specification.
2. Inspect the target PBIP report and semantic model.
3. Load the approved golden-page layout when one applies.
4. Copy canonical page chrome and required visual patterns.
5. Replace page-specific content and bindings.
6. Add only the visuals required by the ticket.
7. Execute required verification queries.
8. Compare expected vs. generated output.
9. Diagnose and correct implementation-level mismatches.
10. Re-run failed verification checks, up to three correction attempts per failed check.
11. Validate against the golden layout and standard checklist.
12. Report intentional deviations, blockers, and the self-correction log.

To start from a GitHub issue:

```powershell
python power-bi-report-builder/tools/run_pbi_builder.py 1234
```

## Full Flow

1. Define the business question.
2. Identify the audience, decision, and intended action.
3. Agree on the data contract.
4. Write the page spec in a way that is not tied to one tool.
5. Pick the information design patterns.
6. Check the spec against Decision Support QA.
7. Hand the approved spec to this Power BI builder.
8. Inspect the existing PBIP report and Power BI model.
9. Load the relevant golden layout from `golden_pages/`.
10. Copy approved page chrome and visual patterns before adding new visuals.
11. Build the bindings, layout, interactions, and theme.
12. Execute verification queries and compare expected vs. generated output.
13. Correct page bindings, filters, sorting, formatting, or page-local calculations when they are the cause of a failed check.
14. Re-run failed verification checks, stopping after three correction attempts with a blocker report if still failing.
15. Run automated PBIP checks, including golden layout validation when applicable.
16. Do the final Power BI Desktop inspection.
