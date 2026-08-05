# Dry Run Result: Simple DAX Measure Fixture

Run with:

```powershell
python ticket-executor/tools/run_ticket.py --issue-file ticket-executor/examples/simple_dax_issue.md
```

Expected result:

- A git-ignored run folder under `ticket-executor/runs/local-simple-dax-measure-fixture/`.
- `classification.json` reports `DAX Measure` and `dax_measure_repair`.
- `validation_results.json` reports `pass`.
- `execution_plan.md` contains the DAX repair pilot plan.
- `verification_results.json` includes a `not_run` DAX reproduction check and a passing governed-logic protection check.
- `final_handoff.md` documents that implementation must continue through `executors/dax_measure_repair.md`.
