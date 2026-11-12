#!/usr/bin/env python3
"""
Parse Oracle Forms 12.2.1 XML exports into structured catalogs.

Inputs:
  analysis/extracted/forms_xml/*.xml
  analysis/normalized/columns.csv (for table-name authoritative list)

Outputs:
  analysis/normalized/xml-triggers.csv       (one row per trigger with full body)
  analysis/normalized/xml-program-units.csv  (form-level PROCEDURE/FUNCTION/PACKAGE)
  analysis/normalized/xml-blocks.csv
  analysis/normalized/xml-items.csv
  analysis/normalized/xml-sql-statements.csv (recovered SQL statements from trigger bodies)
  analysis/normalized/xml-form-summary.csv
  docs/forms/xml-coverage.md
"""
from __future__ import annotations
import csv, re, sys
from collections import Counter, defaultdict
from pathlib import Path
import xml.etree.ElementTree as ET

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN = ROOT / "analysis" / "extracted" / "forms_xml"
NS = {"f": "http://xmlns.oracle.com/Forms"}

# Authoritative tables
TABLES: set[str] = set()
try:
    with (ROOT / "analysis/normalized/columns.csv").open() as f:
        for r in csv.DictReader(f):
            TABLES.add(r["table"].upper())
except FileNotFoundError:
    pass

SQL_RE = re.compile(r"\b(SELECT|INSERT|UPDATE|DELETE|MERGE)\b[^;]*?;", re.IGNORECASE | re.DOTALL)
TABLE_IN_SQL = re.compile(r"\b(?:FROM|INTO|UPDATE|JOIN)\s+([A-Z_][A-Z0-9_$]*)", re.IGNORECASE)
PROC_CALL = re.compile(r"\b([A-Z_][A-Z0-9_$]*)\s*\(", re.IGNORECASE)
FORMS_BUILTIN = re.compile(r"\b(COMMIT_FORM|ROLLBACK|CALL_FORM|OPEN_FORM|NEW_FORM|RUN_PRODUCT|RUN_REPORT_OBJECT|MESSAGE|SHOW_ALERT|FORMS_DDL|SET_ITEM_PROPERTY|GET_ITEM_PROPERTY|GO_ITEM|GO_BLOCK|NAME_IN|COPY|CLEAR_FORM|EXECUTE_QUERY|ENTER_QUERY|NEXT_RECORD|PREVIOUS_RECORD|DELETE_RECORD|CREATE_RECORD|FIRST_RECORD|LAST_RECORD|DO_KEY|HOST|SYNCHRONIZE|FIND_ALERT|SET_ALERT_PROPERTY|FORM_SUCCESS|FORM_FAILURE)\b", re.IGNORECASE)

def text_decode(raw: str) -> str:
    """Decode the escaped TriggerText back to real PL/SQL."""
    if raw is None: return ""
    # XML already decodes &#10; etc during parsing. The TriggerText value also contains
    # literal '&#10;' sequences that were double-escaped (the attribute shows &amp;#10;).
    # ET gives us '&#10;' (single escape). Decode:
    s = raw.replace("&#10;", "\n").replace("&#9;", "\t")
    s = s.replace("\x09", "\t")
    return s

def parse_one(xml_path: Path):
    tree = ET.parse(xml_path)
    root = tree.getroot()
    form = None
    for fm in root.iter("{http://xmlns.oracle.com/Forms}FormModule"):
        form = fm
        break
    if form is None:
        return None
    form_name = form.get("Name", xml_path.stem)
    results = {
        "form": form_name,
        "xml": xml_path.relative_to(ROOT).as_posix(),
        "triggers": [],
        "program_units": [],
        "blocks": [],
        "items": [],
        "sql_statements": [],
    }
    # Blocks & items
    for block in form.iter("{http://xmlns.oracle.com/Forms}Block"):
        bname = block.get("Name","")
        base_table = block.get("DMLDataTargetName","") or block.get("QueryDataSourceName","")
        results["blocks"].append({"form": form_name, "block": bname, "base_table": base_table})
        for item in block.findall("{http://xmlns.oracle.com/Forms}Item"):
            results["items"].append({
                "form": form_name, "block": bname,
                "item": item.get("Name",""),
                "item_type": item.get("ItemType",""),
                "column_name": item.get("ColumnName",""),
                "data_type": item.get("DataType",""),
                "label": item.get("Label",""),
            })
    # Program units (form-level procedures/functions/packages)
    for pu in form.iter("{http://xmlns.oracle.com/Forms}ProgramUnit"):
        name = pu.get("Name","")
        kind = pu.get("ProgramUnitType","")
        body = text_decode(pu.get("ProgramUnitText",""))
        results["program_units"].append({
            "form": form_name, "name": name, "kind": kind,
            "body_length": len(body),
            "body_first_200": body[:200].replace("\n"," "),
            "body": body,
        })
    # Triggers (form-, block-, item-level)
    for trig in form.iter("{http://xmlns.oracle.com/Forms}Trigger"):
        tname = trig.get("Name","")
        body = text_decode(trig.get("TriggerText",""))
        # Walk up to find scope
        # ET doesn't give parent directly; we pass scope via a second pass
        results["triggers"].append({
            "form": form_name, "trigger": tname, "scope": "", "block": "", "item": "",
            "body_length": len(body),
            "body": body,
        })
    # Determine trigger scope by location (one more pass with parent map)
    parent_map = {c: p for p in form.iter() for c in p}
    trig_iter = list(form.iter("{http://xmlns.oracle.com/Forms}Trigger"))
    for trig, trow in zip(trig_iter, results["triggers"]):
        p = parent_map.get(trig)
        if p is None: continue
        tag = p.tag.split("}")[-1]
        if tag == "FormModule":
            trow["scope"] = "form"
        elif tag == "Block":
            trow["scope"] = "block"; trow["block"] = p.get("Name","")
        elif tag == "Item":
            trow["scope"] = "item"
            trow["item"] = p.get("Name","")
            # climb to Block
            pp = parent_map.get(p)
            if pp is not None and pp.tag.endswith("Block"):
                trow["block"] = pp.get("Name","")

    # Extract SQL statements from each trigger & program unit
    for src_kind, rows in (("trigger", results["triggers"]), ("program_unit", results["program_units"])):
        for r in rows:
            body = r.get("body","")
            for m in SQL_RE.finditer(body):
                stmt = m.group(0)
                tbl_hits = {x.group(1).upper() for x in TABLE_IN_SQL.finditer(stmt)}
                tbls_auth = sorted(tbl_hits & TABLES)
                results["sql_statements"].append({
                    "form": form_name,
                    "source_kind": src_kind,
                    "source_name": r.get("trigger") or r.get("name",""),
                    "scope": r.get("scope",""),
                    "block": r.get("block",""),
                    "item": r.get("item",""),
                    "length": len(stmt),
                    "tables_authoritative": ";".join(tbls_auth),
                    "statement_first_400": stmt[:400].replace("\n"," "),
                })
    return results

def main() -> int:
    all_triggers, all_pus, all_blocks, all_items, all_sql = [], [], [], [], []
    summaries = []
    for xml in sorted(IN.glob("*_fmb.xml")):
        try:
            r = parse_one(xml)
        except Exception as e:
            print(f"ERR {xml.name}: {e}", file=sys.stderr)
            continue
        if r is None:
            continue
        for t in r["triggers"]:
            t2 = {k:v for k,v in t.items() if k != "body"}
            t2["body_first_300"] = t["body"][:300].replace("\n"," ")
            all_triggers.append(t2)
        for pu in r["program_units"]:
            pu2 = {k:v for k,v in pu.items() if k != "body"}
            all_pus.append(pu2)
        all_blocks.extend(r["blocks"])
        all_items.extend(r["items"])
        all_sql.extend(r["sql_statements"])
        summaries.append({
            "form": r["form"], "xml": r["xml"],
            "blocks": len(r["blocks"]), "items": len(r["items"]),
            "triggers": len(r["triggers"]),
            "program_units": len(r["program_units"]),
            "sql_statements": len(r["sql_statements"]),
            "triggers_with_body": sum(1 for t in r["triggers"] if t["body_length"] > 0),
            "pu_body_total_chars": sum(pu["body_length"] for pu in r["program_units"]),
        })

    OUT = ROOT / "analysis/normalized"
    OUT.mkdir(parents=True, exist_ok=True)

    with (OUT/"xml-triggers.csv").open("w", newline="", encoding="utf-8") as f:
        cols = ["form","trigger","scope","block","item","body_length","body_first_300"]
        w = csv.DictWriter(f, fieldnames=cols); w.writeheader(); w.writerows(all_triggers)

    with (OUT/"xml-program-units.csv").open("w", newline="", encoding="utf-8") as f:
        cols = ["form","name","kind","body_length","body_first_200"]
        w = csv.DictWriter(f, fieldnames=cols); w.writeheader(); w.writerows(all_pus)

    with (OUT/"xml-blocks.csv").open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["form","block","base_table"]); w.writeheader(); w.writerows(all_blocks)

    with (OUT/"xml-items.csv").open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["form","block","item","item_type","column_name","data_type","label"]); w.writeheader(); w.writerows(all_items)

    with (OUT/"xml-sql-statements.csv").open("w", newline="", encoding="utf-8") as f:
        cols = ["form","source_kind","source_name","scope","block","item","length","tables_authoritative","statement_first_400"]
        w = csv.DictWriter(f, fieldnames=cols); w.writeheader(); w.writerows(all_sql)

    with (OUT/"xml-form-summary.csv").open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["form","xml","blocks","items","triggers","program_units","sql_statements","triggers_with_body","pu_body_total_chars"])
        w.writeheader(); w.writerows(summaries)

    MD = ROOT / "docs/forms/xml-coverage.md"
    MD.parent.mkdir(parents=True, exist_ok=True)
    with MD.open("w", encoding="utf-8") as f:
        f.write(f"# XML extraction coverage — Forms 12.2.1 Forms2XML output\n\n")
        f.write(f"XML files parsed: **{len(summaries)}**  \n")
        f.write(f"Total triggers: **{len(all_triggers)}** (with body: {sum(1 for t in all_triggers if t['body_length']>0)})  \n")
        f.write(f"Total program units: **{len(all_pus)}**  \n")
        f.write(f"Total blocks: **{len(all_blocks)}**  \n")
        f.write(f"Total items: **{len(all_items)}**  \n")
        f.write(f"SQL statements extracted: **{len(all_sql)}**\n\n")
        f.write("## Top 20 forms by SQL statement count\n\n| Form | Triggers | SQL stmts | Items | Blocks | PU |\n|---|---|---|---|---|---|\n")
        for s in sorted(summaries, key=lambda x: -x["sql_statements"])[:20]:
            f.write(f"| `{s['form']}` | {s['triggers']} | {s['sql_statements']} | {s['items']} | {s['blocks']} | {s['program_units']} |\n")
        # Base tables referenced
        base_tables = Counter(b["base_table"] for b in all_blocks if b["base_table"])
        f.write(f"\n## Base tables referenced by blocks (DMLDataTargetName)\n\n| Table | Blocks |\n|---|---|\n")
        for t, c in base_tables.most_common(30):
            f.write(f"| `{t}` | {c} |\n")
        # Tables referenced by SQL
        tbl_hits = Counter()
        for r in all_sql:
            for t in r["tables_authoritative"].split(";"):
                if t: tbl_hits[t] += 1
        f.write(f"\n## Tables referenced by SQL statements (top 30)\n\n| Table | Stmts |\n|---|---|\n")
        for t, c in tbl_hits.most_common(30):
            f.write(f"| `{t}` | {c} |\n")

    print(f"parsed: {len(summaries)} forms, {len(all_triggers)} triggers, {len(all_pus)} PUs, {len(all_sql)} SQL stmts")
    return 0

if __name__ == "__main__":
    sys.exit(main())
