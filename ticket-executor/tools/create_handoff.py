#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


def bullet_list(items: list[str] | None) -> str:
    if not items:
        return "- None"
    return "\n".join(f"- {item}" for item in items)


def render_handoff(
    ticket: dict[str, Any],
    classification: dict[str, Any],
    validation: dict[str, Any],
    verification: list[dict[str, Any]],
    self_correction: list[dict[str, Any]],
    files_changed: list[str] | None = None,
    blockers: list[str] | None = None,
    manual_review: list[str] | None = None,
) -> str:
    issue = ticket.get("issue", {})
    statuses = [record.get("status", "not_run") for record in verification]
    success = statuses and all(status == "pass" for status in statuses)
    if blockers or validation.get("status") == "blocked" or classification.get("manual_review_required"):
        overall = "Blocked"
    elif success:
        overall = "Passed"
    else:
        overall = "Not complete"

    verification_lines = []
    for record in verification:
        verification_lines.append(
            f"- {record.get('check_id')}: {record.get('status')} - {record.get('description')}"
        )
    correction_lines = [
        f"- {entry.get('check_id', 'unknown')}: attempt {entry.get('attempt')} - {entry.get('diagnosis')} -> {entry.get('result')}"
        for entry in self_correction
    ]

    return f"""# Ticket Executor Handoff

Status: {overall}

## Issue

- Number: {issue.get('number')}
- Title: {issue.get('title')}
- URL: {issue.get('url')}

## Classification

- Ticket type: {classification.get('ticket_type')}
- Executor: {classification.get('executor')}
- Confidence: {classification.get('confidence')}
- Manual review required: {classification.get('manual_review_required')}

## Files Changed

{bullet_list(files_changed)}

## Problem Reproduced

- Not completed by the framework setup run unless verification records say otherwise.

## Root Cause

- To be filled by the selected executor after reproduction.

## Changes Made

- Intake, classification, validation, and handoff artifacts were generated.

## Validation Results

- Status: {validation.get('status')}
- Missing required fields: {', '.join(validation.get('missing_required_fields', [])) or 'None'}
- Warnings: {', '.join(validation.get('warnings', [])) or 'None'}

## Verification Results

{chr(10).join(verification_lines) if verification_lines else '- None'}

## Self-Correction Log

{chr(10).join(correction_lines) if correction_lines else '- None'}

## Deviations From Ticket

- None recorded.

## Remaining Blockers

{bullet_list(blockers)}

## Manual Review Items

{bullet_list(manual_review)}

## Recommended Next Action

- Address blockers or continue with the selected executor workflow.
"""


def main() -> int:
    parser = argparse.ArgumentParser(description="Create a final ticket executor handoff.")
    parser.add_argument("run_dir", type=Path)
    args = parser.parse_args()

    ticket = json.loads((args.run_dir / "normalized_ticket.json").read_text(encoding="utf-8"))
    classification = json.loads((args.run_dir / "classification.json").read_text(encoding="utf-8"))
    validation = json.loads((args.run_dir / "validation_results.json").read_text(encoding="utf-8"))
    verification = json.loads((args.run_dir / "verification_results.json").read_text(encoding="utf-8"))
    self_correction = json.loads((args.run_dir / "self_correction_log.json").read_text(encoding="utf-8"))
    handoff = render_handoff(ticket, classification, validation, verification, self_correction)
    (args.run_dir / "final_handoff.md").write_text(handoff, encoding="utf-8", newline="\n")
    print(args.run_dir / "final_handoff.md")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
