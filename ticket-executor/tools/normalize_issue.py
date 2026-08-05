#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Any


SECTION_NAMES = [
    "Summary",
    "Ticket Type",
    "Problem",
    "Current Behavior",
    "Expected Behavior",
    "Affected Area",
    "Reproduction Steps",
    "Source of Truth",
    "Allowed Changes",
    "Prohibited Changes",
    "Verification Method",
    "Acceptance Criteria",
    "Notes",
]


def parse_sections(markdown: str) -> dict[str, str]:
    aliases = {name.lower(): name for name in SECTION_NAMES}
    matches = list(re.finditer(r"(?m)^#{1,6}\s+(.+?)\s*$", markdown))
    sections: dict[str, str] = {}
    for index, match in enumerate(matches):
        heading = match.group(1).strip()
        key = aliases.get(heading.lower())
        if not key:
            continue
        start = match.end()
        end = matches[index + 1].start() if index + 1 < len(matches) else len(markdown)
        sections[key] = markdown[start:end].strip()
    return sections


def normalize_issue(issue: dict[str, Any]) -> dict[str, Any]:
    body = issue.get("body") or ""
    sections = parse_sections(body)
    ticket = {
        "issue": {
            "number": issue.get("number"),
            "title": issue.get("title"),
            "url": issue.get("url"),
            "state": issue.get("state"),
            "labels": issue.get("labels", []),
        },
        "sections": {name: sections.get(name, "") for name in SECTION_NAMES},
        "raw_body": body,
    }
    if not ticket["sections"]["Summary"]:
        ticket["sections"]["Summary"] = issue.get("title") or ""
    return ticket


def main() -> int:
    parser = argparse.ArgumentParser(description="Normalize issue JSON into the executable ticket contract.")
    parser.add_argument("issue_json", type=Path)
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()

    issue = json.loads(args.issue_json.read_text(encoding="utf-8"))
    normalized = normalize_issue(issue)
    text = json.dumps(normalized, indent=2, ensure_ascii=False)
    if args.out:
        args.out.write_text(text + "\n", encoding="utf-8", newline="\n")
    else:
        print(text)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
