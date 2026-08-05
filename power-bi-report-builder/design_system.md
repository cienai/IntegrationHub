# Power BI Design System

This design system describes the current approved implementation for executive analysis pages. The canonical source is the `Rep Opportunity Overlap` page in the `Closing the Loop Strategy Report`, captured in `golden_pages/executive_analysis_v1/`.

## Canonical Colors

| Purpose | Approved implementation | Notes |
|---|---|---|
| Page background | `#2D2E3B` | Reference page uses this; imported theme background is `#292B3A`, which is a discrepancy for review. |
| Header band | `#3C3D4F` | Manual shape fill on reference page. |
| Executive card fill | `#343746` | Manual card fill. |
| Footer background | `#27272C` | Manual footer shape fill. |
| Header/table emphasis | `#4A4C60` | Table header and grid color. |
| Primary text | `#F2F4F8`, `#E6E6E6` | Title uses `#F2F4F8`; body/card text commonly uses `#E6E6E6`. |
| Secondary text | `#A0A5B1` | Summary second line, notes, chart axis labels. |
| Report label accent | `#D25D88` | Manual supertitle color. |
| Footer highlight | `#FEC300` | Platform/version card labels and values. |
| AI score limited | `#E93FCC` | Legend value `0-49 Limited`. |
| AI score fair | `#FF8C00` | Legend value `50-74 Fair`. |
| AI score good | `#B8E17C` | Legend value `75-84 Good`. |
| AI score great | `#86F20F` | Legend value `85-94 Great`. |
| AI score excellent | `#51CD00` | Legend value `95+ Excellent`. |

## Typography

| Element | Font | Size | Weight | Color | Alignment |
|---|---|---:|---|---|---|
| Report label | Segoe UI | `9pt` | Regular | `#D25D88` | Center |
| Page title | Segoe Bold | `18pt` | Bold | `#F2F4F8` | Center |
| Summary lead | Segoe UI | `10pt` | Regular | `#E6E6E6` | Left |
| Summary support | Segoe UI | `8pt` | Regular | `#A0A5B1` | Left |
| Executive card primary value | Segoe UI | `20D` | Bold | Theme color `0` | Center |
| Executive card default value | Segoe UI Semibold | `13D` | Semibold | `#E6E6E6` | Left |
| Executive card status | Segoe UI | `10D` | Regular | Theme color `9`, `0.4` | Center |
| Section title | Segoe Bold or bold text | default textbox size | Bold | `#E6E6E6` or `#F2F4F8` | Left |
| Table header | Segoe UI | `9D` | Bold | `#DDE1E8` | Center where specified |
| Table body | Segoe UI | `9D` to `10D` | Regular | `#E6E6E6` | Field-specific |
| Footer notes | Segoe UI | `9pt` | Regular | `#A0A5B1` | Left |
| Footer/version card | default Power BI card font | `9D` | Regular | `#FEC300` | Left |

## Page Spacing

| Rule | Value |
|---|---|
| Canvas | `1280 x 1900` |
| Primary content left x | `33.815` |
| Summary left x | `27.848` |
| Header band y/height | `43.761 / 44.755` |
| Summary y/height | `106.418 / 61.663` |
| Card row y/height | `185.983 / 154.157` |
| Card gutter | `34.810` |
| Primary analysis row y/height | `360.031 / 419.705` |
| Detail table y/height | `810.567 / 526.123` |
| Peek Inside y | `1498.803` |
| Footer y/height | `1821.656 / 76.699` |

## Component Styles

| Component | Approved implementation |
|---|---|
| Card style | `cardVisual`, fill `#343746`, outline hidden, compact cell padding, primary value centered and bold, status/context below. |
| Title treatment | Small centered report label above a full-width dark header band; page title centered in the band. |
| Table style | `tableEx`, dark alternating body rows, `#4A4C60` header/grid, no totals, compact row padding. |
| Footer structure | Modular footer from `RepOpportunityOverlap`: fixed Peek Inside banner, separator band, colored AI-score threshold legend, and platform-version strip; variable score, configuration, and footnote modules use the approved compact grid without empty placeholders. |
| Border treatment | Most reusable visuals have outlines hidden; table separation relies on grid color rather than card borders. |
| Semantic colors | Use theme semantic colors for positive/negative/warning where the metric has direction; keep AI score legend colors as shown in the reference page. |
| Overflow | Prefer shorter titles/labels first. Preserve text wrapping for summary, status values, caveats, and labels; avoid wrapping table body values unless approved. |

## Theme Discrepancies For Review

| Area | Imported theme | Reference page | Current rule |
|---|---|---|---|
| Page background | `#292B3A` | `#2D2E3B` | Use reference page for executive pages; do not overwrite the theme silently. |
| Visual background | Theme contract says `#323543` | Executive cards/tables use `#343746` and `#2D2E3B` | Use reference page for copied visuals. |
| Fonts | Theme uses Segoe UI/Semibold | Page title uses `Segoe (Bold)` in textbox JSON | Preserve copied textbox formatting; flag if Power BI normalizes font names. |
