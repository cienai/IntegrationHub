# Copilot Instructions — PBIP Project Summary Generator

Purpose: Guide the Copilot agent to generate a clear, consistent summary for any given `.pbip` file, and organize outputs under `AI_generated_powerbi_summary`.

## Validation and Setup
- Confirm the `.pbip` file path provided by the user.
- Validate related folders for the given `.pbip`:
  - Report folder: `<PBIP name>.Report/`
  - Semantic model folder: `<PBIP name>.SemanticModel/`
  - Typical contents to expect:
    - Report: `definition.pbir`, `definition/report.json`, `definition/version.json`, `definition/pages/`, `StaticResources/`
    - Semantic model: `definition.pbism`, `diagramLayout.json`, `definition/database.tmdl`, `definition/model.tmdl`, `definition/relationships.tmdl`, `definition/expressions.tmdl`, `definition/tables/*.tmdl`, `DAXQueries/`, `TMDLScripts/`
- Create an output folder for the project:
  - Root: `AI_generated_powerbi_summary/`
  - Inside root: a subfolder named exactly as the `.pbip` (without extension). Example: `AI_generated_powerbi_summary/Dataset - Azure Data Lake - Sales Performance/`
  - If `AI_generated_powerbi_summary` does not exist in the repository root, ask the user where to create it (provide suggested absolute path).

## Required Outputs (Minimum)
- `project_structure.md`: High-level overview of the PBIP project structure and associated folders, with what information lives in each.
- `tables.md`: List all non-system tables under `...SemanticModel/definition/tables/` (exclude `LocalDateTable_*` and other auto-generated system templates, e.g., `DateTableTemplate_*`).

## Summary Content Guidelines
Relations summary: When documenting table relationships, use ONLY the `powerbi/src/<Dataset>.SemanticModel/definition/relationships.tmdl` file as source and include only factual pairs.
  - List only From Table, From Column, To Table, To Column.
  - Show filter direction only when `crossFilteringBehavior: bothDirections` is explicitly present; otherwise omit.
  - Exclude all date-related links to `LocalDateTable_*` by default. If a date section is requested, add it separately and label it clearly as "Date Relationships".
  - Do not infer or guess cardinalities; never hallucinate content.
  - Do not modify any Power BI files.

Expressions summary: Use ONLY `powerbi/src/<Dataset>.SemanticModel/definition/expressions.tmdl` to document parameters and functions.
  - Parameters: name, type, required/allowed/default info if present, example literal values.
  - Functions: name, signature, and branch behavior (SQL Server, Postgres, Azure Data Lake) taken verbatim from the file.
  - Do not add usage hints unless explicitly requested.
  - Write documentation under `AI_generated_powerbi_summary/<Dataset>/`; never modify model files.

 Pages summary: When summarizing report pages, use ONLY the report folder’s `definition/pages/` content.
  - Source files: `powerbi/src/<Dataset>.Report/definition/pages/pages.json` and each page’s `page.json`.
  - Required fields: list page IDs with their `displayName` from `page.json`.
  - Ordering: always sort strictly by `pages.json` → `pageOrder`.
  - Scope: do not include visuals in this summary unless explicitly requested; keep it to page ID + display name.
## Workflow Steps
1. User provides `.pbip` path or name.
2. Confirm and echo the related folders that exist for that `.pbip`.
3. Ensure `AI_generated_powerbi_summary/` root exists; if not, ask where to create it.
4. Create project subfolder under the root.
5. Plan tasks and track with the Todo tool:
  - After validation, create a concise, actionable todo list that breaks the summary generation into individual tasks per output file to be created (e.g., `project_structure.md`, `tables.md`, `pages_summary.md`, `expressions.md`, `relations.md`).
  - Mark one task in-progress at a time; complete and update status immediately upon finishing each file.
  - Keep tasks minimal, ordered logically, and scoped strictly to the requested outputs.
6. Generate `project_structure.md` with:
   - PBIP overview and key settings (from the `.pbip` file)
   - Report folder structure and key files
   - Semantic model folder structure and key files
7. Generate `tables.md` with table names from `definition/tables/`, excluding system-generated tables.
8. If requested, generate optional summaries:
  - `pages_summary.md`: page IDs + display names sorted by `pages.json` pageOrder.
  - `expressions.md`: parameters and functions from `expressions.tmdl`.
  - `relations.md`: factual relationships from `relationships.tmdl`.
9. Stop and ask the user if they want deeper details (pages/visuals, relationships, data sources, measures/columns per table), and add new tasks accordingly.

## Notes
- Do not modify existing PBIP or model files.
- Strict rule: Never change the content of ANY Power BI–related file (PBIP, PBIR, PBISM, TMDL, JSON under report/semantic model, DAX queries, TMDL scripts, etc.) under any circumstance. Summaries must be read-only and written only to the `AI_generated_powerbi_summary` directory.
- Keep outputs in markdown for portability.
- When uncertain about a file’s nature (system vs user), confirm with the user before including.
