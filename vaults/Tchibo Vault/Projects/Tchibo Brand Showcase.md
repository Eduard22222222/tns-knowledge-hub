---
tags: [project, active, tchibo, website, multi-brand, coffee]
client: Tchibo Coffee Service Romania
status: deployed
created: 2026-04-29
---

# Tchibo Brand Showcase

**Client:** Tchibo (https://tchibo.com / https://www.tchibo.ro/)
**Status:** Deployed to production at https://tchibo-showcase.netlify.app
**Dev server:** http://localhost:8090/ (port 8090)
**Codebase:** `C:\Users\adumi\OneDrive\Desktop\claude\tchibo-showcase\`
**Vault:** `C:\Users\adumi\OneDrive\Documents\Tchibo Vault\`

## About Tchibo

Founded 1949 in Hamburg by Max Herz and Carl Tchilinghiryan. Family-owned coffee giant: 4th largest roaster globally, ~3.5B EUR revenue. Known for innovative weekly product themes ("Jede Woche eine neue Welt") combining coffee + non-food retail. Three Romania-relevant brand pillars: Tchibo (everyday premium), Davidoff Café (luxury collaboration with Davidoff fragrance house, made under license by Tchibo since 2003), Eduscho (heritage Austrian/budget mainstream brand absorbed by Tchibo in 1997).

## The 3 brands

### 1. Tchibo (flagship — everyday premium coffee)
- **Colors:** rich espresso brown `#3E2723` → `#6F4E37`, gold accent `#D4AF37`
- **Tagline:** "O cafea aleasa cu pasiune, in fiecare ceasca."
- **Score:** 4.8/5
- **Products:** Tchibo Barista Caffè Crema 1kg, Tchibo Barista Espresso 1kg, Privat Kaffee African Blue 500g

### 2. Davidoff Café (luxury — premium connoisseur)
- **Colors:** deep gold `#8B6914`, black accent `#1A1A1A`
- **Tagline:** "The good life. In every cup."
- **Score:** 4.9/5
- **Backstory:** Coffee line under license from Zino Davidoff Group, manufactured by Tchibo since 2003. Positioned as premium luxury experience parallel to Davidoff cigars/fragrances.
- **Products:** Davidoff Espresso 57 Intense, Davidoff Café Fine Aroma, Davidoff Rich Aroma

### 3. Eduscho (heritage — accessible mainstream)
- **Colors:** cherry red `#C41E3A`, sunshine yellow `#FFC107`
- **Tagline:** "Cafeaua zilei tale."
- **Score:** 4.6/5
- **Backstory:** Founded 1924 in Bremen by Eduard Schopf. Acquired by Tchibo in 1997. Strong heritage in Austria/Germany, sold in Romania as Tchibo's value-friendly mainstream line.
- **Products:** Eduscho Gala Caffè Crema, Eduscho Gala Mild & Sanft, Eduscho Wiener Extra

## Content delivered

- 9 product cards with real photos (3 per brand)
- 15 authentic Romanian reviews (premium-tone for Tchibo, sophisticated for Davidoff, family-friendly for Eduscho)
- 9 competitions (Vienna trip, Hamburg coffee tour, Davidoff cigar lounge experience, Eduscho family weekend, espresso machines, etc.)
- 18 recipes (6 per brand) — flat white, espresso macchiato, Davidoff truffes, Eduscho cookies, etc.
- **Official brand logos** pulled from Wikimedia/companieslogo and auto-cropped: Tchibo gold script, Davidoff black wordmark, Eduscho red/yellow block
- **Hero**: mobile gets an autoplaying muted Pexels coffee video (women sharing coffee, ID 6912128, 720×1280, 4 MB, looped, `playsInline`) with the steaming-mug-by-window photo as poster fallback. Desktop keeps the still photo. The brand-light upper-left of both video and photo gives the gold Tchibo logo high contrast.
- White hero card slimmed (max-width 340px, h1 21px, p 12.5px, 48px brand badges, 12.5px CTA) and pushed down (paddingTop 240) so the video fills the upper third
- Hero copy: `Intra in comunitatea Tchibo` + `Imparte-ti parerea si primeste acces la competitiile noastre cu premii.`
- Primary CTA `CREEAZA CONT GRATUIT` → `/auth`
- Mobile hero: vertically centered card, tight 36px Tchibo logo top-left, larger Conectare button top-right
- Brand recenzii pages (Tchibo / Davidoff / Eduscho): logo on top + headline + paragraph spanning the full width on mobile (no more squished column)
- SPA `_redirects` rule deployed so all client-side routes return 200
- Supabase hardened stub-client (offline mode, cross-tenant safe)

## Deployment

- **Production URL:** https://tchibo-showcase.netlify.app
- **Site name:** tchibo-showcase
- **Build:** Vite + React 18, 799 KB JS / 75 KB CSS / gzipped 222 KB
- **Hosted on:** Netlify (free tier, custom Supabase project pending sign-off)

## Open TODOs

- [ ] Fresh Supabase project (~$10/mo) once client signs off
- [ ] ConsumerVoice form IDs per brand (currently shared `f-168782`)
- [ ] Code-split bundle (chunk warning at 500 KB threshold)
- [ ] Custom domain mapping if needed (e.g. tchibo.consumervoice.ro)
- [x] Davidoff logo refinement — replaced with official Wikimedia wordmark, auto-cropped
- [x] Hero photo with bright top-left for logo contrast
- [x] Recenzii hero stacking on mobile

## Key decisions

- Tchibo is the parent brand and main point of contact (controls Davidoff license + Eduscho heritage line)
- Hero leads with Tchibo logo prominently, but each brand page uses its own brand identity
- 3 brand badges in 104×104 circles on hero (Tchibo, Davidoff, Eduscho)
- Color palette: warm espresso/coffee tones to match the FMCG coffee category
- "Cafea pasionata din 1949" anchors the heritage angle in the page title
- Brand voices differ: Tchibo = aspirational-everyday, Davidoff = sophisticated-luxury, Eduscho = warm-family

## Related files

- `proposal-screenshots/tchibo_ss_*.png` — mobile screenshots for proposal
- `build_tchibo_proposal.py` — proposal PDF generator (to be created)
- `ConsumerVoice_Tchibo_v8.pdf` — final proposal output
