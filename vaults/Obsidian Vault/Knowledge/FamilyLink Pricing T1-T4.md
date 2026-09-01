# Pricing & Business Model FamilyLink

## Tier-uri abonament cămin (per cămin, EUR/lună)

| Tier | Capacitate cămin (rezidenți activi) | Preț/lună |
|---|---|---|
| **T1** | 0 - 50 | **150 EUR** |
| **T2** | 50 - 100 | **250 EUR** |
| **T3** | 100 - 200 | **350 EUR** |
| **T4** | 200+ | **450 EUR** |

## Cum se aplică tier-ul

- Tier-ul e calculat automat din `super-admin` pe baza câmpului `tenant.tier`
- Recalculare: o dată pe lună, la încheierea lunii, pe baza max(rezidenți activi în luna respectivă)
- Up-tier-ul e automat (de la T1 la T2 când treci 50 rezidenți)
- Down-tier-ul e cu 1 lună de grație (eviți penalizare pentru fluctuații sezoniere)
- Notificare prin email la super-admin Beneficiar și la admin cămin la fiecare schimbare de tier

## Schema relevantă

```sql
ALTER TABLE tenants ADD COLUMN tier TEXT DEFAULT 't1';
ALTER TABLE tenants ADD COLUMN tier_locked_until DATE;  -- pentru grace period

CREATE TABLE subscription_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  tier TEXT NOT NULL,
  effective_from DATE NOT NULL,
  effective_to DATE,
  active_residents_count INTEGER,
  monthly_amount_eur INTEGER,
  created_at TIMESTAMPTZ DEFAULT now()
);
```

## Calculele

```ts
// lib/services/pricing.service.ts
export const TIER_PRICING_EUR = {
  t1: 150,
  t2: 250,
  t3: 350,
  t4: 450,
} as const

export function computeTier(activeResidents: number): keyof typeof TIER_PRICING_EUR {
  if (activeResidents <= 50) return 't1'
  if (activeResidents <= 100) return 't2'
  if (activeResidents <= 200) return 't3'
  return 't4'
}

export async function recomputeTenantTier(tenantId: string) {
  const count = await residentsRepo.countActive(tenantId)
  const newTier = computeTier(count)
  // logica de tier_locked_until pentru grace period
  // ...
}
```

## Revenue projection (orientativ)

| Cămine active | Mix tier estimat | Revenue lunar | Revenue anual |
|---|---|---|---|
| 10 | 7×T1 + 2×T2 + 1×T3 | 1.900 EUR | 22.800 EUR |
| 50 | 30×T1 + 15×T2 + 4×T3 + 1×T4 | 10.100 EUR | 121.200 EUR |
| 200 | 100×T1 + 60×T2 + 30×T3 + 10×T4 | 45.000 EUR | 540.000 EUR |
| 500 | 250×T1 + 150×T2 + 80×T3 + 20×T4 | 113.500 EUR | 1.362.000 EUR |

(Estimare bazată pe distribuție ipotetică a tier-urilor — în piața RO căminele mici sunt majoritare.)

## Funding strategy (cum mi-au spus la negociere)

- **Faza 1 MVP:** finanțat din credit propriu (Realitatea Sociala)
- **Faza 2 GDPR completă:** finanțat din primele abonamente cămine (T1-T2 inițial)
- **Faza 3+ scale:** runway din revenue + posibil seed de la investitori (200k+ EUR în discuție pentru ComfortMap)

## Considerente pentru implementare Faza 2

- Stripe Subscriptions integrare (Faza 2 — nu e în Faza 1)
- e-Factura ANAF pentru facturile lunare (Faza 2)
- Dashboard analytics tier per cămin (super-admin)
- Email automat la schimbare tier (template Resend)
- Hook în RLS pentru a bloca operațiuni dacă subscription e past_due
