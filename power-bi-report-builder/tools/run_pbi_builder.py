#!/usr/bin/env python3
"""
Start a Power BI builder run from a GitHub issue number or local issue file.
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path


THIS_DIR = Path(__file__).resolve().parent
INTAKE_SCRIPT = THIS_DIR / "github_issue_to_page_spec.py"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Start a Power BI builder intake run.")
    parser.add_argument("issue_number", nargs="?", help="GitHub issue number, for example 1234.")
    parser.add_argument("--repo", help="GitHub repo in owner/name form. Optional when gh can infer it.")
    parser.add_argument("--issue-file", type=Path, help="Use local issue markdown instead of GitHub.")
    parser.add_argument(
        "--out-dir",
        type=Path,
        default=Path("power-bi-report-builder") / "runs",
        help="Folder where the intake package should be written.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    cmd = [sys.executable, str(INTAKE_SCRIPT)]
    if args.issue_file:
        cmd.extend(["--issue-file", str(args.issue_file)])
    elif args.issue_number:
        cmd.append(args.issue_number)
    else:
        raise SystemExit("Provide a GitHub issue number or --issue-file.")
    if args.repo:
        cmd.extend(["--repo", args.repo])
    cmd.extend(["--out-dir", str(args.out_dir)])

    return subprocess.run(cmd).returncode


if __name__ == "__main__":
    raise SystemExit(main())
