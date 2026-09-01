---
aliases: [Aesthetic Platform, TNS Aesthetic, Niche Society Aesthetic]
tags: [project, tns, niche-society, saas, white-label, aesthetic]
status: brainstorming
vertical: aesthetic
---

# Niche Society — Aesthetic Platform

White-label SaaS template for aesthetic / cosmetic medicine clinics in Romania. First of 3 verticals under the [[The Niche Society]] clinic platform initiative.

## Context
- Parent initiative: [[The Niche Society]]
- Sibling verticals: [[Niche Society Dermatology Platform]], [[Niche Society Dental Platform]]
- Started: 2026-04-17
- Phase: Feature outline written, awaiting approval to build
- Related prior work: [[AestheticLabs Proposal]] — past proposal in this space

## The product (3 interfaces)
1. **Client app** — patient: chat, adherence, rewards, product marketplace, referrals, memberships, 1-tap Google reviews
2. **Doctor app** — AI-drafted inbox, patient dashboard, adherence tracking, product recommendations with affiliate earnings
3. **Admin panel** — clinic owner: branding, staff, loyalty/referral/membership config, reports, GDPR center

## Core differentiators
- Apple-like minimalism + ethical dopamine loops (streaks, tiers, variable rewards)
- Product affiliate marketplace (La Roche-Posay / CeraVe / etc.)
- Stripe-powered membership subscriptions ("Glow Club")
- 2-level referral program (capped for RO legal compliance)
- GDPR-first architecture (EU hosting, DPA per clinic)

## Tech stack
- Turbo monorepo (apps/client, apps/doctor, apps/admin)
- Next.js 15, React Native (patient mobile later)
- Supabase EU region
- Tailwind + Radix + React Bits + Framer Motion
- Claude Sonnet 4.6 for AI copilot

## Dedicated working vault
Full feature specs, UX research, design system, user flows, and components live in a dedicated Obsidian vault (open separately):
`C:\Users\adumi\OneDrive\Documents\Niche Society - Aesthetic Vault\`

Key docs:
- `01-Features/MVP-feature-outline.md` — full spec across 3 interfaces
- `03-UX-Research/dopamine-and-apple-minimalism.md` — research + React Bits picks

## Links
- [[The Niche Society]]
- [[Niche Society Dermatology Platform]]
- [[Niche Society Dental Platform]]
- [[Projects MOC]]
- [[AestheticLabs Proposal]]
