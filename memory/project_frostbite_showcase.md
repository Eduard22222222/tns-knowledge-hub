# FrostBite Consumer Voice Showcase

**Fictional brand demo** (like PetVia — no real client). "FrostBite" = invented premium frozen-food brand.

- **Origin:** built in Lovable (project `ef61a157-121e-4d5a-bc93-cc89cc83e28c`), synced to GitHub `Eduard22222222/demo-platform`, cloned locally 2026-05-18.
- **Codebase:** `C:\Users\adumi\OneDrive\Desktop\claude\frostbite-platform\`
- **Live:** https://frostbite-showcase.netlify.app (Netlify site `frostbite-showcase`, project ID `4fd8532c-db9f-4126-8709-1c362272d007`)
- **Vault:** `C:\Users\adumi\OneDrive\Documents\Frostbite Vault\`
- **Stack:** Vite + React + shadcn + Supabase. Cloned from the Macromex base — still ships Edenia/Corso/Lastrada sub-brand pages from that lineage.
- **Supabase:** own isolated project `bwnockrmyvvhlntkiypm` (Lovable auto-provisioned, distinct from Macromex `vscvgczggesdyfunialz` — no leak). `.env` was git-tracked by Lovable; hardened locally (.gitignore + .env.example + git rm --cached), only public anon key present so demo deploy is safe.
- **SPA:** `public/_redirects` added (`/*  /index.html  200`).
- **QR:** in master set `qr-codes/qr_frostbite.png` + `Consumer_Voice_QR_Sheet.pdf`, accent `#1B6CA8`.
- No proposal PDF yet (no real client). Generate only if pitched as generic Consumer Voice demo.
- **2026-05-18 visual upgrade (single-brand, kept simple — no sub-categories):** stripped all Edenia/Corso/Lastrada pages+routes; rebuilt HeroSection to Tchibo/PetVia pattern (cinematic nanobanana frozen-food bg, dark overlay, "Intră în comunitatea FrostBite", CREEAZĂ CONT GRATUIT CTA); 10 nanobanana assets (hero, 3 FrostBite-branded product packs, 3 matching recipe photos, 3 competition covers); Recenzii/Retete/Competitii all use generated imagery; Auth de-Macromex'd. Redeployed, all routes 200. Routes now only: / /recenzii /competitii /retete /auth /admin.
