#!/usr/bin/env python3
"""
Parse Oracle Reports (.rdf/.rep) strings dumps for SQL fragments.

Read-only. For each file under analysis/extracted/reports/**/*.strings.txt,
reconstruct candidate SELECT statements by scanning ASCII + UCS-2 strings
for lines that start a SQL keyword and gluing contiguous runs where a tail
character looks SQL-ish (letter, comma, paren, dot, =).

Also records candidate table references found inside SELECT/FROM/WHERE
clauses, intersected against the 192 authoritative tables.

Outputs:
  analysis/normalized/report-sql.csv    # one row per candidate statement
  docs/reports/report-sql-coverage.md
"""
from __future__ import annotations

import csv
import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN_DIR = ROOT / "analysis" / "extracted" / "reports"
OUT_CSV = ROOT / "analysis" / "normalized" / "report-sql.csv"
OUT_MD  = ROOT / "docs" / "reports" / "report-sql-coverage.md"

SQL_START = re.compile(r"^\s*(SELECT|WITH)\b", re.IGNORECASE)
TABLE_REF = re.compile(r"\b(FROM|JOIN|INTO|UPDATE)\s+([A-Z][A-Z0-9_]{2,})\b")
PARAM_REF = re.compile(r":([A-Z_][A-Z0-9_]*)", re.IGNORECASE)

# Load authoritative table catalog
TABLES = set()
with (ROOT / "analysis" / "normalized" / "svg-schema.csv").open() as f:
    for r in csv.DictReader(f):
        if r["kind"] == "table":
            TABLES.add(r["text"].upper())

def extract_statements(lines: list[str]) -> list[str]:
    """Collect candidate SELECT/WITH statements. Oracle Reports often puts each
    clause on its own line. Glue contiguous non-empty lines following a SQL
    start marker until a blank or a line that looks like structural metadata
    (ALL CAPS NO SPACES, or starts with %, @, #, or is a version marker)."""
    out = []
    i = 0
    while i < len(lines):
        if SQL_START.match(lines[i]):
            buf = [lines[i].strip()]
            j = i + 1
            while j < len(lines):
                nxt = lines[j].strip()
                if not nxt:
                    break
                if re.match(r"^[A-Z0-9_$]+$", nxt) and len(nxt) <= 20:
                    break
                if nxt.startswith(("%", "@", "#")):
                    break
                if re.match(r"^(ROS|REP|FOR)\.\d+", nxt):
                    break
                buf.append(nxt)
                if len(" ".join(buf)) > 4000:
                    break
                j += 1
            stmt = " ".join(buf)
            if len(stmt) > 20 and "FROM" in stmt.upper():
                out.append(stmt)
            i = j
        else:
            i += 1
    return out

def main() -> int:
    rows = []
    per_report: dict[str, dict] = {}
    all_params = set()
    all_tables_in_reports: set[str] = set()

    for p in sorted(IN_DIR.rglob("*.strings.txt")):
        src = None
        with p.open("r", encoding="utf-8", errors="replace") as f:
            raw = f.read()
        for line in raw.split("\n", 20):
            if line.startswith("src="):
                src = line[4:].strip()
                break
        _, _, ascii_body = raw.partition("===ASCII===\n")
        ascii_body, _, ucs2_body = ascii_body.partition("===UCS2-LE===\n")
        combined_lines = ascii_body.split("\n") + ucs2_body.split("\n")
        stmts = extract_statements(combined_lines)

        tbls_seen: set[str] = set()
        params_seen: set[str] = set()
        for s in stmts:
            for m in TABLE_REF.finditer(s):
                name = m.group(2).upper()
                if name in TABLES:
                    tbls_seen.add(name)
            for m in PARAM_REF.finditer(s):
                params_seen.add(m.group(1).upper())

        all_tables_in_reports |= tbls_seen
        all_params |= params_seen

        per_report[src or p.name] = {
            "statements": len(stmts),
            "tables": sorted(tbls_seen),
            "params": sorted(params_seen),
            "sample": stmts[0][:300] if stmts else "",
        }
        for i, s in enumerate(stmts):
            rows.append({
                "report": src or p.name,
                "stmt_index": i,
                "length": len(s),
                "tables_matched": ";".join(sorted({m.group(2).upper() for m in TABLE_REF.finditer(s) if m.group(2).upper() in TABLES})),
                "params": ";".join(sorted({m.group(1).upper() for m in PARAM_REF.finditer(s)})),
                "sample_first_300": s[:300],
            })

    OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    with OUT_CSV.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["report","stmt_index","length","tables_matched","params","sample_first_300"])
        w.writeheader()
        w.writerows(rows)

    OUT_MD.parent.mkdir(parents=True, exist_ok=True)
    with OUT_MD.open("w", encoding="utf-8") as f:
        f.write("# Report SQL coverage — strings-derived\n\n")
        f.write(f"Reports scanned: **{len(per_report)}**  \n")
        f.write(f"Candidate SELECT/WITH statements captured: **{len(rows)}**  \n")
        f.write(f"Distinct authoritative tables referenced: **{len(all_tables_in_reports)}**  \n")
        f.write(f"Distinct bind-parameter names (`:name`): **{len(all_params)}**\n\n")
        f.write("Evidence: **INFERRED**. Strings re-assembly of `.rdf`/`.rep` bytes is lossy; precise statement boundaries and whitespace cannot be recovered. Use this as a starting map; final verification requires `rwconverter` (BLK-007).\n\n")

        f.write("## Tables referenced by reports (distinct, matched against authoritative 192)\n\n")
        for t in sorted(all_tables_in_reports):
            f.write(f"- `{t}`\n")

        f.write(f"\n## Bind parameters ({len(all_params)})\n\n")
        for p in sorted(all_params):
            f.write(f"- `:{p}`\n")

        f.write("\n## Per-report summary\n\n")
        f.write("| Report | Stmts | Tables | Params |\n|---|---|---|---|\n")
        for rpt, info in sorted(per_report.items()):
            tbls = ", ".join(info["tables"][:4]) + (" …" if len(info["tables"])>4 else "")
            prms = ", ".join(info["params"][:4]) + (" …" if len(info["params"])>4 else "")
            f.write(f"| `{rpt}` | {info['statements']} | {tbls} | {prms} |\n")
        f.write(f"\nFull detail: `{OUT_CSV.relative_to(ROOT).as_posix()}`\n")

    print(f"scanned {len(per_report)} report dumps, {len(rows)} candidate statements, {len(all_tables_in_reports)} tables, {len(all_params)} params")
    return 0

if __name__ == "__main__":
    sys.exit(main())
