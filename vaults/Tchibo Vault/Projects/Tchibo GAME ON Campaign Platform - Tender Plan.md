---
tags: [project, planning, tchibo, campaign, tailor-made, antifraud, tender]
client: Tchibo Coffee Service Romania (via Cafissimo)
status: planning
created: 2026-05-28
quote_due: vineri (prima parte a zilei)
---

# Tchibo "GAME ON" — Tailor Made Campaign Platform (Tender)

Separate, NEW project (confirmed) — distinct from the existing `tchibo-showcase` brand showcase.
Decision log: new repo + standalone deploy first, **integrate into client's own domain/site later**; for now we keep it on our infra.

## The campaign (from KV + brief)

- **Name / KV:** "GAME ON — cu o simplă apăsare de buton" · Tchibo **Cafissimo** (capsule coffee, gaming theme)
- **Mechanic:** Cumpără orice produs Cafissimo → **Înscrie documentul fiscal** pe tchibopromo.ro → Câștigă
- **Retailer:** single retailer (KV shows **Auchan**)
- **Period:** 17.06.2026 – 17.07.2026
- **Prizes (max 10):** 1× monitor gaming, 2× scaun gaming, 3× căști gaming (KV shows 6; brief says max 10) — total est. value 8.750 lei TVA inclus
- **Hosting:** client says "pagina de hosting exista" → eventually deployed under their domain; we build the page from the KV declination

## SCOPE — strict split (per client owner decision 2026-05-28)

### ✅ IN — our scope (platform + everything online)
1. **Campaign landing page** — declination of the GAME ON KV (responsive, mobile-first)
2. **Entry flow** — receipt/fiscal-document upload + participant data form (GDPR consent)
3. **Entries database** — store entries, receipts, participant data (EU region)
4. **Antifraud engine** (layered — see below) + **human review queue**
5. **Admin dashboard** — manage entries, see fraud flags, filter/search
6. **Winner draw tool** — random extraction of winners + reserves (online/software part)
7. **Weekly reporting** — export of entries + flagged/special (fraud) situations
8. **Security hardening** — auth, RLS, rate-limiting, anti-enumeration, GDPR data handling

### ❌ OUT — client's responsibility (NOT ours)
- Regulament redactat/autentificat notar + împuternicire
- Achiziția premiilor (Tchibo & non-Tchibo / vouchere)
- Livrarea premiilor + recepție
- PV predare premii + documente taxe pt premii >600 lei TVA
- Contact & validare fizică a câștigătorilor (logistica offline)
- Track-record tender answers (clienți 2025 / campanii 2025 / antifraudă istoric) — client provides

> Note: winner *contact & validation* offline is theirs; the *draw mechanism* (software) is ours. Confirm boundary with client.

## Antifraud architecture (layered + human-in-the-loop)

Decision: **stratificat + review uman** (not full-auto). Honest stance: no single AI tool is a silver bullet; automation catches the cheap 80%, humans adjudicate flags.

| Fraud vector | Detection |
|---|---|
| Duplicate receipt (same bon, multi-upload / multi-user) | OCR → extract fiscal nr + date + store + total → DB dedup; + perceptual hash (pHash) on image |
| Photoshopped / edited receipt | ELA (error level analysis) + EXIF/metadata check + copy-move forgery |
| AI-generated / fake receipt | AI-image classifier (Sightengine/Hive/open model) — **FLAG only, not verdict** (reliability caveat stated to client) |
| Screen re-photograph (poză de pe ecran) | moiré / screen-capture heuristics |
| Non-qualifying purchase (no Cafissimo) | OCR line-items → SKU/keyword match |
| Velocity abuse (mass entries) | rate-limit per account/IP + entry caps per fiscal doc |

**Pipeline:** upload → OCR (cloud vision: Google Vision / AWS Textract / Azure Doc Intelligence) → automated checks → score → auto-accept / auto-reject / **flag→human queue**. Flags surface in weekly report ("evidentierea situatiilor speciale").

## Tech stack (proposed)
- Vite + React (page) or Next.js if SSR/SEO needed for the microsite
- Supabase EU (auth, Postgres, storage for receipts) — own isolated project (per isolation policy)
- OCR: cloud vision API (cost per scan — line item in quote)
- Antifraud: dedup + pHash in-app; ELA/forgery as service or library; AI-gen via 3rd-party API (flag)
- Netlify/Vercel deploy now → migrate under client domain later
- Security: RLS 100%, Supabase auth rate-limit, app-level rate-limit, anti-enumeration, signed upload URLs

## Quote structure (online scope only — rates TBD by owner)
Effort-based line items to price:
1. Page creation from KV declination (design + build, responsive)
2. Entry + receipt-upload flow + GDPR consent
3. Entries DB + admin dashboard
4. Antifraud engine (OCR integration + dedup + pHash + tamper/AI flag + review queue)
5. Winner draw tool (winners + reserves)
6. Weekly reporting/export
7. Security hardening + GDPR + hosting/setup
8. Recurring: OCR API cost per scan + hosting + Supabase (monthly during campaign)
9. Campaign-duration support/monitoring (5 weeks: 17.06–17.07)

## Open questions for the owner (needed to finalize quote by Friday)
- [ ] Pricing model: fixed package vs day-rate? our day/package rate?
- [ ] Expected entry volume (drives OCR API cost + moderation effort)
- [ ] KV source file (editable/hi-res) for page declination — where?
- [ ] Do we do the weekly report + draw, or just expose data for them? (assumed ours)
- [ ] Notary/regulament: confirmed OUT (client) — yes?
- [ ] Custom domain/subdomain target on their side (for later integration)
