# Theme Contract

This file explains how agents and page builders should use the Power BI theme. The imported theme JSON is the actual Power BI file; this contract explains the design rules in plain language.

## Core Colors

| Purpose | Color |
| --- | --- |
| Page background | `#292B3A` |
| Visual background | `#323543` |
| Alternate row/background | `#2E303E` |
| Header/background emphasis | `#4A4C60` |
| Primary text | `#F2F4F8` |
| Secondary text | `#A0A5B1` |
| Primary brand teal | `#3AB1B6` |
| Positive | `#68A996` |
| Negative | `#E50046` |
| Warning/orange | `#E66C37` |
| Neutral | `#A0A5B1` |

## Typography

- Page titles should fit the physical header box without wrapping.
- Report labels should be small and secondary.
- Tables and matrices should prioritize legibility over large type.
- Theme text classes must remain conservative because legacy visuals may retain manual sizing.

## Theme Boundaries

- Do not use global wildcard theme settings for visual background, border, padding, or hidden visual headers.
- Apply spatial visual defaults only to chart types where the default is safe.
- Leave slicers, text boxes, cards, shapes, and navigation buttons free of global spatial overrides.
- Use page or visual configuration for model-specific conditional formatting.
- Do not encode dynamic business logic such as positive/negative bars in static theme JSON.

## Conditional Color Semantics

- Positive overperformance: `#68A996`.
- Negative underperformance: `#E50046`.
- Neutral comparison: `#A0A5B1`.
- Warning or data-quality attention: `#E66C37`.
- Brand or section emphasis: `#3AB1B6` or the report section accent.
