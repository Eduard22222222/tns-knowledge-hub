---
tags: [project, active, nordic-food, website, multi-brand, consumer-voice]
client: Nordic Food (Nordic Group)
status: in-progress
created: 2026-04-16
updated: 2026-05-04
---

# Nordic Food Brand Showcase

**Client:** Nordic Food — Romanian FMCG distributor (https://nordic-food.ro/)
**Status:** Code scaffold complete — awaiting client sign-off pe Supabase provisioning
**Dev server:** http://localhost:8088/ (port 8088)
**Codebase:** `C:\Users\adumi\OneDrive\Desktop\claude\nordic-food-showcase\`
**Tip:** Variantă 3-brand a template-ului ConsumerVoice — fork din [[Macromex Brand Showcase]]

## About Nordic Food

Founded 1994 ca Nordic Import-Export, parte din Nordic Group. Sales & marketing company operating în FMCG (Retail + Food Service), portfolio de 170+ brands. ~72M EUR turnover, 400+ employees, 8000+ sqm warehouse. Distributes market leaders including Cirio, Alpro, Elle & Vire, Icam, Giovanni Rana.

## The 3 brands

### 1. Rana (Giovanni Rana, Italian fresh pasta)
- **Colors:** deep blue `#1B3A5C` → gold `#D4A843`
- **Tagline:** "Pastă proaspătă, gust italian autentic."
- **Score:** 4.9/5
- **Products:** Tortellini, Ravioli 4 Formaggi, Gnocchi

### 2. Cirio (Italian tomato products, since 1856)
- **Colors:** deep red `#C62828` → `#E53935`
- **Tagline:** "Roșii italiene premium, din 1856."
- **Score:** 4.7/5
- **Products:** Passata Rustica, Pelati, Polpa Fine

### 3. Voila (Nordic Food's own brand — French-style creams/patisserie)
- **Colors:** royal blue `#1565C0` → `#1976D2`
- **Tagline:** "Inspirație franceză, la tine acasă."
- **Score:** 4.6/5
- **Products:** Aluat Foietaj, Smântână de Gătit, Clătite Mix

## Content delivered

- 9 product cards cu photos
- 15 authentic Romanian reviews (gourmet tone pentru Rana, authenticity pentru Cirio, elegance pentru Voila)
- 9 competitions cu themed prizes (Toscana weekend, Ooni pizza oven, French patisserie workshop)
- 18 recipes (6 per brand) — tortellini cu smântână, pizza Margherita, crêpes cu ciocolată, etc.
- Hero photos, recipe photos, competition covers — all from Unsplash curated
- Real brand logos (Rana yellow/blue, Cirio 1856, Voilà! blue script)
- Supabase hardened stub-client (offline mode) — vezi [[Macromex Env Leak Incident]]

## Open TODOs

- [ ] Fresh Supabase project (~$10/mo) once client signs off — vezi [[Supabase Isolation Policy]]
- [ ] ConsumerVoice form IDs pentru fiecare brand
- [ ] Proposal PDF (pending generation)
- [ ] Potential: higher-quality custom Nanobanana photos once API quota resets

## Notes

- User originally typed "Ciro" but correct brand is **Cirio** — corrected all file names, imports, și UI copy
- Voila e Nordic's proprietary brand (not a distributor partnership)

## Related notes

- Origin template: [[Macromex Brand Showcase]]
- Sister 3-brand showcases: [[Tchibo Brand Showcase]], [[Caroli Brand Showcase]], [[Scandia Brand Showcase]], [[Intersnack Brand Showcase]], [[Vel Pitar Brand Showcase]], [[Cris-Tim Brand Showcase]], [[Kandia Brand Showcase]]
- Single-brand sister: [[Bonduelle Consumer Platform]]
- Per-tenant safety: [[Supabase Isolation Policy]], [[Macromex Env Leak Incident]]
