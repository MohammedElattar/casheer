#!/usr/bin/env python3
"""
Arabic text recovery utility for Forms XMLs.

The Forms2XML tool on the VM (Forms 12.2.1.19) wrote the FMB-side Arabic
(stored as UTF-8 in the binary) as if the bytes were Latin-1, then re-encoded
to UTF-8. Net effect: double-UTF-8 encoding.

Recovery: str.encode('latin-1').decode('utf-8'). Some single bytes may fail to
decode where the original stream was not clean UTF-8; use errors='replace'.

Usage:
  python3 scripts/legacy-analysis/arabic_fix.py [FORM_NAME]
Dumps a catalog of (form, location, raw_text, fixed_text) for strings
containing Arabic codepoints.

Outputs:
  analysis/normalized/arabic-strings.csv
"""
from __future__ import annotations
import csv, re, sys
from pathlib import Path
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[2]
IN = ROOT/"analysis/extracted/forms_xml"
NS = "{http://xmlns.oracle.com/Forms}"

def fix(s: str) -> str:
    try:
        return s.encode('latin-1', errors='replace').decode('utf-8', errors='replace')
    except Exception:
        return s

def has_arabic(s: str) -> bool:
    return any(0x0600 <= ord(c) <= 0x06FF for c in s)

# Scan trigger bodies, PU bodies, Item labels, Alert messages, etc.
STR_RE = re.compile(r"'([^'\n]{2,200})'")

rows = []
scope_filter = sys.argv[1].upper() if len(sys.argv) > 1 else None

for xml in sorted(IN.glob("*_fmb.xml")):
    try:
        tree = ET.parse(xml); root = tree.getroot()
    except Exception: continue
    form = next((e for e in root.iter(f"{NS}FormModule")), None)
    if form is None: continue
    fn = form.get("Name","").upper()
    if scope_filter and fn != scope_filter: continue
    parent_map = {c:p for p in form.iter() for c in p}

    # Trigger literals
    for trig in form.iter(f"{NS}Trigger"):
        body = (trig.get("TriggerText","") or "").replace("&#10;","\n")
        fixed = fix(body)
        if not has_arabic(fixed): continue
        for m in STR_RE.finditer(fixed):
            s = m.group(1)
            if has_arabic(s):
                p = parent_map.get(trig); loc = ""
                if p is not None:
                    tag = p.tag.split("}")[-1]
                    if tag == "Block": loc = p.get("Name","")
                    elif tag == "Item":
                        loc = p.get("Name","")
                        pp = parent_map.get(p)
                        if pp is not None and pp.tag.endswith("Block"):
                            loc = pp.get("Name","") + "." + loc
                rows.append({"form": fn, "xml": xml.name, "kind":"TRIGGER",
                             "unit": trig.get("Name",""), "loc": loc, "text": s})

    # Item Label/Prompt/Hint attributes (visible UI strings)
    for item in form.iter(f"{NS}Item"):
        for attr in ("Label","Prompt","Hint"):
            v = item.get(attr)
            if not v: continue
            fixed = fix(v)
            if has_arabic(fixed):
                block = parent_map.get(item)
                block_name = block.get("Name","") if block is not None else ""
                rows.append({"form": fn, "xml": xml.name, "kind":"ITEM_"+attr.upper(),
                             "unit": item.get("Name",""), "loc": block_name, "text": fixed})

    # Alert messages
    for al in form.iter(f"{NS}Alert"):
        for attr in ("AlertMessageText","Title"):
            v = al.get(attr)
            if not v: continue
            fixed = fix(v)
            if has_arabic(fixed):
                rows.append({"form": fn, "xml": xml.name, "kind":"ALERT_"+attr.upper(),
                             "unit": al.get("Name",""), "loc": "", "text": fixed})

OUT = ROOT/"analysis/normalized/arabic-strings.csv"
OUT.parent.mkdir(parents=True, exist_ok=True)
with OUT.open("w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=["form","xml","kind","unit","loc","text"])
    w.writeheader(); w.writerows(rows)

# Unique strings
uniq = sorted({r["text"] for r in rows})
print(f"rows: {len(rows)}; unique strings: {len(uniq)}")
# Sample
for s in uniq[:12]:
    print(f"  {s}")
