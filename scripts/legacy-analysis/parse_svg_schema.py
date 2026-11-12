#!/usr/bin/env python3
"""
Extract table/column text nodes from the DrawSQL-exported SVG schema diagram.

Read-only. Input: `المحروسة/mahrosa-all (1).svg`.
Output:
  analysis/normalized/svg-schema.csv  (per-text-node)
  docs/database/svg-schema-extract.md

Not a full SVG geometric parser — treats <text>…</text> content as
candidate table or column labels, strips entities, classifies by heuristic:
  - ALL-UPPERCASE with underscores, length > 2  → likely TABLE
  - lowercase with underscores                   → likely COLUMN
  - mixed / numeric                              → NOTE
"""
from __future__ import annotations

import csv
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN_SVG = ROOT / "المحروسة" / "mahrosa-all (1).svg"
OUT_CSV = ROOT / "analysis" / "normalized" / "svg-schema.csv"
OUT_MD  = ROOT / "docs" / "database" / "svg-schema-extract.md"

NS = {"svg": "http://www.w3.org/2000/svg"}
WORD_RE = re.compile(r"^[A-Za-z_][A-Za-z0-9_$]*$")

def classify(text: str) -> str:
    if not text:
        return "empty"
    if not WORD_RE.match(text):
        return "note"
    if text.isupper() and "_" in text:
        return "table_candidate"
    if text.islower() and "_" in text:
        return "column_candidate"
    if text.isupper():
        return "table_candidate"
    if text.islower():
        return "column_candidate"
    return "mixed"

def main() -> int:
    if not IN_SVG.exists():
        print(f"SVG not found: {IN_SVG}", file=sys.stderr)
        return 2
    tree = ET.parse(IN_SVG)
    root = tree.getroot()
    rows = []
    XHTML = "{http://www.w3.org/1999/xhtml}"
    SVG   = "{http://www.w3.org/2000/svg}"

    # Tables = <section> each holds a <strong>table_name</strong>, then column <span>s.
    tables: list[dict] = []
    for section in root.iter(f"{XHTML}section"):
        strong = section.find(f".//{XHTML}strong")
        tbl_name = (strong.text or "").strip() if strong is not None else ""
        columns = []
        # column rows are <span> siblings containing name/type text
        for span in section.iter(f"{XHTML}span"):
            txt = "".join(span.itertext()).strip()
            if not txt or txt == tbl_name:
                continue
            columns.append(txt)
        tables.append({"table": tbl_name, "columns": columns})

    # Flatten for CSV: explicit table row per section, column rows under it.
    for t in tables:
        tname = t["table"]
        if tname:
            rows.append({"kind": "table", "text": tname, "length": len(tname)})
        for c in t["columns"]:
            rows.append({"kind": "column", "text": f"{tname}.{c}" if tname else c, "length": len(c)})

    # Count FK edges = SVG <path> with marker-end
    fk_edges = sum(1 for p in root.iter(f"{SVG}path") if p.get("marker-end"))

    distinct_tables = sorted({t["table"] for t in tables if t["table"]})

    OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    OUT_MD.parent.mkdir(parents=True, exist_ok=True)

    with OUT_CSV.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["kind", "text", "length"])
        w.writeheader()
        w.writerows(rows)

    by_kind: dict[str, list[str]] = {}
    for r in rows:
        by_kind.setdefault(r["kind"], []).append(r["text"])

    with OUT_MD.open("w", encoding="utf-8") as f:
        f.write(f"# SVG schema extract\n\nSource: `{IN_SVG.relative_to(ROOT).as_posix()}`\n\n")
        f.write(f"Total `<text>` nodes: **{len(rows)}**\n\n")
        f.write("## Counts\n\n| Kind | Count |\n|---|---|\n")
        for k, v in sorted(by_kind.items()):
            f.write(f"| {k} | {len(v)} |\n")

        f.write(f"\n## Foreign-key edges (SVG `<path marker-end>` count): **{fk_edges}**\n\n")
        f.write(f"## Tables (from `<section><strong>`): **{len(distinct_tables)}**\n\n")
        for t in distinct_tables:
            cols = next((x["columns"] for x in tables if x["table"] == t), [])
            f.write(f"- `{t}` ({len(cols)} columns)\n")

    print(f"parsed SVG -> {len(rows)} text nodes, {len({r['text'] for r in rows if r['kind']=='table_candidate'})} table candidates")
    return 0

if __name__ == "__main__":
    sys.exit(main())
