---
tags: [project, active, coachos, saas, tennis, ai]
created: 2026-08-12
updated: 2026-08-12
status: active
---

# CoachOS Platform

Platformă de coaching pentru tenis. MVP existent, intrăm în faza de dezvoltare. Partener:
**Filip** (deține repo-ul GitHub + Supabase). Piață țintă: academii de tenis din **Olanda**.

Nota-pointer. **Documentația completă stă în vault-ul dedicat:**
`C:\Users\adumi\OneDrive\Documents\CoachOS Vault\` → deschide `CoachOS MOC.md`.

## Pe scurt
App pentru antrenori: jucători, grupuri, drill-uri, planificare de lecții, notițe, feedback.
Utilizatorul e antrenorul **pe teren, cu racheta în mână** — de aici derivă mobile-first real,
voice notes și puține tap-uri per acțiune.

## Ce se dezvoltă
- **P0:** buguri de CRUD (delete/edit jucători și drill-uri nu funcționează)
- **P1:** calendar/program, search, responsive, design system
- **P2:** voice notes (Whisper), profil avansat, interfață Coach/Student
- **P3:** LLM peste sesiuni, parteneriat KNLTB, **video analytics**

## Feature-ul mare: Video Analytics
Antrenorul filmează un drill cu telefonul → AI-ul scoate statistici **contextualizate de
drill-ul respectiv** (nu de meci) → plan de îmbunătățire. Diferențiatorul: CoachOS are deja
planul de antrenament, ceea ce SwingVision/Wingfield/PlaySight nu au. Cost real: **$0.31–0.52
per oră de video** cu pipeline CV; un VLM pe video direct ar costa ~300× mai mult și nu ar
funcționa (fizica eșantionării la 1 fps).

## Business
Build €45–70k + licență €25–60k/an. KNLTB are buget software de €1.41M pe 2026 și plătește deja
€43k pentru ball & player tracking — parteneriatul cu federația e o pană mai adâncă decât
vânzarea club cu club.

## Stare
🔴 Blocat pe acces la repo + Supabase la 2026-08-12.

## Legături
[[Projects MOC]] · [[The Niche Society]] · [[Tools and Stack]] · [[Claude Skills Index]]
