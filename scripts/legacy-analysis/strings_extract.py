#!/usr/bin/env python3
"""
Bulk strings extraction over legacy Oracle Forms/Reports/PLL binaries.

Read-only. Walks the repo and emits, per source binary:
  analysis/extracted/<kind>/<repo-relative-path>.strings.txt

Each output starts with a provenance header:
  src=<path> sha256=<hex> size=<bytes>
  tool=strings(1) GNU binutils
  generated=<utc iso8601>
  version_markers=<e.g. ROS.60050>
  ascii_lines=<n> ucs2_lines=<n>
  trigger_count=<n>  (WHEN-/PRE-/POST-/KEY-/ON-)
  pl_sql_markers=<n> (BEGIN, DECLARE, SELECT, INSERT, UPDATE, DELETE, IF)

Then:
  ===ASCII===
  ...strings -n 6 ...
  ===UCS2-LE===
  ...strings -n 8 -e l ...

Also writes a coverage summary: analysis/extracted/strings-coverage.csv

Idempotent: overwrites outputs.

Usage:
  python3 scripts/legacy-analysis/strings_extract.py [repo_root]
"""
from __future__ import annotations

import csv
import hashlib
import os
import re
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

EXT_KIND = {
    ".fmb": "forms",
    ".fmx": "forms",
    ".mmb": "forms",
    ".mmx": "forms",
    ".ogd": "forms",
    ".ogr": "forms",
    ".rdf": "reports",
    ".rep": "reports",
    ".pll": "libraries",
    ".plx": "libraries",
}

TRIGGER_RE = re.compile(r"\b(WHEN-|PRE-|POST-|KEY-|ON-[A-Z]|NEW-FORM-INSTANCE)")
PLSQL_RE = re.compile(
    r"^\s*(BEGIN|DECLARE|SELECT|INSERT|UPDATE|DELETE|IF |COMMIT|ROLLBACK|RAISE|EXCEPTION|CURSOR|FOR |WHILE |LOOP|RETURN|PROCEDURE|FUNCTION)\b",
    re.IGNORECASE,
)
VER_RE = re.compile(r"\b(ROS\.\d{4,5}|FOR\.\d+|REP\.\d+|R\d+\.\d+|V\d+\.\d+)")


def sha256_of(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def run_strings(path: Path, encoding: str | None, min_len: int) -> list[str]:
    cmd = ["strings", "-n", str(min_len)]
    if encoding:
        cmd += ["-e", encoding]
    cmd += [str(path)]
    out = subprocess.run(cmd, capture_output=True, text=True, errors="replace", check=False)
    return out.stdout.splitlines()


def main() -> int:
    root = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
    out_root = root / "analysis" / "extracted"
    summary_rows = []

    for dirpath, dirnames, filenames in os.walk(root):
        # Skip our own output dirs
        dirnames[:] = [d for d in dirnames if d not in {".git", "analysis", "docs", ".agent", "scripts"}]
        for name in filenames:
            p = Path(dirpath) / name
            ext = p.suffix.lower()
            kind = EXT_KIND.get(ext)
            if not kind:
                continue
            rel = p.relative_to(root).as_posix()
            out_path = out_root / kind / (rel + ".strings.txt")
            out_path.parent.mkdir(parents=True, exist_ok=True)

            ascii_lines = run_strings(p, None, 6)
            ucs2_lines = run_strings(p, "l", 8)

            all_lines = ascii_lines + ucs2_lines
            versions = sorted({m.group(0) for line in all_lines for m in [VER_RE.search(line)] if m})
            triggers = sum(1 for line in all_lines if TRIGGER_RE.search(line))
            plsql = sum(1 for line in all_lines if PLSQL_RE.search(line))

            try:
                size = p.stat().st_size
            except OSError:
                size = 0
            sha = sha256_of(p)
            ts = datetime.now(timezone.utc).isoformat()

            with out_path.open("w", encoding="utf-8", errors="replace") as f:
                f.write(f"src={rel}\n")
                f.write(f"sha256={sha}\n")
                f.write(f"size={size}\n")
                f.write(f"tool=strings(1) GNU binutils\n")
                f.write(f"generated={ts}\n")
                f.write(f"version_markers={','.join(versions) if versions else 'none'}\n")
                f.write(f"ascii_lines={len(ascii_lines)}\n")
                f.write(f"ucs2_lines={len(ucs2_lines)}\n")
                f.write(f"trigger_count={triggers}\n")
                f.write(f"pl_sql_markers={plsql}\n")
                f.write("===ASCII===\n")
                f.write("\n".join(ascii_lines))
                f.write("\n===UCS2-LE===\n")
                f.write("\n".join(ucs2_lines))
                f.write("\n")

            summary_rows.append({
                "path": rel,
                "kind": kind,
                "ext": ext,
                "size": size,
                "sha256": sha,
                "version_markers": ";".join(versions),
                "ascii_lines": len(ascii_lines),
                "ucs2_lines": len(ucs2_lines),
                "trigger_count": triggers,
                "pl_sql_markers": plsql,
                "output": out_path.relative_to(root).as_posix(),
            })

    summary_rows.sort(key=lambda r: (r["kind"], r["path"]))
    summary_csv = out_root / "strings-coverage.csv"
    summary_csv.parent.mkdir(parents=True, exist_ok=True)
    with summary_csv.open("w", newline="", encoding="utf-8") as f:
        cols = ["path", "kind", "ext", "size", "sha256",
                "version_markers", "ascii_lines", "ucs2_lines",
                "trigger_count", "pl_sql_markers", "output"]
        w = csv.DictWriter(f, fieldnames=cols)
        w.writeheader()
        w.writerows(summary_rows)

    # Markdown summary
    md = out_root / "strings-coverage.md"
    with md.open("w", encoding="utf-8") as f:
        f.write(f"# Strings extraction coverage\n\nGenerated: {datetime.now(timezone.utc).isoformat()}\n\n")
        f.write(f"Total binaries processed: {len(summary_rows)}\n\n")
        by_kind: dict[str, int] = {}
        total_trig = 0
        total_ver: set[str] = set()
        for r in summary_rows:
            by_kind[r["kind"]] = by_kind.get(r["kind"], 0) + 1
            total_trig += r["trigger_count"]
            for v in r["version_markers"].split(";"):
                if v:
                    total_ver.add(v)
        f.write("## By kind\n\n| Kind | Count |\n|---|---|\n")
        for k, c in sorted(by_kind.items()):
            f.write(f"| {k} | {c} |\n")
        f.write(f"\nUnique version markers observed: `{', '.join(sorted(total_ver)) or 'none'}`\n")
        f.write(f"\nTotal trigger-name hits across all binaries: **{total_trig}**\n")
        f.write("\nSee `strings-coverage.csv` for per-file detail.\n")

    print(f"processed {len(summary_rows)} binaries, summary at {summary_csv}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
