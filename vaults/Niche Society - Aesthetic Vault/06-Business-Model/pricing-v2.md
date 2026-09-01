# Pricing Model — Atelier (white-label aesthetic clinic platform)

> Built for Romanian aesthetic surgery clinics. AI-free MVP. Honest, value-anchored, predictable.

## TL;DR

**5 tiers, 4 paid + 1 founder.** SaaS subscription as core revenue. Three secondary revenue streams (membership transaction fees, product affiliate split, paid add-ons). Annual plans get 2 months free. **Setup fee €299–€799** depending on tier (waived for Founders).

| Tier | Price/mo | Price/yr | Best for |
|---|---|---|---|
| **Founder** ⭐ | €99 | €990 | First 5 clinics — lifetime lock-in |
| **Starter** | €199 | €1,990 | Solo practitioners, 1 doctor |
| **Growth** | €399 | €3,990 | 2–5 doctor clinics (most chosen) |
| **Pro** | €699 | €6,990 | 5–10 doctor practices |
| **Enterprise** | from €1,500 | custom | Multi-location chains |

---

## Why these numbers

### Anchor: what clinics already pay

| Tool clinics use today | Cost/month | What it does |
|---|---|---|
| Doctolib (booking only) | €109 / doctor | Just calendar |
| Clinic.ro (Romanian) | €30–80 | Basic booking + records |
| WhatsApp Business | €0 | Chaotic chat |
| Mailchimp + Calendly + Stripe | €60–120 stitched | Half-features |
| Custom-built clinic app | €15–50k one-time + maintenance | Their dream, can't afford |
| Marketing agency (Facebook/Insta ads) | €500–2,000 | External traffic |

**Our €399 Growth tier is cheaper than 4 Doctolib seats** and replaces 5+ tools.

### Anchor: what we deliver

A €399 Growth clinic doing 80 patients/month at €600 average ticket = **€48,000 revenue/month**.
Atelier costs them **0.83% of revenue**. Fits the 1–3% rule for vertical SaaS.

### Anchor: marginal cost per clinic (real numbers)

| Cost item | Starter | Growth | Pro |
|---|---|---|---|
| Supabase row-level (shared) | €4 | €8 | €15 |
| Supabase storage (photos, ~30GB) | €2 | €5 | €12 |
| Resend (transactional email) | €5 | €10 | €15 |
| Vonage SMS (OTP, reminders) | €8 | €15 | €25 |
| Stripe Connect monthly | €2 | €5 | €10 |
| Hosting (Vercel) | €1 | €3 | €5 |
| Support allocation (avg time) | €15 | €30 | €60 |
| **Total marginal** | **€37** | **€76** | **€142** |
| **Gross margin** | 81% | 81% | 80% |

These margins hold even after support overhead. Plenty of room.

---

## Tier breakdown

### 🥉 Founder — €99/mo (or €990/yr)
**Lifetime grandfather rate for the first 5 clinics that sign before public launch.**
- 1 doctor + 2 staff
- Up to 200 active patients
- All core features (booking, chat, treatments, prescriptions w/ templates, OCR scan, follow-ups, rewards, referrals capped at 2 levels, memberships, marketplace, GDPR center)
- Subdomain only (`atelier.nichesociety.ro`)
- Email support, response in 24h
- Setup fee waived (€299 saved)
- **Locked at €99 forever** as long as they stay subscribed
- Featured in our case studies (mutual exposure)

**Goal**: get 5 real clinics live, gather testimonials, refine product.

### 🥈 Starter — €199/mo (or €1,990/yr — 17% off)
- 1 doctor + 3 staff
- Up to 300 active patients
- All core features
- Subdomain `<your-clinic>.nichesociety.ro`
- Email + chat support, 12h response
- Setup fee €299 one-time

**Best for**: solo practitioner with assistant + receptionist.

### 🥇 Growth — €399/mo (or €3,990/yr) ⭐ MOST POPULAR
Everything in Starter, plus:
- Up to 5 doctors + unlimited support staff
- Up to 1,000 active patients
- **Custom domain** (`app.your-clinic.ro`) with SSL
- **Stripe-powered memberships** (clinic charges €99-499/mo recurring; we take 1% on top of Stripe's 2.9%, clinic keeps the rest)
- **Affiliate marketplace** (clinic earns 10–15% on La Roche-Posay / SkinCeuticals / Auriderm purchases through their patient app)
- **WhatsApp Business bridge** (chat mirrors to WA)
- **Google Reviews integration** (auto-prompt + auto-respond from admin)
- Phone + chat support, 4h response
- Setup fee €499

**Best for**: 2–5 doctor practice doing €30k+ monthly. The economic sweet spot.

### 🏆 Pro — €699/mo (or €6,990/yr)
Everything in Growth, plus:
- Up to 10 doctors
- **Unlimited active patients**
- **Custom-branded PWA** (their logo on the install prompt + app icon — no extra fee)
- **Optional native app store listing** (App Store + Play Store under their brand) — €2,500 one-time setup, then included
- **API access** (REST + webhooks for their existing tools)
- **Multi-location support** (1 clinic, multiple physical addresses with shared catalog)
- Dedicated success manager, monthly review call
- Priority support, 2h response, weekend coverage
- Setup fee €799

**Best for**: 5–10 doctor practices, established brand wanting their own app.

### 🏛️ Enterprise — from €1,500/mo (custom)
For clinic chains, hospital groups, or franchise networks.
- Unlimited everything
- Multi-tenant clinic chains (one parent + multiple branded sub-clinics)
- Custom integrations (PMS, EHR, lab systems)
- On-premise option for hospitals (€10k+ setup)
- Dedicated infrastructure (own Supabase project + KMS key)
- Custom SLA (99.9% uptime guarantee, 1h support)
- Quarterly business reviews
- Annual contract minimum
- Custom DPA negotiation

**Best for**: Aesthetic clinic chains (e.g. AestheticLabs, MedLife dermatology), 3+ locations.

---

## Setup fees (one-time)

| Tier | Setup | Includes |
|---|---|---|
| Founder | €0 | onboarding call (1h), DPA, theme tweak, staff training |
| Starter | €299 | onboarding (1h), DPA, theme, training |
| Growth | €499 | onboarding (2h), DPA, custom domain setup, theme, brand asset import, 2-staff training |
| Pro | €799 | onboarding (3h), DPA, custom domain, branded PWA setup, API setup, full team training |
| Enterprise | from €2,500 | custom scope |

Setup is also pure-margin work (~3 hours of our time per clinic) — directly funds payback on customer acquisition.

---

## Secondary revenue streams (recurring, no clinic effort)

### 1. Membership transaction fee (Growth+ tiers)
Clinic sells "Glow Club" or similar to patients via Stripe.
- Stripe takes 2.9% + €0.25
- We take **1% on top** (passthrough markup)
- Clinic keeps the rest

Example: 30 patients × €299/yr Glow Club = €8,970 yearly through their portal → **~€90/yr to us per clinic**, recurring forever.
Across 50 clinics × ~€90 = **€4,500/yr passive**.

### 2. Affiliate product marketplace (Growth+ tiers)
Patient buys post-op cream through clinic's app.
- Clinic gets 10–15% (their margin)
- Doctor gets 1–3% kickback (incentive)
- **TNS gets 5%** for running the marketplace
- Brand pays the rest as cost-of-acquisition

Average aesthetic clinic patient: ~€80/mo in skincare.
50 clinics × 200 active patients × €80/mo × 5% = **€40,000/mo passive at scale**.

### 3. Paid add-ons (any tier)
Sold as monthly add-ons on top of base subscription:

| Add-on | Price/mo | What |
|---|---|---|
| **AI Reply Assist** | €49 | Real LLM (capped 200 generations/clinic), Gemini Flash backend |
| **Native Mobile App** (App Store + Play) | included in Pro, otherwise €99 | Pure white-label native wrapper |
| **Extra storage** (per 100GB) | €15 | When clinic outgrows photo bucket |
| **Extra SMS** (per 500 msgs) | €25 | Beyond Vonage included quota |
| **Custom integration** | €99/integration/mo | One-off PMS/lab/CRM bridge |
| **Bilingual content** (extra language) | €29 | Beyond RO + EN included |

### 4. Professional services (one-off)
- Custom landing page design beyond template: €1,500
- Custom branded marketing assets: €2,500
- On-site staff training (2 days, Bucharest): €2,000
- Custom DPA review with our lawyer: €500
- Migration from existing system (data import): €1,000–€3,000

---

## Annual + lock-in

- **Annual upfront = 2 months free (16.7% off)**
- **Founder tier locks at €99/mo lifetime** (until they cancel)
- **Multi-year contracts** (Enterprise only): 25% off year 2, 30% off year 3 with 3-yr commitment
- **Quarterly billing** option for clinics that want a middle ground

---

## What's INCLUDED in every tier (no asterisks)

| Feature | Free in all tiers |
|---|---|
| Patient web app (PWA) | ✓ |
| Doctor console | ✓ |
| Admin panel | ✓ |
| Booking + calendar | ✓ |
| Doctor↔patient chat | ✓ |
| Treatment plans | ✓ |
| Prescriptions + reminders + OCR scan | ✓ |
| Visit history | ✓ |
| Photo uploads (AES-256, EU-only) | ✓ |
| Loyalty + rewards (configurable) | ✓ |
| Referral program (2-level cap) | ✓ |
| Treatment marketplace | ✓ |
| Reviews management | ✓ |
| Theme picker (5 presets) | ✓ |
| 5 language translations (RO + EN core, HU/DE/FR optional) | ✓ |
| GDPR compliance toolkit | ✓ |
| EU-hosted data | ✓ |
| Daily backups | ✓ |

We **don't** nickel-and-dime on core features. Tiers gate **scale**, **branding depth**, and **integrations**.

---

## Discounts + promotions

- **20% lifetime referral**: any clinic that brings us another paying clinic gets 20% off their own subscription, lifetime, applied to both
- **Romanian Aesthetic Society (SRPCRE) members**: 10% off any tier
- **First-3-months trial**: any tier, full money-back if cancelled in 90 days
- **Migration credit**: switching from another clinic platform? We credit 3 months of their old subscription against ours (max €450)

---

## Year 1 + Year 2 financial picture (conservative)

### Year 1 — building the case
| Quarter | Action | New clinics | MRR end of Q | Cumulative ARR |
|---|---|---|---|---|
| Q1 | Founder cohort (5 clinics × €99) | 5 | €495 | — |
| Q2 | Founder + 5 Starter (€199) | 10 | €1,490 | — |
| Q3 | Add 8 Growth (€399) | 18 | €4,682 | — |
| Q4 | Add 10 more (mix) | 28 | ~€8,500 | **~€102k ARR** |

Plus secondary revenue (membership + affiliate): ~€500/mo by Q4.
**Year 1 total**: ~€55–70k topline (revenue ramps mid-year), enough to validate.

### Year 2 — scaling
| Action | Outcome |
|---|---|
| Hit 50 clinics by month 18 | ~€18k MRR base |
| Half on Growth, 20% on Pro | ~€22k MRR base |
| Affiliate flywheel kicks in | +€3–5k MRR passive |
| **Total run-rate end of Y2** | **~€27k MRR / €324k ARR** |

That's a small team supportable from clinic SaaS alone. Then we replicate the template for derm + dental verticals.

---

## What we don't do (intentional pricing simplicity)

- ❌ **Per-patient pricing** — clinics hate it (every new client = bigger bill)
- ❌ **Per-API-call charges** — friction, accountants confused
- ❌ **Hidden caps** — no "5,000 messages then €0.10/each"
- ❌ **Setup fees that exceed monthly** — €499 setup on €399 plan is the ceiling
- ❌ **Annual lock-in to get reasonable price** — monthly always available, annual just sweetens
- ❌ **Charging for features they already paid for** ("upload more than 100 photos? extra €")

The whole point: a clinic owner reads the tier, knows what they pay, never gets a "consumption surprise."

---

## Sales script (1-page version)

> "You currently spend €X on Doctolib + Mailchimp + WhatsApp + Calendly + your accountant for GDPR + your nephew who built your website. That's about €Y/month and it doesn't talk to itself.
>
> Atelier replaces all of it for €399. One bill. One platform your patients use. One brand. We handle GDPR, EU hosting, the doctor app, the patient app, the loyalty system that brings their friends, and the post-op reminders that keep them adherent.
>
> First 3 months, full refund if you don't love it. Setup is €499 one time, you're live in 5 days. We train your front desk in person."

