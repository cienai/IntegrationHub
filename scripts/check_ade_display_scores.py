"""
Check ADE semantic model display-score measures for missing 0–100 (or 0–1) clamps.

Usage:
  python scripts/check_ade_display_scores.py
"""

from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path("powerbi/src/Dataset - Azure Data Lake - Automatic Data Enhancement.SemanticModel/definition/tables")


MEASURE_RE = re.compile(
    r"^(\tmeasure\s+'(?P<name>[^']+)'\s*=)(?P<body>.*?)(?=\r?\n\t(?:measure|column|partition)\b|\Z)",
    re.S | re.M,
)

DISPLAY_FOLDER_RE = re.compile(r"^\t+displayFolder:\s*(?P<folder>.+?)\s*$", re.M)
FORMATSTRING_RE = re.compile(r"^\t+formatString:\s*(?P<fmt>.+?)\s*$", re.M)

HAS_100_RE = re.compile(r"\*\s*100", re.IGNORECASE)
ROUND_100_RE = re.compile(r"(?:ROUND|round)\([^\\n]*\*\s*100", re.IGNORECASE)
POWER_RE = re.compile(r"(?:POWER\(|\^)", re.IGNORECASE)

CLAMP_100_RE = re.compile(r"MIN\s*\(\s*MAX\s*\(\s*[^,]+,\s*0\s*\)\s*,\s*100\s*\)", re.IGNORECASE)
CLAMP_1_RE = re.compile(r"MIN\s*\(\s*1\s*,\s*MAX\s*\(\s*0\s*,\s*[^)]+\)\s*\)", re.IGNORECASE)


def extract_dax(body: str) -> str:
    dax_m = re.search(
        r"^\s*(?P<dax>.*?)(?=\r?\n\t+(?:formatString|displayFolder|lineageTag|annotation|description|changedProperty)\b|\Z)",
        body,
        re.S | re.M,
    )
    if not dax_m:
        return ""
    dax = dax_m.group("dax")
    lines = dax.splitlines()
    if lines and lines[0].strip() == "```":
        lines = lines[1:]
    if lines and lines[-1].strip() == "```":
        lines = lines[:-1]
    return "\n".join(lines)


def is_text_measure(name: str, dax: str) -> bool:
    if "_text" in name.lower():
        return True
    if re.search(r"\bFORMAT\s*\(", dax, re.IGNORECASE):
        return True
    return False


def is_currency(format_string: str, dax: str) -> bool:
    fmt = (format_string or "").lower()
    if "$" in fmt or "currency" in fmt or "€" in fmt or "£" in fmt:
        return True
    # crude heuristic: explicit $ in DAX
    if "$" in dax:
        return True
    return False


def is_display_folder(folder: str) -> bool:
    f = (folder or "").lower()
    return any(key in f for key in ["_score", "_scores", "_ai_scores", "_peek_inside"])


def looks_like_ratio(dax: str) -> bool:
    return bool(re.search(r"\bDIVIDE\b|/", dax, re.IGNORECASE))


def main() -> int:
    failures: list[tuple[str, str, str]] = []

    for path in ROOT.rglob("*.tmdl"):
        text = path.read_text(encoding="utf-8")
        for m in MEASURE_RE.finditer(text):
            name = m.group("name")
            body = m.group("body")
            dax = extract_dax(body)
            if not dax:
                continue

            display_folder = ""
            m_folder = DISPLAY_FOLDER_RE.search(body)
            if m_folder:
                display_folder = m_folder.group("folder")

            fmt = ""
            m_fmt = FORMATSTRING_RE.search(body)
            if m_fmt:
                fmt = m_fmt.group("fmt")

            if is_text_measure(name, dax):
                continue
            if is_currency(fmt, dax):
                continue

            has_100 = bool(HAS_100_RE.search(dax) or ROUND_100_RE.search(dax))
            has_power = bool(POWER_RE.search(dax))
            candidate = is_display_folder(display_folder) or has_100 or has_power

            if not candidate:
                continue

            has_clamp_100 = bool(CLAMP_100_RE.search(dax))
            has_clamp_1 = bool(CLAMP_1_RE.search(dax))

            if has_100 and not has_clamp_100:
                failures.append(
                    (path.as_posix(), name, "missing 0–100 clamp after *100")
                )
                continue

            if not has_100 and looks_like_ratio(dax) and not has_clamp_1:
                failures.append(
                    (path.as_posix(), name, "ratio display score missing 0–1 clamp")
                )

    if failures:
        print("Display-score clamp check failed:")
        for path, name, reason in failures:
            print(f"{path} | {name} | {reason}")
        return 1

    print("Display-score clamp check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
