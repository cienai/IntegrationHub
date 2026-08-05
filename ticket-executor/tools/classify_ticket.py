#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Any


TYPE_TO_EXECUTOR = {
    "power bi page": "power-bi-report-builder",
    "dax measure": "dax_measure_repair",
    "saved query": "saved_query_repair",
    "semantic model": "semantic_model",
    "agentic": "agentic",
    "engineering": "generic_code_change",
    "other": "manual_review",
}


def clean_type(value: str) -> str:
    value = value.strip()
    value = re.sub(r"^[-*]\s*", "", value)
    value = value.splitlines()[0] if value else ""
    return value.strip().lower()


def classify(ticket: dict[str, Any]) -> dict[str, Any]:
    sections = ticket.get("sections", {})
    body = (ticket.get("raw_body") or "").lower()
    affected = (sections.get("Affected Area") or "").lower()
    explicit = clean_type(sections.get("Ticket Type") or "")
    reasons: list[str] = []

    if explicit in TYPE_TO_EXECUTOR:
        ticket_type = {
            "power bi page": "Power BI Page",
            "dax measure": "DAX Measure",
            "saved query": "Saved Query",
            "semantic model": "Semantic Model",
            "agentic": "Agentic",
            "engineering": "Engineering",
            "other": "Other",
        }[explicit]
        reasons.append(f"Explicit Ticket Type: {ticket_type}")
        return result(ticket_type, TYPE_TO_EXECUTOR[explicit], 0.95, reasons, explicit == "other")

    text = f"{body}\n{affected}"
    if "page_spec_template.md" in text or "new page" in text or "/definition/pages/" in text:
        reasons.append("Strong Power BI page evidence from page spec or report page paths")
        return result("Power BI Page", "power-bi-report-builder", 0.85, reasons, False)
    if "dax" in text or "measure" in text or ".semanticmodel/definition/tables" in text or "evaluate" in text:
        reasons.append("DAX or semantic-model measure evidence")
        return result("DAX Measure", "dax_measure_repair", 0.75, reasons, False)
    if "daxqueries" in text or "saved query" in text:
        reasons.append("Saved query evidence")
        return result("Saved Query", "saved_query_repair", 0.75, reasons, False)
    if ".semanticmodel/definition" in text or "relationship" in text or "tmdl" in text:
        reasons.append("Semantic model artifact evidence")
        return result("Semantic Model", "semantic_model", 0.7, reasons, False)
    if "agentic" in text or "prompt" in text or "orchestration" in text:
        reasons.append("Agentic workflow keyword evidence")
        return result("Agentic", "agentic", 0.7, reasons, False)
    if any(token in text for token in ["python", "script", "etl", "deployment", "bug", "test", "docs"]):
        reasons.append("Engineering keyword evidence")
        return result("Engineering", "generic_code_change", 0.65, reasons, False)

    reasons.append("No strong explicit, path, artifact, or keyword evidence")
    return result("Other", "manual_review", 0.25, reasons, True)


def result(ticket_type: str, executor: str, confidence: float, reasons: list[str], manual: bool) -> dict[str, Any]:
    return {
        "ticket_type": ticket_type,
        "executor": executor,
        "confidence": confidence,
        "reasons": reasons,
        "manual_review_required": manual or confidence < 0.6,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Classify a normalized ticket.")
    parser.add_argument("normalized_json", type=Path)
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()

    ticket = json.loads(args.normalized_json.read_text(encoding="utf-8"))
    classification = classify(ticket)
    text = json.dumps(classification, indent=2, ensure_ascii=False)
    if args.out:
        args.out.write_text(text + "\n", encoding="utf-8", newline="\n")
    else:
        print(text)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
