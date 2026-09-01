# Bonduelle Consumer Platform

**Client:** Bonduelle România (https://www.bonduelle.ro/)
**Status:** Code scaffold complete, awaiting client sign-off on Supabase provisioning
**Template:** Forked from macromex-brand-showcase, adapted to SINGLE-BRAND variant
**Created:** 2026-04-09

## Location

- Code: `C:/Users/adumi/OneDrive/Desktop/claude/bonduelle-showcase/`
- **Dedicated Obsidian vault:** `C:/Users/adumi/OneDrive/Documents/Bonduelle Vault/` (separate from main TNS vault)
- Pointer note in main vault: `Obsidian Vault/Projects/Bonduelle Consumer Platform.md`

## Key architectural decisions

- **Single-brand variant.** Unlike Macromex/Kandia (3 sub-brands), Bonduelle has only one brand. No brand selector, no brand-prefixed routes.
- **Flat routes:** `/recenzii`, `/retete`, `/competitii`, `/auth`, `/admin`
- **3 product categories** on Recenzii page: Porumb Dulce, Mazăre Fină, Fasole Roșie
- **Dedicated Obsidian vault** per client request on 2026-04-09

## Brand

- Primary: `#00843D` (Bonduelle green), `#006B2D` (dark), `#F5A623` (gold)
- Hero: "Legume proaspete, gust adevărat."
- CTA: "DESCOPERĂ!"

## Tech stack

- Vite + React + TypeScript + shadcn-ui + Tailwind
- Supabase (deferred, placeholders in `src/integrations/supabase/client.ts`)
- React Router (flat routes)
- framer-motion for animations

## Blocked TODOs (awaiting client sign-off)

- Fresh Supabase project provisioning (~$10/mo)
- Apply `supabase/migrations/001_bonduelle_schema.sql`
- Wire real Supabase URL + anon key
- Real product photography
- ConsumerVoice form ID
