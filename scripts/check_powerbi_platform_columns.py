"""
Fail when newly introduced platform-generated columns appear in Power BI source files.

Policy:
  - Explicitly banned identifiers always fail if present in the current tree.
  - Added TMDL `column` definitions with platform-style prefixes fail by default.
  - Intentional exceptions must be added to APPROVED_NEW_PLATFORM_COLUMNS.

Usage:
  python scripts/check_powerbi_platform_columns.py
"""

from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path


POWERBI_ROOT = Path("powerbi/src")
TABLE_FILE_GLOB = "*.tmdl"

BANNED_IDENTIFIERS = (
    "_sys_sync_id",
    "llm_input_tokens_user_role",
)

PLATFORM_PREFIXES = (
    "_sys_",
    "sys_",
    "crm_",
    "trueai_",
    "llm_",
)

COLUMN_RE = re.compile(r"^\s*column\s+(?P<name>'[^']+'|\"[^\"]+\"|[^\s=]+)")
APPROVED_NEW_PLATFORM_COLUMNS: set[str] = set()


def normalize_name(name: str) -> str:
    name = name.strip()
    if len(name) >= 2 and name[0] == name[-1] and name[0] in {"'", '"'}:
        return name[1:-1]
    return name


def is_platform_column(name: str) -> bool:
    return name.startswith(PLATFORM_PREFIXES)


def iter_tmdl_files(root: Path) -> list[Path]:
    return sorted(
        path
        for path in root.rglob(TABLE_FILE_GLOB)
        if "definition/tables/" in path.as_posix().replace("\\", "/")
    )


def run_git_diff() -> list[str]:
    base = (Path.cwd() / ".git").exists()
    if not base:
        return []

    diff_base = None
    if "GIT_DIFF_BASE" in __import__("os").environ:
        diff_base = __import__("os").environ["GIT_DIFF_BASE"].strip()

    if diff_base:
        diff_range = f"{diff_base}...HEAD"
        command = ["git", "diff", "--unified=0", diff_range, "--", str(POWERBI_ROOT)]
    else:
        command = ["git", "diff", "--unified=0", "--", str(POWERBI_ROOT)]

    result = subprocess.run(command, capture_output=True, text=True, check=False)
    if result.returncode not in (0, 1):
        print(result.stderr.strip() or result.stdout.strip(), file=sys.stderr)
        raise SystemExit(result.returncode)
    return result.stdout.splitlines()


def check_banned_identifiers() -> list[str]:
    failures: list[str] = []
    for path in iter_tmdl_files(POWERBI_ROOT):
        text = path.read_text(encoding="utf-8")
        for line_no, line in enumerate(text.splitlines(), start=1):
            for identifier in BANNED_IDENTIFIERS:
                if identifier in line:
                    failures.append(
                        f"{path.as_posix()}:{line_no} contains banned identifier '{identifier}'"
                    )
    return failures


def check_added_platform_columns() -> list[str]:
    failures: list[str] = []
    current_file = ""
    current_new_line = 0

    for raw_line in run_git_diff():
        if raw_line.startswith("+++ b/"):
            current_file = raw_line[6:]
            continue

        if raw_line.startswith("@@"):
            match = re.search(r"\+(?P<start>\d+)", raw_line)
            current_new_line = int(match.group("start")) - 1 if match else 0
            continue

        if raw_line.startswith("+") and not raw_line.startswith("+++"):
            current_new_line += 1
            line = raw_line[1:]
            match = COLUMN_RE.match(line)
            if not match:
                continue

            column_name = normalize_name(match.group("name"))
            if not is_platform_column(column_name):
                continue
            if column_name in APPROVED_NEW_PLATFORM_COLUMNS:
                continue

            failures.append(
                f"{current_file}:{current_new_line} adds unapproved platform column '{column_name}'"
            )
            continue

        if raw_line.startswith(" "):
            current_new_line += 1

    return failures


def main() -> int:
    failures = check_banned_identifiers()
    failures.extend(check_added_platform_columns())

    if failures:
        print("Power BI platform column check failed:")
        for failure in failures:
            print(failure)
        return 1

    print("Power BI platform column check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
