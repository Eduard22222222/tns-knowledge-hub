---
name: the-niche-society-project
description: "White-label SaaS platform for RO niche clinics (derm/aesthetic/dental/wellness) with 3 interfaces + MLM/loyalty layer, currently in brainstorming phase"
metadata: 
  node_type: memory
  type: project
  originSessionId: 8a63e47c-d558-4ada-99d0-941df3081939
---

# The Niche Society

**What:** White-label SaaS platform for Romanian clinics — dermatology, aesthetic, dental, wellness (maybe stem-cell if real).

**Three interfaces:**
1. Client/patient app — chat with doctor, adherence tracking, product recs, loyalty/rewards
2. Doctor app — inbox, AI copilot, adherence dashboard, product recs
3. Admin (clinic owner) app — branding, staff, pricing, MLM/referral config, reporting

**Two core layers:**
- Care layer (chat, adherence, AI doctor copilot, product recommendations)
- Growth layer (MLM-style referral capped at 2 levels + loyalty points + prizes)

**Status:** Phase 1 brainstorming started 2026-04-17. Vault created at OneDrive/Documents/The Niche Society Vault/ with subfolders 01-Brainstorming through 10-Notes-Daily.

**Key constraints / decisions made:**
- Medical data = GDPR Article 9 special category → EU hosting mandatory, Supabase EU, DPA per clinic
- MLM capped at 2 levels with points/treatments (cash is legally risky in RO medical context, Law 363/2007 pyramid-scheme rules + Codul Deontologic)
- AI is assistive only — doctor approves all medical-adjacent outputs, AI never diagnoses or prescribes
- Tech stack leaning Supabase + Next.js + React Native (consistent with Eduard's other projects)

**MVP direction (Eduard to confirm):** Start with aesthetic dermatology vertical, Bucharest-first, Founders tier of 5 free/cheap clinics before paid rollout.

**2026-04-17 update**: Decision to build 3 white-label templates (Aesthetic, Dermatology, Dental) — aesthetic first. Created 3 separate child vaults at OneDrive/Documents/Niche Society - Aesthetic Vault/, .../Dermatology Vault/, .../Dental Vault/ — each cross-linked to parent for Obsidian graph visibility. Full MVP feature outline written in Aesthetic vault at 01-Features/MVP-feature-outline.md. Eduard's flagged must-haves: product affiliate marketplace, membership subscriptions (Stripe), AI skincare routine builder (derm-primary), prescription OCR, review/reputation layer with points reward, dental visual tooth chart. Design direction: Apple-like minimalism with ethical dopamine triggers (variable rewards, streaks, tier status, peak-end moments). Tech: Turbo monorepo + Next.js + Supabase EU + Tailwind + Radix + React Bits + Framer Motion. **Waiting for Eduard's approval on feature scope before scaffolding code.**

**2026-07-06 update — LinkedIn page LIVE**: Company page created via claude-in-chrome browser automation: **linkedin.com/company/the-niche-society** (ID 135305567), admin = Eduard's personal account (Google SSO login edumitriu04@gmail.com). Saved: RO tagline, full RO About (~1,220 chars), IT Services and IT Consulting, 2-10 employees, Privately Held, founded 2023, website, all 15 specialties. NOT done: logo upload (claude-in-chrome file_upload only allows session-shared files — Eduard uploads `niche-leadpages/assets/tns-logo.png` manually), banner, seed posts. Instagram account NOT created (account creation prohibited for Claude) — full IG kit ready in vault note 05-instagram-page.md. **LinkedIn gotcha learned**: new company pages throw a false "Another admin is trying to make changes" error on save; fix = fresh reload + ONE small save per page load (form_input + find refs, not coordinates).

**2026-07-03 update — Branding & Social Media node**: New vault folder `11-Branding-Social-Media/` covers TNS **the brand/agency** in online (not just the clinic SaaS): LinkedIn company page draft (01), Eduard personal profile optimization (02 — **pending: Eduard must provide his current LinkedIn URL/text for the precise diff-style corrections**), posting engine "motor de postări" modeled on GoaMasaj's but for the AI/B2B niche (03 — 3 posts/week Tue-Thu 8:30-9:30 from personal profile, 5 pillars P1-P5, Claude batch-drafts Fridays), and a 12-post month-1 backlog (04). Hard constraint baked into the MOC: client demos are NDA — only fictional brands FrostBite/PetVia shown publicly; GoaMasaj/FOX mentions need client consent.

**Why:** Fragmented RO clinic market, every clinic runs on WhatsApp, no one solves GDPR + referral tracking + adherence in one branded package. Secondary revenue from product affiliates + MLM fulfillment fees.

**How to apply:** When Eduard mentions Niche Society or clinic platform, load the vault. Next phase = market research + MVP scope. Questions pending in 01-Brainstorming/01-questions-for-next-session.md.
