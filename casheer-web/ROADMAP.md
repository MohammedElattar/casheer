# Casheer web — see master roadmap

Master is in `../casheer-api/ROADMAP.md`. It covers both repos.

Frontend-specific files land in P1 (functional completeness) and P3 (infra/polish) sections there.

Quick resume:

```bash
cd /home/attar/projects/casheer-web
npm install              # if node_modules missing
npm run dev              # http://localhost:5173, proxies /api -> :3000
npm test                 # vitest (2/2 passing today)
```

Backend must be running (`../casheer-api/`) and seeded first — see master roadmap §2.
