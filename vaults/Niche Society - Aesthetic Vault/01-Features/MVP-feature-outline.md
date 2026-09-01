# Aesthetic Clinic Template — Full Feature Outline (MVP)

Parent: [[../README|Aesthetic]] → [[The Niche Society Vault/README|The Niche Society]]
Status: **AWAITING APPROVAL** before build starts.

---

## The 3 interfaces

```
┌──────────────────────────────────────────────────────────────────┐
│  CLIENT APP              DOCTOR APP          ADMIN PANEL         │
│  web (responsive) +      web + tablet        web only            │
│  installable PWA         Next.js 15          Next.js 15          │
│  (mobile-first design,                                           │
│   works on desktop too)                                          │
│  Next.js 15 PWA                                                  │
│  v2: React Native wrap                                           │
└──────────────────────────────────────────────────────────────────┘
          │                     │                      │
          └──────────┬──────────┴──────────────────────┘
                     │
              ┌──────▼──────┐
              │  Supabase   │
              │  EU region  │
              └─────────────┘
```

### Client app access (explicit)
- **Web URL**: `clinica-x.nichesociety.ro` or custom domain — works in any browser on any device
- **Desktop layout**: responsive — 3-column when there's space (nav / main / side-panel)
- **Mobile layout**: bottom dock nav, full-width cards, PWA-installable ("Add to Home Screen")
- **Installable PWA**: patients who want "app feel" get icon on home screen, push notifications, offline-light
- **Tablet**: fluid between the two
- **Native wrapper (v2)**: same codebase wrapped in React Native / Capacitor for App Store + Play Store listings — clinic-branded if they want
- Patient can start on desktop (book, review plan), continue on phone (chat, check-in photos), data syncs instantly

### Why web-first for client
- Zero install friction — link in SMS / WhatsApp just opens
- Reviews, testimonials, content uploads work better on big screens sometimes
- Desktop = older-patient friendly (parents booking for kids, etc.)
- One codebase, three form factors, no app store approval delays for updates

---

## 🟢 CLIENT APP (Patient) — mobile-first

### 1. Onboarding (3 screens max)
- Phone number → OTP (email optional)
- Name, date of birth
- Quick skin/body concerns picker (visual tiles)
- Photo permission request with clear why
- Done → home

### 2. Home
- **Active treatment card** (serif display, next session date)
- **Today's gentle prompt**: take photo / confirm meds / answer doctor (optional — no streak pressure)
- **Points balance** (large serif number, with tier badge)
- **Upcoming appointments** (horizontal scroll)
- **Recommended for you** (products from doctor, 2 max)
- **Referral nudge** (smart-timed, dismissible)
- NOTE: No streak rings, no daily-chain guilt. Patients check in because app is pleasant, not because they'll "lose" something.

### 3. Chat with doctor
- iMessage-style threaded chat
- Attach: photo, prescription scan, voice note
- Read receipts, typing indicator
- Doctor's replies may be AI-drafted (invisible to patient)
- Smart suggestions: "Book follow-up?" "Send before-photo?"

### 4. Treatment tracker
- Timeline view of current treatment plan
- Each session: status (scheduled/done/upcoming), photos, notes
- Before/after comparison with swipe
- Progress percentage

### 5. Adherence + daily check-in
- Morning / evening prompts (configurable)
- Check off products applied, log side effects
- Photo upload (optional, encourages streak)
- Doctor sees adherence in real time

### 6. Booking
- Pick treatment type → calendar → time slot
- Rescheduling with 1 tap
- Clinic address, parking, wifi (practical)
- Pre-treatment checklist sent automatically

### 7. Rewards & Loyalty 💎
- Tier card (Silver → Gold → Platinum)
- Points balance + history
- Rewards catalog (free treatments, product discounts, early access)
- Progress ring to next tier
- Redeem flow with confetti moment

### 8. Referral hub
- Personal referral code + shareable card (generated)
- Track invitations (invited / booked / completed)
- Earn points when friend completes first visit
- 2nd-level bonus (smaller) when friend refers further
- QR code for in-clinic referral

### 9. Products / Affiliate marketplace ⭐ (you asked for this)
- Doctor-recommended products only (no clutter)
- Each product: why doctor recommends it (personal note)
- Patient discount code auto-applied
- Clinic earns affiliate cut, doctor earns kickback, patient sees discount
- Full transparency: "Your clinic earns X% from this purchase"
- Favorites + reorder

### 10. Memberships / Subscription packages ⭐ (you asked for this)
- "Glow Club": 3 facials + 1 free / year (€299)
- "Laser Plan": 6 sessions at 15% off
- "Botox Subscription": 3x/year with priority slots
- Stripe-powered recurring
- Members-only rewards tier

### 11. Review prompt ⭐ (you asked for this)
- After treatment session marked done → prompt "Share your experience?"
- 1-tap → Google review (deep-link with pre-filled rating)
- Patient gets points for leaving review (regardless of star count)
- ⚠️ Legal: can't pay for positive reviews specifically; points reward the act of reviewing

### 11b. Content creation rewards ⭐ (added 2026-04-17)
**Reward patients for making content for the clinic.** Massive UGC flywheel.

What earns points:
- **Testimonial video** (30–90s, uploaded in-app) → high points, clinic reviews before publishing
- **Before/after reel** (patient owns the post, tags clinic) → bonus points on verified tag
- **Google review with photo** → more points than text-only review
- **Instagram Story tag** → auto-detected via tag webhook, points on confirm
- **TikTok / Reel mention** → patient submits link, clinic verifies
- **Blog-style written testimonial** (for clinic website) → points + optional paid upgrade

UX flow:
- "Create & earn" tab inside Rewards
- Simple in-app recorder with prompts ("What problem did you come in with?", "What changed?")
- Optional AI editing: auto-captions, clinic logo watermark, music bed
- Clinic gets library of ready-to-post content (with signed release form)
- Patient can opt out anytime; content auto-expires if consent withdrawn (GDPR right to erasure)

Consent / legal:
- Explicit content-release form in-app (digital signature, timestamped)
- Points are reward for CREATING, not for content QUALITY — avoids "paid endorsement" issue
- Clinic must disclose #ad or #partnership if content is reposted as marketing (ANPC + ASRO rules)
- Patients under 18: parental consent required

Tier bonuses:
- Gold+ tier patients get 2x content points
- "Creator of the Month" spotlight — free treatment

Why this is huge:
- Clinics pay €200–€2000 per testimonial video to agencies
- Our platform generates dozens per month per clinic organically
- Double the dopamine loop: patient gets points + attention + clout

### 12. Profile / Settings
- Personal data (GDPR editable)
- Privacy controls (who can see photos, anonymized in leaderboards)
- Language (RO / EN / HU)
- Notifications (quiet hours, channels)
- Download my data, delete account

---

## 🔵 DOCTOR APP — web + tablet-first

### 1. Dashboard / queue
- Patients requiring attention today (ghosted, flagged adherence, messages)
- Stats: messages pending, adherence avg, upcoming consults
- Quick actions

### 2. Patient inbox
- All chat threads
- AI-drafted reply for each incoming message (1-tap Approve / Edit / Regenerate)
- Filter: urgent, new, unread, flagged
- Thread context: photos, treatment plan, history summary (AI-generated)

### 3. Patient list
- Search, filter by treatment, status, tier, last seen
- Per-patient profile:
  - History, treatment plan, photos, adherence chart
  - Notes (private)
  - Product recommendations given
  - Referral family tree (who they referred)

### 4. Adherence dashboard
- Patient adherence scores
- Who's at risk of dropping off (AI flag)
- One-click: send encouragement message (AI-drafted)
- Photo gallery from all patients (chronological, filterable)

### 5. Prescription + treatment plan builder
- Visual plan: sessions, intervals, products
- Saveable templates per treatment type
- Prescription PDF generator (RO-compliant format)
- Prescription OCR ⭐ — doctor can scan paper prescription, auto-parse into structured reminders

### 6. Product recommendation library ⭐
- Browse affiliate products by concern (acne, hyperpigmentation, anti-aging, body)
- Add to patient with personal note
- See own kickback earnings
- Per-patient recommendation history

### 7. Calendar
- Personal schedule
- Drag-drop rescheduling
- Sync with Google/Outlook
- Block time off

### 8. AI Copilot sidebar
- Available on every screen
- "Summarize this patient's history"
- "Draft aftercare instructions for PRP"
- "What's this patient's adherence pattern?"
- Safe-mode: never auto-sends, never diagnoses

---

## 🟣 ADMIN PANEL (Clinic Owner) — web only

### 1. Overview dashboard
- MRR, new patients, retention, avg ticket, NPS
- Top doctors, top treatments, top referrers
- Revenue forecast
- Alerts (adherence risks, churn risks)

### 2. Clinic settings / branding
- Logo, colors (extracted from logo automatically)
- Clinic name, address, hours, parking info
- Subdomain (`clinica-x.nichesociety.ro`) or custom domain
- App icon for PWA install
- Hero copy, about section

### 3. Staff management
- Invite doctors, assistants, receptionists
- Role-based permissions
- Doctor profiles (bio, photo, specialties)
- Pay structure (for kickbacks, referral splits)

### 4. Treatment catalog
- Define services, durations, prices
- Packages / bundles
- Seasonal promotions
- Treatment templates (protocols auto-assigned)

### 5. Membership / Subscription plans ⭐
- Define plans (name, price, includes, cadence)
- Stripe config
- Member list, MRR from memberships

### 6. Loyalty / Rewards config
- Points rules (per action: check-in, review, referral, purchase)
- Tier thresholds + perks
- Rewards catalog (clinic-funded + platform catalog)
- Fraud settings

### 7. Referral program config
- On/off per level (Level 1 safe, Level 2 opt-in, Level 3+ never)
- Reward amounts (points, discount, free treatment)
- Fraud prevention (same phone / device block)
- Referral leaderboard (opt-in)

### 8. Product affiliate config ⭐
- Browse platform catalog (La Roche-Posay, CeraVe, Avène, Obagi, SkinCeuticals, etc.)
- Enable per product, set clinic margin
- Doctor kickback split
- Reports: clicks, sales, revenue

### 9. Reviews management ⭐
- Google review deep-link config
- Review prompt timing rules
- Internal rating (1-5) to filter before pushing to Google
- Respond to Google reviews from within the app (via Google API)

### 9b. UGC / Content library ⭐ (added 2026-04-17)
- Inbox of patient-submitted content (videos, photos, testimonials)
- Approve / request edits / reject
- Consent & release form management (signed, archived)
- Auto-watermark, auto-captions, auto-resize for IG/TikTok
- Export to scheduler or download
- Points payout per approved piece
- "Creator of the Month" spotlight picker

### 10. Reporting & exports
- Revenue, cohort retention, LTV, CAC by channel
- GDPR: export all patient data for audit
- Invoice generator (RO-compliant)

### 11. GDPR + Compliance center
- DPA (signed, viewable)
- Consent log
- Data retention policies (configurable per data type)
- Breach notification workflow
- Subprocessor list

### 12. Integrations
- Stripe (payments, subscriptions)
- Google Calendar / Outlook (staff sync)
- WhatsApp Business API (chat bridge)
- Google Reviews API
- SIPE (RO e-prescription) — v2

---

## ⭐ Your prioritized ideas — where they fit

| Idea | Client | Doctor | Admin |
|------|--------|--------|-------|
| Product affiliate marketplace | Feature 9 (browse + buy) | Feature 6 (recommend + earn) | Feature 8 (config + reports) |
| Memberships / subscription packages | Feature 10 (subscribe) | — | Feature 5 (configure) |
| AI skincare routine builder | In chat + treatment tracker | AI Copilot generates + approves | — (derm-primary, aesthetic has lite version) |
| Prescription OCR | Feature 5 (adherence auto-parsed) | Feature 5 (scan + parse) | — |
| Review/reputation layer | Feature 11 (1-tap review + points) | — | Feature 9 (manage + respond) |
| Dental tooth chart | — | — | — (dental vault only) |

---

## MVP vs V2 split

### MVP (ship in 8–10 weeks of build)
All features above EXCEPT the ones marked V2 below.

### V2 (next phase)
- AI skincare routine builder (aesthetic-lite, derm-full)
- Voice notes in chat
- Tele-consultation video
- WhatsApp Business API bridge
- SIPE e-prescription
- Custom app store listing per clinic
- Clinic-to-clinic referral network
- Multi-location support for chains

---

## Tech decisions locked for MVP
- **Monorepo** (Turbo) with `apps/client`, `apps/doctor`, `apps/admin`, `packages/ui`, `packages/db`
- **Multi-tenant Supabase** with row-level security by `clinic_id`
- **Theme tokens** in a `packages/theme` so white-labeling = swap tokens
- **i18n** from day 1 (RO default, EN fallback, HU stub)
- **PWA** for client (installable, push-capable), not native MVP
- **Real Stripe** integration (test mode) for subscriptions + payouts
- **Supabase Auth** with OTP phone (Vonage) + magic link email

---

## Questions for approval

1. **Green light on this feature scope?** If anything's missing or should be cut, say now — cheaper to edit markdown than code.
2. **MVP vs V2 split OK?** Anything in V2 you want pulled into MVP?
3. **Brand direction for aesthetic template default theme**: "quiet luxury" warm champagne/cream? Or something else (clean clinical white, black/gold, soft blush pink)?
4. **Real clinic to model after?** If you know a Bucharest aesthetic clinic we can study (site, Instagram, vibe), share — helps tune the default brand.
5. **Name for the template product?** "Niche Society Aesthetic" or a cleaner name for clinic-facing ("Glow", "Cura", "Atelier", etc.)?
6. **Start-build trigger**: when you say "go", I'll scaffold the monorepo, design tokens, and the patient home screen first (the peak-moment screen).
