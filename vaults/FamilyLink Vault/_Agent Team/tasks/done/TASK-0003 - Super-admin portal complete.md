---
id: TASK-0003
title: Super-admin portal complete (/platforma sub-pages)
owner: codex
status: done
priority: 1
area: platform
created: 2026-05-04
updated: 2026-05-04
related_task: TASK-0002
files:
  - familylink-app/src/app/(super-admin)/**
  - familylink-app/src/app/(super-admin)/_actions.ts (creeazÄƒ)
---

# TASK-0003 â€” Super-admin portal complete

Codex, te rog construieÈ™ti tot setul de sub-pagini pentru `/platforma` (super-admin) Ã®n paralel cu munca lui Claude pe staff/family/backend. Lock-ul lui Claude (`claude-task-0002.md`) elibereazÄƒ explicit `app/(super-admin)/**` pentru tine.

## Pagini de construit

1. **`/platforma/camine`** â€” listÄƒ cÄƒmine cu:
   - Filtru status (active / trial / suspended / archived)
   - Search by displayName / cui / addressCity
   - Card per cÄƒmin (gradient tier badge T1-T4 + status + count rezidenÈ›i/utilizatori)
   - Buton "OnboardeazÄƒ cÄƒmin"

2. **`/platforma/camine/nou`** â€” formular onboarding:
   - CÃ¢mpuri: legalName, displayName, slug, cui, contactEmail, contactPhoneE164, addressLine1/City/County/PostalCode, pricingTier (T1-T4)
   - Server Action `createTenantAction` Ã®n `app/(super-admin)/_actions.ts` care:
     - Validare Zod (creeazÄƒ schema Ã®n `lib/validation/schemas.ts` ca `createTenantSchema`)
     - ApeleazÄƒ un service nou `lib/services/tenant.service.ts createTenant(input)` (creeazÄƒ metoda)
     - Repo nou: adaugÄƒ `tenants.repo.ts createTenant(input)` care push Ã®n mockTenants
     - Audit log entry: `action: "create"`, `entityType: "tenant"`
     - Redirect `/platforma/camine/{newId}`

3. **`/platforma/camine/[id]`** â€” detaliu cÄƒmin:
   - Hero cu gradient tier + nume + status + adresÄƒ
   - Stats (rezidenÈ›i, utilizatori, update-uri/7 zile, mesaje)
   - ListÄƒ rezidenÈ›i (compact)
   - ListÄƒ utilizatori cu rol
   - Audit log recent (10 ultimele intrÄƒri)
   - Server Actions: `suspendTenantAction(id)`, `reactivateTenantAction(id)`, `archiveTenantAction(id)` care doar update `tenant.status` + audit

4. **`/platforma/utilizatori`** â€” listÄƒ globalÄƒ users:
   - Filtru rol (super_admin / camin_admin / camin_staff / family_owner / family_member)
   - Filtru tenant
   - Card per user cu access matrix (la ce tenant-uri are rol)
   - Last login + email verified badge

5. **`/platforma/audit`** â€” audit log viewer:
   - Filtru tenant + actor + action
   - Tabel cu: timestamp, actor, action, entityType, entityId, IP
   - FoloseÈ™te `describeAuditEntry()` din `lib/audit/log.ts`
   - Sortare desc by createdAt

6. **`/platforma/facturare`** â€” MRR breakdown:
   - Total MRR estimat (sum cÄƒmine active Ã— tier price)
   - Breakdown per tenant (tier, price, status)
   - Tier prices: T1 150â‚¬, T2 250â‚¬, T3 350â‚¬, T4 450â‚¬

## Conventii (foarte important)

- **UI primitives**: `@/components/ui/{button,card,input,badge,avatar,icon-tile,resident-tile}`
- **Layout**: `@/components/layout/AppShell` cu `variant="super-admin"` È™i nav items:
  ```
  [{ href: "/platforma", label: "AcasÄƒ" },
   { href: "/platforma/camine", label: "CÄƒmine" },
   { href: "/platforma/utilizatori", label: "Utilizatori" },
   { href: "/platforma/audit", label: "Audit" },
   { href: "/platforma/facturare", label: "Facturare" }]
  ```
- **Auth mock**: la START de paginÄƒ, `const user = await findUserById("user_marylou");` â€” Mary-Lou e super-admin. NU apela `requireSession()` (returneazÄƒ Mariana, e pentru staff).
- **Mock data import**: `mockTenants`, `mockUsers`, `mockUserTenantAccess`, `mockAuditLogs`, `mockMessages`, `mockJournalEntries` din `@/mocks/data`
- **Gradient tile pattern** (consistent cu rest):
  - T1: `linear-gradient(135deg, #B4E5F0 0%, #4FB8D9 100%)`
  - T2: `linear-gradient(135deg, #4FB8D9 0%, #1F88AE 100%)`
  - T3: `linear-gradient(135deg, #7CC576 0%, #479143 100%)`
  - T4: `linear-gradient(135deg, #1E3A5F 0%, #0F3849 100%)`
- **Tailwind dynamic classes**: NU folosi template-literal class strings (ex: `` className={`bg-gradient-to-r ${tone}`}``). Tailwind 4 cu Turbopack nu le scaneazÄƒ. FoloseÈ™te `style={{ backgroundImage: ... }}` sau mapping cu clase literale.
- **Server Actions**: pune-le Ã®n `app/(super-admin)/_actions.ts` cu `"use server";` la top. Pattern existent: vezi `app/(staff)/_actions.ts`. FoloseÈ™te `useActionState` pe client pentru feedback.
- **Audit log writes**: dupÄƒ orice mutaÈ›ie, apeleazÄƒ `await audit({ tenantId, actorUserId, action, entityType, entityId, metadata })` din `@/lib/audit/log`.
- **Romanian copy**: foloseÈ™te terminologie din [[FamilyLink UX Copy v1]]. Cuvinte permise: vÃ¢rstnici, seniori, rezidenÈ›i, cÄƒmin. INTERZISE: bÄƒtrÃ¢ni, azil, pacienÈ›i.

## Files NU atinge (lock Claude)

- `app/(staff)/**` (Ã®n lucru de mine)
- `app/(family)/**` (urmeazÄƒ dupÄƒ staff)
- `app/api/**` (cron + GDPR + REST Ã®n backend phase)
- `lib/**` Ã®n EXCEPÈšIA: `lib/services/tenant.service.ts` È™i `lib/repositories/tenants.repo.ts` ai voie sÄƒ adaugi metode noi (`createTenant`, `updateTenantStatus`) â€” nu modifica existing exports
- `lib/validation/schemas.ts` ai voie sÄƒ adaugi `createTenantSchema` â€” nu modifica existing schemas

## Acceptance criteria

- [ ] Toate 6 pagini HTTP 200 pe localhost:3000
- [ ] `/platforma/camine/nou` adaugÄƒ tenant nou È™i redirect-eazÄƒ la detaliu
- [ ] Suspend/reactivate/archive funcÈ›ioneazÄƒ (vezi Ã®n `/platforma/audit` dupÄƒ)
- [ ] Filtre + search funcÈ›ioneazÄƒ (URL params, server-side)
- [ ] Audit log primeÈ™te entries la fiecare Server Action mutation

## Deliverable

CÃ¢nd termini:
1. Update task status la `done`
2. MutÄƒ acest fiÈ™ier Ã®n `tasks/done/`
3. Scrie handoff Ã®n `_Agent Team/handoffs/codex-task-0003.md`
4. Mesaj Ã®n `inbox/claude/` cu rezumat (ce ai construit, ce ai schimbat Ã®n lib/, ce ar trebui sÄƒ verific)

MulÈ›umesc!

