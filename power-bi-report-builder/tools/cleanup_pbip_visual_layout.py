#!/usr/bin/env python3
"""
Bulk PBIP visual layout cleanup.

This script edits Power BI Project visual container JSON files directly. It is
intended for report-layout fixes only; run it from the repository root.

Default mode is dry-run. Add --apply to write changes.

Examples:
  python power-bi-report-builder/tools/cleanup_pbip_visual_layout.py --report "powerbi/src/Strategy Report.Report"
  python power-bi-report-builder/tools/cleanup_pbip_visual_layout.py --report "powerbi/src/Strategy Report.Report" --apply
  python power-bi-report-builder/tools/cleanup_pbip_visual_layout.py --report "powerbi/src" --all-reports --apply
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


WARNING_TEXT = "This report has not yet been initalized"
LIGHT_BACKGROUND_COLORS = {
    "#ffffff",
    "#fff",
    "#ffffff00",
    "#ffffffff",
    "#f8f8f8",
    "#f9f9f9",
    "#fafafa",
    "#fbfbfb",
    "#fcfcfc",
    "#fdfdfd",
    "#fefefe",
}

HEADER_Y_MIN = 0
HEADER_Y_MAX = 60
HEADER_Y_SHIFT = 35
WARNING_Y_SHIFT = 40
TITLE_FONT_SIZE_PT = 24
HEADER_SHAPE_HEIGHT = 65
PAGE_WIDTH_TOLERANCE = 80
DARK_TEXT = "#292B3A"

TABLE_VISUAL_TYPES = {"tableEx", "pivotTable"}
LIGHT_BG_FIX_TYPES = {"slicer", "textbox"}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Clean up PBIP report visual layout JSON.")
    parser.add_argument(
        "--report",
        required=True,
        type=Path,
        help="Path to a .Report folder, a report definition folder, or a parent folder containing reports.",
    )
    parser.add_argument(
        "--all-reports",
        action="store_true",
        help="When --report is a parent folder, process every *.Report folder below it.",
    )
    parser.add_argument(
        "--apply",
        action="store_true",
        help="Write changes. Omit for dry-run logging only.",
    )
    parser.add_argument(
        "--header-shift",
        type=float,
        default=HEADER_Y_SHIFT,
        help=f"Pixels to add to visuals with y from {HEADER_Y_MIN} to {HEADER_Y_MAX}.",
    )
    parser.add_argument(
        "--warning-shift",
        type=float,
        default=WARNING_Y_SHIFT,
        help="Pixels to add to matching warning textboxes.",
    )
    parser.add_argument(
        "--title-font-size",
        type=str,
        default=f"{TITLE_FONT_SIZE_PT}pt",
        help="Textbox title font size to force for visuals near top of page.",
    )
    parser.add_argument(
        "--header-shape-height",
        type=float,
        default=HEADER_SHAPE_HEIGHT,
        help="Height to force for full-width top header shapes.",
    )
    return parser.parse_args()


def discover_visual_files(root: Path, all_reports: bool) -> list[Path]:
    roots: list[Path]
    if all_reports:
        roots = sorted(p for p in root.rglob("*.Report") if p.is_dir())
    else:
        roots = [root]

    visual_files: set[Path] = set()
    for report_root in roots:
        candidates = [
            report_root / "definition" / "pages",
            report_root / "Report" / "sections",
            report_root / "sections",
        ]
        for candidate in candidates:
            if candidate.exists():
                visual_files.update(candidate.rglob("visual.json"))

        if report_root.name.endswith(".Report") and not any(c.exists() for c in candidates):
            visual_files.update(report_root.rglob("visual.json"))

    return sorted(visual_files)


def load_json(path: Path) -> Any:
    with path.open("r", encoding="utf-8-sig") as f:
        return json.load(f)


def write_json(path: Path, data: Any) -> None:
    with path.open("w", encoding="utf-8", newline="\n") as f:
        json.dump(data, f, indent=2)
        f.write("\n")


def visual_type(data: dict[str, Any]) -> str:
    return data.get("visual", {}).get("visualType", "")


def visual_name(data: dict[str, Any], path: Path) -> str:
    return str(data.get("name") or path.parent.name)


def page_name(path: Path) -> str:
    parts = path.parts
    if "pages" in parts:
        idx = parts.index("pages")
        if idx + 1 < len(parts):
            return parts[idx + 1]
    if "sections" in parts:
        idx = parts.index("sections")
        if idx + 1 < len(parts):
            return parts[idx + 1]
    return "<unknown-page>"


def walk_values(node: Any):
    if isinstance(node, dict):
        for value in node.values():
            yield from walk_values(value)
    elif isinstance(node, list):
        for item in node:
            yield from walk_values(item)
    else:
        yield node


def contains_text(data: Any, needle: str) -> bool:
    needle_lower = needle.lower()
    for value in walk_values(data):
        if isinstance(value, str) and needle_lower in value.lower():
            return True
    return False


def literal_value(value: str) -> dict[str, Any]:
    return {"expr": {"Literal": {"Value": value}}}


def theme_color_value(color: str) -> dict[str, Any]:
    return {"solid": {"color": {"expr": {"Literal": {"Value": f"'{color}'"}}}}}


def normalize_color(raw: Any) -> str | None:
    if not isinstance(raw, str):
        return None
    value = raw.strip().strip("'\"").lower()
    if value.startswith("#"):
        return value
    return None


def extract_literal_color(node: Any) -> str | None:
    if isinstance(node, dict):
        literal = node.get("expr", {}).get("Literal", {}).get("Value")
        color = normalize_color(literal)
        if color:
            return color
        direct = normalize_color(node.get("color"))
        if direct:
            return direct
        for value in node.values():
            color = extract_literal_color(value)
            if color:
                return color
    elif isinstance(node, list):
        for item in node:
            color = extract_literal_color(item)
            if color:
                return color
    return None


def is_light_background_object(obj: Any) -> bool:
    color = extract_literal_color(obj)
    return color in LIGHT_BACKGROUND_COLORS


def remove_light_backgrounds(data: dict[str, Any]) -> bool:
    changed = False
    visual = data.get("visual", {})
    for container_key in ("objects", "visualContainerObjects"):
        container = visual.get(container_key)
        if not isinstance(container, dict):
            continue
        for object_name in ("background", "fill"):
            entries = container.get(object_name)
            if not isinstance(entries, list):
                continue
            kept = [entry for entry in entries if not is_light_background_object(entry)]
            if len(kept) != len(entries):
                changed = True
                if kept:
                    container[object_name] = kept
                else:
                    del container[object_name]
    return changed


def inject_dark_text_override(data: dict[str, Any]) -> bool:
    visual = data.setdefault("visual", {})
    objects = visual.setdefault("objects", {})
    changed = False

    # Common slicer and textbox text-bearing object buckets in PBIP JSON.
    for object_name in ("text", "title", "items", "values", "header", "general"):
        entries = objects.setdefault(object_name, [{}])
        if not isinstance(entries, list) or not entries:
            entries = [{}]
            objects[object_name] = entries
        first = entries[0]
        if not isinstance(first, dict):
            continue
        props = first.setdefault("properties", {})
        if not isinstance(props, dict):
            continue
        for prop in ("fontColor", "color"):
            if props.get(prop) != theme_color_value(DARK_TEXT):
                props[prop] = theme_color_value(DARK_TEXT)
                changed = True

    # Textboxes often store inline rich text in paragraphs/textRuns.
    for entry in objects.get("general", []):
        props = entry.get("properties", {}) if isinstance(entry, dict) else {}
        paragraphs = props.get("paragraphs", [])
        if not isinstance(paragraphs, list):
            continue
        for paragraph in paragraphs:
            for run in paragraph.get("textRuns", []):
                if isinstance(run, dict):
                    style = run.setdefault("textStyle", {})
                    if style.get("color") != DARK_TEXT:
                        style["color"] = DARK_TEXT
                        changed = True

    return changed


def set_textbox_font_size(data: dict[str, Any], font_size: str) -> bool:
    objects = data.get("visual", {}).get("objects", {})
    changed = False

    for entry in objects.get("general", []):
        props = entry.get("properties", {}) if isinstance(entry, dict) else {}
        paragraphs = props.get("paragraphs", [])
        if not isinstance(paragraphs, list):
            continue
        for paragraph in paragraphs:
            for run in paragraph.get("textRuns", []):
                if isinstance(run, dict):
                    style = run.setdefault("textStyle", {})
                    if style.get("fontSize") != font_size:
                        style["fontSize"] = font_size
                        changed = True

    # Some textboxes store a formatting object instead of only inline runs.
    for object_name in ("text", "title"):
        entries = objects.get(object_name, [])
        if not isinstance(entries, list):
            continue
        for entry in entries:
            props = entry.setdefault("properties", {}) if isinstance(entry, dict) else {}
            if props.get("fontSize") != literal_value(f"'{font_size}'"):
                props["fontSize"] = literal_value(f"'{font_size}'")
                changed = True

    return changed


def enable_table_auto_size(data: dict[str, Any]) -> bool:
    visual = data.setdefault("visual", {})
    objects = visual.setdefault("objects", {})
    grid_entries = objects.setdefault("grid", [{}])
    if not isinstance(grid_entries, list) or not grid_entries:
        grid_entries = [{}]
        objects["grid"] = grid_entries

    first = grid_entries[0]
    if not isinstance(first, dict):
        return False
    props = first.setdefault("properties", {})
    current = props.get("autoSizeColumnWidth")
    target = literal_value("true")
    if current == target:
        return False
    props["autoSizeColumnWidth"] = target
    return True


def is_header_shape(data: dict[str, Any]) -> bool:
    if visual_type(data) != "shape":
        return False
    pos = data.get("position", {})
    width = float(pos.get("width", 0) or 0)
    y = float(pos.get("y", 99999) or 99999)
    x = float(pos.get("x", 99999) or 99999)
    return y <= HEADER_Y_MAX and x <= PAGE_WIDTH_TOLERANCE and width >= 1280 - PAGE_WIDTH_TOLERANCE


def send_background_shape_to_back(data: dict[str, Any]) -> bool:
    if visual_type(data) != "shape":
        return False
    pos = data.setdefault("position", {})
    width = float(pos.get("width", 0) or 0)
    height = float(pos.get("height", 0) or 0)
    if width < 500 or height < 40:
        return False
    changed = False
    if pos.get("z") != 0:
        pos["z"] = 0
        changed = True
    if pos.get("tabOrder") != 0:
        pos["tabOrder"] = 0
        changed = True
    return changed


def process_visual(path: Path, args: argparse.Namespace) -> list[str]:
    data = load_json(path)
    if not isinstance(data, dict):
        return []

    changes: list[str] = []
    pos = data.setdefault("position", {})
    y = pos.get("y")
    vtype = visual_type(data)
    vname = visual_name(data, path)

    if isinstance(y, (int, float)) and HEADER_Y_MIN <= y <= HEADER_Y_MAX:
        pos["y"] = y + args.header_shift
        changes.append(f"shifted header block y {y:g} -> {pos['y']:g}")

    if vtype == "textbox" and contains_text(data, WARNING_TEXT):
        old_y = pos.get("y", 0)
        if isinstance(old_y, (int, float)):
            pos["y"] = old_y + args.warning_shift
            changes.append(f"shifted initialization warning y {old_y:g} -> {pos['y']:g}")

    if vtype == "textbox" and isinstance(y, (int, float)) and y <= 10:
        if set_textbox_font_size(data, args.title_font_size):
            changes.append(f"forced title textbox font size to {args.title_font_size}")

    if vtype in LIGHT_BG_FIX_TYPES:
        if remove_light_backgrounds(data):
            changes.append("removed hardcoded light background/fill")
        elif any(is_light_background_object(value) for value in walk_values(data)):
            if inject_dark_text_override(data):
                changes.append(f"injected dark text override {DARK_TEXT}")

    if is_header_shape(data):
        old_height = pos.get("height")
        if old_height != args.header_shape_height:
            pos["height"] = args.header_shape_height
            changes.append(f"standardized header shape height {old_height:g} -> {args.header_shape_height:g}")

    if send_background_shape_to_back(data):
        changes.append("sent background shape to back")

    if vtype in TABLE_VISUAL_TYPES and enable_table_auto_size(data):
        changes.append("enabled autoSizeColumnWidth")

    if changes and args.apply:
        write_json(path, data)

    if changes:
        rel = path
        return [f"{page_name(path)} / {vname} / {vtype}: {change} [{rel}]" for change in changes]
    return []


def main() -> int:
    args = parse_args()
    visual_files = discover_visual_files(args.report, args.all_reports)
    if not visual_files:
        print(f"No visual.json files found under {args.report}")
        return 1

    print(f"Mode: {'APPLY' if args.apply else 'DRY RUN'}")
    print(f"Visual files scanned: {len(visual_files)}")

    modified_files = 0
    change_count = 0
    for path in visual_files:
        logs = process_visual(path, args)
        if logs:
            modified_files += 1
            change_count += len(logs)
            for line in logs:
                print(f"MODIFY: {line}")

    print(f"Files with changes: {modified_files}")
    print(f"Total changes: {change_count}")
    if not args.apply:
        print("Dry run only. Re-run with --apply to write changes.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
