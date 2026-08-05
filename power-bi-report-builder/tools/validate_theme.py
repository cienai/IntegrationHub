#!/usr/bin/env python3
"""Validate that a Power BI theme JSON parses cleanly."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate Power BI theme JSON syntax.")
    parser.add_argument("theme", type=Path)
    args = parser.parse_args()

    with args.theme.open("r", encoding="utf-8-sig") as f:
        data = json.load(f)
    print(f"Theme parsed: {args.theme}")
    print(f"Name: {data.get('name', '<unnamed>')}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
