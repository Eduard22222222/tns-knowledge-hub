# Business Model & Pricing — v0

## Revenue streams

### 1. SaaS subscription (primary, 70% target)
Per-clinic monthly fee. Tiered.

| Tier | Price/mo | Doctors | Patients | Features |
|------|----------|---------|----------|----------|
| Starter | €149 | 1 | 200 | Chat, adherence, basic loyalty |
| Growth | €349 | up to 3 | 750 | + AI copilot, referral program, product recs |
| Pro | €699 | up to 6 | 2,000 | + MLM 2-level, branded app, API, priority support |
| Enterprise | Custom | Unlimited | Unlimited | Dedicated, on-prem option, custom branding |

Setup fee: €499 one-time (branding, onboarding, DPA).

### 2. Transaction revenue (secondary, 20% target)
- 10–20% cut on product affiliate sales (skincare, supplements) routed through platform
- 5% fee on loyalty reward fulfillment when we source products
- Stripe subscription fees (clinic's patient memberships) — passthrough + 1%

### 3. AI overage (small but margin-accretive, 5%)
- Each tier includes X AI interactions/month
- Overage: €0.10–0.30 per AI-generated doctor reply beyond limit

### 4. Professional services (5%, optional)
- Custom branding > template
- API integration with clinic's existing PMS
- Custom legal/GDPR consulting for clinic

## Unit economics (rough, per Growth-tier clinic)

**Revenue:** €349/mo SaaS + ~€50/mo affiliate avg = €399/mo
**Costs:**
- Supabase EU: €20
- AI (Claude): €80
- Email/SMS: €15
- Stripe fees: €15
- Support allocation: €40
- Infra amortization: €20
- **Total:** ~€190
**Contribution margin:** ~€209/mo (52%)
**Break-even:** ~40 clinics at Growth tier to cover a 2-person team salary
**Year-1 target:** 50 clinics across tiers → ~€12–18k MRR

## Pricing principles
- **Clinic-friendly:** must pay for itself in 1–2 retained patients
- **White-label premium:** charge more for full branding
- **No freemium:** medical/GDPR = no tire-kickers
- **Annual discount:** 2 months free = 17% off
- **RO-realistic:** first 20 clinics at 50% off ("Founders" tier, lifetime lock)

## Competitive pricing check (to research)
- Doctolib (FR/DE/IT): ~€109/mo per doctor, no app, no AI
- Clinicient, SimplePractice: US-focused, €40–80/doctor
- RO local: Clinic.ro, Medicool — basic, €30–100
- Generic WhatsApp-based = free (our real competitor)

**Positioning:** "5x the value of Doctolib, half the price of building it yourself."

## Go-to-market phases

### Phase 0 (now) — Research + MVP design
- Validate with 5 clinic owner interviews
- Pick MVP vertical (leaning aesthetic/derm)

### Phase 1 — Founding 5 clinics (free/cheap)
- Hand-onboarded, used for testimonials and case studies
- Build-in-public on IG + LinkedIn

### Phase 2 — Paid pilot (20 clinics)
- €149/mo Founders tier
- Start measuring retention, feature usage, NPS

### Phase 3 — Scale (50+ clinics)
- Full tiers, self-serve onboarding
- Partnerships with derm/aesthetic associations in RO

### Phase 4 — Expand
- CEE neighbors (HU, BG, PL) — similar fragmented clinic markets
- Additional verticals (veterinary? physiotherapy? fertility?)

## Risks to pricing
- Clinics haggle hard in RO
- They'll try to avoid "per patient" pricing
- They won't want multi-year lock-in
- Some will ask for revenue share instead of flat fee — could work for Starter
