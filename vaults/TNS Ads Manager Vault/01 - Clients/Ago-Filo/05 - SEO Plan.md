# Ago-Filo — SEO Plan

**Sursă date:** Google Search Console (Domain property `agofilo.ro`, cont TNS) — fereastra 3 luni, citit 2026-06-09.
**Status:** Plan notat. Execuție pe etape, când pornim activ.

---

## 1. Unde suntem acum (baseline GSC, 3 luni)

| Metric | Valoare | Citire |
|---|---|---|
| Total clicks | 61 | ~0.7/zi — mic în absolut, normal pt. atelier de nișă |
| Total impressions | 1.53K | ~17/zi — modest dar constant |
| Average CTR | 4% | mic pt. poziția medie |
| Average position | 4.8 | bun — dar **umflat de brand** |

**Top queries:**

| Query | Clicks | Impr | Tip |
|---|---|---|---|
| ago filo | 29 | 71 | brand |
| agofilo | 6 | 20 | brand |
| ago filo sartoria | 5 | 12 | brand |
| croitorie | 2 | 124 | generic 💰 |
| sartoria | 1 | 15 | generic |
| croitorii bucuresti | 1 | 8 | generic 💰 |
| croitorie la comanda | 1 | 3 | generic 💰 |
| servicii croitorie | 1 | 1 | generic |
| ago | 0 | 100 | gunoi (ambiguu) |
| tailor | 0 | 84 | gunoi (ambiguu) |

**Diagnostic:** ~66% din click-uri vin pe nume de brand. Pe cuvintele care aduc **clienți noi** (croitorie / croitorie la comandă / croitorii București) apare în afișări dar **nu prinde click** (ex. 2 din 124 pe "croitorie"). Creșterea e plafonată de notorietatea numelui. Plus afișări-gunoi pe "ago" și "tailor".

---

## 2. Obiectiv

Trecere de la **"brand-only"** la **descoperire** — captarea click-urilor pe intenții comerciale locale (croitorie la comandă, costume bărbați, sartoria Calea Victoriei), unde deja apărem dar prea jos.

---

## 3. Plan pe priorități

### P0 — Quick wins (cost 0, impact rapid)
- [x] **Favicon → Request Indexing** (făcut 2026-06-09). Favicon-ul lipsea în SERP (cădere domeniu). Tehnic e corect; așteptăm recrawl Google (3-7 zile). Listare cu iconiță = +încredere = +CTR pe generice.
- [ ] **Auto-renew domeniu ON** (Namebox) — previne re-căderea care a costat vizibilitate.
- [ ] **Verifică sitemap.xml** e trimis în GSC și actualizat.

### P1 — Google Business Profile (CEL MAI MARE câștig local)
- [ ] Verifică dacă există GBP pentru Ago-Filo / Calea Victoriei 63-81.
- [ ] Claim + optimizare: categorie ("Croitor / Tailor"), poze atelier + lucrări, program, telefon, link site.
- [ ] Strategie recenzii (cere clienților mulțumiți). Local Pack-ul apare PESTE rezultatele organice pe "croitorie bucurești" → câștig direct.

### P2 — Pagini pe intenții comerciale (on-page SEO)
Creează/optimizează pagini dedicate, fiecare cu title + H1 + conținut conținând fraza-țintă:
- [ ] `croitorie la comandă București`
- [ ] `costume bărbați la comandă București` (+ tuxedo / ceremonie)
- [ ] `sartoria / atelier croitorie Calea Victoriei`
- [ ] `rochii la comandă București`
- [ ] (opțional) `geacă de piele la comandă`, `broderie personalizată`

Fiecare pagină: meta title + description optimizate, H1 cu keyword, 300-600 cuvinte, poze cu alt-text, CTA spre /programare, internal links.

### P3 — Conținut de autoritate (atrage informaționali → împinge spre comercial)
- [ ] Blog scurt: "cum alegi un costum bespoke", "câte probe are un costum la comandă", "diferența off-the-rack vs bespoke".
- [ ] Fiecare articol trimite intern spre paginile comerciale (P2).

### P4 — Igienă tehnică
- [ ] Negative/curățare: "ago", "tailor" aduc afișări irelevante — nu e blocabil organic, dar de evitat ca target în Ads.
- [ ] Core Web Vitals check în GSC (Experience).
- [ ] Confirmă că toate rutele (SPA) sunt indexabile + au meta/OG corecte (react-helmet).

---

## 4. KPI de urmărit (lunar, în Reports/)

- Clicks non-brand (excl. "ago filo*", "agofilo") — **metrica reală de creștere**
- Impresii + poziție pe: croitorie la comandă, croitorii bucuresti, costume la comanda bucuresti
- CTR pe generice (după ce favicon reapare)
- Programări via /programare (din Zapier/Supabase)
- Apeluri telefonice (din GBP + Ads call tracking când pornește)

---

## 5. Legătură cu Ads (când pornim buget)
SEO + Ads se complementează: Ads Search pe intenții high-intent ("croitorie la comandă bucurești") cât timp SEO-ul organic urcă pe aceleași fraze. Vezi `02 - Campaign Structure.md`.
