---
id: TASK-0004
title: Weekly report profi pentru familii (replace mock template)
owner: claude
status: deferred
priority: 2
area: platform
phase: 2
created: 2026-05-05
deferred_at: 2026-05-24
deferred_until: "Faza 2"
related_task: TASK-0002
files:
  - familylink-app/src/lib/email/send.ts
  - familylink-app/src/lib/services/reports.service.ts
---

# TASK-0004 — Weekly report profi pentru familii

> **🟡 DEFERRED 2026-05-24 → Faza 2.** Sistemul de email pentru rapoarte
> săptămânale funcționează 100% în Faza 1 (cron Vercel LUNI 05:00 UTC,
> PDF generat, email trimis via Resend cu category=`weekly_report`,
> `sent_to_family_at` marcat). Confirmat live cu 8 livrări la familii Cajal
> reale pe 2026-05-22+23 (Resend status `Delivered`). Singurul lucru basic e
> templateul HTML al emailului — funcțional dar minimal (headline + count
> update-uri + buton CTA). Upgrade-ul la „profi" (hero photo + AI summary +
> highlights cards + foto strip + mood pattern + cămin message) e
> îmbunătățire UX, nu blocker funcțional → mutat la Faza 2.

## Context

Acum raportul săptămânal e mock simplu (text placeholder + count update-uri). Eduard a notat:
> "trebuie generat pentru familii raport profi, acum e așa de test"

Necesar înainte de prima familie reală: raport care arată profesional, citit cu emoție de o familie din România.

## Scope

### Conținut raport (per resident, per săptămână)

1. **Hero**: Foto rezident (sau gradient mare cu inițiale) + nume + interval săptămână
2. **Sumar AI** (opțional Faza 2): 2-3 propoziții care extrag esența săptămânii — generat din journal entries
3. **Highlights** — 3-5 momente alese (milestone-urile + activități variate)
4. **Foto strip** — 6-9 cele mai bune poze ale săptămânii
5. **Health snapshot** — dacă au fost înregistrări medical_note: rezumat tactic (tensiune, glicemie, vizite medic)
6. **Mood pattern** — din tag-urile `daily_update`: zâmbet / liniștit / agitat / vesel — chart simplu
7. **Calendar week-at-a-glance** — 7 zile, dot per update postat
8. **Mesaj de la cămin** — 1-2 fraze de la administrator/staff care a urmărit săptămâna
9. **CTA**: link spre portal pentru update complet + buton "Mulțumesc echipei"

### Format

- **HTML responsive** (mobile-first — majoritatea îl deschid pe telefon)
- **Inline CSS** (compatibilitate email clients)
- **Plus Jakarta Sans web font** + font-fallback robust
- **Optional PDF** generation pentru download din portal
- **Tonul de copy**: cald, factual, fără melodramă (vezi [[FamilyLink Voice and Tone]])

### Tehnic

- Template în `lib/email/templates/weekly-report.tsx` (React Email — instalăm dacă merită) sau HTML string în `email/send.ts`
- Generare PDF cu Puppeteer/Chromium server-side — Vercel function timeout limit 10s pe Pro
- Stocare PDF în Supabase Storage `reports/{tenantId}/{residentId}/{weekEnd}.pdf`
- Update `weekly_reports.pdf_url` cu URL-ul Storage real

### AI summary (Faza 2 enhancement)

Folosi Claude API:
- Input: ultimele 30 journal entries pentru rezident
- Prompt: "Scrie 2-3 propoziții care surprind esența săptămânii pentru familia rezidentei, cu ton cald"
- Output: text inserat în secțiunea "Sumar AI" a raportului

## Acceptance criteria

- [ ] Raport HTML render-uit identic în Gmail / Outlook / Apple Mail / mobile
- [ ] Eduard + Cerasela confirmă "ăsta e profi" prin review
- [ ] Test cu 3 familii pilot: feedback colectat după 2 săptămâni
- [ ] Performance: generare <3s per raport, batch 100 rapoarte <60s

## Pașii executării

1. Design wireframe în Figma (sau direct HTML mockup)
2. Review cu Eduard
3. Implementare template
4. Test send la propriul email
5. Iterații pe baza feedback
6. Deploy + monitor opens/clicks via Resend
