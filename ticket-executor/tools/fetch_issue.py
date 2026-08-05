#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import subprocess
from pathlib import Path
from typing import Any


def fetch_issue(issue_number: str, repo: str | None) -> dict[str, Any]:
    cmd = [
        "gh",
        "issue",
        "view",
        issue_number,
        "--json",
        "number,title,body,url,author,labels,state,createdAt,updatedAt",
    ]
    if repo:
        cmd.extend(["--repo", repo])
    result = subprocess.run(cmd, check=True, capture_output=True, text=True, encoding="utf-8")
    return json.loads(result.stdout)


def read_issue_file(path: Path) -> dict[str, Any]:
    body = path.read_text(encoding="utf-8-sig")
    first_line = next((line.strip() for line in body.splitlines() if line.strip()), path.stem)
    title = first_line.lstrip("# ").strip() or path.stem
    return {
        "number": None,
        "title": title,
        "body": body,
        "url": str(path),
        "author": None,
        "labels": [],
        "state": "LOCAL",
        "createdAt": None,
        "updatedAt": None,
        "source": "local_file",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Fetch a GitHub issue or read a local issue file.")
    parser.add_argument("issue_number", nargs="?")
    parser.add_argument("--repo")
    parser.add_argument("--issue-file", type=Path)
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()

    if args.issue_file:
        data = read_issue_file(args.issue_file)
    elif args.issue_number:
        data = fetch_issue(args.issue_number, args.repo)
    else:
        raise SystemExit("Provide an issue number or --issue-file.")

    text = json.dumps(data, indent=2, ensure_ascii=False)
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(text + "\n", encoding="utf-8", newline="\n")
    else:
        print(text)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
