#!/usr/bin/env python3
"""
Build a trigger-name matrix from bulk strings dumps.

Read-only. Walks analysis/extracted/forms/**/*.strings.txt, extracts
Oracle Forms trigger-name lines and their parenthetical scope, emits
analysis/normalized/triggers-per-form.csv and
docs/forms/trigger-coverage.md.

Strings from Forms 6i .fmb often appear as:
  WHEN-BUTTON-PRESSED (BLOCK.ITEM)
  WHEN-VALIDATE-ITEM (Form)
  PRE-INSERT (BLOCK)
  ON-ERROR (Form)
  !WHEN-BUTTON-PRESSED (TOOLBAR.JOB)
Leading control bytes (!"#$%&…) sometimes prefix the real trigger name.
"""
from __future__ import annotations

import csv
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
IN_DIR = ROOT / "analysis" / "extracted" / "forms"
OUT_CSV = ROOT / "analysis" / "normalized" / "triggers-per-form.csv"
OUT_MD  = ROOT / "docs" / "forms" / "trigger-coverage.md"

# Core Forms trigger names seen in the wild; ordering matters so longer wins.
TRIGGER_NAMES = (
    "WHEN-BUTTON-PRESSED", "WHEN-CHECKBOX-CHANGED",
    "WHEN-RADIO-CHANGED", "WHEN-LIST-CHANGED", "WHEN-IMAGE-PRESSED",
    "WHEN-NEW-FORM-INSTANCE", "WHEN-NEW-BLOCK-INSTANCE",
    "WHEN-NEW-RECORD-INSTANCE", "WHEN-NEW-ITEM-INSTANCE",
    "WHEN-VALIDATE-ITEM", "WHEN-VALIDATE-RECORD",
    "WHEN-MOUSE-ENTER", "WHEN-MOUSE-LEAVE", "WHEN-MOUSE-DOWN",
    "WHEN-MOUSE-UP", "WHEN-MOUSE-CLICK", "WHEN-MOUSE-DOUBLECLICK",
    "WHEN-MOUSE-MOVE",
    "WHEN-WINDOW-ACTIVATED", "WHEN-WINDOW-DEACTIVATED",
    "WHEN-WINDOW-CLOSED", "WHEN-WINDOW-RESIZED",
    "WHEN-TIMER-EXPIRED",
    "WHEN-CREATE-RECORD", "WHEN-REMOVE-RECORD",
    "WHEN-CLEAR-BLOCK", "WHEN-DATABASE-RECORD",
    "WHEN-FORM-NAVIGATE",
    "PRE-FORM", "POST-FORM", "PRE-BLOCK", "POST-BLOCK",
    "PRE-RECORD", "POST-RECORD", "PRE-TEXT-ITEM", "POST-TEXT-ITEM",
    "PRE-INSERT", "POST-INSERT", "PRE-UPDATE", "POST-UPDATE",
    "PRE-DELETE", "POST-DELETE", "PRE-QUERY", "POST-QUERY",
    "PRE-SELECT", "POST-SELECT", "PRE-COMMIT", "POST-COMMIT",
    "PRE-LOGON", "POST-LOGON", "PRE-LOGOUT", "POST-LOGOUT",
    "KEY-COMMIT", "KEY-EXIT", "KEY-NEXT-ITEM", "KEY-PREV-ITEM",
    "KEY-NEXT-RECORD", "KEY-PREV-RECORD", "KEY-NEXT-BLOCK",
    "KEY-PREV-BLOCK", "KEY-ENTQRY", "KEY-EXEQRY", "KEY-CLRBLK",
    "KEY-CLRREC", "KEY-DELREC", "KEY-DUPREC", "KEY-MENU",
    "KEY-HELP", "KEY-LISTVAL", "KEY-F0", "KEY-F1", "KEY-F2", "KEY-F3",
    "KEY-F4", "KEY-F5", "KEY-F6", "KEY-F7", "KEY-F8", "KEY-F9",
    "KEY-F10", "KEY-F11", "KEY-F12", "KEY-OTHERS",
    "ON-ERROR", "ON-MESSAGE", "ON-LOGON", "ON-LOGOUT",
    "ON-CHECK-UNIQUE", "ON-CLEAR-DETAILS",
    "ON-COMMIT", "ON-ROLLBACK", "ON-COUNT",
    "ON-INSERT", "ON-UPDATE", "ON-DELETE",
    "ON-LOCK", "ON-POPULATE-DETAILS", "ON-SELECT",
    "ON-FETCH", "ON-SAVEPOINT", "ON-SEQUENCE-NUMBER",
    "ON-DBLCLICK",
)
TRIG_RE = re.compile(r"\b(" + "|".join(sorted(TRIGGER_NAMES, key=len, reverse=True)) + r")(?:\s*\(([^)\r\n]{1,200})\))?")

def classify_scope(parenthetical: str | None) -> tuple[str, str, str]:
    if not parenthetical:
        return "unknown", "", ""
    p = parenthetical.strip()
    if p.lower() == "form":
        return "form", "", ""
    parts = p.split(".")
    if len(parts) == 1:
        return "block", parts[0], ""
    if len(parts) >= 2:
        return "item", parts[0], ".".join(parts[1:])
    return "unknown", "", ""

def main() -> int:
    OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    OUT_MD.parent.mkdir(parents=True, exist_ok=True)

    rows = []
    per_form_counts: dict[str, Counter] = defaultdict(Counter)
    trig_global = Counter()
    form_scope_global = Counter()
    files_processed = 0

    for p in sorted(IN_DIR.rglob("*.strings.txt")):
        rel_src = ""
        files_processed += 1
        seen: set[tuple[str, str, str, str]] = set()
        with p.open("r", encoding="utf-8", errors="replace") as f:
            for line in f:
                if line.startswith("src=") and not rel_src:
                    rel_src = line[4:].rstrip("\n")
                m = TRIG_RE.search(line)
                if not m:
                    continue
                trig = m.group(1)
                paren = m.group(2)
                scope, block, item = classify_scope(paren)
                key = (trig, scope, block, item)
                if key in seen:
                    continue
                seen.add(key)
                rows.append({
                    "form": rel_src or p.relative_to(ROOT).as_posix(),
                    "trigger": trig,
                    "scope": scope,
                    "block": block,
                    "item": item,
                })
                per_form_counts[rel_src or p.name][trig] += 1
                trig_global[trig] += 1
                form_scope_global[scope] += 1

    rows.sort(key=lambda r: (r["form"], r["trigger"], r["block"], r["item"]))
    with OUT_CSV.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["form", "trigger", "scope", "block", "item"])
        w.writeheader()
        w.writerows(rows)

    with OUT_MD.open("w", encoding="utf-8") as f:
        f.write("# Trigger coverage — from strings extraction\n\n")
        f.write(f"Source: `{IN_DIR.relative_to(ROOT).as_posix()}`\n\n")
        f.write(f"Files parsed: **{files_processed}**  \n")
        f.write(f"Unique trigger rows (form, trigger, scope, block, item): **{len(rows)}**\n\n")
        f.write("## Top 15 trigger names across all forms\n\n| Trigger | Count |\n|---|---|\n")
        for t, c in trig_global.most_common(15):
            f.write(f"| `{t}` | {c} |\n")
        f.write("\n## Scope distribution\n\n| Scope | Count |\n|---|---|\n")
        for s, c in form_scope_global.most_common():
            f.write(f"| {s} | {c} |\n")
        f.write("\n## Per-form trigger total (top 20)\n\n| Form | Unique triggers |\n|---|---|\n")
        totals = sorted(per_form_counts.items(), key=lambda kv: -sum(kv[1].values()))[:20]
        for form, ctr in totals:
            f.write(f"| `{form}` | {sum(ctr.values())} |\n")
        f.write(f"\nFull detail: `{OUT_CSV.relative_to(ROOT).as_posix()}`\n")

    print(f"parsed {files_processed} strings dumps, {len(rows)} trigger rows -> {OUT_CSV}")
    return 0

if __name__ == "__main__":
    sys.exit(main())
