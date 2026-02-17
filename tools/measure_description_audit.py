# measure_description_audit.py
# Generates a summary audit of measure descriptions across TMDL models.
# Scoring rubric (1-5) based on presence of five components:
# Purpose, Calculation Logic, Dependencies, Dynamic Behavior, Format/Type.

import os
import re
import json
import argparse
from typing import List, Tuple, Optional, Dict

MEASURE_RE = re.compile(r"^\s*measure\s+(.+?)\s*(?:=|$)")
DESC_RE = re.compile(r"^\s*description:\s*(.*)$")
PLACEHOLDER_RE = re.compile(r"^(?:todo|tbd|n/?a|na|none|description|add description|placeholder|fixme|-)\b", re.I)

# DAX patterns for dependency extraction
COLUMN_REF_RE = re.compile(r"([A-Za-z0-9_]+)\[([A-Za-z0-9_]+)\]")
MEASURE_REF_RE = re.compile(r"\[([A-Za-z0-9_.]+)\]")

# DAX behavior indicators
BEHAVIOR_FUNCS = {
    "calculate",
    "calculatetable",
    "filter",
    "all",
    "allexcept",
    "allselected",
    "keepfilters",
    "removefilters",
    "treatas",
    "userelationship",
    "crossfilter",
    "summarize",
    "summarizecolumns",
    "addcolumns",
    "values",
}

# DAX logic indicators
LOGIC_FUNCS = {
    "sum",
    "average",
    "distinctcount",
    "count",
    "countrows",
    "min",
    "max",
    "divide",
    "if",
    "switch",
    "round",
    "roundup",
    "rounddown",
    "format",
}

# Format indicators for description text
FORMAT_HINTS = {
    "format",
    "number",
    "percent",
    "percentage",
    "currency",
    "date",
    "datetime",
    "text",
    "string",
}


def parse_desc_value(raw: str) -> str:
    raw = raw.strip()
    if not raw:
        return ""
    if raw.startswith('"'):
        try:
            return json.loads(raw)
        except Exception:
            return raw.strip('"')
    return raw


def is_placeholder(text: str) -> bool:
    if not text:
        return True
    return bool(PLACEHOLDER_RE.match(text.strip()))


def parse_tmdl(path: str) -> List[Tuple[str, str, Optional[str], Optional[str]]]:
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

        # expression
        expr = ""
        if "```" in lines[i]:
            i += 1
            expr_lines = []
            while i < len(lines) and lines[i].strip() != "```":
                expr_lines.append(lines[i].rstrip("\r\n"))
                i += 1
            expr = "\n".join(expr_lines).strip()
        else:
            if "=" in lines[i]:
                expr = lines[i].split("=", 1)[1].strip()

        # search description within block
        start_indent = len(lines[i]) - len(lines[i].lstrip())
        j = i + 1
        desc = None
        fmt = None
        while j < len(lines):
            if lines[j].strip() == "":
                j += 1
                continue
            indent = len(lines[j]) - len(lines[j].lstrip())
            if indent <= start_indent:
                break
            d = DESC_RE.match(lines[j])
            if d:
                desc = parse_desc_value(d.group(1))
            if lines[j].lstrip().startswith("formatString:"):
                fmt = lines[j].split("formatString:", 1)[1].strip().strip('"')
            j += 1

        measures.append((name, expr, desc, fmt))
        i = j

    return measures


def extract_dependencies(expr: str) -> Tuple[List[str], List[str]]:
    cols = [f"{t}[{c}]" for t, c in COLUMN_REF_RE.findall(expr or "")]
    # measure refs are any [name] that are not column refs
    all_brackets = MEASURE_REF_RE.findall(expr or "")
    # strip column refs from measure refs
    col_names = {c for _, c in COLUMN_REF_RE.findall(expr or "")}
    measures = [m for m in all_brackets if m not in col_names]
    return sorted(set(cols)), sorted(set(measures))


def describe_components(expr: str, desc: Optional[str], fmt: Optional[str]) -> Dict[str, bool]:
    desc_text = (desc or "").lower()
    expr_text = (expr or "").lower()

    purpose = any(k in desc_text for k in ["purpose", "goal", "aim", "compute", "calculate", "measure", "rate", "ratio", "count", "sum", "average", "score", "total"])
    logic = any(k in desc_text for k in ["logic", "formula", "divide", "sum", "average", "count", "distinct", "ratio", "round", "if", "switch"]) or any(f"{fn}(" in expr_text for fn in LOGIC_FUNCS)
    deps = bool(re.search(r"\w+\[\w+\]", desc or "")) or bool(COLUMN_REF_RE.search(expr or "")) or bool(MEASURE_REF_RE.search(expr or ""))
    behavior = any(k in desc_text for k in ["filter", "context", "dynamic", "calculate", "calculated", "depends on selection"]) or any(f"{fn}(" in expr_text for fn in BEHAVIOR_FUNCS)
    fmt_present = bool(fmt) or any(k in desc_text for k in FORMAT_HINTS)

    return {
        "purpose": purpose,
        "logic": logic,
        "dependencies": deps,
        "behavior": behavior,
        "format": fmt_present,
    }


def score_components(components: Dict[str, bool], desc: Optional[str]) -> Tuple[int, str]:
    if desc is None or desc.strip() == "" or is_placeholder(desc):
        return 1, "Missing or placeholder description."

    present = [k for k, v in components.items() if v]
    missing = [k for k, v in components.items() if not v]

    if len(present) <= 1:
        return 2, "Description is minimal; missing: " + ", ".join(missing)
    if len(present) == 2:
        return 3, "Partial description; missing: " + ", ".join(missing)
    if len(present) == 3 or len(present) == 4:
        return 4, "Good coverage; missing: " + ", ".join(missing)
    return 5, "Complete description covers all required components."


def collect_measures(root: str) -> List[Tuple[str, str, Optional[str], Optional[str]]]:
    measures = []
    for dirpath, _, filenames in os.walk(root):
        for fn in filenames:
            if not fn.endswith(".tmdl"):
                continue
            full = os.path.join(dirpath, fn)
            if os.sep + "definition" + os.sep not in full:
                continue
            measures.extend(parse_tmdl(full))
    return measures


def main() -> int:
    parser = argparse.ArgumentParser(description="Audit measure descriptions in TMDL models.")
    parser.add_argument("--root", required=True, help="Root folder containing powerbi/src.")
    parser.add_argument("--out", required=True, help="Output markdown path.")
    args = parser.parse_args()

    measures = collect_measures(args.root)

    rows = []
    score_counts = {i: 0 for i in range(1, 6)}

    for name, expr, desc, fmt in measures:
        components = describe_components(expr, desc, fmt)
        score, reason = score_components(components, desc)
        score_counts[score] += 1
        rows.append((name, score, reason))

    total = len(rows)

    # Write markdown
    lines = []
    lines.append("# Measure Description Audit\n")
    lines.append("\n")
    lines.append(f"Total measures audited: **{total}**\n")
    lines.append("\n")
    lines.append("## Score Summary\n")
    lines.append("\n")
    for s in range(1, 6):
        lines.append(f"- Score {s}: {score_counts[s]}\n")
    lines.append("\n")
    lines.append("## Measures\n")
    lines.append("\n")
    lines.append("| Measure | Score | Reason |\n")
    lines.append("| --- | --- | --- |\n")
    for name, score, reason in rows:
        # escape pipe characters
        safe_reason = reason.replace("|", "\\|")
        lines.append(f"| {name} | {score} | {safe_reason} |\n")

    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as f:
        f.writelines(lines)

    print(f"Wrote: {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
