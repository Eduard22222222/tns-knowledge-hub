---
tags: [project, active, frostbite, consumer-voice, demo, mockup, fictional-brand]
brand_mockup: FrostBite (100% fictional — premium frozen food)
status: deployed-demo
created: 2026-05-18
origin: Lovable (project ef61a157-121e-4d5a-bc93-cc89cc83e28c)
---

# FrostBite — Consumer Voice Showcase (fictional brand demo)

**Brand:** FrostBite — *100% fictional* mockup brand, "produse congelate premium pentru un stil de viață activ" (premium frozen food). No real client; pure demo asset like PetVia.
**Status:** Deployed demo at https://frostbite-showcase.netlify.app
**Codebase:** `C:\Users\adumi\OneDrive\Desktop\claude\frostbite-platform\`
**Vault:** `C:\Users\adumi\OneDrive\Documents\Frostbite Vault\`
**GitHub:** https://github.com/Eduard22222222/demo-platform (synced from Lovable)
**Lovable project:** https://lovable.dev/projects/ef61a157-121e-4d5a-bc93-cc89cc83e28c
**Base template:** Cloned from the Macromex showcase base (still ships Edenia/Corso/Lastrada sub-brand pages from that lineage).

## Origin

Built in Lovable, never on this machine until 2026-05-18. Pulled via the Lovable→GitHub sync (`Eduard22222222/demo-platform`), cloned locally as `frostbite-platform/`, deployed independently to Netlify.

## Security audit (Macromex-incident policy)

- **Supabase project:** `bwnockrmyvvhlntkiypm` — UNIQUE, auto-provisioned by Lovable. **NOT** Macromex's `vscvgczggesdyfunialz`. No cross-tenant leak risk; project is isolated.
- **`.env` was git-tracked** (Lovable commits it). Hardened locally: added `.env` / `.env.local` to `.gitignore`, created `.env.example`, ran `git rm --cached .env`. Note: Lovable may re-add `.env` on its next sync — only the public `anon` key is present (safe-by-design for a frontend build, RLS-protected), no `service_role` key, so demo deploy is acceptable.

## Deploy

- Netlify site: `frostbite-showcase` (Project ID `4fd8532c-db9f-4126-8709-1c362272d007`)
- URL: https://frostbite-showcase.netlify.app
- SPA `_redirects` (`/*  /index.html  200`) added in `public/` so deep routes don't 404
- Routes verified 200: `/`, `/recenzii`, `/competitii`, `/auth`
- Build: Vite + React + shadcn + Supabase (same stack as the other showcases)

## QR

Added to the master QR set — `qr-codes/qr_frostbite.png` + included in `Consumer_Voice_QR_Sheet.pdf`. Accent colour `#1B6CA8` (icy blue). Decodes verified to `https://frostbite-showcase.netlify.app/`.

## 2026-05-18 visual upgrade to Tchibo level (single-brand)

Decision: kept **single-brand** (no sub-categories — no real product range to justify it), focused purely on visual polish.

- **Stripped** all leftover Edenia/Corso/Lastrada pages + routes. App.tsx now only: `/`, `/recenzii`, `/competitii`, `/retete`, `/auth`, `/admin`. Admin.tsx brand options reduced to single `frostbite` (#1B6CA8).
- **HeroSection fully rebuilt** to Tchibo/PetVia pattern: cinematic dark frozen-food background (nanobanana), dark gradient overlay, white glass card, headline "Intră în comunitatea FrostBite", `CREEAZĂ CONT GRATUIT` glowing CTA → /auth, "Vezi recenziile" secondary link, Conectare top-right. Removed the old Macromex cartoon "personaj" + speech-bubble hero.
- **10 nanobanana assets generated** (all `.png` in `src/assets/`):
  - `hero-frostbite.png` — cinematic moody frozen-food spread
  - `product-pizza.png` / `product-nuggets.png` / `product-legume.png` — consistent FrostBite-branded retail packaging (navy + icy-blue, snowflake logo)
  - `recipe-pizza.png` / `recipe-nuggets.png` / `recipe-supa.png` — match the 3 actual recipes (Quattro Formaggi w/ rucola+truffle, BBQ nuggets+coleslaw, creamy veg soup+croutons)
  - `comp-cooking.png` / `comp-review.png` / `comp-family.png` — competition cover photos (replaced random Unsplash URLs)
- **Recenzii** now shows the 3 branded product packs; **Retete** uses the matching generated recipe photos; **Competitii** uses the generated cover photos.
- **Auth** cleaned: macromex-logo → frostbite-logo, "premii Macromex" → "premii FrostBite".
- Rebuilt + redeployed to https://frostbite-showcase.netlify.app — all routes 200, verified visually (hero + recenzii screenshots in `proposal-screenshots/frostbite_*_check.png`).

## TODO / ideas

- Proposal PDF still not generated (no real client — generate only if pitched as a generic Consumer Voice demo)
- Old unused assets (`background.png`, `personaj.png`, `bula-*.png`, `frostbite-pizza/nuggets/legume.png`, `macromex-logo.png`) still in src/assets — harmless, can be pruned
