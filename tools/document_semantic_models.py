import argparse
import json
import os
import re
from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple

PLACEHOLDER_RE = re.compile(r"^(?:todo|tbd|n/?a|na|none|description|add description|placeholder|fixme|-)\b", re.I)

KIND_KEYWORDS = ("table", "column", "measure", "hierarchy", "relationship")
DEPRECATED_NAME_RE = re.compile(r"(_old|_v1)(?:$|_)", re.I)


@dataclass
class Change:
    kind: str
    name: str
    action: str  # added | replaced | preserved


@dataclass
class DocField:
    description: str
    deprecated: bool


@dataclass
class DocEntity:
    table_description: str
    fields: Dict[str, DocField]


@dataclass
class RelationshipInfo:
    from_table: str
    from_column: str
    to_table: str
    to_column: str


def leading_ws(line: str) -> str:
    return re.match(r"^\s*", line).group(0)


def detect_line_ending(text: str) -> str:
    if "\r\n" in text:
        return "\r\n"
    return "\n"


def detect_indent_unit(lines: List[str]) -> str:
    for line in lines:
        if line.startswith("\t"):
            return "\t"
        m = re.match(r"^( +)\S", line)
        if m:
            return m.group(1)
    return "  "


def parse_desc_value(raw: str) -> str:
    raw = raw.strip()
    if not raw:
        return ""
    if raw.startswith("\""):
        try:
            return json.loads(raw)
        except Exception:
            return raw.strip("\"")
    return raw


def is_placeholder(text: str) -> bool:
    if not text:
        return True
    return bool(PLACEHOLDER_RE.match(text.strip()))


def prettify(name: str) -> str:
    name = name.replace(".", " ")
    name = name.replace("__", " ")
    name = name.replace("_", " ")
    name = re.sub(r"\s+", " ", name).strip()
    return name.lower()


def format_desc(desc: str) -> str:
    return json.dumps(desc, ensure_ascii=True)


def normalize_key(value: str) -> str:
    return value.strip().lower()


def apply_prefix(description: str, column_name: str) -> str:
    lowered = description.strip().lower()
    if column_name.startswith("_sys_") and not lowered.startswith("system:"):
        return f"System: {description}"
    if column_name.startswith("trueai_") and not lowered.startswith("trueai:"):
        return f"TrueAI: {description}"
    if column_name.startswith("crm_") and not lowered.startswith("crm:"):
        return f"CRM: {description}"
    return description


def apply_deprecated_prefix(description: str, name: str) -> str:
    if DEPRECATED_NAME_RE.search(name) and not description.strip().lower().startswith("deprecated:"):
        return "DEPRECATED: Use [New Field] instead. " + description
    return description


def singularize(name: str) -> str:
    if name.endswith("ies"):
        return name[:-3] + "y"
    if name.endswith("sses"):
        return name[:-2]
    if name.endswith("s") and len(name) > 3:
        return name[:-1]
    return name


def parse_header(line: str) -> Optional[Tuple[str, str]]:
    m = re.match(r"^(\s*)(table|column|measure|hierarchy|relationship)\s+(.*)$", line)
    if not m:
        return None
    kind = m.group(2)
    rest = m.group(3).strip()

    if kind == "measure":
        name_part = rest.split("=", 1)[0].strip()
        if name_part.startswith("'") and name_part.endswith("'"):
            name_part = name_part[1:-1]
        elif name_part.startswith('"') and name_part.endswith('"'):
            name_part = name_part[1:-1]
        return kind, name_part

    if kind in ("table", "column", "hierarchy"):
        name_token = rest.split()[0]
        if name_token.startswith("'") and name_token.endswith("'"):
            name_token = name_token[1:-1]
        elif name_token.startswith('"') and name_token.endswith('"'):
            name_token = name_token[1:-1]
        return kind, name_token

    if kind == "relationship":
        return kind, rest.split()[0]

    return None


def find_block_end(lines: List[str], start_i: int, start_indent: str) -> int:
    for j in range(start_i + 1, len(lines)):
        if not lines[j].strip():
            continue
        indent_j = leading_ws(lines[j])
        if len(indent_j) <= len(start_indent):
            return j
    return len(lines)


def find_property_indent(lines: List[str], start_i: int, end_i: int, start_indent: str, indent_unit: str) -> str:
    for j in range(start_i + 1, end_i):
        if not lines[j].strip():
            continue
        indent_j = leading_ws(lines[j])
        if len(indent_j) > len(start_indent):
            return indent_j
    return start_indent + indent_unit


def find_measure_expression_end(lines: List[str], start_i: int) -> int:
    if "```" not in lines[start_i]:
        return start_i
    for j in range(start_i + 1, len(lines)):
        if lines[j].strip() == "```":
            return j
    return start_i


def extract_block_metadata(lines: List[str], start_i: int, end_i: int) -> Dict[str, str]:
    data = {}
    for j in range(start_i + 1, end_i):
        line = lines[j].strip()
        if line.startswith("dataType:"):
            data["dataType"] = line.split(":", 1)[1].strip()
        elif line.startswith("fromColumn:"):
            data["fromColumn"] = line.split(":", 1)[1].strip()
        elif line.startswith("toColumn:"):
            data["toColumn"] = line.split(":", 1)[1].strip()
    return data


def describe_table(name: str) -> Tuple[str, bool]:
    if name.startswith("LocalDateTable_") or name.startswith("DateTableTemplate_"):
        return (
            "System: Auto-generated date table used by Power BI for local date hierarchies.",
            False,
        )
    pretty = prettify(name)
    return (
        f"One row per {pretty} record. Contains attributes used for analysis and reporting.",
        False,
    )


def describe_column(name: str, data_type: Optional[str]) -> Tuple[str, bool]:
    prefix = ""
    base = name
    if name.startswith("_sys_"):
        prefix = "System: "
        base = name[len("_sys_"):]
    elif name.startswith("trueai_"):
        prefix = "TrueAI: "
        base = name[len("trueai_"):]
    elif name.startswith("crm_"):
        prefix = "CRM: "
        base = name[len("crm_"):]

    pretty = prettify(base)
    ambiguous = False

    if data_type in {"boolean"} or base.startswith("is_") or base.startswith("has_") or "flag" in base:
        desc = f"{prefix}Indicates whether {pretty}."
    elif data_type in {"date", "dateTime"} or "date" in base or base.endswith("_dt") or "time" in base:
        desc = f"{prefix}Date/time when {pretty}."
    elif base.endswith("_id") or base == "id":
        target = prettify(base[:-3]) or "the entity"
        desc = f"{prefix}Identifier for {target}."
    elif any(token in base for token in ["count", "num", "qty", "quantity"]):
        desc = f"{prefix}Count of {pretty}."
    elif any(token in base for token in ["amount", "amt", "revenue", "cost", "price", "value"]):
        desc = f"{prefix}Amount for {pretty}."
    elif data_type in {"string"}:
        desc = f"{prefix}Text label for {pretty}."
    elif data_type in {"int64", "int32", "double", "decimal", "float"}:
        desc = f"{prefix}Numeric value for {pretty}."
    else:
        desc = f"{prefix}Value for {pretty}."
        ambiguous = True

    desc = apply_deprecated_prefix(desc, name)
    return desc, ambiguous


def describe_measure(name: str) -> Tuple[str, bool]:
    base = name
    if base.startswith("meas."):
        base = base[len("meas."):]
    if "." in base:
        base = base.split(".")[-1]

    pretty = prettify(base)
    if any(t in base for t in ["rate", "pct", "percent"]):
        first = f"Rate of {pretty}."
    elif "count" in base or base.endswith("counts"):
        first = f"Count of {pretty}."
    elif any(t in base for t in ["avg", "average"]):
        first = f"Average of {pretty}."
    else:
        first = f"Measure calculating {pretty}."

    desc = f"{first} Respects the current filter context."
    desc = apply_deprecated_prefix(desc, name)
    return desc, False


def describe_hierarchy(name: str) -> Tuple[str, bool]:
    pretty = prettify(name)
    desc = f"Hierarchy for {pretty} used for drill-down analysis."
    desc = apply_deprecated_prefix(desc, name)
    return desc, False


def describe_relationship(from_col: Optional[str], to_col: Optional[str]) -> Tuple[str, bool]:
    if from_col and to_col:
        return (
            f"Relationship from {from_col} to {to_col}. Enables filtering between the related tables.",
            False,
        )
    return ("Relationship between related tables.", True)


def infer_source_prefix(columns: List[Tuple[str, Optional[str]]]) -> Optional[str]:
    prefixes = set()
    for col, _dtype in columns:
        if col.startswith("_sys_"):
            prefixes.add("System")
        elif col.startswith("trueai_"):
            prefixes.add("TrueAI")
        elif col.startswith("crm_"):
            prefixes.add("CRM")
        elif col.startswith("ci_"):
            prefixes.add("CI")
    if not prefixes:
        return None
    return ", ".join(sorted(prefixes))


def infer_grain(table_name: str, columns: List[Tuple[str, Optional[str]]]) -> Optional[str]:
    col_names = {c.lower() for c, _ in columns}
    if "_sys_doc_id" in col_names or "_sys_docid" in col_names or "id" in col_names:
        return f"One row per {singularize(table_name)} record."
    if "history" in table_name.lower() or "histories" in table_name.lower():
        return f"One row per {singularize(table_name)} event or snapshot."
    if "line_item" in table_name.lower() or "line_items" in table_name.lower():
        return f"One row per {singularize(table_name)} entry."
    if "summary" in table_name.lower():
        return f"One row per {singularize(table_name)} summary record."
    return None


def describe_table_from_context(
    name: str,
    columns: List[Tuple[str, Optional[str]]],
    measures: List[str],
    relationships: List[RelationshipInfo],
    doc_desc: Optional[str],
) -> Tuple[str, bool]:
    parts: List[str] = []
    ambiguous = False

    grain = infer_grain(name, columns)
    source = infer_source_prefix(columns)

    if doc_desc:
        base = doc_desc
        if grain:
            base = f"{grain} {base}"
        parts.append(base)
    elif grain:
        parts.append(grain)
    else:
        ambiguous = True
        parts.append("TODO: provide business definition for this table.")

    if source:
        parts.append(f"Source fields include {source} prefixes.")

    if relationships:
        related = []
        for rel in relationships[:3]:
            related.append(f"{rel.to_table} ({rel.from_column} -> {rel.to_column})")
        if related:
            parts.append(f"Related to {', '.join(related)}.")

    if measures:
        sample = ", ".join(measures[:2])
        parts.append(f"Supports measures such as {sample}.")

    return " ".join(parts).strip(), ambiguous


def infer_measure_description(name: str, expression: str) -> Tuple[str, bool]:
    expr = expression or ""
    lowered = expr.lower()
    cols = re.findall(r"([A-Za-z0-9_]+)\[([A-Za-z0-9_]+)\]", expr)
    col_refs = [f"{t}[{c}]" for t, c in cols]

    if "divide(" in lowered or "/" in lowered:
        if col_refs:
            if len(col_refs) >= 2:
                return (
                    f"Ratio of {col_refs[0]} to {col_refs[1]}. Respects the current filter context.",
                    False,
                )
            return (f"Ratio based on {col_refs[0]}. Respects the current filter context.", False)
        return ("Ratio measure. Respects the current filter context.", True)

    if "distinctcount" in lowered and col_refs:
        return (f"Distinct count of {col_refs[0]}. Respects the current filter context.", False)
    if "count(" in lowered or "countrows" in lowered:
        if col_refs:
            return (f"Count of {col_refs[0]}. Respects the current filter context.", False)
        return ("Count of records. Respects the current filter context.", False)
    if "sum(" in lowered and col_refs:
        return (f"Sum of {col_refs[0]}. Respects the current filter context.", False)
    if "average(" in lowered and col_refs:
        return (f"Average of {col_refs[0]}. Respects the current filter context.", False)

    return ("TODO: provide business definition for this measure.", True)


def generate_description(
    kind: str,
    name: str,
    meta: Dict[str, str],
    docs: Dict[str, DocEntity],
    current_table: Optional[str],
    table_columns: List[Tuple[str, Optional[str]]],
    table_measures: List[str],
    relationships: List[RelationshipInfo],
    measure_expression: str,
) -> Tuple[str, bool]:
    if kind == "table":
        doc = docs.get(normalize_key(name))
        if doc and doc.table_description:
            return describe_table_from_context(
                name,
                table_columns,
                table_measures,
                relationships,
                doc.table_description,
            )
        return describe_table_from_context(
            name, table_columns, table_measures, relationships, None
        )
    if kind == "column":
        if current_table:
            doc = docs.get(normalize_key(current_table))
            if doc:
                field = doc.fields.get(normalize_key(name))
                if field and field.description:
                    desc = apply_prefix(field.description, name)
                    desc = apply_deprecated_prefix(desc, name)
                    if field.deprecated and not desc.strip().lower().startswith("deprecated:"):
                        desc = "DEPRECATED: " + desc
                    return desc, False
        desc, ambiguous = describe_column(name, meta.get("dataType"))
        if ambiguous:
            desc = f"Unclear: {desc}"
        return desc, ambiguous
    if kind == "measure":
        desc, ambiguous = infer_measure_description(name, measure_expression)
        desc = apply_deprecated_prefix(desc, name)
        return desc, ambiguous
    if kind == "hierarchy":
        return describe_hierarchy(name)
    if kind == "relationship":
        return describe_relationship(meta.get("fromColumn"), meta.get("toColumn"))
    return ("", True)


def load_api_docs(api_docs_root: Optional[str]) -> Dict[str, DocEntity]:
    if not api_docs_root:
        return {}

    entities_dir = os.path.join(api_docs_root, "docs", "entities")
    if not os.path.isdir(entities_dir):
        return {}

    entities: Dict[str, DocEntity] = {}
    for entity_name in os.listdir(entities_dir):
        index_path = os.path.join(entities_dir, entity_name, "index.md")
        if not os.path.isfile(index_path):
            continue

        with open(index_path, "r", encoding="utf-8") as f:
            lines = f.readlines()

        # Skip frontmatter
        i = 0
        if i < len(lines) and lines[i].strip() == "---":
            i += 1
            while i < len(lines) and lines[i].strip() != "---":
                i += 1
            if i < len(lines):
                i += 1

        table_desc = ""
        while i < len(lines):
            line = lines[i].strip()
            if line.startswith("## "):
                break
            if line and not line.startswith("<") and not line.startswith("#"):
                table_desc = line
                break
            i += 1

        fields: Dict[str, DocField] = {}
        # Find fields table header
        for j, line in enumerate(lines):
            if line.strip().lower().startswith("| entity | field name |"):
                k = j + 2  # skip header separator
                while k < len(lines):
                    row = lines[k].strip()
                    if not row.startswith("|"):
                        break
                    parts = [p.strip() for p in row.strip("|").split("|")]
                    if len(parts) < 7:
                        k += 1
                        continue
                    entity = parts[0]
                    field_name = parts[1]
                    description = parts[5]
                    deprecated_raw = parts[6].lower()
                    deprecated = deprecated_raw == "true"
                    if entity and field_name and description:
                        if normalize_key(entity) == normalize_key(entity_name):
                            fields[normalize_key(field_name)] = DocField(
                                description=description, deprecated=deprecated
                            )
                    k += 1
                break

        entities[normalize_key(entity_name)] = DocEntity(
            table_description=table_desc,
            fields=fields,
        )

    return entities


def load_relationships(model_root: str) -> Dict[str, List[RelationshipInfo]]:
    rels: Dict[str, List[RelationshipInfo]] = {}
    rel_path = os.path.join(model_root, "definition", "relationships.tmdl")
    if not os.path.isfile(rel_path):
        return rels

    with open(rel_path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    current_from = ""
    current_to = ""
    for line in lines:
        stripped = line.strip()
        if stripped.startswith("fromColumn:"):
            current_from = stripped.split("fromColumn:", 1)[1].strip()
        elif stripped.startswith("toColumn:"):
            current_to = stripped.split("toColumn:", 1)[1].strip()
            if current_from and current_to:
                if "." in current_from and "." in current_to:
                    from_table, from_column = current_from.split(".", 1)
                    to_table, to_column = current_to.split(".", 1)
                    rel = RelationshipInfo(
                        from_table=from_table,
                        from_column=from_column,
                        to_table=to_table,
                        to_column=to_column,
                    )
                    rels.setdefault(from_table, []).append(rel)
                current_from = ""
                current_to = ""
    return rels


def extract_table_context(lines: List[str], start_i: int, end_i: int) -> Tuple[List[Tuple[str, Optional[str]]], List[str]]:
    columns: List[Tuple[str, Optional[str]]] = []
    measures: List[str] = []
    i = start_i + 1
    current_col = None
    current_col_dtype = None
    while i < end_i:
        header = parse_header(lines[i])
        if header:
            kind, name = header
            if kind == "column":
                current_col = name
                current_col_dtype = None
            elif kind == "measure":
                measures.append(name)
            i += 1
            continue
        stripped = lines[i].strip()
        if current_col and stripped.startswith("dataType:"):
            current_col_dtype = stripped.split("dataType:", 1)[1].strip()
        if stripped == "" and current_col:
            columns.append((current_col, current_col_dtype))
            current_col = None
            current_col_dtype = None
        i += 1
    if current_col:
        columns.append((current_col, current_col_dtype))
    return columns, measures


def update_tmdl_file(
    path: str,
    dry_run: bool,
    verbose: bool,
    docs: Dict[str, DocEntity],
    only_missing: bool,
    skip_date_tables: bool,
    relationships_by_table: Dict[str, List[RelationshipInfo]],
) -> Tuple[int, int, int, List[str], List[Change]]:
    with open(path, "r", encoding="utf-8", newline="") as f:
        text = f.read()

    line_ending = detect_line_ending(text)
    lines = text.splitlines(keepends=True)
    indent_unit = detect_indent_unit(lines)

    added = 0
    replaced = 0
    preserved = 0
    ambiguous: List[str] = []
    changes: List[Change] = []

    i = 0
    current_table: Optional[str] = None
    current_table_is_date = False
    table_columns: List[Tuple[str, Optional[str]]] = []
    table_measures: List[str] = []
    relationships: List[RelationshipInfo] = []
    current_measure_expression: str = ""
    while i < len(lines):
        header = parse_header(lines[i])
        if not header:
            i += 1
            continue

        kind, name = header
        if kind == "table":
            current_table = name
            current_table_is_date = name.startswith("LocalDateTable_") or name.startswith("DateTableTemplate_")
            if skip_date_tables and current_table_is_date:
                i = find_block_end(lines, i, leading_ws(lines[i]))
                continue
            table_columns, table_measures = extract_table_context(
                lines, i, find_block_end(lines, i, leading_ws(lines[i]))
            )
            relationships = relationships_by_table.get(current_table, [])
            current_measure_expression = ""
        elif kind == "measure":
            # capture expression for measure inference
            line = lines[i]
            if "```" in line:
                expr_lines = []
                k = i + 1
                while k < len(lines) and lines[k].strip() != "```":
                    expr_lines.append(lines[k].rstrip("\r\n"))
                    k += 1
                current_measure_expression = "\n".join(expr_lines).strip()
            else:
                parts = line.split("=", 1)
                current_measure_expression = parts[1].strip() if len(parts) > 1 else ""
        start_indent = leading_ws(lines[i])
        end_i = find_block_end(lines, i, start_indent)
        prop_indent = find_property_indent(lines, i, end_i, start_indent, indent_unit)

        # Find existing description
        desc_idx = None
        desc_value = ""
        for j in range(i + 1, end_i):
            if lines[j].lstrip().startswith("description:"):
                desc_idx = j
                raw = lines[j].split("description:", 1)[1]
                desc_value = parse_desc_value(raw)
                break

        meta = extract_block_metadata(lines, i, end_i)
        new_desc, is_ambiguous = generate_description(
            kind,
            name,
            meta,
            docs,
            current_table,
            table_columns,
            table_measures,
            relationships,
            current_measure_expression,
        )
        if not new_desc:
            i = end_i
            continue

        if desc_idx is not None:
            generated_desc, _ = generate_description(
                kind,
                name,
                meta,
                {},
                current_table,
                table_columns,
                table_measures,
                relationships,
                current_measure_expression,
            )
            is_generated = desc_value.strip() == generated_desc.strip() if generated_desc else False
            if only_missing:
                if is_placeholder(desc_value):
                    lines[desc_idx] = f"{prop_indent}description: {format_desc(new_desc)}{line_ending}"
                    replaced += 1
                    changes.append(Change(kind, name, "replaced"))
                    if is_ambiguous:
                        ambiguous.append(f"{path}::{kind}::{name}")
                else:
                    preserved += 1
                    changes.append(Change(kind, name, "preserved"))
            elif is_placeholder(desc_value) or is_generated:
                lines[desc_idx] = f"{prop_indent}description: {format_desc(new_desc)}{line_ending}"
                replaced += 1
                changes.append(Change(kind, name, "replaced"))
                if is_ambiguous:
                    ambiguous.append(f"{path}::{kind}::{name}")
            else:
                preserved += 1
                changes.append(Change(kind, name, "preserved"))
        else:
            insert_at = i + 1
            if kind == "measure":
                # Place description immediately after the expression block (or measure line)
                expr_end = find_measure_expression_end(lines, i)
                insert_at = expr_end + 1
                # Keep blank lines directly following the expression block
                while insert_at < end_i and lines[insert_at].strip() == "":
                    insert_at += 1
            lines.insert(insert_at, f"{prop_indent}description: {format_desc(new_desc)}{line_ending}")
            added += 1
            changes.append(Change(kind, name, "added"))
            if is_ambiguous:
                ambiguous.append(f"{path}::{kind}::{name}")
            end_i += 1

        if kind == "table":
            # Do not skip nested items inside the table block
            i += 1
        else:
            i = end_i

    if added or replaced:
        if not dry_run:
            with open(path, "w", encoding="utf-8", newline="") as f:
                f.write("".join(lines))

    if verbose and (added or replaced):
        for change in changes:
            if change.action in {"added", "replaced"}:
                print(f"{path}: {change.action} {change.kind} {change.name}")

    return added, replaced, preserved, ambiguous, changes


def discover_models(root: str) -> List[str]:
    models = set()
    for dirpath, dirnames, filenames in os.walk(root):
        for d in list(dirnames):
            if d.endswith(".SemanticModel"):
                models.add(os.path.join(dirpath, d))
        for filename in filenames:
            if filename.endswith(".tmdl") or filename == "model.bim":
                full = os.path.join(dirpath, filename)
                parts = full.split(os.sep)
                model_root = None
                for idx in range(len(parts) - 1, -1, -1):
                    if parts[idx].endswith(".SemanticModel"):
                        model_root = os.sep.join(parts[: idx + 1])
                        break
                if model_root is None:
                    model_root = dirpath
                models.add(model_root)
    return sorted(models)


def collect_tmdl_files(model_root: str) -> List[str]:
    tmdl_files = []
    for dirpath, _, filenames in os.walk(model_root):
        for filename in filenames:
            if not filename.endswith(".tmdl"):
                continue
            full = os.path.join(dirpath, filename)
            if "TMDLScripts" in full:
                continue
            if os.sep + "definition" + os.sep not in full:
                continue
            tmdl_files.append(full)
    return sorted(tmdl_files)


def main() -> int:
    parser = argparse.ArgumentParser(description="Backfill semantic model descriptions in TMDL/model.bim files.")
    parser.add_argument("--root", default=".")
    parser.add_argument("--dry-run", action="store_true", help="Preview changes without writing files")
    parser.add_argument("--verbose", action="store_true", help="Print per-object changes")
    parser.add_argument(
        "--api-docs-root",
        default=None,
        help="Path to cien-data-api-documentation repository",
    )
    parser.add_argument(
        "--only-missing",
        action="store_true",
        help="Only fill missing or placeholder descriptions; do not replace existing",
    )
    parser.add_argument(
        "--skip-date-tables",
        action="store_true",
        help="Skip LocalDateTable_* and DateTableTemplate_* tables",
    )
    args = parser.parse_args()

    root = os.path.abspath(args.root)
    docs = load_api_docs(args.api_docs_root)
    models = discover_models(root)
    if not models:
        print("No semantic models found.")
        return 1

    total_added = 0
    total_replaced = 0
    total_preserved = 0
    ambiguous_all: List[str] = []
    touched_models = set()

    for model_root in models:
        tmdl_files = collect_tmdl_files(model_root)
        if not tmdl_files:
            continue
        model_relationships = load_relationships(model_root)
        model_added = 0
        model_replaced = 0
        model_preserved = 0

        for path in tmdl_files:
            added, replaced, preserved, ambiguous, _changes = update_tmdl_file(
                path,
                dry_run=args.dry_run,
                verbose=args.verbose,
                docs=docs,
                only_missing=args.only_missing,
                skip_date_tables=args.skip_date_tables,
                relationships_by_table=model_relationships,
            )
            if added or replaced:
                touched_models.add(model_root)
            model_added += added
            model_replaced += replaced
            model_preserved += preserved
            ambiguous_all.extend(ambiguous)

        total_added += model_added
        total_replaced += model_replaced
        total_preserved += model_preserved

        print(
            f"{model_root}: +{model_added} added, ~{model_replaced} replaced, ={model_preserved} preserved"
        )

    if args.dry_run:
        print("DRY RUN - no files written")

    print("Summary")
    print(f"Models touched: {len(touched_models)}")
    print(f"Descriptions added: {total_added}")
    print(f"Descriptions replaced: {total_replaced}")
    print(f"Descriptions preserved: {total_preserved}")
    print(f"Ambiguous items: {len(ambiguous_all)}")

    if ambiguous_all:
        print("Ambiguous list:")
        for item in ambiguous_all:
            print(item)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
