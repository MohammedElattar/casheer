#!/usr/bin/env python3
"""
Form-to-report dependency graph from XML trigger bodies.

Scans every trigger + PU body for:
  RUN_PRODUCT(REPORTS, 'name', ...)       (Forms 6i)
  RUN_REPORT_OBJECT(...) with report_file (Forms 9i+)
  Direct literal <reportname>.rdf references

Cross-references report names against the 24-report REX catalog to determine
which calls point at recovered reports vs missing ones.
"""
from __future__ import annotations
import csv, re, sys
from collections import defaultdict, Counter
from pathlib import Path
import xml.etree.ElementTree as ET

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN_XML = ROOT/"analysis/extracted/forms_xml"
NS = "{http://xmlns.oracle.com/Forms}"

# Load REX report names
REX_NAMES = set()
try:
    with (ROOT/"analysis/normalized/rex-report-summary.csv").open() as f:
        for r in csv.DictReader(f): REX_NAMES.add(r["name"].upper())
except FileNotFoundError:
    pass

PAT_RUNPROD = re.compile(r"RUN_PRODUCT\s*\(\s*REPORTS\s*,\s*'([^']+)'", re.IGNORECASE)
PAT_RUNPROD_ANY = re.compile(r"RUN_PRODUCT\s*\([^)]*'([^']+\.rdf)'", re.IGNORECASE)
PAT_RDF   = re.compile(r"'([^']*?)\.rdf'", re.IGNORECASE)
PAT_REPFILE = re.compile(r"\.REPORT_FILENAME\s*,\s*'([^']+)'", re.IGNORECASE)
PAT_RUNREP = re.compile(r"RUN_REPORT_OBJECT\s*\(\s*(\w+)", re.IGNORECASE)

def decode(raw): return (raw or "").replace("&#10;","\n").replace("&#9;","\t")

def normalize(s):
    s = s.strip().strip('"').strip("'").replace("\\","/").split("/")[-1]
    s = re.sub(r"\.(rdf|rep|RDF|REP)$", "", s)
    return s.upper()

edges = defaultdict(lambda: {"count":0, "sites":set(), "verb": set()})

for xml in sorted(IN_XML.glob("*_fmb.xml")):
    try:
        tree = ET.parse(xml); root = tree.getroot()
    except Exception:
        continue
    form_el = next((e for e in root.iter(f"{NS}FormModule")), None)
    if form_el is None: continue
    caller = re.sub(r"__[0-9a-f]{6}$","", re.sub(r"_fmb$","", xml.stem)).upper()
    parent_map = {c:p for p in form_el.iter() for c in p}
    def scan(body, label):
        for m in PAT_RUNPROD.finditer(body):
            r = normalize(m.group(1))
            k = (caller, r)
            edges[k]["count"] += 1; edges[k]["sites"].add(label); edges[k]["verb"].add("RUN_PRODUCT")
        for m in PAT_RDF.finditer(body):
            r = normalize(m.group(1))
            k = (caller, r)
            edges[k]["count"] += 1; edges[k]["sites"].add(label); edges[k]["verb"].add("RDF_LITERAL")
        for m in PAT_REPFILE.finditer(body):
            r = normalize(m.group(1))
            k = (caller, r)
            edges[k]["count"] += 1; edges[k]["sites"].add(label); edges[k]["verb"].add("REPORT_FILENAME")
    for trig in form_el.iter(f"{NS}Trigger"):
        body = decode(trig.get("TriggerText",""))
        tname = trig.get("Name","")
        p = parent_map.get(trig); loc=""
        if p is not None:
            tag = p.tag.split("}")[-1]
            if tag == "Block": loc = p.get("Name","")
            elif tag == "Item":
                loc = p.get("Name","")
                pp = parent_map.get(p)
                if pp is not None and pp.tag.endswith("Block"):
                    loc = pp.get("Name","") + "." + loc
        scan(body, f"trig:{loc}:{tname}")
    for pu in form_el.iter(f"{NS}ProgramUnit"):
        body = decode(pu.get("ProgramUnitText",""))
        scan(body, f"pu:{pu.get('Name','')}")

OUT = ROOT/"analysis/dependency-graphs"
with (OUT/"form-to-report-xml.csv").open("w", newline="", encoding="utf-8") as f:
    w = csv.writer(f); w.writerow(["caller","report","verb","count","report_in_rex","sites"])
    for (c,r), d in sorted(edges.items()):
        in_rex = "yes" if r in REX_NAMES else "no"
        w.writerow([c, r, ";".join(sorted(d["verb"])), d["count"], in_rex, ";".join(sorted(d["sites"]))[:300]])

# Markdown
rep_in   = Counter({r: 0 for r in REX_NAMES})
missing  = Counter()
caller_c = Counter()
for (c,r), d in edges.items():
    caller_c[c] += d["count"]
    if r in REX_NAMES: rep_in[r] += d["count"]
    else: missing[r] += d["count"]

MD = ROOT/"docs/forms/form-to-report-xml.md"
MD.parent.mkdir(parents=True, exist_ok=True)
with MD.open("w", encoding="utf-8") as f:
    f.write(f"# Form→Report graph (XML + REX-derived)\n\n")
    f.write(f"**Edges:** {len(edges)}  \n")
    f.write(f"**Distinct forms calling reports:** {len(caller_c)}  \n")
    f.write(f"**Distinct reports targeted:** {len(set(r for _,r in edges))}  \n")
    f.write(f"**Reports in REX catalog:** {len(REX_NAMES)}  \n\n")
    f.write("## Reports referenced that ARE in the REX catalog\n\n| Report | Calls |\n|---|---|\n")
    for r, c in sorted(rep_in.items(), key=lambda x: -x[1]):
        if c: f.write(f"| `{r}` | {c} |\n")
    f.write(f"\n## Reports referenced but NOT found in REX ({sum(1 for _,c in missing.items() if c)} missing)\n\n")
    f.write("| Report literal | Calls | Possible cause |\n|---|---|---|\n")
    for r, c in missing.most_common():
        cause = "external report" if any(k in r for k in ("COUNTRY","MED_","HI_","WAR_","RES109")) else "name mismatch or BLK-010"
        f.write(f"| `{r}` | {c} | {cause} |\n")
    f.write(f"\n## Top caller forms\n\n| Form | Report calls |\n|---|---|\n")
    for c, cnt in caller_c.most_common(20):
        f.write(f"| `{c}` | {cnt} |\n")

print(f"edges: {len(edges)}; forms: {len(caller_c)}; reports: {len({r for _,r in edges})}; in_rex: {sum(1 for r,c in rep_in.items() if c)}")
