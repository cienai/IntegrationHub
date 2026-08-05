# Report Page Design

Power BI pages should feel like decision surfaces: clear hierarchy, dense evidence, restrained styling, and direct business language.

## Canvas

- Use the report's existing canvas size unless the page spec says otherwise.
- Keep reusable header and footer zones consistent across pages in the same report.
- Leave enough content margin below the header so titles and controls never collide.
- Avoid large empty hero areas unless the page is intentionally an executive cover or summary page.

## Header

- Logo sits top-left and should not compete with the page title.
- Report name sits above the page title as a small label.
- Page title is centered in the header bar.
- Navigation buttons sit in the header bar and are vertically centered.
- Header separators may vary by section color, but their position and z-order should be consistent.

## Content Hierarchy

- Put the primary takeaway near the top-left or top-center.
- Use executive cards only for metrics that shape the interpretation.
- Put the main analytical visual above supporting detail.
- Put detailed evidence in tables or matrices below the headline visuals.
- Use footnotes for thresholds, exclusions, quality caveats, and AI score context.

## Spacing And Alignment

- Align related visuals to common x positions.
- Use consistent vertical rhythm between sections.
- Avoid nested cards and decorative containers.
- Keep repeated items the same height and width.
- Ensure text does not overlap in desktop or exported layouts.

## Text

- Page title: concise business name, not a query name.
- Section headings: short and action-oriented.
- Card labels: noun phrases, not sentences.
- Footnotes: plain language, direct caveats.
- Avoid visible instructional text that explains how to use obvious controls.

## Color

- Use semantic colors from `theme_contract.md`.
- Use positive and negative colors only when the metric has directional meaning.
- Preserve page-specific section accents when they convey report structure.
- Do not use color as the only signal for critical interpretation.

## Accessibility

- Keep contrast high on dark backgrounds.
- Avoid tiny text in dense visuals.
- Use readable axis labels and table headers.
- Do not rely on hover-only content for essential meaning.
