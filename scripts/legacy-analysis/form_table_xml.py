#!/usr/bin/env python3
"""
Rebuild form-to-table dependency graph from XML-derived blocks + SQL statements.
Supersedes the strings-based 486-edge version.

Edge kinds:
  BLOCK_DATA_SOURCE  — form's block has this table as DMLDataTargetName/QueryDataSourceName
  SQL_SELECT         — a trigger/PU SELECTs this table
  SQL_INSERT         — INSERT into
  SQL_UPDATE         — UPDATE of
  SQL_DELETE         — DELETE from
  SQL_MERGE          — MERGE into
"""
from __future__ import annotations
import csv, re, sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
TABLES = set()
with (ROOT/"analysis/normalized/columns.csv").open() as f:
    for r in csv.DictReader(f):
        TABLES.add(r["table"].upper())

VERB = re.compile(r"\b(SELECT|INSERT|UPDATE|DELETE|MERGE)\b", re.IGNORECASE)
TABLE_RE = re.compile(r"\b(?:FROM|INTO|UPDATE|JOIN|USING)\s+(?:MAHROSA\.)?([A-Z_][A-Z0-9_$]{2,})", re.IGNORECASE)
NOISE = {"DUAL","SELECT","WHERE","ORDER","GROUP","HAVING","SET","VALUES"}

def verb_kind(stmt):
    m = VERB.search(stmt)
    if not m: return None
    v = m.group(1).upper()
    return {"SELECT":"SQL_SELECT","INSERT":"SQL_INSERT","UPDATE":"SQL_UPDATE",
            "DELETE":"SQL_DELETE","MERGE":"SQL_MERGE"}[v]

edges = defaultdict(int)  # (form, table, kind) -> count

with (ROOT/"analysis/normalized/xml-blocks.csv").open() as f:
    for r in csv.DictReader(f):
        bt = (r["base_table"] or "").upper()
        if not bt: continue
        # Base-table field can be a view; keep edge but tag
        kind = "BLOCK_DATA_SOURCE" if bt in TABLES else "BLOCK_DATA_SOURCE_NONTABLE"
        edges[(r["form"], bt, kind)] += 1

with (ROOT/"analysis/normalized/xml-sql-statements.csv").open() as f:
    for r in csv.DictReader(f):
        stmt = r["statement_first_400"]
        kind = verb_kind(stmt)
        if not kind: continue
        tbls = {m.group(1).upper() for m in TABLE_RE.finditer(stmt)} - NOISE
        # Keep hits regardless of whether in TABLES (views etc.)
        for t in tbls:
            edges[(r["form"], t, kind)] += 1

OUT = ROOT/"analysis/dependency-graphs"
OUT.mkdir(parents=True, exist_ok=True)
with (OUT/"form-to-table-xml.csv").open("w", newline="", encoding="utf-8") as f:
    w = csv.writer(f); w.writerow(["form","table","edge_kind","count","in_schema"])
    for (form,tbl,kind), c in sorted(edges.items()):
        w.writerow([form, tbl, kind, c, "yes" if tbl in TABLES else "no"])

# Top tables, top forms
from collections import Counter
tbl_c = Counter(); form_c = Counter(); form_tbl = defaultdict(set)
for (form,tbl,kind), c in edges.items():
    tbl_c[tbl] += c; form_c[form] += c; form_tbl[form].add(tbl)

MD = ROOT/"docs/forms/form-to-table-xml.md"
MD.parent.mkdir(parents=True, exist_ok=True)
with MD.open("w", encoding="utf-8") as f:
    f.write("# Form↔Table dependency graph (XML-derived — authoritative)\n\n")
    f.write(f"**Source:** `analysis/normalized/xml-blocks.csv` + `analysis/normalized/xml-sql-statements.csv`. Supersedes `form-to-table.csv` (strings-derived).\n\n")
    f.write(f"**Edges:** {len(edges)}  \n")
    f.write(f"**Distinct forms:** {len(form_c)}  \n")
    f.write(f"**Distinct tables/views referenced:** {len(tbl_c)}  \n")
    f.write(f"**Edge kinds:** BLOCK_DATA_SOURCE, SQL_SELECT/INSERT/UPDATE/DELETE/MERGE.  \n\n")
    f.write("## Top 30 tables by edge weight\n\n| Table | Edges | In schema |\n|---|---|---|\n")
    for t, c in tbl_c.most_common(30):
        f.write(f"| `{t}` | {c} | {'yes' if t in TABLES else 'no (view or unknown)'} |\n")
    f.write("\n## Top 30 forms by distinct tables touched\n\n| Form | Distinct tables | Total edges |\n|---|---|---|\n")
    for form in sorted(form_tbl.keys(), key=lambda x: -len(form_tbl[x]))[:30]:
        f.write(f"| `{form}` | {len(form_tbl[form])} | {form_c[form]} |\n")

print(f"edges: {len(edges)}; forms: {len(form_c)}; tables: {len(tbl_c)}")
