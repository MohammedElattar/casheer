# CLAUDE.md

Entry point for Claude Code sessions on the `casheer` repo.

**Read `AGENTS.md` first.** It is the canonical source of truth for project mission, rules, layout, counts, policies, and session protocol. This file exists only as a compatibility pointer and must not duplicate the content there.

Mandatory session start order:

1. `AGENTS.md`
2. `.agent/RULES.md`
3. `.agent/CURRENT_STATE.md`
4. `.agent/HANDOFF.md`
5. `.agent/NEXT_ACTIONS.md`
6. `.agent/BLOCKERS.md`
7. `git status` + `git log -5 --oneline`

Hard rules (see `.agent/RULES.md` for the full set):

- Never modify or overwrite `.fmb`, `.fmx`, `.rdf`, `.rep`, `.pll`, `.dmp` files or any legacy source.
- Never import `mhr.dmp` or change DB schema without explicit per-operation user approval.
- Never fabricate source, triggers, schema, or business rules. Tag unverified claims `UNKNOWN` / `INFERRED` / `BLOCKED`.
- Preserve Arabic text and RTL semantics verbatim.
- All new work under `docs/`, `analysis/`, `scripts/legacy-analysis/` or a future user-approved modern-app path.

End of every session: update `.agent/CURRENT_STATE.md`, append `.agent/SESSION_LOG.md`, rewrite `.agent/HANDOFF.md`.
