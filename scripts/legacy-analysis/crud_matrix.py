#!/usr/bin/env python3
"""
CRUD matrix per table.
Reads analysis/dependency-graphs/form-to-table-xml.csv, pivots to table × form ×
{SELECT, INSERT, UPDATE, DELETE, MERGE, BLOCK_DATA_SOURCE} counts.

Outputs:
  analysis/dependency-graphs/crud-matrix.csv
  docs/database/crud-matrix.md
"""
from __future__ import annotations
import csv, sys
from collections import defaultdict, Counter
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN = ROOT/"analysis/dependency-graphs/form-to-table-xml.csv"

# table -> form -> op -> count
cells: dict[str,dict[str,Counter]] = defaultdict(lambda: defaultdict(Counter))
schema_tables = set()
with IN.open() as f:
    for r in csv.DictReader(f):
        tbl = r["table"]; form = r["form"]; kind = r["edge_kind"]; c = int(r["count"])
        op = kind.replace("SQL_","").replace("BLOCK_DATA_SOURCE","BLOCK").replace("_NONTABLE","")
        cells[tbl][form][op] += c
        if r["in_schema"] == "yes": schema_tables.add(tbl)

OPS = ["SELECT","INSERT","UPDATE","DELETE","MERGE","BLOCK"]
OUT = ROOT/"analysis/dependency-graphs"
with (OUT/"crud-matrix.csv").open("w", newline="", encoding="utf-8") as f:
    w = csv.writer(f)
    w.writerow(["table","form","in_schema"] + OPS + ["total"])
    for tbl in sorted(cells):
        for form in sorted(cells[tbl]):
            row = [tbl, form, "yes" if tbl in schema_tables else "no"]
            counts = [cells[tbl][form].get(op, 0) for op in OPS]
            row.extend(counts)
            row.append(sum(counts))
            w.writerow(row)

# Per-table writers vs readers
def ops_sum(tbl, which): return sum(cells[tbl][f].get(op,0) for f in cells[tbl] for op in which)
WRITE_OPS = ["INSERT","UPDATE","DELETE","MERGE"]
READ_OPS  = ["SELECT","BLOCK"]

MD = ROOT/"docs/database/crud-matrix.md"
MD.parent.mkdir(parents=True, exist_ok=True)
with MD.open("w", encoding="utf-8") as f:
    f.write("# CRUD matrix (form × table × operation)\n\n")
    f.write(f"**Source:** `analysis/dependency-graphs/form-to-table-xml.csv`. Pivoted by `scripts/legacy-analysis/crud_matrix.py`.\n\n")
    f.write(f"**Tables covered:** {len(cells)}  \n")
    f.write(f"**In-schema tables:** {sum(1 for t in cells if t in schema_tables)}\n\n")
    f.write("## Per-table write-vs-read summary (top 40 by total activity)\n\n")
    f.write("| Table | In schema | Writers (forms) | Readers (forms) | Total writes | Total reads | Primary writer |\n|---|---|---|---|---|---|---|\n")
    rows = []
    for tbl in cells:
        writers = {f for f in cells[tbl] if any(cells[tbl][f].get(op,0) for op in WRITE_OPS)}
        readers = {f for f in cells[tbl] if any(cells[tbl][f].get(op,0) for op in READ_OPS)}
        tw = ops_sum(tbl, WRITE_OPS); tr = ops_sum(tbl, READ_OPS)
        primary = max(cells[tbl].items(),
                      key=lambda kv: sum(kv[1].get(op,0) for op in WRITE_OPS),
                      default=(None,None))[0] if writers else "—"
        rows.append((tbl, writers, readers, tw, tr, primary, tw+tr))
    rows.sort(key=lambda x: -x[6])
    for tbl, writers, readers, tw, tr, prim, tot in rows[:40]:
        in_s = "yes" if tbl in schema_tables else "no"
        f.write(f"| `{tbl}` | {in_s} | {len(writers)} | {len(readers)} | {tw} | {tr} | `{prim or '—'}` |\n")

    f.write("\n## Full per-table detail (top 20 tables)\n\n")
    for tbl, writers, readers, tw, tr, prim, _ in rows[:20]:
        f.write(f"\n### `{tbl}`  (in_schema={'yes' if tbl in schema_tables else 'no'}; writes {tw}, reads {tr})\n\n")
        f.write("| Form | " + " | ".join(OPS) + " |\n")
        f.write("|---" * (len(OPS)+1) + "|\n")
        forms = sorted(cells[tbl].keys(),
                       key=lambda fn: -sum(cells[tbl][fn].get(op,0) for op in OPS))
        for fn in forms:
            row = [f"`{fn}`"] + [str(cells[tbl][fn].get(op,0)) for op in OPS]
            f.write("| " + " | ".join(row) + " |\n")

    f.write("\n## Write-only tables (potential logs / audit)\n\n")
    f.write("Tables with writes but no reads anywhere in forms source. Prime candidates for append-only logs.\n\n")
    f.write("| Table | In schema | Writers | Writes |\n|---|---|---|---|\n")
    for tbl, writers, readers, tw, tr, _, _ in rows:
        if tw > 0 and tr == 0:
            f.write(f"| `{tbl}` | {'yes' if tbl in schema_tables else 'no'} | {len(writers)} | {tw} |\n")

    f.write("\n## Read-only tables (lookups / masters)\n\n")
    f.write("Tables with reads but no writes in forms. Likely master/reference data populated by seed scripts or DB-side logic.\n\n")
    f.write("| Table | In schema | Readers | Reads |\n|---|---|---|---|\n")
    for tbl, writers, readers, tw, tr, _, _ in rows:
        if tr > 0 and tw == 0:
            f.write(f"| `{tbl}` | {'yes' if tbl in schema_tables else 'no'} | {len(readers)} | {tr} |\n")

print(f"tables: {len(cells)}; write-only: {sum(1 for _,_,_,tw,tr,_,_ in rows if tw>0 and tr==0)}; read-only: {sum(1 for _,_,_,tw,tr,_,_ in rows if tr>0 and tw==0)}")
