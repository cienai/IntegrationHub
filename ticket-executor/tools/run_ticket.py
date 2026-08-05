#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path
from typing import Any

TOOLS_DIR = Path(__file__).resolve().parent
REPO_ROOT = TOOLS_DIR.parents[1]
if str(TOOLS_DIR) not in sys.path:
    sys.path.insert(0, str(TOOLS_DIR))

from classify_ticket import classify
from create_handoff import render_handoff
from create_run_folder import create_run_folder
from fetch_issue import fetch_issue, read_issue_file
from normalize_issue import normalize_issue
from validate_ticket import validate


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run the general closed-loop ticket executor.")
    parser.add_argument("issue_number", nargs="?", help="GitHub issue number.")
    parser.add_argument("--repo", default="cienai/IntegrationHub", help="GitHub repo in owner/name form.")
    parser.add_argument("--issue-file", type=Path, help="Use a local issue markdown file instead of GitHub.")
    parser.add_argument("--out-dir", type=Path, default=Path("ticket-executor") / "runs")
    return parser.parse_args()


def write_json(path: Path, data: Any) -> None:
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8", newline="\n")


def standard_verification(
    check_id: str,
    description: str,
    source_of_truth: str,
    expected: str,
    actual: str,
    status: str,
    diagnosis: str,
    attempts: int = 0,
    comparison: str = "manual",
    tolerance: str = "n/a",
) -> dict[str, Any]:
    return {
        "check_id": check_id,
        "description": description,
        "source_of_truth": source_of_truth,
        "expected": expected,
        "actual": actual,
        "comparison": comparison,
        "tolerance": tolerance,
        "status": status,
        "diagnosis": diagnosis,
        "attempts": attempts,
    }


def build_execution_plan(ticket: dict[str, Any], classification: dict[str, Any], validation: dict[str, Any]) -> str:
    executor = classification["executor"]
    if validation["status"] == "blocked":
        return "Blocked before execution because the ticket contract is incomplete.\n"
    if classification["manual_review_required"]:
        return "Blocked before execution because classification confidence is too low.\n"
    if executor == "power-bi-report-builder":
        return (
            "Delegate to the existing Power BI Report Builder:\n\n"
            "```powershell\n"
            "python power-bi-report-builder/tools/run_pbi_builder.py <issue-number> --repo cienai/IntegrationHub\n"
            "```\n"
        )
    if executor == "dax_measure_repair":
        return (
            "DAX Measure repair pilot plan:\n\n"
            "1. Inspect affected semantic model and TMDL measure definitions.\n"
            "2. Inspect related DAX query files and validation scripts.\n"
            "3. Reproduce the reported mismatch or syntax error where Power BI access permits.\n"
            "4. Compare current result to the stated source of truth.\n"
            "5. Modify only explicitly allowed files if the source of truth is clear.\n"
            "6. Run `git diff --check` and relevant Power BI validation/query checks.\n"
            "7. Record verification results and correction attempts.\n"
        )
    return (
        "Generic execution plan:\n\n"
        "1. Reproduce current behavior.\n"
        "2. Inspect affected files.\n"
        "3. Implement scoped change.\n"
        "4. Run ticket-specified validation.\n"
        "5. Record verification results and handoff.\n"
    )


def route_ticket(args: argparse.Namespace, run_dir: Path, ticket: dict[str, Any], classification: dict[str, Any], validation: dict[str, Any]) -> tuple[list[dict[str, Any]], list[str], list[str]]:
    verification: list[dict[str, Any]] = []
    blockers: list[str] = []
    manual_review: list[str] = []
    source = ticket["sections"].get("Source of Truth", "")
    expected = ticket["sections"].get("Expected Behavior", "")

    if validation["status"] == "blocked":
        blockers.extend(f"Missing required field: {field}" for field in validation["missing_required_fields"])
        verification.append(standard_verification(
            "ticket-contract",
            "Executable ticket contract validation",
            "ticket-executor/issue_template.md",
            "All required fields present",
            "Missing required fields",
            "blocked",
            "Ticket is not safe to execute until required fields are supplied.",
        ))
        return verification, blockers, manual_review

    if classification["manual_review_required"]:
        manual_review.append("Classification confidence is low; choose an executor manually.")
        verification.append(standard_verification(
            "classification",
            "Deterministic classification confidence",
            "ticket-executor/classifiers/",
            "High-confidence executor selection",
            f"confidence={classification['confidence']}",
            "manual_review",
            "Classifier could not safely select an executor.",
        ))
        return verification, blockers, manual_review

    executor = classification["executor"]
    if executor == "power-bi-report-builder":
        cmd = [
            sys.executable,
            str(REPO_ROOT / "power-bi-report-builder" / "tools" / "run_pbi_builder.py"),
        ]
        if args.issue_file:
            cmd.extend(["--issue-file", str(args.issue_file)])
        elif args.issue_number:
            cmd.append(str(args.issue_number))
        if args.repo:
            cmd.extend(["--repo", args.repo])
        cmd.extend(["--out-dir", str(REPO_ROOT / "power-bi-report-builder" / "runs")])
        (run_dir / "delegation_command.txt").write_text(" ".join(cmd) + "\n", encoding="utf-8", newline="\n")
        verification.append(standard_verification(
            "power-bi-page-delegation",
            "Power BI Page ticket routes to specialized builder",
            "power-bi-report-builder/tools/run_pbi_builder.py",
            "Delegation command recorded",
            "Delegation command recorded",
            "pass",
            "General executor did not duplicate page-builder logic.",
            comparison="exact",
        ))
        return verification, blockers, manual_review

    if executor == "dax_measure_repair":
        verification.append(standard_verification(
            "dax-reproduction",
            "Reproduce DAX issue with stated query or Power BI access",
            source,
            expected,
            "Not executed by setup/pilot runner",
            "not_run",
            "DAX pilot requires model-specific inspection and, when applicable, Power BI credentials or Desktop review.",
        ))
        verification.append(standard_verification(
            "dax-governed-logic-protection",
            "Confirm governed logic is not silently redefined",
            "Ticket Prohibited Changes and Source of Truth",
            "No governed business definition changes without explicit authorization",
            "No files modified by pilot route",
            "pass",
            "Pilot route prepared artifacts only.",
            comparison="exact",
        ))
        manual_review.append("DAX pilot generated a plan only; continue with `executors/dax_measure_repair.md` for implementation.")
        return verification, blockers, manual_review

    verification.append(standard_verification(
        "executor-routing",
        f"Route ticket to {executor}",
        "classification result",
        executor,
        executor,
        "pass",
        "Executor selected; implementation must continue manually or in a future specialized runner.",
        comparison="exact",
    ))
    manual_review.append(f"Executor `{executor}` does not yet have an automated implementation runner.")
    return verification, blockers, manual_review


def main() -> int:
    args = parse_args()
    if args.issue_file:
        issue = read_issue_file(args.issue_file)
    elif args.issue_number:
        try:
            issue = fetch_issue(args.issue_number, args.repo)
        except (FileNotFoundError, subprocess.CalledProcessError) as exc:
            raise SystemExit(f"GitHub issue fetch failed. Use --issue-file for local mode. Details: {exc}")
    else:
        raise SystemExit("Provide a GitHub issue number or --issue-file.")

    run_dir = create_run_folder(args.out_dir, str(issue.get("number") or "local"), issue.get("title") or "ticket")
    (run_dir / "original_issue.md").write_text(f"# {issue.get('title')}\n\n{issue.get('body') or ''}\n", encoding="utf-8", newline="\n")
    write_json(run_dir / "issue_metadata.json", issue)

    ticket = normalize_issue(issue)
    classification = classify(ticket)
    validation = validate(ticket)
    plan = build_execution_plan(ticket, classification, validation)
    verification, blockers, manual_review = route_ticket(args, run_dir, ticket, classification, validation)
    self_correction: list[dict[str, Any]] = []

    write_json(run_dir / "normalized_ticket.json", ticket)
    write_json(run_dir / "classification.json", classification)
    write_json(run_dir / "validation_results.json", validation)
    (run_dir / "execution_plan.md").write_text("# Execution Plan\n\n" + plan, encoding="utf-8", newline="\n")
    write_json(run_dir / "verification_results.json", verification)
    write_json(run_dir / "self_correction_log.json", self_correction)
    handoff = render_handoff(ticket, classification, validation, verification, self_correction, [], blockers, manual_review)
    (run_dir / "final_handoff.md").write_text(handoff, encoding="utf-8", newline="\n")

    print(f"Wrote ticket executor run: {run_dir}")
    print(f"Classification: {classification['ticket_type']} -> {classification['executor']} ({classification['confidence']})")
    print(f"Validation: {validation['status']}")
    return 0 if not blockers else 2


if __name__ == "__main__":
    raise SystemExit(main())
