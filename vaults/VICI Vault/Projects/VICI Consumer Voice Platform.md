---
tags: [project, active, vici, viciunai, consumer-voice, brand-platform, seafood, surimi, gyoza]
client: Viciunai Group / VICI (Romania — Viciunai Bucharest SRL)
contact: Al Kamara (CEO & Business Development Executive) — al_kamara@consumervoice.eu
status: research / setup
created: 2026-06-XX
---

# VICI — Consumer Voice Brand Platform

Brand platform (Consumer Voice style — like Macromex/Tchibo) for **VICI by Viciunai Group**, with accurate **products, competitions and recipes**, using the default Consumer Voice product questionnaire.

## The brief (from Outlook)
- **Source:** email from Al Kamara, "FW: Looking for In-Store Sampling Agency Partnership in Romania" (Wed 03.06.2026), attachment `VG presentation EN short'26.pptx` (VIČIŪNAI GROUP deck) + photo of a VICI GYOZA in-store sampling stand at retail.
- **Ask (our scope):** brand platform with accurate Competitions, Products and Recipes; default Consumer Voice questionnaire for the products. (In-store sampling partnership is the wider context.)

## About the client (from deck + research)
- **VIČIŪNAI GROUP** — Lithuanian group, established **1991**; global **surimi market leader** + top European fish/seafood producer.
- Scale: sales ~**110,329 t**, **4,400+** employees, products in **70+ markets**.
- Retail partners: Auchan, Carrefour, Tesco, Metro, Rewe, IKEA, Aldi, Esselunga, Dia, Groupe Casino, Burger King, Nestlé, McCain, Hortex, etc.
- **Romania:** S.C. **Viciunai Bucharest S.R.L.** (Comuna Afumați, Bucharest–Urziceni). Represents **VICI** + **Columbus** trademarks. Tagline: **"Tasty instantly!"**
- Product lines in deck: **Classic** (surimi, fish, fish sticks, salmon, herring, mackerel, seafood), **Premium** (gyoza, calzone, Atlantic salmon, sushi-style), **Bio** (gyoza vegetal/beef/pork). ~100 new products/year, ~3000 SKUs total.

## Accurate product range (research — vici.eu)
**Surimi:**
- Snow crab surimi sticks
- Crab-flavoured surimi sticks (the classic)
- Surimi Kama (peelable texture — salads/sandwiches)
- Mini surimi sticks (on-the-go)
- Surimi crab claws (with bamboo stick)
- Surimi Royale chunks

**Gyoza / Dumplings:**
- VICI Gyoza — crispy dumplings (e.g. chicken & black fungus; vegetal Bio line)

**Fish & seafood:**
- Frozen fish fillets, breaded fish
- Smoked salmon, salmon fillets
- Marinated seafood cocktail

## Accurate recipes (research — vici.eu/recipes)
- Gyoza in Asian-style sauce
- Nutritious salad with Surimi Royale chunks
- Surimi toastie with avocado & quail egg
- Summer rolls (with surimi)
- Japanese-style surimi seafood sticks salad
- Seafood stick tacos

## Default Consumer Voice product questionnaire (per product review)
1. Overall rating (1–5 stars)
2. Taste / flavour (1–5)
3. Quality of ingredients (1–5)
4. Texture (1–5)
5. Packaging & convenience (1–5)
6. Value for money (1–5)
7. Would you recommend it? (Yes / No)
8. Would you buy it again? (Yes / No)
9. Free-text review
(+ verified-purchase flag via receipt where applicable)

## Brand palette (to confirm from KV/site)
- VICI red `#E2001A` (logo), navy/teal from Viciunai branding, white. (Pull exact from logo asset before build.)

## Next steps
- [ ] Confirm scope with Eduard: reviews-only showcase vs. full platform (competitions + recipes + reviews) like the others
- [ ] Pull VICI logo + product imagery (site / generate)
- [ ] Define 3 categories for the showcase (e.g. Surimi / Gyoza / Pește & Somon) — mirror the 3-brand showcase architecture
- [ ] Build platform (clone showcase template), deploy, dedicated Supabase if signed off
- [ ] Proposal PDF (Consumer Voice style)

## Build progress (checkpoint)
- Codebase: `Desktop/claude/vici-platform/` (cloned from frostbite-platform — single-brand showcase: Recenzii + Competitii + Retete).
- **Offline-safe Supabase client** installed (hard-blocks foreign tenant refs frostbite/macromex/tchibo; runs offline stub until dedicated VICI Supabase at sign-off). No .env copied → no cross-tenant leak.
- Brand tokens rebranded: primary = VICI red `#E2001A` (hsl 354 90% 45%) + navy accent. index.html title → VICI.
- **Official assets pulled from vici.eu** into src/assets/: `vici-logo.png` (official wordmark), `vici-logo-color.png` (V mark), `product-surimi.jpg` (Surimi sticks cover), `product-salmon.jpg`, `product-gyoza.jpg`.
- 3 product categories for showcase: **Surimi · Gyoza · Pește & Somon**.
- Competition concept: adapt O'Green reference (register + receipt code) + creative "make a video / best recipe wins" → cooking prizes (Air Fryer / set tigăi / cooking kit VICI), prize photos to generate.
- Hero: video background (like Tchibo desktop hero), seafood/cooking footage.

### Remaining
- [ ] Rewrite Hero (video + "Intră în comunitatea VICI") + Brands/CTA/Score/Footer
- [ ] Recenzii: 3 VICI products + CV questionnaire
- [ ] Retete: real VICI recipes (gyoza Asian sauce, Surimi Royale salad, seafood tacos, summer rolls…)
- [ ] Competitii: video/recipe contest + prizes with photos (generate)
- [ ] Auth/Admin VICI rebrand; hero video (Pexels); build + deploy Netlify; proposal PDF

## DEPLOYED (2026-06-04)
- **Live:** https://vici-showcase.netlify.app (Netlify site vici-showcase, cbec8ab7-87a5-4fa3-9f9e-d0ce06f3b62b)
- Single-brand VICI (cloned from frostbite). Offline-safe Supabase stub (dedicated project at sign-off). All routes 200.
- **Hero:** Higgsfield video (gyoza+surimi+salmon, cinematic) + official VICI logo + "Intră în comunitatea VICI" + PARTICIPĂ LA CONCURS.
- **Recenzii:** 3 official products (Crab Sticks Surimi, VICI Gyoza, File Somon) w/ ratings + reviews (CV questionnaire style). Official vici.eu pack shots.
- **Rețete:** 3 real VICI recipes (Gyoza sos asiatic, Salată surimi & avocado, Tacos surimi) w/ ingredients + steps + expand. nanobanana photos.
- **Competiții:** 3 detailed (Cumpără & Câștigă / Recipe Video Contest / Foodie Photo) — Higgsfield cinematic covers + transparent prize photos (air fryer / cookware / utensils) + step mechanics + deadlines.
- Brand: VICI red #E2001A + navy; font Space Grotesk/Inter inherited. Title rebranded.
- Creatives: Higgsfield CLI (cinematic_studio_2_5 covers + cinematic_studio_video_v2 hero video) + nanobanana (prizes/recipes). HF token in env (Higgsfield account).
- TODO: dedicated Supabase at sign-off; proposal PDF; prune leftover frostbite/edenia assets.
