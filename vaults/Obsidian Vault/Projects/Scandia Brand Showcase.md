---
tags: [project, active, scandia, website, multi-brand, pointer]
client: Scandia Food
status: in-progress
created: 2026-04-11
---

# Scandia Brand Showcase

**Client:** Scandia Food (https://scandia.ro/)
**Status:** Code scaffold complete — awaiting client sign-off
**Template origin:** Forked from [[Macromex Brand Showcase]] via safe clone

> ⚠️ This is a pointer note. The primary Scandia knowledgebase lives in its **own dedicated Obsidian vault** at `C:/Users/adumi/OneDrive/Documents/Scandia Vault/` — open that vault in Obsidian for meeting notes, research, and asset management.

## Quick links

- Code repo: `C:/Users/adumi/OneDrive/Desktop/claude/scandia-brand-showcase/`
- Dedicated vault: `C:/Users/adumi/OneDrive/Documents/Scandia Vault/`
- Inside that vault: `Projects/Scandia Brand Showcase.md` (canonical note)
- Brand research: `Knowledge/Scandia Brand Research.md`
- Dev server: `http://localhost:8084/`

## Architectural snapshot

- **3-brand variant** — mirrors Kandia's structure. Home page shows 3 brand cards → each has Reviews/Competitii/Retete sub-pages.
- **Brands:** Scandia Sibiu (burgundy/gold), Bucegi (forest green), Sadu (deep red/charcoal). Rotina + Bălea parked for v2.
- **9 product cards** with real pack shots from the Scandia CDN
- **18 authentic Romanian recipes** (6 per brand) + **9 competitions** + **15 consumer reviews**
- **Hardened Supabase client** with URL blocklist — cannot connect to Macromex/Kandia/Bonduelle even if env vars were tampered with

## Open TODOs (blocked on client sign-off)

- [ ] Provision dedicated paid Supabase project (~$10/mo)
- [ ] Apply `001_scandia_schema.sql` migration
- [ ] Wire real Supabase URL + anon key into `.env.local`
- [ ] Scandia-specific ConsumerVoice form IDs (3 placeholders, one per brand)
- [ ] Expand to Rotina + Bălea in v2

## Client decisions captured

- **2026-04-11** — Scandia Food kickoff. Chose 3-brand variant (Sibiu/Bucegi/Sadu) for v1 demo.
- **2026-04-11** — Dedicated Obsidian vault created per standing user instruction (each client gets its own vault).
- **2026-04-11** — Dev port 8084 assigned. Ports in use: Macromex=8080, Bonduelle=8082/8083, Scandia=8084.

## Related

- [[Macromex Brand Showcase]] — template source
- [[Kandia Brand Showcase]] — sister 3-brand project
- [[Bonduelle Consumer Platform]] — sister single-brand project
