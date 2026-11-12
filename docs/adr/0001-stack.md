# ADR 0001 — Stack: Node + Express + TypeScript + Postgres + React + Vite

- Date: 2026-11-09.
- Supersedes: nothing. Formalizes `DEC-003`, `DEC-004`, `DEC-006`.
- Status: ACCEPTED.

## Context

Legacy Casheer is Oracle Forms 6i + Oracle Reports + Oracle 9i DB (MAHROSA schema, 192 tables). The user authorized a greenfield rebuild — no live DB to migrate, no production cutover planned. The master prompt §14 required an architecture decision before Phase 9 scaffold.

The decisions were taken directly by the user in session 6, not derived from alternatives analysis. This ADR formalizes them.

## Decision

- **Backend runtime:** Node.js (LTS at scaffold time — 22.x as of 2026-11).
- **Backend framework:** Express.js.
- **Backend language:** TypeScript (`strict: true`).
- **DB driver:** `pg` (node-postgres). Raw SQL. **No ORM.**
- **Database:** PostgreSQL 16.
- **Frontend framework:** React.
- **Frontend tooling:** Vite (SPA, not Next.js/Remix).
- **Frontend language:** TypeScript.
- **Auth:** JWT (HS256 access, 15 min) + bcrypt-hashed passwords (cost 12) + httpOnly refresh cookie (7 day, rotating).
- **Print pipeline:** Puppeteer headless Chromium renders HTML+CSS→PDF with embedded Noto Sans Arabic.
- **Deploy:** `docker-compose` on a Linux host. Services: `api`, `web`, `db` (Postgres 16), `caddy` (TLS proxy).
- **Repo layout:** two sibling git repos — `/home/attar/projects/casheer-api`, `/home/attar/projects/casheer-web`. Not a monorepo.
- **Testing:** `node:test` + `supertest` (backend); `vitest` + `@testing-library/react` (frontend).
- **Lint / format:** ESLint + Prettier, repo-local.

## Reasoning

- Standard, boring, revisitable stack. No exotic lock-in.
- Raw SQL + explicit transactions matches the legacy's precise business arithmetic (dual counter, FLOOR rounding, `p_ok` state machine). ORMs hide transaction boundaries and make these invariants brittle.
- Express is simpler than NestJS for a project of this size; adding structure later is cheap.
- Vite over Next because this is a POS screen, not a content site — no SSR needed, bundle size matters less than build speed.
- Puppeteer is heavy (~150 MB Chromium) but is the only widely-available HTML→PDF pipeline with best-in-class Arabic shaping. Alternatives (`pdfkit`, `jsPDF`) fail on complex Arabic ligatures.
- Separate repos keep the "big project" integration path open (DEC-004); when the parent project exists it can consume either side independently.

## Consequences

- Backend has a mandatory Chromium dependency. Document in `casheer-api/README.md`.
- Shared types between backend and frontend (DTOs) are not shared via a workspace. Either duplicate manually, or publish a small `@casheer/types` package later. V1 duplicates.
- Migrations are forward-only hand-written SQL files under `casheer-api/sql/migrations/NNNN_*.sql`.
- Parameterized queries only (`$1`, `$2`). String interpolation of SQL is a review failure.
- `docker-compose` is the one deploy target; no k8s manifests in V1.

## Alternatives not pursued (for the record)

- NestJS: considered, rejected. Too much scaffolding for the V1 slice.
- Prisma / Drizzle: considered, rejected. Business invariants (floor rounding, dual counter under serialization) are hostile to ORM abstraction.
- Monorepo (`pnpm` workspace or Nx): rejected because the parent project is not known and forcing a workspace shape now could conflict later.
- Next.js: rejected because no SSR requirement; Vite boots faster for dev.
