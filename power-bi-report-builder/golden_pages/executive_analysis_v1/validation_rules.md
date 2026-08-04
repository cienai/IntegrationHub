# Executive Analysis v1 Validation Rules

Run:

```powershell
python power-bi-report-builder/tools/validate_layout.py "powerbi/src/Closing the Loop Strategy Report.Report/definition/pages/RepOpportunityOverlap" --golden-executive --require-ai-score
```

For a new page, replace the path with the target page directory. Use `--golden-executive-exceptions path/to/exceptions.json` for approved deviations.

## Automated Checks

| Check | Rule |
|---|---|
| Canvas size | `page.json` must be `1280 x 1900`. |
| Page background | Background color should be `#2D2E3B` with `0D` transparency. |
| Header presence | Logo, report label, header band, page title, back button, and top-right nav must exist. |
| Header geometry | Fixed header visuals should be within tolerance of the golden coordinates. |
| Summary position | Executive summary text should start near `x=27.848`, `y=106.418`. |
| Card alignment | Executive cards should share `y=185.983`, `w=384.895`, `h=154.157`; standard three-card x positions are `33.815`, `453.520`, `872.230`. |
| Section spacing | Primary row starts at `y=360.031`; detail table starts at `y=810.567`; footer banner starts at `y=1579.074`. |
| Footer presence | Peek Inside banner, separator band, colored threshold legend, footer background, platform version card, and copyright card must exist. |
| AI score presence | Required when `--require-ai-score` is passed. |
| Visual overlap | Visuals must not overlap except fixed chrome layering and footer background layering. |
| Canvas bounds | No visual should extend outside the `1280 x 1900` canvas. |
| Text truncation risk | Textboxes with long text in narrow or short containers are flagged for review. |
| Unexpected coordinate deviations | Golden elements outside tolerance are reported unless declared as exceptions. |

## Exception File

Use a JSON file with a top-level `allow` array. Entries can be rule IDs or prefixes.

```json
{
  "allow": [
    "golden.card_row.count",
    "golden.ai_score.required",
    "golden.visual.primary_row"
  ]
}
```

## Manual Checks

| Check | Guidance |
|---|---|
| Text rendering | Power BI Desktop review is still required for actual wrapping and truncation. |
| Theme discrepancy | Compare theme defaults with reference-page manual formatting before overwriting either. |
| Navigation | Confirm buttons navigate to intended report pages. |
| Semantic replacement | Confirm copied visuals no longer reference page-specific DAX from the source page unless intended. |
