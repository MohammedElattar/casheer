# .agent/RULES.md — permanent engineering rules

These rules apply to every session. They override convenience and speed.

## Immutability of legacy sources

- Files matching `*.fmb`, `*.fmx`, `*.rdf`, `*.rep`, `*.pll`, `*.plx`, `*.ogd`, `*.ogr`, `*.mmb`, `*.mmx`, `*.dmp` are **immutable**.
- Never edit, rename, move, delete, or overwrite them.
- Never commit modified copies of them back into the repo.
- To study them, copy into `analysis/extracted/` and work on the copy, with a provenance header giving source path and SHA-256.

## Provenance

Every extracted or generated artifact must carry, in a header or sidecar:

- Source path (repo-relative).
- Source SHA-256.
- Tool name + version used.
- Tool command identifier (not the raw command line if it contains credentials).
- Timestamp (UTC, ISO 8601).

Artifacts without provenance must be regenerated or discarded.

## Evidence classification

Every important claim in docs must be tagged:

- `VERIFIED` — directly supported by inspected source, metadata, or reproducible tool output.
- `INFERRED` — strongly suggested by multiple pieces of evidence, not conclusively proven.
- `UNKNOWN` — insufficient evidence.
- `BLOCKED` — cannot be investigated until a listed dependency resolves.

Never upgrade a tag without new evidence. Never erase `UNKNOWN`/`BLOCKED` by rewriting history.

## No fabrication

- Do not invent triggers, program units, SQL, schema objects, business rules, workflows, form navigation, or user roles.
- Do not write XML that looks like extracted Forms metadata but isn't.
- If a file cannot be parsed, record it under `analysis/unresolved/` with a note — never silently skip.

## Database safety

- Default DB access mode: **read-only**.
- Never run `DROP`, `TRUNCATE`, `DELETE`, `UPDATE`, `INSERT`, `ALTER`, `GRANT`, `REVOKE`, `impdp`, `imp`, or any schema-modifying statement without explicit user approval **for that specific operation**.
- Never store DB passwords, wallets, or TNS secrets in the repo.
- Never export production data into the repo.

## Preserve Arabic / RTL

- Preserve Arabic filenames (`المحروسة/`) and directory structure.
- Preserve RTL text in docs and in future UI.
- Never lossy-transliterate Arabic identifiers.

## Automation

- Any task that will be repeated must have an idempotent script under `scripts/legacy-analysis/`.
- Scripts must support safe reruns and not corrupt partial output.
- Scripts must not contain credentials; take them from env or user input at runtime.

## Documentation discipline

- Every business rule must link to source evidence (file + offset or trigger name).
- Every decision goes in `.agent/DECISIONS.md` with the template there; major ones also get an ADR under `docs/adr/`.
- Every migration mapping goes in `docs/migration/traceability-matrix.md`.
- No undocumented skipped file: any extraction failure is logged in `analysis/conversion-logs/` and summarized in `.agent/BLOCKERS.md`.

## Memory discipline

- `AGENTS.md` and `.agent/*.md` are updated as part of completing a task, not optional housekeeping.
- `.agent/SESSION_LOG.md` is append-only.
- `.agent/HANDOFF.md` is rewritten each session end with the exact next command.

## Approval boundary (summary; see `AGENTS.md` for full policy)

Allowed without approval: read-only repo inspection, generating docs/analysis, creating scripts, `strings`/`file`/`xxd` on legacy binaries, SSH `which`/`ls`/version checks on the VM, host-side parsing of dump bytes.

Requires per-operation approval: importing dumps, any DDL/DML, installing software, changing VM config, modifying network/security, removing legacy files, migrating production data, scaffolding the modern application, production cutover.
