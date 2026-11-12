#!/usr/bin/env python3
"""
Parse plain-text SQL extracts in the Casheer repo.

Read-only. Scans configured text files, extracts CREATE TABLE / VIEW /
TRIGGER / INDEX / SEQUENCE / PROCEDURE / FUNCTION / PACKAGE / ALTER TABLE
statements with their source location, and emits:

  analysis/normalized/sql-objects.csv
  docs/database/sql-text-extracts.md

Not a full SQL parser — matches on header patterns only, enough to inventory
object names, kinds, source file, line number.
"""
from __future__ import annotations

import csv
import re
import sys
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()

SOURCES = [
    "M_CASHEAR/SQL/views.txt",
    "M_CASHEAR/SQL/trigger.txt",
    "M_CASHEAR/SQL/sql1.txt",
    "M_CASHEAR/SQL/yom_view.txt",
    "M_CASHEAR/SQL/serry.txt",
    "M_CASHEAR/SQL/Cashers.txt",
    "M_CASHEAR/SQL/Reception.txt",
    "M_CASHEAR/SQL/1.txt",
    "M_CASHEAR/inv_update.sql",
    "M_CASHEAR/doc_new/new_stat_view.txt",
    "M_CASHEAR/vist.txt",
]

PATTERNS = [
    ("table",     re.compile(r"\bcreate\s+(?:global\s+temporary\s+)?table\s+([a-zA-Z_][\w$]*)\s*\(", re.IGNORECASE)),
    ("view",      re.compile(r"\bcreate\s+(?:or\s+replace\s+)?(?:force\s+)?view\s+([a-zA-Z_][\w$]*)\s", re.IGNORECASE)),
    ("mview",     re.compile(r"\bcreate\s+materialized\s+view\s+([a-zA-Z_][\w$]*)", re.IGNORECASE)),
    ("trigger",   re.compile(r"\bcreate\s+(?:or\s+replace\s+)?trigger\s+([a-zA-Z_][\w$]*)", re.IGNORECASE)),
    ("sequence",  re.compile(r"\bcreate\s+sequence\s+([a-zA-Z_][\w$]*)", re.IGNORECASE)),
    ("index",     re.compile(r"\bcreate\s+(?:unique\s+)?index\s+([a-zA-Z_][\w$]*)", re.IGNORECASE)),
    ("procedure", re.compile(r"\bcreate\s+(?:or\s+replace\s+)?procedure\s+([a-zA-Z_][\w$]*)", re.IGNORECASE)),
    ("function",  re.compile(r"\bcreate\s+(?:or\s+replace\s+)?function\s+([a-zA-Z_][\w$]*)", re.IGNORECASE)),
    ("package",   re.compile(r"\bcreate\s+(?:or\s+replace\s+)?package(?:\s+body)?\s+([a-zA-Z_][\w$]*)", re.IGNORECASE)),
    ("alter",     re.compile(r"\balter\s+table\s+([a-zA-Z_][\w$]*)", re.IGNORECASE)),
    ("desc",      re.compile(r"^SQL>\s*desc(?:ribe)?\s+([a-zA-Z_][\w$]*)", re.IGNORECASE)),
    # trigger.txt uses the Casheer convention: `<tablename>-------------------------`
    ("trigger_hdr", re.compile(r"^([a-zA-Z_][\w$]*)\s*-{10,}\s*$")),
    ("trigger_cmt", re.compile(r"-{3,}\s*(?:before|after|instead of)\s+(insert|update|delete|insert or update|insert or delete|update or delete).*?(\S+)?\s*-{3,}", re.IGNORECASE)),
]

def main() -> int:
    rows = []
    insert_tokens = []
    tables_mentioned = set()

    for rel in SOURCES:
        p = ROOT / rel
        if not p.exists():
            rows.append({"source": rel, "line": 0, "kind": "missing", "name": "", "note": "file not in repo"})
            continue
        with p.open("r", encoding="utf-8", errors="replace") as f:
            lines = f.readlines()
        for i, line in enumerate(lines, 1):
            for kind, rgx in PATTERNS:
                m = rgx.search(line)
                if not m:
                    continue
                if kind == "trigger_hdr":
                    # Casheer trigger.txt — <table>---...
                    name = m.group(1)
                    tables_mentioned.add(name.lower())
                    rows.append({"source": rel, "line": i, "kind": "trigger-section-for-table", "name": name, "note": line.rstrip()})
                elif kind == "trigger_cmt":
                    rows.append({"source": rel, "line": i, "kind": "trigger-comment", "name": m.group(1).upper(), "note": line.rstrip()[:200]})
                else:
                    name = m.group(1)
                    rows.append({"source": rel, "line": i, "kind": kind, "name": name, "note": ""})
                    if kind in {"table", "view", "mview", "alter"}:
                        tables_mentioned.add(name.lower())

    OUT_CSV = ROOT / "analysis" / "normalized" / "sql-objects.csv"
    OUT_MD  = ROOT / "docs" / "database" / "sql-text-extracts.md"
    OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    OUT_MD.parent.mkdir(parents=True, exist_ok=True)

    with OUT_CSV.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["source", "line", "kind", "name", "note"])
        w.writeheader()
        w.writerows(rows)

    kinds = {}
    for r in rows:
        kinds.setdefault(r["kind"], []).append(r)

    with OUT_MD.open("w", encoding="utf-8") as f:
        f.write("# SQL text extracts — object inventory\n\n")
        f.write(f"Sources parsed ({len(SOURCES)}):\n\n")
        for s in SOURCES:
            f.write(f"- `{s}`\n")
        f.write("\n## Object counts by kind\n\n| Kind | Count |\n|---|---|\n")
        for k in sorted(kinds):
            f.write(f"| {k} | {len(kinds[k])} |\n")
        f.write(f"\n**Distinct table/view/mview names referenced:** {len(tables_mentioned)}\n\n")
        f.write("## Tables / views / mviews (distinct names)\n\n")
        for name in sorted(tables_mentioned):
            f.write(f"- `{name}`\n")
        f.write("\n## Per-source summary\n\n")
        by_source: dict[str, list] = {}
        for r in rows:
            by_source.setdefault(r["source"], []).append(r)
        for s in SOURCES:
            rs = by_source.get(s, [])
            f.write(f"### `{s}`  ({len(rs)} hits)\n\n")
            if not rs:
                f.write("Not in repo or no matches.\n\n")
                continue
            f.write("| Line | Kind | Name |\n|---|---|---|\n")
            for r in rs[:200]:
                f.write(f"| {r['line']} | {r['kind']} | `{r['name']}` |\n")
            if len(rs) > 200:
                f.write(f"| ... | ({len(rs)-200} more) | |\n")
            f.write("\n")

    print(f"parsed {len(SOURCES)} files, {len(rows)} hits, {len(tables_mentioned)} distinct object names -> {OUT_CSV}")
    return 0

if __name__ == "__main__":
    sys.exit(main())
