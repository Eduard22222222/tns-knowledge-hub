---
name: FamilyLink Business Model & Pricing
description: Tier-based subscription pricing for cămine, plus tech architecture decisions for Faza 1 MVP
type: project
originSessionId: b833b2f7-3be7-472e-a90a-c40b90a28f50
---
**FamilyLink** = SaaS multi-tenant pentru comunicare digitală cămin–familie.

## Pricing tiers (per cămin, abonament lunar EUR)

| Tier | Capacitate cămin | Preț/lună |
|---|---|---|
| T1 | 0-50 (rezidenți) | 150 EUR |
| T2 | 50-100 | 250 EUR |
| T3 | 100-200 | 350 EUR |
| T4 | 200+ | 450 EUR |

Tier-ele se aplică automat în super-admin în funcție de numărul de rezidenți activi per tenant.

## Architecture decisions (Faza 1)

**1. Service-layer separation** obligatorie de la început (lib/services/* + lib/repositories/*) — Server Actions și Route Handlers sunt thin wrappers. Public API în Faza 2 se adaugă în ~10-12 zile (vs. 30-50 fără separare).

**2. Schema multi-product de la zero** (NU naive users→camine):
- `users` (id, email) — shared între produse
- `products` (id, slug) — seedat 'familylink' + 'comfortmap' din start
- `tenants` (id, product_id, slug UNIQUE, name, type, is_public BOOL, public_profile JSONB) — slug pentru URL-uri publice, flag-uri ComfortMap pre-pregătite
- `user_tenant_access` (user_id, tenant_id, role, product_id) — granularitate per-produs

**3. Public directory ready** chiar dacă nu e în scope Faza 1:
- Stub `app/comfortmap/[slug]/page.tsx` cu generateStaticParams + ISR (pre-rezervare URL pentru SEO)
- Service `public-directory.service.ts` cu signature dar implementare „not yet enabled"
- Pages cu Next.js 15 ISR — zeci de mii de cămine indexabile fără refactor

Stack: Next.js 15 App Router, TypeScript, Supabase (Postgres + RLS), Vercel ISR, Resend, GitLab CI/CD, Sentry.

**Why:** Realitatea Sociala vrea cross-product (FamilyLink user = ComfortMap user automat) și public directory cu pagini statice per cămin în Faza 2-3, fără rewrite. Dacă schema e proastă în Faza 1, refactor-ul Faza 2 = 2-3 săptămâni pierdute (~4-6k EUR).

**How to apply:** Întotdeauna pune `products` + `slug` + `is_public` + `public_profile` în schema FamilyLink chiar dacă features-urile sunt Faza 2+. Cost zero în Faza 1, salvează rewrite-ul.
