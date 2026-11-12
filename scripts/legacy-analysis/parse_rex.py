#!/usr/bin/env python3
"""
Parse Oracle Reports REX (Reports Exchange Format — text dump produced by
rwconverter STYPE=rdffile DTYPE=rexfile).

Extracts per report:
  - Report metadata (name, create/mod date)
  - Queries: Q_name + full SELECT statement
  - Columns / DataModel aliases (ALIAS, EXPR, DESC_EXPR)
  - Group hierarchy (G_<name>, OUTER_XML_TAG)
  - Parameters (NAME, NULL_VALUE, DFLT_LBL)
  - PL/SQL formula bodies (if present)

Outputs:
  analysis/normalized/rex-queries.csv
  analysis/normalized/rex-columns.csv
  analysis/normalized/rex-groups.csv
  analysis/normalized/rex-parameters.csv
  analysis/normalized/rex-report-summary.csv
  docs/reports/rex-coverage.md
"""
from __future__ import annotations
import csv, re, sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN = ROOT/"analysis/extracted/reports_rex"

# <<"..." (may span multiple lines) ">>
HEREDOC = re.compile(r'<<"(.*?)">>', re.DOTALL)

def parse_rex(path: Path):
    text = path.read_text(encoding="utf-8", errors="replace")
    stem = path.stem.rstrip("_")
    report = {"name": stem, "file": path.name, "size": path.stat().st_size,
              "create_date": None, "mod_date": None}
    # DEFINE DEFAULT_REPORT_REPORT or similar sets metadata early.
    m = re.search(r'CREATE_DATE\s*=\s*<<"([^"]*)">>', text)
    if m: report["create_date"] = m.group(1)
    m = re.search(r'MOD_DATE\s*=\s*<<"([^"]*)">>', text)
    if m: report["mod_date"] = m.group(1)

    # Queries: each SRW2_QUERY block has NAME=<<"Q_x">> and a QUERYLFID followed by heredoc SELECT
    queries = []
    for m in re.finditer(r'NAME\s*=\s*<<"(Q_[^"]+)">>.*?QUERYLFID\s*=\s*\(TLONG\)\s*<<"(.*?)">>', text, re.DOTALL):
        queries.append({"report": stem, "q_name": m.group(1), "sql": m.group(2).strip()})

    # Columns: ALIAS, EXPR, DESC_EXPR triplets near each other
    columns = []
    cur = {"alias": None, "expr": None, "desc_expr": None}
    # Walk line by line, emit when ALIAS/EXPR/DESC_EXPR seen consecutively
    for line in text.splitlines():
        for key, keyname in (("ALIAS","alias"), ("EXPR","expr"), ("DESC_EXPR","desc_expr")):
            mm = re.match(rf'\s*{key}\s*=\s*<<"([^"]*)">>', line)
            if mm:
                cur[keyname] = mm.group(1)
                if all(cur.values()):
                    columns.append({"report": stem, **cur})
                    cur = {"alias": None, "expr": None, "desc_expr": None}

    # Groups
    groups = []
    for m in re.finditer(r'NAME\s*=\s*<<"(G_[^"]+)">>.*?XML_TAG\s*=\s*<<"([^"]+)">>', text, re.DOTALL):
        groups.append({"report": stem, "group": m.group(1), "xml_tag": m.group(2)})

    # Parameters: SRW2_PARAM has NAME <<"...">> NULL_VALUE / DFLT_LBL
    params = []
    for m in re.finditer(r'DEFINE\s+SRW2_PARAM[^D]*?NAME\s*=\s*<<"([^"]+)">>(?:[^D]*?NULL_VALUE\s*=\s*<<"([^"]*)">>)?(?:[^D]*?DFLT_LBL\s*=\s*<<"([^"]*)">>)?', text, re.DOTALL):
        params.append({"report": stem, "name": m.group(1), "null_value": m.group(2) or "", "label": m.group(3) or ""})

    return report, queries, columns, groups, params

all_reports, all_q, all_c, all_g, all_p = [], [], [], [], []
for rex in sorted(IN.glob("*.rex")):
    r, q, c, g, p = parse_rex(rex)
    all_reports.append(r); all_q.extend(q); all_c.extend(c); all_g.extend(g); all_p.extend(p)

OUT = ROOT/"analysis/normalized"
with (OUT/"rex-report-summary.csv").open("w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=["name","file","size","create_date","mod_date"])
    w.writeheader(); w.writerows(all_reports)
with (OUT/"rex-queries.csv").open("w", newline="", encoding="utf-8") as f:
    w = csv.writer(f); w.writerow(["report","q_name","sql_length","sql_first_400","tables"])
    TBL_RE = re.compile(r"\b(?:FROM|JOIN|UPDATE|INTO)\s+([A-Z_][A-Z0-9_$]*)", re.IGNORECASE)
    for q in all_q:
        tbls = sorted({m.group(1).upper() for m in TBL_RE.finditer(q["sql"])})
        w.writerow([q["report"], q["q_name"], len(q["sql"]),
                    q["sql"][:400].replace("\n"," "), ";".join(tbls)])
with (OUT/"rex-columns.csv").open("w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=["report","alias","expr","desc_expr"])
    w.writeheader(); w.writerows(all_c)
with (OUT/"rex-groups.csv").open("w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=["report","group","xml_tag"])
    w.writeheader(); w.writerows(all_g)
with (OUT/"rex-parameters.csv").open("w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=["report","name","null_value","label"])
    w.writeheader(); w.writerows(all_p)

# Markdown
TABLES_IN_SCHEMA = set()
try:
    with (ROOT/"analysis/normalized/columns.csv").open() as f:
        for r in csv.DictReader(f):
            TABLES_IN_SCHEMA.add(r["table"].upper())
except FileNotFoundError:
    pass

MD = ROOT/"docs/reports/rex-coverage.md"
MD.parent.mkdir(parents=True, exist_ok=True)
with MD.open("w", encoding="utf-8") as f:
    f.write(f"# Reports extraction coverage (REX via rwconverter 12.2.1.19)\n\n")
    f.write(f"**Source:** `analysis/extracted/reports_rex/*.rex`. Produced by `C:\\Oracle\\Middleware\\Oracle_Home\\bin\\rwconverter.exe STYPE=rdffile DTYPE=rexfile`. Parsed by `scripts/legacy-analysis/parse_rex.py`.\n\n")
    f.write(f"**Reports converted:** {len(all_reports)} (from 25 `.rdf` originals; 1 collision).  \n")
    f.write(f"**Queries recovered:** {len(all_q)}  \n")
    f.write(f"**Column aliases:** {len(all_c)}  \n")
    f.write(f"**Groups:** {len(all_g)}  \n")
    f.write(f"**Parameters:** {len(all_p)}\n\n")
    tbl_hits = Counter()
    TBL_RE = re.compile(r"\b(?:FROM|JOIN|UPDATE|INTO)\s+([A-Z_][A-Z0-9_$]*)", re.IGNORECASE)
    for q in all_q:
        for m in TBL_RE.finditer(q["sql"]):
            t = m.group(1).upper()
            if t not in {"DUAL","SELECT","WHERE","ORDER","GROUP","HAVING","SET"}:
                tbl_hits[t] += 1
    f.write("## Top tables referenced across reports\n\n| Table | In schema | References |\n|---|---|---|\n")
    for t, c in tbl_hits.most_common(30):
        f.write(f"| `{t}` | {'yes' if t in TABLES_IN_SCHEMA else 'no'} | {c} |\n")
    f.write("\n## Per-report summary\n\n| Report | Queries | Columns | Groups | Params | Tables |\n|---|---|---|---|---|---|\n")
    q_by_r = defaultdict(list); c_by_r = Counter(); g_by_r = Counter(); p_by_r = Counter(); t_by_r = defaultdict(set)
    for q in all_q:
        q_by_r[q["report"]].append(q)
        for m in TBL_RE.finditer(q["sql"]):
            t = m.group(1).upper()
            if t not in {"DUAL","SELECT","WHERE","ORDER","GROUP","HAVING","SET"}:
                t_by_r[q["report"]].add(t)
    for c in all_c: c_by_r[c["report"]] += 1
    for g in all_g: g_by_r[g["report"]] += 1
    for p in all_p: p_by_r[p["report"]] += 1
    for r in sorted(all_reports, key=lambda x: x["name"]):
        n = r["name"]
        tbls = ";".join(sorted(t_by_r[n]))
        f.write(f"| `{n}` | {len(q_by_r[n])} | {c_by_r[n]} | {g_by_r[n]} | {p_by_r[n]} | {tbls[:60]} |\n")

print(f"reports: {len(all_reports)}; queries: {len(all_q)}; columns: {len(all_c)}; groups: {len(all_g)}; params: {len(all_p)}")
