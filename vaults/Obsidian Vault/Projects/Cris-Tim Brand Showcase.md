---
tags: [project, active, cristim, website, multi-brand, priority-client, consumer-voice]
client: Cris-Tim Family Holding (BVB-listed)
status: in-progress
created: 2026-04-16
updated: 2026-05-04
---

# Cris-Tim Brand Showcase

**Client:** Cris-Tim Family Holding (https://cristim.ro/)
**Status:** Code scaffold complete — awaiting client sign-off pe Supabase provisioning
**Dev server:** http://localhost:8089/ (port 8089)
**Codebase:** `C:\Users\adumi\OneDrive\Desktop\claude\cristim-brand-showcase\`
**Tip:** Variantă 3-brand a template-ului ConsumerVoice — fork din [[Macromex Brand Showcase]]

## About Cris-Tim

Founded 1992 by Cristina & Radu Timiș. Leader of Romanian processed meat market. Listed on BVB (Bucharest Stock Exchange) în 2025 la 16.5 RON/share, capitalization ~260M EUR. First Romanian cold cuts manufacturer cu gluten-free certification. Măgureni factory: 6000 sqm production, 25 tons/day capacity pentru economy brand Alpinia.

## The 3 brands

### 1. Cris-Tim (flagship — premium cold cuts)
- **Colors:** deep red `#B71C1C` → `#D32F2F`, gold accent `#FFD600`
- **Tagline:** "Mezeluri de calitate, zi de zi."
- **Score:** 4.8/5
- **Products:** Cremwurști, Salam de Sibiu, Șuncă Presată, Cârnați de Pleșcoi

### 2. Matache Măcelaru (premium traditional — "mezeluri meșteșugite")
- **Colors:** warm brown `#4E342E` → `#6D4C41`
- **Tagline:** "Meșteșug românesc, gust de altădată."
- **Score:** 4.7/5
- **Backstory:** Historical butcher in Bucharest (1879, intersection of Calea Griviței și Calea Buzești). Brand acquired de Cris-Tim în 2011 (după Principal Company bankruptcy).
- **Products:** Pastramă, Tobă tradițională, Cârnați țărănești, Șuncă Praga

### 3. Alpinia (economy line — value cold cuts)
- **Colors:** red `#B71C1C` script on white
- **Tagline:** "Gust bun la preț accesibil."
- **Score:** 4.5/5
- **Products:** Parizer, Cremwurști populari, Cârnați afumați

**Other Cris-Tim sub-brands (not in this showcase):** Obrăjori, Csárdás

## Content delivered

- 9 product cards cu real photos
- 15 authentic Romanian reviews (practical pentru Cris-Tim, traditional pentru Matache, budget-friendly pentru Alpinia)
- 9 competitions cu Romanian prizes (Weber BBQ set, Sibiu weekend, Ooni pizza oven, etc.)
- 18 recipes (6 per brand) — omletă cu cremwurști, pastramă cu ouă, hot dog de casă, etc.
- Real brand logos pulled de pe cristim.ro (Alpinia logo de pe CDN `Logo-Alpinia-500x500px.png`, Matache de pe FB)
- Hero photos — Romanian family feasting
- Prominent Cris-Tim logo placement (clientul e parent company, deci branding-ul dominant)
- Supabase hardened stub-client (offline mode) — vezi [[Macromex Env Leak Incident]]

## Open TODOs

- [ ] Fresh Supabase project (~$10/mo) once client signs off — vezi [[Supabase Isolation Policy]]
- [ ] ConsumerVoice form IDs pentru fiecare brand
- [ ] Proposal PDF (pending generation)
- [x] User feedback requested: BIG Cris-Tim logo + quality photos — addressed

## Key decisions

- Cris-Tim is THE client (parent holding), so parent brand must dominate
- Hero shows Cris-Tim parent logo prominently în top-left cu white bg + shadow
- 3 brand badges în 104×104 circles on hero (Cris-Tim, Matache, Alpinia)
- Each brand page uses its own brand logo (not parent) în header to honor brand identity
- Color palette: earthy warm tones to match meat/Romanian tradition

## Related notes

- Origin template: [[Macromex Brand Showcase]]
- Sister 3-brand showcases: [[Tchibo Brand Showcase]], [[Caroli Brand Showcase]], [[Scandia Brand Showcase]], [[Intersnack Brand Showcase]], [[Vel Pitar Brand Showcase]], [[Nordic Food Brand Showcase]], [[Kandia Brand Showcase]]
- Single-brand sister: [[Bonduelle Consumer Platform]]
- Per-tenant safety: [[Supabase Isolation Policy]], [[Macromex Env Leak Incident]]
