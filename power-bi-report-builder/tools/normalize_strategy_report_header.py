#!/usr/bin/env python3
"""
Normalize the Strategy Report PBIP header layout.

Run from the repository root. The default is dry-run; pass --apply to write.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


REPORT_ROOT = Path("powerbi/src/Strategy Report.Report")
PAGES_ROOT = REPORT_ROOT / "definition" / "pages"

CANVAS_WIDTH = 1280
HEADER_BAR_Y = 70
HEADER_BAR_HEIGHT = 45
REPORT_LABEL_Y = 36
REPORT_LABEL_HEIGHT = 29
LOGO_X = 20
LOGO_Y = 18
LOGO_WIDTH = 80
LOGO_HEIGHT = 30
TITLE_X = 240
TITLE_Y = 70
TITLE_WIDTH = 784
TITLE_HEIGHT = 49
LEFT_NAV_X = 16
RIGHT_NAV_X = 1200
NAV_Y = 78
NAV_WIDTH = 64
NAV_HEIGHT = 29
CONTENT_MIN_Y = 130
HEADER_SCAN_MAX_Y = 125
TITLE_SCAN_MAX_Y = 90
SEPARATOR_Y = HEADER_BAR_Y + HEADER_BAR_HEIGHT
SEPARATOR_HEIGHT = 4


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Normalize Strategy Report header visuals.")
    parser.add_argument("--apply", action="store_true", help="Write changes. Omit for dry-run.")
    parser.add_argument("--pages-root", type=Path, default=PAGES_ROOT)
    return parser.parse_args()


def load_json(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8-sig") as f:
        return json.load(f)


def write_json(path: Path, data: dict[str, Any]) -> None:
    with path.open("w", encoding="utf-8", newline="\n") as f:
        json.dump(data, f, indent=2)
        f.write("\n")


def walk_strings(node: Any):
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


def set_position(data: dict[str, Any], **updates: float) -> list[str]:
    pos = data.setdefault("position", {})
    changes: list[str] = []
    for key, value in updates.items():
        old = pos.get(key)
        if old != value:
            pos[key] = value
            changes.append(f"{key} {old} -> {value}")
    return changes


def set_textbox_font_size(data: dict[str, Any], font_size: str) -> bool:
    changed = False
    objects = data.get("visual", {}).get("objects", {})
    for entry in objects.get("general", []):
        props = entry.get("properties", {}) if isinstance(entry, dict) else {}
        for paragraph in props.get("paragraphs", []) or []:
            for run in paragraph.get("textRuns", []) or []:
                if isinstance(run, dict):
                    style = run.setdefault("textStyle", {})
                    if style.get("fontSize") != font_size:
                        style["fontSize"] = font_size
                        changed = True
    return changed


def literal_fill_color(data: dict[str, Any]) -> str:
    text = all_text(data).lower()
    for color in ("#3c3d4f", "#5d5f73", "#f1db9e"):
        if color in text:
            return color
    return ""


def is_logo(data: dict[str, Any]) -> bool:
    pos = data.get("position", {})
    y = float(pos.get("y") if pos.get("y") is not None else 9999)
    x = float(pos.get("x") if pos.get("x") is not None else 9999)
    width = float(pos.get("width", 0) or 0)
    height = float(pos.get("height", 0) or 0)
    return (
        y <= HEADER_SCAN_MAX_Y
        and x <= 80
        and (
            "companies_history_partner_base64_logo" in all_text(data)
            or (
                visual_type(data) == "cardVisual"
                and width >= 250
                and 40 <= height <= 80
            )
        )
    )


def is_report_label(data: dict[str, Any]) -> bool:
    pos = data.get("position", {})
    y = float(pos.get("y", 9999) or 9999)
    width = float(pos.get("width", 0) or 0)
    text = all_text(data)
    return (
        visual_type(data) == "textbox"
        and "Strategy Report" in text
        and y <= HEADER_SCAN_MAX_Y
        and 80 <= width <= 260
    )


def is_page_title(data: dict[str, Any]) -> bool:
    if visual_type(data) != "textbox" or is_report_label(data):
        return False
    pos = data.get("position", {})
    y = pos.get("y")
    width = pos.get("width", 0)
    text = all_text(data)
    if "Quick Filter" in text or "Summary" in text:
        return False
    return isinstance(y, (int, float)) and y <= TITLE_SCAN_MAX_Y and width >= 250


def is_header_bar(data: dict[str, Any]) -> bool:
    pos = data.get("position", {})
    return (
        visual_type(data) == "shape"
        and literal_fill_color(data) == "#3c3d4f"
        and float(pos.get("width", 0) or 0) >= CANVAS_WIDTH - 90
        and float(pos.get("y", 9999) or 9999) <= HEADER_SCAN_MAX_Y
    )


def is_top_content_background(data: dict[str, Any]) -> bool:
    pos = data.get("position", {})
    return (
        visual_type(data) == "shape"
        and literal_fill_color(data) == "#5d5f73"
        and float(pos.get("width", 0) or 0) >= CANVAS_WIDTH - 90
        and float(pos.get("y", 9999) or 9999) < CONTENT_MIN_Y
    )


def is_header_separator(data: dict[str, Any]) -> bool:
    pos = data.get("position", {})
    y = float(pos.get("y", 9999) or 9999)
    height = float(pos.get("height", 0) or 0)
    return (
        visual_type(data) == "shape"
        and float(pos.get("width", 0) or 0) >= CANVAS_WIDTH - 90
        and HEADER_BAR_Y <= y <= HEADER_SCAN_MAX_Y
        and 2 <= height <= 16
        and literal_fill_color(data) != "#3c3d4f"
    )


def is_nav_button(data: dict[str, Any]) -> str:
    if visual_type(data) != "actionButton":
        return ""
    pos = data.get("position", {})
    x = float(pos.get("x", 0) or 0)
    y = float(pos.get("y", 9999) or 9999)
    height = float(pos.get("height", 0) or 0)
    if y > HEADER_SCAN_MAX_Y or height > 70:
        return ""
    text = all_text(data).lower()
    if x < 120 or "back" in text:
        return "back"
    if x > 1100:
        return "next"
    return ""


def process(path: Path, apply: bool) -> list[str]:
    data = load_json(path)
    changes: list[str] = []

    if is_header_bar(data):
        changes += set_position(
            data,
            x=0,
            y=HEADER_BAR_Y,
            width=CANVAS_WIDTH,
            height=HEADER_BAR_HEIGHT,
            z=0,
            tabOrder=0,
        )
    elif is_header_separator(data):
        changes += set_position(
            data,
            x=0,
            y=SEPARATOR_Y,
            width=CANVAS_WIDTH,
            height=SEPARATOR_HEIGHT,
            z=1,
            tabOrder=1,
        )
    elif is_top_content_background(data):
        changes += set_position(data, y=CONTENT_MIN_Y, z=0, tabOrder=0)
    elif is_logo(data):
        changes += set_position(
            data,
            x=LOGO_X,
            y=LOGO_Y,
            width=LOGO_WIDTH,
            height=LOGO_HEIGHT,
        )
    elif is_report_label(data):
        changes += set_position(
            data,
            x=560,
            y=REPORT_LABEL_Y,
            width=159,
            height=REPORT_LABEL_HEIGHT,
        )
        if set_textbox_font_size(data, "10pt"):
            changes.append("fontSize -> 10pt")
    elif is_page_title(data):
        changes += set_position(
            data,
            x=TITLE_X,
            y=TITLE_Y,
            width=TITLE_WIDTH,
            height=TITLE_HEIGHT,
        )
        if set_textbox_font_size(data, "20pt"):
            changes.append("fontSize -> 20pt")
    else:
        nav = is_nav_button(data)
        if nav == "back":
            changes += set_position(
                data,
                x=LEFT_NAV_X,
                y=NAV_Y,
                width=NAV_WIDTH,
                height=NAV_HEIGHT,
            )
        elif nav == "next":
            changes += set_position(
                data,
                x=RIGHT_NAV_X,
                y=NAV_Y,
                width=NAV_WIDTH,
                height=NAV_HEIGHT,
            )

    if changes and apply:
        write_json(path, data)
    return changes


def main() -> int:
    args = parse_args()
    files = sorted(args.pages_root.rglob("visual.json"))
    print(f"Mode: {'APPLY' if args.apply else 'DRY RUN'}")
    print(f"Visual files scanned: {len(files)}")
    changed = 0
    total = 0
    for path in files:
        changes = process(path, args.apply)
        if changes:
            changed += 1
            total += len(changes)
            print(f"MODIFY: {path} :: {'; '.join(changes)}")
    print(f"Files with changes: {changed}")
    print(f"Total changes: {total}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
