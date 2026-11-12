# casheer-web

Casheer POS frontend. React + Vite + TypeScript, Arabic/RTL, Noto Sans Arabic.

## Quickstart

```bash
npm install
npm run dev                  # http://localhost:5173, proxies /api -> :3000
```

## Layout

```
src/
├── main.tsx               Entry, mounts React
├── App.tsx                Router + <AuthProvider>
├── api/client.ts          fetch wrapper + JWT refresh-on-401
├── hooks/useAuth.tsx      <AuthProvider>, useAuth()
├── pages/
│   ├── Login.tsx          /login
│   └── POS.tsx            / — point picker, shift, invoice editor
├── components/
│   └── Layout.tsx         Sidebar + main
├── i18n/ar.ts             Arabic strings (single source of truth)
├── styles/
│   ├── tokens.css         Design tokens (navy, gold, ivory, …)
│   ├── index.css          Globals + btn/card/input primitives
│   ├── theme-legacy.css   Full prototype CSS carried over (reference)
│   └── theme-classes.txt  165 class names from the prototype
└── types/index.ts         DTO shapes mirrored from backend
```

## Design tokens (extracted from `Mahrousa-Reception-Interactive-Demo-v3.html`)

```
--navy #14516B   --gold #C5A052   --ink #213A46
--navy2 #007FA6  --bright #F2D490 --muted #5E7881
--ivory #FFFCF5                   --line #DCE7E6
```

Arabic font: **Noto Sans Arabic** loaded from Google Fonts in `index.html`. Keep `dir="rtl"` on `<html>`.

## Conventions

- Never hardcode Arabic strings in JSX — add to `src/i18n/ar.ts`.
- All API calls go through `api()` in `src/api/client.ts` (handles JWT + refresh).
- No ORM on backend, so DTO types in `src/types/index.ts` are the contract.
