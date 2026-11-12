#!/usr/bin/env python3
"""
Generate per-form markdown stubs from the triggers-per-form CSV + strings dumps.

Read-only. For each form in a target family (default: sery*, take_away*,
takeaway_pizza*, plus cash_main/points/point_close/item_tbl/item_type/
employee/dept/log_in_in/statistics_form), writes:

  docs/forms/<basename>.md

Each stub contains:
  - source path + SHA-256 (from strings dump header)
  - verified version marker
  - trigger table (scope, block, item)
  - toolbar buttons / item names recovered from strings
  - UNKNOWN sections with evidence tags, pending PL/SQL body recovery

Idempotent; overwrites.
"""
from __future__ import annotations

import csv
import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
TRIG_CSV = ROOT / "analysis" / "normalized" / "triggers-per-form.csv"
STRINGS_ROOT = ROOT / "analysis" / "extracted" / "forms"
OUT_DIR = ROOT / "docs" / "forms"

CORE_PATTERNS = [
    re.compile(r"^M_CASHEAR/(?:امتداد عضوية  حتى شهر3/|SQL/)?sery[^/]*\.fmb$", re.IGNORECASE),
    re.compile(r"^M_CASHEAR/(?:امتداد عضوية  حتى شهر3/|SQL/)?take_?away[^/]*\.fmb$", re.IGNORECASE),
    re.compile(r"^M_CASHEAR/takeaway_pizza.*\.fmb$", re.IGNORECASE),
    re.compile(r"^M_CASHEAR/cash_main\.fmb$"),
    re.compile(r"^M_CASHEAR/points?\.fmb$", re.IGNORECASE),
    re.compile(r"^M_CASHEAR/point_close\.fmb$", re.IGNORECASE),
    re.compile(r"^M_CASHEAR/item_tbl\.fmb$", re.IGNORECASE),
    re.compile(r"^M_CASHEAR/item_type\.fmb$", re.IGNORECASE),
    re.compile(r"^M_CASHEAR/employee\.fmb$", re.IGNORECASE),
    re.compile(r"^M_CASHEAR/dept\.fmb$", re.IGNORECASE),
    re.compile(r"^M_CASHEAR/log_in_in\.fmb$", re.IGNORECASE),
    re.compile(r"^M_CASHEAR/statistics_form\.fmb$", re.IGNORECASE),
]

def is_core(path: str) -> bool:
    return any(p.match(path) for p in CORE_PATTERNS)

def read_header(strings_file: Path) -> dict[str, str]:
    hdr = {}
    with strings_file.open("r", encoding="utf-8", errors="replace") as f:
        for line in f:
            if line.startswith("==="):
                break
            if "=" in line:
                k, _, v = line.partition("=")
                hdr[k.strip()] = v.strip()
    return hdr

TOOLBAR_RE = re.compile(r"\(TOOLBAR\.([A-Z0-9_]+)\)")
BLOCK_ITEM_RE = re.compile(r"\(([A-Z0-9_]+)\.([A-Z0-9_]+)\)")
TABLE_HINT_RE = re.compile(r"\b(FROM|INTO|UPDATE|TABLE)\s+([A-Z][A-Z0-9_]{2,30})\b")

def scan_strings(strings_file: Path) -> dict:
    out = {"toolbar_buttons": set(), "block_items": set(), "table_hints": set()}
    with strings_file.open("r", encoding="utf-8", errors="replace") as f:
        for line in f:
            for m in TOOLBAR_RE.finditer(line):
                out["toolbar_buttons"].add(m.group(1))
            for m in BLOCK_ITEM_RE.finditer(line):
                out["block_items"].add(f"{m.group(1)}.{m.group(2)}")
            for m in TABLE_HINT_RE.finditer(line):
                out["table_hints"].add(m.group(2))
    return out

def main() -> int:
    if not TRIG_CSV.exists():
        print(f"missing {TRIG_CSV}", file=sys.stderr)
        return 2

    rows_by_form: dict[str, list[dict]] = defaultdict(list)
    with TRIG_CSV.open("r", encoding="utf-8") as f:
        for r in csv.DictReader(f):
            rows_by_form[r["form"]].append(r)

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    written = 0

    for form_path, trig_rows in sorted(rows_by_form.items()):
        if not is_core(form_path):
            continue
        strings_file = STRINGS_ROOT / (form_path + ".strings.txt")
        if not strings_file.exists():
            # Some strings files live under different kind dirs; try form path relative
            alt = ROOT / "analysis" / "extracted" / "forms" / (form_path + ".strings.txt")
            if alt.exists():
                strings_file = alt
            else:
                continue
        hdr = read_header(strings_file)
        found = scan_strings(strings_file)

        basename = Path(form_path).stem
        # Avoid name clash across directories
        suffix = ""
        candidate = OUT_DIR / f"{basename}.md"
        if candidate.exists():
            parent_tag = Path(form_path).parent.as_posix().replace("/", "_").replace(" ", "_")
            candidate = OUT_DIR / f"{basename}__{parent_tag}.md"

        with candidate.open("w", encoding="utf-8") as f:
            f.write(f"# Form: `{basename}`  — **STUB (strings-derived)**\n\n")
            f.write(f"- Source: `{form_path}`\n")
            f.write(f"- SHA-256: `{hdr.get('sha256','')}`\n")
            f.write(f"- Size: {hdr.get('size','')} bytes\n")
            f.write(f"- Version marker: `{hdr.get('version_markers','')}`\n")
            f.write(f"- Strings dump: `{strings_file.relative_to(ROOT).as_posix()}`\n")
            f.write(f"- Trigger rows recovered: **{len(trig_rows)}** (unique)\n\n")

            f.write("## Business purpose — UNKNOWN\n\n")
            f.write("Awaiting PL/SQL body recovery (BLK-005 toolchain decision).\n\n")

            f.write(f"## Toolbar buttons ({len(found['toolbar_buttons'])})\n\n")
            if found["toolbar_buttons"]:
                for b in sorted(found["toolbar_buttons"]):
                    f.write(f"- `TOOLBAR.{b}`\n")
            else:
                f.write("None recovered from strings (no toolbar block, or non-standard naming).\n")
            f.write("\n")

            f.write(f"## Block.item references ({len(found['block_items'])})\n\n")
            for b in sorted(found["block_items"])[:80]:
                f.write(f"- `{b}`\n")
            if len(found["block_items"]) > 80:
                f.write(f"- ... ({len(found['block_items'])-80} more)\n")
            f.write("\n")

            f.write(f"## Candidate database tables referenced ({len(found['table_hints'])})\n\n")
            f.write("INFERRED from strings; false positives possible — verify against `docs/database/tables.md`.\n\n")
            for t in sorted(found["table_hints"]):
                f.write(f"- `{t}`\n")
            f.write("\n")

            f.write("## Triggers (table)\n\n")
            f.write("| Trigger | Scope | Block | Item |\n|---|---|---|---|\n")
            for r in sorted(trig_rows, key=lambda x: (x["scope"], x["trigger"], x["block"], x["item"])):
                f.write(f"| `{r['trigger']}` | {r['scope']} | `{r['block']}` | `{r['item']}` |\n")
            f.write("\n")

            f.write("## Unknown — pending PL/SQL body recovery\n\n")
            f.write("- SQL statements executed by each trigger — **UNKNOWN**\n")
            f.write("- Validation rules — **UNKNOWN** (403 `WHEN-VALIDATE-ITEM` hits exist across all forms, but body text not in strings dump)\n")
            f.write("- Transaction boundaries (`COMMIT_FORM`, explicit `COMMIT`) — **UNKNOWN**\n")
            f.write("- Navigation to other forms (`CALL_FORM`, `OPEN_FORM`) — **UNKNOWN** without body\n")
            f.write("- Report invocations (`RUN_PRODUCT`, `RUN_REPORT_OBJECT`) — **UNKNOWN**\n")
            f.write("- Error handling behavior — **UNKNOWN**\n")
            f.write("\n")

            f.write("## Evidence trail\n\n")
            f.write(f"- Strings tool: {hdr.get('tool','')}\n")
            f.write(f"- Strings generated: {hdr.get('generated','')}\n")
            f.write(f"- Trigger extraction: `scripts/legacy-analysis/parse_triggers.py`\n")
        written += 1

    print(f"wrote {written} form stubs under {OUT_DIR}")
    return 0

if __name__ == "__main__":
    sys.exit(main())
