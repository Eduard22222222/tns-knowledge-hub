---
tags: [project, active, bonduelle, website, single-brand]
client: Bonduelle România
status: in-progress
created: 2026-04-09
---

# Bonduelle Consumer Platform

**Client:** Bonduelle România
**Status:** Code scaffold complete — awaiting client sign-off on Supabase provisioning
**Template origin:** Forked from Macromex Brand Showcase, adapted to single-brand variant

## Files

Located at `C:/Users/adumi/OneDrive/Desktop/claude/bonduelle-showcase/`:

- `src/` — Vite + React + TS + shadcn-ui source
- `src/pages/Recenzii.tsx` — consumer reviews (single page, 3 product categories)
- `src/pages/Retete.tsx` — recipe grid (6 recipes)
- `src/pages/Competitii.tsx` — competitions listing
- `src/pages/Admin.tsx` — admin CRUD (no brand selector)
- `supabase/migrations/001_bonduelle_schema.sql` — DB schema + seed

## Architectural differences vs Macromex/Kandia

This is the **single-brand variant**. Key changes:

- **No brand selector.** Home page has one hero + 3 section cards (Recenzii / Rețete / Competiții) instead of a 3-brand grid.
- **Flat routes.** `/recenzii`, `/retete`, `/competitii` — no `/brand-*` prefixes.
- **Product categories instead of sub-brands.** The Recenzii page showcases 3 Bonduelle product lines: Porumb Dulce, Mazăre Fină, Fasole Roșie.
- **Schema parity.** Kept the `competitions.brand` column with `check (brand = 'bonduelle')` + default, so the app can share admin code patterns with the other showcases.

## Brand identity

- **Primary color:** `#00843D` (Bonduelle green)
- **Secondary:** `#006B2D` (deep green), `#F5A623` (gold accent)
- **Typography:** fresh, natural, health-conscious
- **Hero headline:** "Legume proaspete, gust adevărat."
- **Hero subtitle:** "Descoperă rețete delicioase, lasă-ne o recenzie și intră la concursurile noastre exclusive."
- **CTA button:** "DESCOPERĂ!"

## Open TODOs (blocked on client sign-off)

- [ ] **Supabase project** — provision dedicated paid Supabase project (~$10/mo). Wire URL + anon key into `src/integrations/supabase/client.ts` (currently env-var placeholders).
- [ ] **Apply migrations** to the new project once provisioned.
- [ ] **Real product photography** — currently using the 3 recipe webps from bonduelle.ro as placeholders on the Recenzii page.
- [ ] **ConsumerVoice form ID** — placeholder link in `Recenzii.tsx`, needs the actual Bonduelle-specific form from their account.
- [ ] **Favicon** — still macromex placeholder in `public/`.

## Client decisions captured

- **2026-04-09** — user confirmed each brand showcase needs its **own** Supabase project for data isolation. Provisioning deferred until client sign-off.
- **2026-04-09** — single-brand variant chosen over multi-brand (Bonduelle has no sub-brands, only product categories).

## Related notes

- [[../Knowledge/Bonduelle Brand Research]]
- Main vault counterpart: `OneDrive/Documents/Obsidian Vault/Projects/Bonduelle Consumer Platform.md` (pointer)
