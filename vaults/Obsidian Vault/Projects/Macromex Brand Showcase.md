---
tags: [project, active, macromex, website, consumer-voice, template-origin]
client: Macromex
status: active
created: 2026-03
updated: 2026-05-04
---

# Macromex Brand Showcase

**Client:** Macromex
**Status:** In Progress
**Rolul în portofoliu:** **Originul** template-ului ConsumerVoice — toate showcase-urile multi-brand pornesc de aici.

## ConsumerVoice template lineage

Macromex Brand Showcase a fost punctul de plecare. Din arhitectura ei (Vite + React 18 + Supabase + Netlify, 3-brand grid pe homepage, recenzii / rețete / competiții, hero card + CTA, ConsumerVoice form embed) au fost derivate toate showcase-urile clientilor B2C FMCG:

### Forks 3-brand (păstrează grila de 3 sub-branduri)
- [[Tchibo Brand Showcase]] — Tchibo / Davidoff / Eduscho · ✅ live tchibo-showcase.netlify.app
- [[Kandia Brand Showcase]] — 3 sub-branduri Kandia
- [[Caroli Brand Showcase]] — Caroli / Campofrio / Maestro
- [[Scandia Brand Showcase]] — Sibiu / Bucegi / Sadu (Rotina + Bălea parked v2)
- [[Intersnack Brand Showcase]] — Chio / Tyrrells / Pom-Bär (foloseste „Idei de servire" în loc de „Rețete")
- [[Vel Pitar Brand Showcase]] — French Toast / de Vel Pitar / Chef Gourmand
- [[Nordic Food Brand Showcase]] — Rana / Cirio / Voila
- [[Cris-Tim Brand Showcase]] — Cris-Tim / Matache Măcelaru / Alpinia

### Forks single-brand (variantă cu 3 secțiuni în loc de 3 sub-branduri)
- [[Bonduelle Consumer Platform]] — Bonduelle România · 3 secțiuni Recenzii / Rețete / Competiții

## Files

Located in `C:/Users/adumi/OneDrive/Desktop/claude/`:

- `macromex-brand-showcase/` — Website project
- `macromex-files/` — Client assets
- `start-macromex.js` — Dev server launcher
- `ConsumerVoice_Macromex_Proposal.pdf` + v2 → v8d — proposals iterations
- `build_macromex_proposal.py` — Proposal PDF build script

## Related analysis notes

- [[Macromex In-Store Estimations]] — Campaign projections based on real Hula Hoops data
- [[Macromex Social Media Analysis]] — Social profile audit and organic reach estimation
- [[Macromex Organic Social Estimation]] — Organic reach modelling

## Operațional & sigurantă

- Per-tenant izolare obligatorie: vezi [[Supabase Isolation Policy]] (fiecare clone are propriul Supabase project paid)
- Cross-tenant leak prevention: vezi [[Macromex Env Leak Incident]] (hardened stub-client în `client.ts` blochează URL-urile altor tenants)
