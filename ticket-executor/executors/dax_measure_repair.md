# DAX Measure Repair Executor

Use for DAX Measure tickets.

## Pilot Scope

The first version is conservative. It supports intake, classification, source inspection planning, validation records, and handoff. It does not automatically rewrite production semantic model logic unless a ticket explicitly names the measure, source of truth, allowed files, and verification method.

## Flow

1. Read the normalized ticket.
2. Identify the affected semantic model, table, measure, query, or visual.
3. Inspect current TMDL and related DAX query files.
4. Reproduce the reported mismatch or syntax error where tools permit.
5. Establish the source of truth.
6. Create a targeted implementation plan.
7. Modify only allowed files when explicitly authorized.
8. Run syntax and repository checks.
9. Execute verification queries when credentials and workspace access are available.
10. Compare expected and actual results.
11. Self-correct implementation/query/filter issues up to three attempts.
12. Produce handoff.

## Allowed Self-Corrections

- wrong file or object reference,
- DAX syntax,
- field references,
- filter placement,
- query serialization,
- verification-query mistakes,
- date context,
- sort logic,
- implementation-level formatting.

## Prohibited Silent Changes

- governed business definitions,
- approved thresholds,
- canonical measure meaning,
- source data,
- production logic outside ticket scope,
- the ticket's expected behavior,
- the stated source of truth.
