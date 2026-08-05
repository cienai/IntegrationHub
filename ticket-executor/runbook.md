# Ticket Executor Runbook

## Standard Flow

1. Fetch or read the issue.
2. Create `ticket-executor/runs/<issue-number>-<slug>/`.
3. Save raw issue text and metadata.
4. Normalize the issue into the executable ticket contract.
5. Validate required sections.
6. Classify the ticket.
7. Route to the selected executor.
8. Inspect and reproduce before implementation.
9. Implement only allowed changes.
10. Run validation and verification.
11. Self-correct allowed implementation-level failures up to three attempts.
12. Produce final handoff.

## GitHub Issue Mode

```powershell
python ticket-executor/tools/run_ticket.py 1234 --repo cienai/IntegrationHub
```

Requires the GitHub CLI (`gh`) to be installed and authenticated.

## Local Issue Mode

```powershell
python ticket-executor/tools/run_ticket.py --issue-file ticket-executor/examples/simple_dax_issue.md
```

Use this when GitHub access is unavailable or when testing a fixture ticket.

## Power BI Page Delegation

Power BI Page tickets are delegated to:

```powershell
python power-bi-report-builder/tools/run_pbi_builder.py 1234 --repo cienai/IntegrationHub
```

The general executor records the delegation in its own run folder. The page builder owns page-specific implementation, validation, and handoff.

## DAX Measure Pilot

The first DAX Measure flow creates a conservative execution plan:

- identify model/table/measure candidates,
- record source-of-truth and verification requirements,
- point to `scripts/pbi_query.ps1` where data verification requires Power BI access,
- block if ticket scope or source of truth is ambiguous,
- and avoid automatic governed DAX rewrites until a specific ticket authorizes them.
