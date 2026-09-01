# Tchibo GAME ON — Campaign Platform (Tailor Made tender)

Receipt-upload promo platform for Tchibo **Cafissimo** "GAME ON" campaign (buy Cafissimo at Auchan → upload fiscal receipt → win gaming prizes). Period 17.06–17.07.2026. SEPARATE project from the `tchibo-showcase` brand reviews site.

- **Live:** https://tchibo-gameon.netlify.app · **Code:** `Desktop/claude/tchibo-gameon/`
- **Netlify:** site tchibo-gameon (fe53e8fa-3cbd-41ee-be31-37636221dc52)
- **Supabase:** project `ipuracewahosndvzsgvr` (eu-central-1, GDPR), $10/mo PAID by Eduard (went all-in, real backend — not mock)
- **Admin demo login:** office.the.niche.society@gmail.com / `GameOn2026!` (created via SQL+bcrypt, trigger auto-promotes to admin)
- **Stack:** Vite+React+Tailwind+shadcn+Supabase (auth, Postgres, private `receipts` storage)
- **Antifraud (in-browser, free):** dHash dedup + EXIF (exifr) + ELA (canvas) + AI-gen pluggable (HF `Organika/sdxl-detector` when VITE_HF_TOKEN set, heuristic stub now) + risk scoring → approve/review/reject. Dup check via SECURITY DEFINER RPC `receipt_exists()` (anti-enumeration). Chose in-house pHash+ELA+EXIF over GitHub research models (most have NO license = can't reuse commercially; heavy PyTorch needs GPU). Comparison doc in vault.
- **Admin dashboard:** stat cards, entry queue w/ receipt thumbnails + fraud signal badges + risk score, approve/review/reject (audit-logged), search/filter, CSV export, winner+reserve draw tool. 12 seeded demo entries.
- **RLS gotcha fixed:** profiles "admin read all" policy caused infinite recursion → fixed with `is_admin()` SECURITY DEFINER fn (applies to entries/moderation/storage policies too).
- **Scope (per Eduard):** TNS does STRICTLY the platform + online. OUT: notar/regulament, prize purchase/delivery, PV/taxes, physical winner contact, the 2 tender track-record numbers. **Price quoted: €800** (platform + hosting during campaign); OCR/AI-gen automation = add-on.
- **Vault:** `Documents/Tchibo Vault/Projects/` — Build.md, Tender Plan.md, Cotatie & Raspuns Tender (fara pret).md, Antifraud Detector Comparison.md
- Web design built to Vercel Web Interface Guidelines (pulled via web-design-guidelines skill).
- TODO before handover: restrict admin self-signup to invite-only; wire real HF token; optional OCR add-on; integrate under tchibopromo.ro on sign-off.
