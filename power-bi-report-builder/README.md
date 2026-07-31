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
- Validation checks.

## What Goes Where

- `AGENTS.md`: the step-by-step workflow for Codex.
- `pbip_layout_rules.md`: where things go on the Power BI canvas.
- `theme_contract.md`: colors, fonts, and theme rules.
- `semantic_model_rules.md`: how to use measures and model objects.
- `validation_checklist.md`: what to check before saying the page is ready.
- `visual_json_patterns/`: reusable Power BI visual patterns.
- `tools/`: scripts that start builder runs, inspect PBIP files, validate output, and clean up report layout.
- `examples/implemented_pages/`: specs and notes for real pages we have built.
- `page_spec_template.md`: the working contract for a requested Power BI page.
- `issue_template.md`: a thin GitHub issue wrapper that points to the page spec.
- `runbook.md`: how to run the builder and cleanup scripts.

## Build Flow

1. Start with an approved spec from `../decision-support-framework`.
2. Inspect the existing PBIP report and Power BI model.
3. Reuse existing page and visual patterns.
4. Bind visuals to official Power BI model objects.
5. Apply layout, interactions, and theme.
6. Run automated PBIP checks.
7. Open the report in Power BI Desktop for final review.

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
9. Reuse approved page and visual patterns.
10. Build the bindings, layout, interactions, and theme.
11. Run automated PBIP checks.
12. Do the final Power BI Desktop inspection.
