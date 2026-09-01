# Intersnack → Hula Hoops Platform

**Originally** a 3-brand Intersnack showcase (Chio/Tyrrells/Pom-Bär, "Idei de servire" instead of Rețete). **REBRANDED 2026-06-11** to a SINGLE-BRAND **Hula Hoops (by Chio)** consumer platform.

- **Strategic framing (user):** the *platform* (Consumer Voice style: recenzii + idei de servire + concursuri) is the product being PITCHED; the wedge is an **in-store Hula Hoops activation** — shopper buys Hula Hoops → spins wheel / registers bon → **leaves a review on the platform**. In-store → UGC reviews funnel is the value shown to the brand.
- **Live:** https://intersnack-showcase.netlify.app (Netlify siteId 5a3df62e-8b45-4872-a7e1-064b58b3beae — same site, redeployed). **Offline demo** (Supabase stub, no login). Code: Desktop/claude/intersnack-brand-showcase/.
- Hula Hoops IS real in RO (Chio/Intersnack, made Ghimbav/Brașov), 70g, flavours **Sare de mare / Cașcaval / Barbecue & miere**, ring-shaped, baked not fried.

## Identity
- Red `#DA1F2E` (dark `#9E1320`) + yellow `#FFC72C`. Font Montserrat (kept). index.css tokens were already red/yellow (Chio) — minimal change.
- Logo: cropped the gold-ring "HULA HOOPS" badge from a KV + PIL flood-fill red→transparent → `src/assets/hulahoops-logo.png`. Favicon = ring badge on red square (public/favicon*.png).

## Assets
- **Hero:** Higgsfield football-night-togetherness VIDEO (friends celebrating a match, bowl of Hula Hoops; generic football, NO FIFA/World Cup marks — user chose brand-safe) → hero-hulahoops.mp4 + hero-hulahoops-poster.jpg.
- **Real packshots** from RO retailers (freshful/auchan/mega-image): pack-hh-sare.jpg (blue), pack-hh-cascaval.jpg (yellow), pack-hh-bbq.jpg (maroon). (AI-generated red packs were WRONG — user said "look on the web how their products look"; real ones are blue/yellow/maroon.)
- **Campaign creatives** from `intersnack-activation-assets/` (Wave Advertising Group pitch, README has full brief): camp-toamna-kv.jpg + camp-toamna-stand.jpg; camp-invarte-kv.jpg (FINAL=v2) + camp-invarte-stand.jpg. Optimized 8-9MB PNG → ~400-580KB JPG.
- **Idei de servire** (nanobanana): idea-hh-meci/party/movie.jpg.

## 2 Campaigns (Competitii.tsx)
1. **Trăiește toamna și distrează-te cu Hula Hoops!** — Carrefour, 19-20 sept 2026, premii instant via Roata Distracției. Prizes: Card Cadou Carrefour 50/20 RON, geantă tote, pălărie bucket, breloc, produse HH. Min 15 RON.
2. **Învârte distracția pe degete!** — național, Iulie–August 2026, trageri săptămânale. Prizes 5× boxă / 20× căști / 100× cinema. Min 2 produse / 10 RON.
Both end with "lasă o recenzie" → CONSUMERVOICE_URL https://feedback.consumervoice.eu/f-168782 (the funnel).

## Structure (single brand, RO)
- App routes collapsed to /, /recenzii, /competitii, /retete, /auth, /admin. Deleted all Chio*/Tyrrells*/Pombar* per-brand pages.
- Chrome (PillNav, BrandsSection, BrandCard, CTASection, ScoreSection, Footer, Auth) rebranded via subagent. HeroSection + Competitii + Recenzii(new) + Retete handcrafted.

## Ops notes
- node_modules was a broken 6.9M partial (no vite bin) → **junctioned to vici-platform/node_modules** (`mklink /J`), same stack, build works.
- Vault: OneDrive/Documents/Intersnack Vault/Projects/Hula Hoops Traieste Toamna Activation.md + Obsidian Vault/Projects/Creatives - Hula Hoops (Intersnack).md.
- NEXT if wanted: live backend (Supabase) + functional bon-registration/login like Albalact; replace CV placeholder form with real Hula Hoops CV form; prune old chio/tyrrells/pombar assets.
