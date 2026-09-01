# Proiecte FamilyLink — Index

> **Last updated:** 2026-05-13

## 📋 Index docs critice

- [[Faza 1 — Lean MVP]] — contract semnat, livrat live pe https://familylink.ro
- [[Faza 2 — Platform Completă]] — **DRAFT scope + pricing** (€14k cash + 10% equity / 8 săpt) — to revisit
- [[Cost Projections & Scale]] — costuri infra + DPO + maintenance la 1/4/20/100 cămine
- [[Negotiation Notes 2026-04-30]] — note negociere contract inițial
- [[Pricing & Business Model]] — pricing per cămin (T1-T4)
- [[Architecture Decisions]] — decizii tehnice care influențează scope
- [[GDPR & Supabase Access]] — context legal
- [[Subprocessors GDPR Audit]] — listă subprocessori

---

## 1. Website Public · `familylink-website/`

**Status:** v1 complet · 9 pagini funcționale local · în așteptare feedback final
**Locație cod:** `C:\Users\adumi\OneDrive\Desktop\claude\familylink-website\`
**Preview server:** `http://localhost:5180`
**Tip:** HTML static + Tailwind CDN + JS vanilla
**Stack:** HTML/CSS/JS pur (no framework) — pentru viteză prototype, va fi migrat la Next.js când lansăm

### Ce conține

- 9 pagini complete: `/`, `/pentru-camine`, `/pentru-familii`, `/cum-functioneaza`, `/pricing`, `/blog`, `/intrebari-frecvente`, `/despre`, `/contact`
- Hero video Pexels (5 video-uri locale, mobile-optimised SD)
- 3 mockup-uri AI-generate ale aplicației (`assets/mockups/`)
- Logo-uri reale EAN + Asociația Cajal (`assets/logos/`)
- Foto reale Cerasela (cropped din Ultima Oră) + Mary-Lou (`assets/team/`)
- Toate trust signals integrate
- Mobile-responsive cu accordion FAQ + tabs interactive

### TODO Fază 2 (după Faza 1 platformă)

- [ ] Migrare la Next.js 15 cu RSC + ISR
- [ ] llms.txt + llms-full.txt pentru AI search optimization
- [ ] Schema markup JSON-LD (Organization, FAQPage, Article)
- [ ] sitemap.xml + robots.txt automate
- [ ] Cookie banner GDPR
- [ ] Form submissions reale (la inquiry familii, contact, demo cămin)
- [ ] Newsletter signup integrat (Resend)
- [ ] Press kit pagină dedicată cu downloads

---

## 2. Platformă SaaS · `familylink-app/`

**Status:** Foundation locală scrisă (2026-05-04) · Faza 1 — Lean MVP · așteaptă conturi externe
**Locație cod:** `C:\Users\adumi\OneDrive\Desktop\claude\familylink-app\`
**Preview:** `http://localhost:3000` (Next.js dev)
**Tip:** Aplicație web SaaS multi-tenant
**Stack:** Next.js 16 + TypeScript + Tailwind 4 + Supabase + Vercel + Resend + Sentry

### Ce conține

- Aplicația cămin (interfață staff): jurnal zilnic, mesagerie, gestionare rezidenți
- Portal familie: timeline update-uri, galerie foto, mesagerie
- Super-admin (Realitatea Sociala): onboarding cămine, dashboard, audit
- API REST minimal documentat OpenAPI
- GDPR de bază: export, ștergere cu cascade, audit log
- Multi-tenant cu Row-Level Security
- Rapoarte săptămânale automate (cron)

### Arhitectura

Conform [Architecture Decisions v1](../Knowledge/Brand/Design-System/Design System v1.md) + [Architecture Decisions](../Knowledge/Architecture Decisions.md):
- Service-layer separation strict (`lib/services/` = single source of truth)
- Schema multi-product (users + products + tenants + user_tenant_access)
- Stub `app/(public)/comfortmap/[slug]` ready pentru Faza 2 directory
- ISR + Server Actions + Route Handlers — toate via service layer

### TODO Faza 1 (3 săptămâni)

- [x] Init Next.js 16 + TypeScript + Tailwind 4
- [x] Install core deps (zod, zustand, react-hook-form, lucide, sonner, etc.)
- [x] Folder structure complet (`lib/services`, `lib/repositories`, `lib/db`, `lib/auth`, `lib/email`, `lib/storage`, `lib/validation`, `lib/utils`, `components/ui`, `components/layout`, `types`, `mocks`, `app/(staff)/caminul`, `app/(family)/portal`, `app/(super-admin)/platforma`, `app/api/v1`, `scripts/cron`)
- [x] Tailwind 4 `@theme` cu design tokens v1 (blue/green/navy/cream + semantic + fonts + shadows + gradient brand) în `src/app/globals.css`
- [x] TypeScript types pentru toate entitățile (`src/types/db.ts` — User, Product, Tenant, UserTenantAccess, Resident, Family, JournalEntry, Message, WeeklyReport, AuditLog, ConsentRecord)
- [x] Mock data layer in-memory (`src/mocks/data.ts` — Casa Ana T2 + Mariana admin + Ionela staff + Andrei familie + tanti Lenuța rezidentă)
- [x] Repository skeletons cu mock impl (`src/lib/repositories/*.repo.ts` — users, tenants, residents, journal, messages, access)
- [x] Service layer skeletons cu RBAC + tenant context (`src/lib/services/*.service.ts` — auth, tenant, resident, journal, messaging)
- [x] Typed errors (`src/lib/errors.ts` — AppError + ValidationError/Forbidden/Unauthorized/NotFound/Conflict/RateLimit/Internal)
- [x] `cn()` utility (`src/lib/utils/cn.ts` — clsx + tailwind-merge)
- [x] Root layout cu Plus Jakarta Sans + JetBrains Mono via `next/font/google`, lang="ro", metadata FamilyLink
- [x] Landing placeholder cu 3 portal cards (`/caminul`, `/portal`, `/platforma`) brandat blue→green gradient
- [x] `next.config.ts` cu `turbopack.root` pinned (există package-lock.json străine în `../OneDrive/Desktop/claude/`)
- [x] UI primitives shadcn-style scrise manual (`Button` cu cva variants primary/secondary/ghost/destructive/success + 4 size, `Card` cu Header/Title/Description/Content/Footer, `Input` + `Textarea` + `Label`, `Badge` cu 7 tone-uri, `Avatar` cu fallback) — fără shadcn CLI ca să evit conflicte Tailwind 4 / Next 16
- [x] `AppShell` layout shared cu BrandMark + nav contextual + footer EAN
- [x] `/caminul` staff dashboard (3 stats cards + activity feed + quick actions, foloseste `requireSession` + `getCurrentTenant` + `listResidents` + `listJournalForResident` + `getUnreadCount`)
- [x] `/portal` family timeline (resident profile + journal cronologic + următor raport)
- [x] `/platforma` super-admin overview (4 stats incl. MRR estimat + tabel cămine cu tier/status/locație/utilizatori)
- [x] Smoke-test 4 rute: toate HTTP 200, sub 200ms după prima compilare; 0 erori în log
- [ ] shadcn/ui CLI setup (când avem nevoie de Dialog/Dropdown/Select/Calendar — primitive complexe)
- [ ] Setup conturi externe (Supabase + Vercel + Resend + Sentry)
- [ ] Schema DB + migrations
- [ ] Auth flows (staff parolă + familii magic link)
- [ ] CRUD complet
- [ ] Image upload pipeline
- [ ] Email templates Resend
- [ ] Cron rapoarte săptămânale
- [ ] Production deploy + acceptance testing

---

## Repo-uri GitHub

- **Website**: TBD (sau pe `Eduard22222222/familylink-website` privat)
- **Platformă**: `Eduard22222222/familylink-app` privat (în lucru acum)

## Conturi externe (Faza 1)

Statut: Realitatea Sociala creează conturile pe email-urile lor → vor fi transferate / partajate cu Conta 4U.

| Service | Status | Note |
|---|---|---|
| GitHub | ✅ pe Eduard22222222 | repo privat momentan |
| Supabase | ⏳ aștept email Realitatea Sociala | regiune Frankfurt obligatorie |
| Vercel | ⏳ aștept email Realitatea Sociala | deploy region `fra1` |
| Resend | ⏳ aștept email Realitatea Sociala | EU + DPF |
| Sentry | ⏳ aștept email Realitatea Sociala | **MUST** crea pe `de.sentry.io` (irevocabil) |
| GitLab.com | ⏳ Beneficiar la cunoștință despre US hosting | doar cod, no PII |

Vezi [Subprocessors GDPR Audit](../Knowledge/Subprocessors GDPR Audit.md) pentru detalii.

---

## Cum lucrăm pe ambele

- **Website** — preview local pe `5180`, modificări CSS/HTML directe, redeploy local
- **Platformă** — preview local pe `3000`, Next.js dev mode, hot reload
- Ambele tracked în git separate, cu commit-uri separate
- Vault păstrează istoric decizii pentru ambele

## Note operaționale (2026-05-04)

- Cold-start dev server compilă curat (`✓ Finished writing to filesystem cache in 16.1s`).
- Pe sesiuni lungi cu Turbopack workers, laptopul a depășit paging file-ul → OOM repetat (Zone Allocation failed, MarkCompactCollector: young object promotion failed). Nu e bug în cod, e presiune RAM Windows.
- **Mitigations recomandate la următoarea sesiune:**
  - Crește paging file Windows: System → Advanced → Performance → Virtual Memory → Custom size, min 16 GB pe SSD
  - Sau setează `NODE_OPTIONS=--max-old-space-size=4096` înainte de `npm run dev`
  - Sau folosește `next dev --turbo=false` (Webpack — mai economic la RAM, dar mai încet)
  - Închide tab-uri Chrome/Edge, alte instanțe Node, OneDrive sync intensiv înainte de dev
- Verificare end-to-end (`curl localhost:3000/`) deferită până când avem mediu stabil.
