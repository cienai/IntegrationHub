# Executive Analysis Golden Page v1

This package captures the approved executive-page structure from the `Rep Opportunity Overlap` page in the `Closing the Loop Strategy Report`.

The reference page is the source of truth for visual layout and formatting only. Do not copy its DAX, metric definitions, thresholds, filters, analytical wording, or business narrative unless a future ticket explicitly asks for that same analysis.

## Source PBIP

| Item | Value |
|---|---|
| Report | `powerbi/src/Closing the Loop Strategy Report.Report` |
| Page directory | `definition/pages/RepOpportunityOverlap` |
| Page display name | `Rep Opportunity Overlap` |
| Canvas | `1280 x 1900` |
| Background | `#2D2E3B`, `0D` transparency |

## Files

| File | Purpose |
|---|---|
| `layout_contract.md` | Coordinates, zones, spacing, colors, and typography extracted from PBIP JSON. |
| `visual_inventory.md` | Reusable visual groups, source visual IDs, bindings, and protected formatting. |
| `reuse_rules.md` | Rules for copying the golden layout into future executive pages. |
| `validation_rules.md` | Automated and manual checks for future pages using this layout. |

## Future Ticket Instruction

Read the page spec, inspect the target report/model, load this golden package, copy the fixed chrome and requested reusable visual patterns, replace only page-specific bindings/text, validate with `validate_layout.py --golden-executive`, and report any intentional deviations.
