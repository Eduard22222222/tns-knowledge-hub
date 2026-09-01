---
id: TASK-0002
title: Faza 1 MVP demo-ready — full feature set per Anexa 1
owner: claude
status: in-progress
priority: 1
area: platform
created: 2026-05-04
updated: 2026-05-04
related_task: TASK-0001
files:
  - familylink-app/src/**/*
  - Obsidian Vault/Projects/FamilyLink Platform.md
---

# TASK-0002 — Faza 1 MVP demo-ready build

## Goal

Aducem FamilyLink la o primă versiune **demo-ready** care implementează tot scope-ul din [[FamilyLink Faza 1 MVP|Anexa 1 contract]] cu mock data + abstracții real-ready. Toate ecranele trebuie să fie funcționale, mutable, și să demonstreze fluxurile end-to-end pentru client. Conturile externe (Supabase/Vercel/Resend/Sentry) vin după demo — abstracțiile noastre permit drop-in real implementations.

## Scope (7 phases)

### Phase 1 — Infrastructure stubs
- [ ] `lib/storage/upload.ts` — Sharp resize 1200px + JPEG 85% + EXIF strip + saves to `public/uploads/{tenantId}/{residentId}/{ts}.jpg` (mock impl, drop-in Supabase Storage ulterior)
- [ ] `lib/email/send.ts` — mock impl scrie în `mockEmailOutbox` + console log; templates (welcome family invite, daily update notif, weekly report)
- [ ] `lib/audit/log.ts` — wrapper `audit(action, entity, meta)` care scrie în `mockAuditLogs` cu actor/IP/UA
- [ ] Enrich `mocks/data.ts`: 8 rezidenți (Casa Ana cu 5 + Vila Floarea cu 3), 2 cămine, 30+ journal entries (cu photoUrls la unele), 4 weekly reports, 12 audit log entries, 6 messages

### Phase 2 — Photo upload pipeline
- [ ] Update `postJournalEntryAction` să accepte `multipart/form-data` cu 0-3 files
- [ ] Sharp processing: resize, EXIF strip, write to `public/uploads/`
- [ ] Photos vizibile pe `/portal` timeline + `/caminul/rezidenti/[id]`
- [ ] Mock seed photos pentru variation vizuală

### Phase 3 — `/caminul` complete
- [ ] `/caminul/rezideti` — listă filtrabilă (status, search by name)
- [ ] `/caminul/rezidenti/[id]/editeaza` — edit form cu Server Action
- [ ] `/caminul/mesaje` — inbox per familie (un thread per resident)
- [ ] `/caminul/mesaje/[residentId]` — conversație cu Server Action send
- [ ] `/caminul/rapoarte` — listă rapoarte săptămânale + buton manual generate (dev)
- [ ] `/caminul/setari` — info cămin + setare zi/oră raport săptămânal

### Phase 4 — `/portal` complete
- [ ] `/portal/galerie` — grid foto cronologic, click pentru full view
- [ ] `/portal/mesaje` — conversație cu staff cămin (Server Action send)
- [ ] `/portal/rapoarte` — listă rapoarte săptămânale, click pentru render HTML
- [ ] `/portal/preferinte` — daily / weekly / never (Server Action save)

### Phase 5 — `/platforma` complete
- [ ] `/platforma/camine` — listă cu filtru status, search
- [ ] `/platforma/camine/nou` — onboarding form Server Action (creează tenant + primul user admin)
- [ ] `/platforma/camine/[id]` — detaliu cu metrici + suspend/reactivate/archive Server Actions
- [ ] `/platforma/utilizatori` — listă cu filtru rol + activitate ultima
- [ ] `/platforma/audit` — viewer audit log cu filtru tenant/actor/action
- [ ] `/platforma/facturare` — MRR breakdown per tenant + tier history

### Phase 6 — Cron + GDPR + REST API
- [ ] `/api/cron/weekly-reports` Route Handler — protejat cu `CRON_SECRET` header, generează rapoarte pentru toate familiile cu `notification_preference != 'never'`
- [ ] `/api/v1/gdpr/export?familyId=` — JSON dump pentru tot ce ține de o familie + audit log entry
- [ ] `/api/v1/gdpr/delete?familyId=` — cascade delete (familie, mesaje, jurnal asociat) + audit log entry
- [ ] `/api/v1/residents` GET/POST — REST stub via service layer cu API key auth (mock middleware)

### Phase 7 — Polish + smoke-test
- [ ] Toate rutele HTTP 200
- [ ] Server Actions validate cu Zod, errors traduse
- [ ] Audit log popularizat după mutații
- [ ] Vault sync: progres în [[FamilyLink Platform]] + [[FamilyLink Faza 1 MVP]]
- [ ] Decision note: alegeri tehnice cheie (storage abstraction, audit pattern, mock-mode auth strategy)

## Acceptance criteria

- [ ] Demo client poate parcurge: login mock → vede dashboard cămin → adaugă rezident → postează update cu poză → comută la portal familie → vede update + galeria → trimite mesaj → comută la super-admin → vede audit log + facturare
- [ ] Toate path-urile au seamless data flow (mutați într-un loc, vezi în alt portal după refresh)
- [ ] Cron poate fi rulat manual cu secret și generează rapoarte
- [ ] Code structure permite drop-in Supabase fără rewrite

## Locks

Pentru această sesiune voi ține lock pe `familylink-app/src/**` și `_Agent Team/tasks/active/TASK-0002`. Vezi `_Agent Team/locks/claude-task-0002.md`.

## Handoff potential

Dacă Codex preia bucăți: revizuirea pipelines-ului de imagini (Sharp config) sau scrierea testelor unit pentru service layer. Mesaj în `inbox/codex/` la nevoie.
