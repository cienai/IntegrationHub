#!/usr/bin/env python3
"""Inspect PBIP page and visual counts."""

from __future__ import annotations

import json
from collections import Counter
from pathlib import Path
import argparse


def main() -> int:
    parser = argparse.ArgumentParser(description="Inspect PBIP report pages.")
    parser.add_argument("target", type=Path)
    args = parser.parse_args()

    target = args.target
    if (target / "definition" / "pages").exists():
        target = target / "definition" / "pages"
    pages = [target] if (target / "page.json").exists() else sorted(p for p in target.iterdir() if (p / "page.json").exists())

    print(f"Pages: {len(pages)}")
    for page in pages:
        page_json = json.load(open(page / "page.json", encoding="utf-8-sig"))
        counts: Counter[str] = Counter()
        for visual_path in (page / "visuals").rglob("visual.json"):
            visual = json.load(open(visual_path, encoding="utf-8-sig"))
            counts[visual.get("visual", {}).get("visualType", "<unknown>")] += 1
        total = sum(counts.values())
        print(f"{page.name}: {page_json.get('displayName', page.name)} :: {total} visuals :: {dict(counts)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
