# The Niche Society — Initial Concept (2026-04-17)

## One-liner
A white-label SaaS platform that gives niche clinics (dermatology, aesthetic, dental, wellness/stem-cell) a branded patient app, a doctor app, and an admin panel — with a built-in referral/loyalty growth engine.

## Target clinics (Romania first)
- Dermatology clinics
- Aesthetic / cosmetic medicine (botox, filler, laser)
- Dental clinics
- Wellness clinics (IV therapy, longevity, nutrition)
- Stem cell / regenerative (if any real ones in RO — need to verify; most RO "stem cell" is storage, not treatment)

## Why this could work in Romania
- Romanian private clinics are fragmented, each has a Facebook page, no real app
- Patients WhatsApp their doctor directly (unprofessional, no records, no scale)
- Aesthetic/derm patients are younger, phone-native, already used to booking apps
- Referral is how 70%+ of these clinics get clients already — just not tracked
- GDPR compliance is a pain clinics don't want to solve themselves → SaaS wins

## The 3 interfaces

### Client interface
- Chat with their doctor (async, not tele-consult initially)
- Treatment plan + progress timeline
- Prescription adherence tracking (tick off meds, photo logs)
- Before/after photos (huge for derm/aesthetic)
- Product recommendations from the doctor (affiliate linked)
- Loyalty points balance + rewards catalog
- Referral code / invite friends
- Booking / rescheduling

### Doctor interface
- Patient queue with adherence flags (who's not taking meds, who's ghosting)
- Chat inbox
- Quick prescription templates
- Product recommendation library (skincare, supplements, dental care)
- AI copilot: summarizes patient history before chat, drafts replies, flags risks
- Schedule view

### Admin (clinic owner) interface
- Tenant branding (logo, colors, domain)
- Staff management
- Pricing / package config
- Loyalty program config (points per action, reward catalog)
- Referral/MLM config (levels, payouts)
- Revenue dashboard
- GDPR export / delete tools

## Layer 2 — MLM / Referral / Loyalty (the growth engine)

### Ideas to explore
- **Tier 1**: patient refers friend → both get points
- **Tier 2**: referred friend also refers → original patient gets smaller cut (classic 2-level MLM)
- **⚠️ LEGAL FLAG**: true multi-level (3+ deep) is restricted in RO/EU, especially when money is involved. Safer to cap at 2 levels, or keep cash out of it and use points/treatments only.
- Reward types: cash back, free treatments, points for products, early access, VIP status
- Gamification: streaks for adherence, badges, leaderboards (anonymized)
- Clinic-funded vs brand-funded rewards (skincare brands could sponsor)

## My additional ideas (beyond what you said)

1. **Before/after photo vault** — automatic monthly reminder, AI-assisted pose matching, doctor can show results without asking patient for photos each time. Massive value for aesthetic/derm.

2. **AI pre-consultation triage** — patient describes issue in chat, AI asks clarifying questions + suggests what kind of appointment, drafts summary for doctor. Saves 5–10 min per consult.

3. **Smart adherence** — not just "did you take it" but photo of the medicine bottle (OCR), photo of treated area (progression), voice check-in option for older patients.

4. **Product affiliate marketplace** — doctor recommends La Roche-Posay / CeraVe / whatever → clinic gets affiliate cut, patient gets discount, doctor gets kickback (transparency required). Revenue stream #2.

5. **Clinic-to-clinic referral** — dermatologist refers patient to dentist in network → referral fee tracked automatically. Builds a clinic graph, increases stickiness.

6. **Longevity / stem-cell angle**: in RO, "stem cell" is mostly cord-blood *storage* (Cord Blood Center, Stem-Health). Real stem-cell treatment is rare and borderline legal. Position wellness clinics under this umbrella instead (IV drips, peptides, hormonal) — big growing niche.

7. **Insurance / subscription packages** — clinic can sell "3 facials + 1 free per year" as a membership through the app. Stripe subscriptions, recurring revenue for clinic = recurring revenue for us.

8. **WhatsApp bridge** — most RO patients live in WhatsApp. MVP: the doctor chat should also push to WhatsApp Business API so patients don't need to open our app for simple replies. Reduces adoption friction massively.

9. **Multi-language** — RO first, EN + HU as toggles (Transylvania has big HU-speaking market for aesthetic/dental).

10. **AI skincare routine builder** — derm patient inputs skin type + products they own → AI generates morning/evening routine → doctor approves/edits. Very shareable, viral hook.

11. **Dental-specific**: treatment plan with visual tooth chart, financing options, X-ray viewer.

12. **Prescription OCR** — patient uploads paper prescription (common in RO) → parsed into structured reminders.

13. **Review / reputation layer** — after treatment, patient prompted for Google review with one-click. Clinic's #1 marketing pain = solved.

## Open questions for next session
- Scope of MVP (all 4 verticals or just derm first?)
- White-label depth (just colors or full custom domain + app store listing?)
- Pricing model (per clinic flat, per doctor seat, per patient active, % of rewards?)
- Build ourselves vs use Supabase + existing telehealth SDK?
- GDPR: EU hosting mandatory, DPA with every clinic, data residency in RO required?

## Next steps
1. Market research on RO clinic density + competitors
2. Legal check on MLM limits in RO medical context
3. Pick MVP vertical (my bet: aesthetic derm — highest willingness to pay, youngest user base, photo-driven loop built-in)
4. Draft 3-persona feature matrix
