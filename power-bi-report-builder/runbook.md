# Power BI Builder Runbook

This is the practical handoff for turning a GitHub issue into a Power BI builder task.

## Start From A GitHub Issue

From the repo root:

```powershell
python power-bi-report-builder/tools/run_pbi_builder.py 1234
```

Replace `1234` with the GitHub issue number.

The command uses the GitHub CLI (`gh`) to read the issue. It writes a local run folder under:

```text
power-bi-report-builder/runs/
```

Each run includes:

- the raw GitHub issue text;
- a normalized page spec draft;
- a builder handoff file;
- a short intake validation report.

## Offline Or Manual Mode

If the issue text has already been copied into a file:

```powershell
python power-bi-report-builder/tools/run_pbi_builder.py --issue-file path/to/issue.md
```

## Before Building

The issue should include a completed page spec from `page_spec_template.md`.

The spec should clearly say:

- the business question;
- the audience;
- the decision supported;
- the expected outcome;
- the target report and page;
- the data contract;
- the existing assets to reuse;
- the required metrics and dimensions;
- the interpretation rules;
- the builder deliverables;
- the acceptance criteria.

If those pieces are missing, stop and clarify the issue before building the PBIP page.

## Report Cleanup Scripts

These scripts are review tools. They change PBIP JSON when run with `--apply`, but the resulting report edits should be opened and checked in Power BI Desktop before committing.

Dry run first:

```powershell
python power-bi-report-builder/tools/normalize_strategy_report_header.py
python power-bi-report-builder/tools/cleanup_pbip_visual_layout.py --report "powerbi/src/Strategy Report.Report"
```

Apply only after reviewing the dry-run output:

```powershell
python power-bi-report-builder/tools/normalize_strategy_report_header.py --apply
python power-bi-report-builder/tools/cleanup_pbip_visual_layout.py --report "powerbi/src/Strategy Report.Report" --apply
```

After applying, open the PBIP in Power BI Desktop and inspect the affected pages before committing report files.
