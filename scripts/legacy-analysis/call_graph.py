#!/usr/bin/env python3
"""
Inter-form call graph from Forms XMLs.
Extracts CALL_FORM/OPEN_FORM/NEW_FORM/GO_FORM targets from every trigger +
program-unit body. Resolves variants: which `sery*` / `take_away*` fmbs are
actually invoked (reachable), which are orphans.

Outputs:
  analysis/dependency-graphs/form-to-form.csv
  docs/forms/call-graph.md
"""
from __future__ import annotations
import csv, re, sys
from collections import Counter, defaultdict
from pathlib import Path
import xml.etree.ElementTree as ET

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN = ROOT / "analysis/extracted/forms_xml"
NS = "{http://xmlns.oracle.com/Forms}"

# CALL_FORM('path\name', ...) or CALL_FORM(name, ...) or CALL_FORM('name.fmx')
# Forms 6i: literal string with Windows path. Capture the basename (no .fmx/.fmb).
CALL_RE = re.compile(
    r"\b(CALL_FORM|OPEN_FORM|NEW_FORM|GO_FORM)\s*\(\s*'([^']+)'",
    re.IGNORECASE,
)

def decode(raw): return (raw or "").replace("&#10;","\n").replace("&#9;","\t")

def normalize_target(raw):
    """'D:\\M_CASHEAR\\ITEM_TBL' -> 'ITEM_TBL'. Strip ext, backslash, forward slash."""
    s = raw.strip().strip('"').strip("'")
    s = s.replace("\\","/").split("/")[-1]
    s = re.sub(r"\.(fmx|fmb|FMX|FMB)$", "", s)
    return s.upper()

edges = defaultdict(lambda: {"count":0, "sites":set()})   # (caller, callee, verb) -> {}
form_names = set()
internal_to_files: dict[str,list[str]] = {}

for xml in sorted(IN.glob("*_fmb.xml")):
    try:
        tree = ET.parse(xml); root = tree.getroot()
    except Exception as e:
        print(f"ERR {xml.name}: {e}", file=sys.stderr); continue
    form = next((e for e in root.iter(f"{NS}FormModule")), None)
    if form is None: continue
    internal_name = form.get("Name", xml.stem).upper()
    # Key by XML filename stem (preserves variants); track internal name for callee resolution
    stem = re.sub(r"_fmb$", "", xml.stem)   # strip suffix
    stem = re.sub(r"__[0-9a-f]{6}$", "", stem)   # strip hash suffix if any
    caller = stem.upper()
    form_names.add(caller)
    # Map internal module name -> list of filename-stems (for CALL_FORM target resolution)
    internal_to_files.setdefault(internal_name, []).append(caller)
    parent_map = {c:p for p in form.iter() for c in p}
    def scan(body, label):
        for m in CALL_RE.finditer(body):
            verb = m.group(1).upper()
            callee = normalize_target(m.group(2))
            key = (caller, callee, verb)
            edges[key]["count"] += 1
            edges[key]["sites"].add(label)
    for trig in form.iter(f"{NS}Trigger"):
        body = decode(trig.get("TriggerText",""))
        tname = trig.get("Name","")
        p = parent_map.get(trig)
        loc = ""
        if p is not None:
            tag = p.tag.split("}")[-1]
            if tag == "Block": loc = p.get("Name","")
            elif tag == "Item":
                loc = p.get("Name","")
                pp = parent_map.get(p)
                if pp is not None and pp.tag.endswith("Block"):
                    loc = pp.get("Name","") + "." + loc
        scan(body, f"trig:{loc}:{tname}")
    for pu in form.iter(f"{NS}ProgramUnit"):
        body = decode(pu.get("ProgramUnitText",""))
        scan(body, f"pu:{pu.get('Name','')}")

OUT = ROOT/"analysis/dependency-graphs"
OUT.mkdir(parents=True, exist_ok=True)
with (OUT/"form-to-form.csv").open("w", newline="", encoding="utf-8") as f:
    w = csv.writer(f); w.writerow(["caller","callee","verb","count","sites","callee_in_repo"])
    for (caller,callee,verb), d in sorted(edges.items()):
        in_repo = "yes" if callee in form_names else "no"
        w.writerow([caller, callee, verb, d["count"], ";".join(sorted(d["sites"]))[:300], in_repo])

# Reachability from root(s). Pick roots as forms NOT called by any other.
callers = {k[0] for k in edges}
callees = {k[1] for k in edges}
unreachable_from_graph = form_names - callees   # never called = potential root OR orphan (menu-launched)
# Actual orphan: never called AND calls nothing significant — but Forms are usually menu-launched,
# so "never called" is just "no incoming CALL_FORM edges in trigger code".
incoming = Counter()
for (c,cal,v), d in edges.items():
    incoming[cal] += d["count"]
outgoing = Counter()
for (c,cal,v), d in edges.items():
    outgoing[c] += d["count"]

# Group variants by base stem
variants = defaultdict(list)
for fn in form_names:
    if fn.startswith("SERY"):                                  key = "SERY"
    elif fn.startswith("TAKE_AWAY") or fn.startswith("TAKEAWAY"): key = "TAKE_AWAY"
    else:                                                       key = re.sub(r"[_0-9-]+$","",fn).rstrip("_") or fn
    variants[key].append(fn)

MD = ROOT/"docs/forms/call-graph.md"
with MD.open("w", encoding="utf-8") as f:
    f.write("# Inter-form call graph (XML-derived)\n\n")
    f.write(f"**Source:** CALL_FORM/OPEN_FORM/NEW_FORM/GO_FORM literals in trigger & PU bodies across 65 XMLs.  \n")
    f.write(f"**Edges:** {len(edges)}  \n")
    f.write(f"**Forms with incoming calls:** {len(callees)}  \n")
    f.write(f"**Forms with outgoing calls:** {len(callers)}  \n")
    f.write(f"**Forms with NO incoming call** (menu-launched or orphan): {len(unreachable_from_graph)}\n\n")
    f.write("## Verb breakdown\n\n")
    vc = Counter((v) for (c,cal,v) in edges)
    for v, c in vc.most_common():
        f.write(f"- `{v}`: {sum(d['count'] for (ca,ce,vb),d in edges.items() if vb==v)} total calls, {c} distinct edges\n")
    f.write("\n## Variant resolution (BLK-008)\n\n")
    f.write("For each stem with 2+ form copies, list which are reached by incoming calls (candidate active) vs none (candidate dormant).\n\n")
    f.write("| Stem | Variant | Incoming calls | Outgoing calls | Verdict |\n|---|---|---|---|---|\n")
    for stem in sorted(variants):
        lst = variants[stem]
        if len(lst) < 2: continue
        for fn in sorted(lst):
            inc = incoming.get(fn, 0)
            out = outgoing.get(fn, 0)
            if inc > 0:   v = "**reached**"
            elif out > 0: v = "orphan (but acts as root)"
            else:         v = "orphan (dead code candidate)"
            f.write(f"| `{stem}` | `{fn}` | {inc} | {out} | {v} |\n")
    f.write("\n## Top callers (outgoing)\n\n| Form | Outgoing calls |\n|---|---|\n")
    for fn, c in outgoing.most_common(20):
        f.write(f"| `{fn}` | {c} |\n")
    f.write("\n## Top callees (incoming)\n\n| Form | Incoming calls | In repo |\n|---|---|---|\n")
    for fn, c in incoming.most_common(30):
        in_repo = "yes" if fn in form_names else "no"
        f.write(f"| `{fn}` | {c} | {in_repo} |\n")
    f.write("\n## Potential root / menu-launched forms (zero incoming edges)\n\n")
    f.write("These forms have NO incoming CALL_FORM in the recovered code. Either they are launched from the Forms runtime config (menu, URL, root), or they are dead code.\n\n")
    f.write("| Form | Outgoing calls |\n|---|---|\n")
    for fn in sorted(unreachable_from_graph):
        f.write(f"| `{fn}` | {outgoing.get(fn,0)} |\n")

print(f"edges: {len(edges)}; forms: {len(form_names)}; roots (no incoming): {len(unreachable_from_graph)}")
# Print variant verdict to stdout
print("\nVariant verdicts:")
for stem in sorted(variants):
    lst = variants[stem]
    if len(lst) < 2: continue
    print(f"  {stem}: {[(fn, incoming.get(fn,0)) for fn in sorted(lst)]}")
