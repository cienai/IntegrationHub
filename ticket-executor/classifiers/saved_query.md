# Saved Query Classifier

Route to a saved-query repair workflow.

Strong evidence:

- Explicit `Ticket Type: Saved Query`
- Paths under `DAXQueries/`
- Mentions saved query, validation query, query serialization, or DAX query mismatch

Initial behavior:

- classify and prepare a run,
- require manual review unless the ticket provides an executable verification query and allowed files.
