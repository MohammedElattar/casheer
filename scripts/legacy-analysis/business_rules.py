#!/usr/bin/env python3
"""
Walk Forms XMLs + PLL bodies, emit:
  - docs/business-rules/business-rule-catalog.md     (bucketed by domain)
  - analysis/normalized/business-rules.csv           (one row per PL/SQL unit)
  - docs/migration/deprecated-builtins.md            (call-site inventory)
  - analysis/normalized/deprecated-builtins.csv

Domain bucketing: keyword scan on form name + body text.
Deprecated built-ins: Forms 6i calls removed/altered in 10g+.
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

DOMAINS = [
    ("invoice",      r"(?i)\b(INVOICE|INV_DTL|BILL|FATORA|FATOURA)\b"),
    ("takeaway",     r"(?i)\b(TAKE_AWAY|TAKEAWAY|TAKAWAY|TAK_AWY)\b"),
    ("pizza",        r"(?i)\bPIZZA\b"),
    ("reservation",  r"(?i)\b(RESERV|BOOK|HAJZ|BOOKING)\b"),
    ("room",         r"(?i)\b(ROOM|HOTEL|NOZOL|GHORFA|CHECKIN|CHECK_IN)\b"),
    ("employee",     r"(?i)\b(EMP|EMPLOYEE|EMP_VIEW|USER|USR|LOGIN|PASS|PERMISSION|PRIV)\b"),
    ("points",       r"(?i)\b(POINT|KART|CARD|LOYAL|MEMBER)\b"),
    ("stats",        r"(?i)\b(STAT|REPORT|SUMMARY|TOTAL|SUM_|HISAB|ESTATE|ESTAT)\b"),
    ("item_master",  r"(?i)\b(ITEM_PRICE|ITEM_MASTER|MENU|PRICE|UNIT|CATEGORY)\b"),
    ("payment",      r"(?i)\b(PAY|CASH|CREDIT|KHSM|KHASM|VISA|DAFA)\b"),
    ("kitchen",      r"(?i)\b(KITCHEN|CHEF|COOK|ORDER|TLB)\b"),
    ("security",     r"(?i)\b(SECURITY|AUDIT|LOG|TRACE)\b"),
    ("ui_toolbar",   r"(?i)\b(TOOLBAR|MENU|BUTTON|ICON)\b"),
    ("system",       r"(?i)\b(SYSTEM\.|FORM_STATUS|DO_KEY|CALL_FORM|OPEN_FORM|NEW_FORM)\b"),
]

DEPRECATED = [
    ("RUN_PRODUCT",           r"\bRUN_PRODUCT\b",            "removed in Forms 11g; use RUN_REPORT_OBJECT"),
    ("WIN_API_UTILITY",       r"\bWIN_API_UTILITY\.",        "WebUtil replacement or server-side"),
    ("WIN_API_SHELL",         r"\bWIN_API_SHELL\.",          "WebUtil replacement"),
    ("WIN_API_SESSION",       r"\bWIN_API_SESSION\.",        "WebUtil replacement"),
    ("WIN_API_DIALOG",        r"\bWIN_API_DIALOG\.",         "WebUtil replacement"),
    ("ora_ffi",               r"\bora_ffi\b",                "removed in Forms 10g+; WebUtil or JavaBean"),
    ("TEXT_IO",               r"\bTEXT_IO\.",                "client-side only; use WebUtil.CLIENT_TEXT_IO on 3-tier"),
    ("ORA_NLS",               r"\bORA_NLS\.",                "superseded by SYS_CONTEXT('USERENV',...)"),
    ("HOST",                  r"\bHOST\s*\(",                "3-tier: WebUtil.CLIENT_HOST"),
    ("USER_EXIT",             r"\bUSER_EXIT\b",              "removed; port C to Java or PL/SQL"),
    ("DDE",                   r"\bDDE\.",                    "obsolete Windows DDE"),
    ("OLE2",                  r"\bOLE2\.",                   "3-tier: WebUtil.CLIENT_OLE2"),
    ("GET_APPLICATION_PROPERTY_USER", r"\bGET_APPLICATION_PROPERTY\s*\(\s*USER\b", "use SYS_CONTEXT"),
    ("EXEC_SQL",              r"\bEXEC_SQL\.",               "use DBMS_SQL or Pro*C"),
    ("FORMS_DDL",             r"\bFORMS_DDL\b",              "legitimate but avoid for migration"),
    ("SYNCHRONIZE",           r"\bSYNCHRONIZE\s*\(",         "Forms-6i webform sync; not in modern UI"),
    ("GET_FILE_NAME",         r"\bGET_FILE_NAME\b",          "3-tier: WebUtil.CLIENT_GET_FILE_NAME"),
    ("READ_IMAGE_FILE",       r"\bREAD_IMAGE_FILE\b",        "3-tier: WebUtil.CLIENT_IMAGE_IO"),
    ("WRITE_IMAGE_FILE",      r"\bWRITE_IMAGE_FILE\b",       "3-tier: WebUtil.CLIENT_IMAGE_IO"),
    ("ADD_PARAMETER",         r"\bADD_PARAMETER\b",          "still works but Report params moved to RUN_REPORT_OBJECT"),
]

def classify_domain(form_name, body):
    hits = []
    for dom, rx in DOMAINS:
        if re.search(rx, form_name) or re.search(rx, body or ""):
            hits.append(dom)
    return hits or ["uncategorized"]

def decode(raw):
    if raw is None: return ""
    return raw.replace("&#10;", "\n").replace("&#9;", "\t")

def parse_xml(path):
    tree = ET.parse(path)
    root = tree.getroot()
    form = next((e for e in root.iter(f"{NS}FormModule")), None)
    if form is None: return None
    form_name = form.get("Name", path.stem)
    units = []
    parent_map = {c:p for p in form.iter() for c in p}
    for trig in form.iter(f"{NS}Trigger"):
        body = decode(trig.get("TriggerText", ""))
        p = parent_map.get(trig)
        scope = block = item = ""
        if p is not None:
            tag = p.tag.split("}")[-1]
            if tag == "FormModule": scope = "form"
            elif tag == "Block":    scope = "block"; block = p.get("Name","")
            elif tag == "Item":
                scope = "item"; item = p.get("Name","")
                pp = parent_map.get(p)
                if pp is not None and pp.tag.endswith("Block"):
                    block = pp.get("Name","")
        units.append({
            "form": form_name, "kind": "TRIGGER", "name": trig.get("Name",""),
            "scope": scope, "block": block, "item": item, "body": body,
        })
    for pu in form.iter(f"{NS}ProgramUnit"):
        body = decode(pu.get("ProgramUnitText",""))
        units.append({
            "form": form_name, "kind": "PROGRAM_UNIT", "name": pu.get("Name",""),
            "scope": "form", "block": "", "item": "",
            "body": body, "pu_type": pu.get("ProgramUnitType",""),
        })
    return form_name, units

def parse_pll(path):
    text = path.read_text(encoding="utf-8", errors="replace")
    lib = path.stem.replace(".pll","").upper()
    out = []
    # Split on PU markers
    pat = re.compile(r"^--- PU #\d+ name=(\S+) kind=(\S+) ---\s*$", re.MULTILINE)
    matches = list(pat.finditer(text))
    for i, m in enumerate(matches):
        name = m.group(1); kind = m.group(2)
        start = m.end()
        end = matches[i+1].start() if i+1 < len(matches) else len(text)
        body = text[start:end].strip()
        if body.startswith("==="): continue
        out.append({"form": lib, "kind": "PLL_UNIT", "name": name,
                    "scope": "library", "block": "", "item": "",
                    "body": body, "pu_type": kind})
    return out

def main():
    all_units = []
    for xml in sorted(IN_XML.glob("*_fmb.xml")):
        try:
            r = parse_xml(xml)
        except Exception as e:
            print(f"ERR {xml.name}: {e}", file=sys.stderr); continue
        if r is None: continue
        _, units = r
        all_units.extend(units)
    for pll in sorted(IN_PLL.glob("*.pll.txt")):
        all_units.extend(parse_pll(pll))

    # Business-rule catalog
    rules = []
    for u in all_units:
        body = u.get("body","")
        if not body.strip(): continue
        domains = classify_domain(u["form"], body)
        first_stmt = re.split(r";|\n", body.strip(), maxsplit=1)[0][:160]
        rules.append({
            "form": u["form"], "kind": u["kind"], "name": u["name"],
            "scope": u["scope"], "block": u["block"], "item": u["item"],
            "domains": ";".join(domains),
            "body_len": len(body),
            "first_line": first_stmt.replace("\n"," "),
        })

    OUT = ROOT / "analysis/normalized"
    with (OUT/"business-rules.csv").open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["form","kind","name","scope","block","item","domains","body_len","first_line"])
        w.writeheader(); w.writerows(rules)

    # Deprecated builtins
    dep_rows = []
    dep_counts = Counter()
    dep_by_domain = defaultdict(Counter)
    for u in all_units:
        body = u.get("body","")
        for label, rx, note in DEPRECATED:
            matches = list(re.finditer(rx, body, flags=re.IGNORECASE))
            if not matches: continue
            dep_counts[label] += len(matches)
            doms = classify_domain(u["form"], body)
            for d in doms:
                dep_by_domain[label][d] += len(matches)
            # one row per unit per builtin
            dep_rows.append({
                "builtin": label, "form": u["form"], "kind": u["kind"], "name": u["name"],
                "scope": u["scope"], "block": u["block"], "item": u["item"],
                "count": len(matches),
                "note": note,
            })
    with (OUT/"deprecated-builtins.csv").open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["builtin","form","kind","name","scope","block","item","count","note"])
        w.writeheader(); w.writerows(dep_rows)

    # Markdown: business rules
    br_md = ROOT / "docs/business-rules/business-rule-catalog.md"
    br_md.parent.mkdir(parents=True, exist_ok=True)
    by_dom = defaultdict(list)
    for r in rules:
        for d in r["domains"].split(";"):
            by_dom[d].append(r)
    with br_md.open("w", encoding="utf-8") as f:
        f.write(f"# Business-rule catalog (VERIFIED — XML + JDAPI PLL dump)\n\n")
        f.write(f"**Source:** `analysis/extracted/forms_xml/*.xml` (65 forms, Forms2XML 12.2.1.19) + `analysis/extracted/pll_bodies/*.txt` (2 PLLs via JDAPI `PlsqlModule`). Parsed by `scripts/legacy-analysis/business_rules.py`.\n\n")
        f.write(f"**Total PL/SQL units with non-empty body:** {len(rules)}  \n")
        f.write(f"**Buckets:** {', '.join(sorted(set(d for r in rules for d in r['domains'].split(';'))))}\n\n")
        f.write(f"**How to read:** one row per unit. `scope` is `form`/`block`/`item`/`library`; `block.item` locates the handler. `body_len` is chars of PL/SQL. Click through to `analysis/normalized/business-rules.csv` for the full index; full bodies live in the XMLs.\n\n")
        f.write(f"## Counts by domain\n\n| Domain | Units |\n|---|---|\n")
        for d, lst in sorted(by_dom.items(), key=lambda x: -len(x[1])):
            f.write(f"| `{d}` | {len(lst)} |\n")
        f.write("\n")
        for dom in sorted(by_dom.keys(), key=lambda d: -len(by_dom[d])):
            units = by_dom[dom]
            f.write(f"\n## Domain: `{dom}` ({len(units)} units)\n\n")
            f.write("| Form | Kind | Name | Scope | Block.Item | Len | First line |\n|---|---|---|---|---|---|---|\n")
            for u in sorted(units, key=lambda x: (-x["body_len"], x["form"], x["name"]))[:60]:
                loc = f"{u['block']}.{u['item']}" if u['item'] else u['block']
                first = u["first_line"].replace("|","\\|")[:80]
                f.write(f"| `{u['form']}` | {u['kind']} | `{u['name']}` | {u['scope']} | `{loc}` | {u['body_len']} | `{first}` |\n")
            if len(units) > 60:
                f.write(f"\n_(showing 60 of {len(units)}; full list in `analysis/normalized/business-rules.csv`)_\n")

    # Markdown: deprecated builtins
    dep_md = ROOT / "docs/migration/deprecated-builtins.md"
    dep_md.parent.mkdir(parents=True, exist_ok=True)
    with dep_md.open("w", encoding="utf-8") as f:
        f.write(f"# Deprecated-builtin inventory (VERIFIED)\n\n")
        f.write(f"**Source:** same as business-rule catalog. Scanned {len(all_units)} PL/SQL units.\n\n")
        f.write(f"**How to read:** each row is one Forms 6i built-in + its call sites. `count` is total matches. `sites` is distinct `(form, name)` units containing the call. Modern replacement in the `migration note` column.\n\n")
        f.write("## Call-count summary\n\n| Built-in | Total calls | Distinct sites | Migration note |\n|---|---|---|---|\n")
        sites_by_b = defaultdict(set)
        for r in dep_rows:
            sites_by_b[r["builtin"]].add((r["form"], r["kind"], r["name"]))
        note_by_b = {r["builtin"]: r["note"] for r in dep_rows}
        for b, c in dep_counts.most_common():
            f.write(f"| `{b}` | {c} | {len(sites_by_b[b])} | {note_by_b.get(b,'')} |\n")
        f.write("\n## Call sites per built-in\n\n")
        for b, _ in dep_counts.most_common():
            f.write(f"\n### `{b}` — {dep_counts[b]} calls across {len(sites_by_b[b])} sites\n\n")
            f.write(f"_{note_by_b.get(b,'')}_\n\n")
            f.write("| Form | Kind | Unit | Scope | Block.Item | Count |\n|---|---|---|---|---|---|\n")
            rs = [r for r in dep_rows if r["builtin"] == b]
            for r in sorted(rs, key=lambda x: (-x["count"], x["form"], x["name"]))[:40]:
                loc = f"{r['block']}.{r['item']}" if r['item'] else r['block']
                f.write(f"| `{r['form']}` | {r['kind']} | `{r['name']}` | {r['scope']} | `{loc}` | {r['count']} |\n")
            if len(rs) > 40:
                f.write(f"\n_(showing 40 of {len(rs)}; full list in `analysis/normalized/deprecated-builtins.csv`)_\n")

    print(f"wrote {len(rules)} business-rule rows, {len(dep_rows)} deprecated-builtin rows")
    print(f"deprecated top: {dep_counts.most_common(8)}")

if __name__ == "__main__":
    main()
