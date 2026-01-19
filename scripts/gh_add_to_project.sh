#!/usr/bin/env bash
set -euo pipefail

# gh_add_to_project.sh
# Create a GitHub issue, add it to an org project, and assign it.
# Defaults target repo to cienai/IntegrationHub and project to Cien Engineering (#2).
# Usage:
#   scripts/gh_add_to_project.sh -t "Title" -f body.md [-b "Body text"] [-r owner/repo] [-p 2] [-o cienai] [-a user] [-l label]
# Notes:
#   - Provide either -f (body file) or -b (body text). If both provided, -f wins.
#   - Labels must already exist in the repo; otherwise omit -l.

REPO="cienai/IntegrationHub"
PROJECT_NUM="2"
PROJECT_OWNER="cienai"
ASSIGNEE="mrandersssson"
LABEL=""
TITLE=""
BODY=""
BODY_FILE=""

usage() {
  echo "Usage: $0 -t <title> [-f <body_file> | -b <body_text>] [-r <owner/repo>] [-p <project_number>] [-o <project_owner>] [-a <assignee>] [-l <label>]" >&2
  exit 1
}

while getopts ":t:f:b:r:p:o:a:l:" opt; do
  case "$opt" in
    t) TITLE="$OPTARG" ;;
    f) BODY_FILE="$OPTARG" ;;
    b) BODY="$OPTARG" ;;
    r) REPO="$OPTARG" ;;
    p) PROJECT_NUM="$OPTARG" ;;
    o) PROJECT_OWNER="$OPTARG" ;;
    a) ASSIGNEE="$OPTARG" ;;
    l) LABEL="$OPTARG" ;;
    *) usage ;;
  esac
done

if [[ -z "$TITLE" ]]; then
  echo "Error: -t <title> is required" >&2
  usage
fi

# Ensure gh is authenticated
if ! gh auth status >/dev/null 2>&1; then
  echo "GitHub CLI is not authenticated. Run: unset GITHUB_TOKEN && gh auth login -h github.com -p https -s repo,project -w" >&2
  exit 1
fi

create_cmd=(gh issue create -R "$REPO" -t "$TITLE")
if [[ -n "$BODY_FILE" ]]; then
  create_cmd+=(--body-file "$BODY_FILE")
elif [[ -n "$BODY" ]]; then
  create_cmd+=(-b "$BODY")
else
  echo "Warning: no body provided; creating an empty-bodied issue." >&2
fi
if [[ -n "$LABEL" ]]; then
  create_cmd+=(-l "$LABEL")
fi

# Create the issue and capture the URL
echo "Creating issue in $REPO ..." >&2
create_out="$(${create_cmd[@]})"
issue_url=$(echo "$create_out" | grep -Eo 'https://github.com/.*/issues/[0-9]+' | tail -n1)
if [[ -z "$issue_url" ]]; then
  echo "Failed to detect issue URL from output:" >&2
  echo "$create_out" >&2
  exit 1
fi
issue_number=$(echo "$issue_url" | sed -E 's#.*/issues/([0-9]+)$#\1#')

# Add to project
echo "Adding issue to project $PROJECT_OWNER/$PROJECT_NUM ..." >&2
gh project item-add "$PROJECT_NUM" --owner "$PROJECT_OWNER" --url "$issue_url"

# Assign
echo "Assigning issue #$issue_number to $ASSIGNEE ..." >&2
gh issue edit "$issue_number" -R "$REPO" --add-assignee "$ASSIGNEE"

# Optionally add label post-create if provided (and not added earlier)
if [[ -n "$LABEL" ]]; then
  gh issue edit "$issue_number" -R "$REPO" --add-label "$LABEL" || true
fi

# Final output
echo "Created and configured: $issue_url"