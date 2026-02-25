# measure_description_audit.py
# Generates a summary audit of measure descriptions across TMDL models.
# Scoring rubric (1-5) based on presence of four doc block components:
# Purpose, Calculation Logic, Dynamic Behavior, Format/Type.

import os
import re
import json
import argparse
from typing import List, Tuple, Optional, Dict

MEASURE_RE = re.compile(r"^\s*measure\s+(.+?)\s*(?:=|$)")
DOC_RE = re.compile(r"^\s*///\s*(Purpose|Calculation Logic|Dynamic Behavior|Format/Type):\s*(.*)$", re.I)
PLACEHOLDER_RE = re.compile(r"^(?:todo|tbd|n/?a|na|none|description|add description|placeholder|fixme|-)\b", re.I)

# Generic phrases that should not be treated as meaningful doc content.
GENERIC_PURPOSE = re.compile(r"compute the measure result from the dax expression and current filter context", re.I)
GENERIC_CALC = re.compile(r"(?:see|refer to) dax expression", re.I)
GENERIC_DYNAMIC = re.compile(r"(?:see|refer to) dax expression", re.I)

def parse_doc_value(raw: str) -> str:
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


def parse_tmdl(path: str) -> List[Tuple[str, Dict[str, str], Optional[str]]]:
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

        # doc block immediately above measure
        docs: Dict[str, str] = {}
        if i > 0 and lines[i - 1].lstrip().startswith("///"):
            j = i - 1
            doc_lines = []
            while j >= 0 and lines[j].lstrip().startswith("///"):
                doc_lines.append(lines[j].rstrip("\r\n"))
                j -= 1
            for line in reversed(doc_lines):
                d = DOC_RE.match(line)
                if not d:
                    continue
                key = d.group(1).strip().lower()
                value = parse_doc_value(d.group(2))
                docs[key] = value

        # search formatString within block
        start_indent = len(lines[i]) - len(lines[i].lstrip())
        j = i + 1
        fmt = None
        while j < len(lines):
            if lines[j].strip() == "":
                j += 1
                continue
            indent = len(lines[j]) - len(lines[j].lstrip())
            if indent <= start_indent:
                break
            if lines[j].lstrip().startswith("formatString:"):
                fmt = lines[j].split("formatString:", 1)[1].strip().strip('"')
            j += 1

        measures.append((name, docs, fmt))
        i = j

    return measures


def is_nontrivial(text: str, field: str) -> bool:
    if not text or is_placeholder(text):
        return False
    text_lc = text.lower().strip()
    if field == "purpose":
        if GENERIC_PURPOSE.search(text_lc):
            return False
        return len(text_lc) >= 8
    if field == "calculation logic":
        if GENERIC_CALC.search(text_lc):
            return False
        return len(text_lc) >= 8
    if field == "dynamic behavior":
        if GENERIC_DYNAMIC.search(text_lc):
            return False
        return "filter context" in text_lc or "filters" in text_lc or "slicer" in text_lc or len(text_lc) >= 8
    if field == "format/type":
        return len(text_lc) > 0 and text_lc not in {"not specified", "n/a", "na", "none"}
    return False


def describe_components(docs: Dict[str, str], fmt: Optional[str]) -> Dict[str, bool]:
    purpose_text = docs.get("purpose", "")
    calc_text = docs.get("calculation logic", "")
    dynamic_text = docs.get("dynamic behavior", "")
    format_text = docs.get("format/type", "")

    purpose = is_nontrivial(purpose_text, "purpose")
    logic = is_nontrivial(calc_text, "calculation logic")
    behavior = is_nontrivial(dynamic_text, "dynamic behavior")

    fmt_present = is_nontrivial(format_text, "format/type")
    if fmt:
        fmt_present = fmt_present and format_text == fmt
    else:
        fmt_present = fmt_present and format_text == "Unspecified"

    return {
        "purpose": purpose,
        "logic": logic,
        "behavior": behavior,
        "format": fmt_present,
    }


def score_components(components: Dict[str, bool], docs: Dict[str, str]) -> Tuple[int, str]:
    if not docs:
        return 1, "Missing doc block."

    present = [k for k, v in components.items() if v]
    missing = [k for k, v in components.items() if not v]

    if len(present) == 0:
        return 1, "Doc block is empty or generic."
    if len(present) == 1:
        return 2, "Doc block is minimal; missing: " + ", ".join(missing)
    if len(present) == 2:
        return 3, "Partial doc block; missing: " + ", ".join(missing)
    if len(present) == 3:
        return 4, "Good doc block; missing: " + ", ".join(missing)
    return 5, "Doc block covers all required components."


def collect_measures(root: str) -> List[Tuple[str, Dict[str, str], Optional[str]]]:
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

    for name, docs, fmt in measures:
        components = describe_components(docs, fmt)
        score, reason = score_components(components, docs)
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
