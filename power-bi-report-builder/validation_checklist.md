# Power BI Report Validation Checklist

Use this before saying a Power BI page is ready.

The page should help someone understand, decide, or act.

## Business

- Does the page answer one clear business question?
- Is the main point visible within 5 seconds?
- Does the top of the page match the spec's narrative hierarchy?
- Is the executive insight short and readable?
- Is every conclusion backed by visible data?
- Does the page avoid cause-and-effect claims unless they are proven?
- Does the page avoid combining separate findings into a fake ideal profile?

## Narrative

- Does the page lead with the highest-level answer for the audience?
- Do KPI cards summarize the main business state instead of isolated outliers?
- Does the primary chart show the main pattern or comparison?
- Are individual records, reps, accounts, opportunities, or transactions treated as drill-in evidence unless the question is specifically about them?
- Is the detail table clearly supporting evidence rather than the main story?

## Source Of Truth

- Are existing official measures reused?
- Are existing official dimensions reused?
- Were new measures added only for new business concepts?
- Are new model objects documented?
- Do report visuals, DAX test queries, Power BI model measures, and page text agree?
- Did we avoid duplicate definitions?

## Data Verification

- Were all required verification queries executed?
- Was generated output compared against expected output?
- Were mismatches diagnosed against page implementation, verification query, filter context, source-of-truth mapping, and governed model logic?
- Were only implementation-level issues auto-corrected?
- Were failed checks re-run after each correction?
- Were correction attempts capped at three per failed check?
- Does the self-correction log record the failed check, expected output, generated output, diagnosis, correction, and final result?
- Are unresolved governed-model or source-of-truth issues reported as blockers instead of silently changed?

## Layout

- If the page is an executive analysis page, was `golden_pages/executive_analysis_v1/` loaded before editing?
- Did fixed chrome come from the golden page instead of being recreated?
- If quick filters are declared, were they copied from an approved Management Report top-page pattern instead of recreated?
- Are quick filters aligned, styled, sized, and labeled consistently with the approved reference pattern?
- Does `validate_layout.py --golden-executive` pass, or are deviations declared in the page spec?
- Is the canvas `1280 x 1900` when using the executive golden layout?
- Are the header, back button, page title, footer, and platform-version footer present?
- Are executive cards aligned to the golden card row when used?
- Are the fixed footer constants present: Peek Inside banner, separator band, colored threshold legend, and version strip?
- Is the AI score panel present when the spec declares primary/supporting AI scores or when the approved reference footer pattern keeps score context paired with the threshold legend?
- Are footer modules limited to those required by the spec?
- Were footer modules copied from approved modules instead of recreated?
- Does the configuration module preserve the approved compact table height and narrow/no-extra-padding treatment?
- Were active footer modules repacked into the approved grid without overlap, truncation, or empty placeholder panels?
- Are there any overlapping visuals?
- Are header, footer, navigation, and content positions consistent?
- Is spacing consistent?
- Is there unnecessary empty space?
- Do related visuals line up?
- Does everything fit the canvas?

## Text

- Are titles fully visible?
- Are card labels and values fully visible?
- Are table headers readable?
- Do text boxes avoid awkward wrapping?
- Is the wording business-friendly?
- Is capitalization consistent?
- Do footnotes explain important filters, exclusions, thresholds, and caveats?

## Tables And Matrices

- Do tables show useful evidence, not extra noise?
- Are columns ordered in a way people can scan?
- Is duplicate information removed?
- Are column widths usable?
- Are numbers formatted correctly?
- Is conditional formatting correct?
- Does sorting support the business question?

## Charts

- Is the chart type right for the question?
- Are positive, negative, and neutral colors used correctly?
- Are labels, axes, and legends readable?
- Is a zero line visible when values go positive and negative?
- Is Top N or filter logic correct?
- Do chart titles avoid repeating obvious page context?
- Does the chart avoid implying more precision or certainty than the data supports?

## AI Scores

- Are related AI scores included when useful?
- Do score labels match official score names?
- Is score wording clear and caveated?
- Are scores framed as help for decisions, not certainty?
- Is trust or data-quality context included when needed?

## Theme

- Does the page follow `design_system.md` for approved implementation details?
- Are differences between imported theme defaults and the golden reference page documented?
- Are theme colors respected?
- Are fonts and sizes consistent?
- Are card, chart, table, matrix, slicer, and footer styles consistent?
- Did theme defaults avoid breaking text boxes, slicers, shapes, or navigation?
- Is manual formatting used only where the theme cannot handle the need?

## Interactions

- Are quick filters scoped to the current page unless the spec explicitly declares a synced/global filter?
- Is each quick filter's default state, selection mode, target field, sort behavior, and affected visuals documented?
- Were quick-filter contexts included in verification queries for default and changed selections where possible?
- Did we avoid accidental duplicated filters between quick slicers, visual filters, and page/report filters?
- Do slicers affect the right visuals?
- Is cross-filtering intentional?
- Do navigation buttons go to the right places?
- Are hidden pages intentionally hidden?
- Are drill-throughs or tooltips documented when used?

## Performance

- Does the page use only the visuals it needs?
- Is expensive DAX avoided unless needed?
- Are visual filters not duplicating model logic unnecessarily?
- Are tables and charts limited to useful row counts?
- Are unused test visuals removed?

## Done Means

- The page meets the spec.
- The page matches the report section.
- Required verification checks pass, or a real blocker is documented.
- Self-correction log is complete.
- PBIP JSON parses.
- `git diff --check` passes.
- Any checks we could not run are listed.
- The page is ready for Power BI Desktop review.
