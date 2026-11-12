#!/usr/bin/env python3
"""
Multiple small cross-reference tasks in one script.

1. Icon → form: scan each form strings dump for icon basenames (without extension).
2. Dead-code hunt: forms with 0 table edges AND 0 trigger rows.
3. MySQL FK re-verify vs SVG 93-edge count.
4. Views covered by forms (which of 52 views are referenced from forms).

Read-only.
"""
from __future__ import annotations
import csv, re
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

# ---------- 1. Icon → form ----------
icons = set()
with (ROOT / "analysis/inventory/assets.csv").open() as f:
    for r in csv.DictReader(f):
        if r["ext"].lower() in (".ico", ".bmp", ".gif", ".png"):
            icons.add(Path(r["path"]).stem.lower())

icon_pattern = re.compile(r"\b([A-Za-z0-9_]{3,30})\b")
form_to_icons: dict[str, set[str]] = defaultdict(set)
for p in (ROOT / "analysis/extracted/forms").rglob("*.strings.txt"):
    src = None
    with p.open("r", encoding="utf-8", errors="replace") as f:
        for line in f:
            if line.startswith("src=") and src is None:
                src = line[4:].strip()
                continue
            if line.startswith("==="):
                continue
            for m in icon_pattern.finditer(line):
                tok = m.group(1).lower()
                if tok in icons:
                    form_to_icons[src or p.name].add(tok)

icon_csv = ROOT / "analysis/normalized/form-to-icon.csv"
with icon_csv.open("w", newline="", encoding="utf-8") as f:
    w = csv.writer(f)
    w.writerow(["form", "icon"])
    for form in sorted(form_to_icons):
        for icon in sorted(form_to_icons[form]):
            w.writerow([form, icon])
print(f"icon->form edges: {sum(len(v) for v in form_to_icons.values())} across {len(form_to_icons)} forms")

# ---------- 2. Dead-code hunt ----------
# Forms with 0 triggers and 0 table edges are likely stubs or irrelevant.
trig_counts: dict[str, int] = defaultdict(int)
with (ROOT / "analysis/normalized/triggers-per-form.csv").open() as f:
    for r in csv.DictReader(f):
        trig_counts[r["form"]] += 1

table_edges: dict[str, int] = defaultdict(int)
with (ROOT / "analysis/dependency-graphs/form-to-table.csv").open() as f:
    for r in csv.DictReader(f):
        table_edges[r["form"]] += 1

all_fmb_paths = set()
with (ROOT / "analysis/inventory/forms.csv").open() as f:
    for r in csv.DictReader(f):
        if r["ext"].lower() == ".fmb":
            all_fmb_paths.add(r["path"])

dead_candidates = []
for p in sorted(all_fmb_paths):
    t = trig_counts.get(p, 0)
    e = table_edges.get(p, 0)
    if t == 0 and e == 0:
        dead_candidates.append((p, t, e))
    elif t + e <= 3:
        dead_candidates.append((p, t, e))

dc_md = ROOT / "docs/legacy/possible-dead-code.md"
with dc_md.open("w", encoding="utf-8") as f:
    f.write("# Possibly dead or stub `.fmb` forms\n\n")
    f.write("Evidence: **INFERRED**. A form with 0 recovered triggers AND 0 table edges may be a stub, abandoned draft, or a form whose names fell outside the strings dump. A form with ≤ 3 combined may be minimal (a splash screen or launcher).\n\n")
    f.write(f"Total `.fmb`: {len(all_fmb_paths)}  \nCandidates (≤ 3 total signals): **{len(dead_candidates)}**\n\n")
    f.write("| Form | Triggers | Table edges |\n|---|---|---|\n")
    for p, t, e in dead_candidates:
        f.write(f"| `{p}` | {t} | {e} |\n")
    f.write("\n## Caveat\n\nThese candidates must be verified against the launcher menu (likely in `cash_main.fmb`) or against `.fmx` deployment packaging before any removal. Do NOT delete.\n")
print(f"dead-code candidates: {len(dead_candidates)}")

# ---------- 3. MySQL FK re-verify ----------
mysql_body = (ROOT / "المحروسة" / "MAHROSA_FULL_DRAWSQL_MYSQL.sql").read_text(encoding="utf-8", errors="replace")
fk_matches = re.findall(r"FOREIGN KEY\s*\(([^)]+)\)\s*REFERENCES\s*`([^`]+)`", mysql_body)
fk_rows = []
for cols, target in fk_matches:
    fk_rows.append({"columns": cols.strip(), "references": target.strip()})
print(f"MySQL FK clauses: {len(fk_rows)} (SVG edges: 93)")

fk_csv = ROOT / "analysis/normalized/foreign-keys.csv"
with fk_csv.open("w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=["columns","references"])
    w.writeheader()
    w.writerows(fk_rows)

fk_md = ROOT / "docs/database/foreign-keys.md"
with fk_md.open("w", encoding="utf-8") as f:
    f.write("# Foreign-key catalog (from MySQL mirror)\n\n")
    f.write(f"Constraints parsed: **{len(fk_rows)}**  \n")
    f.write(f"SVG `<path marker-end>` edge count: **93**  \n")
    f.write(f"Match verdict: {'✓ identical' if len(fk_rows) == 93 else '⚠ mismatch'}  \n\n")
    by_target: dict[str, int] = defaultdict(int)
    for r in fk_rows:
        by_target[r["references"].upper()] += 1
    f.write("## Most-referenced tables (in-degree)\n\n| Table | Referrers |\n|---|---|\n")
    for t, n in sorted(by_target.items(), key=lambda kv: -kv[1])[:20]:
        f.write(f"| `{t}` | {n} |\n")
    f.write("\n## Full list\n\n| Columns | References |\n|---|---|\n")
    for r in fk_rows:
        f.write(f"| `{r['columns']}` | `{r['references']}` |\n")

# ---------- 4. Views referenced by forms ----------
view_names = set()
with (ROOT / "analysis/normalized/sql-objects.csv").open() as f:
    for r in csv.DictReader(f):
        if r["kind"] == "view":
            view_names.add(r["name"].upper())

form_to_view: dict[str, set[str]] = defaultdict(set)
for p in (ROOT / "analysis/extracted/forms").rglob("*.strings.txt"):
    src = None
    content = p.read_text(encoding="utf-8", errors="replace")
    for line in content.split("\n", 20):
        if line.startswith("src="):
            src = line[4:].strip()
            break
    if not src: continue
    for m in re.finditer(r"\b([A-Z][A-Z0-9_]{2,})\b", content):
        name = m.group(1).upper()
        if name in view_names:
            form_to_view[src].add(name)

vfv = ROOT / "analysis/normalized/form-to-view.csv"
with vfv.open("w", newline="", encoding="utf-8") as f:
    w = csv.writer(f)
    w.writerow(["form","view"])
    for form in sorted(form_to_view):
        for v in sorted(form_to_view[form]):
            w.writerow([form, v])
print(f"form->view edges: {sum(len(v) for v in form_to_view.values())}")
