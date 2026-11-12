#!/usr/bin/env python3
"""
Parse `M_CASHEAR/SQL/mhr.dmp` (classic Oracle exp V09.02.00) at the byte level
to recover as much DDL as possible without an Oracle instance.

Approach: the dump format wraps DDL strings and INSERT metadata in a
byte-length-prefixed container. We look for distinctive DDL leading
keywords (CREATE/ALTER/GRANT/INSERT/DROP) in the raw byte stream and
pull a terminator-bounded ASCII region around each hit. False positives
are filtered by minimum length and well-formedness.

Outputs:
  analysis/conversion-logs/mhr_dump_strings.log
  analysis/normalized/dump-ddl.csv
  docs/database/dump-manifest.md
"""
from __future__ import annotations
import csv, re, sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN = ROOT / "M_CASHEAR" / "SQL" / "mhr.dmp"
OUT_LOG = ROOT / "analysis" / "conversion-logs" / "mhr_dump_strings.log"
OUT_CSV = ROOT / "analysis" / "normalized" / "dump-ddl.csv"
OUT_MD  = ROOT / "docs" / "database" / "dump-manifest.md"

DATA = IN.read_bytes()

# Find all maximal ASCII runs ≥ 8 chars.
RUN_RE = re.compile(rb"[\x20-\x7E\t\r\n]{8,}")
runs = [m.group(0).decode("ascii", errors="replace") for m in RUN_RE.finditer(DATA)]

# Classify runs by first keyword
KIND_PATTERNS = [
    ("create_table",   re.compile(r"\bCREATE\s+TABLE\s+\"?([A-Z_][A-Z0-9_$]*)\"?\s*\(", re.IGNORECASE)),
    ("alter_table",    re.compile(r"\bALTER\s+TABLE\s+\"?([A-Z_][A-Z0-9_$]*)\"?\s", re.IGNORECASE)),
    ("create_index",   re.compile(r"\bCREATE\s+(?:UNIQUE\s+)?INDEX\s+\"?([A-Z_][A-Z0-9_$]*)\"?\s", re.IGNORECASE)),
    ("create_view",    re.compile(r"\bCREATE\s+(?:OR\s+REPLACE\s+)?(?:FORCE\s+)?VIEW\s+\"?([A-Z_][A-Z0-9_$]*)\"?", re.IGNORECASE)),
    ("create_trigger", re.compile(r"\bCREATE\s+(?:OR\s+REPLACE\s+)?TRIGGER\s+\"?([A-Z_][A-Z0-9_$]*)\"?", re.IGNORECASE)),
    ("create_sequence",re.compile(r"\bCREATE\s+SEQUENCE\s+\"?([A-Z_][A-Z0-9_$]*)\"?", re.IGNORECASE)),
    ("create_synonym", re.compile(r"\bCREATE\s+(?:OR\s+REPLACE\s+)?(?:PUBLIC\s+)?SYNONYM\s+\"?([A-Z_][A-Z0-9_$]*)\"?", re.IGNORECASE)),
    ("create_procedure", re.compile(r"\bCREATE\s+(?:OR\s+REPLACE\s+)?PROCEDURE\s+\"?([A-Z_][A-Z0-9_$]*)\"?", re.IGNORECASE)),
    ("create_function",  re.compile(r"\bCREATE\s+(?:OR\s+REPLACE\s+)?FUNCTION\s+\"?([A-Z_][A-Z0-9_$]*)\"?", re.IGNORECASE)),
    ("create_package",   re.compile(r"\bCREATE\s+(?:OR\s+REPLACE\s+)?PACKAGE(?:\s+BODY)?\s+\"?([A-Z_][A-Z0-9_$]*)\"?", re.IGNORECASE)),
    ("insert_ddl",      re.compile(r"\bINSERT\s+INTO\s+\"?([A-Z_][A-Z0-9_$]*)\"?", re.IGNORECASE)),
    ("tbl_header",     re.compile(r"\bTABLE\s+\"([A-Z_][A-Z0-9_$]*)\"", re.IGNORECASE)),  # exp emits TABLE "name" markers
]

rows = []
objects_by_kind: dict[str, set[str]] = defaultdict(set)
total_runs = len(runs)

for run in runs:
    text = run.strip()
    if len(text) < 8:
        continue
    seen_kinds = set()
    for kind, rgx in KIND_PATTERNS:
        for m in rgx.finditer(text):
            name = m.group(1).upper() if m.groups() else ""
            key = (kind, name)
            if key in seen_kinds:
                continue
            seen_kinds.add(key)
            rows.append({"kind": kind, "name": name, "fragment_first_300": text[:300].replace("\n"," ")})
            if name:
                objects_by_kind[kind].add(name)

# Write raw-strings log
OUT_LOG.parent.mkdir(parents=True, exist_ok=True)
with OUT_LOG.open("w", encoding="utf-8") as f:
    f.write(f"mhr.dmp strings dump — min run 8\n")
    f.write(f"total runs: {total_runs}\n")
    f.write(f"size: {len(DATA)} bytes\n")
    f.write("---\n")
    for r in runs[:5000]:
        f.write(r + "\n")

OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
with OUT_CSV.open("w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=["kind","name","fragment_first_300"])
    w.writeheader()
    w.writerows(rows)

# Manifest MD
OUT_MD.parent.mkdir(parents=True, exist_ok=True)
with OUT_MD.open("w", encoding="utf-8") as f:
    f.write("# Dump manifest — `mhr.dmp` (Oracle exp 9.2)\n\n")
    f.write(f"- File: `{IN.relative_to(ROOT).as_posix()}`\n")
    f.write(f"- Size: {len(DATA)} bytes\n")
    f.write(f"- ASCII runs ≥ 8 chars: **{total_runs}**\n")
    f.write(f"- DDL/DML header hits: **{len(rows)}**\n\n")
    f.write("Method: byte-level strings extraction + regex classification. Table bodies and bind-value payloads are NOT recovered — those are page-packed binary. This manifest lists every object the dump mentions with a parsable header.\n\n")
    f.write("## Object counts by kind\n\n| Kind | Distinct names | Header hits |\n|---|---|---|\n")
    counts = Counter(r["kind"] for r in rows)
    for k in sorted(objects_by_kind.keys() | counts.keys()):
        f.write(f"| {k} | {len(objects_by_kind.get(k, set()))} | {counts.get(k, 0)} |\n")
    for kind in ("create_table","create_view","create_index","create_sequence","create_trigger","create_procedure","create_function","create_package","create_synonym"):
        names = sorted(objects_by_kind.get(kind, set()))
        if not names: continue
        f.write(f"\n## {kind} ({len(names)})\n\n")
        for n in names:
            f.write(f"- `{n}`\n")
    # Full CREATE TABLE fragments (useful for column list comparison)
    f.write("\n## CREATE TABLE fragments (first 300 chars each)\n\n")
    for r in rows:
        if r["kind"] == "create_table":
            f.write(f"### `{r['name']}`\n\n```sql\n{r['fragment_first_300']}\n```\n\n")
print(f"runs: {total_runs}  ddl_hits: {len(rows)}  tables: {len(objects_by_kind.get('create_table', set()))}  indexes: {len(objects_by_kind.get('create_index', set()))}")
