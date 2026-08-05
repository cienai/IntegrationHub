#!/usr/bin/env python3
from __future__ import annotations

import argparse
import re
from datetime import datetime, timezone
from pathlib import Path


def slugify(value: str) -> str:
    value = value.lower().strip()
    value = re.sub(r"[^a-z0-9]+", "-", value)
    return value.strip("-") or "ticket"


def create_run_folder(base_dir: Path, issue_number: str | None, title: str) -> Path:
    prefix = issue_number or datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    run_dir = base_dir / f"{prefix}-{slugify(title)[:64]}"
    candidate = run_dir
    suffix = 2
    while candidate.exists():
        candidate = base_dir / f"{run_dir.name}-{suffix}"
        suffix += 1
    candidate.mkdir(parents=True)
    return candidate


def main() -> int:
    parser = argparse.ArgumentParser(description="Create a ticket executor run folder.")
    parser.add_argument("--base-dir", type=Path, default=Path("ticket-executor") / "runs")
    parser.add_argument("--issue-number")
    parser.add_argument("--title", required=True)
    args = parser.parse_args()
    print(create_run_folder(args.base_dir, args.issue_number, args.title))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
