---
tags: [project, active, bonduelle, website, single-brand, pointer]
client: Bonduelle România
status: in-progress
created: 2026-04-09
---

# Bonduelle Consumer Platform

**Client:** Bonduelle România (https://www.bonduelle.ro/)
**Status:** Code scaffold complete — awaiting client sign-off
**Template origin:** Forked from [[Macromex Brand Showcase]], adapted to **single-brand variant**

> ⚠️ This is a pointer note. The primary Bonduelle knowledgebase lives in its **own dedicated Obsidian vault** at `C:/Users/adumi/OneDrive/Documents/Bonduelle Vault/` — open that vault in Obsidian for the full project workspace (meeting notes, research, assets).

## Quick links

- Code repo: `C:/Users/adumi/OneDrive/Desktop/claude/bonduelle-showcase/`
- Dedicated vault: `C:/Users/adumi/OneDrive/Documents/Bonduelle Vault/`
- Inside that vault: `Projects/Bonduelle Consumer Platform.md` (canonical note)
- Brand research: `Knowledge/Bonduelle Brand Research.md` in the dedicated vault

## Architectural snapshot

- **Single-brand variant** — unlike Macromex/Kandia (3 sub-brands), Bonduelle has no sub-brands. The 3-brand grid is replaced with 3 section cards: **Recenzii**, **Rețete**, **Competiții**.
- **Flat routes** — `/recenzii`, `/retete`, `/competitii`, `/auth`, `/admin`. No brand prefixes.
- **3 product categories** featured on Recenzii: Porumb Dulce, Mazăre Fină, Fasole Roșie.
- **Green theme** — `#00843D` Bonduelle corporate green, `#F5A623` gold accent.
- **Hero headline** — "Legume proaspete, gust adevărat."

## Open TODOs (blocked on client sign-off)

- [ ] Provision dedicated paid Supabase project (~$10/mo)
- [ ] Apply `001_bonduelle_schema.sql` migration
- [ ] Wire real Supabase URL + anon key into `client.ts`
- [ ] Real product photography for Porumb/Mazăre/Fasole cards (currently placeholder recipe webps)
- [ ] Bonduelle-specific ConsumerVoice form ID

## Client decisions captured

- **2026-04-09** — user confirmed each brand showcase needs its own paid Supabase project for data isolation. Provisioning deferred until client sign-off.
- **2026-04-09** — single-brand variant chosen (Bonduelle has no sub-brands, only product categories).
- **2026-04-09** — Bonduelle gets its own dedicated Obsidian vault at `Documents/Bonduelle Vault/`, separate from the main TNS vault, for cleaner client-facing knowledgebase.

## Related

- [[Macromex Brand Showcase]] — template source
- [[Kandia Brand Showcase]] — sister project (multi-brand variant)
