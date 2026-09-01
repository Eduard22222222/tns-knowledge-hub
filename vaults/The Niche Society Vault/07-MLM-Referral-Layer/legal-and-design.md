# MLM / Referral Layer — Legal + Design (2026-04-17)

## ⚠️ Critical legal context (Romania + EU)

### True MLM is dangerous territory
- Romania: pyramid schemes (*scheme piramidale*) are illegal under Law 363/2007 + Commerce Code
- Legal test: is income primarily from *recruitment* or from *real product/service sales*?
- In a **medical** context, kickbacks for patient referrals are additionally regulated by:
  - Law 95/2006 (healthcare system)
  - Medical Deontology Code (Codul Deontologic Medical) — doctors *cannot* pay for patient referrals
  - But patients paying/rewarding OTHER patients for referrals is a different regime

### What this means for us
- **Safe**: patient-to-patient referrals rewarded in **points, treatments, products** (loyalty program, not cash income)
- **Grey**: cash rewards to patients for referring — defensible if framed as discount/cashback, NOT as commission
- **Illegal**: multi-level cash commissions (patient A gets cash from friend of friend of friend) → this is pyramid, don't do it
- **Illegal**: paying doctors or clinic staff for external referrals to OTHER clinics without disclosure

## Safer architecture — "Loyalty Pyramid Lite"

### Level 0 — Personal loyalty (always safe)
Points for: booking, showing up, adherence streaks, leaving review, completing treatment course.
Redeem for: free mini-treatments, skincare products, premium slots, birthday perks.

### Level 1 — Direct referral (1 level deep, safe)
Ioana invites Maria → Maria books + shows up → both get X points / discount.
This is standard "Refer a Friend" — legal everywhere.

### Level 2 — 2nd-degree (2 levels, grey but common)
Maria (referred by Ioana) invites Andreea → Ioana gets smaller bonus too.
Defensible IF:
- Rewards are points/treatments (not cash income)
- Capped (e.g. max €50/month in equivalent value)
- Clearly disclosed
- Not the primary value prop

### DO NOT build
- Level 3+ (pure pyramid)
- Unlimited cash payouts
- Income projections shown to patients ("earn €500/month!")
- Recruitment as primary activity

## Reward types to offer

| Type | Cost to clinic | Perceived value | Legal risk |
|------|----------------|------------------|------------|
| Loyalty points | Low | Medium | None |
| Free mini-treatment | Marginal cost | High | None |
| Discount on next visit | Low | High | None |
| Skincare / dental product | COGS only | Medium-High | None |
| Cash / gift card | Real money | Medium | Moderate (tax/MLM) |
| Tier status (Silver/Gold/Platinum) | Zero | High | None |
| Early access to new treatments | Zero | Medium | None |
| Birthday month perks | Low | High | None |

**Recommendation:** Launch with points + treatments + tier status. Add cashback as opt-in clinic feature in v2, flagged for legal review per tenant.

## Technical design (rough)

- `referrals` table: referrer_id, referred_id, clinic_id, status (invited/booked/completed), reward_tier
- `loyalty_transactions` table: patient_id, clinic_id, points_delta, reason, ref_entity
- `rewards_catalog` per clinic (admin-configurable)
- `tier_rules` per clinic (points thresholds)
- Fraud detection: prevent same phone/email/device from self-referring

## Open questions
- Tax implications for patients earning significant rewards (RO "beneficii în natură"?)
- Do we need each clinic to have its own T&Cs for the loyalty program, or one master?
- Does ANPC (consumer protection) need disclosures?
- Can we handle rewards fulfillment or is it clinic's job?
