#!/usr/bin/env python3
"""
Parse `M_CASHEAR/SQL/trigger.txt` using its ad-hoc convention:

  <table_name>-------------------------
  ----------------- <timing> <event> <columns> ------------------------------
  BEGIN
    ...body...
  END;
  /

Emit analysis/normalized/db-triggers.csv and docs/database/db-triggers.md.

Read-only.
"""
from __future__ import annotations
import csv, re, sys
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN = ROOT / "M_CASHEAR" / "SQL" / "trigger.txt"
OUT_CSV = ROOT / "analysis" / "normalized" / "db-triggers.csv"
OUT_MD  = ROOT / "docs" / "database" / "db-triggers.md"

TABLE_HDR = re.compile(r"^([a-zA-Z_][\w$]*)\s*-{10,}\s*$")
# e.g. "----------------- before    insert ------------------------------"
# or   "----- update    h_name,h_flag -----"
# or   "----- after     insert or update  -----"
EVENT_HDR = re.compile(r"-{3,}\s*(?P<timing>before|after|instead\s+of)?\s*(?P<event>insert(?:\s+or\s+update)?(?:\s+or\s+delete)?|update(?:\s+or\s+delete)?|delete)\s*(?P<cols>[a-zA-Z_,\s\w$]*?)\s*-{3,}\s*$", re.IGNORECASE)
SQL_WORD = re.compile(r"\b(SELECT|INSERT|UPDATE|DELETE|RAISE|EXCEPTION|BEGIN|IF|LOOP|CURSOR|COMMIT|ROLLBACK)\b", re.IGNORECASE)

def main() -> int:
    if not IN.exists():
        print(f"missing {IN}", file=sys.stderr)
        return 2
    lines = IN.read_text(encoding='utf-8', errors='replace').splitlines()
    cur_table = None
    cur_trigger = None
    triggers = []
    for i, raw in enumerate(lines, 1):
        line = raw.rstrip()
        m = TABLE_HDR.match(line)
        if m:
            cur_table = m.group(1).upper()
            cur_trigger = None
            continue
        m = EVENT_HDR.search(line)
        if m and cur_table:
            cur_trigger = {
                "table": cur_table,
                "line": i,
                "timing": (m.group("timing") or "").lower(),
                "event": m.group("event").lower(),
                "columns": re.sub(r"\s+", " ", (m.group("cols") or "")).strip().strip(","),
                "body_first_line": "",
                "sql_keyword_hits": 0,
            }
            triggers.append(cur_trigger)
            continue
        if cur_trigger is not None:
            if not cur_trigger["body_first_line"] and line.strip() and not line.strip().startswith("-"):
                cur_trigger["body_first_line"] = line.strip()[:200]
            if SQL_WORD.search(line):
                cur_trigger["sql_keyword_hits"] += 1

    OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    with OUT_CSV.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["table","line","timing","event","columns","body_first_line","sql_keyword_hits"])
        w.writeheader()
        w.writerows(triggers)

    OUT_MD.parent.mkdir(parents=True, exist_ok=True)
    tables = {}
    for t in triggers:
        tables.setdefault(t["table"], []).append(t)
    with OUT_MD.open("w", encoding="utf-8") as f:
        f.write("# Database triggers — parsed from `M_CASHEAR/SQL/trigger.txt`\n\n")
        f.write(f"Source: `{IN.relative_to(ROOT).as_posix()}`\n\n")
        f.write(f"Trigger blocks found: **{len(triggers)}**  \n")
        f.write(f"Tables with triggers: **{len(tables)}**\n\n")
        f.write("Convention: each `<table>---…` header starts a trigger block for that table. Event line encodes `<timing> <event> [<columns>]`. Body fragment shows first non-separator line to confirm trigger has code.\n\n")
        f.write("## Per-table triggers\n\n")
        for t in sorted(tables):
            f.write(f"### `{t}`\n\n")
            f.write("| Line | Timing | Event | Column scope | Body first line | SQL kw hits |\n|---|---|---|---|---|---|\n")
            for tr in tables[t]:
                f.write(f"| {tr['line']} | {tr['timing']} | {tr['event']} | {tr['columns']} | `{tr['body_first_line']}` | {tr['sql_keyword_hits']} |\n")
            f.write("\n")
    print(f"triggers: {len(triggers)} across {len(tables)} tables -> {OUT_CSV}")
    return 0

if __name__ == "__main__":
    sys.exit(main())
