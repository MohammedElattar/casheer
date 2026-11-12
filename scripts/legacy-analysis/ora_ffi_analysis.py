#!/usr/bin/env python3
"""
ora_ffi usage inventory.
Extracts Foreign Function Interface declarations and call sites from all
Forms XMLs + PLL dumps. Groups by DLL + exported function. Produces the
Win32-API replacement checklist for migration.

ora_ffi patterns:
  - ora_ffi.load_library('path/dll')           → DLL load
  - ora_ffi.register_function(lh, 'NAME', ...) → function lookup
  - ora_ffi.register_parameter(fh, type, ...)  → signature
  - ora_ffi.register_return(fh, type)          → return type
  - ora_ffi.find_function / find_library       → lookup existing
  - ora_ffi.funcCallStd / funcCallCdecl        → call

Outputs:
  analysis/normalized/ora-ffi-sites.csv
  docs/migration/ora-ffi-inventory.md
"""
from __future__ import annotations
import csv, re, sys
from collections import Counter, defaultdict
from pathlib import Path
import xml.etree.ElementTree as ET

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN_XML = ROOT / "analysis/extracted/forms_xml"
IN_PLL = ROOT / "analysis/extracted/pll_bodies"
NS = "{http://xmlns.oracle.com/Forms}"

PAT_LOAD    = re.compile(r"ora_ffi\.load_library\s*\(\s*['\"]([^'\"]*)['\"]\s*,\s*['\"]([^'\"]*)['\"]", re.IGNORECASE)
PAT_LOAD1   = re.compile(r"ora_ffi\.load_library\s*\(\s*['\"]([^'\"]*)['\"]", re.IGNORECASE)
PAT_REGFUNC = re.compile(r"ora_ffi\.register_function\s*\(\s*(\w+)\s*,\s*['\"]([^'\"]+)['\"]", re.IGNORECASE)
PAT_FINDFN  = re.compile(r"ora_ffi\.find_function\s*\(\s*['\"]([^'\"]+)['\"]", re.IGNORECASE)
PAT_FFICALL = re.compile(r"ora_ffi\.(funcCallStd|funcCallCdecl|funcCall)\s*\(\s*(\w+)", re.IGNORECASE)
PAT_ANYFFI  = re.compile(r"ora_ffi\.\w+", re.IGNORECASE)
PAT_WINHDR  = re.compile(r"(user32|kernel32|gdi32|shell32|advapi32|winspool|printui|msvcrt|ole32|comdlg32|ntdll)\.dll", re.IGNORECASE)

def decode(raw): return (raw or "").replace("&#10;","\n").replace("&#9;","\t")

sites = []       # one row per unit with ffi mentions
dll_funcs = defaultdict(set)   # dll -> set(func names registered)
dll_load_sites = defaultdict(list)
func_call_sites = defaultdict(list)  # func_name -> list of (form, unit)
any_ffi_total = 0

def scan_body(form, kind, name, scope, loc, body):
    global any_ffi_total
    matches = list(PAT_ANYFFI.finditer(body))
    if not matches: return
    any_ffi_total += len(matches)
    loads     = [(m.group(1), m.group(2)) for m in PAT_LOAD.finditer(body)]
    loads1    = [m.group(1) for m in PAT_LOAD1.finditer(body) if m.group(1)]
    regfuncs  = [(m.group(1), m.group(2)) for m in PAT_REGFUNC.finditer(body)]
    findfuncs = [m.group(1) for m in PAT_FINDFN.finditer(body)]
    # DLL names from strings in body
    dlls      = [m.group(0).lower() for m in PAT_WINHDR.finditer(body)]
    # Record
    for lib_handle, fn in regfuncs:
        dll_funcs["?"].add(fn)
        func_call_sites[fn].append((form, kind, name, scope, loc))
    for fn in findfuncs:
        func_call_sites[fn].append((form, kind, name, scope, loc))
    for libtag, dllpath in loads:
        dll = (PAT_WINHDR.search(dllpath) or type("x",(),{"group":lambda s,i=0:dllpath}))().group(0).lower()
        dll_load_sites[dll].append((form, kind, name, scope, loc, libtag))
    for dllpath in loads1:
        m = PAT_WINHDR.search(dllpath)
        if m: dll_load_sites[m.group(0).lower()].append((form, kind, name, scope, loc, ""))
    for dll in set(dlls):
        if not any(dll in k for k in dll_load_sites.keys()):
            dll_load_sites[dll].append((form, kind, name, scope, loc, ""))
    sites.append({
        "form": form, "kind": kind, "name": name, "scope": scope, "loc": loc,
        "ffi_mentions": len(matches),
        "dll_loads": ";".join(f"{a}->{b}" for a,b in loads) or ";".join(loads1),
        "funcs_registered": ";".join(f"{lh}/{fn}" for lh,fn in regfuncs),
        "funcs_found":      ";".join(findfuncs),
        "dlls_in_body":     ";".join(sorted(set(dlls))),
    })

def process_xml(xml):
    tree = ET.parse(xml); root = tree.getroot()
    form_el = next((e for e in root.iter(f"{NS}FormModule")), None)
    if form_el is None: return
    form = re.sub(r"_fmb$","", re.sub(r"__[0-9a-f]{6}$","", xml.stem)).upper()
    parent_map = {c:p for p in form_el.iter() for c in p}
    for trig in form_el.iter(f"{NS}Trigger"):
        body = decode(trig.get("TriggerText",""))
        p = parent_map.get(trig); loc = ""; scope = "form"
        if p is not None:
            tag = p.tag.split("}")[-1]
            if tag == "Block": scope = "block"; loc = p.get("Name","")
            elif tag == "Item":
                scope = "item"; loc = p.get("Name","")
                pp = parent_map.get(p)
                if pp is not None and pp.tag.endswith("Block"):
                    loc = pp.get("Name","") + "." + loc
        scan_body(form, "TRIGGER", trig.get("Name",""), scope, loc, body)
    for pu in form_el.iter(f"{NS}ProgramUnit"):
        body = decode(pu.get("ProgramUnitText",""))
        scan_body(form, "PROGRAM_UNIT", pu.get("Name",""), "form", "", body)

def process_pll(path):
    text = path.read_text(encoding="utf-8", errors="replace")
    lib = path.stem.replace(".pll","").upper()
    pat = re.compile(r"^--- PU #\d+ name=(\S+) kind=(\S+) ---\s*$", re.MULTILINE)
    matches = list(pat.finditer(text))
    for i, m in enumerate(matches):
        name = m.group(1)
        start = m.end()
        end = matches[i+1].start() if i+1 < len(matches) else len(text)
        body = text[start:end]
        scan_body(lib, "PLL_UNIT", name, "library", "", body)

for x in sorted(IN_XML.glob("*_fmb.xml")): process_xml(x)
for p in sorted(IN_PLL.glob("*.pll.txt")): process_pll(p)

OUT = ROOT/"analysis/normalized"
with (OUT/"ora-ffi-sites.csv").open("w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=["form","kind","name","scope","loc","ffi_mentions","dll_loads","funcs_registered","funcs_found","dlls_in_body"])
    w.writeheader(); w.writerows(sites)

# Rollups
dll_total = Counter()
for dll, lst in dll_load_sites.items():
    dll_total[dll] = len(lst)
func_total = Counter({fn: len(lst) for fn, lst in func_call_sites.items()})

MD = ROOT/"docs/migration/ora-ffi-inventory.md"
with MD.open("w", encoding="utf-8") as f:
    f.write("# `ora_ffi` usage inventory (migration pain-point #1)\n\n")
    f.write(f"**Source:** {len(sites)} PL/SQL units containing `ora_ffi.*` tokens across all forms + PLL dumps. Total tokens: **{any_ffi_total}**. Scanned by `scripts/legacy-analysis/ora_ffi_analysis.py`.\n\n")
    f.write("**Why this matters:** `ora_ffi` (Oracle's Foreign Function Interface) was removed in Forms 10g. Every DLL load + Win32 API registration must be replaced during web migration. Native-browser code has no equivalent, so each call needs a server-side or JavaBean substitute.\n\n")
    f.write(f"## DLLs loaded ({len(dll_load_sites)})\n\n")
    f.write("| DLL | Load-site count | Replacement strategy |\n|---|---|---|\n")
    strategies = {
        "user32.dll":     "window/message APIs → browser window + CSS or JavaBean",
        "kernel32.dll":   "process/file APIs → server-side Node/Java",
        "gdi32.dll":      "drawing/printing → server-side report generation + CSS print",
        "shell32.dll":    "shell/file open → browser download or server file API",
        "winspool.drv":   "printer management → server-side printing (CUPS, IPP)",
        "printui.dll":    "printer dialogs → modern print preview",
        "advapi32.dll":   "registry/services → server config",
        "msvcrt.dll":     "C runtime → inline in replacement code",
        "ole32.dll":      "COM/OLE → not applicable on web",
        "comdlg32.dll":   "common dialogs → native browser file inputs",
    }
    for dll, c in dll_total.most_common():
        f.write(f"| `{dll}` | {c} | {strategies.get(dll,'inspect sites, substitute per-call')} |\n")
    f.write(f"\n## Registered / found functions ({len(func_call_sites)})\n\n")
    f.write("| Function | Sites |\n|---|---|\n")
    for fn, c in func_total.most_common(40):
        f.write(f"| `{fn}` | {c} |\n")
    f.write("\n## Top sites by `ora_ffi` token count\n\n")
    top = sorted(sites, key=lambda s: -s["ffi_mentions"])[:30]
    f.write("| Form | Kind | Name | Scope.Loc | Tokens | DLLs | Funcs reg'd |\n|---|---|---|---|---|---|---|\n")
    for s in top:
        loc = f"{s['scope']}:{s['loc']}" if s['loc'] else s['scope']
        f.write(f"| `{s['form']}` | {s['kind']} | `{s['name']}` | `{loc}` | {s['ffi_mentions']} | {s['dlls_in_body'][:60]} | {s['funcs_registered'][:60]} |\n")

print(f"sites: {len(sites)}; total ffi tokens: {any_ffi_total}; dlls: {len(dll_load_sites)}; funcs: {len(func_call_sites)}")
print(f"top DLLs: {dll_total.most_common(5)}")
print(f"top funcs: {func_total.most_common(5)}")
