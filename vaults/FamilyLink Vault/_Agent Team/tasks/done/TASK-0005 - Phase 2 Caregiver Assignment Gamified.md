---
id: TASK-0005
title: Phase 2 — Caregiver-to-Resident assignment cu UX gamificat
owner: claude
status: done
priority: 3
area: platform
created: 2026-05-07
updated: 2026-05-22
related_task: TASK-0002
deferred_until: "primul T2+ client semnat sau request explicit"
files:
  - familylink-app/src/lib/services/caregiver-assignment.service.ts (new)
  - familylink-app/src/lib/repositories/caregiver-assignments.repo.ts (new)
  - familylink-app/src/app/(staff)/caminul/echipa/** (new)
  - familylink-app/src/app/(staff)/caminul/echipa/[staffId]/asigneaza/** (new)
  - supabase/migrations/0003_caregiver_assignments.sql (new)
---

# TASK-0005 — Phase 2: Caregiver-to-Resident assignment

> **✅ LIVRAT 2026-05-19/20.** Sistemul de assignment a fost construit integral
> în sprintul de polish: tabela `resident_assignments` (migr 0008) cu RLS
> SECURITY-DEFINER, scoping staff (migr 0009), DnD board + list-first scale UI
> (B.1–B.3), bulk ops, „Dezalocă toți" per asistent. UX-ul gamificat cu SVG
> linking-animation din specul de mai jos a fost **înlocuit** cu un DnD board
> (@dnd-kit) + list view cu filtre/bulk — mai pragmatic și scalează la 140×14.
> Detalii → [[ComfortMap Live Audit 2026-05-18]] R5 + R6.
>
> Specul de mai jos rămâne ca referință istorică (modelul de date diferă ușor:
> `resident_assignments` vs `caregiver_assignments` propus aici).

## Context

În căminele de îngrijire reale, organigrama scalează cu mărimea:

| Tier | Rezidenți | Org structure |
|---|---|---|
| **T1** 0-50 | 5-30 | 1 persoană face tot (Mariana = admin + caregiver) |
| **T2** 50-100 | 60-90 | Director + 2-3 ture asistenți. Separație admin ↔ staff |
| **T3** 100-200 | 130-180 | Director + asistentă-șefă + 8-15 caregivers, asignare pe etaj |
| **T4** 200+ | 250+ | Director + departamente + 30-50 staff, primary caregiver per resident |

Modelul "admin + staff toți văd toți rezidenții" funcționează doar la T1. La T2+ devine real-world handicap: caregiver-ul nou nu știe pe cine să întrebe, familia nu știe cu cine vorbește, GDPR audit dilatat (caregiver vede date PII despre rezidenți care nu-i sunt în grijă).

## Decizia user-ului (Eduard)

**Modelul corect, confirmat 2026-05-07:**

- **Super-admin** (Mary-Lou, Realitatea Sociala) creează contul de **admin cămin** la onboarding tenant
- **Admin cămin** (creat de super-admin) — în dashboard-ul lui vede:
  - **TOȚI rezidenții** căminului
  - **TOT staff-ul** căminului (caregivers, asistenți medicali)
  - Drepturi: invită staff, șterge staff, asignează caregiver ↔ rezident, setări cămin, facturare read-only
- **Staff (caregiver)** — în dashboard-ul lui vede:
  - **DOAR rezidenții care i-au fost asignați** de admin
  - Postează update-uri pentru ei
  - Mesajerie cu familiile lor
  - NU vede ceilalți rezidenți (RLS strict)

## Phase 1 — fă acum (când ajungem la asta în iterație)

**Ce câștigi:** organigrama de bază. Admin invită staff via magic link. Toți văd toți rezidenții (compatibil cu T1). Pune fundația pentru Phase 2.

**Estimare:** 3-4 ore.

### Componente

1. **Pagina `/caminul/echipa`** — listă useri activi în cămin + butoane invită/scoate
2. **Form `/caminul/echipa/invita`** — nume + email + rol (`camin_admin` / `camin_staff`)
3. **Server Action `inviteStaffAction`** — pattern identic cu `inviteFamilyAction` (admin.generateLink + email branded)
4. **Email template `staffInviteTemplate`** — copy instituțional (vs cel de familie care e emoțional)
5. **Permisiuni diferențiate light:**
   - `camin_admin`: invită staff, șterge staff, edita setări cămin, vede facturare read-only
   - `camin_staff`: NU poate invita staff, NU schimba setări, NU vede facturare
   - Ambele pot: posta update, mesageria cu familii, edita rezidenți (nu șterge)

## Phase 2 — DEFERAT pentru primul T2+ client

**Ce câștigi:** caregiver-to-resident assignment cu UX gamificat. Caregiver vede doar rezidenții lui. RLS strict GDPR-compliant.

**Estimare:** 6-8 ore + UX design dedicat pentru animația de linking.

### Schema DB nouă

```sql
-- Migration 0003_caregiver_assignments.sql
CREATE TABLE caregiver_assignments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
  staff_user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  resident_id UUID NOT NULL REFERENCES residents(id) ON DELETE CASCADE,
  role TEXT NOT NULL DEFAULT 'primary' CHECK (role IN ('primary', 'backup', 'shift')),
  started_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  ended_at TIMESTAMPTZ,
  assigned_by_user_id UUID NOT NULL REFERENCES users(id),
  notes TEXT,
  UNIQUE(staff_user_id, resident_id, role)
);

CREATE INDEX idx_caregiver_assignments_staff ON caregiver_assignments(staff_user_id) WHERE ended_at IS NULL;
CREATE INDEX idx_caregiver_assignments_resident ON caregiver_assignments(resident_id) WHERE ended_at IS NULL;

ALTER TABLE caregiver_assignments ENABLE ROW LEVEL SECURITY;

-- Policy: admin cămin vede tot, staff vede doar propriile asignări
CREATE POLICY caregiver_assignments_select ON caregiver_assignments FOR SELECT USING (
  is_super_admin()
  OR staff_user_id = auth.uid()
  OR EXISTS (
    SELECT 1 FROM user_tenant_access
    WHERE user_id = auth.uid()
      AND tenant_id = caregiver_assignments.tenant_id
      AND role = 'camin_admin'
      AND revoked_at IS NULL
  )
);

CREATE POLICY caregiver_assignments_admin_write ON caregiver_assignments FOR ALL USING (
  is_super_admin()
  OR EXISTS (
    SELECT 1 FROM user_tenant_access
    WHERE user_id = auth.uid()
      AND tenant_id = caregiver_assignments.tenant_id
      AND role = 'camin_admin'
      AND revoked_at IS NULL
  )
);
```

### RLS update pe `residents` (existing table)

```sql
-- Drop existing residents_tenant_or_family policy
DROP POLICY residents_tenant_or_family ON residents;

-- New policy: caregiver vede doar rezidenții asignați
CREATE POLICY residents_filtered_access ON residents FOR SELECT USING (
  is_super_admin()
  -- Admin cămin vede toți din tenant-ul lui
  OR EXISTS (
    SELECT 1 FROM user_tenant_access
    WHERE user_id = auth.uid()
      AND tenant_id = residents.tenant_id
      AND role = 'camin_admin'
      AND revoked_at IS NULL
  )
  -- Caregiver vede doar rezidenții asignați
  OR EXISTS (
    SELECT 1 FROM caregiver_assignments
    WHERE staff_user_id = auth.uid()
      AND resident_id = residents.id
      AND ended_at IS NULL
  )
  -- Familia vede rezidentul ei
  OR EXISTS (
    SELECT 1 FROM families
    WHERE families.resident_id = residents.id
      AND families.owner_user_id = auth.uid()
  )
);
```

Și update similar pentru `journal_entries`, `messages`, `weekly_reports` — toate să respecte `caregiver_assignments`.

### UX gamificat — pattern de design

#### Pagina `/caminul/echipa/[staffId]` — dashboard caregiver

Două coloane:
- **Stânga**: card-ul caregiver-ului (avatar gradient, nume, rol, count rezidenți asignați, last activity)
- **Dreapta**: 2 secțiuni

**Secțiunea 1 — "Rezidenții lui Ionela"** (assignment activ)
- Grid de cards cu rezidenții asignați
- Hover: pulsează ușor cu glow gradient brand (#4FB8D9 → #7CC576)
- Linie subtilă (CSS gradient stroke 2px) între avatar Ionela și fiecare rezident
- Click "✕ Dezasignează" cu confirm modal: "Sigur vrei să o iei pe Tanti Lenuța din grija Ionelei?" → animație: linia se rupe (split keyframe), card-ul "fade out" spre coloana 2

**Secțiunea 2 — "Ceilalți rezidenți"** (disponibili pentru asignare)
- Grid restul de rezidenți din cămin
- Hover: dotted line apare între Ionela și rezident (preview "what if I link?")
- Click "+ Asignează" → animație: linia solid devine, gradient appears, sound subtle (clopoțel succes), card-ul migrează spre Secțiunea 1

#### Vizual cheie: "linking animation"

Inspirație: Figma node connections, Notion database relations, Apple Memoji linking, Tinder swipe.

```
[avatar Ionela] ━━━━━━━━━━━━━━━━━━ [avatar Tanti Lenuța]
                         ✦
              gradient-stroke 2px
              animată cu CSS @keyframes draw
```

CSS implementation:
```css
@keyframes draw-link {
  from { stroke-dasharray: 200; stroke-dashoffset: 200; }
  to   { stroke-dasharray: 200; stroke-dashoffset: 0; }
}
```

Folosind SVG path între cele 2 elemente (poziții calculate cu `getBoundingClientRect`). Sau Framer Motion `<motion.svg>` pentru smooth.

#### Bonus gamification

- **Counter** pe header staff: "Ionela are grijă de **7 vârstnici**" cu badge gradient (la 5+ asignați devine "veteran")
- **Streak badges** — "30 zile cu update-uri zilnice pentru toți rezidenții asignați" → emoji 🌟
- **"Săptămâna ta" widget** — sumă update-uri postate / săptămână, mood pattern al rezidenților lui (din journal tags)
- **Visual map** opțional — pe `/caminul/echipa` un grid 2D cu staff jos, rezidenți sus, linii care leagă (org chart Sankey-light). Click pe linie = vezi assignment details.

### Server Actions

```ts
// (staff)/_actions.ts (extension)

export async function assignCaregiverAction(
  staffUserId: string,
  residentId: string,
  role: "primary" | "backup" | "shift" = "primary"
): Promise<ActionResult> {
  // require admin role, audit log, insert into caregiver_assignments
}

export async function unassignCaregiverAction(
  assignmentId: string
): Promise<ActionResult> {
  // require admin role, audit log, set ended_at = now()
}
```

### Pe portalul familiei `/portal`

Tab nou **"Echipa"** care arată:
- Caregiver primar al rezidentei: foto + nume + rol + "are grijă de [Tanti Lenuța] din [data start]"
- Buton "Mesaj direct la Ionela" (în loc să trimită la admin general)
- Caregivers backup (când Ionela e off, cine e secund)

Face conexiunea umană mai puternică: familia știe pe nume cine îi îngrijește mama. Asta e **valoare brand** masivă.

### Pe `/caminul/rezidenti/[id]` (resident dashboard pentru staff/admin)

Header sidebar: **"Asignat la"**
- Ionela Stan (primar) — buton swap
- Radu Marin (backup pentru ture noapte)

Doar admin vede butoanele de modificare. Staff vede info read-only.

## Cost & Scale analysis

### Phase 1 (acum sau curând)
- **Dev:** ~3-4h
- **Runtime:** $0 extra
- **Per-tenant cost:** $0 (Supabase auth users free, sub 100K limit)

### Phase 2 (deferat)
- **Dev:** ~6-8h + 2-3h UX design dedicat (mockup în Figma sau direct prototype)
- **Runtime:** $0 extra
- **DB rows extra:** ~ N×M / cămin (N caregivers × M rezidenți, foarte mic)
- **Per-tenant cost:** $0

### Useri totali per cămin (real world)

| Tier | Admin | Caregivers | Familii | Total useri |
|---|---|---|---|---|
| T1 (50 rez) | 1 | 5 | ~250 | ~256 |
| T2 (100 rez) | 1 | 15 | ~500 | ~516 |
| T3 (200 rez) | 1 | 30 | ~1000 | ~1031 |
| T4 (300+ rez) | 1 | 50+ | ~1500+ | ~1551+ |

Toate sub limita Supabase Pro (100K+ auth users/proiect). **NIMIC nu costă mai mult** la scale.

## Pricing implication

Phase 2 e diferențiator clar T2+ vs T1:
- T1: feature ascuns / nedisponibil (Mariana face tot, nu are sens UI complex)
- T2+: caregiver assignments = upsell value
- Eventual la T4: assignment per shift (caregiver de zi, caregiver de noapte) — possibil add-on T4 only

## Acceptance criteria (Phase 2 — la implementare)

- [ ] Admin loghează → `/caminul/echipa` arată toți staff + count rezidenți asignați per fiecare
- [ ] Staff `Ionela` loghează → `/caminul` arată DOAR rezidenții ei (nu toți 50)
- [ ] Admin click "Asignează rezident la Ionela" → animație fluid <500ms + DB updated + audit log
- [ ] Admin click "Dezasignează" → animație split + DB ended_at + audit log
- [ ] Familia vezi `/portal/echipa` → "Tanti Lenuța e în grija Ionelei Stan din 15 mai 2026"
- [ ] RLS verificat: caregiver încearcă API direct la `/api/v1/residents/{not-mine}` → 403
- [ ] GDPR audit: query "cine a citit datele despre Tanti Lenuța în ultima săptămână" → returnează doar Ionela + Mariana (admin) + Andrei (familia)
- [ ] Performance: pagina `/caminul/echipa` cu 50 staff × 200 rezidenți < 500ms warm hit

## Argumente PRO + CONTRA

### PRO
- Real world fit pentru T2+
- GDPR plus (caregiver acces minim necesar)
- UX gamificat = brand engagement (Figma-like animations sunt rare în RO healthcare SaaS)
- Diferențiator pricing T2+ vs T1
- Familia primește "primary caregiver" vizibil — relație umană mai puternică
- Foundation pentru shift management (Phase 3)

### CONTRA / risk
- Complexitate UI pentru cămine mici care nu au nevoie (decizie: pentru T1 ascundem feature-ul, doar setări → "Activează asignări individuale" toggle când admin vrea)
- Migration data: tenant-urile existente au "toți văd toți" — la activare cu un toggle, default = toți caregiver-ii primesc tot ca primary (no-op). Apoi admin re-asignează.
- Risk gamification: dacă e prea jucăușă, contextul healthcare ar putea părea frivol. **Mitigation:** animații elegant-soft (nu strident-bouncy), copy serios institutional, gamification subtil (counters și progress, nu Pokémon-stickers).

## TODO mapping pe fazele de timp

- **Acum** — niciun cod scris pentru asta. Doar nota asta în vault.
- **Iterație curentă** (când Eduard zice go) — Phase 1: invite staff via magic link
- **Iterație ulterioară** (după primul T2+ client signed) — Phase 2: caregiver assignments + UX gamificat

## Related

- [[FamilyLink Architecture Decisions]] §3 (multi-tenant schema) + §5 (auth flows)
- [[FamilyLink GDPR Approach]] — least privilege access principle
- [[FamilyLink Magic Link Flow]] — invite staff foloseste exact același pattern ca invite familie
- [[FamilyLink Pricing T1-T4]] — Phase 2 ca diferențiator T2+
- [[FamilyLink Personas]] — Mariana (camin admin), staff caregivers context

## Decizii arhitecturale capturate

- **Cu admin separat de staff** (nu role hibrid `camin_admin_staff`) — admin role e doar overseer la T2+, staff role doar caregiver. La T1 dăm `camin_admin` care moștenește toate permisiunile lui `camin_staff` automatically la nivel UI (admin vede butoanele staff + extra). Ascundem feature-uri irelevante prin role check.
- **Asignare cu `started_at` + `ended_at`** (nu boolean active/inactive) — istoricul e important pentru audit GDPR și legal (cine a îngrijit pe Tanti Lenuța în luna X).
- **`role` în assignment** (`primary`, `backup`, `shift`) — pregătit pentru Phase 3 shift management fără rework schema.
- **UI gamificată subtil** — animații elegant-soft, nu Pokémon-stickers (context healthcare).
- **Toggle per-tenant pentru a activa Phase 2** — căminele T1 pot rămâne pe modelul "toți văd toți" fără migration forțată.
