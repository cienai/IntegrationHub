# General Ticket Executor

This folder contains the first general closed-loop ticket executor for IntegrationHub.

It is intentionally small. The goal is to route structured GitHub issues to the right workflow, create an auditable local run folder, validate that the ticket is executable, and produce verification and handoff records. The existing `power-bi-report-builder/` remains the specialized executor for Power BI page work.

## What This Executor Does

- Fetches a GitHub issue through `gh` or reads a local issue markdown file.
- Creates a run folder under `ticket-executor/runs/`.
- Saves raw issue text, metadata, normalized ticket JSON, classification, execution plan, validation results, self-correction log, verification results, and final handoff.
- Classifies tickets deterministically from explicit ticket type, paths, keywords, and affected artifacts.
- Delegates Power BI Page tickets to `power-bi-report-builder/tools/run_pbi_builder.py`.
- Provides a conservative DAX Measure pilot flow that inspects ticket intent and creates a verification plan without modifying governed model logic automatically.

## Existing Pattern Reuse

Reusable directly:

- GitHub/local issue intake pattern from `power-bi-report-builder/tools/run_pbi_builder.py`.
- Run-folder convention from `power-bi-report-builder/runs/`.
- Closed-loop validation and handoff shape from `power-bi-report-builder/validation_checklist.md` and `power-bi-report-builder/AGENTS.md`.
- Power BI query execution remains via `scripts/pbi_query.ps1` when credentials and workspace access are available.
- Existing Power BI validation scripts remain the source for platform and display-score checks.

Must remain Power BI-specific:

- PBIP page layout rules, golden page layout contracts, visual JSON patterns, theme rules, quick-filter behavior, and page-builder handoff logic.
- Page tickets route to `power-bi-report-builder/` rather than merging that implementation into this general executor.

## Quick Start

From a GitHub issue:

```powershell
python ticket-executor/tools/run_ticket.py 1234 --repo cienai/IntegrationHub
```

From a local issue body:

```powershell
python ticket-executor/tools/run_ticket.py --issue-file ticket-executor/examples/simple_dax_issue.md
```

The `runs/` directory is git-ignored.

## GitHub Ticket Intake

New executable test tickets created through `gh issue create` should be assigned to `mrandersssson` and added to the Cien Engineering project:

```powershell
gh issue create --repo cienai/IntegrationHub --assignee mrandersssson
gh project item-add 2 --owner cienai --url <issue-url>
```

## Current Limitations

- The first DAX Measure flow is a safe pilot. It does not automatically rewrite production semantic model files.
- Power BI Desktop, Power BI Service, database, and GitHub access may still be required to execute data verification.
- Low-confidence classification blocks the run instead of guessing.
- Page creation is delegated to the existing Power BI Report Builder rather than reimplemented here.

## Recommended First Real Ticket

Use a DAX Measure ticket that names:

- the semantic model path,
- the table and measure,
- the current wrong behavior,
- the expected DAX or expected query result,
- the authoritative source of truth,
- allowed files,
- prohibited changes,
- and a verification query or validation script.
