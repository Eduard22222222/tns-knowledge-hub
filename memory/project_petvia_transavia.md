# PetVia by Transavia — Pet-Food Demo Showcase

**Created:** 2026-05-04
**Client:** Transavia SA (Romania) — owner of Fragedo, Romania's #1 trusted meat brand
**Mockup brand:** PetVia by Transavia (fictional pet-food extension for the demo)
**Status:** Deployed demo at https://petvia-platform.netlify.app
**Codebase:** `C:\Users\adumi\OneDrive\Desktop\claude\petvia-platform\`
**Dev port:** 8092
**Vault:** `C:\Users\adumi\OneDrive\Documents\Transavia Vault\`
**Base template:** Cloned from `bonduelle-showcase/` (single-brand architecture, NOT 3-brand like Tchibo)

## Strategic premise

Transavia controls the entire Romanian poultry supply chain (feed → birds → meat) and wants to expand into pet food. PetVia is a mockup brand that demonstrates what their consumer-facing platform could look like: hrana naturala cu pui romanesc, leveraging the trust equity of Fragedo.

## Architecture

**Single brand, 3 product categories** (not 3 separate brands):
- **PetVia Caini** — dog food. Color: green + warm orange `#E8763A`
- **PetVia Pisici** — cat food. Color: green + soft coral `#E36B7C`
- **PetVia Rasfat** — treats. Color: green + warm gold `#C9A24B`

**Parent palette:** Transavia/PetVia green `#0E7C3A` (HSL 136 80% 27%), dark variant `#0A5C2C`.

## Pages

`/`, `/recenzii`, `/retete` (renamed in copy as "Sfaturi & Retete"), `/competitii`, `/auth`, `/admin`. Identical to Bonduelle structure. SPA `_redirects` rule deployed.

## Hero section

- **Both desktop AND mobile** play a looping muted Pexels video (ID 4106998 — dog eating from bowl, 1920×1080, 18.5 MB, ©cottonbro studio).
- Poster fallback: AI-generated kitchen scene with golden retriever + cat.
- Top-left: real Transavia logo (pulled from transavia.ro/sites/default/files/logo_0.png) on a soft white card.
- Hero white card: PetVia logo + "Intra in comunitatea PetVia" headline + subtitle + 3 category badge circles + glowing CTA "CREEAZA CONT GRATUIT" + "o noua linie de produse de la Transavia" attribution caption.

## Assets generated

Via nanobanana (saved to `transavia-assets-staging/` then copied to `src/assets/`):
- `petvia-logo.png` (parent wordmark)
- `petvia-caini-logo.png`, `petvia-pisici-logo.png`, `petvia-rasfat-logo.png` (category badges)
- `hero-petvia.jpg` (rustic kitchen with pets)

Real assets:
- `transavia-logo.png` — official from transavia.ro
- `hero-pet-desktop.mp4` — Pexels dog-eating video

## Important demo decisions

- **No Supabase** — runs in OFFLINE STUB mode by design (user said "we dont need supabase yet it s a demo"). Static comps in Competitii.tsx + static reviews in Recenzii.tsx provide all visible content.
- **Supabase isolation guard** in `src/integrations/supabase/client.ts` blocks tenant-leak URLs (macromex/bonduelle/kandia/scandia/caroli/cristim/tchibo). Defense-in-depth against another env-leak incident.
- **Recipe images** are placeholder Bonduelle webp files retained as visual stand-ins; titles are fully pet-relevant (chicken & rice for sick dogs, homemade liofilizat treats, food transition guide, etc.). Replace with proper pet photography before any client pitch.
- **Product photos** = the category logos (each card uses caini/pisici/rasfat-logo.png as the visual). Replace with proper packaging shots before pitch.

## Deployment

- Netlify site: `petvia-platform` (slug), team `edumitriu04`
- Project ID: `14e94dfa-4a26-4ef0-ac31-5b307911d498`
- Production URL: https://petvia-platform.netlify.app
- Created 2026-05-04 with `npx netlify sites:create --name petvia-platform --account-slug edumitriu04`

## Open TODOs (before pitching to Transavia)

- [ ] Replace placeholder recipe images with proper pet-care photography
- [ ] Generate 9 actual product packaging shots (3 per category SKU line)
- [ ] Refine AI-generated logos as proper vector assets
- [ ] Custom domain (e.g. `petvia.transavia.ro` or `petvia.ro`)
- [ ] Build a pitch deck PDF (`ConsumerVoice_Transavia_PetVia_v1.pdf`) with screenshots
- [ ] If client signs off: provision dedicated Supabase project (~$10/mo)
- [ ] Translate to English variant for international market consideration

## Pitch angles (memorized for next conversation)

1. **Vertical integration** — already control grain-to-fork, now extend grain-to-bowl
2. **Trust transfer** — Fragedo = #1 trusted meat brand 7 years running, that trust extends naturally
3. **Domestic premium gap** — most Romanian premium pet food is imported (Royal Canin, Hill's, Acana). PetVia would be the FIRST premium-Romanian pet food
4. **Cross-sell** — existing Fragedo retail shelves give instant distribution
5. **Story:** "If it's good enough for our family table, it's good enough for our family pet"
