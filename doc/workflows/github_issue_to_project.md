# Workflow: Create Issue and Add to Cien Engineering Project

This documents the steps we used to create a GitHub issue in `cienai/IntegrationHub`, add it to the org project "Cien Engineering", and assign it to `mrandersssson`.

## Prerequisites
- GitHub CLI (`gh`) installed
- Logged in to GitHub with `repo` and `project` scopes

If an environment `GITHUB_TOKEN` interferes with login, unset it first.

```bash
unset GITHUB_TOKEN
gh auth login -h github.com -p https -s repo,project -w
```

## Steps

1) Create the issue (labels optional; use existing labels only):
```bash
gh issue create -R cienai/IntegrationHub \
  -t "<ISSUE_TITLE>" \
  -b "<ISSUE_BODY>" \
  -l enhancement
```
The command outputs the new issue URL, e.g. `https://github.com/cienai/IntegrationHub/issues/<NUMBER>`.

2) Add the issue to the Cien Engineering project (org project number 2):
```bash
gh project item-add 2 --owner cienai --url https://github.com/cienai/IntegrationHub/issues/<NUMBER>
```

3) Assign the issue to `mrandersssson`:
```bash
gh issue edit <NUMBER> -R cienai/IntegrationHub --add-assignee mrandersssson
```

## Helpful checks
- List org projects to verify the project:
```bash
gh project list --owner cienai --format json | jq
```
- View the issue details:
```bash
gh issue view <NUMBER> -R cienai/IntegrationHub --json assignees,url | jq
```

## Notes
- Use only labels that exist in the repository; if a label error occurs, omit or create the label first.
- Project number: `2` (title: Cien Engineering).
- Repository: `cienai/IntegrationHub`.
