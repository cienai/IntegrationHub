# AGENTS.md

Instructions for Codex and other coding agents working in this repository.

## Core Principles

- Preserve Power BI report behavior before improving implementation style.
- Treat semantic model definitions, report visuals, and deployment scripts as connected product surfaces.
- Prefer source-of-truth fixes over local patches, generated artifacts, or one-off report edits.
- Keep changes small, traceable, and aligned with the existing Power BI project structure.
- If a change risks creating two competing definitions of a measure, filter, column, or report behavior, stop and resolve the source of truth first.

## Repository Shape

- `powerbi/` contains the shipped `.pbix` report and dataset files.
- `powerbi/src/` contains the editable Power BI Project (`.pbip`) sources.
- `scripts/` contains Power BI query, validation, deployment, and Salesforce file-sync tooling.
- `scripts/pbi_deploy/` contains Power BI workspace deployment scripts and configuration examples.
- `ETL/` contains upstream integration and transformation assets.
- `docs/` and `doc/` contain reference documentation and migration notes.

## Power BI Source Of Truth

- Prefer editing `.pbip` project sources under `powerbi/src/` when making report or semantic model changes.
- Do not manually edit generated or extracted Power BI internals unless the repo already treats that file as editable source.
- Keep `.pbix` files as build or release artifacts unless the user explicitly asks for direct PBIX replacement.
- When changing a measure, calculated column, relationship, display folder, table, or report visual, identify the owning dataset/report first.
- Do not duplicate measures or columns to avoid fixing an existing definition. Fix the canonical model definition unless a new business concept is intentionally required.
- Preserve report parity: saved logic, semantic model measures, visual filters, and published report behavior should agree.

## PBIX And Git LFS

- `.pbix` files must remain tracked by Git LFS. Verify with `git lfs ls-files` before committing PBIX changes.
- Do not remove or weaken the `.gitattributes` rule for PBIX files.
- Before adding new large Power BI artifacts, confirm whether they should be LFS-tracked.
- Avoid committing temporary extracted PBIX folders, device-code files, query outputs, local traces, or ad hoc validation exports unless the user explicitly wants them versioned.
- If Git reports PBIX files that "should have been pointers, but weren't", stop and verify the LFS state before staging or committing.

## Report And Semantic Model Parity

- Report parity requires implementation parity, not only similar measure names.
- When reconciling a discrepancy with Power BI, compare the exact measure, grouping fields, visual-level filters, page/report filters, relationships, and reporting-period behavior.
- Treat mismatches between a report and a query as business-logic or model-validation issues before treating them as presentation issues.
- Do not assume two measures are interchangeable because their names or intent are similar.
- If a report visual uses a different calculation than the apparent semantic measure, document the difference and fix the source that the product is supposed to trust.

## Power BI Validation

- Run focused validation after Power BI changes whenever possible.
- For display-score changes, run `python scripts/check_ade_display_scores.py`.
- For platform column changes, run `python scripts/check_powerbi_platform_columns.py`.
- For Power BI query investigation, prefer existing scripts such as `scripts/pbi_query.ps1` and the review scripts under `scripts/`.
- If a validation script requires credentials, Power BI login, Windows PowerShell, or a configured workspace, say what could not be run and why.
- Do not invent replacement validation scripts when an existing repo script already covers the check.

## Deployment And Workspace Safety

- Treat Power BI deployment scripts as operational tooling. Small config changes can affect customer workspaces.
- Do not edit `scripts/pbi_deploy/pbi_cfg.json` with real customer or credential values unless explicitly instructed.
- Never commit secrets, device codes, local auth tokens, database passwords, or customer-specific credentials.
- Deployment scripts expect environment-provided credentials such as `DBUSER` and `DBPASSWORD`; keep those outside the repo.
- Before changing deployment behavior, read `scripts/pbi_deploy/README.md` and identify whether the change affects source workspace, target workspace, database parameters, report naming, or client scope.
- Do not run publishing or deployment commands against Power BI workspaces unless the user explicitly asks for deployment.

## ETL And Data Contracts

- Treat upstream ETL outputs and Power BI semantic models as a contract.
- If a Power BI model depends on a column, table, score, or field naming convention, fix breakage at the contract boundary rather than adding report-only workarounds.
- Keep rename maps and migration notes synchronized with actual model changes.
- When changing upstream data shape, check affected reports, datasets, validation scripts, and documentation.

## Temporary Files And Local Artifacts

- Keep local investigation files out of commits unless they are intentionally promoted into repo documentation or tooling.
- Common temporary files include `tmp_*`, `temp_*`, device-code files, query result exports, and extracted workbook or PBIX contents.
- Clean generated artifacts after investigation when they are not part of the requested change.

## Git Workflow

- Work from the branch the user requested. If the user asks to mirror `staging`, reset to `origin/staging` and verify a clean tree.
- Before pulling, resetting, or checking out, inspect `git status --short --untracked-files=all`.
- Do not discard local changes unless the user explicitly approves it.
- After Git LFS or PBIX changes, verify both `git status` and `git lfs ls-files`.
- Before finishing, report the branch, commit SHA, and any validation that was or was not run.

## Collaboration

- When the user points out a recurring workflow mistake, consider whether it should become a durable rule in this file.
- Keep explanations tied to the repository's actual Power BI, ETL, and deployment surfaces.
- Prefer concise implementation notes over broad AI or analytics theory in this repo.
