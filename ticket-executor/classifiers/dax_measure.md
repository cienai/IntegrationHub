# DAX Measure Classifier

Route to the DAX Measure repair workflow.

Strong evidence:

- Explicit `Ticket Type: DAX Measure`
- Mentions DAX, measure, calculated measure, TMDL measure definition, or `EVALUATE`
- Paths under `powerbi/src/**/*.SemanticModel/definition/tables/*.tmdl`
- References to `scripts/pbi_query.ps1` or DAX query files

Required contract:

- model path,
- table and measure when known,
- current behavior,
- expected behavior,
- source of truth,
- allowed and prohibited changes,
- verification method.
