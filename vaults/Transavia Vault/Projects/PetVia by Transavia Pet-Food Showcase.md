---
tags: [project, active, transavia, petvia, pet-food, demo, mockup, 3-brand-architecture]
client: Transavia SA (Romania) — Fragedo line
brand_mockup: PetVia by Transavia
status: deployed-demo
created: 2026-05-04
last_major_update: 2026-05-06
proposal_pdf: C:\Users\adumi\OneDrive\Desktop\claude\ConsumerVoice_Transavia_v8.pdf
---

# PetVia by Transavia — Pet-Food Showcase

**Client:** Transavia SA (Romania) — https://www.transavia.ro/
**Mockup brand:** PetVia by Transavia (fictional pet-food extension of the Fragedo poultry brand for demo purposes)
**Status:** Deployed demo at https://petvia-platform.netlify.app
**Dev server:** http://localhost:8092/ (port 8092)
**Codebase:** `C:\Users\adumi\OneDrive\Desktop\claude\petvia-platform\`
**Vault:** `C:\Users\adumi\OneDrive\Documents\Transavia Vault\`
**Base template:** Originally cloned from `bonduelle-showcase/`, restructured 2026-05-06 to 3-brand architecture matching `tchibo-showcase/`.

## 2026-05-06 major restructure

Platform was refactored from single-brand to 3-brand category architecture (clone of Tchibo's per-brand routing pattern):

- `/recenzii` is now a **category chooser** — user picks which PetVia line they want to read about
- Each category has its own dedicated review page: `/petvia-caini-recenzii`, `/petvia-pisici-recenzii`, `/petvia-rasfat-recenzii`
- Each category page has 3 dedicated SKU products + 5 reviews + Consumer Voice CTA
- Hero category badges (top of homepage) are now clickable and route directly to per-category pages
- 9 nanobanana-generated PetVia-branded packaging shots replaced the old Bonduelle vegetable photos:
  - `product-caini-1.png` (kraft-paper bag, golden retriever, 3kg Pui & Orez)
  - `product-caini-2.png` (lifestyle can with beagle puppy, 400g Pateu)
  - `product-caini-3.png` (training treats pouch with Border Collie)
  - `product-pisici-1.png` (kraft pouch, tabby cat, 85g Bucățele în sos)
  - `product-pisici-2.png` (1.5kg Indoor Cat with British Shorthair)
  - `product-pisici-3.png` (foil tray with tabby cat, Pateu Pui & Iaurt)
  - `product-rasfat-1.png` (lifestyle with dog + cat, Crocheți Liofilizat)
  - `product-rasfat-2.png` (kraft box, Bare Proteice 4×30g)
  - `product-rasfat-3.png` (kitten pouch, Snack-uri Crocante)
- 6 nanobanana-generated **recipe images that actually match the recipe titles** replaced the Bonduelle veggie photos:
  - `recipe-pui-orez-caine.png` — bowl of boiled chicken & rice with Yorkie
  - `recipe-crocheti-homemade.png` — flat-lay chicken bone-shaped biscuits with Beagle
  - `recipe-pui-iaurt-pisica.png` — bowl with chicken + Greek yogurt + tabby cat
  - `recipe-tranzitie-7-zile.png` — two pet bowls comparison ("Ziua 4/7" infographic)
  - `recipe-premii-antrenament.png` — Border Collie mid-jump catching a treat
  - `recipe-pui-morcov-stomac.png` — bowl of chicken & carrot dice on marble
- Hero overlay changed from green tint (`rgba(14,124,58,...)`) to dark tint (`rgba(0,0,0,...)`) for legibility
- Top-left Transavia logo: removed white card backing, now floats with drop-shadow only
- Auth/login fixes already applied earlier (no Bonduelle/Cris-Tim leftovers)
- All new routes return 200 in production: `/`, `/recenzii`, `/retete`, `/competitii`, `/auth`, `/petvia-caini-recenzii`, `/petvia-pisici-recenzii`, `/petvia-rasfat-recenzii`

### Proposal PDF

`ConsumerVoice_Transavia_v8.pdf` (6.4 MB, 13 pages, full RO copy, green/orange palette) generated with `build_petvia_proposal.py`. Cover page reads "ECOSISTEMUL PETVIA BY TRANSAVIA" and includes 4 mobile screenshots from the live deploy + the standard Consumer Voice ecosystem narrative.

## About Transavia (real client)

Romania's #1 poultry producer. ~2,300 employees, 560+ houses, 31 farms, 10,000+ ha of cereals grown for poultry feed, ~100,000 tons of chicken meat per year. The flagship brand **Fragedo** has been the most-trusted Romanian meat brand on the market for 7+ years (Brand Finance Romania #1 food brand). Tagline: **"Pur si sigur de la bob la furculita"** (Pure and safe from grain to fork). Brand voice: family-trusted, transparent supply chain, Romanian-made.

## Strategic premise of the demo

Transavia wants to expand into the **pet-food category**. They already control the entire poultry supply chain (chicken feed → birds → meat) so a pet-food sub-brand is a natural vertical extension: the same Romanian chicken that goes on the family table can power a premium domestic pet-food line. The mockup brand **PetVia by Transavia** demonstrates how that consumer-facing platform could look.

## The mockup brand: PetVia by Transavia

**Tagline candidates:**
- "Hrana naturala cu pui romanesc, de la Transavia"
- "Aceeasi calitate Transavia, acum si in bolul animalului tau"
- "Pur si sigur — de la bob la bol"

**3 product categories** (single-brand, like Bonduelle):

### 1. PetVia Caini (dogs)
- **Color:** Transavia green `#0E7C3A` + warm orange accent `#E8763A`
- **Products:** Hrana uscata Pui & Orez (3kg / 12kg), Hrana umeda Pateu de Pui, Hrana activa Performance Adult
- **Voice:** energetic, athletic, "fuel your best friend"

### 2. PetVia Pisici (cats)
- **Color:** Transavia green `#0E7C3A` + soft coral pink `#E36B7C`
- **Products:** Bucatele in sos delicat, Hrana uscata Indoor Cat, Pateu Pui & Iaurt
- **Voice:** elegant, refined, "for the most selective member of the family"

### 3. PetVia Rasfat (treats)
- **Color:** Transavia green `#0E7C3A` + warm gold `#C9A24B`
- **Products:** Crocheti uscati de pui liofilizat, Bare proteice, Snack-uri pentru antrenament
- **Voice:** playful, rewarding, "100% chicken, 0% guilt"

## Visual identity

- **Parent brand color:** Transavia green `#0E7C3A` (HSL 136 80% 27%) → dark `#0A5C2C` for gradients
- **Accent palette:** orange (#E8763A) / coral (#E36B7C) / gold (#C9A24B) — one per sub-category
- **Typography:** Montserrat headings + Open Sans body (inherited from Bonduelle template)
- **Logo:** AI-generated PetVia wordmark with paw + feather mark, "by Transavia" sub-line in dark gray
- **Transavia logo:** official `logo_0.png` pulled from transavia.ro, used top-left in white-card lockup

## Hero section

- **Desktop + mobile background:** looping muted Pexels video (ID 4106998 — dog eating from bowl, 1920×1080, 18.5 MB, ©cottonbro studio)
- **Poster fallback:** AI-generated rustic Romanian kitchen scene with golden retriever + cat eating side-by-side (nanobanana 16:9)
- **White card:** PetVia logo + "Intra in comunitatea PetVia" headline + invite-to-create-account subtitle + 3 category badges (76px circles) + glowing CTA "CREEAZA CONT GRATUIT" → /auth + Transavia attribution caption "o noua linie de produse de la Transavia"
- **Top-left:** Transavia logo lockup on a soft white card with shadow (matches the hero's brand-light upper-left)

## Pages

- `/` — Index (Hero + CTA + Categories + Score + Footer)
- `/recenzii` — 3 product review cards + 5 authentic Romanian pet-owner reviews + 4.8/5 score
- `/retete` — "Sfaturi & Retete" — 6 homemade pet-food recipes & care guides
- `/competitii` — 3 active competitions (annual subscription, photo contest, monthly review giveaway)
- `/auth` — Login / register
- `/admin` — Admin dashboard with brand colors mapped to `petvia / caini / pisici / rasfat`

## Content delivered (mockup)

- **3 category logos** (parent + caini + pisici + rasfat) generated by nanobanana
- **1 hero scene photo** (dog + cat eating in rustic kitchen) generated by nanobanana
- **1 hero video** (Pexels — dog eating) downloaded to `src/assets/hero-pet-desktop.mp4`
- **3 product cards** with category logos as imagery (Pui & Orez, Bucatele in sos, Crocheti liofilizati)
- **5 authentic Romanian pet-owner reviews** with real-feeling pet names (Rex, Mia)
- **3 competitions** (year-long PetVia subscription, "cea mai dragalasa fotografie" photo contest, monthly review tombola)
- **6 recipes/care guides** (chicken & rice for sick dogs, homemade liofilizat treats, food transition guide, etc.)

## Asset inventory

`src/assets/`:
- `transavia-logo.png` — official Transavia wordmark (302×74, transparent)
- `petvia-logo.png` — parent brand wordmark (1024×1024, AI-generated)
- `petvia-caini-logo.png` — dog category badge (AI-generated)
- `petvia-pisici-logo.png` — cat category badge (AI-generated)
- `petvia-rasfat-logo.png` — treats category badge (AI-generated)
- `hero-petvia.jpg` — golden retriever + cat in rustic Romanian kitchen scene (AI-generated)
- `hero-pet-desktop.mp4` — Pexels 4106998, 1080p, 18.5 MB
- (legacy Bonduelle product/recipe webp files retained as recipe-card placeholders)

## Deployment

- **Production URL:** https://petvia-platform.netlify.app
- **Site name:** petvia-platform
- **Build:** Vite + React 18, single-brand architecture
- **Hosted on:** Netlify (free tier)
- **Supabase:** running in OFFLINE STUB mode (no provisioning needed for demo — comments in client.ts confirm)
- **SPA `_redirects`:** added to `public/_redirects` so all routes return 200

## Open TODOs

- [ ] If client signs off: provision dedicated Supabase project (~$10/mo)
- [ ] Replace AI-generated category badges with proper vector logos when designed properly
- [ ] Replace placeholder recipe images (currently legacy Bonduelle photos) with pet-relevant photography
- [ ] Add 9 actual product packaging shots (currently the category-logo serves as product imagery)
- [ ] Custom domain (e.g. petvia.transavia.ro)
- [ ] Translate to English variant for international markets
- [x] Hero video on desktop AND mobile
- [x] Single-brand architecture (3 categories instead of separate brand pages)
- [x] Transavia logo top-left, PetVia logo on hero card
- [x] All Bonduelle text/colors/imports purged

## Key decisions

- **Architecture:** Single-brand like Bonduelle (not 3 brands like Tchibo) — pet food is one mental brand with category SKU lines, not separate brands
- **Voice:** Romanian-language, family-trusted, transparency-focused — leveraging Transavia's existing trust equity
- **Brand color logic:** Transavia green stays primary; each category gets a warm secondary accent that maps to the animal/use case (dogs = energetic orange, cats = coral elegance, treats = gold reward)
- **Hero video:** chose dog-eating-from-bowl over more-fun puppy-running because the bowl frames the product context immediately
- **Category badges:** circle lockups so the 3 categories sit visually as siblings, like 3 product lines under one master brand

## Related files

- `petvia-platform/` — codebase root
- `transavia-assets-staging/` — staging folder for AI-generated assets before they got copied into `src/assets/`
- (future) `proposal-screenshots/petvia_*.png` — screenshots for the Transavia pitch deck
- (future) `ConsumerVoice_Transavia_PetVia_v1.pdf` — deck for client meeting

## Pitch angles

1. **Vertical integration:** "You already control the chain from grain to fork — we extend it from grain to bowl"
2. **Trust transfer:** "Romanian families trust Fragedo for 7 years; PetVia carries that trust into the bowl"
3. **Domestic premium:** Most premium pet food in Romania is imported (Royal Canin, Hill's, Acana). PetVia would be the first **premium-Romanian** pet food, with a price advantage from local supply
4. **Cross-sell:** Existing Fragedo retail shelves give PetVia an instant distribution footprint
5. **Story:** "If it's good enough for our family table (Fragedo), it's good enough for our family pet (PetVia)"
