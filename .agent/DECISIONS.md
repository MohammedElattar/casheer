# .agent/DECISIONS.md

Architecture and technical decisions. Each entry uses the template below.

---

## DEC-001 — Domain scope revised: hotel/resort + restaurant, not restaurant-only

- Date: 2026-11-08.
- Context: Initial hypothesis from `.fmb` filenames (`cash_main`, `take_away`, `points`) suggested a restaurant POS. Dump header forensics on `mhr.dmp` revealed a `BED_IN` table with `ROOM_NO`, `H_NO`, `B_FROM`, `B_TO`, `B_PRICE`, `B_DAY`, `B_Q` (hotel room/bed booking with nightly price), plus `DIR_TBL` with `PER_DISC` (per-manager discount), `BLACK_LIST`, `DELIVERY`. Schema name `MAHROSA` matches a known hospitality-industry naming pattern.
- Options considered:
  1. Keep "restaurant POS" scope and treat `BED_IN` as irrelevant noise.
  2. Expand to "hotel + restaurant" mixed-use hospitality system.
  3. Wait until full schema import before deciding.
- Decision: **option 2**. Treat the system as a mixed-use hospitality back-office (lodging, F&B cashier, takeaway, delivery, loyalty points, shift management) until further evidence narrows or widens scope.
- Reasoning: option 1 contradicts verified DDL. Option 3 under-informs documentation and migration planning now; waiting has cost. Option 2 is reversible — later evidence can trim scope if `BED_IN` is unused.
- Consequences:
  - `.agent/PROJECT_CONTEXT.md` module list widened accordingly.
  - Phase-9 architecture candidates must support concurrent hospitality + POS operations (reservations + invoicing in one app).
  - Business-rule catalog (Phase 7) must cover lodging rates and restaurant pricing both.
- Status: ACCEPTED.

---

## DEC-002 — Blanket approval for Casheer reverse-engineering operations on `oracle19c` and `dobat12c_win_server`

- Date: 2026-11-08.
- Context: User granted blanket approval ("you have my fucken approval man don't ask me for any approvement"). Supersedes the per-operation approval gate in `RULES.md` for Casheer-related work on the two user-owned VMs.
- Decision: Agent may, without further approval: (a) create isolated schemas/PDBs/users on `oracle19c` for `mhr.dmp` work; (b) copy any Casheer artifact (`.fmb`, `.rdf`, `.dmp`, `.pll`) to either VM at non-production paths (e.g. `C:\casheer_rev\`); (c) run `imp`, `impdp`, `exp`, `expdp`, `sqlplus`, `frmcmp.exe`, `frmbld.exe` on VM copies; (d) write and run JDAPI Java programs on `dobat12c_win_server`.
- Still forbidden (preserved from `RULES.md`): modifying the Casheer repo originals in `M_CASHEAR/` or `المحروسة/`; `git push --force`; deleting commits; writing anything into the existing `DOBATPDB` schema; impersonating other users' data; any production cutover.
- Reasoning: User is asleep; blanket approval lets the agent make real progress unblocking BLK-001, BLK-003, BLK-005, NXT-008 in one autonomous sweep. Risk to the repo and to the user's unrelated dobat project remains zero because originals are untouched and work lands in dedicated `C:\casheer_rev\` directories or new isolated schemas.
- Consequences: `BLK-001`, `BLK-005`, `NXT-008` may now be resolved empirically in the next iterations.
- Status: ACCEPTED.

---

## DEC-003 — Modern stack: Node.js + PostgreSQL (redesigned) + React

- Date: 2026-11-09.
- Context: Greenfield web rebuild. No live Casheer DB, no production cutover. Legacy schema (192 tables) was recovered for domain understanding, not literal port. User statement: "the database will be redesigned... current one is shit".
- Options considered: (fallback alternatives not actively weighed — user picked directly).
- Decision:
  - **Backend:** Node.js.
  - **Database:** PostgreSQL. **Redesigned domain model**, NOT a 1:1 port from Oracle. Legacy schema catalog (`docs/database/tables.md`, `docs/database/foreign-keys.md`) and SERY workflow (`docs/workflows/sery-invoice-lifecycle.md`) are inputs to the new model, not blueprints.
  - **Frontend:** React.
- Reasoning: Standard modern stack; team familiarity implied; PostgreSQL covers the Oracle feature surface actually used (no Oracle-specific hooks in recovered Forms except the `ora_ffi` tooltip library which was already de-scoped — see `docs/migration/ora-ffi-inventory.md`).
- Consequences:
  - Table-by-table migration docs lose priority; replace with **domain-model + business-rule → entity-mapping** docs.
  - Deprecated Forms builtins (`run_product`, `ora_ffi`, `TEXT_IO`) have no port — they are replaced by platform-native equivalents (HTTP download, browser `title` attr tooltips, server file I/O).
  - `MAHROSA.*` schema name goes away. `point_tbl.d1..d7` style column layouts can be normalized freely.
  - **Hijri date support, Arabic RTL support, dual numbering (`serial_no` vs `ser_no`), 2-decimal floor rounding, `p_ok` state semantics** — these are the business invariants that MUST carry through even in redesign. See `docs/workflows/sery-invoice-lifecycle.md` modernization notes.
  - Auth: the hard-coded `IF :PASS = 'advisor'` back-door in `LOG_IN_IN` is dropped on the new stack (DEC-004 pending — auth scheme choice).
- Status: ACCEPTED.

---

## DEC-004 — Stack specifics + integration intent

- Date: 2026-11-09.
- Context: DEC-003 picked Node + Postgres + React. User refined specifics and flagged downstream integration.
- Decision:
  - **Backend framework:** Express.js (not NestJS/Fastify).
  - **DB access:** raw SQL via `pg` driver. No ORM.
  - **Frontend tooling:** React + Vite (SPA, not Next.js/Remix).
  - **Repo layout:** separate repos for backend and frontend (not monorepo).
  - **Auth:** JWT tokens + bcrypt for password hashing.
  - **Integration:** this Casheer rebuild will be **merged/integrated into a larger "main big project"** later. **The parent project does NOT exist yet** (clarified 2026-11-09) — Casheer is being built first. Conventions must therefore be portable rather than matching anything specific; Casheer's own choices will likely seed the parent's.
- Reasoning: User chose directly.
- Consequences:
  - **Parent-project constraints dominate.** Before scaffolding, the Casheer repo needs: parent project's auth claim shape (user id, roles), parent's API conventions (REST vs RPC, URL style, error envelope), parent's DB naming convention, and whether the parent already owns `employee` / `user` / `point` tables. If so, Casheer migrates to referenced ids, not duplicates them.
  - Raw SQL + no ORM means: hand-written migration files (`sql/migrations/NNNN_*.sql`), explicit transaction boundaries, parameterized queries only (`$1`, `$2`) to prevent injection.
  - Express + raw SQL leaves repo layout open: typical is `src/{routes,services,db,middleware}/` with `middleware/auth.js` for JWT verify.
  - JWT + bcrypt: standard. `bcrypt.hash(password, 12)`. JWT secret via env var, never in source. Token lifetime + refresh strategy still open.
  - SERY business invariants that need app-tier enforcement (ORM-free): dual counter (`serial_no`/`ser_no`), 2-decimal `FLOOR(x*100)/100`, `p_ok` state transitions, `point_tbl.d1..d7` weekday gate.
- Status: ACCEPTED.

---

## DEC-005 — Printing + Arabic/RTL in V1

- Date: 2026-11-09.
- Context: SERY prints thermal receipts (80mm, dual copy). Arabic text is UI-wide and receipt-wide. User requirement: "must be perfect with Arabic language".
- Decision:
  - **Arabic + RTL support:** required in V1.
  - **Print pipeline:** HTML → PDF → OS print queue. Specifically:
    - Server renders receipt as HTML with `dir="rtl"` + embedded Arabic font (**Noto Sans Arabic** or **Cairo**).
    - HTML → PDF via **Puppeteer** (headless Chromium) — gives best-in-class Arabic shaping + ligatures, far better than `pdfkit` or `jsPDF`.
    - PDF → printer via OS queue (CUPS on Linux, Windows Print Spooler on Windows). Printer name in DB (replaces legacy `point_tbl.prnt_n`).
    - Backend exposes `POST /api/v1/invoices/:id/print` → returns the PDF OR sends directly to configured printer.
  - **Fonts shipped with backend:** Noto Sans Arabic + regular Latin fallback. Embed as asset so renders are deterministic across machines.
- Reasoning: Legacy `run_product(reports, ..., destype=printer, desname='<printer>,LPT1:')` is obsolete. Arabic rendering in PDF libraries that bypass Chromium (pdfkit/pdfmake/jsPDF) is unreliable for Arabic ligatures. Puppeteer+CSS is heavier but produces print-perfect Arabic.
- Consequences:
  - Puppeteer dependency = ~150 MB Chromium per machine. Acceptable for server.
  - Frontend also uses the same Noto Sans Arabic font for screen UI, so on-screen WYSIWYG with receipt.
  - Thermal-printer-specific CSS (80mm width, no margins, monospace columns) lives in a `receipt.css` shared template.
- Status: ACCEPTED.

---

## DEC-006 — Remaining stack defaults (unanswered items picked)

- Date: 2026-11-09.
- Context: User said "do all the recommended steps you find". Pick sane defaults for still-open items.
- Decision:
  - **Hijri calendar:** V2 (not V1). Legacy stubbed it (`Lib01.P_DATEOP.F_DATECONV` returned hard-coded `'01-01-1421'`, zero callers). Gregorian-only V1 with `date-fns` or `luxon`; Hijri display adaptor can be added later via `date-fns-hijri` or custom umm-al-qura table without schema change.
  - **Deploy target:** `docker-compose` on a Linux box. Services: `api`, `web`, `db` (Postgres 16), plus a `caddy` reverse proxy for TLS. Portable to on-prem single box OR any cloud VPS.
  - **JWT lifetime:** 15 min access token + 7 day refresh token. Refresh stored httpOnly cookie; access in-memory on client.
  - **API style:** REST, `/api/v1/*`. Resource paths: `/invoices`, `/invoice-lines`, `/items`, `/points`, `/employees`, `/shifts`, `/reports/*`. Error envelope: `{ error: { code, message, details? } }`.
  - **Repo layout:** two sibling repos under `/home/attar/projects/`:
    - `casheer-api` — Node + Express + pg
    - `casheer-web` — React + Vite + TypeScript
  - **TypeScript:** yes for BOTH backend and frontend. Raw SQL still used; `pg` types for row shapes.
  - **Linting/format:** ESLint + Prettier, repo-local config.
  - **Testing:** `node:test` + `supertest` for API; `vitest` + `@testing-library/react` for web. Not blocking V1 scaffold, but wired in from day 1.
- Reasoning: Standard, boring, revisitable. Nothing exotic to lock in.
- Consequences:
  - Backend will have Puppeteer (~150 MB Chromium) for print — document as a known-heavy dep.
  - docker-compose keeps local dev == prod shape; no "works on my machine" drift.
  - TypeScript across stack means shared types later (DTOs) when the future "main big project" absorbs this.
- Status: ACCEPTED.

---

## Template (copy for new decisions)

## DEC-XXX — <short title>

- Date: YYYY-MM-DD.
- Context:
- Options considered:
  1.
  2.
- Decision:
- Reasoning:
- Consequences:
- Status: PROPOSED | ACCEPTED | REJECTED | SUPERSEDED-BY-DEC-YYY.
