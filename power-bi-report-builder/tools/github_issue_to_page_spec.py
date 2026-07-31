#!/usr/bin/env python3
"""
Create a Power BI builder intake package from GitHub issue text.

This script can fetch an issue through the GitHub CLI or read issue text from a
local file. It does not build a report page. It prepares the handoff files that
Codex or a Power BI developer can use to start from a consistent spec.
"""

from __future__ import annotations

import argparse
import re
import subprocess
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path


REQUIRED_SECTIONS = {
    "business question": "What question should this page answer?",
    "audience": "Who is this page for?",
    "decision or action": "What decision or action should the page support?",
    "data contract": "Population, grain, period, baseline, filters, sample size, and source of truth.",
    "metrics": "Measures or calculations used by the page.",
    "dimensions": "Fields used for grouping, slicing, or detail rows.",
    "interpretation rules": "What the page can and cannot claim.",
    "acceptance criteria": "How the reviewer knows the page is ready.",
}


@dataclass
class IssueContent:
    source_label: str
    title: str
    body: str


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Turn a GitHub issue into a Power BI builder handoff.")
    parser.add_argument("issue_number", nargs="?", help="GitHub issue number to fetch with gh.")
    parser.add_argument("--repo", help="GitHub repo in owner/name form. Optional when gh can infer it.")
    parser.add_argument("--issue-file", type=Path, help="Read issue markdown from a local file instead of gh.")
    parser.add_argument(
        "--out-dir",
        type=Path,
        default=Path("power-bi-report-builder") / "runs",
        help="Folder where the builder run package should be written.",
    )
    return parser.parse_args()


def slugify(value: str) -> str:
    value = value.lower().strip()
    value = re.sub(r"[^a-z0-9]+", "-", value)
    return value.strip("-") or "pbi-builder-run"


def fetch_issue(issue_number: str, repo: str | None) -> IssueContent:
    cmd = ["gh", "issue", "view", issue_number, "--json", "title,body", "--template", "{{.title}}\n---BODY---\n{{.body}}"]
    if repo:
        cmd.extend(["--repo", repo])
    result = subprocess.run(cmd, check=True, capture_output=True, text=True)
    title, _, body = result.stdout.partition("\n---BODY---\n")
    return IssueContent(source_label=f"github-issue-{issue_number}", title=title.strip(), body=body.strip())


def read_issue_file(path: Path) -> IssueContent:
    text = path.read_text(encoding="utf-8-sig")
    lines = text.splitlines()
    title = lines[0].lstrip("# ").strip() if lines else path.stem
    return IssueContent(source_label=path.stem, title=title or path.stem, body=text.strip())


def section_present(body: str, section: str) -> bool:
    pattern = re.compile(rf"(^|\n)\s*#+\s*{re.escape(section)}\s*(\n|$)", re.IGNORECASE)
    if pattern.search(body):
        return True
    loose = section.replace(" or ", " ").replace(" and ", " ")
    return all(word in body.lower() for word in loose.split())


def build_validation(body: str) -> tuple[list[str], list[str]]:
    present: list[str] = []
    missing: list[str] = []
    for section, description in REQUIRED_SECTIONS.items():
        if section_present(body, section):
            present.append(section)
        else:
            missing.append(f"{section}: {description}")
    return present, missing


def write_run(issue: IssueContent, out_dir: Path) -> Path:
    stamp = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    run_dir = out_dir / f"{stamp}-{slugify(issue.source_label)}-{slugify(issue.title)[:48]}"
    run_dir.mkdir(parents=True, exist_ok=False)

    present, missing = build_validation(issue.body)
    (run_dir / "issue_raw.md").write_text(f"# {issue.title}\n\n{issue.body}\n", encoding="utf-8", newline="\n")
    (run_dir / "page_spec_draft.md").write_text(render_page_spec(issue), encoding="utf-8", newline="\n")
    (run_dir / "builder_handoff.md").write_text(render_handoff(issue, missing), encoding="utf-8", newline="\n")
    (run_dir / "intake_validation.md").write_text(render_validation(present, missing), encoding="utf-8", newline="\n")
    return run_dir


def render_page_spec(issue: IssueContent) -> str:
    return f"""# Page Spec Draft

Source: {issue.source_label}
Title: {issue.title}

## Issue Text

{issue.body}

## Builder Notes

Fill this section before changing PBIP files:

- Target report:
- Target page:
- Business question:
- Audience:
- Decision or action:
- Data contract:
- Measures:
- Dimensions:
- Visual patterns:
- Footer and notes:
- Acceptance criteria:
"""


def render_handoff(issue: IssueContent, missing: list[str]) -> str:
    status = "Ready for builder review" if not missing else "Needs clarification before build"
    missing_text = "\n".join(f"- {item}" for item in missing) if missing else "- None"
    return f"""# Power BI Builder Handoff

Status: {status}
Source: {issue.source_label}
Title: {issue.title}

## Missing Or Weak Inputs

{missing_text}

## Build Order

1. Read `issue_raw.md`.
2. Complete `page_spec_draft.md`.
3. Check the spec against `../validation_checklist.md`.
4. Inspect the target PBIP report and semantic model.
5. Reuse existing measures and visual patterns.
6. Make scoped PBIP edits.
7. Run validation tools.
8. Open the report in Power BI Desktop for final inspection.
"""


def render_validation(present: list[str], missing: list[str]) -> str:
    present_text = "\n".join(f"- {item}" for item in present) if present else "- None"
    missing_text = "\n".join(f"- {item}" for item in missing) if missing else "- None"
    return f"""# Intake Validation

## Found

{present_text}

## Missing

{missing_text}
"""


def main() -> int:
    args = parse_args()
    if args.issue_file:
        issue = read_issue_file(args.issue_file)
    elif args.issue_number:
        issue = fetch_issue(args.issue_number, args.repo)
    else:
        raise SystemExit("Provide an issue number or --issue-file.")

    run_dir = write_run(issue, args.out_dir)
    print(f"Wrote builder intake package: {run_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
