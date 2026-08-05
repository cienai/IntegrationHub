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

GOLDEN_CANVAS = {"width": 1280, "height": 1900}
GOLDEN_BACKGROUND = "#2d2e3b"
GOLDEN_EXECUTIVE = {
    "logo": {"x": 3.9782439782439787, "y": 0, "width": 167.0862470862471, "height": 57.68453768453769},
    "report_label": {"x": 556.954156954157, "y": 2.983682983682984, "width": 165.09712509712512, "height": 40.77700077700078},
    "header_bar": {"x": 0, "y": 43.76068376068376, "width": 1279.005439005439, "height": 44.75524475524476},
    "back_button": {"x": 3.9782439782439787, "y": 43.76068376068376, "width": 98.46153846153847, "height": 45.74980574980575},
    "page_title": {"x": 364.009324009324, "y": 37.7933177933178, "width": 551.9813519813521, "height": 58.679098679098686},
    "top_nav": {"x": 1200.4351204351206, "y": 0, "width": 79.56487956487958, "height": 43.76068376068376},
    "summary": {"x": 27.84770784770785, "y": 106.41802641802643, "width": 1164.6309246309247, "height": 61.66278166278167},
    "peek_inside": {"x": 14.107274063188832, "y": 1579.0742101396033, "width": 213.49008082292434, "height": 31.976487876561354},
    "footer_separator": {"x": 0.9404849375459221, "y": 1581.895664952241, "width": 1279.0595150624542, "height": 29.155033063923586},
    "footer_thresholds": {"x": 767.4357090374725, "y": 1584.7171197648788, "width": 500.3379867744306, "height": 20.690668626010286},
    "footer_background": {"x": 0, "y": 1811.373989713446, "width": 1280.940484937546, "height": 86.52461425422484},
    "platform_footer": {"x": 12.226304188096988, "y": 1816.0764144011757, "width": 1254.6069066862601, "height": 51.72667156502572},
    "copyright": {"x": 0, "y": 1873.445995591477, "width": 1279.0595150624542, "height": 26.33357825128582},
}

GOLDEN_CARD_ROW = {
    "x": [33.815073815073816, 453.51981351981357, 872.2299922299923],
    "y": 185.982905982906,
    "width": 384.8951048951049,
    "height": 154.15695415695416,
}

GOLDEN_SECTIONS = {
    "primary_table": {"x": 33.815073815073816, "y": 360.0310800310801, "width": 730.0077700077701, "height": 419.7047397047397},
    "primary_chart": {"x": 811.5617715617716, "y": 360.0310800310801, "width": 445.5633255633256, "height": 419.7047397047397},
    "detail_table": {"x": 33.815073815073816, "y": 810.5672105672106, "width": 1223.3100233100233, "height": 526.1227661227662},
    "ai_title": {"x": 14.107274063188832, "y": 1621.3960323291699, "width": 188.09698750918443, "height": 44.20279206465834},
    "ai_score_label": {"x": 18.8966588966589, "y": 1654.9494949494951, "width": 251.62393162393164, "height": 35.80419580419581},
    "ai_score_card": {"x": 0, "y": 1681.5870683321089, "width": 222.89493019838355, "height": 72.417340191036},
    "ai_score_note": {"x": 21.63115356355621, "y": 1761.5282880235122, "width": 427.92064658339456, "height": 45.143277002204265},
    "configuration_title": {"x": 498.2750582750583, "y": 1621.1344211344212, "width": 239.6891996891997, "height": 44.75524475524476},
    "configuration_card": {"x": 491.8736223365173, "y": 1621.3960323291699, "width": 319.76487876561356, "height": 149.5371050698016},
    "notes_title": {"x": 927.3181484202793, "y": 1626.0984570168994, "width": 327.2887582659809, "height": 46.08376193975018},
    "notes_body": {"x": 916.0323291697282, "y": 1643.967670830272, "width": 305.6576047024247, "height": 148.5966201322557},
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
    parser.add_argument("--golden-executive", action="store_true", help="Check Executive Analysis v1 golden page structure.")
    parser.add_argument("--require-ai-score", action="store_true", help="Require the Executive Analysis v1 AI score panel.")
    parser.add_argument(
        "--golden-executive-exceptions",
        type=Path,
        help="JSON file with an 'allow' array of golden rule ids or prefixes to suppress.",
    )
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


def page_background(page_json: dict[str, Any]) -> str:
    text = all_text(page_json).lower()
    for color in ("#2d2e3b", "#292b3a"):
        if color in text:
            return color
    return ""


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


def classify_golden(data: dict[str, Any]) -> str:
    vt = visual_type(data)
    pos = position(data)
    text = all_text(data)
    lower_text = text.lower()

    if "companies_history_partner_base64_logo" in text:
        return "logo"
    if vt == "textbox" and "Strategy Report" in text:
        return "report_label"
    if vt == "shape" and "#3c3d4f" in lower_text and 40 <= pos["y"] <= 50:
        return "header_bar"
    if vt == "actionButton" and "'back'" in lower_text:
        return "back_button"
    if vt == "textbox" and 30 <= pos["y"] <= 45 and 450 <= pos["width"] <= 700:
        return "page_title"
    if vt == "actionButton" and pos["x"] >= 1180 and pos["y"] <= 5:
        return "top_nav"
    if vt == "textbox" and 100 <= pos["y"] <= 120 and pos["width"] >= 1000:
        return "summary"
    if vt == "actionButton" and "peekinside" in lower_text:
        return "peek_inside"
    if vt == "shape" and "#3c3d4f" in lower_text and 1570 <= pos["y"] <= 1590:
        return "footer_separator"
    if vt == "textbox" and "AI Model Scores:" in text and "0-49 Limited" in text:
        return "footer_thresholds"
    if vt == "shape" and "#27272c" in lower_text:
        return "footer_background"
    if vt == "cardVisual" and "company_history_trueai_platform_version" in text:
        return "platform_footer"
    if vt == "card" and "copyright" in lower_text:
        return "copyright"
    if vt == "textbox" and "AI Model Quality Scores" in text:
        return "ai_title"
    if vt == "textbox" and "Deal Intelligence" in text:
        return "ai_score_label"
    if vt == "cardVisual" and "metadata_ai_scores.meas.ai_score" in text:
        return "ai_score_card"
    if vt == "textbox" and "AI Model scores may change" in text:
        return "ai_score_note"
    if vt == "textbox" and "Configuration Items" in text:
        return "configuration_title"
    if vt == "cardVisual" and "pi_score_getFiscal_text" in text:
        return "configuration_card"
    if vt == "textbox" and "Other Considerations" in text:
        return "notes_title"
    if vt == "textbox" and 1600 <= pos["y"] <= 1800 and pos["x"] >= 850 and pos["height"] >= 100:
        return "notes_body"
    return ""


def overlap(a: dict[str, float], b: dict[str, float]) -> bool:
    return not (
        a["x"] + a["width"] <= b["x"]
        or b["x"] + b["width"] <= a["x"]
        or a["y"] + a["height"] <= b["y"]
        or b["y"] + b["height"] <= a["y"]
    )


def load_exceptions(path: Path | None) -> set[str]:
    if not path:
        return set()
    data = load_json(path)
    allow = data.get("allow", [])
    if not isinstance(allow, list) or not all(isinstance(item, str) for item in allow):
        raise ValueError("exception file must contain an 'allow' array of strings")
    return set(allow)


def allowed(rule_id: str, exceptions: set[str]) -> bool:
    return any(rule_id == item or rule_id.startswith(f"{item}.") for item in exceptions)


def add_issue(
    issues: list[Issue],
    exceptions: set[str],
    rule_id: str,
    severity: str,
    path: Path,
    message: str,
) -> None:
    if not allowed(rule_id, exceptions):
        issues.append(Issue(severity, path, f"{rule_id}: {message}"))


def validate_bounds(
    page: Path,
    display_name: str,
    visuals: list[tuple[Path, dict[str, Any]]],
    issues: list[Issue],
    exceptions: set[str],
) -> None:
    for path, data in visuals:
        pos = position(data)
        if pos["x"] < -1 or pos["y"] < -1 or pos["x"] + pos["width"] > GOLDEN_CANVAS["width"] + 1 or pos["y"] + pos["height"] > GOLDEN_CANVAS["height"] + 1:
            add_issue(issues, exceptions, "golden.canvas.bounds", "warning", path, f"{display_name}: visual outside canvas {position(data)}")


def intentional_layer(kind_a: str, kind_b: str) -> bool:
    if kind_a and kind_b:
        return True
    pair = {kind_a, kind_b}
    return (
        pair <= {"header_bar", "back_button", "page_title"}
        or "footer_background" in pair
        or pair <= {"copyright", "release_notes"}
    )


def validate_all_overlaps(
    page: Path,
    display_name: str,
    visuals: list[tuple[Path, dict[str, Any]]],
    issues: list[Issue],
    exceptions: set[str],
) -> None:
    classified = {path: classify_golden(data) for path, data in visuals}
    for i, (path_a, data_a) in enumerate(visuals):
        pos_a = position(data_a)
        if pos_a["width"] <= 0 or pos_a["height"] <= 0:
            continue
        for path_b, data_b in visuals[i + 1 :]:
            pos_b = position(data_b)
            if pos_b["width"] <= 0 or pos_b["height"] <= 0:
                continue
            if not overlap(pos_a, pos_b):
                continue
            if intentional_layer(classified.get(path_a, ""), classified.get(path_b, "")):
                continue
            add_issue(
                issues,
                exceptions,
                "golden.visual.overlap",
                "warning",
                page,
                f"{display_name}: possible overlap {path_a.parent.name} and {path_b.parent.name}",
            )


def text_truncation_risk(data: dict[str, Any]) -> bool:
    if visual_type(data) != "textbox":
        return False
    pos = position(data)
    text = " ".join(s for s in walk_strings(data) if len(s) > 20 and not s.startswith("https://"))
    if not text:
        return False
    approximate_capacity = max(1, (pos["width"] / 5.0) * max(1, pos["height"] / 14.0))
    return len(text) > approximate_capacity * 1.2


def validate_text_risk(
    display_name: str,
    visuals: list[tuple[Path, dict[str, Any]]],
    issues: list[Issue],
    exceptions: set[str],
) -> None:
    for path, data in visuals:
        if text_truncation_risk(data):
            add_issue(issues, exceptions, "golden.text.truncation_risk", "info", path, f"{display_name}: textbox may truncate or wrap awkwardly")


def validate_golden_executive(
    page: Path,
    page_json: dict[str, Any],
    visuals: list[tuple[Path, dict[str, Any]]],
    require_ai_score: bool,
    tolerance: float,
    exceptions: set[str],
) -> list[Issue]:
    issues: list[Issue] = []
    display_name = page_json.get("displayName", page.name)

    if page_json.get("width") != GOLDEN_CANVAS["width"] or page_json.get("height") != GOLDEN_CANVAS["height"]:
        add_issue(
            issues,
            exceptions,
            "golden.canvas.size",
            "warning",
            page / "page.json",
            f"{display_name}: expected canvas {GOLDEN_CANVAS}, found width={page_json.get('width')} height={page_json.get('height')}",
        )

    background = page_background(page_json)
    if background and background != GOLDEN_BACKGROUND:
        add_issue(issues, exceptions, "golden.canvas.background", "warning", page / "page.json", f"{display_name}: expected background {GOLDEN_BACKGROUND}, found {background}")

    found: dict[str, list[tuple[Path, dict[str, Any]]]] = {key: [] for key in GOLDEN_EXECUTIVE | GOLDEN_SECTIONS}
    for path, data in visuals:
        kind = classify_golden(data)
        if kind in found:
            found[kind].append((path, data))

    required = [
        "logo",
        "report_label",
        "header_bar",
        "back_button",
        "page_title",
        "top_nav",
        "summary",
        "peek_inside",
        "footer_separator",
        "footer_thresholds",
        "footer_background",
        "platform_footer",
        "copyright",
    ]
    if require_ai_score:
        required.extend(["ai_title", "ai_score_card"])

    for kind in required:
        rule_id = f"golden.visual.{kind}"
        expected = (GOLDEN_EXECUTIVE | GOLDEN_SECTIONS).get(kind)
        if not found.get(kind):
            add_issue(issues, exceptions, rule_id, "warning", page, f"{display_name}: missing {kind}")
            continue
        if expected and not any(near(position(data), expected, tolerance) for _, data in found[kind]):
            actual = ", ".join(f"{p.parent.name}:{position(d)}" for p, d in found[kind][:3])
            add_issue(issues, exceptions, rule_id, "warning", page, f"{display_name}: {kind} outside golden coordinates; {actual}")

    cards = [
        (path, data)
        for path, data in visuals
        if visual_type(data) == "cardVisual"
        and abs(position(data)["y"] - GOLDEN_CARD_ROW["y"]) <= tolerance
        and abs(position(data)["width"] - GOLDEN_CARD_ROW["width"]) <= tolerance
        and abs(position(data)["height"] - GOLDEN_CARD_ROW["height"]) <= tolerance
    ]
    if cards:
        if len(cards) != 3:
            add_issue(issues, exceptions, "golden.card_row.count", "warning", page, f"{display_name}: expected 3 executive cards, found {len(cards)}")
        actual_x = sorted(round(position(data)["x"], 3) for _, data in cards)
        expected_x = [round(x, 3) for x in GOLDEN_CARD_ROW["x"]]
        if len(cards) == 3 and any(abs(a - e) > tolerance for a, e in zip(actual_x, expected_x)):
            add_issue(issues, exceptions, "golden.card_row.alignment", "warning", page, f"{display_name}: executive card x positions {actual_x}, expected {expected_x}")
    else:
        add_issue(issues, exceptions, "golden.card_row.missing", "warning", page, f"{display_name}: missing golden executive card row")

    for kind in ("primary_table", "primary_chart", "detail_table"):
        expected = GOLDEN_SECTIONS[kind]
        candidates = [
            (path, data)
            for path, data in visuals
            if (kind.endswith("table") and visual_type(data) == "tableEx")
            or (kind.endswith("chart") and visual_type(data) not in {"textbox", "shape", "card", "cardVisual", "actionButton", "tableEx"})
        ]
        if not any(near(position(data), expected, tolerance) for _, data in candidates):
            add_issue(issues, exceptions, f"golden.visual.{kind}", "warning", page, f"{display_name}: missing {kind} near {expected}")

    validate_bounds(page, display_name, visuals, issues, exceptions)
    validate_all_overlaps(page, display_name, visuals, issues, exceptions)
    validate_text_risk(display_name, visuals, issues, exceptions)
    return issues


def validate_page(
    page: Path,
    check_header: bool,
    check_overlap: bool,
    require_footer: bool,
    golden_executive: bool,
    require_ai_score: bool,
    exceptions: set[str],
    tolerance: float,
) -> list[Issue]:
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

    if golden_executive:
        issues.extend(validate_golden_executive(page, page_json, visuals, require_ai_score, tolerance, exceptions))

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
    try:
        exceptions = load_exceptions(args.golden_executive_exceptions)
    except Exception as exc:
        print(f"Cannot load golden executive exceptions: {exc}")
        return 2

    pages = page_dirs(args.target)
    if not pages:
        print(f"No PBIP pages found under {args.target}")
        return 2

    all_issues: list[Issue] = []
    for page in pages:
        all_issues.extend(
            validate_page(
                page,
                args.check_header,
                args.check_overlap,
                args.require_footer,
                args.golden_executive,
                args.require_ai_score,
                exceptions,
                args.tolerance,
            )
        )

    print(f"Pages scanned: {len(pages)}")
    print(f"Issues found: {len(all_issues)}")
    for issue in all_issues:
        print(f"{issue.severity.upper()}: {issue.path}: {issue.message}")

    return 1 if any(issue.severity == "error" for issue in all_issues) else 0


if __name__ == "__main__":
    raise SystemExit(main())
