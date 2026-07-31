# AGENTS.md

Use this when Codex is building or changing a Power BI page.

The goal is not to make a page that merely has charts on it. The goal is to make a page that helps someone understand, decide, or act.

## Before Building

1. Read the approved decision-support spec.
2. Inspect the existing PBIP report.
3. Inspect the Power BI model objects used by the page.
4. Confirm the target report, page section, canvas size, and page order.
5. Map every metric and dimension to its source of truth.

## While Building

1. Reuse existing measures and dimensions first.
2. Add new Power BI model objects only when the spec defines a new business concept.
3. Use `visual_json_patterns/` for common visual layouts.
4. Use `pbip_layout_rules.md` for page layout.
5. Use `theme_contract.md` for colors, fonts, and theme limits.
6. Keep Power BI visual JSON edits small and focused.

## Source Of Truth

- Use Power BI model measures instead of report-local calculations for business logic.
- Do not copy an existing measure and rename it to solve a visual problem.
- If a visual needs an include/exclude rule, decide whether that rule belongs in the model or only in the visual.
- Keep DAX query test files aligned with the Power BI model.

## PBIP Rules

- Edit source files under `powerbi/src/`.
- Treat visual JSON as fragile.
- Preserve existing report behavior unless the spec says to change it.
- Keep changes scoped to the page and model objects needed for the request.
- Run JSON parsing and `git diff --check` after edits.
- Say clearly when Power BI Desktop review is still required.

## Done Means

The page is done only when:

- It answers the business question.
- It uses the approved data definitions.
- It follows the report layout and theme rules.
- Automated checks pass.
- Any remaining Power BI Desktop review items are called out.
