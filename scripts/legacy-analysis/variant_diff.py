#!/usr/bin/env python3
"""
Per-file variant analysis for the SERY and TAKE_AWAY families.
Picks richest file in each family (by SQL statement count + block count +
trigger count) as the likely production candidate, flags older/pruned siblings.

Reads each XML directly (not the summary CSV) to attribute per FILE not per
internal FormModule.Name.
"""
from __future__ import annotations
import csv, sys
from collections import defaultdict
from pathlib import Path
import xml.etree.ElementTree as ET

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN = ROOT/"analysis/extracted/forms_xml"
NS = "{http://xmlns.oracle.com/Forms}"

def scan(xml):
    tree = ET.parse(xml); root = tree.getroot()
    form = next((e for e in root.iter(f"{NS}FormModule")), None)
    if form is None: return None
    blocks = list(form.iter(f"{NS}Block"))
    items = list(form.iter(f"{NS}Item"))
    trigs = list(form.iter(f"{NS}Trigger"))
    pus = list(form.iter(f"{NS}ProgramUnit"))
    trig_body_bytes = sum(len(t.get("TriggerText","") or "") for t in trigs)
    pu_body_bytes = sum(len(p.get("ProgramUnitText","") or "") for p in pus)
    # SQL statement count from TriggerText
    sql = 0
    for t in trigs:
        body = t.get("TriggerText","") or ""
        sql += body.upper().count("SELECT ") + body.upper().count("INSERT ") + body.upper().count("UPDATE ") + body.upper().count("DELETE ")
    return {
        "xml": xml.name,
        "internal_name": form.get("Name",""),
        "blocks": len(blocks), "items": len(items), "triggers": len(trigs),
        "program_units": len(pus),
        "trig_body_bytes": trig_body_bytes, "pu_body_bytes": pu_body_bytes,
        "sql_approx": sql,
        "size": xml.stat().st_size,
    }

def family_of(xml_name):
    n = xml_name.lower()
    if n.startswith("sery"): return "SERY"
    if n.startswith("take_away") or n.startswith("takeaway"): return "TAKE_AWAY"
    return None

families = defaultdict(list)
for x in sorted(IN.glob("*_fmb.xml")):
    fam = family_of(x.name)
    if not fam: continue
    r = scan(x)
    if r: families[fam].append(r)

MD = ROOT/"docs/forms/variant-decision.md"
MD.parent.mkdir(parents=True, exist_ok=True)
with MD.open("w", encoding="utf-8") as f:
    f.write("# Form-variant decision support (BLK-008 technical resolution)\n\n")
    f.write("**Source:** per-file XML analysis of every `sery*` and `take_away*` module. One row per file.\n\n")
    f.write("**Verdict signals:**\n")
    f.write("- `incoming` from `analysis/dependency-graphs/form-to-form.csv` (literal `CALL_FORM('name')` by internal module name).\n")
    f.write("- `richness` = SQL statements + trigger-body bytes. Highest = latest-evolved candidate.\n")
    f.write("- `size` = raw XML size on disk (larger ≈ more content, loosely).\n\n")
    f.write("**Important caveat:** incoming==0 does NOT mean dormant. Forms launched from the application menu (not `CALL_FORM`) have zero incoming edges by construction. The 14 zero-incoming forms are probably the menu-reachable set. Final verdict requires business-owner confirmation on which `.fmx` each menu entry invokes at runtime.\n\n")
    # Load incoming counts
    incoming = {}
    f2f = ROOT/"analysis/dependency-graphs/form-to-form.csv"
    if f2f.exists():
        for r in csv.DictReader(f2f.open()):
            incoming[r["callee"]] = incoming.get(r["callee"], 0) + int(r["count"])
    for fam in sorted(families):
        rows = families[fam]
        rows.sort(key=lambda r: (-(r["sql_approx"] + r["trig_body_bytes"]//1000), r["xml"]))
        f.write(f"\n## Family: `{fam}` — {len(rows)} files\n\n")
        f.write("| XML | Internal name | Blocks | Items | Trigs | SQL≈ | Trig body (KB) | Size (KB) | Incoming CALL_FORM |\n|---|---|---|---|---|---|---|---|---|\n")
        for r in rows:
            internal = r["internal_name"].upper()
            # map internal name to call-graph key (XML stem upper)
            stem = r["xml"].replace("_fmb.xml","")
            import re
            stem_up = re.sub(r"__[0-9a-f]{6}$", "", stem).upper()
            inc = incoming.get(stem_up, 0)
            f.write(f"| `{r['xml']}` | `{internal}` | {r['blocks']} | {r['items']} | {r['triggers']} | {r['sql_approx']} | {r['trig_body_bytes']//1024} | {r['size']//1024} | {inc} |\n")
        # Verdict
        top = rows[0]
        f.write(f"\n**Richest file:** `{top['xml']}` (SQL≈{top['sql_approx']}, trig body {top['trig_body_bytes']//1024} KB). ")
        f.write("This is the likely LATEST VERSION on disk. Whether it is the one actually deployed depends on the runtime menu wiring.\n")

    f.write("\n## Recommended action\n\n")
    f.write("1. Ask business owner / operator which `.fmx` each menu entry targets in production.\n")
    f.write("2. For families where the deployed file is the richest one: delete lesser copies (after an off-repo archive of the full `forms_xml/` dump).\n")
    f.write("3. For families where the deployed file is NOT the richest: investigate why development froze on an older version — pending migration, unresolved bug, or abandoned refactor.\n")

# print verdict
for fam in sorted(families):
    rows = families[fam]
    rows.sort(key=lambda r: -(r["sql_approx"] + r["trig_body_bytes"]//1000))
    print(f"{fam}: richest = {rows[0]['xml']} (SQL≈{rows[0]['sql_approx']}, trig {rows[0]['trig_body_bytes']//1024}KB)")
