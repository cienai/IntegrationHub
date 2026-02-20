#!/usr/bin/env python3
"""
Score measure annotations (Agent*) in PBIP semantic models.
Read-only analysis of TMDL; outputs CSV + Markdown reports.
"""

from __future__ import annotations

import csv
import re
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import List, Optional

ROOT = Path(__file__).resolve().parents[1]
SRC_ROOT = ROOT / 'src'
CSV_OUT = ROOT / 'measure_description_scores.csv'
MD_OUT = ROOT / 'measure_description_scores_summary.md'

MEASURE_RE = re.compile(r"^(?P<indent>\s*)measure\s+'(?P<name>[^']+)'\s*=\s*(?P<rest>.*)$")
BLOCK_START_RE = re.compile(r"^(?P<indent>\s*)(measure|column|table)\b")
ANNOT_RE = re.compile(r"^\s*annotation\s+(?P<key>Agent\w+)\s*=\s+\"(?P<val>.*)\"\s*$")

ALLOWED_OUTPUTS = {
    'Text',
    'Whole number',
    'Decimal',
    'Percentage',
    'Boolean',
    'Date',
    'DateTime',
}

GENERIC_PURPOSE_PHRASES = [
    'calculates the measure result',
    'compute the measure result',
    'computes the measure result',
    'tracks the metric',
    'measure result',
    'this measure',
]

GENERIC_LOGIC_PHRASES = [
    'derived from model references',
    'computed from model references',
    'same as purpose',
    'calculated as the measure result',
]


@dataclass
class MeasureScore:
    semantic_model: str
    measure_name: str
    score: int
    purpose_ok: int
    logic_ok: int
    deps_ok: int
    context_ok: int
    output_ok: int
    flags: str


def find_semantic_models() -> List[Path]:
    return [p for p in SRC_ROOT.iterdir() if p.is_dir() and p.name.endswith('.SemanticModel')]


def leading_ws(s: str) -> str:
    return re.match(r"^\s*", s).group(0)


def is_generic(text: str, phrases: List[str]) -> bool:
    t = text.lower()
    return any(p in t for p in phrases)


def score_annotations(ann: dict) -> tuple[int, int, int, int, int, int, List[str]]:
    flags = []

    purpose = ann.get('AgentPurpose')
    logic = ann.get('AgentLogic')
    deps = ann.get('AgentDependencies')
    context = ann.get('AgentContext')
    output = ann.get('AgentOutput')

    purpose_ok = 0
    if not purpose:
        flags.append('missing_purpose')
    else:
        if len(purpose) < 12:
            flags.append('purpose_too_short')
        if is_generic(purpose, GENERIC_PURPOSE_PHRASES):
            flags.append('purpose_generic')
        else:
            purpose_ok = 1

    logic_ok = 0
    if not logic:
        flags.append('missing_logic')
    else:
        if len(logic) < 12:
            flags.append('logic_too_short')
        if is_generic(logic, GENERIC_LOGIC_PHRASES):
            flags.append('logic_generic')
        else:
            logic_ok = 1

    deps_ok = 0
    if not deps:
        flags.append('missing_dependencies')
    else:
        if deps.lower() == 'see model references' or deps.strip():
            deps_ok = 1
        else:
            flags.append('dependencies_empty')

    context_ok = 0
    if not context:
        flags.append('missing_context')
    else:
        if 'filter context' in context.lower():
            context_ok = 1
        else:
            flags.append('context_unrecognized')

    output_ok = 0
    if not output:
        flags.append('missing_output')
    else:
        if output in ALLOWED_OUTPUTS:
            output_ok = 1
        else:
            flags.append('output_unrecognized')

    score = purpose_ok + logic_ok + deps_ok + context_ok + output_ok
    return score, purpose_ok, logic_ok, deps_ok, context_ok, output_ok, flags


def iter_measures(tmdl_path: Path):
    lines = tmdl_path.read_text(encoding='utf-8').splitlines()
    i = 0
    while i < len(lines):
        line = lines[i]
        m = MEASURE_RE.match(line)
        if not m:
            i += 1
            continue
        indent = m.group('indent')
        prop_indent = indent + '\t'

        end_idx = len(lines)
        j = i + 1
        while j < len(lines):
            m2 = BLOCK_START_RE.match(lines[j])
            if m2 and len(m2.group('indent')) == len(indent):
                end_idx = j
                break
            j += 1

        ann = {}
        for k in range(i + 1, end_idx):
            line_k = lines[k]
            if not line_k.startswith(prop_indent + 'annotation '):
                continue
            m_ann = ANNOT_RE.match(line_k.strip())
            if m_ann:
                ann[m_ann.group('key')] = m_ann.group('val')

        yield m.group('name'), ann
        i = end_idx


def main() -> int:
    semantic_models = find_semantic_models()
    all_scores: List[MeasureScore] = []
    measure_counts = {}

    for sm in semantic_models:
        count = 0
        for tmdl in (sm / 'definition').rglob('*.tmdl'):
            for name, ann in iter_measures(tmdl):
                count += 1
                score, purpose_ok, logic_ok, deps_ok, context_ok, output_ok, flags = score_annotations(ann)
                all_scores.append(
                    MeasureScore(
                        semantic_model=sm.name,
                        measure_name=name,
                        score=score,
                        purpose_ok=purpose_ok,
                        logic_ok=logic_ok,
                        deps_ok=deps_ok,
                        context_ok=context_ok,
                        output_ok=output_ok,
                        flags=';'.join(flags),
                    )
                )
        measure_counts[sm.name] = count

    all_scores.sort(key=lambda r: (r.semantic_model, r.measure_name))

    with CSV_OUT.open('w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow([
            'semantic_model',
            'measure_name',
            'score',
            'purpose_ok',
            'logic_ok',
            'deps_ok',
            'context_ok',
            'output_ok',
            'flags',
        ])
        for r in all_scores:
            writer.writerow([
                r.semantic_model,
                r.measure_name,
                r.score,
                r.purpose_ok,
                r.logic_ok,
                r.deps_ok,
                r.context_ok,
                r.output_ok,
                r.flags,
            ])

    total = len(all_scores)
    avg_score = sum(r.score for r in all_scores) / total if total else 0.0
    dist = Counter(r.score for r in all_scores)

    lowest_20 = sorted(all_scores, key=lambda r: (r.score, r.semantic_model, r.measure_name))[:20]

    lines = []
    lines.append('# Measure Annotation Scoring Summary')
    lines.append('')
    lines.append('## Totals')
    lines.append('')
    lines.append(f'- Total measures: {total}')
    for sm_name, count in sorted(measure_counts.items()):
        lines.append(f'- {sm_name}: {count}')
    lines.append(f'- Overall average score: {avg_score:.2f}')
    lines.append('')
    lines.append('## Score Distribution')
    lines.append('')
    for score in range(0, 6):
        lines.append(f'- {score}: {dist.get(score, 0)}')
    lines.append('')
    lines.append('## Lowest 20 Measures')
    lines.append('')
    lines.append('| semantic_model | measure_name | score | flags |')
    lines.append('| --- | --- | --- | --- |')
    for r in lowest_20:
        lines.append(f'| {r.semantic_model} | {r.measure_name} | {r.score} | {r.flags} |')
    lines.append('')

    MD_OUT.write_text('\n'.join(lines) + '\n', encoding='utf-8')

    print('Lowest 20 measures (score, semantic_model, measure_name, flags):')
    for r in lowest_20:
        print(f'{r.score}\t{r.semantic_model}\t{r.measure_name}\t{r.flags}')

    return 0


if __name__ == '__main__':
    raise SystemExit(main())
