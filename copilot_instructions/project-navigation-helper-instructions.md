# IntegrationHub Power BI Project Instructions

This document guides Copilot agents to understand the Power BI project structure, scope, and how to locate reports, pages, visuals, datasets, and semantic models for any given artifact.

## Scope
- Only the contents of the `powerbi` folder are in scope.
- Within `powerbi`, the `src` subfolder is the source of truth for decomposed, source-control friendly artifacts.
- End-user `.pbix` files exist at `powerbi/`, but Copilot should prefer the `.pbip` + decomposed folders in `powerbi/src/` when reading or editing.

## Top-Level Layout
- `powerbi/README.md`: General notes for Power BI in this repo.
- `powerbi/src/`: Contains multiple `.pbip` project files and their associated decomposed folders:
  - `<Artifact Name>.pbip`: Power BI Project file (source-first).
  - `<Artifact Name>.Report/`: Decomposed report definition.
  - `<Artifact Name>.SemanticModel/`: Decomposed dataset/semantic model (present for dataset artifacts).

## Artifacts Present
- Reports
  - Automatic Data Enhancement
  - Management Report
  - Strategy Report
  - Tactical Report
  - Utility Box Report
- Datasets (Azure Data Lake)
  - Automatic Data Enhancement
  - Sales Performance

Each of the above exists in `powerbi/src` as:
- A `.pbip` file
- A `*.Report/` folder
- For datasets, a `*.SemanticModel/` folder

## Decomposed Report Structure (`*.Report/`)
Location: `powerbi/src/<Artifact Name>.Report/`
- `definition.pbir`: Report definition root.
- `definition/`:
  - `report.json`: Full report specification (layouts, visuals, bindings).
  - `version.json`: Version information.
  - `pages/`: Contains per-page JSON files/folders. Each page has its own `page.json` plus visual container definitions.
- `CustomVisuals/`: Custom visuals package references (present for some reports).
- `StaticResources/`: Any shared or registered static assets used by the report.
- `.platform/` and optional `.pbi/` subfolders: Tooling and local settings caches (do not modify for source-of-truth).

### Locating Pages and Visuals
- Pages live under `definition/pages/` of the corresponding `*.Report/` folder.
- Visuals are defined inside `report.json` and per-page JSON, typically under containers with visual type and data bindings.
- Custom visuals live under `CustomVisuals/` when present.

#### Page and Visual Folder Structure (Utility Box, Tactical, Strategy, Management)
- `powerbi/src/<Report>.Report/definition/pages/`
  - Each page has its own subfolder (e.g., `ReportSection.../` or GUID-like folder names).
  - Inside each page folder:
    - `page.json`: The page-level definition and layout.
    - `visuals/`: A subfolder containing one subfolder per visual on that page.
      - Each visual folder contains a `visual.json` describing the visual type, data roles, bindings, formatting, and interactions.
- Use the page folder names listed in `pages/pages.json` to correlate ordering and metadata.
 - Important: The page folder name is not the user-facing page name. Use the `displayName` field in each page’s `page.json` to read the actual page name.

#### Page Ordering
- The authoritative ordering for pages is defined in `powerbi/src/<Report>.Report/definition/pages/pages.json` under the `pageOrder` array.
- Each entry in `pageOrder` corresponds to a page folder name. To produce ordered, user-facing names, map each `pageOrder` item to its page folder’s `page.json.displayName`.

## Decomposed Semantic Model Structure (`*.SemanticModel/`)
Location: `powerbi/src/<Dataset Name>.SemanticModel/`
- `definition.pbism`: Semantic model definition root.
- `diagramLayout.json`: Optional layout for model diagram.
- `definition/` (TMDL files):
  - `database.tmdl`: Database-level TMDL.
  - `model.tmdl`: Model-level TMDL (measures, calculation groups, roles).
  - `tables/`: Per-table TMDL with columns and measures.
  - `relationships.tmdl`: Relationship definitions.
  - `cultures/`: Translation cultures.
  - `expressions.tmdl`: Shared expressions, calculation items, etc.
- `DAXQueries/`: Optional sample or dev queries.
- `TMDLScripts/`: Optional generated scripts and related `.pbi` metadata.
- `.platform/` and `.pbi/`: Tooling and local settings caches (ignore for source-of-truth).

### Locating Tables, Measures, Relationships
- Tables: `definition/tables/<TableName>.tmdl`
- Measures: Usually defined within their table TMDL files and/or `model.tmdl`.
- Relationships: `definition/relationships.tmdl`
- Expressions/Calc groups: `definition/expressions.tmdl`
 
Important: For anything related to tables, the single source of truth is the `.tmdl` file for each table under `definition/tables/`. Always read and modify the corresponding `<TableName>.tmdl` when working with table schema, columns, measures scoped to a table, or table-level metadata.

## Mapping: From `.pbip` to Report and Model Folders
Given a `.pbip` file at `powerbi/src/<Artifact Name>.pbip`:
- Report folder: `powerbi/src/<Artifact Name>.Report/`
- If the artifact is a dataset: semantic model folder: `powerbi/src/<Artifact Name>.SemanticModel/`

Examples
- Report: `powerbi/src/Utility Box Report.pbip`
  - Report folder: `powerbi/src/Utility Box Report.Report/`
  - Pages: `powerbi/src/Utility Box Report.Report/definition/pages/`
  - Semantic model: uses the dataset semantic model (e.g., `Dataset - Azure Data Lake - Sales Performance.SemanticModel/`); report `.pbip` files do not have their own semantic model folders.
- Dataset: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.pbip`
  - Report (linked report instance): `powerbi/src/Dataset - Azure Data Lake - Sales Performance.Report/`
  - Semantic model: `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/`
  - Tables: `.../SemanticModel/definition/tables/`

### Report-to-Model Mapping (Explicit)
- `powerbi/src/Utility Box Report.pbip` → uses `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/`
- `powerbi/src/Tactical Report.pbip` → uses `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/`
- `powerbi/src/Strategy Report.pbip` → uses `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/`
- `powerbi/src/Management Report.pbip` → uses `powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/`



## Conventions and Guidance
- Treat `.pbip` as entry points; use decomposed folders for reading/updating source.
- Do not edit `.pbix` or `.pbi/` cache files for source-of-truth; focus on `definition/` and TMDL files.
- For visuals/pages updates, modify `report.json` and `definition/pages/*` within the corresponding `*.Report/`.
- For model changes (tables, measures, relationships), modify TMDL under `*.SemanticModel/definition/`.
- Custom visuals and static resources should be managed within `CustomVisuals/` and `StaticResources/`.

## In-Scope Items
- All files under `powerbi/src/` excluding `.pbi/` cache artifacts are considered in scope for source changes.
- `.platform/` and `.pbi/` folders are tooling-specific; avoid committing changes there unless intentionally required.
- For tables, our current focus is ONLY on non system-generated tables. Exclude `LocalDateTable_*` and `DateTableTemplate_*` when counting or modifying tables.

## Read-Only Policy
- Do not modify any files under `powerbi/` (including `powerbi/src/`). This folder is treated as base code and is read-only.
- Copilot agents must only read and analyze files to answer questions; no edits, renames, or deletions are allowed within `powerbi`.

## Quick Reference
- Reports: `powerbi/src/* Report.pbip` + `*.Report/`
- Datasets: `powerbi/src/Dataset - */*.pbip` + `*.Report/` + `*.SemanticModel/`
- Pages: `*.Report/definition/pages/`
- Visuals: `*.Report/definition/report.json` and per-page JSON
- Tables: `*.SemanticModel/definition/tables/`
- Relationships: `*.SemanticModel/definition/relationships.tmdl`
- Measures: in table TMDL and/or `model.tmdl`
- Expressions: `*.SemanticModel/definition/expressions.tmdl`
