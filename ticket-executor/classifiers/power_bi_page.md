# Power BI Page Classifier

Route to `power-bi-report-builder`.

Strong evidence:

- Explicit `Ticket Type: Power BI Page`
- Mentions `page_spec_template.md`
- Requests a new report page, page replacement, page layout, visual JSON, quick filters, header icons, or golden page layout
- Paths under `powerbi/src/**/*.Report/definition/pages/`

Do not handle page creation inside the general executor.
