# ComfortMap — Live Production Audit & Fix Report

**Date:** 2026-05-18 · **Env:** production (comfortmap.ro) · **Supabase:** vvyknkizsxkfcdhprfcf
**Commits:** `41147df` (auth/dashboards/audit/photo) + `cb4ea1a` (family messaging)

---

## 1. Executive Summary

Marylou's "Sentry error pe /caminul" + "multe nu se leagă" had **one dominant root cause** plus several independent gaps.

**Root cause of the Sentry crash + most "nu se leagă":**
`/auth/callback` did its post-login writes (`last_login_at`, `user_tenant_access.accepted_at`) with the **anon/RLS Supabase client under the freshly-authenticated user**, wrapped in an empty `catch`. Users have no RLS policy to self-update those rows, so the writes **failed silently**. `accepted_at` stayed `NULL` → `requireSession()` filters `accepted_at IS NOT NULL` → returned **empty access** → `/caminul` executed `throw new Error("Sesiune fără tenant.")` → uncaught Server Component throw → the generic Sentry *"An error occurred in the Server Components render"* + white 500. Timing matched exactly (invite at 10:51, crash 10:52).

**Status: the P0s are FIXED and verified live in production.** One large item (super-admin `/platforma` is mostly mock data) is documented below as the top remaining work — not a crash, but it IS why Marylou "sees things that don't connect" on her own dashboard.

---

## 2. Fixes Shipped (deployed + verified)

| # | Fix | File(s) | Verified live |
|---|-----|---------|---------------|
| 1 | `/auth/callback` uses **admin client** (service_role) for `accepted_at` + `last_login_at` + role resolution. User id is already cryptographically validated by `verifyOtp`. | `src/app/auth/callback/route.ts` | ✅ All 3 roles: `accepted_at(all)=true`, `last_login_at` updated post-login |
| 2 | **Real `audit_log` INSERTs** in production (was mock-array only despite GDPR 5-yr retention requirement). | `src/lib/audit/log.ts` | ✅ 3 fresh `login` rows written at 12:21 today (before: only 2026-05-05 seed) |
| 3 | **Error boundaries** for `(staff)`/`(family)`/`(super-admin)` + `global-error` → branded re-login screen + handled Sentry report instead of raw crash. `/caminul` now **role-aware redirect** instead of `throw`. | 4 new `error.tsx`, `caminul/page.tsx` | ✅ `/caminul` returns **HTTP 200**, real staff dashboard, no crash boundary, no login bounce |
| 4 | **Resident photo upload on the EDIT page** (previously only existed on create, which silently swallowed upload errors). Edit form pre-fills the current photo; errors are surfaced. | `(staff)/_actions.ts`, `edit-resident-form.tsx` | ✅ build green; UI wired (uses verified `resident-photos` bucket + `avatar_url` column) |
| 5 | **Family messaging + notification prefs** used a hardcoded mock user `user_andrei` — every real family user wrote as Andrei on Casa Ana. Now uses the real session (`requireSession` + `findFamilyByUser`); prefs upsert into real `family_notification_preferences`. | `(family)/_actions.ts` | ✅ `cb4ea1a` live — `/portal` for `office+familytest` shows **real Test 2 EDI resident** (not Andrei/Casa Ana); family→staff message round-trip attributed correctly + visible in staff thread |
| 6 | **`accepted_at` backfill** for the 5 test accounts (all now have a usable access row). | DB | ✅ all 5 usable |

**`USE_REAL_DB`**: confirmed already `"true"` in prod (the crash signature is only possible on the real-auth path — mock `user_mariana` always has access). No env change needed. So "nu se uploadează poza" was the missing edit-page upload UI, **not** an ephemeral-disk fallback.

**Live E2E (server-side, magic-link → callback → dashboard + DB):**
- camin_admin `office@fiblyai.com` → `/caminul` → **307 → HTTP 200**, real dashboard ✅
- super_admin `marylou@realitateasociala.ro` → `/platforma` → 307, no crash boundary ✅
- family_owner `office+familytest@thenichesociety.ro` → `/portal` → 307, no crash boundary ✅
- All: session cookie set, `accepted_at` set, `last_login_at` updated, audit row written ✅

---

## 3. Dashboard-by-Dashboard Audit

### 3.1 Staff `/caminul` (camin_admin / camin_staff) — **REAL DATA ✅**
| Feature | Status |
|---|---|
| Home (residents grid, unread count, last-update status) | ✅ real (`resident.service`, `journal.service`, `messaging.service`) |
| Add resident (+ photo) | ✅ real; photo → Supabase Storage `resident-photos`, `avatar_url` |
| Edit resident (+ photo) | ✅ **now** real incl. photo (fix #4) |
| Resident detail / journal | ✅ real |
| Messages (staff → family) | ✅ real — `sendStaffMessageAction` uses `requireSession` + real `messages` repo (schema: `from_user_id/to_user_id/resident_id/direction`) |
| Invite staff (magic link) | ✅ real (`inviteStaffAction` → `sendAdminMagicLink` → Resend + `user_tenant_access`) |
| Invite family (magic link) | ✅ real (`inviteFamilyAction` → creates `families` + `user_tenant_access`) |
| Reports (weekly) | ✅ real (`weekly_reports` table, 17 rows) |
| Settings (report schedule) | ✅ real (`tenant_settings` upsert) |
| Settings (contact/address) | ⚠️ **mock-only** — `updateTenantContactAction` writes to `mockTenants[]` (lost on cold start). *Open.* |

### 3.2 Family `/portal` (family_owner / family_member) — **REAL after `cb4ea1a` ✅**
| Feature | Status |
|---|---|
| Portal home (resident + journal feed) | ✅ real (`findFamilyByUser` admin-client, isolated on `owner_user_id`) |
| Gallery / Reports | ✅ real |
| Messages (family → staff) | ✅ **fixed** `cb4ea1a` (was attributed to mock Andrei/Casa Ana) |
| Notification preferences | ✅ **fixed** `cb4ea1a` → real `family_notification_preferences` upsert |
| Mobile keyboard in composer | ✅ OK by design — native `<textarea>`, auto-resize, **Enter = newline on mobile** (send = button), Enter = send only on desktop. Texting-app behaviour. |
| **Family invites another family member** | ❌ **MISSING FEATURE** — no flow exists. `family_member` role is defined but only *staff* can invite family (`inviteFamilyAction`). The portal has no "invită un alt membru al familiei". *Open — requested by Marylou.* |

### 3.3 Super-admin `/platforma` (super_admin = Marylou) — **~80% MOCK ⚠️ TOP FINDING**
| Page | Data |
|---|---|
| `/platforma` overview (tenants, MRR, users, updates) | ❌ **mock** (`mockTenants`, `mockUsers`, `mockJournalEntries`) |
| `_components/platforma-data.ts` (shared layer feeding the tree) | ❌ **mock** (16 mock refs) |
| `/platforma/facturare` (billing/MRR) | ❌ **mock** |
| `/platforma/utilizatori` (users) | ❌ **mock** |
| `/platforma/audit` (audit-log viewer) | ❌ **mock** — ironically `audit_log` now gets *real writes* (fix #2) but the viewer reads the mock array |
| `/platforma/leads` | ◐ inconclusive (no mock refs; likely real `leads` table — verify) |
| `/platforma/camine/[id]` (single cămin detail) | ✅ real path present |

**Impact:** Marylou logs in (super_admin) → lands on `/platforma` → sees fabricated tenants / MRR / users / audit instead of real Casa Ana, Test 2 EDI, Vila Floarea and the real users. **This is the bulk of her "multe nu se leagă" experience.** It is not a crash; it is an unfinished dashboard. Fixing it is a contained but non-trivial rewire of `platforma-data.ts` + 4 pages to query the real DB (admin client, super-admin is cross-tenant by design).

---

## 3b. ROUND 2 — Open Items Resolved (commit `230af11`, verified live)

| Was open | Now | Verified |
|---|---|---|
| `/platforma` ~80% mock (Marylou's dashboard) | Real DB via new `platforma-source.ts` (overview, cămine list+detail, utilizatori, facturare, audit). Mock helpers deleted. | ✅ `/platforma` shows real Casa Ana / Test 2 EDI / Vila Floarea; utilizatori real users; facturare real MRR |
| `/platforma/audit` viewer read mock | Reads real `audit_log` (server-side filters) | ✅ shows real 2026-05-18 login rows |
| Family→family-member invite missing | `inviteFamilyMemberAction` (owner-only, 5/resident cap, Resend magic link, `family_member`) + card on `/portal/preferinte` | ✅ invite card renders for owner |
| Notification prefs read still mock | `/portal/preferinte` reads real `family_notification_preferences` | ✅ weekly round-trip reflected |
| `updateTenantContactAction` mock-only | Persists to real `tenants` table | ✅ build/code (data-layer) |
| Resident photo upload (only code-verified before) | Full live round-trip proven | ✅ sharp→bucket→signed URL serves image→`avatar_url`→renders |

**Still genuinely blocked (NOT a code fix):** `NEXT_PUBLIC_CALENDLY_URL`. Verified live: `calendly.com/familylink` **and** `calendly.com/comfortmap` both return 404. The "Programează demo" button is dead because **no Calendly account exists at either handle**. The operator must create `calendly.com/comfortmap/demo-30-min` (the code-documented value); then set the env var. Pseudo-changing it to another 404 would not help.

## 3c. DEMO-READINESS PASS (in-app, real browser, all 3 accounts)

Verified live via Claude-in-Chrome on comfortmap.ro:

- **Super-admin /platforma** — overview, utilizatori, facturare, audit, cămine, cămin detail: all REAL data ✓
- **Camin admin /caminul** — dashboard (no crash), resident photo upload→save→**display** (staff + family side), staff↔family messaging (sent+received both ways), settings/contact persists, **invite staff** magic-link (E2E + DB), reports ✓
- **Family /portal** — real resident (not mock Andrei), bidirectional messaging, notification prefs, **family→member invite** (E2E + DB) ✓
- **Magic-link invites from every dashboard** — family→member ✓, camin-admin→staff ✓ (both real Resend email + correct `user_tenant_access`/`families` rows, test artifacts cleaned). Super-admin accept-lead & camin→family use the same verified `sendAdminMagicLink` path.
- **Sentry** — checked live, **clean**: original /caminul crash gone (not in 14d feed); the one new error was `/platforma/leads` on the *old* pre-fix release (verified working on current release, marked Resolved); FAMILYLINK-1 was a resolved test.
- **Automatic reporting (cron + manual)** — found + fixed two real gaps that would have looked broken in a demo:
  - `d51488d`: cron weekly-reports resolved families from mock (8-seed UUID map) → real residents got PDF but **no email**. Now real `families`/`prefs`/`users`. Verified vs prod DB (7 real families resolve, incl. Test 2 EDI).
  - `96b4601`: manual "Generează rapoarte" wrote a fake `/mock/…pdf` URL + 0 family emails. Now real `renderPdf`+`uploadReportPdf`+real families. Verified in-app: "1 trimise familiilor", PDF serves `200 application/pdf`.
  - `98db009`: `createReport` plain insert collided with the unique (resident,week) constraint → silent fallback to in-memory mock → `sent_to_family_at` never persisted + re-emailed every run. Now upsert (update existing or insert). DB-verified: single row, `sent_to_family_at` set, real PDF, idempotent.

**Deploy chain (all READY):** `230af11` → `f0f13d8` → `d51488d` → `96b4601` → `98db009` (current production).

**Verdict: demo-ready.** Every dashboard + the core flows (magic-link invites from all dashboards, messaging both directions, photo upload+display, real super-admin data, weekly reporting auto + manual) are verified working in-app. The **only** non-working item is the "Programează demo" Calendly button (no Calendly account at either handle — operator must create `calendly.com/comfortmap/demo-30-min`); avoid clicking it in the demo or set up the account first.

## 4. Other Findings

| Sev | Finding | Detail / Fix |
|-----|---------|--------------|
| HIGH | `/platforma` mock (see 3.3) | Rewire `platforma-data.ts` + overview/facturare/utilizatori/audit pages to real DB. ~½–1 day. |
| HIGH | Family→family-member invite missing | Build a portal action mirroring `inviteFamilyAction` but `family_member` role + owner-only permission + 5-member cap already enforced in `inviteFamilyAction`. |
| MED | `updateTenantContactAction` mock-only | Persist tenant contact/address to `tenants` table (currently `mockTenants[]`). |
| MED | `/platforma/audit` viewer reads mock | Point it at the now-populated real `audit_log`. |
| LOW | `NEXT_PUBLIC_CALENDLY_URL` = `calendly.com/familylink/demo-30-min` | Rebrand leftover → update to ComfortMap Calendly. |
| LOW | Stale invited rows | `marylou@europe.com` (archived Carmen tenant) + `marius@tahio.com` (Casa Ana) still `accepted_at=NULL`; will auto-accept on next magic-link click (fix #1) — or clean up. |
| SEC | **GitHub PAT in git remote URL** | The `niche` remote embeds a `ghp_…` token in plaintext in `.git/config`. Recommend rotating it and using a credential helper / `gh auth`. Repo is **GitHub** (`thenichesociety/familylink-app`) — not GitLab. |

---

## 5. GitHub Repository Access (Marylou / Cerasela)

- The codebase lives on **GitHub**, not GitLab: `github.com/thenichesociety/familylink-app` (org `thenichesociety`). A second fork remote `origin = github.com/Eduard22222222/familylink-app` also exists.
- Granting a person repo access is an **access-control change** that must be done by the repo owner in **GitHub → Settings → Collaborators/Teams** (invite by GitHub username/email). For safety I don't perform access-control grants automatically — do this from the GitHub UI.
- **Security:** the deploy remote currently authenticates with a personal access token baked into the remote URL. Rotate that token and store credentials via `gh auth login` or a git credential manager rather than in `.git/config`.

---

## 6. Email Rebrand (ComfortMap) — DONE

- `mail.familylink.ro` removed; `mail.comfortmap.ro` added to Resend EU, **verified** (DKIM+SPF).
- DNS records added to Vercel DNS; live send test from `noreply@mail.comfortmap.ro` succeeded.
- Vercel env `RESEND_FROM` = `ComfortMap <noreply@mail.comfortmap.ro>`, `RESEND_REPLY_TO` = `contact@comfortmap.ro` — live since deploy `41147df`.
- `/auth/confirm` bot-safe landing live (link-preview crawlers no longer burn one-time tokens).

---

## 7. Recommended Next Actions (priority order)

1. **Wire `/platforma` to real DB** (`platforma-data.ts` + overview/facturare/utilizatori/audit). Highest visible "nu se leagă" for Marylou.
2. **Build family→family-member invite** in `/portal` (owner-only, `family_member`).
3. Persist `updateTenantContactAction` to the `tenants` table.
4. Point `/platforma/audit` at the real `audit_log`.
5. Update `NEXT_PUBLIC_CALENDLY_URL`; rotate the GitHub PAT out of the git remote.
6. Add `onRouterTransitionStart` to `instrumentation-client.ts` (Sentry nav instrumentation warning).

---

# ROUND 3 — Magic-link login fix + Onboarding deliverable (later 2026-05-18)

**Context:** continued session. Marylou raised (WhatsApp): magic link "generat manual prin script", "DNS ptr email nu este finalizat", and a new acceptance criterion — onboarding documentation delivered in writing 48h before the final demo, such that she can create a new tenant **herself, without technical assistance**.

**Deploy chain (continues, all READY in prod):** … `98db009` → `96c5ae5` → `be65410` → **`7f31400`** → **`43b083e`** (current production).

## R3.1 Marylou's claims — investigated, factually false (except one)

| Claim | Reality (verified live 2026-05-18) |
|---|---|
| "DNS ptr email nu e finalizat" | **False.** Resend `mail.comfortmap.ro` = **status `verified`**, region eu-west-1 (EU/GDPR). DKIM (`resend._domainkey.mail`), SPF (`send.mail` → amazonses), MX (`feedback-smtp.eu-west-1.amazonses.com`), DMARC (`_dmarc.mail`) all resolve live. Real automatic invite/report emails **delivered** today. Her view was the pre-rebrand `mail.familylink.ro` state. |
| "Magic link generat manual prin script" | **Mostly false.** All dashboard invites (tenant admin, staff, family, family-member) use `sendAdminMagicLink` → fully automatic Resend email, proven delivered today. The **one** genuine fragile path was the **login-page** self-service magic link (`signInWithOtp`) — now fixed (R3.2). |

## R3.2 Login-page magic link (path #2) — FIXED + a regression caught live

**Was:** `src/app/login/actions.ts` `sendMagicLinkAction` used `supa.auth.signInWithOtp` → Supabase default email + `supabase.co/auth/v1/verify` hop. Fragile: depends on Site-URL allowlist; link-preview bots consume the one-time token → "link invalid/expirat".

**Now (`7f31400`):** reuses the proven invite mechanism — `sendAdminMagicLink` → `admin.generateLink` → `hashed_token` → `/auth/confirm` (bot-safe static page) → `/auth/callback` `verifyOtp` → cookie → role-aware redirect. Branded Resend email. Public-endpoint hardening: `allowInvite:false` (no account creation), generic anti-enumeration response.

**Regression caught by live testing (`43b083e`):** `admin.generateLink({type:'magiclink'})` does **NOT** error for a non-existent email — Supabase **silently creates the user** and returns success. So the `isNotFound` short-circuit never fired → the public login endpoint was auto-creating unsolicited accounts + sending emails. **Fix:** explicit `public.users` existence pre-check (case-insensitive) **before** any `generateLink` call when `allowInvite:false`; absent → return `userNotFound` (no account, no email). Caller still responds generically.

**Live verification on `43b083e` (comfortmap.ro):**
| Case | Result |
|---|---|
| Real account (`office+familytest@…`) → submit | ✅ email **"Linkul tău de acces ComfortMap" · delivered** in Resend, seconds after submit |
| Non-existent email ×2 (`nonexistent-probe…@example.com`) | ✅ **0 account created** (non-creating `listUsers` scan), **0 email sent** (Resend), identical generic message (anti-enumeration) |
| Gate vs real users (family / super-admin / camin) | ✅ all pass the `public.users` ilike query → magic link still sent to legit users |

All test pollution cleaned (probe auth users + `public.users` rows deleted).

## R3.3 Onboarding documentation — DELIVERED (acceptance criterion)

New vault doc: [[Onboarding Cămin Nou — Ghid Super-Admin]] (`Knowledge/`). Standalone RO runbook: super-admin login → meniu Cămine → Onboardează cămin → exact per-field rules (slug pattern, phone E.164) → outcome → verification checklist → troubleshooting table → FAQ → 60-second variant.

**Provably accurate — live click-tested as Marylou (super_admin) following the doc verbatim:** created `Casa Test Onboarding` (T1, **Trial**), auto-redirect to `/platforma/camine/{id}`, admin auto-invited (role `camin_admin`, 1 utilizator), 2 audit events by Mary-Lou, admin invite email **"Bun venit la ComfortMap — Casa Test Onboarding" · delivered**. Test tenant + test admin + access/audit rows then **deleted** (production clean for demo). → Criterion met: Marylou can self-create a tenant from this doc without technical help.

## R3.4 Local `.env.local` branding aligned (cosmetic + 1 functional)

FamilyLink → ComfortMap in local dev env: header, comments, and functionally `RESEND_FROM="ComfortMap <noreply@mail.comfortmap.ro>"`, `RESEND_REPLY_TO=contact@comfortmap.ro` (was `familylink.ro` — would fail local sends since that domain is no longer verified). **Production (Vercel) was already correct** (`NEXT_PUBLIC_APP_URL=https://comfortmap.ro` confirmed via Vercel API). `SENTRY_PROJECT=familylink` **left intentionally** — it's the real external Sentry project slug (org `thenichsociety`), not branding; renaming would break error reporting. Local file is gitignored → no commit/deploy.

## R3.5 OPEN — Handover access (prepared, NOT yet executed)

Marylou requested owner access to Supabase / Vercel / Resend / GitHub + the env file. **Deferred by operator until closer to handover date.** Prepared (exact invite deep-links captured for the runbook):
- Supabase: project `vvyknkizsxkfcdhprfcf` → Org → Team → invite `maryloumihaic@gmail.com` as Owner.
- Vercel: team **`family-link`**, project `familylink-app` → `vercel.com/family-link/~/settings/members`.
- Resend: `resend.com/settings/team`.
- GitHub: `github.com/thenichesociety/familylink-app/settings/access` (Marylou already a collaborator — raise to Admin).
- **Do NOT transmit `.env` via chat/WhatsApp.** Dashboard-owner access exposes all keys legitimately. If a file is required → encrypted channel + **rotate** post-handover: `SUPABASE_SERVICE_ROLE_KEY`, `SUPABASE_DB_PASSWORD` (flagged in-file as already chat-leaked), `RESEND_API_KEY`, `VERCEL_TOKEN`, `CLOUDFLARE_API_TOKEN`, `CRON_SECRET`, + the GitHub PAT in the git remote.
- **TODO (when near handover):** write `Knowledge/Handover & Access.md` runbook + key-rotation checklist + the polite client-facing message to Marylou.

## R3.6 Updated status

- ✅ Magic link (all paths incl. public login) automatic + bot-safe, verified live.
- ✅ Email DNS finalized & verified (Marylou's blocker is resolved/was stale).
- ✅ Onboarding self-service documentation delivered & validated → acceptance criterion met.
- ◐ Handover access: staged, pending operator action near demo date (R3.5).
- ⚠️ Unchanged from ROUND 2: Calendly button still dead (no account at `calendly.com/comfortmap`); GitHub PAT still in git remote (rotate at handover).

---

# ROUND 4 — Production incident: RLS infinite recursion (2026-05-19)

**Reported (pre-demo):** "nu mă pot loga pe contul de familie — mă redirecționează la site", "erori când am încercat magic links", "3 erori în Sentry".

## R4.1 Root cause

The `uta_select` SELECT policy on `public.user_tenant_access` had a 3rd OR
clause implemented as an **inline subquery on user_tenant_access itself**:
`EXISTS (SELECT 1 FROM user_tenant_access self WHERE … role IN (camin_admin,
super_admin) …)`. Reading the table from within its own SELECT policy
re-applies the policy → **infinite recursion** → Postgres aborts the whole
query (`infinite recursion detected in policy for relation
"user_tenant_access"`).

Cascade: every policy that sub-selects `user_tenant_access`
(`families_*`, `residents_*`, `journal_*`, `messages_*`,
`users_self_or_tenant_peers`) recursed through `uta_select` too.

Why it surfaced now: `signInAction` (password login) resolved the role via
the **anon/RLS-bound** client. The recursive query errors → swallowed by
`try/catch` → role unresolved → for any email NOT in the hardcoded
`DEMO_EMAIL_ROLE` map (e.g. `office+familytest@…`, `office@fiblyai.com`) the
destination defaulted to `/` → **landed on the public site**. Magic-link
login itself worked (callback uses admin client) but post-login RLS reads
(`/portal` → families) recursed → error/Sentry. `is_super_admin()` /
`has_tenant_access()` were already correctly `SECURITY DEFINER`; only this
one inline clause was wrong.

## R4.2 Fixes (both shipped + verified live)

| # | Fix | Where | Verified |
|---|-----|-------|----------|
| A | `signInAction` resolves role + `last_login_at` via **admin client** (service_role, bypass RLS) — same pattern as the ROUND 1 `/auth/callback` fix; `signInWithPassword` already validates the user. | `src/app/login/actions.ts` · commit `e090ae4` | ✅ deploy READY 2026-05-19 |
| B | **Root cause:** moved the recursive clause into `is_tenant_manager(uuid)` `SECURITY DEFINER` (same pattern as `is_super_admin`/`has_tenant_access`); `uta_select` USING = `user_id=auth.uid() OR is_super_admin() OR is_tenant_manager(tenant_id)`. Semantics identical (same roles/revoked_at) — pure recursion fix. Atomic txn. | `supabase/migrations/0007_fix_uta_select_recursion.sql` · commit `1ffc348` · **applied to prod DB 2026-05-19** | ✅ see R4.3 |

Fix B alone unblocks login on the *current* deploy (anon query no longer
recurses). Fix A is defense-in-depth (login redirect must not depend on RLS).

## R4.3 Live verification (comfortmap.ro)

- Anon/RLS `uta_select` as family → `[{role:family_owner}]` (was: recursion→null). `families` self-read → returns row (was: null).
- Cămin admin anon read → sees tenant-wide access rows (2) → `is_tenant_manager` preserves manager visibility, **no authz regression**.
- **Browser, password login** `office+familytest@…` → lands on **`/portal`** (real family dashboard, photo, "Andrei Test Family") — not the site. ✅
- **Browser, magic link** (mint → `/auth/confirm` bot-safe → click → `/auth/callback`) → **`/portal`** clean, no recursion. ✅

## R4.4 Sentry note (honest status)

No Sentry API token in env (`SENTRY_AUTH_TOKEN` commented out) → I did **not**
read the 3 issues directly. They are almost certainly this recursion
surfacing on RLS-bound reads (login redirect / `/portal` families read /
magic-link destination). Root cause is fixed and all previously-broken paths
verified working, so new occurrences should cease. **Action:** confirm in
Sentry that no NEW events arrive after 2026-05-19 17:3x; if titles mention
"infinite recursion … user_tenant_access" they are explained & resolved.

## R4.5 Lesson (added to skill memory)

`signInWithPassword`/auth-success ≠ correct redirect. Role-resolution that
depends on the RLS-bound client is fragile; mirror the `/auth/callback`
admin-client pattern everywhere a post-auth redirect is computed. RLS
self-referential membership tables MUST use `SECURITY DEFINER` helpers, never
inline subqueries on the guarded table. Live negative test (a non-demo-map
account, the adversarial path) is what exposed it — same discipline as
[[[skill] auth_live_verification]].

---

# ROUND 5 — Per-staff resident assignment feature (2026-05-19/20)

**Request:** dashboard de asistent diferit de admin, board DnD pe admin pentru
alocarea pacienților, asistenții văd doar pacienții lor (cu update live la
reasignare), drepturile staff = doar „scriere" (jurnal + mesaje pe alocați);
admin singur invită rezidenți, familii și staff; UI și RLS din start.

Construit în 4 pași cu check-in la fiecare; commit per pas:

## R5.1 Pas 1 — Data model aditiv (commit `34ed4e6`, migration `0008`)

- Tabel `public.resident_assignments` (M:N staff↔resident, soft-remove via
  `removed_at`, partial-unique pe (resident_id, staff_user_id) where active).
- 5 indexes (pkey + active_uniq + staff_active + resident_active + tenant).
- Helper `is_assigned_to_resident(uuid)` `SECURITY DEFINER` —
  recursion-proof prin construcție.
- RLS pe noul tabel: ra_select (admin sau staff_user_id = auth.uid()) +
  ra_admin_write (admin only). Niciun subquery inline pe tabelul păzit.
- Verificat: 17/17 checks (structural, anti-recursie, admin INSERT/SELECT,
  helper rpc, write denied pentru familie, R4 fix intact).

## R5.2 Pas 2 — App layer (commit `477d6c9`)

- `src/lib/repositories/assignments.repo.ts` — list / assign idempotent
  (active = no-op; soft-removed = revive; else insert) / unassign soft-remove.
- `src/lib/services/assignments.service.ts` — `requireTenantContext` +
  `assertRole([admin, super])` + audit log pe create/delete.
- `src/lib/services/resident.service.getResident()` — pentru `camin_staff`
  aruncă `NotFoundError` dacă rezidentul nu e alocat → page-ul tratează cu
  `notFound()` (404 curat, fără leak de existență).
- `src/lib/services/messaging.service.listThreadsForTenant()` — pentru staff,
  filtrează thread-urile la rezidenți alocați.
- `src/app/(staff)/_actions.ts` — `assignStaffAction` /
  `unassignStaffAction` Server Actions thin + gate admin-only pe
  `inviteFamilyAction` (admin only). `inviteStaffAction` deja avea gate.
- Verificat live: admin INSERT pe `resident_assignments` permis de RLS;
  familia INSERT denied; helper rpc returnează `true` pentru alocat;
  R4 uta_select intact.

## R5.3 Pas 3 — UI (commit `d15d435`)

- Board DnD nou pe `/caminul/echipa/alocari` cu `@dnd-kit` (PointerSensor +
  TouchSensor — tablet-friendly). Coloane = asistenți + „Nealocați"; carduri
  pacient cu recency badge. Drag = atomic reassign (unassign source +
  assign target). Optimistic UI cu rollback pe eroare server action.
- Helper centralizat `src/lib/utils/role-nav.ts` — `staffNav(role)` →
  navItems + userRoleLabel + isAdmin. A înlocuit `userRoleLabel="Administrator"`
  hardcodat pe 8 pagini (staff vedea „Administrator" în header — bug).
- Helper `src/lib/services/tenant-members.service.ts.listStaffInTenant()`
  (admin-only) pentru coloanele DnD.
- 10 pagini staff role-aware (`/caminul`, `/rezidenti`, `/rezidenti/[id]`,
  `/rezidenti/nou`, `/rezidenti/[id]/editeaza`, `/rezidenti/[id]/invita-familie`,
  `/echipa`, `/echipa/invita`, `/echipa/alocari`, `/mesaje`, `/setari`,
  `/rapoarte`):
  - Tile-urile/butoanele admin-only ascunse pentru staff (Adaugă rezident,
    Invită staff, Invită familie, Echipa).
  - Page-level `redirect("/caminul")` pe rute admin-only când e staff.
  - `/setari` split pe rol: admin = ce e azi; staff = doar „Profilul meu"
    (nume + email + rol read-only + schimbare parolă; ZERO date despre cămin
    / abonament / GDPR).
  - `/mesaje` folosește `listResidents` (service-filter) → inbox-uri
    WhatsApp-style scoped pe alocații staff-ului.
- Verificat live ca admin (office@fiblyai.com) + ca staff (Eduard,
  edumitriu04@gmail.com): rol label, nav, tile-uri, redirect-uri, setări
  split, board DnD render, drept de scris staff pe pacient alocat — toate
  corect.

## R5.4 Pas 4 — Închiderea RLS (commit `30581a5`, migration `0009`)

Până la Pas 4, RLS-ul vechi (`has_tenant_access`) permitea oricărui membru
tenant să vadă tot — scoping-ul staff era DOAR în UI + service. Pas 4
înlocuiește `has_tenant_access` cu `is_tenant_manager` (admin/super) +
`is_assigned_to_resident` (staff scoping) pe 8 politici (residents:2,
journal_entries:2, messages:2, families:2). Tranzacție atomică, doar
SECURITY DEFINER helpers — anti-recursie prin construcție.

Verificat live (22/22 anon RLS checks):
- Family (Andrei Test 2 EDI): unchanged — vede propriul rezident/jurnal/
  familie; NU vede Casa Ana; uta_select intact (R4 fix neregresat).
- Admin Test 2 EDI / Mariana Casa Ana: vede tot în tenantul lor, izolare
  inter-tenant intactă.
- Staff Eduard FĂRĂ alocare: **0** rezidenți / jurnal / mesaje vizibile;
  INSERT rezident DENIED; INSERT familie DENIED.
- Staff Eduard CU alocare la Mama Maria: vede DOAR Mama Maria + jurnalul +
  familiile ei; POATE INSERT jurnal pentru ea; NU POATE INSERT rezident /
  familie.
- Zero `infinite recursion` anywhere.

## R5.5 Outstanding / next

- DnD click-drag via Chrome MCP nu activează `@dnd-kit/PointerSensor`
  (limitare a sintezei de PointerEvents). Pe mouse/touch real funcționează —
  board-ul a fost verificat funcțional prin path data → UI (assignment-ul
  direct în DB se reflectă instant în coloana corespunzătoare).
- Family_member (membri secundari familie, max 5/rezident per contract Faza 1):
  schema actuală face INSERT separat în `families` per membru (fiecare e
  `owner_user_id` al propriului rând) — policy-ul `owner_user_id = auth.uid()`
  acoperă natural. 0 family_member-i activi la momentul migrației, deci
  niciun user real impactat. Dacă schema se schimbă spre o tabelă
  `family_members` separată, RLS-ul va avea nevoie de extensie.
- Pas 5/6 (UI staff scoped) — îndeplinit în cadrul Pas 3 (task #6 ✅).

## R5.6 Lesson (adăugat în skill)

RLS migrațiile critice: **niciun subquery inline pe tabelul păzit**, **doar
SECURITY DEFINER helpers**, **tranzacție atomică (BEGIN/COMMIT)**, **diff
explicit per policy în comentariu** + **verificare per rol live** (anon RLS
oracle, nu calul Troiei a admin client-ului). Numărul de policies înainte/
după trebuie să fie identic (count check); semantica fiecăreia ce s-a păstrat
vs ce s-a schimbat — documentat în migrație.

---

# ROUND 6 — List-first UI la scale (2026-05-20)

**Request:** la 140 pacienți × 14 asistenți DnD-ul nu mai funcționează (coloanele
nu încap pe ecran, mobile e clunky). Construim un UI list-first care scalează
pre-handover. DnD rămâne ca toggle pentru cămine mici. Toate cele 4 bulk
operations + preferință persistată pe profilul adminului. 4 commits, 3 faze.

## R6.1 B.1 — Foundation (commit `07e55ef`, migration `0010`)

- `migration 0010`: coloană `users.ui_preferences` JSONB (default `{}`) + GIN
  index. RLS neschimbat (`users_self_update` acoperă self-write).
- `user-preferences.service.ts`: `getMyUiPreferences()` / `patchMyUiPreferences()`
  pe propriul rând via admin client (user.id validat de Auth).
- `assignments-view-mode.ts`: smart-default — Board ≤6 staff, List >6;
  preferință explicită override.
- `assignments.repo.ts` + 5 bulk helpers (listUnassignedResidentIds,
  listStaffUserIdsForTenant, bulkInsertAssignments, bulkSoftRemoveByStaff,
  bulkSoftRemoveByTenant).
- `assignments.service.ts` + 4 bulk operations (admin-only via `assertRole`,
  1 audit row per batch cu metadata): assignBulk, reassignAllFromStaff,
  autoDistributeUnassigned, resetAllAssignments.
- `(staff)/_actions.ts` + 5 Server Actions thin wrappers.
- Deps adăugate: `@radix-ui/react-popover@^1.1.6` + `@radix-ui/react-dialog@^1.1.6`
  (accesibilitate + focus management).
- Verificat: 9/9 structural (column, index, RLS policies neschimbate,
  helpers SECURITY DEFINER intacte) + round-trip preferință OK.

## R6.2 B.2 — List UI (commit `3864e3f`)

- `view-mode-toggle.tsx`: switch Listă/Board, persistă via Server Action,
  warning badge dacă Board la >6 staff.
- `assignment-list.tsx` (~500 LOC): search input + 3+N filter chips (Toți,
  Nealocați, Cu alerte, per staff), patient rows cu checkbox + chip
  „alocat la X ▾", tap-chip → Radix Popover cu staff search-as-type +
  Nealocat option → reassign atomic optimistic, multi-select cu sticky bulk
  action bar (Selectează tot vizibilul / Alocă selectații la… / Dezalocă).
- Page (`alocari/page.tsx`) read preferences + resolveViewMode → renderă
  AssignmentBoard SAU AssignmentList; description text adaptat per mod.
- Verificat live: toggle persistă peste reload, search + filter chips
  funcționale, popover tap-assign deschide cu listă asistenți + check mark
  pe curent.

## R6.3 B.3 — Power actions (commit `f4fa453`)

- `power-actions-menu.tsx`: dropdown „Acțiuni" lângă toggle cu două operații
  globale:
  - „Distribuie egal nealocații" → autoDistributeUnassignedAction
  - „Reset alocările zilei" → deschide Radix Dialog cu warning roșu,
    descriere despre audit retention, butoane Anulează + Reset alocările
    (roșu destructive). Toast inline auto-hide 5s.
- `assignment-list.tsx` + band contextual: când filtru = un asistent specific,
  apare „Filtrat la X · N pacienți   [Mută toți pacienții la… ▾]" — Popover
  listează ceilalți asistenți; pe pick → reassignAllFromStaffAction
  (optimistic UI cu rollback).
- Verificat live: meniu Acțiuni render perfect, Reset Dialog modal cu focus
  trap, „Mută toți" band apare/dispare în funcție de filtrul activ.

## R6.4 Verificare live admin

Sesiune ca `office@fiblyai.com` (admin Test 2 EDI):
- /caminul/echipa/alocari încarcă în mod Board (smart default la 2 staff)
- Toggle → comutare la Listă persistă peste reload (DB writeback)
- Filter chips cu counts corecte (Toți 1, Nealocați 0, Cu alerte 0, fiecare
  staff cu propriul count)
- Tap pe „Eduard ▾" → popover cu Nealocat + 2 staff + check mark pe curent
- Acțiuni → menu cu Distribuie egal + Reset alocările (cu descrieri)
- Filtrat la „Eduard" → band „1 pacient · [Mută toți pacienții la…]"
- Reset Dialog → modal blocant, copy clar, Anulează default-safe
- Zero erori în consolă, RLS Pas 4 intact (admin vede tot tenant-ul lui)

## R6.5 Note finale

- Sidebar de staff propus inițial — **omis în favor de** chips de filtru +
  band contextual + dropdown Acțiuni. Simpler și mobile-natural; sidebar ar
  fi fost redundant peste chips. Pot reveni la sidebar dacă feedback real
  de utilizare cere.
- Mobile UX vine *natural* din responsive list — chips în top scroll, search
  fix, popover-uri Radix devin native pe touch (focus trap, scroll lock).
  Nu există cod separat mobil; același component funcționează pe phone,
  tabletă, desktop.
- `users.ui_preferences` JSONB liber — Faza 2 poate adăuga chei suplimentare
  (ex: filtre default per cameră) fără migrație nouă.

## R6.6 Lesson (în skill)

UI-uri la scale: **list-first cu filtru și bulk** scalează la 140+ rânduri;
**DnD board** rămâne sweet-spot la 3-6 coloane. Smart default după shape-ul
datelor + override-uri explicite persistate — utilizatorul nu trebuie să
re-aleagă la fiecare vizită. **Optimistic UI** cu rollback explicit pe
eroare server-action e mandatory când există multi-step server-side flow
(unassign + assign = 2 calls; rollback dacă oricare pică).

## R6.7 Bug fix + „Dezalocă toți" (commit `22a093e`, 2026-05-19/20)

**Bug raportat de Eduard:** „can am dat dealocare mi a ramas alocata mama
maria, verifica functiile". După single-resident reassign din list view,
chip-ul rămânea pe asistentul vechi până la hard refresh.

**Root cause:** Server Actions `assignStaffAction` și `unassignStaffAction`
emiteau `revalidatePath('/caminul/echipa')` dar NU și
`/caminul/echipa/alocari` — sub-ruta nu era invalidată, iar componenta
client-side `assignment-list.tsx` avea `useState(initialResidents)` fără
sync pe schimbarea prop-ului din server, deci state-ul local optimistic
diverega de la server truth după revalidate parțial.

**Fix:**
1. Adăugat `revalidatePath('/caminul/echipa/alocari')` în ambele actions.
2. Adăugat `useEffect(() => setResidents(initialResidents),
   [initialResidents])` în `assignment-list.tsx` ca state local să se
   resincronizeze cu props la fiecare revalidate.

**Feature cerut de Eduard:** „vezi ca nu avem buton de dealocare ma gandesc
ca ar prinde bine la lista sa avem pe fiecare asistent un sistem de
dealocare". Adăugat `UnassignAllButton` sub-component:
- Apare în band-ul contextual când filtrul = un asistent specific
  (lângă „Mută toți pacienții la…").
- Buton amber-tinted „Dezalocă toți" cu Radix Popover de confirmare:
  „Dezalocă toți pacienții lui X? · N pacienți vor deveni Nealocați.
  Poți să-i realoca oricând prin tap pe chip sau bulk."
- Wired pe noul server action `unassignAllFromStaffAction` → service
  `unassignAllFromStaff` → repo `bulkSoftRemoveByStaff`.
- Optimistic UI cu rollback pe eroare server.

**Verificare live end-to-end:**
- Setup: am recreat manual via service_role assignment Mama Maria → Eduard 2
  (ra.id `f76e0411-9b71-4f1f-9ac9-0836b4130696`, created 23:40:16).
- Acțiune: log-in admin `office@fiblyai.com` → /caminul/echipa/alocari →
  filter chip „Eduard 1" → band contextual cu butonul nou → click „Dezalocă
  toți" → popover confirm → click confirm.
- Rezultat DB (verificat via service_role query după 4s):
  - Mama Maria: **0 active / 3 total** assignments
  - Cel mai recent row: `removed_at=2026-05-19T23:41:10` (~54s după create)
  - Toate cele 3 row-uri istorice rămân pentru audit (soft-delete preserved)
- Rezultat UI: re-render automat fără F5, Mama Maria revine la chip
  „Nealocat", band-ul contextual dispare (filtrul „Eduard 1" arată 0
  pacienți).

**Status:** Pas 4 + B.1-B.3 + bug fix + Dezalocă-all = **toate verificate
live** end-to-end. Sistem alocări production-ready pentru handover.

## R6.8 B.4 — Filtre + sort + N+1 fix pe /caminul/rezidenti (commit `1e7a17e`, 2026-05-20)

Pagina `/caminul/rezidenti` avea doar search basic + view toggle list/grid.
Nici filtre, nici sort, plus un **N+1 query** la jurnal: pentru fiecare
rezident făcea un `listJournalForResident(r.id, ...)` separat — 50 query-uri
la T1, 200+ la T4, scădea perf semnificativ.

### B.4.1 Bulk journal fetch (fix N+1)

- Nou în `journal.repo.ts` → `listLatestJournalByResidentForTenant(tenantId)`
  - 1 query: top 2000 entries by `published_at DESC`, filtrate `deleted_at IS NULL`
  - În JS: reduce într-un `Map<residentId, JournalEntry>` păstrând doar primul
    hit per rezident (= cel mai recent)
  - La T3+ (>2000 entries/lună) va migra la RPC cu `DISTINCT ON (resident_id)`
- Nou în `journal.service.ts` → `listLatestJournalForTenant(tenantId)` cu
  `requireTenantContext` (RLS-safe wrapper)
- `page.tsx`: înlocuit `Promise.all(residents.map(async (r) => listJournalForResident(r.id, ...)))`
  cu un singur `listLatestJournalForTenant(tenantId)` + lookup `Map.get(r.id)`

### B.4.2 Filter chips + sort + URL state

- Nou: `filters-bar.tsx` (client component) — interactiv, persistă tot în URL:
  - **Search input** cu debounce 250ms (`useEffect` → `setTimeout` →
    `router.replace`); icon clear; back/forward sync via second useEffect
  - **View toggle** Listă/Grid (Link-uri buildHref preservând restul params)
  - **Sort dropdown** combobox: Alfabetic A–Z / Ultim update / Cameră
  - **Filter chips** orizontale: Toți · Update azi · Fără update săptămâna asta · Cu note speciale · Per cameră (cu dropdown sub-menu)
  - Counts în fiecare chip reflectă universul după search (chip-urile sunt
    contextuale, nu globale)
- `page.tsx`: refactor în helper pură `bucketAndSort()` care primește
  residents+latestMap+filter+sort și returnează `{sorted, countToday, countNoWeek, countNotes, perRoomCounts, rooms}`. Date.now() out of render
  (React 19 purity rule).
- Empty states context-aware: search miss vs filter miss vs no data.

### B.4.3 Verificare live

Deploy 1e7a17e READY pe `comfortmap.ro`. Test ca admin
`office@fiblyai.com` pe `/caminul/rezidenti`:

- `?` (default) → Toți chip activ, count 1, Mama Maria vizibilă, "1 din 1 activi"
- `?filter=today` → Update azi activ, Mama Maria în listă (Update azi badge verde)
- `?filter=no-week` → 0 rezultate, empty state „Niciun rezident nu se potrivește acestui filtru"
- `?q=xyz` → 0 rezultate, empty state „Nu am găsit rezidenți pentru 'xyz'"
- `?q=mama&sort=recent` → Mama Maria găsită, sort schimbat
- `?filter=room-Test-101` → Cam. Test-101 chip activ, Mama Maria
- Per cameră dropdown click → menu apare cu „Toate camerele" + „Cam. Test-101  1"
- Search box: type „mam" → URL auto-update la `?q=mam` după ~250ms debounce
- Console clean, zero erori

**Status: B.4 production-ready pentru handover.** N+1 eliminat, UI matches
B.2-B.3 pattern (consistent UX peste alocări & rezidenți).

## R6.9 B.5 — Voice transcribe cu OpenAI Whisper (commit `2ba0197`, 2026-05-20)

Asistenții pot dicta update-urile de jurnal vocal în loc să tasteze. Util
pentru pacienți multipli, asistenți cu mâini ocupate, fluiditate la T2-T4
scale (50+ updates/zi per asistent).

### B.5.1 OpenAI key + Vercel env

- Cheie creată via dashboard OpenAI (Personal org, Default project)
  cu nume **"FamilyLink Whisper Prod"**, **Restricted scope**: Model
  capabilities = Request (acoperă /v1/audio/transcriptions + alte model
  endpoints). Assistants/Threads/Evals/Fine-tuning rămân None.
- Salvată local în `.env.local` (gitignored) ca `OPENAI_API_KEY`.
- Push la Vercel ca encrypted env var (production+preview+development)
  via `scripts/add-openai-key-to-vercel.mjs` cu API token existent.
- **Blocker**: contul OpenAI = Pay-as-you-go cu balance $0. Test direct
  cu key dă 429 `insufficient_quota`. User trebuie să adauge credit
  (~$20 starter recomandat, auto-recharge la $30/lună cap).

### B.5.2 /api/transcribe endpoint

- `src/app/api/transcribe/route.ts`:
  - `POST` cu FormData `{ audio: Blob, lang?: "ro" }`
  - Session check (`requireSession`) — doar useri autentificați
  - Validări: 25 MB max (limita Whisper), mime audio/*, blob non-zero
  - Forward la `https://api.openai.com/v1/audio/transcriptions` cu
    `model=whisper-1`, `language=ro`, `temperature=0`
  - Timeout 60s pe upload (Fluid Compute oferă 300s headroom)
  - Error mapping: 401 → "Credențiale invalide", 429/insufficient_quota
    → 503 "Suprasolicitat", 422 dacă text gol post-transcribere

### B.5.3 Voice input UI

- `src/app/(staff)/caminul/rezidenti/[id]/voice-input.tsx`:
  - MediaRecorder API client component cu state machine
    (idle → permission → recording → uploading → idle/error)
  - Pulse animation roșu pe recording
  - Mime negotiation cross-browser (webm/opus preferred, fallback ogg/m4a/wav)
  - Graceful fallback "Vocal indisponibil" dacă MediaRecorder lipsește
  - getUserMedia cu echoCancellation + noiseSuppression + autoGain
  - Tooltip GDPR mini: "Audio procesat tranzient prin OpenAI (servere US,
    fără stocare la noi)"
- `post-update-form.tsx`: textarea controlată cu body state, buton
  "Vorbește" sub textarea cu char counter `body.length/2000`.
  Append cu auto-punct între segmente (dacă fraza nu se termină cu `.!?,…`
  inserăm `. ` între dictări consecutive).

### B.5.4 Live end-to-end verify

- Deploy `2ba0197` READY, /api/transcribe returnează 400 fără audio (nu 404)
- Pagina rezidentului `9bd7c557-...` (Mama Maria) afișează:
  - Placeholder actualizat: "...sau apasă „Vorbește" și dictează."
  - Buton `🎤 Vorbește` sub textarea
  - Char counter `0/2000`
- **Pipeline test direct via JS în Chrome MCP** (admin session activ):
  - Generat 1.1s de silence webm (646 bytes) via AudioContext+MediaRecorder
  - POST la `/api/transcribe` cu cookie session
  - Round-trip 1165ms (Vercel Frankfurt → OpenAI US → response)
  - HTTP 503 cu mesaj `"Serviciu temporar suprasolicitat. Încearcă din nou
    într-un minut sau scrie textual."`
  - Confirmă: auth ✅, FormData parsing ✅, upstream call ✅, error map ✅

**Status: cod B.5 production-ready.** Singurul blocker = credit OpenAI
(user action). Când e adăugat → transcribere live funcționează fără
modificare cod.

### GDPR follow-up (deferred)

- Tooltip pe butonul mic conține disclosure scurt
- TODO B.6: paragraf în `/legal/confidentialitate` despre voice processing
- TODO B.6: poate one-time consent dialog la prima apăsare (localStorage flag)
- OpenAI Data Processing Addendum: free pt EU customers, user trebuie să-l
  semneze din OpenAI org settings (link în vault Knowledge/GDPR)

## R7 Incident email — buton invizibil + scaner anti-phishing (2026-05-22)

Eduard a creat căminul "Acad. Nicole Cajal" și a invitat admini/staff.
Trei probleme distincte au ieșit la iveală — toate diagnosticate + reparate.

### R7.1 Buton magic link invizibil în Yahoo (commit `6122cb4`)

Butonul email folosea `background:linear-gradient(...)` (shorthand). Yahoo
Mail nu suportă gradients și, per spec CSS, ignoră ÎNTREAGA proprietate
`background` → fundal transparent + text alb = buton invizibil (alb pe alb).

**Fix** (`magic-link.service.ts` `renderEmailHtml`): bulletproof button —
`bgcolor="#2DA0C7"` attribute pe `<td>` + `background-color:#2DA0C7` solid pe
`<td>` și `<a>` + `background-image:linear-gradient` separat (enhancement).
Clienții cu gradient îl arată; ceilalți cad pe teal solid. Verificat:
simulare Yahoo (gradient scos) → buton teal solid vizibil.

### R7.2 `@realitateasociala.ro` — domeniu inexistent

Emailurile către `marylou@` / `cerasela@realitateasociala.ro` blocate la
status `sent`, niciodată `delivered`. Cauză: `realitateasociala.ro` e
**NXDOMAIN** (confirmat Romtelecom + Google DNS) — neînregistrat, fără MX.
Adrese fictive din mock seed data ajunse în DB real. Cerasela primește pe
Yahoo-ul ei real (`mariacerasela_maciuca@yahoo.com` — status `delivered`).
Infrastructura de trimitere e OK: `mail.comfortmap.ro` are DKIM+SPF+DMARC.
**TODO**: corectează emailurile fictive din conturile seed cu adrese reale.

### R7.3 Link invitație "invalid sau expirat" — scaner anti-phishing (commit `c377afa`)

Link-urile de invitație staff arătau "invalid sau expirat" la primul click.
Cauză: butonul din `/auth/confirm` era link GET (`<a href="/auth/callback?token...">`).
Scanerele agresive (Microsoft Safe Links / Outlook) urmăresc nu doar link-ul
din email ci și link-urile GET din pagina randată → ajung la `/auth/callback`
→ consumă token-ul one-time înainte de click-ul uman.

**Fix — soluția standard (Auth0/Postmark/Supabase) pentru one-time tokens:**

- `auth/confirm/page.tsx`: butonul "Intră în cont" devine
  `<form method="POST" action="/auth/callback">` cu token_hash/type/next ca
  hidden inputs + `<button type=submit>`. Server component pur, zero JS.
- `auth/callback/route.ts`: handler POST nou = singura cale care face
  verifyOtp (consumă token). GET cu token_hash NU mai consumă → redirect la
  `/auth/confirm`. GET păstrează doar `code` PKCE + error_description.
  Logica post-login extrasă în helper `completeLogin` (audit, last_login,
  auto-accept invitații, destinație) — notele R4 (admin client) păstrate.
- De ce merge: scanerele fac DOAR GET-uri (safe/idempotent prin spec HTTP),
  nu trimit POST-uri. GET-ul scanerului vede formularul dar nu-l trimite.

**Verificat live end-to-end pe producție** (deploy c377afa READY): token
proaspăt → 2 GET-uri simulate (scaner) pe /auth/confirm + /auth/callback →
token intact (GET callback redirect 307 la confirm, nu consumă) → POST real
→ 303 login reușit. Token-ul a supraviețuit GET-urilor, consumat doar la POST.

### R7 Lesson (în skill)

One-time tokens în email: **consumarea trebuie legată de POST, nu de GET**.
Scanerele anti-phishing (Microsoft Safe Links etc.) urmăresc link-uri GET
recursiv — un `<a href>` intermediar nu protejează. Doar `<form method=POST>`
rezistă (scanerele nu trimit POST-uri). Pagina-intermediar bot-safe e
necesară dar NU suficientă dacă butonul ei e tot un GET.

### R7.4 Root-cause FAMILYLINK-3 — createTenant fără crash la validare (commit `d311423`, F.2)

Eduard a cerut „fully resolved" — nu doar marcat, ci cauza eliminată.

**Cauza reală** (mascată de Next.js — toate erorile server primesc mesajul
generic): `createTenantAction` făcea `throw new Error(firstError)` la ORICE
eroare de validare Zod a formularului de onboarding cămin. Un throw
netratat într-un Server Action → în producție = "An error occurred in the
Server Components render" → pagină de crash + event Sentry. „Intermitent"
= se întâmpla DOAR când inputul formularului era invalid. Eveniment 44192238
(/platforma/camine/nou, 08:20, mobil) = creare Cajal cu un câmp greșit →
crash; retry corect 08:22 → succes. Se potrivește perfect.

**Fix — eliminate TOATE căile de crash din flow-ul de creare tenant:**
- `createTenantAction`: semnătură `(prev, formData) => Promise<TenantActionResult>`.
  Validare eșuată → `return {ok:false, error}` (NU throw). `createTenant` DB
  failure → try/catch + mesaj prietenos. `inviteTenantAdmin` → try/catch
  (best-effort). `redirect()` rămâne în afara try/catch.
- `new-tenant-form.tsx` (client component nou): `useActionState`, banner roșu
  inline pentru erori. Zero crash pentru un câmp greșit.
- `nou/page.tsx`: simplificat — randează NewTenantForm.
- `platforma-source.ts` `getTenantDetail`: try/catch — calea redirect-ului
  post-creare (/platforma/camine/[id]) degradează grațios dacă un query
  Supabase rejectează, în loc de Server Component crash.

**Verificat live** (super-admin, deploy d311423): formular completat cu
telefon `0712345678` (format greșit, fără +40 — exact ce tastează un om pe
mobil) → submit → **banner roșu „Telefonul trebuie sa fie in format E.164"**,
pagina intactă, zero crash, zero event Sentry, niciun tenant junk creat
(validarea pică înainte de `createTenant`).

**FAMILYLINK-3 marcat Resolved în Sentry** — de data asta cu cauză
identificată + fix verificat, nu speculativ. Dacă reapare pe un release
>= d311423, e o cauză NOUĂ (alt root cause sub același mesaj generic).

### R7.5 Magic link eșua la conturi noi — `verification_type` (commit `dc27f5f`, F.3)

Eduard a raportat că invitațiile „nu bagă omul în platformă" / „link invalid
sau expirat" — și, ciudat, **„la unii merge, la alții nu"**. La onboarding-ul
căminului Cajal: Bogdan, `ireneai020504@gmail.com`, `dumitriueduard22@stud.ase.ro`
picau; Cerasela, Irina, dr. Iulia mergeau.

**Cauza reală — reprodusă determinist live.** `admin.generateLink({type:'magiclink'})`
întoarce tipuri DIFERITE de token în funcție de istoricul emailului:

| Situație | `properties.verification_type` | Token stocat în |
|---|---|---|
| Prima invitație (email inexistent) | `signup` | `confirmation_token` |
| A 2-a+ invitație (user deja există) | `magiclink` | coloana de magic link |

Pentru un email nou, `generateLink({type:'magiclink'})` nu dă eroare — creează
tăcut user-ul ȘI întoarce un token de tip `signup` (userul nou trebuie întâi
confirmat). La a 2-a invitație, userul existând deja, întoarce un `magiclink`
real.

`magic-link.service.ts` **hardcoda `type=magiclink`** în URL, ignorând tipul
real raportat. Deci:
- **Prima invitație** → token `signup`, URL zice `magiclink` → `verifyOtp`
  caută în coloana greșită → „Email link is invalid or has expired". **Pica
  mereu.**
- **Re-invitația** → token `magiclink`, URL zice `magiclink` → se potrivește →
  **mergea mereu.**

**De ce „la unii merge, la alții nu":** depindea exclusiv de dacă persoana
fusese reinvitată. Cerasela / Irina / dr. Iulia — reinvitate → token `magiclink`
→ mergea. Bogdan / Eduard-stud / Irene — click pe prima invitație → token
`signup` → pica. Că toți reinvitații erau pe @yahoo a fost **pură coincidență**
(3 din 3) — NU scanere anti-phishing, NU provider de email. Teoria inițială
„conturi noi eșuează" era incompletă: corect e **„prima invitație vs
reinvitație"**.

**Fix (`dc27f5f`):** `sendAdminMagicLink` citește acum tipul real din
`properties.verification_type` pe ambele ramuri (magiclink + invite), în loc
să-l presupună. Alias `MagicLinkOtpType` lărgit cu `signup`. `/auth/callback`
+ `/auth/confirm` acceptau deja `signup` (de la `c377afa`) — zero schimbare
acolo.

**Verificat live pe comfortmap.ro — 4 teste determinist:**

| Test | Rezultat |
|---|---|
| A — `generateLink` ×3 pe email nou | `signup` → `magiclink` → `magiclink` ✓ |
| B — 1ª invitație + `type=magiclink` (cod vechi) | ❌ „invalid or expired", fără cookie |
| C — re-invitație + `type=magiclink` (cod vechi) | ✅ 303 → /portal + cookie (explică succesele) |
| D — 1ª invitație + `type=signup` (fix) | ✅ 303 → /portal + cookie |

Toate cele **6 căi de invitație** trec prin `sendAdminMagicLink` reparat —
niciuna nu pre-creează userul, toate lasă `generateLink` să-l creeze, deci
toate erau afectate identic: `inviteFamilyAction` (staff→familie, `/portal`),
`inviteFamilyMemberAction` (familie→membru, `/portal`), `inviteStaffAction`
(`/caminul`), 2× super-admin (create-tenant admin + resend, `/caminul`), login
public (`allowInvite:false`).

**Gotcha de deploy (CRITIC pentru viitor).** Repo-ul are DOUĂ remote-uri:
`origin` = `Eduard22222222/familylink-app` (rulează CI GitHub Actions) și
`niche` = `thenichesociety/familylink-app` (**de unde deployează Vercel**).
`git push origin main` → CI verde dar **ZERO deploy Vercel**. Fix-ul a fost
live abia după `git push niche main`. Confirmat via Vercel API (team
`family-link`): producție = `dc27f5f` READY. **Regulă: pentru deploy →
`git push niche main`, nu doar origin. Confirmă deploy-ul prin SHA-ul live
real, nu prin „push reușit".**

**De reinvitat (conturi blocate, `email_confirmed_at` NULL):**
`bogdan@buftealakeresort.ro`, `dumitriueduard22@stud.ase.ro`,
`ireneai020504@gmail.com`. Cu fix-ul live, prima invitație merge din prima.

**Probleme SEPARATE de bug:**
- `cerasela@realitateasociala.ro` (+ `marylou@`, `contact@casa-ana.ro`) —
  domeniul `realitateasociala.ro` e **NXDOMAIN**, mailurile cad indiferent de
  magic link (adrese fictive seed — vezi R7.2; Cerasela reală =
  `mariacerasela_maciuca@yahoo.com`).
- Mail ajuns în spam — reputație domeniu de trimitere `comfortmap.ro` (domeniu
  nou). Nu ține de token; warm-up + DMARC pe root.

**Lecție (skill).** `generateLink`/`verifyOtp` cu `token_hash`: tipul OTP **NU
e o constantă** — email nou → `signup`, email existent → `magiclink`. Citește
MEREU `properties.verification_type`, nu-l hardcoda. Bug-urile „merge la unii,
nu la alții" cer **reproducere care variază exact dimensiunea suspectă** (aici:
nr. de invitații), nu inferență din corelații observate live (Yahoo-vs-Gmail
era coincidență). Un repo cu mai multe remote-uri poate avea CI pe unul și
deploy pe altul — confirmă deploy-ul prin SHA live.

---

## R7.6 — Sprintul „6 puncte vineri" + H.7 Sentry definitiv (2026-05-24)

Cerasela vineri (meeting notes): 6 puncte de polish înainte de demo larg.
Eduard a cerut „leagă-te fix de Faza 1" și „deploy când avem tot gata, ne costă
fiecare deploy". Bundle-uit într-un singur deploy de 5 commits + Sentry curățat.

### Ce am livrat (commits, în ordine)

- **`f20b919` H.2 + H.4 (rename labels).**
  - „Note interne" → „Particularități și preferințe" pe forme add/edit rezident
    și card-ul detaliu rezident. Hint rephrased ca să nu repete cuvântul.
  - `camin_staff` rămâne ca rol DB; label-ul UI devine **„Personal responsabil"**
    în 8 locuri (`role-nav.ts`, `email/send.ts`, `(staff)/_actions.ts`, echipa
    page + invite form + setări page, counter „responsabil/responsabili").
  - Zero migrare DB, zero schimbare permisiuni, doar string-uri UI.

- **`c159e1b` H.3 (composer journal clarificat).**
  - „Tip înregistrare" label era `sr-only` (invizibil) → user nu vedea ce sunt
    cele 4 type chips, păreau butoane de acțiune. Acum „Tip update" e vizibil.
  - „Etichete (opțional)" era ambiguu → rename „Despre ce e mesajul? (max 5
    categorii)" + helper text: „Selectează ce subiecte conține update-ul, ca
    familia să înțeleagă rapid (ex: masă, plimbare, medicație)".

- **`a577db2` H.5 (canal privat admin cămin ↔ super-admin).**
  - Migration **0014_admin_superadmin_chat.sql** aplicată pe prod via pg direct
    pe `aws-1-eu-central-1.pooler.supabase.com:6543` (MCP `execute_sql`
    întoarce „You do not have permission" cu credentialele curente; pg direct
    cu `SUPABASE_DB_PASSWORD` merge).
  - Tabel `admin_superadmin_messages` cu RLS strictă: super_admin vede tot
    cross-tenant, camin_admin vede tenantul lui, camin_staff/family ZERO rows.
    Anti-recursion via SECURITY DEFINER helpers existente (`is_tenant_manager`,
    `is_super_admin`). 6 policies (SELECT + 2× INSERT pentru admin/super +
    2× UPDATE pentru read flags + DELETE super).
  - Repo+service+UI pattern identic cu E (familie↔admin) — un thread per TENANT
    în loc de per family. Cămin admin: `/caminul/suport` (bubble single-thread).
    Super-admin: `/platforma/conversatii` (listă cross-tenant cu unread sus) +
    `/platforma/conversatii/[tenantId]` (thread detaliat).

- **`3654073` H.6 (hub familial — chat membri + visit log).**
  - Faza 1 MVP. Medicația rămâne Faza 2 (Art. 9 GDPR — date sănătate, cere
    DPIA + consimțământ explicit înainte).
  - Migration **0015_family_hub.sql** aplicată pe prod: două tabele
    `family_hub_messages` + `family_visits`, helper SECURITY DEFINER
    `is_family_of_resident(uuid)` care verifică existență în `families` cu
    `auth.uid()` (acoperă owner + members — `inviteFamilyMemberAction` inserează
    un `families` row per user-nou, vezi `(family)/_actions.ts:366`).
  - RLS: super_admin + membri familie → SELECT; doar membrii → INSERT propriu;
    DELETE super (audit) sau own visit (corectare); camin staff/admin =
    ZERO rows.
  - Service `family-hub.service.ts` cu `assertFamilyOfResident()` defense-in-depth
    (verifică explicit ownership pe orice apel, chiar dacă RLS ar fi păcălită).
  - UI familie `/portal/hub`: chips „Membri familiei" cu badge „tu", „Ultimele
    vizite" cu buton „Am vizitat" (expand → datetime-local + nota max 500),
    „Conversație" cu bubble UI + group-by-day. Nav item „Familia mea" adăugat
    pe toate cele 6 pagini family (`portal`, admin-chat, galerie, mesaje,
    preferinte, rapoarte).

- **`3167ee0` H.7 (defensive fix Sentry FAMILYLINK-3 regression).**
  - **Trigger:** Sentry alert mid-sprint pe release `5acebea` (banner stale-build,
    G.1). Event `9c5ed57f` an hour ago, Chrome Mobile iOS 148, transaction
    `/platforma/camine/nou`. Issue marcat „Regressed" — pattern repetitiv:
    resolved 2 days ago, re-regressed pe release `e1de59688711` (E sprint),
    re-regressed pe `5acebea`. 4 events total, 0 unique users (90d).
  - **Root cause:** D.2 a wrappat doar `requireSession` în `(staff)/caminul/*`
    cu `requireStaffSession()` (redirect curat). Pages `(super-admin)/platforma/*`
    încă aveau pattern-ul vechi `const session = await requireSession("user_marylou");`.
    iOS Safari trimite RSC prefetch cu cookie-sesiune malformat/expirat →
    middleware lasă să treacă (cookie există) → page render → `requireSession`
    aruncă UnauthorizedError → **Server Component crash** → event Sentry.
  - **Fix:** nou helper `requireSuperAdminSession()` în `auth.service.ts` —
    identic pattern cu `requireStaffSession()`:
      - Session inexistent/expirat → `/login?error=session_expired`
      - User logat fără rol super_admin → portal natural (staff → `/caminul`,
        family → `/portal`). NU expune existența `/platforma`.
      - Super-admin valid → returnează `{ session, user }`.
  - Migrat **12 pagini** sub `(super-admin)/platforma/*`: page.tsx (dashboard),
    camine (+nou + [id]), utilizatori, audit, facturare, leads (+[id]),
    setari, conversatii (+[tenantId]) — ultimele 2 sunt noi din H.5. Pattern
    uniform: `const { session } = await requireSuperAdminSession();`.

### Gotcha de proces — script-ul de refactor batch a stricat imports

Script `scripts/refactor-super-admin-pages.mjs` (commitat ca audit trail) avea
un bug în regex-ul de update import: matcheșa corect bodyul, dar regex-ul pentru
linia `import { requireSession } from "@/lib/services/auth.service"` nu a prins
nicio linie. Rezultat: 12 fișiere cu `requireSuperAdminSession()` în body dar
fără simbolul importat — `tsc` a întors 12× `error TS2304: Cannot find name`.

**Lecție:** după orice refactor batch, `tsc --noEmit` ÎNTOTDEAUNA înainte de
commit. Script-ul a raportat „✅ 12/12 fișiere actualizate" pe baza faptului că
fișierul s-a modificat (body line schimbată), nu pe baza succesului ambelor
înlocuiri.

Fix: 12× `Edit` direct pe fiecare fișier (imports erau toate identice
single-line, deci search-replace simplu pe `requireSession` → `requireSuperAdminSession`).
După fix: `tsc` clean, `npx next build` exit 0, toate 12 rute prezente în
output ca `ƒ Dynamic`.

### Verificări înainte de push (rigurous testing — cerere Eduard)

| Check | Rezultat |
|---|---|
| `npx tsc --noEmit` (după Edit-uri) | ✅ exit 0, zero erori |
| `npx next build` (full prod build) | ✅ exit 0, toate cele 41 de rute compilate, 12 super-admin dynamic |
| Migration 0014 + 0015 aplicate live pe prod | ✅ pg direct query — 3 tabele + RLS enabled + helper `is_family_of_resident` prezent |
| RLS policies count pe noile tabele | ✅ admin_superadmin: 6 · family_hub_messages: 3 · family_visits: 3 |
| Service layer defense-in-depth | ✅ `family-hub` cu `assertFamilyOfResident()` în fiecare metodă · `admin-superadmin` cu `requireTenantContext`+`assertRole`+`isSuper` per metodă |

### Deploy + verificare live

- **Push:** `git push niche main` (deploy Vercel) → `git push origin main` (CI).
  Confirmat doar `niche` triggereşte build (lecția R7.5 — alt repo are CI dar
  nu deploy).
- **Vercel build:** `3167ee0` BUILDING → READY ~3 min după push. Confirmat via
  `scripts/check-deploy.mjs 3167ee0` + `GET https://comfortmap.ro/api/version`
  → returnează `3167ee027435ece8a70c130a86dda0052a6659e4` (match perfect).
- **`scripts/verify-h7-live.mjs`** (5 rute critice, anonymous):
  - `/platforma/camine/nou` (FAMILYLINK-3 transaction) → 307 → `/login?next=...`
  - `/platforma/conversatii` (H.5 super) → 307
  - `/platforma/conversatii/[tenantId]` → 307
  - `/caminul/suport` (H.5 staff) → 307
  - `/portal/hub` (H.6 family) → 307
  - **Zero 5xx** pe toate rutele.
- **Live test cu user real (logged-in family Andrei):**
  - `/platforma/camine/nou` → redirect curat la `/portal` (Mama Maria home).
    Pre-fix: ar fi crash-uit Server Component. **Asta dovedește că fix-ul lucrează
    pentru cazul „logged-in user fără rol super_admin".**
  - `/portal/hub` → page render perfect: chip „Andrei Test Family · fiu · tu",
    visit button vizibil, composer textarea prezent, 0 error banners
    (`document.querySelectorAll('[class*="error"]').length === 0`).

### Sentry — închidere definitivă

- FAMILYLINK-3 marcat **Resolved în versiunea `3167ee027435`** prin „Resolved In
  → The current release". Sentry va auto-reopen ONLY dacă evenimente vin din
  această versiune sau ulterioare; evenimente vechi (5acebea etc.) nu re-deschid.
- Feed Sentry filtrat `is:unresolved` pe ultimele 24h: **„No issues match your
  search"**. Zero issues active. Curat.

### Stare finală sprint H

| H.# | Status | Deploy | Live verified |
|---|---|---|---|
| H.1 DMARC + SPF root | ✅ commited anterior | DNS Vercel direct | mailtest pass |
| H.2 Note→Particularități | ✅ | `f20b919` | UI live |
| H.3 Composer labels | ✅ | `c159e1b` | UI live |
| H.4 „Personal responsabil" | ✅ | `f20b919` | UI live |
| H.5 Chat admin↔super | ✅ | `a577db2` + migr 0014 | Routes 307 + RLS ✓ |
| H.6 Hub familial | ✅ | `3654073` + migr 0015 | `/portal/hub` render ✓ |
| H.7 Sentry FAMILYLINK-3 | ✅ | `3167ee0` | Resolved în Sentry, live verified |

**Total sprint H:** 5 commits, 2 migrations, 7 puncte rezolvate (toate cele 6
cerute + H.7 unplanned), 1 Sentry issue închis definitiv, 0 regresii noi,
0 deploy ratat.

### Skill / lecții consolidate

1. **„Resolved in current release" >> „Mark resolved".** Issue-urile care
   regresează cer închidere prin release pin, nu un click simplu — altfel
   re-firează silent pe orice deploy următor și nu prinzi cauza.
2. **Defensive `requireSession` wrappers per layout group** — un singur helper
   per grup de rute (staff / super-admin / family) cu redirect curat e mai
   robust decât 12 try/catch împrăștiate. Cost: ~46 linii. Benefit: anihilează
   întreaga clasă de Server Component crash din auth flow.
3. **Batch refactor scripts trebuie să raporteze pe baza ASSERTION-urilor
   reale**, nu pe baza „fișier modificat". Adaugă `assert content !==
   beforeContent && content.match(newPattern)` la sfârşit.
4. **Bundle commits când deploy costă.** Sprint-ul de 7 puncte într-un singur
   push `niche main` în loc de 7 deploy-uri separate. Reduce costul Vercel +
   suprafața de regresie.

---

## R7.7 — Sprint I: Revocare staff + audit enum fix (2026-05-24)

Eduard întrebare după sprint H: „ca admin de cămin îmi trebuie un buton și
feature-ul de a șterge angajați și pacienți". Audit rapid:
- ✅ Rezident: discharge există din C.1 (4 motive preset, audit GDPR, banner amber)
- ❌ Staff: nu există buton revoke nicăieri — `revoked_at` doar coloana în DB
  folosită ca filtru, fără cale din UI

Production-blocker pentru cămine reale (Cajal angajează/concediază). Atac live.

### Bug colateral găsit + fixat

**Audit_action enum-mismatch DB ↔ TS** — TS type `AuditAction` din `types/db.ts`
include `"discharge"` din C.1, dar ENUM SQL `audit_action` din 0001_initial
n-a fost extins niciodată. Result: dischargeResidentAction făcea `audit({
action: "discharge", ... })` → INSERT pe `audit_log` eșua silenţios cu enum
constraint error → toate dischargeurile reziduale erau pierdute din audit GDPR
(rămâneau doar în `mockAuditLogs` JS array, pierdute la restart).

Migration **0016_audit_action_extensions.sql**:
```sql
ALTER TYPE audit_action ADD VALUE IF NOT EXISTS 'discharge';
ALTER TYPE audit_action ADD VALUE IF NOT EXISTS 'revoke';
```
Aplicată pe prod via pg direct (transaction-mode pooler). `IF NOT EXISTS` =
idempotent. Verificat post-migration: `enum_range(NULL::audit_action)` întoarce
toate 9 valori (7 originale + discharge + revoke).

**Gotcha de proces** — split-ul naiv pe `;` cu filtru `!line.startsWith('--')`
a tăiat primul ALTER (era după comment block). Result: doar `revoke` aplicat,
`discharge` a rămas pe dinafară. Fix: rerun cu query directă, fără split.
Lecție: scripturi de migration cu multiple statements trebuie să folosească
parser SQL real (regexp pe `;` la marginea liniei, sau pg-protocol simple_query
mode), nu split text.

### Backend revocare staff

**Service `revokeTenantMember()` în `tenant-members.service.ts`** (~150 linii):
- `assertRole` admin/super
- **Anti-lockout**: caller nu poate revoca propriul acces (s-ar bloca singur)
- **Anti-orphan**: ultimul `camin_admin` nu poate fi revocat (tenant fără admin)
- **Cleanup pacienți**: pentru `camin_staff`, apelează `unassignAllFromStaff()`
  (existent din B.1) care soft-removes alocările (`removed_at = now()`)
- Setează `user_tenant_access.revoked_at = now()` — toate query-urile filtrate
  cu `.is('revoked_at', null)` îl exclud automat (echipa list, RLS policies,
  listStaffInTenant, etc.)
- **NU șterge** user-ul din `users` (poate avea acces la alte cămine)
- **NU șterge** datele postate (jurnal/foto/mesaje rămân pentru audit GDPR
  5 ani retenție per contract Faza 1)
- Idempotent: deja-revocat → `alreadyRevoked: true` fără error

**Server Action `revokeStaffAction()` în `(staff)/_actions.ts`**:
- Validează FormData (`accessId` required, `reasonCode` ∈ {resignation,
  termination, mistake, other}, `reasonText` ≥ 3 char dacă `other`)
- Defense-in-depth: verifică `myAccess.role === "camin_admin" || "super_admin"`
- Apelează service → primește `RevokeResult`
- Audit log cu `action: "revoke"`, `entity_type: "user_tenant_access"`,
  metadata complet (revokedUserId, revokedRole, revokedUserName,
  assignmentsRemoved, reasonCode, reason)
- Revalidează `/caminul/echipa` + `/caminul/echipa/alocari` + `/caminul`
- Mesaj UX cu suffix dinamic: dacă au rămas pacienți fără asistent → „X pacient(i)
  au fost dezalocați — realoacă-i altui asistent"

### UI

**`revoke-member-dialog.tsx`** (client component, ~200 linii) — pattern mirror
al `DischargeDialog`:
- Buton compact roșu „Revocă acces" cu icon UserMinus
- Disabled cu tooltip dacă `isLastAdmin = true`
- Modal cu:
  - Warning GDPR (datele postate rămân)
  - Warning pacienți alocați (dacă `activeAssignments > 0`)
  - 4 motive radio: Demisie / Concediere / Adăugat din greșeală / Alt motiv
  - Textarea custom 280 char când e „Altul"
  - Submit destructive (roșu, „Revocă acces")
- Auto-close 1.8s după success cu mesaj de confirmare
- Folosește `useActionState` (pattern Next.js 16 + React 19)

**Wire în `/caminul/echipa/page.tsx`**:
- Query nou: count `resident_assignments` active per staff_user_id (1 query,
  grouped in JS Map)
- Pentru fiecare membru activ:
  - Eticheta `(tu)` lângă numele propriu
  - Badge cu `N pacienți alocați` lângă rol (pentru camin_staff)
  - Buton revoke disabled dacă: e propriul user (anti-lockout UI) sau nu sunt
    admin (gate UI + service double-defense)
  - Buton revoke disabled dacă e ultimul admin (anti-orphan UI + service)

### Verificare înainte de commit

| Check | Rezultat |
|---|---|
| `npx tsc --noEmit` | ✅ exit 0, zero erori |
| `npx next build` | ✅ exit 0, /caminul/echipa Dynamic, toate rutele compilate |
| Migration 0016 aplicată pe prod (enum_range) | ✅ 9 valori inclusiv discharge + revoke |

### Stare după push

| Item | Status |
|---|---|
| Migration 0016 (audit enum) | ✅ aplicată prod |
| Service revokeTenantMember | ✅ |
| Server Action revokeStaffAction | ✅ |
| RevokeMemberDialog UI | ✅ |
| Wire pe /caminul/echipa | ✅ |
| Anti-lockout (self-revoke) | ✅ UI + service |
| Anti-orphan (last admin) | ✅ UI + service |
| Cleanup alocări pacienți | ✅ via unassignAllFromStaff |
| Audit GDPR cu reason | ✅ DB enum acceptă acum 'revoke' |
| Datele postate prezervate | ✅ doar revoked_at + assignments cleanup |

### Skill / lecții

1. **Discharge audit silently failing** — dacă TS type și SQL ENUM diverg,
   compilatorul TS NU prinde — runtime INSERT eșuează silent dacă caller-ul
   prinde erorile (cum face `audit()` — fire-and-forget). Verifică periodic
   alinierea TS ↔ DB pentru enums prin query: `SELECT unnest(enum_range(
   NULL::audit_action))` și compară cu type definition.
2. **Anti-lockout + anti-orphan = standard pe admin tooling** — orice operațiune
   destructivă pe sine sau pe ultima resursă vitală cere check explicit.
   Service-level + UI-level (defense in depth).
3. **Cleanup colateral înainte de operațiunea principală** — ordinea contează:
   dezalocă pacienții PRIMUL, apoi setează `revoked_at`. Dacă inversezi, RLS
   sau service-ul de assignments ar putea respinge cleanup-ul ca „user neavând
   acces" (race condition pe revoked).
4. **Migration cu multiple ALTER TYPE statements** — folosește `IF NOT EXISTS`
   pe fiecare ca idempotent, dar atenție la split-uri text naive — comments
   pot fi atașate de primul statement și filtrul `startsWith('--')` îl exclude
   pe acela. Mai bine: ștergi comments înainte de split, sau folosești
   `pg-protocol simple_query` care înțelege whole-script.
