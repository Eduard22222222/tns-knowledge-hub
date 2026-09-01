---
tags: [project, active, tchibo, campaign, gameon, antifraud, supabase]
client: Tchibo Coffee Service Romania (Cafissimo)
status: deployed-demo
created: 2026-05-29
---

# Tchibo GAME ON — Campaign Platform (BUILD)

Real, working platform (not mockup) for the Cafissimo "GAME ON" receipt-upload promo.

- **Live:** https://tchibo-gameon.netlify.app
- **Codebase:** `C:\Users\adumi\OneDrive\Desktop\claude\tchibo-gameon\`
- **Netlify site:** tchibo-gameon (project fe53e8fa-3cbd-41ee-be31-37636221dc52)
- **Supabase:** project `ipuracewahosndvzsgvr` (eu-central-1, Frankfurt — GDPR), $10/mo, paid by Eduard
- **Stack:** Vite + React 18 + Tailwind + shadcn/ui + Supabase (auth, Postgres, private storage)

## Admin demo credentials
- URL: https://tchibo-gameon.netlify.app/auth → /admin
- Email: `office.the.niche.society@gmail.com`
- Password: `GameOn2026!`
- (Created directly in auth.users + bcrypt; trigger auto-promotes this email to `admin`.)

## Routes
- `/` campaign landing (KV declination — GAME ON, dark gaming + gold/cream/red)
- `/inscriere` receipt-upload entry flow (participant form + file upload + GDPR + antifraud on submit)
- `/auth` admin login
- `/admin` moderation dashboard (protected, admin-only)
- SPA `_redirects` so all routes 200

## Antifraud engine (in-browser, free) — `src/lib/antifraud/index.ts`
- **dHash** perceptual hash (duplicate detection, Hamming distance ≤6)
- **EXIF/metadata** analysis via `exifr` (editing software tags, missing-metadata heuristic)
- **ELA** (Error Level Analysis) via canvas recompress+diff (edited-region heuristic)
- **AI-generated** detector: pluggable slot (HF Inference API `Organika/sdxl-detector` when `VITE_HF_TOKEN` set; heuristic stub in demo) — flag, not verdict
- **Duplicate check** at submit via SECURITY DEFINER RPC `receipt_exists()` (anti-enumeration: returns only boolean)
- Risk scoring 0..100 → auto approve / review / reject

## DB schema (migrations applied)
- `profiles` (admins; trigger auto-creates, auto-promotes owner email)
- `entries` (participant + receipt + phash + risk_score + fraud_signals jsonb + status + winner/reserve flags)
- `moderation_log` (audit trail)
- private `receipts` storage bucket (anon insert; admin read via signed URLs)
- **RLS:** anon may INSERT entries (consent required) + upload receipts; only admins read/moderate. Admin check via `is_admin()` SECURITY DEFINER fn (avoids the classic profiles-policy infinite recursion — fixed during build).
- 12 seeded demo entries (6 approved, 3 review, 2 rejected, 1 pending) with realistic fraud signals.

## Admin dashboard features
- Stat cards: total / validate / de verificat / respinse / semnale fraudă
- Entry queue: receipt thumbnail (signed URL) + participant + extracted data + risk badge + signal badges (Duplicat / EXIF suspect / ELA editare / Posibil AI / Curat) + status
- Approve / review / reject actions (logged to moderation_log)
- Search + status filters
- CSV weekly report export
- Winner draw tool (6 winners + 6 reserves from approved entries, auditable random)

## Security posture (matches their tender emphasis)
- Supabase EU region (GDPR data residency)
- RLS 100% on all tables; anti-enumeration RPC for dup check
- Private receipt storage + signed URLs (admins only)
- Cross-tenant guard in client.ts (refuses foreign Supabase refs — Macromex-incident hardening)
- `.env` gitignored + `.env.example`

## Screenshots (for cotatie)
`proposal-screenshots/gameon_landing_desktop.png`, `gameon_landing_mobile.png`, `gameon_inscriere_mobile.png`, `gameon_admin_desktop.png`

## TODO / next
- Wire real HF token for AI-gen layer (currently heuristic stub)
- Optional OCR (Azure receipts / Tesseract) for auto-extraction — add-on
- Integrate under client domain (tchibopromo.ro) when they sign off
- Disable open admin self-registration before handover (currently signup allowed; restrict to invite once live)

## 2026-05-29 — Production hardening (server-side source of truth)

- **OCR (Tesseract.js, client)**: reads receipt → autocomplete (nr/dată/total/magazin) + content checks (Auchan + Cafissimo present?) + reconciliation (typed number vs photo). Music-ticket test now auto-rejected (no Auchan/Cafissimo → risk 65).
- **No auto-approve**: clean image → "review" (never auto-validated); only fraud auto-rejects.
- **Edge Function `submit-entry`** (Deno, verify_jwt=false, ACTIVE) = SERVER-SIDE SOURCE OF TRUTH:
  - server-side dedup (RPC), AI-gen via HF Inference API (`Organika/sdxl-detector`, reads `HF_TOKEN` secret, graceful fallback), authoritative risk/status recompute, insert via service role.
  - Client signals are inputs, not verdicts.
- **RLS tightened**: dropped anon INSERT on `entries` — the Edge Function (service role) is the SOLE writer. anon can still upload the receipt image to storage.
- **Admin invite-only**: Auth page is login-only (register flow removed); admins provisioned manually.
- Verified live end-to-end via Edge Function: music ticket → rejected; valid receipt → review.

### Keys to set (Supabase Dashboard → Project Settings → Edge Functions → Secrets)
- `HF_TOKEN` = free Hugging Face token (enables real AI-gen detection). Without it, AI-gen falls back to heuristic.
- (optional, paid) Azure Document Intelligence for server-side OCR accuracy — not yet wired in the function; client Tesseract OCR is the current OCR layer.

## 2026-05-29 — HF_TOKEN set, AI-gen detection LIVE
- HF token generated (Eduard020504 HF account, "tchibo-gameon" Read token) and stored as Supabase Edge Function secret `HF_TOKEN` (set via dashboard, never exposed).
- Edge Function v3: AI-gen via HF Inference router (`router.huggingface.co/hf-inference/models/Organika/sdxl-detector`, fallback to classic endpoint) + logging.
- Verified: submission returns `ai_checked_server: true` → real model ran server-side. Antifraud fully operational end-to-end (dedup + OCR content + reconciliation + EXIF/ELA + real AI-gen + authoritative server scoring).
