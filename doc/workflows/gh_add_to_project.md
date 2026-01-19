# Script: gh_add_to_project.sh

Automates creating an issue, adding it to the Cien Engineering project (#2), and assigning to `mrandersssson`.

## Location
- scripts/gh_add_to_project.sh

## Prerequisites
- GitHub CLI (`gh`) installed
- Authenticated with `repo` and `project` scopes

If an environment `GITHUB_TOKEN` interferes with login:
```bash
unset GITHUB_TOKEN
gh auth login -h github.com -p https -s repo,project -w
```

## Usage
Create from a body file and default repo/project/assignee:
```bash
scripts/gh_add_to_project.sh -t "Make Performance Metrics – Correlation Scores decision-ready" \
  -f doc/tickets/issue-344-correlation-scores.md
```

Custom repo / label:
```bash
scripts/gh_add_to_project.sh -t "<TITLE>" -f <BODY_FILE> \
  -r cienai/IntegrationHub -l enhancement
```

Provide inline body text instead of a file:
```bash
scripts/gh_add_to_project.sh -t "<TITLE>" -b "<BODY_TEXT>"
```

Override project/owner/assignee:
```bash
scripts/gh_add_to_project.sh -t "<TITLE>" -f <BODY_FILE> \
  -p 2 -o cienai -a mrandersssson
```

## Notes
- Labels must exist in the repo; otherwise omit `-l`.
- Project number: `2` (Cien Engineering).
- Default repo: `cienai/IntegrationHub`.
- The script outputs the created issue URL and performs project add + assignment.
