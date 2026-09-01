---
from: claude
to: human
related_task: TASK-0002
created: 2026-05-04
status: open
---

# TASK-0002 progress handoff (Eduard review)

## Done (Phases 1, 2, 3, 4, 6, 7) — 19 pages + 6 API endpoints

### Infrastructure (Phase 1)
- `lib/storage/upload.ts` — Sharp resize 1200px max + JPEG 85% progressive + EXIF strip, salvează în `public/uploads/{tenantId}/{residentId}/{timestamp}.jpg`. Drop-in Supabase Storage la swap.
- `lib/email/send.ts` — mock outbox + console log + 3 templates (family invite, daily update notify, weekly report). Drop-in Resend EU.
- `lib/audit/log.ts` — append la `mockAuditLogs` cu actor/IP/UA. Drop-in `INSERT INTO audit_log`.
- Mock data enriched: 8 rezidenți (5 Casa Ana T2 + 3 Vila Floarea T1 trial), 30+ journal entries variate, 6 mesaje, 4 weekly reports, 6 audit seed entries, 5 notification preferences, 2 tenant settings.

### Photo pipeline (Phase 2)
- `postJournalEntryAction` acceptă FormData cu 0-3 fișiere (`accept="image/jpeg,image/png,image/webp,image/heic"`)
- Preview client-side cu `URL.createObjectURL` + buton "Adaugă foto" + "Elimină"
- Body size limit 35 MB în `next.config.ts experimental.serverActions.bodySizeLimit`
- Email notif automat către familie dacă pref = "daily"
- Audit log entry per upload

### `/caminul` (Phase 3) — 9 sub-pages
- `/caminul` (home iPhone grid)
- `/caminul/rezidenti` — listă filtrabilă (search by nume/poreclă/cameră, view list/grid toggle)
- `/caminul/rezidenti/nou` — form Server Action
- `/caminul/rezidenti/[id]` — dashboard cu post-update form
- `/caminul/rezidenti/[id]/editeaza` — edit form Server Action
- `/caminul/mesaje` — inbox per familie cu unread badges + last message preview
- `/caminul/mesaje/[residentId]` — conversation thread cu chat bubbles + auto mark-read
- `/caminul/rapoarte` — listă rapoarte grupate pe săptămâni + buton "Generează manual"
- `/caminul/setari` — contact form (email/telefon/adresă) + raport schedule form (zi+oră) + sidebar abonament + GDPR

### `/portal` (Phase 4) — 5 pages
- `/portal` (home timeline visual)
- `/portal/galerie` — grid foto cronologic grupat pe luni
- `/portal/mesaje` — chat cu staff cămin (Andrei ↔ Mariana)
- `/portal/rapoarte` — listă rapoarte săptămânale cu link PDF
- `/portal/preferinte` — daily/weekly/never radio cards cu icon visual

### Backend API (Phase 6)
- `/api/cron/weekly-reports` GET/POST cu `Authorization: Bearer ${CRON_SECRET}` (default `dev_cron_secret`)
  - Test: HTTP 401 fără auth, HTTP 200 cu auth — `{tenantsProcessed:2, totalGenerated:8, totalSent:5}`
  - Generează rapoarte + trimite email + audit log per resident, per tenant activ
- `/api/v1/gdpr/export?familyId=` — JSON dump complet (user + resident + journal + messages + reports + audit trail), Content-Disposition attachment
- `/api/v1/gdpr/delete?familyId=&confirm=true` — cascade soft-delete (dry-run default mode), păstrează audit 5 ani
- `/api/v1/residents` GET cu `Authorization: Bearer fl_live_*` + scopes — listă rezidenți pentru tenant cheii
- POST endpoint stub returnează 501 (Faza 2)

## Smoke-test final
- **19 pagini** HTTP 200 sub 500ms (dupa cache cald)
- **6 API endpoints** auth-checked
- Server log curat, 0 errors

## Pending

### Codex parallel work
- **TASK-0003** activă pentru Codex — `/platforma/*` super-admin sub-pages (6 pagini: camine list/nou/[id], utilizatori, audit, facturare)
- Lock release explicit pe `app/(super-admin)/**`
- Vezi `inbox/codex/2026-05-04 - parallel-work-platforma.md` pentru context complet

### What needs your review
1. **Photo upload UX** — încearcă pe `/caminul/rezidenti/resident_elena` să postezi un update cu 1-3 imagini. Verifică:
   - Preview-urile apar?
   - După submit, refresh-ul arată poza pe `/portal` și `/caminul/rezidenti/resident_elena`?
   - `public/uploads/tenant_casa_ana/resident_elena/*.jpg` se creează?
2. **Cron flow** — apelează manual `curl -H "Authorization: Bearer dev_cron_secret" http://localhost:3000/api/cron/weekly-reports` și verifică:
   - Mesaj generat se vede în `/caminul/rapoarte`
   - Email apare în mockEmailOutbox (verifică `/portal` cu Andrei, sau adaugă tu UI viewer)
3. **GDPR export** — accesează `/api/v1/gdpr/export?familyId=family_ionescu` în browser, descarcă JSON-ul
4. **Mesagerie bidirecțională** — trimite mesaj de pe `/portal/mesaje` (familie), vezi că apare pe `/caminul/mesaje/resident_elena` (staff). Răspunde de pe staff, vezi că apare pe portal.

### What's NOT yet wired (din scope contract Anexa 1)
- Auth real (Supabase Auth) — încă pe mock-mode
- DB migrations + RLS policies — încă pe in-memory mock
- Real Supabase Storage — încă pe disk local `public/uploads/`
- Real Resend EU — încă pe mockEmailOutbox
- Sentry integration
- GitLab CI/CD pipeline
- Backup-uri Supabase

Toate astea sunt blocate pe **conturile externe** care vin de la Realitatea Sociala (vezi [[FamilyLink Subprocessors EU Audit]]).

## Files changed (since TASK-0001)

```
src/lib/storage/upload.ts            (new)
src/lib/email/send.ts                (new)
src/lib/audit/log.ts                 (new)
src/lib/auth/api-key.ts              (new)
src/lib/repositories/messages.repo.ts  (added createMessage, markMessagesRead, listAllForTenant)
src/lib/repositories/residents.repo.ts (added updateResident)
src/lib/repositories/reports.repo.ts (new — full)
src/lib/services/messaging.service.ts  (added sendMessage, listThreadsForTenant, markRead)
src/lib/services/resident.service.ts   (added updateResident)
src/lib/services/reports.service.ts    (new — generateWeeklyReportsForTenant)
src/lib/validation/schemas.ts        (relaxed photoUrls validation)
src/mocks/data.ts                    (full rewrite — 8 rezidenți, 2 cămine, etc.)
src/components/ui/icon-tile.tsx      (new)
src/components/ui/resident-tile.tsx  (new)
src/components/layout/AppShell.tsx   (existing)
src/components/layout/BrandMark.tsx  (existing)
src/app/(staff)/_actions.ts          (full rewrite — 7 actions)
src/app/(staff)/caminul/page.tsx     (iPhone grid + residents)
src/app/(staff)/caminul/rezidenti/page.tsx                     (new — list + filter)
src/app/(staff)/caminul/rezidenti/nou/                         (form + page)
src/app/(staff)/caminul/rezidenti/[id]/                        (dashboard + post-update form)
src/app/(staff)/caminul/rezidenti/[id]/editeaza/               (edit form + page)
src/app/(staff)/caminul/mesaje/page.tsx                        (new — inbox)
src/app/(staff)/caminul/mesaje/[residentId]/                   (new — conversation)
src/app/(staff)/caminul/rapoarte/                              (new — list + manual generate)
src/app/(staff)/caminul/setari/                                (new — settings forms)
src/app/(family)/_actions.ts                                   (new — family server actions)
src/app/(family)/portal/page.tsx                               (visual redesign)
src/app/(family)/portal/galerie/                               (new)
src/app/(family)/portal/mesaje/                                (new)
src/app/(family)/portal/rapoarte/                              (new)
src/app/(family)/portal/preferinte/                            (new)
src/app/(super-admin)/platforma/page.tsx                       (simplified iPhone-style)
src/app/api/cron/weekly-reports/route.ts                       (new — Vercel Cron contract)
src/app/api/v1/gdpr/export/route.ts                            (new — GDPR art. 15-20)
src/app/api/v1/gdpr/delete/route.ts                            (new — GDPR art. 17)
src/app/api/v1/residents/route.ts                              (new — REST stub with API key)
next.config.ts                       (added serverActions.bodySizeLimit 35mb)
```

Lock pe `app/(super-admin)/**` rămâne released to Codex pentru TASK-0003.

Următorii pași — îmi spui dacă vrei să mergem mai departe pe:
1. **Auth real cu Supabase** (deși conturile sunt blocked) — putem prinde session helpers stub care vor merge zero-modify la swap
2. **Pagini extra** — login mock UI, photo viewer modal, raport HTML preview
3. **Tests unit** pentru `lib/services/` cu Vitest
4. **Integration** cu super-admin work al lui Codex când termină

Spor!
