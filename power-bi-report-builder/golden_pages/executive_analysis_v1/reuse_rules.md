# Executive Analysis v1 Reuse Rules

1. Copy approved visual groups from `RepOpportunityOverlap` rather than recreating them from scratch.
2. Preserve coordinates, padding, fonts, fills, borders, z-order, and alignment unless the ticket explicitly requests a different pattern.
3. Replace only page-specific bindings, titles, labels, navigation targets, and narrative text.
4. Do not copy page-specific DAX, measures, thresholds, filters, or business logic.
5. Treat the footer as modular. Preserve the canonical footer styling, grid, typography, spacing, version strip, Peek Inside banner, and colored AI-score threshold legend, but assemble only the variable footer content modules required by the page specification.
6. Use the existing `cardVisual` executive card as the default executive-card pattern.
7. Use the existing page header, report label, logo, title band, and back button as fixed page chrome.
8. Use the existing table formatting for executive evidence tables.
9. Use the existing AI score panel when the ticket includes governed AI scores.
10. Do not invent new visual styling when an approved pattern exists in this golden package.
11. Do not alter the golden reference page during ordinary builder runs.
12. Record every intentional deviation in the page spec and validation output.

## Copy Scope

| Copy | Replace |
|---|---|
| Visual container geometry | Query bindings |
| Formatting objects | Display names |
| Header chrome and footer modules | Page title and summary text |
| Card/table/chart visual shell | Measures, dimensions, sort, filters |
| Footer module shell | Page-specific definitions, caveats, configuration, and AI-score notes |

## Footer Modules

- Do not recreate footer visuals from scratch.
- Copy approved footer modules from the golden page or another approved page.
- Footer module count may vary by page.
- Resize and reposition modules to fit the approved footer grid without overlap, truncation, or empty placeholder panels.
- Preserve the Peek Inside banner and colored AI-score threshold legend as footer constants.
- Preserve the platform-version strip and copyright strip unless the page spec explicitly excludes them.
- Include the AI score module when the page specification requires a governed AI score or when the approved reference page pattern requires the score context to remain paired with the threshold legend.
- Preserve compact configuration table geometry from the approved module, including its height, narrow padding, and 2px row/column/cell spacing.
- Include configuration, definitions, caveats, or other-considerations modules only when they carry required page-specific content.

## Approved Deviations

Future tickets may declare exceptions for:

- Fewer or more executive cards when the spec requires a different metric count.
- A full-width chart or full-width table in place of the table/chart split.
- No empty score, configuration, footnote, or other-considerations placeholders. If a variable module is excluded, remaining modules must still respect the approved footer grid and constants.
- Adjusted detail table height when the ticket needs a different evidence grain.
- Report-specific navigation target changes.

Undeclared deviations should be treated as validation issues.
