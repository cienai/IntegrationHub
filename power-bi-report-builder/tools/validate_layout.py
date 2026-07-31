#!/usr/bin/env python3
"""
Lightweight PBIP report page validator.

This script checks structural layout rules that are easy to verify from PBIP
visual JSON. It does not replace Power BI Desktop review.
"""

from __future__ import annotations

import argparse
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable


EXPECTED_HEADER = {
    "logo": {"x": 20, "y": 18, "width": 80, "height": 30},
    "report_label": {"x": 560, "y": 36, "width": 159, "height": 29},
    "header_bar": {"x": 0, "y": 70, "width": 1280, "height": 45},
    "page_title": {"x": 240, "y": 70, "width": 784, "height": 49},
    "separator": {"x": 0, "y": 115, "width": 1280, "height": 4},
}


@dataclass
class Issue:
    severity: str
    path: Path
    message: str


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Validate PBIP report page layout.")
    parser.add_argument(
        "target",
        type=Path,
        help="A PBIP page directory, report definition/pages directory, or report root.",
    )
    parser.add_argument("--check-header", action="store_true", help="Check Strategy Report header template positions.")
    parser.add_argument("--check-overlap", action="store_true", help="Report possible top-band visual overlaps.")
    parser.add_argument("--require-footer", action="store_true", help="Require Peek Inside footer text on each page.")
    parser.add_argument("--tolerance", type=float, default=1.0, help="Pixel tolerance for expected positions.")
    return parser.parse_args()


def load_json(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8-sig") as f:
        return json.load(f)


def page_dirs(target: Path) -> list[Path]:
    if (target / "page.json").exists() and (target / "visuals").exists():
        return [target]
    if (target / "definition" / "pages").exists():
        target = target / "definition" / "pages"
    return sorted(p for p in target.iterdir() if (p / "page.json").exists() and (p / "visuals").exists())


def walk_strings(node: Any) -> Iterable[str]:
    if isinstance(node, dict):
        for value in node.values():
            yield from walk_strings(value)
    elif isinstance(node, list):
        for item in node:
            yield from walk_strings(item)
    elif isinstance(node, str):
        yield node


def all_text(data: dict[str, Any]) -> str:
    return " ".join(walk_strings(data))


def visual_type(data: dict[str, Any]) -> str:
    return data.get("visual", {}).get("visualType", "")


def position(data: dict[str, Any]) -> dict[str, float]:
    raw = data.get("position", {})
    return {
        "x": float(raw.get("x", 0) or 0),
        "y": float(raw.get("y", 0) or 0),
        "width": float(raw.get("width", 0) or 0),
        "height": float(raw.get("height", 0) or 0),
        "z": float(raw.get("z", 0) or 0),
    }


def near(actual: dict[str, float], expected: dict[str, float], tolerance: float) -> bool:
    return all(abs(actual[key] - value) <= tolerance for key, value in expected.items())


def literal_fill_color(data: dict[str, Any]) -> str:
    text = all_text(data).lower()
    for color in ("#3c3d4f", "#5d5f73", "#f1db9e"):
        if color in text:
            return color
    return ""


def classify(data: dict[str, Any]) -> str:
    vt = visual_type(data)
    pos = position(data)
    text = all_text(data)
    fill = literal_fill_color(data)

    if vt == "textbox" and "Strategy Report" in text:
        return "report_label"
    if vt == "textbox" and pos["width"] >= 250 and 50 <= pos["y"] <= 90:
        return "page_title"
    if vt == "shape" and fill == "#3c3d4f" and pos["width"] >= 1190 and 60 <= pos["y"] <= 90:
        return "header_bar"
    if vt == "shape" and pos["width"] >= 1190 and 100 <= pos["y"] <= 125 and 2 <= pos["height"] <= 16:
        return "separator"
    if vt == "cardVisual" and pos["x"] <= 80 and pos["y"] <= 60 and pos["width"] <= 120:
        return "logo"
    if "companies_history_partner_base64_logo" in text:
        return "logo"
    return ""


def overlap(a: dict[str, float], b: dict[str, float]) -> bool:
    return not (
        a["x"] + a["width"] <= b["x"]
        or b["x"] + b["width"] <= a["x"]
        or a["y"] + a["height"] <= b["y"]
        or b["y"] + b["height"] <= a["y"]
    )


def validate_page(page: Path, check_header: bool, check_overlap: bool, require_footer: bool, tolerance: float) -> list[Issue]:
    issues: list[Issue] = []
    visuals: list[tuple[Path, dict[str, Any]]] = []

    try:
        page_json = load_json(page / "page.json")
    except Exception as exc:
        return [Issue("error", page / "page.json", f"Cannot parse page.json: {exc}")]

    for path in sorted((page / "visuals").rglob("visual.json")):
        try:
            visuals.append((path, load_json(path)))
        except Exception as exc:
            issues.append(Issue("error", path, f"Cannot parse visual JSON: {exc}"))

    display_name = page_json.get("displayName", page.name)
    if not visuals:
        issues.append(Issue("warning", page, f"{display_name}: page has no visuals"))
        return issues

    if check_header:
        found: dict[str, list[tuple[Path, dict[str, Any]]]] = {key: [] for key in EXPECTED_HEADER}
        for path, data in visuals:
            kind = classify(data)
            if kind in found:
                found[kind].append((path, data))

        for kind, expected in EXPECTED_HEADER.items():
            if kind == "separator" and not found[kind]:
                continue
            if not found[kind]:
                issues.append(Issue("warning", page, f"{display_name}: missing {kind}"))
                continue
            if not any(near(position(data), expected, tolerance) for _, data in found[kind]):
                actual = ", ".join(f"{p.parent.name}:{position(d)}" for p, d in found[kind][:3])
                issues.append(Issue("warning", page, f"{display_name}: {kind} outside template; {actual}"))

        for path, data in visuals:
            pos = position(data)
            if visual_type(data) == "shape" and pos["width"] >= 1190 and 70 <= pos["y"] <= 125 and 2 <= pos["height"] <= 16 and pos["z"] > 1:
                issues.append(Issue("warning", path, f"{display_name}: high-z thin header shape may overlap title"))

    if require_footer and not any("Peek Inside" in all_text(data) for _, data in visuals):
        issues.append(Issue("warning", page, f"{display_name}: missing Peek Inside footer text"))

    if check_overlap:
        top_visuals = [(path, data, position(data)) for path, data in visuals if position(data)["y"] < 140]
        for i, (path_a, data_a, pos_a) in enumerate(top_visuals):
            for path_b, data_b, pos_b in top_visuals[i + 1 :]:
                if position(data_a)["z"] == 0 or position(data_b)["z"] == 0:
                    continue
                if overlap(pos_a, pos_b):
                    type_pair = f"{visual_type(data_a)}/{visual_type(data_b)}"
                    if type_pair not in {"shape/textbox", "textbox/shape", "shape/actionButton", "actionButton/shape"}:
                        issues.append(Issue("info", page, f"{display_name}: top-band overlap {path_a.parent.name} and {path_b.parent.name}"))

    return issues


def main() -> int:
    args = parse_args()
    pages = page_dirs(args.target)
    if not pages:
        print(f"No PBIP pages found under {args.target}")
        return 2

    all_issues: list[Issue] = []
    for page in pages:
        all_issues.extend(validate_page(page, args.check_header, args.check_overlap, args.require_footer, args.tolerance))

    print(f"Pages scanned: {len(pages)}")
    print(f"Issues found: {len(all_issues)}")
    for issue in all_issues:
        print(f"{issue.severity.upper()}: {issue.path}: {issue.message}")

    return 1 if any(issue.severity == "error" for issue in all_issues) else 0


if __name__ == "__main__":
    raise SystemExit(main())
