"""
Insert a final Table.SelectColumns allowlist step into targeted Power BI M partitions.

The allowlist is derived from each table's declared `column` blocks so the M query
projects only the model's approved columns.

Usage:
  python scripts/apply_powerbi_column_allowlists.py
"""

from __future__ import annotations

import re
from pathlib import Path


TARGET_FILES = [
    Path("powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/companies_history.tmdl"),
    Path("powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/open_pipeline.tmdl"),
    Path("powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps.tmdl"),
    Path("powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users.tmdl"),
    Path("powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/users_history.tmdl"),
    Path("powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/managers_direct.tmdl"),
    Path("powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/managers_total.tmdl"),
    Path("powerbi/src/Dataset - Azure Data Lake - Sales Performance.SemanticModel/definition/tables/opps_stages.tmdl"),
]

COLUMN_RE = re.compile(r"^\tcolumn\s+(?P<name>'[^']+'|\"[^\"]+\"|[^\s=]+)", re.M)
PARTITION_RE = re.compile(r"^\tpartition\b", re.M)
IN_RE = re.compile(r"^(?P<indent>\s*)in\r?\n(?P=indent)(?P<result>[^\r\n]+)", re.M)
ALLOWLIST_STEP_RE = re.compile(r'^\s*AllowedModelColumns\s*=', re.M)


def unquote(name: str) -> str:
    if len(name) >= 2 and name[0] == name[-1] and name[0] in {"'", '"'}:
        return name[1:-1]
    return name


def escape_m_string(value: str) -> str:
    return value.replace('"', '""')


def extract_declared_columns(text: str) -> list[str]:
    partition_match = PARTITION_RE.search(text)
    if not partition_match:
        raise ValueError("No partition block found.")
    header_text = text[: partition_match.start()]
    return [unquote(match.group("name")) for match in COLUMN_RE.finditer(header_text)]


def build_allowlist_block(indent: str, result_name: str, columns: list[str], eol: str) -> str:
    inner = indent + "    "
    list_indent = inner + "    "
    column_lines = ("," + eol).join(f'{list_indent}"{escape_m_string(column)}"' for column in columns)
    return (
        f"{indent}AllowedModelColumns = {{{eol}"
        f"{column_lines}{eol}"
        f"{inner}}},{eol}"
        f'{indent}#"Selected Model Columns" = Table.SelectColumns({result_name}, AllowedModelColumns, MissingField.Ignore){eol}'
        f"{indent}in{eol}"
        f'{indent}    #"Selected Model Columns"'
    )


def main() -> None:
    for path in TARGET_FILES:
        text = path.read_text(encoding="utf-8")
        if ALLOWLIST_STEP_RE.search(text):
            continue

        columns = extract_declared_columns(text)
        in_match = IN_RE.search(text)
        if not in_match:
            raise ValueError(f"No terminal `in` block found in {path}")

        indent = in_match.group("indent")
        result_name = in_match.group("result").strip()
        eol = "\r\n" if "\r\n" in text else "\n"
        replacement = build_allowlist_block(indent, result_name, columns, eol)
        updated = text[: in_match.start()] + replacement + text[in_match.end() :]
        path.write_text(updated, encoding="utf-8", newline="")


if __name__ == "__main__":
    main()
