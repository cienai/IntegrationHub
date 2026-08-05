#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


REQUIRED_FIELDS = [
    "Problem",
    "Current Behavior",
    "Expected Behavior",
    "Affected Area",
    "Source of Truth",
    "Allowed Changes",
    "Prohibited Changes",
    "Verification Method",
    "Acceptance Criteria",
]


def validate(ticket: dict[str, Any]) -> dict[str, Any]:
    sections = ticket.get("sections", {})
    missing = [field for field in REQUIRED_FIELDS if not (sections.get(field) or "").strip()]
    warnings: list[str] = []
    if not (sections.get("Reproduction Steps") or "").strip():
        warnings.append("Reproduction Steps are missing; executor must derive or request reproduction steps before implementation.")
    status = "pass" if not missing else "blocked"
    return {
        "status": status,
        "missing_required_fields": missing,
        "warnings": warnings,
        "can_execute_safely": status == "pass",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate normalized executable ticket contract.")
    parser.add_argument("normalized_json", type=Path)
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()
    ticket = json.loads(args.normalized_json.read_text(encoding="utf-8"))
    validation = validate(ticket)
    text = json.dumps(validation, indent=2, ensure_ascii=False)
    if args.out:
        args.out.write_text(text + "\n", encoding="utf-8", newline="\n")
    else:
        print(text)
    return 0 if validation["can_execute_safely"] else 2


if __name__ == "__main__":
    raise SystemExit(main())
