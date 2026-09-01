---
tags: [project, active, cristim, website, multi-brand, priority-client]
client: Cris-Tim Family Holding (BVB-listed)
status: in-progress
created: 2026-04-16
---

# Cris-Tim Brand Showcase

**Client:** Cris-Tim Family Holding (https://cristim.ro/)
**Status:** Code scaffold complete — awaiting client sign-off on Supabase provisioning
**Dev server:** http://localhost:8089/ (port 8089)
**Codebase:** `C:\Users\adumi\OneDrive\Desktop\claude\cristim-brand-showcase\`

## About Cris-Tim

Founded 1992 by Cristina & Radu Timiș. Leader of Romanian processed meat market. Listed on BVB (Bucharest Stock Exchange) in 2025 at 16.5 RON/share, capitalization ~260M EUR. First Romanian cold cuts manufacturer with gluten-free certification. Măgureni factory: 6000 sqm production, 25 tons/day capacity for economy brand Alpinia.

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
- **Backstory:** Historical butcher in Bucharest (1879, intersection of Calea Griviței și Calea Buzești). Brand acquired by Cris-Tim in 2011 (after Principal Company bankruptcy).
- **Products:** Pastramă, Tobă tradițională, Cârnați țărănești, Șuncă Praga

### 3. Alpinia (economy line — value cold cuts)
- **Colors:** red `#B71C1C` script on white
- **Tagline:** "Gust bun la preț accesibil."
- **Score:** 4.5/5
- **Products:** Parizer, Cremwurști populari, Cârnați afumați

**Other Cris-Tim sub-brands (not in this showcase):** Obrăjori, Csárdás

## Content delivered

- 9 product cards with real photos
- 15 authentic Romanian reviews (practical for Cris-Tim, traditional for Matache, budget-friendly for Alpinia)
- 9 competitions with Romanian prizes (Weber BBQ set, Sibiu weekend, Ooni pizza oven, etc.)
- 18 recipes (6 per brand) — omletă cu cremwurști, pastramă cu ouă, hot dog de casă, etc.
- Real brand logos pulled from cristim.ro (Alpinia logo from CDN `Logo-Alpinia-500x500px.png`, Matache from FB)
- Hero photos — Romanian family feasting
- Prominent Cris-Tim logo placement (client is the parent company, so branding is dominant)
- Supabase hardened stub-client (offline mode)

## Open TODOs

- [ ] Fresh Supabase project (~$10/mo) once client signs off
- [ ] ConsumerVoice form IDs for each brand
- [ ] Proposal PDF (pending generation)
- [ ] User feedback requested: BIG Cris-Tim logo + quality photos — addressed

## Key decisions

- Cris-Tim is THE client (parent holding), so parent brand must dominate
- Hero shows Cris-Tim parent logo prominently in top-left with white bg + shadow
- 3 brand badges in 104×104 circles on hero (Cris-Tim, Matache, Alpinia)
- Each brand page uses its own brand logo (not parent) in header to honor brand identity
- Color palette: earthy warm tones to match meat/Romanian tradition
