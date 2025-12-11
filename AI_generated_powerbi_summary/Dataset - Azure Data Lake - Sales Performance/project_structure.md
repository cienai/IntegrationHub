# Project Structure — Dataset - Azure Data Lake - Sales Performance

This overview describes the PBIP project and where key artifacts live, plus what information each folder/file contains.

## Top-Level PBIP
- File: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.pbip`
- Purpose:
  - Orchestrates the project by pointing to the report artifact folder and storing project-level settings.
- Contents (from PBIP):
  - `version: 1.0`
  - `artifacts.report.path: "Dataset - Azure Data Lake - Sales Performance.Report"`
  - `settings.enableAutoRecovery: true`

## Report Artifact Folder
- Path: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.Report/`
- Purpose:
  - Contains the Power BI Report definition and related static resources.
- Key items:
  - `definition.pbir`: report artifact manifest.
  - `definition/`
    - `report.json`: layout, pages, visuals, themes, and interactions.
    - `version.json`: report definition versioning.
    - `pages/`: per-page subfolders (visuals, config per page).
  - `StaticResources/`
    - `RegisteredResources/`: custom resources registered for the report.
    - `SharedResources/`: shared assets such as images, icons, themes.

## Semantic Model Folder
- Path: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/`
- Purpose:
  - Houses the dataset (model) definition, including tables, measures, relationships, expressions, and layout.
- Key items:
  - `definition.pbism`: semantic model artifact manifest.
  - `diagramLayout.json`: diagram positions for model entities and relationships.
  - `DAXQueries/`: ad-hoc DAX query files used for analysis/debugging.
  - `TMDLScripts/`: TMDL automation scripts to generate or transform model definitions.
  - `definition/`
    - `database.tmdl`: model-level properties (compatibility, cultures).
    - `expressions.tmdl`: data source parameters and M/DAX expressions (e.g., connection info).
    - `model.tmdl`: tables, partitions, roles, calculation groups summary.
    - `relationships.tmdl`: relationships between tables.
    - `cultures/`: locale-specific metadata (translations, format strings).
    - `tables/`: one `.tmdl` per table or calculation group, defining columns, measures, partitions.

## Typical Table Definitions (TMDL)
- Location: `powerbi/src/...SemanticModel/definition/tables/*.tmdl`
- Contents:
  - Columns: data fields with types, formatting, sorting.
  - Measures: DAX calculations used by visuals.
  - Partitions: import or DirectQuery definitions.
  - Annotations: metadata (display folders, formats, descriptions).
  - Calculation Groups: formatting or logic applied contextually (e.g., currency format group).

## Data Source & Parameters
- File: `powerbi/src/...SemanticModel/definition/expressions.tmdl`
- Purpose:
  - Defines connection parameters (e.g., `db_name`, `db_server_sql`, type), and functions used to connect to the data platform (e.g., Azure Data Lake via `AzureStorage.DataLake`).
- Impact:
  - Centralized control of environment-specific values and data access functions.

## Relationships
- File: `powerbi/src/...SemanticModel/definition/relationships.tmdl`
- Purpose:
  - Declares how tables join (one-to-many, many-to-many), directional filters, and active/inactive relationships.
- Impact:
  - Shapes filter propagation and aggregation behavior across visuals.

## Static Resources
- Path: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.Report/StaticResources/`
- Contents:
  - `RegisteredResources/`: packaged resources (custom visuals, scripts).
  - `SharedResources/`: common assets (images, color palettes, themes).

## Notes
- Auto date tables (`LocalDateTable_*`) are system-generated and typically hidden; they are not part of curated documentation.
- Use `cal_start_dates` and `cal_end_dates` as canonical date dimensions for time intelligence.
