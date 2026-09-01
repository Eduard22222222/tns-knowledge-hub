---
tags: [project, active, familylink, saas, multi-tenant, gdpr, nextjs-16, supabase]
client: Realitatea Sociala SRL
status: in-progress
created: 2026-04-30
updated: 2026-05-04
---

# FamilyLink Platform

**Client:** Realitatea Sociala SRL (brand "FamilyLink")
**Contract:** Conta 4U S.R.L. (Prestator) ↔ Realitatea Sociala (Beneficiar)
**Valoare:** 5.300 EUR fără TVA · plată 50/50 · 3 săptămâni · garanție 90 zile · tarif post-garanție 70 EUR/oră
**Data semnării:** 30 aprilie 2026
**Status:** Foundation cod scrisă · 4 ecrane funcționale local · grid rezidenți + add resident form + per-resident dashboard live · așteaptă conturi Supabase/Vercel/Resend/Sentry de la Realitatea Sociala
**Tip:** SaaS multi-tenant pentru cămine de îngrijire ↔ familiile rezidenților — NU face parte din [[Macromex Brand Showcase|familia ConsumerVoice]] (alt model de produs).

## Codebase & Live URLs

- Platformă: `C:/Users/adumi/OneDrive/Desktop/claude/familylink-app/` (Next.js 16, port 3000)
- Website prototype: `C:/Users/adumi/OneDrive/Desktop/claude/familylink-website/` (HTML/CSS, port 5180)
- **🟢 Website LIVE: https://familylink-ro.netlify.app** (deployed 2026-05-05, Netlify free, 9 pages, sub 800ms global)
- Supabase project: `vvyknkizsxkfcdhprfcf` (Frankfurt eu-central-1, FREE tier)
- Supabase Dashboard: https://supabase.com/dashboard/project/vvyknkizsxkfcdhprfcf
- Contract: `C:/Users/adumi/OneDrive/Desktop/claude/familylink-project/TNS_Contract_FamilyLink_Faza1.html` (+ PDF)
- Anexa 2 proces-verbal: `C:/Users/adumi/OneDrive/Desktop/claude/familylink-project/TNS_Anexa2_ProcesVerbal_Receptie.html`

## Coordination layer (Claude Code ↔ Codex ↔ Eduard)

Folder operational pentru WIP tasks, locks, inbox messages, handoffs:
`C:/Users/adumi/OneDrive/Documents/FamilyLink Vault/_Agent Team/`

Acolo trăiesc: Protocol.md, Dashboard.md (cu Dataview boards), templates, inbox/codex, inbox/claude, inbox/human, tasks/active, tasks/done, locks, handoffs, decisions.

Decizii consolidate și knowledge note-urile permanente migrează din `_Agent Team/decisions/` aici în main vault sub `Knowledge/FamilyLink *.md`.

## Knowledge & sub-notes (toate în main vault)

### Strategie & arhitectură
- [[FamilyLink Architecture Decisions]] — service-layer separation, multi-product schema, RLS policies, ISR strategy, image pipeline, error handling, testing
- [[FamilyLink Faza 1 MVP]] — scope contract S1/S2/S3 milestones, deliverables Anexa 1
- [[FamilyLink Pricing T1-T4]] — modelul tier 150€ / 250€ / 350€ / 450€ per cămin lunar
- [[FamilyLink GDPR Approach]] — drepturi DSAR, retenție, audit trail
- [[FamilyLink Subprocessors EU Audit]] — Supabase Frankfurt, Vercel `fra1`, Resend EU+DPF, Sentry `de.sentry.io`, GitLab US
- [[FamilyLink Magic Link Flow]] — auth pentru familii (invite + login fără parolă)
- [[FamilyLink Caregiver Assignment Strategy]] — Phase 2 deferat: split admin/staff + asignare caregiver↔senior cu UX gamificat (activ la primul T2+ client)

### Research & content
- [[FamilyLink Personas]] — 4 personas (Mariana admin, Andrei familie, Mary-Lou super-admin, Răzvan owner cămin)
- [[FamilyLink Trust Assets]] — EAN membership + Cerasela Maciuca (Asociația Cajal)
- [[FamilyLink Research Synthesis]] — affinity mapping, design priorities, hero strategy
- [[FamilyLink UX Copy v1]] — copy bilingual B2B/B2C pentru cele 9 pagini website

### Brand
- [[FamilyLink Brand Strategy]] — positioning, voice, B2B vs B2C tone
- [[FamilyLink Logo Concepts]] — v13-A locked (gradient + heart negative space, no outline)
- [[FamilyLink Color Palette]] — blue/green/navy/cream cu semantic tokens
- [[FamilyLink Typography]] — Plus Jakarta Sans display + body
- [[FamilyLink Voice and Tone]] — cuvinte permise/interzise (RO context)
- [[FamilyLink Design System v1]] — components specs

### Negocieri
- [[FamilyLink Negotiation Notes 2026-04-30]] — feedback Realitatea Sociala (28 puncte) și răspunsurile

## Architectural snapshot

- **Stack:** Next.js 16 App Router + React 19 + TypeScript strict + Tailwind 4 (`@theme`) + Supabase (Frankfurt) + Vercel (`fra1`) + Resend EU + Sentry `de.sentry.io`
- **Service-layer separation strict** — `lib/services/*` e single source of truth. Server Actions ȘI Route Handlers consumă servicii (NU repos direct), pregătit pentru API public Faza 2.
- **Multi-product schema** — `users + products + tenants + user_tenant_access` cu RLS. FamilyLink (Faza 1) + ComfortMap (Faza 2 — directory cămine stil Booking.com) coexistă fără rewrite.
- **3 portaluri** sub `app/` route groups:
  - `app/(staff)/caminul/` — admin/staff cămin (jurnal, mesagerie, rezidenți, add-resident form, per-resident dashboard)
  - `app/(family)/portal/` — familii rezidenți (timeline, foto, mesaje)
  - `app/(super-admin)/platforma/` — Realitatea Sociala (onboarding cămine, audit, facturare)
- **Mock-mode auth** până la Supabase: `requireSession(mockUserId?)` în `auth.service.ts` — Mariana implicit pentru staff, Andrei pentru family portal, Mary-Lou pentru platformă.

## Faza 1 progres (3 săptămâni / 5.300 EUR)

### S1 — în curs
- [x] Init Next.js 16 + TypeScript strict + Tailwind 4 design tokens
- [x] Folder structure complet (lib/services, lib/repositories, lib/db, lib/auth, lib/email, lib/storage, lib/validation, lib/utils, components/ui, components/layout, types, mocks)
- [x] Types entități (User/Product/Tenant/UserTenantAccess/Resident/Family/JournalEntry/Message/WeeklyReport/AuditLog/ConsentRecord)
- [x] Mock data (Casa Ana T2 + 4 useri + tanti Lenuța rezidentă)
- [x] Repositories cu mock impl + mutation (createResident, createJournalEntry)
- [x] Services cu RBAC + Zod validation
- [x] Typed errors AppError + 7 subclase
- [x] UI primitives shadcn-style (Button cu cva, Card, Input/Textarea/Label, Badge, Avatar, IconTile, ResidentTile, BrandMark)
- [x] AppShell shared cu nav contextual per portal
- [x] `/caminul` iPhone-style (icon grid acțiuni + grid rezidenți cu gradient avatars + status "update azi/ieri/N zile")
- [x] `/caminul/rezidenti/nou` formular Server Action + Zod
- [x] `/caminul/rezidenti/[id]` dashboard cu post-update form + jurnal grupat pe zile + sidebar familie
- [x] `/portal` family timeline visual redesign — hero card cu gradient brand + greeting time-aware, 3 portal shortcuts iPhone-style cu badge, jurnal grupat pe Astăzi/Ieri/Săptămâna aceasta/Mai demult, fiecare card cu gradient header + emoji per tip + buton "Trimite ❤️"
- [x] `/platforma` super-admin simplificat — 4 BigStat cards stil iPhone Health (Cămine/Rezidenți/Update-uri/MRR cu gradient), 4 acțiuni rapide ca icon tiles, listă cămine card-list (gradient tier badge T1-T4 + status + count rezidenți/utilizatori) în loc de tabel
- [x] Smoke-test 6 rute initial: toate HTTP 200, sub 2.1s
- [x] **Phase 1 — Infrastructure stubs:** `lib/storage/upload.ts` cu Sharp pipeline (resize 1200px + JPEG 85% + EXIF strip), `lib/email/send.ts` cu mockEmailOutbox + 3 templates (familyInvite/dailyUpdateNotify/weeklyReport), `lib/audit/log.ts` cu mockAuditLogs writes, mock data enriched (8 rezidenți, 2 cămine, 30+ journal entries, 4 weekly reports, audit log seed, mesaje multiple, notification preferences, tenant settings)
- [x] **Phase 2 — Photo upload pipeline:** `postJournalEntryAction` acceptă multipart/form-data cu 0-3 imagini, Sharp processing, audit log + email notif către familie pe daily preference
- [x] **Phase 3 — `/caminul` complete (9 sub-pages):** rezidenti list (filtrabil + grid/list view), rezidenti/nou (form), rezidenti/[id] (dashboard), rezidenti/[id]/editeaza (edit form), mesaje (inbox cu unread badges), mesaje/[residentId] (conversation cu chat bubbles), rapoarte (lista + buton manual generate), setari (contact form + report schedule form)
- [x] **Phase 4 — `/portal` complete (5 pages):** home (timeline visual), galerie (grouped by month), mesaje (chat cu staff), rapoarte (download PDF), preferinte (daily/weekly/never radio)
- [x] **Phase 6 — Backend API:**
  - `/api/cron/weekly-reports` Route Handler cu `Bearer ${CRON_SECRET}` auth (default `dev_cron_secret`), iterează tenants activi, generează rapoarte + trimite email + audit log; testat cu curl: `200` cu `tenantsProcessed:2, totalGenerated:8, totalSent:5`
  - `/api/v1/gdpr/export?familyId=` GDPR art. 15-20 — JSON dump complet (user + resident + journal + messages + reports + audit trail) + audit log entry de export
  - `/api/v1/gdpr/delete?familyId=&confirm=true` GDPR art. 17 — cascade soft-delete cu dry-run mode (default), păstrează audit log 5 ani
  - `/api/v1/residents` REST stub cu API key auth (`Authorization: Bearer fl_live_*`) + scopes (residents:read), audit log pe fiecare request
- [x] **Phase 7 — Smoke-test final:** 19 pagini × HTTP 200 sub 500ms + 6 API endpoints (cron auth-checked, GDPR export+delete, REST auth-checked)
- [x] **Phase 8 — Supabase setup (2026-05-05):**
  - Project Frankfurt creat: `vvyknkizsxkfcdhprfcf` (FamilyLink Prod)
  - Schema 0001 aplicată: 13 tabele, 9 enums, 14 RLS policies, 5 trigger-uri auto-updated_at, helper functions `is_super_admin()` + `has_tenant_access()`
  - Seed demo (`0002_seed_demo.sql`): Casa Ana T2, Vila Floarea T1, 8 rezidenți, 4 useri demo, 11 access rows
  - 3 auth users creați cu UUID-uri matching seed (Mary-Lou, Mariana, Andrei) — script `scripts/seed-auth-users.mjs` idempotent
  - `.env.local` complet: NEXT_PUBLIC_SUPABASE_URL + ANON_KEY + SERVICE_ROLE_KEY + DB_PASSWORD + CRON_SECRET + USE_REAL_DB=true
  - `lib/db/client.ts` (server cu cookie session) + `client-browser.ts` + `lib/auth/api-key.ts`
  - `auth.service.ts` dual-mode: USE_REAL_DB=true → Supabase Auth + DB query; false → mock fallback
- [x] **Phase 9 — Login + middleware:**
  - `/login` page cu LoginForm cu useActionState + signIn/signOut Server Actions
  - `signInAction` → audit log + last_login_at update + redirect rolă-aware (super_admin → /platforma, camin_* → /caminul, family_* → /portal)
  - `proxy.ts` (Next.js 16 `middleware` renamed) — protejează `/caminul`, `/portal`, `/platforma` când USE_REAL_DB=true; `/caminul` no-auth → 307 → `/login?next=/caminul` ✅
  - Buton signout în AppShell header
  - Toate 12 paginile (super-admin + family) refactorate să folosească `requireSession(mockId)` în loc de `findUserById` hardcoded
- [x] **🟢 LIVE: Website static deployed la https://familylink-ro.netlify.app** (2026-05-05, Netlify free, 9 pages HTTP 200, 8.4s build)
- [x] **Lint + tsc 100% curat** după toate refactor-urile
- [x] **Codex parallel (TASK-0003) — DONE:** /platforma complete cu toate 6 sub-pagini (camine list, camine/nou, camine/[id], utilizatori, audit, facturare). Verificat de Codex cu `npx tsc --noEmit` PASS + `npm run build` PASS + HTTP 200 toate. Server Actions: createTenantAction (Zod-validated), suspendTenantAction, reactivateTenantAction, archiveTenantAction — toate cu audit log. Helpers factorizați în `_components/platforma-shell.tsx` + `platforma-data.ts` (tierPrices, tierGradients, statusLabels, statusTone, getTenantStats, getAuditRows, formatters). Lock returned, integration smoke-test claude-side PASS, no regression pe staff/family/api.

### S2 — următorul
- [ ] Setup conturi externe (Supabase EU, Vercel `fra1`, Resend, Sentry `de.sentry.io`) — vezi [[FamilyLink Subprocessors EU Audit]]
- [ ] Schema DB Supabase + migrations + RLS policies
- [ ] Auth real (parolă staff + magic link familie)
- [ ] CRUD complet rezidenți + jurnal (deja avem mutation skeleton)
- [ ] Pipeline upload imagini (Sharp + EXIF strip + Supabase Storage)
- [ ] Email templates Resend pentru notificări update familie
- [ ] Mesagerie real-time

### S3 — final
- [ ] Cron rapoarte săptămânale (Vercel Cron)
- [ ] Production deploy + acceptance testing
- [ ] GDPR fundație tehnică (export, ștergere cu cascade, audit log)
- [ ] REST API minimal documentat OpenAPI

## Open TODOs (blocked external)

- [ ] Realitatea Sociala creează conturile externe pe email-urile lor → transfer/share cu Conta 4U:
  - Supabase regiune Frankfurt obligatorie
  - Vercel deploy region `fra1`
  - Resend EU + DPF
  - Sentry **MUST** crea pe `de.sentry.io` (irevocabil)
  - GitLab.com (US, doar cod fără PII)

## Related notes

- [[Conta 4U Legal Identifiers]] — pentru contract (CUI 47755391, J2023004333408)
- [[Subprocessors EU GDPR Compliance]] — pattern reutilizabil
- Same template-family approach (per-tenant Supabase): vezi [[Supabase Isolation Policy]]
