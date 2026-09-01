---
tags: [knowledge, coachos, reference, claude-skills]
created: 2026-08-12
updated: 2026-08-12
status: active
---

# CoachOS Skill Stack

Ce skill-uri Claude se încarcă pe acest proiect, **pe fază**. Regula: se încarcă la nevoie, nu
toate deodată — un context umplut cu 40 de skill-uri nefolosite lasă mai puțin loc pentru cod.

Index complet: `C:\Users\adumi\.claude\skills\` și [[Claude Skills Index]] în vault-ul principal.

---

## Fază 0 — Audit de cod (imediat ce avem acces la repo)

Astea se încarcă **primele**, înainte de orice linie scrisă. Scopul e analiza de strong/weak
points cerută de Eduard.

| Skill | Pentru ce |
|---|---|
| `codebase-audit-pre-push` | sweep general de calitate pe MVP |
| `code-reviewer` | pass structurat pe cod |
| `security-audit` | RLS, expunere de chei, autorizare |
| `database-architect` | evaluarea schemei Supabase |
| `systematic-debugging` | root-cause pe bug-urile P0 de CRUD, nu patch-uri |
| `production-code-audit` | ce e demo-grade vs production-grade |

Plus MCP **KotaDB** (`index_repository` → `find_usages`) pentru blast radius înainte de
refactor. Necesită git root — repo-ul îl are.

---

## Fază 1 — Reparat P0 + UX de bază ([[CoachOS Roadmap]] P0–P1)

**Backend / date**
`supabase-automation` · `postgres-best-practices` · `postgresql-optimization` ·
`database-migrations-sql-migrations` · `nextjs-supabase-auth` · `api-design-principles` ·
`backend-architect`

> Bug-urile de delete/edit sunt cel mai probabil **politici RLS lipsă pe DELETE/UPDATE**.
> `supabase-automation` + `security-audit` acoperă exact asta.

**Frontend**
`frontend-design` (**întotdeauna primul** — vezi [[feedback design]]: fără vibecode) ·
`react-best-practices` · `react-patterns` · `react-state-management` · `typescript-pro` ·
`tanstack-query-expert` · `shadcn` · `frontend-dev-guidelines`

**Design**
`design:design-system` · `tailwind-design-system` · `ui-ux-designer` · `mobile-design` ·
`web-design-guidelines` · `brand-guidelines` · `theme-factory`

> `design:design-system` se rulează **înainte** de ecranele noi din P1 — tokens întâi, ecrane
> după. Invers înseamnă refactor dublu.

**Testare**
`webapp-testing` · `e2e-testing-patterns` · `test-driven-development`

---

## Fază 2 — Feature-uri noi ([[CoachOS Roadmap]] P2)

| Skill | Pentru |
|---|---|
| `voice-ai-development` + `audio-transcriber` | voice notes (P2 #12) — cel mai bun ROI din listă |
| `llm-structured-output` | breakdown de sesiune (P3 #20) — output tipizat, nu text liber |
| `prompt-engineering` | idem |
| `dataviz` | **obligatoriu** pentru orice grafic/heatmap. Se citește ÎNAINTE de prima linie de cod de chart. |
| `accessibility-compliance-accessibility-audit` | ecranul de Student e folosit de copii |
| `i18n-localization` | NL + EN de la început dacă ținta e piața olandeză |
| `react-native-architecture` / `expo-deployment` | doar dacă se decide app nativ; PWA e probabil suficient |

---

## Fază 3 — Video Analytics ([[CoachOS Video Analytics]])

| Skill | Pentru |
|---|---|
| `computer-vision-expert` | 🎯 skill-ul central — ball tracking, pose, court detection |
| `ml-engineer` · `mlops-engineer` | training, versionare de modele, deploy |
| `ml-pipeline-workflow` | orchestrarea pipeline-ului per clip |
| `llm-evaluation` | validarea layer-ului de coaching |
| `videodb-skills` · `seek-and-analyze-video` | indexare și segmentare de video |
| `cloud-architect` · `cost-optimization` | arhitectura de GPU, on-prem vs serverless |
| `performance-engineer` | FPS real pe L4 — testul de $5 din [[Tennis Vision - Arhitectura de Cost]] |
| `privacy-by-design` · `gdpr-data-handling` | vezi [[GDPR - Video si Minori in NL]] |

---

## Transversal — Business și livrabile

| Skill | Pentru |
|---|---|
| `pricing-strategy` · `monetization` | tier-uri, vezi [[CoachOS - Peisaj Competitiv]] |
| `startup-financial-modeling` | unit economics cu COGS de GPU |
| `competitive-landscape` · `market-sizing-analysis` | actualizare periodică |
| `product-manager-toolkit` | PRD-uri per feature |
| `startup-metrics-framework` | ce măsurăm ca produs |
| `legal-advisor` | contract, IP, escrow |
| `architecture-decision-records` | fiecare decizie mare → ADR în `Knowledge/` |
| `pdf` / `pptx` | **livrabilele pentru Eduard** — nu markdown |

---

## Ce NU încarc (și de ce)
- `rag-engineer`, `vector-database-engineer` — nu avem încă un corpus de căutat. Devin relevante
  la biblioteca KNLTB de drill-uri (P3 #21).
- `kubernetes-architect`, `service-mesh-*` — supra-inginerie la scara asta. Un fleet de GPU-uri
  nu are nevoie de service mesh.
- `blockchain-*`, `web3-*` — nu.

## Legături
[[CoachOS MOC]] · [[CoachOS Roadmap]] · [[CoachOS Video Analytics]]
