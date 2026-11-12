# AGENTS.md — canonical entry point for coding agents

**Project:** Casheer — Oracle Forms 6i + Oracle Reports legacy POS/cashier application (restaurant, Arabic UI).
**Mission:** Reverse-engineer completely, then migrate to a browser-based modern stack with no Oracle Forms/Reports/runtime dependency. Preserve business behavior, not obsolete technology.

**Read this file first every session.** Then read, in order:
1. `.agent/RULES.md`
2. `.agent/CURRENT_STATE.md`
3. `.agent/HANDOFF.md`
4. `.agent/NEXT_ACTIONS.md`
5. `.agent/BLOCKERS.md`
6. `git status`

## Repository layout (high level)

- `M_CASHEAR/` — primary legacy app: `.fmb` forms, `.fmx` compiled modules, `.rdf`/`.rep` reports, `.pll` PL/SQL libs, icons, backgrounds, `SQL/` subdir with Oracle dump and extracted DDL text.
- `المحروسة/` — Arabic-named dir containing `MAHROSA_FULL_DRAWSQL_MYSQL.sql` (MySQL mirror — **not authoritative**) and `mahrosa-all (1).svg` schema diagram.
- `.agent/` — durable project memory. Update at end of every session.
- `docs/` — human-readable analysis output organized by topic.
- `analysis/` — machine-readable inventory, extracted sources, conversion logs.
- `scripts/legacy-analysis/` — reusable, idempotent discovery tooling.

## Counts verified Session 1 (2026-11-08)

| Artifact | Count |
|---|---|
| `.fmb` (Forms source) | 63 |
| `.fmx` (Forms compiled) | 58 |
| `.rdf` (Reports source) | 25 |
| `.rep` (Reports compiled) | 25 |
| `.pll` (PL/SQL libs) | 2 (`Lib01.pll`, `HINT.PLL`) |
| `.ogd` (graphs) | 44 |
| Total files (excluding `.git`) | 553 |
| Oracle dumps | 1 (`M_CASHEAR/SQL/mhr.dmp`, 2 MB) |

## Mandatory safety rules (expanded in `.agent/RULES.md`)

- Legacy originals (`.fmb`, `.fmx`, `.rdf`, `.rep`, `.pll`, `.dmp`) are **immutable**. Never edit, move, rename, or overwrite.
- Never fabricate source code, triggers, schema, or business rules. Mark unverified claims `UNKNOWN` or `INFERRED`.
- Never import `mhr.dmp` or alter any DB schema without explicit user approval.
- Never commit credentials, production data, or raw dump exports.
- Preserve Arabic text and RTL semantics verbatim.
- Every conversion / extraction output must carry source provenance (path + SHA-256).

## Current migration phase

**Phase 0–1 (Discovery + Inventory) — in progress.** See `.agent/CURRENT_STATE.md` for exact status.

## Database access policy

- Oracle 12c VM reachable via SSH alias `dobat12c_win_server` (user-provided). Credentials not in repo.
- All DB access must be read-only by default. Schema-modifying or import operations require a separate approval per operation.
- MySQL mirror in `المحروسة/` is a reference, never the authority.

## Code modification policy

- The legacy application code is read-only.
- All new work goes under new paths: `docs/`, `analysis/`, `scripts/legacy-analysis/`, and eventually a modern-app subdir chosen after architecture phase.
- No decision about the modern stack (React, Next, NestJS, Postgres, etc.) has been made yet. Do not scaffold a frontend until the architecture phase and user approval.

## Validation requirement

Before marking any phase complete, cross-check source counts, hash reproducibility, XML well-formedness, and provenance headers. A converted file is not an understood file. A documented form is not a migrated form.

## Session start procedure

1. Read the five files listed above.
2. Run `git status` and `git log -5 --oneline`.
3. Verify previous session's outputs still exist (spot-check paths in `HANDOFF.md`).
4. Resume the top unblocked item in `NEXT_ACTIONS.md`.

## Session end procedure

1. Validate artifacts produced this session.
2. Update `.agent/CURRENT_STATE.md`, `SESSION_LOG.md` (append), `NEXT_ACTIONS.md`, `BLOCKERS.md`, `DECISIONS.md` where applicable.
3. Write `.agent/HANDOFF.md` with exact next command.
4. Summarize to user: completed / discovered / generated files / blockers / next three actions.

## Pointers

- Rules: `.agent/RULES.md`
- Context: `.agent/PROJECT_CONTEXT.md`
- State: `.agent/CURRENT_STATE.md`
- Log: `.agent/SESSION_LOG.md`
- Decisions: `.agent/DECISIONS.md`
- Blockers: `.agent/BLOCKERS.md`
- Backlog: `.agent/NEXT_ACTIONS.md`
- Handoff: `.agent/HANDOFF.md`
- Master prompt source: not stored in repo (user-supplied pasted content).
