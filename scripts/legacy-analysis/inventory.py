#!/usr/bin/env python3
"""
Repo inventory for casheer legacy reverse-engineering.

Read-only. Walks the repo (excluding .git and output dirs), emits SHA-256,
size, file(1) signature, classification, and duplicate grouping into CSVs
under analysis/inventory/.

Idempotent: sorted output, stable hashes, overwrites CSVs each run.

Usage:
    python3 scripts/legacy-analysis/inventory.py [repo_root]

Default repo_root: current working directory.
"""
from __future__ import annotations

import csv
import hashlib
import os
import subprocess
import sys
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path

EXCLUDE_DIR_NAMES = {".git", "analysis", "docs", ".agent", "scripts"}
BUF = 1 << 20  # 1 MiB

# extension -> (bucket, is_legacy_binary)
EXT_MAP = {
    ".fmb": ("forms", True),
    ".fmx": ("forms", True),
    ".mmb": ("forms", True),
    ".mmx": ("forms", True),
    ".rdf": ("reports", True),
    ".rep": ("reports", True),
    ".pll": ("libraries", True),
    ".plx": ("libraries", True),
    ".ogd": ("forms", True),  # graphs tied to forms module
    ".ogr": ("forms", True),
    ".dmp": ("database-files", True),
    ".sql": ("database-files", False),
    ".txt": ("database-files", False),  # many SQL extracts live as .txt here
    ".ora": ("database-files", False),
    ".ico": ("assets", False),
    ".bmp": ("assets", False),
    ".png": ("assets", False),
    ".jpg": ("assets", False),
    ".jpeg": ("assets", False),
    ".gif": ("assets", False),
    ".svg": ("assets", False),
    ".mdb": ("database-files", False),
    ".accdb": ("database-files", False),
}


def sha256_of(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(BUF), b""):
            h.update(chunk)
    return h.hexdigest()


def file_signature(path: Path) -> str:
    try:
        out = subprocess.run(
            ["file", "-b", str(path)],
            capture_output=True, text=True, timeout=10, check=False,
        )
        return (out.stdout or out.stderr).strip().replace("\n", " ")
    except Exception as e:  # noqa: BLE001
        return f"file(1) failed: {e!r}"


def classify(ext: str) -> tuple[str, bool]:
    return EXT_MAP.get(ext, ("other", False))


def walk(root: Path):
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = [d for d in dirnames if d not in EXCLUDE_DIR_NAMES]
        for name in filenames:
            yield Path(dirpath) / name


def main() -> int:
    root = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
    out_dir = root / "analysis" / "inventory"
    out_dir.mkdir(parents=True, exist_ok=True)

    rows = []
    for p in walk(root):
        try:
            size = p.stat().st_size
        except OSError:
            continue
        ext = p.suffix.lower()
        bucket, _ = classify(ext)
        rel = p.relative_to(root).as_posix()
        rows.append({
            "path": rel,
            "name": p.name,
            "ext": ext,
            "size_bytes": size,
            "sha256": sha256_of(p),
            "signature": file_signature(p),
            "bucket": bucket,
        })

    rows.sort(key=lambda r: r["path"])

    # Duplicate groups by hash
    by_hash: dict[str, list[dict]] = defaultdict(list)
    for r in rows:
        by_hash[r["sha256"]].append(r)
    dup_groups = {h: rs for h, rs in by_hash.items() if len(rs) > 1}

    # Historical variant grouping (lexical stem, same bucket=forms)
    # Simple: strip trailing _old|_last|_last\d+|_copy| - copy| \(\d+\) and digits
    import re
    stem_re = re.compile(r"(?:_old|_last\d*|_copy|\s*-\s*copy|\s*\(\d+\)|_\d+-\d+)+$", re.IGNORECASE)
    variant_groups: dict[tuple[str, str], list[dict]] = defaultdict(list)
    for r in rows:
        if r["bucket"] != "forms" or r["ext"] not in {".fmb", ".fmx"}:
            continue
        base = os.path.splitext(r["name"])[0].lower()
        base = stem_re.sub("", base)
        variant_groups[(base, r["ext"])].append(r)
    variant_groups = {k: v for k, v in variant_groups.items() if len(v) > 1}

    # Write all-files.csv
    all_cols = ["path", "name", "ext", "size_bytes", "sha256", "signature", "bucket"]
    with (out_dir / "all-files.csv").open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=all_cols)
        w.writeheader()
        w.writerows(rows)

    # Bucketed CSVs
    for bucket in ("forms", "reports", "libraries", "database-files", "assets"):
        with (out_dir / f"{bucket}.csv").open("w", newline="", encoding="utf-8") as f:
            w = csv.DictWriter(f, fieldnames=all_cols)
            w.writeheader()
            w.writerows(r for r in rows if r["bucket"] == bucket)

    # Duplicates
    with (out_dir / "duplicates.csv").open("w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow(["sha256", "count", "paths"])
        for h, rs in sorted(dup_groups.items()):
            w.writerow([h, len(rs), "|".join(r["path"] for r in rs)])

    # Historical variants
    with (out_dir / "form-variants.csv").open("w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow(["stem", "ext", "count", "paths", "note"])
        for (stem, ext), rs in sorted(variant_groups.items()):
            w.writerow([
                stem, ext, len(rs), "|".join(r["path"] for r in rs),
                "active-vs-historical UNRESOLVED",
            ])

    # Summary markdown
    counts_by_bucket = defaultdict(int)
    counts_by_ext = defaultdict(int)
    total_bytes = 0
    for r in rows:
        counts_by_bucket[r["bucket"]] += 1
        counts_by_ext[r["ext"]] += 1
        total_bytes += r["size_bytes"]

    ts = datetime.now(timezone.utc).isoformat()
    with (out_dir / "inventory-summary.md").open("w", encoding="utf-8") as f:
        f.write("# Inventory summary\n\n")
        f.write(f"Generated: {ts}\n\n")
        f.write(f"Root: `{root}`\n\n")
        f.write(f"Total files scanned: **{len(rows)}**\n\n")
        f.write(f"Total bytes: {total_bytes}\n\n")
        f.write("## By bucket\n\n| Bucket | Count |\n|---|---|\n")
        for b, c in sorted(counts_by_bucket.items(), key=lambda x: -x[1]):
            f.write(f"| {b} | {c} |\n")
        f.write("\n## Top extensions\n\n| Ext | Count |\n|---|---|\n")
        for e, c in sorted(counts_by_ext.items(), key=lambda x: -x[1])[:30]:
            f.write(f"| `{e or '(none)'}` | {c} |\n")
        f.write(f"\n## Duplicate groups (by SHA-256): {len(dup_groups)}\n")
        f.write(f"\n## Form variant groups (by lexical stem): {len(variant_groups)}\n")
        f.write("\nSee `duplicates.csv` and `form-variants.csv`.\n")

    print(f"wrote inventory for {len(rows)} files to {out_dir}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
