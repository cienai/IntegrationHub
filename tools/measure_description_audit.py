# measure_description_audit.py
# Generates a summary audit of measure documentation across TMDL models.
# Scoring rubric (0-5) based on presence/quality of five /// comment fields:
# Purpose, Logic, Dependencies, Context, Output.

import os
import re
import argparse
from typing import List, Tuple, Optional, Dict

MEASURE_RE = re.compile(r"^\s*measure\s+(.+?)\s*(?:=|$)")
COMMENT_RE = re.compile(r"^\s*///\s*(.*)$")
FIELD_RE = re.compile(r"^(Purpose|Logic|Dependencies|Context|Output):\s*(.*)$", re.I)
PLACEHOLDER_RE = re.compile(r"^(?:todo|tbd|n/?a|na|none|description|add description|placeholder|fixme|-)\b", re.I)

TABLE_COLUMN_RE = re.compile(r"\b[A-Za-z0-9_]+\[[A-Za-z0-9_]+\]\b")
MEASURE_REF_RE = re.compile(r"\[[A-Za-z0-9_.]+\]")

ALLOWED_OUTPUTS = {
    "text",
    "whole number",
    "decimal",
    "percentage",
    "boolean",
    "date",
    "datetime",
}

GENERIC_PURPOSE_PATTERNS = [
    r"\bcompute the measure result\b",
    r"\bcompute the measure\b",
    r"\bcalculate the measure result\b",
    r"\bcalculates the measure result\b",
    r"\breturns the measure result\b",
    r"\bthis measure\b",
    r"\bbusiness metric for this measure\b",
    r"\bmetric for this measure\b",
]

GENERIC_LOGIC_PATTERNS = [
    r"\bplain-english\b",
    r"\bcomputes the metric\b",
    r"\buses the dax expression\b",
    r"\bfrom its underlying model references\b",
]

DERIVATION_MARKERS = [
    "ratio",
    "percent",
    "percentage",
    "divide",
    "sum",
    "average",
    "count",
    "distinct",
    "difference",
    "subtract",
    "add",
    "multiply",
    "min",
    "max",
    "median",
    "rank",
    "weighted",
]


def is_placeholder(text: str) -> bool:
    if not text:
        return True
    return bool(PLACEHOLDER_RE.match(text.strip()))


def parse_tmdl(path: str) -> List[Tuple[str, Dict[str, str]]]:
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    measures = []
    i = 0
    while i < len(lines):
        m = MEASURE_RE.match(lines[i])
        if not m:
            i += 1
            continue
        name = m.group(1).strip()
        if (name.startswith("'") and name.endswith("'")) or (name.startswith('"') and name.endswith('"')):
            name = name[1:-1]

        # contiguous /// block immediately above the measure
        comment_lines = []
        j = i - 1
        while j >= 0 and COMMENT_RE.match(lines[j]):
            comment_lines.append(COMMENT_RE.match(lines[j]).group(1).strip())
            j -= 1
        comment_lines.reverse()

        fields = {
            "purpose": "",
            "logic": "",
            "dependencies": "",
            "context": "",
            "output": "",
        }
        for raw in comment_lines:
            mfield = FIELD_RE.match(raw)
            if not mfield:
                continue
            key = mfield.group(1).strip().lower()
            value = mfield.group(2).strip()
            if key in fields:
                fields[key] = value

        measures.append((name, fields))
        i += 1

    return measures


def is_generic(text: str, patterns: List[str]) -> bool:
    text = (text or "").lower()
    for pat in patterns:
        if re.search(pat, text):
            return True
    return False


def deps_ok(value: str) -> bool:
    if not value.strip():
        return False
    if re.search(r"\bsee model references\b", value, re.I):
        return True
    if TABLE_COLUMN_RE.search(value):
        return True
    if MEASURE_REF_RE.search(value):
        return True
    return False


def context_ok(value: str) -> bool:
    if not value.strip():
        return False
    return bool(re.search(r"\b(filter context|current filter context|evaluation context|filtering context)\b", value, re.I))


def output_ok(value: str) -> bool:
    val = value.strip().lower()
    return val in ALLOWED_OUTPUTS


def logic_generic(value: str) -> bool:
    if not value.strip():
        return True
    if is_generic(value, GENERIC_LOGIC_PATTERNS):
        markers = [m for m in DERIVATION_MARKERS if m in value.lower()]
        if not markers:
            return True
    return False


def score_fields(fields: Dict[str, str]) -> Tuple[int, List[str]]:
    flags = []

    purpose_val = fields.get("purpose", "")
    logic_val = fields.get("logic", "")
    deps_val = fields.get("dependencies", "")
    context_val = fields.get("context", "")
    output_val = fields.get("output", "")

    purpose_present = bool(purpose_val.strip()) and not is_placeholder(purpose_val)
    purpose_generic = is_generic(purpose_val, GENERIC_PURPOSE_PATTERNS)
    purpose_ok = purpose_present and not purpose_generic
    if not purpose_present:
        flags.append("purpose_missing")
    elif purpose_generic:
        flags.append("purpose_generic")

    logic_present = bool(logic_val.strip()) and not is_placeholder(logic_val)
    logic_is_generic = logic_generic(logic_val)
    logic_ok = logic_present and not logic_is_generic
    if not logic_present:
        flags.append("logic_missing")
    elif logic_is_generic:
        flags.append("logic_generic")

    deps_present = bool(deps_val.strip()) and not is_placeholder(deps_val)
    deps_is_ok = deps_present and deps_ok(deps_val)
    if not deps_present:
        flags.append("dependencies_missing")
    elif not deps_is_ok:
        flags.append("dependencies_generic")

    context_present = bool(context_val.strip()) and not is_placeholder(context_val)
    context_is_ok = context_present and context_ok(context_val)
    if not context_present:
        flags.append("context_missing")
    elif not context_is_ok:
        flags.append("context_generic")

    output_present = bool(output_val.strip()) and not is_placeholder(output_val)
    output_is_ok = output_present and output_ok(output_val)
    if not output_present:
        flags.append("output_missing")
    elif not output_is_ok:
        flags.append("output_invalid")

    score = sum([purpose_ok, logic_ok, deps_is_ok, context_is_ok, output_is_ok])
    return score, flags


def collect_measures(root: str) -> List[Tuple[str, str, Dict[str, str]]]:
    measures = []
    for dirpath, _, filenames in os.walk(root):
        for fn in filenames:
            if not fn.endswith(".tmdl"):
                continue
            full = os.path.join(dirpath, fn)
            if os.sep + "definition" + os.sep not in full or os.sep + "tables" + os.sep not in full:
                continue
            model = None
            parts = full.split(os.sep)
            for part in parts:
                if part.endswith(".SemanticModel"):
                    model = part.replace(".SemanticModel", "")
                    break
            if not model:
                model = "UnknownModel"
            for name, fields in parse_tmdl(full):
                measures.append((model, name, fields))
    return measures


def main() -> int:
    parser = argparse.ArgumentParser(description="Audit measure documentation in TMDL models.")
    parser.add_argument("--root", required=True, help="Root folder containing powerbi/src.")
    parser.add_argument("--csv", required=True, help="Output CSV path.")
    parser.add_argument("--summary", required=True, help="Output summary markdown path.")
    args = parser.parse_args()

    measures = collect_measures(args.root)

    rows = []
    score_counts = {i: 0 for i in range(0, 6)}

    for model, name, fields in measures:
        score, flags = score_fields(fields)
        score_counts[score] += 1
        rows.append((model, name, score, flags, fields))

    total = len(rows)

    # Write CSV
    os.makedirs(os.path.dirname(args.csv), exist_ok=True)
    with open(args.csv, "w", encoding="utf-8", newline="") as f:
        f.write("model,measure,score,flags,purpose,logic,dependencies,context,output\n")
        for model, name, score, flags, fields in rows:
            def esc(value: str) -> str:
                value = value.replace('"', '""')
                return f"\"{value}\""
            flags_value = ";".join(flags)
            f.write(
                ",".join(
                    [
                        esc(model),
                        esc(name),
                        str(score),
                        esc(flags_value),
                        esc(fields.get("purpose", "")),
                        esc(fields.get("logic", "")),
                        esc(fields.get("dependencies", "")),
                        esc(fields.get("context", "")),
                        esc(fields.get("output", "")),
                    ]
                )
                + "\n"
            )

    # Prepare summary
    rows_sorted = sorted(rows, key=lambda r: (r[2], r[0].lower(), r[1].lower()))
    lowest = rows_sorted[:20]

    # Write markdown summary
    lines = []
    lines.append("# Measure Documentation Score Summary\n")
    lines.append("\n")
    lines.append(f"Total measures audited: **{total}**\n")
    lines.append("\n")
    lines.append("## Score Summary\n")
    lines.append("\n")
    for s in range(0, 6):
        lines.append(f"- Score {s}: {score_counts[s]}\n")
    lines.append("\n")
    lines.append("## Lowest 20 Measures\n")
    lines.append("\n")
    lines.append("| Model | Measure | Score | Flags | Purpose | Logic | Output |\n")
    lines.append("| --- | --- | --- | --- | --- | --- | --- |\n")
    for model, name, score, flags, fields in lowest:
        safe_flags = ";".join(flags).replace("|", "\\|")
        purpose = fields.get("purpose", "").replace("|", "\\|")
        logic = fields.get("logic", "").replace("|", "\\|")
        output = fields.get("output", "").replace("|", "\\|")
        lines.append(f"| {model} | {name} | {score} | {safe_flags} | {purpose} | {logic} | {output} |\n")

    os.makedirs(os.path.dirname(args.summary), exist_ok=True)
    with open(args.summary, "w", encoding="utf-8") as f:
        f.writelines(lines)

    print("Score distribution:")
    for s in range(0, 6):
        print(f"  Score {s}: {score_counts[s]}")
    print("\nLowest 20 measures:")
    for model, name, score, flags, fields in lowest:
        flags_value = ";".join(flags)
        print(f"- {model} :: {name} | score={score} | flags={flags_value}")
        print(f"  Purpose: {fields.get('purpose', '')}")
        print(f"  Logic: {fields.get('logic', '')}")
        print(f"  Output: {fields.get('output', '')}")

    print(f"\nWrote: {args.csv}")
    print(f"Wrote: {args.summary}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
