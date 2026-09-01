---
tags: [knowledge, familylink, architecture, scaling, gamification, gdpr, deferred]
project: "[[FamilyLink Platform]]"
created: 2026-05-07
updated: 2026-05-07
status: backlog
---

# FamilyLink Caregiver Assignment Strategy

> Strategie 2-fazată pentru splitarea rolurilor admin/staff în cămin, cu UX gamificat pentru linking caregiver ↔ senior. **Backlog deferred** — activăm la primul T2+ client sau la cerere explicită.

## Decizia user-ului (Eduard, 2026-05-07)

Modelul curent are admin (Mariana) + staff (Ionela, Radu) cu acces identic la TOȚI rezidenții. Asta funcționează la T1 (cămin mic) dar nu la T2+ unde organigrama e mai mare.

**Modelul țintă:**

- **Super-admin** (Mary-Lou / Realitatea Sociala) creează contul **admin cămin** la onboarding tenant
- **Admin cămin** vede în dashboard: TOȚI rezidenții + TOT staff-ul + organigrama. Poate invita/șterge staff, asigna caregiver↔senior, edita setări, vede facturare read-only
- **Staff (caregiver)** vede în dashboard: DOAR rezidenții asignați de admin. Nu vede ceilalți. Postează update doar pentru ei

## De ce splităm

- **Real world fit** T2+: cămine cu 60-300 rezidenți au director separat de caregivers. Director nu pune mâna pe rezidenți — el conduce.
- **GDPR compliance**: caregiver vede doar datele PII ale rezidenților din grija lui (least privilege per Anexa 1 §F audit).
- **Familia primește primary caregiver vizibil**: relația umană puternică ("Ionela are grijă de mama de 6 luni"). Diferențiator brand vs Excel/WhatsApp.

## Phase 1 — invite staff via magic link

Foundation pentru Phase 2. ~3-4h dev. Toți userii (admin + staff) văd toți rezidenții (compatibil T1). Permisiuni light:

- `camin_admin`: invită/șterge staff, setări, facturare read-only
- `camin_staff`: NU invită staff, NU schimbă setări, NU vede facturare

UI: pagina `/caminul/echipa` cu listă useri + buton "Invită staff" (pattern identic cu [[FamilyLink Magic Link Flow]] dar copy instituțional).

## Phase 2 — caregiver-to-resident assignment (gamificat)

Activat **doar** la primul T2+ client real care cere. ~6-8h dev + 2-3h UX design dedicat.

### Schema nouă

`caregiver_assignments(id, tenant_id, staff_user_id, resident_id, role primary|backup|shift, started_at, ended_at, assigned_by, notes)` — istoricul păstrat (legal + GDPR audit "cine a îngrijit pe Tanti Lenuța în mai 2026").

### RLS update

`residents` policy modificată:
- super_admin: tot
- camin_admin: toți rezidenții din tenant-ul lui
- camin_staff: doar rezidenții cu rând activ în `caregiver_assignments`
- familie: rezidentul lor

Similar pe `journal_entries`, `messages`, `weekly_reports`.

### UX gamificat — pattern de design

**Inspirație**: Figma node connections + Notion database relations + Apple Memoji linking.

Pe pagina `/caminul/echipa/[staffId]`:

- **Stânga**: card caregiver (avatar gradient, nume, rol, count, last activity)
- **Dreapta**: 2 grid-uri
  - "Rezidenții lui Ionela" (asignați activ) — hover pulsează cu glow brand, click "✕ Dezasignează" → animație: linia se rupe + card "fade out"
  - "Ceilalți rezidenți" (disponibili) — hover dotted preview line, click "+ Asignează" → animație: linia draw cu CSS @keyframes draw-link, card migrează spre stânga

**Vizual cheie**: SVG path între avatar staff și avatar rezident, animat cu Framer Motion sau CSS `stroke-dashoffset`. Sound subtle de succes (clopoțel la link, swoosh la unlink).

### Bonus engagement

- Counter "Ionela are grijă de **7 vârstnici**" cu badge gradient (5+ = "veteran")
- Streak badges: "30 zile cu update zilnic pentru toți rezidenții asignați" 🌟
- "Săptămâna ta" widget per caregiver: update count + mood pattern din journal tags
- Visual map opțional: org chart Sankey-light pe `/caminul/echipa`

**Important**: animații elegant-soft (nu strident-bouncy), copy serios instituțional. Healthcare context — gamification subtil.

## Cost & scale

- Dev Phase 1: ~3-4h. Phase 2: ~6-8h + UX 2-3h
- Runtime: $0 extra ambele faze
- DB rows: N caregivers × M rezidenți / cămin (negligible)
- Useri max per tenant T4: ~1500 (sub Supabase Pro 100K limit)

## Pricing implication

- T1 (Casa Ana etc.): feature ascuns / disabled. Mariana face tot, nu vrea complexitate.
- T2+: feature activ ca diferențiator. Justifică +100€/lună diferență tier.
- T3-T4 eventual add-on: shift management (caregiver zi vs caregiver noapte).

## Migration la activare

Cămine existente cu pattern "toți văd toți" → la activare toggle, default = toți caregiver-ii primesc TOATE rezidenții ca `primary` (no-op). Apoi admin re-asignează granular cu UX gamificat.

## Pattern din alte produse (research inspiration)

- **Figma**: connection lines între nodes cu animație fluid
- **Linear**: assignee swap cu instant feedback
- **Notion**: relation property între tabele
- **Apple Memoji**: link contact ↔ avatar visual
- **Tinder**: swipe-to-link animation
- **Zapier**: zap connection visual editor

## Decizii arhitecturale

- **Admin separat de staff** (nu role hibrid). La T1 ascundem feature prin role check (admin vede UI staff + extra).
- **Assignment cu `started_at` + `ended_at`** (nu bool active) — istoric pentru audit + legal.
- **Role în assignment** (`primary` / `backup` / `shift`) — pregătit pentru Phase 3 shift management fără rework.
- **Per-tenant toggle** "Activează asignări individuale" — control admin pe activare.

## Related

- [[FamilyLink Platform]] — proiect master
- [[FamilyLink Architecture Decisions]] §3 + §5
- [[FamilyLink Magic Link Flow]] — invite staff folosește același pattern ca invite familie
- [[FamilyLink GDPR Approach]] — least privilege principle
- [[FamilyLink Pricing T1-T4]] — Phase 2 ca diferențiator T2+
- Task tracker în vault dedicat: `FamilyLink Vault/_Agent Team/tasks/active/TASK-0005 - Phase 2 Caregiver Assignment Gamified.md`
