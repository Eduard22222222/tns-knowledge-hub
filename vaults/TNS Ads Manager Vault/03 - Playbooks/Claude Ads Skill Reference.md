# Claude Ads Skill — Reference Playbook (TNS Internal)

**Status:** Installed 17.05.2026
**Sursă:** https://github.com/AgriciDaniel/claude-ads
**Locație locală:** `C:\Users\adumi\.claude\skills\ads*` + `C:\Users\adumi\.claude\agents\`
**Scope:** Toolkit complet pentru audit + strategie + creative pentru campanii ads (Meta, Google, LinkedIn, TikTok, YouTube, Microsoft, Apple)

---

## TL;DR — Când să-l folosești

| Faza client | Skill | Output |
|---|---|---|
| **Discovery** | `/ads dna <url>` | `brand-profile.json` cu voice + visual identity |
| **Strategy** | `/ads plan <industry>` | Marketing plan + funnel + budget allocation |
| **Audit pre-existent** | `/ads audit` sau `/ads google` | `GOOGLE-ADS-REPORT.md` cu 80 checks + Health Score |
| **Creative brief** | `/ads create --platforms google` | `campaign-brief.md` cu concepte + copy deck |
| **Generate assets** | `/ads generate` | Imagini AI din briefs |
| **Math & forecasting** | `/ads math` | CPA / ROAS / breakeven calc |
| **Budget split** | `/ads budget` | Recomandări allocation per AG/campaign |
| **Competitor scan** | `/ads competitor <brand>` | Analiză poziționare + gaps |
| **Landing audit** | `/ads landing <url>` | CRO findings |
| **A/B testing** | `/ads test` | Test plan + sample size calc |

⚠️ **Ce NU face:** NU creează automat campanii în UI Google Ads. Skill-urile sunt pentru **strategie + audit + creative**, NU pentru execuție UI. Pentru bulk campaign creation → **Google Ads Editor** (desktop app) cu CSV import.

---

## Skill-uri instalate (19 sub-skills)

### Platform skills
- `ads-google` — Audit Google Ads (80 checks, Quality Score, Search Terms, PMax, AI Max for Search 2026, Demand Gen)
- `ads-meta` — Audit Meta (Facebook + Instagram), Andromeda optimization, creative diversity
- `ads-linkedin` — Audit LinkedIn Campaign Manager
- `ads-tiktok` — Audit TikTok Ads Manager (Spark Ads, sound-on)
- `ads-youtube` — Audit YouTube Ads (Skippable, Bumper, Demand Gen)
- `ads-microsoft` — Audit Microsoft Ads (Bing + partners)
- `ads-apple` — Apple Search Ads (ASA)

### Funcționale
- `ads-audit` — Cross-platform audit orchestrator
- `ads-plan` — Marketing plan generator (SaaS, e-com, local, B2B)
- `ads-budget` — Budget allocation recomandări
- `ads-math` — Conversion math (CPA, ROAS, breakeven, LTV/CAC)
- `ads-test` — A/B test design + sample size calc
- `ads-competitor` — Competitor analysis
- `ads-landing` — Landing page CRO audit

### Creative
- `ads-create` — Campaign brief generator (`campaign-brief.md`)
- `ads-creative` — Creative direction + concepts
- `ads-dna` — Brand DNA extraction din site (→ `brand-profile.json`)
- `ads-generate` — Image generation din briefs
- `ads-photoshoot` — Photoshoot direction pentru asset creation

---

## Agenți instalați (10)

**Audit (6):**
- `meta-auditor`, `google-auditor`, `linkedin-auditor`, `tiktok-auditor`, `youtube-auditor`, `cross-platform-auditor`

**Creative (4):**
- `creative-strategist` — Concept generation
- `copy-writer` — Headlines + descriptions per platform (AIDA, PAS, BAB, 4P, FAB)
- `image-prompter` — AI image prompts
- `landing-optimizer` — Landing CRO

---

## Workflow recomandat TNS pentru client nou

```
1. /ads dna <client-url>          → brand-profile.json
2. /ads plan local-business       → marketing-plan.md
3. /ads competitor <competitor>   → competitor-analysis.md
4. /ads create --platforms google → campaign-brief.md
5. (manual) Setup în Google Ads Editor cu CSV bulk import
6. Post-launch: /ads google       → GOOGLE-ADS-REPORT.md (weekly)
7. /ads math                      → ROI tracking
```

---

## Integrare cu workflow TNS existent

| Skill TNS existent | Claude Ads echivalent | Decizie |
|---|---|---|
| `Behavioral Tracking Playbook.md` | (n/a) | Păstrăm playbook propriu — mai detaliat pe GTM |
| `Local Business Google Ads Playbook.md` | `/ads plan local-business` | Combinăm: playbook propriu pentru structura, `/ads plan` pentru numeric forecast |
| `adspirer-ads-agent:keyword-research` | (n/a) — claude-ads nu face keyword research | Păstrăm adspirer + Google KP manual |
| Manual audit checklist | `/ads google` (80 checks) | **Înlocuim cu `/ads google`** — mult mai cuprinzător |

---

## Notes pentru GoaMasaj (primul client unde îl folosim)

- `campaign-brief.md` deja generat (manual, înainte de skill install) în `02 - Campaign Structure.md`
- După lansare campanie → rulează `/ads google` săptămânal pentru Health Score
- După 30 zile → `/ads math` pentru analiză CPA real vs target (40-150 RON)
- Dacă vrem expand pe Meta → `/ads create --platforms meta` cu același `brand-profile.json`

---

## Limits & known issues

- **NU face UI automation** — pentru bulk campaign creation folosește Google Ads Editor
- **MCP Google Ads server (opțional)** — read-only (GAQL search) prin `google-ads-mcp`. Util pentru `/ads google` să tragă date direct, dar nu obligatoriu
- **Necesită date reale** pentru audit (min 30 zile + Search Terms Report) — skill validează asta înainte să scoreze
- Pentru clienți noi fără istoric → folosește doar `/ads plan` + `/ads create` (skip audit)

---

## Re-install / update

```powershell
cd $env:USERPROFILE
git clone https://github.com/AgriciDaniel/claude-ads
cd claude-ads
.\install.ps1
```

Verificare după install:
```powershell
Get-ChildItem "$env:USERPROFILE\.claude\skills\ads*" | Select-Object Name
Get-ChildItem "$env:USERPROFILE\.claude\agents\" | Select-Object Name
```

Expected: 1 main skill (`ads`) + 19 sub-skills (`ads-*`) + 10 agents.
