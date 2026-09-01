# Decizii Arhitecturale FamilyLink

Documentul ăsta conține TOATE deciziile tehnice pentru Faza 1 — referință de urmat la kickoff și pentru orice colaborator viitor. Reguli stricte, nu sugestii.

## 1. Stack tehnologic (decis)

| Componentă | Tehnologie | Motivație |
|---|---|---|
| Framework | Next.js 15 (App Router) | RSC + Server Actions + ISR + Route Handlers — toate într-un singur framework |
| Limbaj | TypeScript (strict mode) | Type safety end-to-end, refactor sigur |
| Styling | Tailwind CSS v4 | Utility-first, consistent, responsive built-in |
| DB | Supabase Postgres + RLS | Multi-tenant izolat la nivel de rând; PostgREST inclus |
| Auth | Supabase Auth | Magic links pentru familii, parolă pentru staff, JWT-based |
| Storage | Supabase Storage | Imagini rezidenți cu signed URLs, integrare RLS |
| Email | Resend | Transactional email modern, 99.9% deliverability, EU regions |
| Hosting | Vercel | Deploy continuu din GitLab, ISR, edge cache, EU regions |
| CI/CD | GitLab CI/CD | Build + test + deploy + audit trail al PR-urilor |
| Monitoring | Sentry | Error tracking, performance, EU data residency |
| Image processing | Sharp | Compresie automată la upload, EXIF strip |

**Toate componentele cu opțiunea EU regions activată** — nicio dată stocată în afara UE pentru Faza 1.

## 2. Service-Layer Architecture (REGULA DE BAZĂ)

**Toată logica de business stă în `lib/services/*.ts`.** Server Actions, Route Handlers, cron jobs sunt thin wrappers care apelează aceste servicii.

### Folder structure

```
app/
├── (staff)/                    ← grupare rute staff (auth cookie)
│   └── caminul/
│       └── rezidenti/
│           ├── page.tsx        ← Server Component (fetch + render)
│           ├── actions.ts      ← Server Actions (mutations from forms)
│           └── _components/    ← Client Components private
├── (family)/                   ← grupare rute familie (magic link auth)
│   └── portal/
│       └── [tenantId]/
│           └── page.tsx
├── (super-admin)/
│   └── platforma/
│       └── tenants/
├── (public)/                   ← rute publice (fără auth)
│   ├── page.tsx                ← landing page
│   └── comfortmap/
│       └── [slug]/
│           └── page.tsx        ← public directory (Faza 2 ready)
├── api/
│   └── v1/                     ← REST API public (Faza 2)
│       ├── residents/
│       │   └── route.ts
│       └── _middleware.ts      ← API key auth, rate limit
└── layout.tsx

lib/
├── services/                   ← BUSINESS LOGIC (singura sursă de adevăr)
│   ├── residents.service.ts
│   ├── families.service.ts
│   ├── messages.service.ts
│   ├── reports.service.ts
│   ├── tenants.service.ts
│   ├── public-directory.service.ts  ← stub pentru Faza 1, complet în Faza 2
│   ├── audit.service.ts
│   └── gdpr.service.ts         ← export, ștergere, drept de a fi uitat
├── repositories/               ← DATA ACCESS (Supabase queries)
│   ├── residents.repo.ts
│   ├── families.repo.ts
│   ├── messages.repo.ts
│   └── tenants.repo.ts
├── auth/
│   ├── session.ts              ← cookie-based (Server Actions)
│   ├── api-key.ts              ← Bearer token (Faza 2 stub)
│   ├── magic-link.ts           ← invitation flow familii
│   └── types.ts                ← AuthContext, Session, Role
├── db/
│   ├── client.ts               ← Supabase server client
│   ├── client-browser.ts       ← Supabase browser client
│   └── schema.ts               ← TypeScript types from DB
├── email/
│   ├── resend.ts
│   └── templates/
├── storage/
│   ├── upload.ts
│   └── signed-url.ts
├── validation/
│   └── schemas.ts              ← Zod schemas reutilizate de toate gurile de intrare
└── errors.ts                   ← ValidationError, ForbiddenError, NotFoundError

scripts/
└── cron/
    └── weekly-reports.ts       ← apelat de Vercel Cron, folosește lib/services
```

### Reguli STRICTE

1. **`lib/services/*.ts` NU au directiva `'use server'`.** Sunt module Node pure.
2. **`lib/services/*.ts` NU returnează `Response` și NU citesc `Request`.** Lucrează cu tipuri TypeScript curate; aruncă erori tipate.
3. **`app/**/actions.ts` (Server Actions)** — max 5-10 linii: parse FormData → ia sesiune → apelează service → revalidatePath.
4. **`app/api/**/route.ts` (Route Handlers)** — max 10 linii: validare Zod → verifică API key → apelează service → returnează JSON.
5. **Importurile merg într-o singură direcție:** `app/* → lib/*`. Niciodată invers.
6. **Erorile** — service-urile aruncă `ValidationError`, `ForbiddenError`, `NotFoundError`, `ConflictError`. Wrapper-ele (Server Action / Route Handler) le traduc în formatul propriu.

### Cod model

```ts
// lib/services/residents.service.ts
export async function createResident(input: CreateResidentInput, ctx: AuthContext) {
  // 1. Validare cu Zod
  const data = CreateResidentSchema.parse(input)

  // 2. Permisiuni
  if (ctx.tenantId !== data.caminId && ctx.role !== 'super_admin') {
    throw new ForbiddenError('Acces refuzat la acest tenant')
  }

  // 3. Inserare DB (RLS îl re-verifică în Postgres)
  const resident = await residentsRepo.insert(data, ctx.tenantId)

  // 4. Audit log (paralel, fire-and-forget cu Promise.allSettled)
  await auditLog.write({
    action: 'resident.created',
    actorId: ctx.userId,
    targetId: resident.id,
    tenantId: ctx.tenantId,
  })

  return resident
}
```

```ts
// app/(staff)/caminul/rezidenti/actions.ts
'use server'
import { createResident } from '@/lib/services/residents.service'

export async function adaugaRezident(formData: FormData) {
  const session = await getSession()
  const resident = await createResident(parseForm(formData), session)
  revalidatePath('/caminul/rezidenti')
  return resident
}
```

```ts
// app/api/v1/residents/route.ts (Faza 2)
import { createResident } from '@/lib/services/residents.service'

export async function POST(req: Request) {
  const auth = await verifyApiKey(req)
  const input = CreateResidentSchema.parse(await req.json())
  const resident = await createResident(input, auth)
  return Response.json(resident, { status: 201 })
}
```

## 3. Schema multi-product, multi-tenant (de la Faza 1)

### Tabele top-level

```sql
-- Identitate, partajată între produse
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT auth.uid(),
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Catalog produse — seedat din start cu 'familylink' și 'comfortmap'
CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug TEXT UNIQUE NOT NULL,  -- 'familylink', 'comfortmap'
  name TEXT NOT NULL,
  active BOOLEAN DEFAULT true
);

INSERT INTO products (slug, name, active) VALUES
  ('familylink', 'FamilyLink', true),
  ('comfortmap', 'ComfortMap', false);  -- inactive în Faza 1, activat în Faza 2

-- Tenant unit (cămin pentru FamilyLink, listing pentru ComfortMap)
CREATE TABLE tenants (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES products(id),
  slug TEXT UNIQUE NOT NULL,           -- 'casa-bunicilor-bucuresti' pt URL public
  name TEXT NOT NULL,
  type TEXT,                            -- 'camin' (FL), 'listing' (CM)
  is_public BOOLEAN DEFAULT false,      -- visible în directory ComfortMap?
  public_profile JSONB,                 -- {description, photos[], services[], address, phone, ...}
  tier TEXT,                            -- 't1', 't2', 't3', 't4' — pricing tier (per business model)
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Acces granulat per produs
CREATE TABLE user_tenant_access (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  tenant_id UUID REFERENCES tenants(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id),
  role TEXT NOT NULL,                   -- 'staff', 'admin', 'family', 'super_admin'
  PRIMARY KEY (user_id, tenant_id, role)
);

CREATE INDEX idx_uta_user_product ON user_tenant_access(user_id, product_id);
```

### Domain tables FamilyLink (Faza 1)

```sql
CREATE TABLE residents (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
  full_name TEXT NOT NULL,
  birth_date DATE,
  photo_url TEXT,
  status TEXT,                          -- 'active', 'archived'
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE families (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  resident_id UUID NOT NULL REFERENCES residents(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  full_name TEXT,
  relationship TEXT,                    -- 'fiu', 'fiica', 'sot', etc.
  notification_preference TEXT DEFAULT 'daily',  -- 'daily', 'weekly', 'never'
  invited_at TIMESTAMPTZ DEFAULT now(),
  joined_at TIMESTAMPTZ
);

CREATE TABLE journal_entries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
  resident_id UUID NOT NULL REFERENCES residents(id) ON DELETE CASCADE,
  author_id UUID NOT NULL REFERENCES users(id),
  text TEXT,
  photo_urls TEXT[],
  tags TEXT[],                          -- 'masa', 'plimbare', 'medicatie', 'dispozitie'
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  resident_id UUID REFERENCES residents(id),
  sender_id UUID NOT NULL REFERENCES users(id),
  recipient_id UUID NOT NULL REFERENCES users(id),
  text TEXT NOT NULL,
  read_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE audit_log (
  id BIGSERIAL PRIMARY KEY,
  tenant_id UUID,
  actor_id UUID,
  action TEXT NOT NULL,                 -- 'resident.created', 'message.sent', etc.
  target_id UUID,
  metadata JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_audit_tenant_time ON audit_log(tenant_id, created_at DESC);
```

### RLS Policies (esențial)

```sql
-- residents: doar staff/admin din același tenant văd; super_admin vede tot
ALTER TABLE residents ENABLE ROW LEVEL SECURITY;

CREATE POLICY residents_tenant_isolation ON residents
  USING (
    tenant_id IN (
      SELECT tenant_id FROM user_tenant_access
      WHERE user_id = auth.uid()
    )
    OR EXISTS (
      SELECT 1 FROM user_tenant_access
      WHERE user_id = auth.uid() AND role = 'super_admin'
    )
  );

-- families: pot vedea doar rezidenții la care sunt asociate
CREATE POLICY families_own_resident ON residents FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM families
      WHERE families.resident_id = residents.id
        AND families.email = (SELECT email FROM users WHERE id = auth.uid())
    )
  );
```

(Toate tabelele cu PII obțin RLS similar — izolare strictă per tenant + rol-based.)

## 4. Public Directory ComfortMap (stub în Faza 1, complet în Faza 2)

### Stub minimal Faza 1

```ts
// app/(public)/comfortmap/[slug]/page.tsx
import { getCaminPublicProfile } from '@/lib/services/public-directory.service'
import { notFound } from 'next/navigation'

export async function generateStaticParams() {
  // În Faza 1 returnează [] (nu generăm pagini)
  // În Faza 2 returnează lista cămine publice
  return []
}

export const revalidate = 3600  // ISR — rebuild la 1h

export default async function CaminPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const camin = await getCaminPublicProfile(slug)
  if (!camin) notFound()
  return <PublicCaminProfile data={camin} />
}
```

```ts
// lib/services/public-directory.service.ts
export async function getCaminPublicProfile(slug: string) {
  // Faza 1: returnează null (feature dezactivat)
  // Faza 2: SELECT din tenants WHERE slug = ? AND is_public = true
  if (!await isFeatureEnabled('public_directory')) return null
  return tenantsRepo.findPublicBySlug(slug)
}
```

URL-ul `/comfortmap/[slug]` e rezervat de la Faza 1 — Google îl indexează deja, schema e gata, în Faza 2 doar pornim feature flag-ul și populăm `public_profile`.

### ISR pentru scale

- 1.000 cămine publice → 1.000 pagini statice generate la build (~30 sec build) sau on-demand (request-time + cache)
- `revalidate = 3600` → fiecare pagină se regenerează maxim o dată/oră (sau on-demand prin webhook când se editează profilul)
- Vercel CDN cache → utilizatorul final primește HTML pre-renderat în <100ms global

## 5. Auth flows

### Staff (cămin admin/staff)
- Email + parolă prin Supabase Auth
- Cookie-based session (HttpOnly, Secure, SameSite=Lax)
- Server Actions citesc sesiunea automat din cookie
- Magic link de reset parolă

### Familii
- Invitație din aplicația căminului → email cu magic link
- Magic link Supabase → set sesiune
- Sesiune cookie cu rol="family" + tenant_id + resident_id în JWT claims
- Re-autentificare cu magic link dacă sesiunea expiră (90 zile)

### Super-admin (Realitatea Sociala)
- Email + parolă + 2FA obligatoriu (TOTP)
- Acces la TOATE tenant-urile (RLS policy bypass cu role='super_admin')

### API public (Faza 2)
- API keys generate per cămin partener din super-admin dashboard
- `Authorization: Bearer fl_live_xxxxx`
- Rate limit per key (default 1k/h, upgrade per tier)
- Logged în `api_audit_log` pentru audit

## 6. Cron jobs (Vercel Cron)

```ts
// scripts/cron/weekly-reports.ts
// Configurat în vercel.json: { "crons": [{ "path": "/api/cron/weekly-reports", "schedule": "0 9 * * 1" }] }

import { generateWeeklyReports } from '@/lib/services/reports.service'

export async function GET(req: Request) {
  // Verificare secret pentru protecție (Vercel Cron only)
  if (req.headers.get('Authorization') !== `Bearer ${process.env.CRON_SECRET}`) {
    return new Response('Unauthorized', { status: 401 })
  }
  await generateWeeklyReports()
  return Response.json({ success: true })
}
```

Configurabil per cămin (zi + oră de livrare) — citit din `tenant.settings.weekly_report_schedule`.

## 7. Image upload pipeline

```ts
// lib/storage/upload.ts
import sharp from 'sharp'
import { storage } from '@/lib/db/client'

export async function uploadResidentPhoto(file: File, tenantId: string, residentId: string) {
  // 1. Compresie + EXIF strip
  const buffer = await sharp(await file.arrayBuffer())
    .resize(1200, 1200, { fit: 'inside', withoutEnlargement: true })
    .jpeg({ quality: 85, progressive: true })
    .toBuffer()

  // 2. Upload to Supabase Storage cu path tenant-isolated
  const path = `${tenantId}/residents/${residentId}/${Date.now()}.jpg`
  await storage.from('media').upload(path, buffer, {
    contentType: 'image/jpeg',
    cacheControl: '3600',
  })

  // 3. Returnează signed URL (24h)
  return getSignedUrl(path, 24 * 3600)
}
```

## 8. Performance & Caching

| Layer | Strategie |
|---|---|
| Static pages (landing, comfortmap directory) | ISR cu `revalidate` 1h |
| Authenticated pages (dashboard cămin) | Server Components + `cache()` per request |
| API responses | Cache Control headers; Upstash Redis în Faza 2 dacă e necesar |
| Images | Vercel Image Optimization + Sharp; lazy loading |
| DB queries | Index-uri pe FK + `(tenant_id, created_at)` pe tabele audit/journal |
| Subscriptions/realtime | Supabase Realtime pentru mesaje; polling 30s pentru update-uri jurnal (Faza 1) |

## 9. Error handling & observability

```ts
// lib/errors.ts
export class AppError extends Error {
  constructor(public code: string, message: string, public statusCode: number = 500) {
    super(message)
  }
}

export class ValidationError extends AppError {
  constructor(message: string) { super('VALIDATION_ERROR', message, 400) }
}

export class ForbiddenError extends AppError {
  constructor(message: string) { super('FORBIDDEN', message, 403) }
}

export class NotFoundError extends AppError {
  constructor(message: string) { super('NOT_FOUND', message, 404) }
}
```

Server Action / Route Handler le traduce:

```ts
try {
  return await createResident(input, ctx)
} catch (e) {
  if (e instanceof AppError) {
    Sentry.captureException(e, { tags: { code: e.code } })
    return Response.json({ error: e.code, message: e.message }, { status: e.statusCode })
  }
  Sentry.captureException(e)
  return Response.json({ error: 'INTERNAL_ERROR' }, { status: 500 })
}
```

Sentry captează tot, segmentat per tenant + per user.

## 10. Testing strategy

| Tip test | Tool | Acoperire |
|---|---|---|
| Unit (services) | Vitest | Toate funcțiile din `lib/services/` |
| Integration (DB) | Vitest + test Supabase project | Repositories + RLS policies |
| E2E (UI) | Playwright | Fluxurile critice: login, jurnal, mesaj familie |
| GDPR scenarios | Vitest | Export complet, ștergere cu cascade, audit log |

Target Faza 1: **70% coverage pe `lib/services/`**, smoke tests E2E pentru fluxurile principale.

## 11. CI/CD pipeline

```yaml
# .gitlab-ci.yml (simplified)
stages: [lint, test, build, deploy]

lint:
  script: pnpm lint && pnpm typecheck

test:
  script: pnpm test:unit && pnpm test:integration
  services: [postgres:15]

build:
  script: pnpm build

deploy_preview:
  only: [merge_requests]
  script: vercel deploy --token $VERCEL_TOKEN

deploy_production:
  only: [main]
  script: vercel deploy --prod --token $VERCEL_TOKEN
```

Toate PR-urile au preview URL automat. Main → production.

## 12. Backup & disaster recovery

- **Supabase backup zilnic** (built-in pe Pro tier) — retenție 7 zile
- **Backup manual săptămânal** către S3 EU sau Backblaze B2 EU — retenție 30 zile
- **Disaster recovery test** — o dată per lună, restore într-un proiect de test din backup
- **RPO target:** 24h (max pierdere de date)
- **RTO target:** 4h (max downtime)

## 13. Logging & audit

Toate operațiunile sensibile pe PII sunt logate în `audit_log`:

```
- resident.created
- resident.updated
- resident.archived
- resident.deleted
- family.invited
- family.joined
- message.sent
- gdpr.export_requested
- gdpr.delete_requested
- subscription.tier_changed
```

Audit log e accesibil doar super-admin-ului. Retenție 5 ani (sincron cu durata de păstrare a contractului).

## 14. Feature flags

Pentru a putea activa funcționalități precum public directory ComfortMap fără deploy nou:

```sql
CREATE TABLE feature_flags (
  key TEXT PRIMARY KEY,
  enabled BOOLEAN DEFAULT false,
  metadata JSONB,
  updated_at TIMESTAMPTZ DEFAULT now()
);

INSERT INTO feature_flags (key, enabled) VALUES
  ('public_directory', false),    -- Faza 2
  ('public_api_v1', false),        -- Faza 2
  ('comfortmap_full', false);     -- Faza 3
```

```ts
// lib/services/feature-flags.service.ts
export async function isFeatureEnabled(key: string): Promise<boolean> {
  const flag = await db.from('feature_flags').select('enabled').eq('key', key).single()
  return flag.data?.enabled ?? false
}
```

Cache TTL 60s — schimbarea unui flag se aplică în <1 minut.

---

## Test arhitectural „nu am amestecat logica"

Înainte de fiecare deploy major:
1. Șterge mental folder `app/api/` — app-ul Faza 1 trebuie să meargă neschimbat ✅
2. Șterge mental folder `app/(staff)/` — API-ul (Faza 2) trebuie să meargă ✅
3. Caută pattern `from '@/app/'` în `lib/` — TREBUIE să fie ZERO rezultate ✅
4. Caută `'use server'` în `lib/services/` — TREBUIE să fie ZERO rezultate ✅

Dacă oricare din ele eșuează → arhitectura e ruptă, nu mergem mai departe.
