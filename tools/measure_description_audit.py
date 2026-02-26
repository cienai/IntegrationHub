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

STOPWORDS = {
    "a", "an", "and", "are", "as", "at", "be", "by", "for", "from", "has",
    "have", "in", "is", "it", "its", "of", "on", "or", "that", "the", "this",
    "to", "was", "were", "with", "without", "within", "per", "vs",
}

DERIVATION_MARKERS = {
    "ratio",
    "difference",
    "delta",
    "avg",
    "average",
    "sum",
    "count",
    "distinct",
    "per",
    "%",
    "percent",
    "divide",
    "divided",
    "normalized",
    "vs",
    "change",
    "improvement",
    "increase",
    "decrease",
}


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


def output_ok(value: str) -> bool:
    val = value.strip().lower()
    return val in ALLOWED_OUTPUTS


def tokenize(text: str) -> List[str]:
    return [t for t in re.split(r"[^A-Za-z0-9%]+", text.lower()) if t]


def non_stopword_count(text: str) -> int:
    tokens = tokenize(text)
    return sum(1 for t in tokens if t not in STOPWORDS)


def has_derivation_marker(text: str) -> bool:
    tokens = tokenize(text)
    return any(t in DERIVATION_MARKERS for t in tokens)


def deps_points(value: str) -> Tuple[float, Optional[str]]:
    if not value.strip() or is_placeholder(value):
        return 0.0, "dependencies_missing"
    if re.search(r"\bsee model references\b", value, re.I):
        return 0.5, "dependencies_see_model_references"
    if TABLE_COLUMN_RE.search(value) or MEASURE_REF_RE.search(value):
        return 1.0, None
    parts = [p.strip() for p in value.split(",") if p.strip()]
    if len(parts) > 1:
        return 1.0, None
    return 0.0, "dependencies_generic"


def context_points(value: str) -> Tuple[float, Optional[str]]:
    if not value.strip() or is_placeholder(value):
        return 0.0, "context_missing"
    return 0.5, None


def output_points(value: str) -> Tuple[float, Optional[str]]:
    if not value.strip() or is_placeholder(value):
        return 0.0, "output_missing"
    if output_ok(value):
        return 0.5, None
    return 0.0, "output_invalid"


def purpose_points(value: str) -> Tuple[float, Optional[str]]:
    if not value.strip() or is_placeholder(value):
        return 0.0, "purpose_missing"
    if non_stopword_count(value) < 5:
        return 0.0, "purpose_short"
    return 1.0, None


def logic_points(value: str) -> Tuple[float, List[str]]:
    flags = []
    if not value.strip() or is_placeholder(value):
        return 0.0, ["logic_missing"]
    points = 1.0
    if has_derivation_marker(value):
        points += 1.0
    else:
        flags.append("logic_no_derivation")
    return points, flags


def score_fields(fields: Dict[str, str]) -> Tuple[int, List[str]]:
    flags = []

    purpose_val = fields.get("purpose", "")
    logic_val = fields.get("logic", "")
    deps_val = fields.get("dependencies", "")
    context_val = fields.get("context", "")
    output_val = fields.get("output", "")

    p_points, p_flag = purpose_points(purpose_val)
    if p_flag:
        flags.append(p_flag)

    l_points, l_flags = logic_points(logic_val)
    flags.extend(l_flags)

    d_points, d_flag = deps_points(deps_val)
    if d_flag:
        flags.append(d_flag)

    c_points, c_flag = context_points(context_val)
    if c_flag:
        flags.append(c_flag)

    o_points, o_flag = output_points(output_val)
    if o_flag:
        flags.append(o_flag)

    raw_score = p_points + l_points + d_points + c_points + o_points
    score = int(min(5, max(0, (raw_score + 0.5) // 1)))
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
