---
tags: [project, active, kandia, website]
client: Kandia Dulce
status: active
---

# Kandia Brand Showcase

**Client:** Kandia Dulce (https://kandia-dulce.ro/)
**Status:** Demo in progress
**Started:** 2026-04-09

## Overview
Brand showcase platform for Kandia Dulce — clone/adaptation of the Macromex Brand Showcase, optimized for Kandia's confectionery brand portfolio. Same architecture (Vite + React + shadcn + Supabase), new theme and content.

## Demo brands (3, mirroring Macromex 3-brand layout)
- **Kandia** — flagship chocolate. Gradient `#e12030 → #8a1a1e`. Products: Lapte 80g, Finesse, Rom.
- **ROM** — iconic Romanian bar. Gradient `#0033a0 → #e12030` (tricolor). Products: Autentic 30g, Arahide & Caramel, Cremă Tartinabilă.
- **Sugus** — gummy candies. Gradient `#f4a300 → #e12030`. Products: Classic, Bubble Gum, Ursuleți.

## Files
Located in `C:/Users/adumi/OneDrive/Desktop/claude/`:
- `kandia-brand-showcase/` — Website project (Vite + React + shadcn + Supabase)
- `start-kandia.js` — Dev server launcher (port 5176)
- Launch config name: `kandia-dev` (in `.claude/launch.json`)

Brand assets downloaded from kandia-dulce.ro and placed in `kandia-brand-showcase/src/assets/`:
- Logos: `kandia-logo.png` (parent), `kandia.png`, `rom.png`, `sugus.png`, plus bonus `magura.png`, `laura.png`, `silvana.png`, `primola.png`, `fagaras.png`, `anidor.png`, `papi.png`, `ulpio.png`
- Banners: `banner-kandia.jpg`, `banner-rom.jpg`, `banner-sugus.jpg`, `banner-magura.jpg`, `banner-silvana.png`, `banner-laura.jpg`

## Theme
- Primary red: `#e12030`
- Dark red: `#8a1a1e`
- Accents: `#f4a300` (Sugus gold), `#0033a0` (ROM blue)
- Hero headline: "Gustul tradiției, dulceața momentului!"
- Tagline: "Maeștrii dulciurilor românești" (130+ year heritage)

## Routes
`/` · `/auth` · `/admin` · `/kandia-recenzii` · `/kandia-competitii` · `/kandia-competitii/:id` · `/kandia-retete` · `/rom-recenzii` · `/rom-competitii` · `/rom-retete` · `/sugus-recenzii` · `/sugus-competitii` · `/sugus-retete` · `/competitii` · `/retete`

## Supabase
- Schema migration: `supabase/migrations/001_kandia_schema.sql`
- Brand check constraint: `('kandia', 'rom', 'sugus')`
- Needs fresh Supabase project (not reusing Macromex `vscvgczggesdyfunialz`)
- Seed: 6 Kandia-themed competitions (2 per brand)

## Client decisions captured
- **2026-04-09** — user confirmed each brand showcase needs its **own** paid Supabase project (~$10/mo each) for data isolation. Provisioning deferred until client sign-off.

## Open TODOs
1. **[DEFERRED]** Create fresh Supabase project after Kandia sign-off. Then set `VITE_SUPABASE_URL` / `VITE_SUPABASE_PUBLISHABLE_KEY`
2. Update `supabase/config.toml` `project_id`
3. Replace placeholder ConsumerVoice form ID (`f-166995`) with Kandia-specific forms per brand
4. Swap placeholder per-SKU product shots (currently reusing brand banners)
5. Delete old Macromex/Edenia/Corso/Lastrada dead assets in `src/assets/`

## Related
- [[Macromex Brand Showcase]] — parent project this was cloned from
