# GoaMasaj — Structura Campanie Google Ads

**Status:** v2 FINAL — ready to launch
**Ultima actualizare:** 14.05.2026 (după keyword research real)
**Tip:** Search Only — luna 1

---

## Arhitectura contului

```
MCC: TheNicheSociety
└── Client: GoaMasaj (cont 563-843-7180, goa.masaj@gmail.com)
    └── Campanie: [SEARCH] GoaMasaj — Bucuresti
        ├── Ad Group 1: Masaj la Domiciliu (core)
        ├── Ad Group 2: Masaj Terapeutic & Deep Tissue
        ├── Ad Group 3: Masaj Anticelulitic        ← NOU (volume 500/mo)
        └── Ad Group 4: Masaj Relaxare & Limfatic  ← NOU (limfatic 500/mo)
```

---

## Setări campanie

| Parametru | Valoare |
|---|---|
| Tip | Search Network only (NO Display, NO Search Partners) |
| Bid strategy | Manual CPC (luna 1) → Maximize Conversions după 30+ conversii (luna 2+) |
| Budget zilnic | **20 RON** (≈ 600 RON/lună) |
| Geo | Bucharest (radius 15km — acoperă Ilfov apropiat) |
| Geo type | "Presence: People in or regularly in" (NU "Search Interest") |
| Limbi | Română + Engleză (pt expați) |
| Ad rotation | Optimize: Prefer best performing ads |
| Ad schedule | All day initial → ajustare după 7 zile (probabil 9:00-22:00) |
| Devices | All (sau bid+ mobile dacă majoritatea conversiilor vin de pe mobile) |
| Audiences | Observation: "În piață - sănătate și frumusețe", "Spa & wellness" |

---

## Budget allocation per ad group

| Ad Group | % | RON/lună | Max CPC | Leads est. |
|---|---|---|---|---|
| AG1 Domiciliu | 35% | 210 | 3.50 | 1-3 |
| AG2 Terapeutic + Deep Tissue | 30% | 180 | 4.00 | 1-2 |
| AG3 Anticelulitic | 25% | 150 | 3.00 | 1-2 |
| AG4 Relaxare + Limfatic | 10% | 60 | 2.50 | 0-1 |

**Total estim. luna 1:** 3-8 leads la CPA 75-200 RON.

---

## Ad Group 1: Masaj la Domiciliu

**Max CPC:** 3.50 RON | **Status:** core, money keyword
**Final URL:** https://goamasaj.ro/

### Keywords
```
"masaj la domiciliu bucuresti"
"masaj acasa bucuresti"
"masaj la domiciliu"
"maseur la domiciliu"
"masaj terapeutic la domiciliu"     (cross-listed cu AG2)
[masaj la domiciliu bucuresti]
[masaj acasa bucuresti]
[masaj la domiciliu]
```
(Phrase = "…", Exact = […])

### RSA: GA1-Domiciliu (15 headlines + 4 descriptions)

**Headlines** (≤30 caractere fiecare — validat ✅)
```
H1.  Masaj la Domiciliu București      [28]
H2.  Maseur Profesionist Acasă         [27]
H3.  Programare Azi sau Mâine          [26]
H4.  Relaxare & Terapeutic Acasă       [29]
H5.  220 RON — Sesiune 60 min          [26]
H6.  Fără Drum, Fără Stres             [22]
H7.  Maseur Certificat București       [29]
H8.  Toate Sectoarele Bucureștiului    [30]
H9.  WhatsApp Rapid — Rezervă          [27]
H10. Masaj La Tine Acasă               [22]
H11. Toate Zilele Săptămânii           [27]
H12. Disponibil & Weekenduri           [27]
H13. Apel Direct pt Programare         [29]
H14. Confirmare în 30 Minute           [27]
H15. 5★ — Clienți Mulțumiți            [24]
```

**Descriptions** (≤90 caractere — validat ✅)
```
D1. Masaj profesionist la domiciliu în București. Relaxare & terapeutic. Sună acum! [83]
D2. Maseur certificat, sesiuni 60-90 min la tine acasă. Disponibil 7 zile/săpt. [76]
D3. Nu mai pierde timp cu drumuri. Masaj de calitate direct la tine. Prețuri corecte. [85]
D4. Rezervare simplă pe WhatsApp. Confirmare în 30 min. Toate sectoarele Bucureștiului. [89]
```

---

## Ad Group 2: Masaj Terapeutic & Deep Tissue

**Max CPC:** 4.00 RON | **Status:** highest intent (durere = urgency)
**Final URL:** https://goamasaj.ro/ (sau /servicii dacă există ulterior)

### Keywords
```
"masaj deep tissue"                  ← TOP — 500/mo, Med
"deep tissue masaj"                  ← 50/mo, Med
"masaj terapeutic la domiciliu"
"masaj terapeutic bucuresti"
"masaj dureri spate"                 ← 50/mo, High
"masaj dureri de spate"
"masaj pentru durerea de spate"
"masaj sciatica"                     ← 50/mo, High
"masaj nerv sciatic"
"masaj spate terapeutic"
"masaj terapeutic spate"
"masaj pentru durerile lombare"
[masaj deep tissue]
[masaj terapeutic la domiciliu]
[masaj dureri spate]
```

### RSA: GA2-Terapeutic

**Headlines**
```
H1.  Masaj Terapeutic Acasă            [25]
H2.  Scapă de Dureri de Spate          [27]
H3.  Masaj Deep Tissue București       [29]
H4.  Maseur Terapeutic Certificat      [30]
H5.  Contracturi? Sună Acum            [25]
H6.  Durere Spate, Gât, Umeri?         [27]
H7.  Anti-Durere la Tine Acasă         [28]
H8.  Terapie Manuală Profesionistă     [30]
H9.  250 RON — 60 min Terapeutic       [29]
H10. Efecte din Prima Ședință          [27]
H11. Relaxare Musculară Profundă       [29]
H12. Programare Azi, Efecte Mâine      [29]
H13. Deep Tissue La Domiciliu          [27]
H14. Specializat în Contracturi        [28]
H15. WhatsApp — Rezervare Rapidă       [29]
```

**Descriptions**
```
D1. Dureri de spate, contracturi, tensiune? Masaj terapeutic la domiciliu. Sună acum! [84]
D2. Maseur certificat în deep tissue & terapeutic. Tehnici eficiente București+Ilfov. [85]
D3. Nu suporta durerea. Sesiune la domiciliu — rezultate din prima ședință. 7 zile/săpt. [89]
D4. Deep tissue, terapeutic, anti-durere la tine acasă. Prețuri transparente. WhatsApp. [88]
```

---

## Ad Group 3: Masaj Anticelulitic 🆕

**Max CPC:** 3.00 RON | **Status:** NOU — descoperit 500/mo în KP
**Final URL:** https://goamasaj.ro/

### Keywords
```
"masaj anticelulitic"                 ← TOP — 500/mo, High
"masaj anticelulitic la domiciliu"    ← 50/mo, High
"masaj anticelulitic acasa"           ← 50/mo, High
"masaj anticelulita"                  ← 500/mo (variant)
"masaj anticelulita acasa"
"masaj celulita"
"masaj pentru celulita"
"pret masaj anticelulitic"
"pachet masaj anticelulitic"
[masaj anticelulitic la domiciliu]
[masaj anticelulitic acasa]
```

### RSA: GA3-Anticelulitic

**Headlines**
```
H1.  Masaj Anticelulitic Acasă         [29]
H2.  Anticelulitic la Domiciliu        [29]
H3.  Vine Maseurul la Tine             [22]
H4.  Bambus, Vacuum, Manual            [25]
H5.  Pachete 5 / 10 Ședințe            [25]
H6.  Rezultate din 3-4 Ședințe         [28]
H7.  Maseur Certificat București       [29]
H8.  Fără Drumuri la Salon             [25]
H9.  Confidențialitate Totală          [28]
H10. Pachet 10 Ședințe — Reducere      [30]
H11. Tehnici Combinate Eficiente       [30]
H12. Masaj Anticelulitic Profesionist  [30]
H13. Toate Sectoarele Bucureștiului    [30]
H14. WhatsApp — Confirmare 30 min      [29]
H15. Cadou Perfect — Voucher           [26]
```

**Descriptions**
```
D1. Masaj anticelulitic profesionist la tine acasă. Tehnici combinate, rezultate vizibile. [89]
D2. Maseur certificat București. Pachete avantajoase 5/10 ședințe. Sună sau WhatsApp! [85]
D3. Nu mai pierde timp la salon. Anticelulitic la domiciliu — discret, confortabil, eficient. [89]
D4. Rezervare simplă pe WhatsApp. Toate sectoarele. Confirmare în 30 min. 7 zile/săpt. [87]
```

---

## Ad Group 4: Masaj Relaxare & Limfatic 🆕

**Max CPC:** 2.50 RON | **Status:** mid intent — discovery + limfatic 500/mo
**Final URL:** https://goamasaj.ro/

### Keywords
```
"masaj suedez"                        ← 50/mo, Med
"masajul limfatic"                    ← 500/mo, High — NOU
"masaj limfatic"                      ← variant
"masaj relaxare acasa"
"masaj relaxare la domiciliu"
"masaj relaxare bucuresti"
"masaj voucher"                       ← gift angle, 50/mo
"masaj cadou"
[masaj suedez la domiciliu]
[masaj limfatic]
[masaj relaxare acasa]
```

### RSA: GA4-Relaxare

**Headlines**
```
H1.  Masaj Relaxare la Tine Acasă      [30]
H2.  Masaj Suedez la Domiciliu         [27]
H3.  Drenaj Limfatic la Tine           [25]
H4.  Relaxare Totală Acasă             [23]
H5.  220 RON — 60 min Acasă            [25]
H6.  Fără Drum la Salon                [21]
H7.  Maseur Vine la Tine               [22]
H8.  O Oră de Pace Adevărată           [26]
H9.  Cadou Perfect — Voucher           [26]
H10. Limfatic, Suedez, Aromaterapie    [30]
H11. Confidențialitate & Confort       [29]
H12. Disponibil Weekend                [22]
H13. Bucură-te de Acasă                [21]
H14. Rezervare WhatsApp Simplă         [28]
H15. Maseur Certificat București       [29]
```

**Descriptions**
```
D1. Masaj de relaxare profesionist la domiciliu. Uleiuri premium, confort maxim acasă. [86]
D2. De ce să mai mergi la salon? Suedez, limfatic, relaxare la tine. Disponibil 7 zile. [88]
D3. Oferă (sau ofera-ți) o sesiune de relaxare adevărată. Voucher cadou disponibil. [82]
D4. Drenaj limfatic, relaxare sau anticelulitic acasă. Rezervare simplă pe WhatsApp. [83]
```

---

## Ad Extensions (toate ad groups)

| Extension | Conținut |
|---|---|
| **Call Extension** | +40 770 475 210 (toate zilele 9:00-22:00) |
| **Sitelinks** (4) | • Masaj Terapeutic / Detalii<br>• Masaj Anticelulitic / Pachete<br>• Prețuri & Pachete<br>• Contact & Rezervare |
| **Callouts** (6+) | ✓ Maseur Certificat • ✓ Toate Sectoarele • ✓ 7 Zile/Săpt • ✓ Confirmare 30 min • ✓ Uleiuri Premium • ✓ Confidențialitate Totală |
| **Structured Snippets** | Services: Relaxare, Terapeutic, Deep Tissue, Anticelulitic, Limfatic, Suedez, Sportiv |
| **Location** | Din GBP (după claim) |
| **Promotion** (opțional) | "Pachet 10 ședințe — 5% reducere" / "Cadou voucher" |

---

## Audience Segments (Observation mode — CRITIC pentru optimizare luna 2)

⚠️ **TOATE audiențele = `Observation` mode, NU `Targeting`!**

| Mod | Ce face | Decizie |
|---|---|---|
| Targeting | Ads doar la userii din audiență | ❌ Restrânge prea mult (600 RON/lună) |
| Observation | Ads la TOȚI + colectează data per audiență | ✅ Default pentru luna 1 |

### Audiențe de adăugat (Observation)

**In-market** (intent activ — caută activ servicii):
- ✅ Beauty & Personal Care > Personal Care Services
- ✅ Health > Health Services (sau echivalent RO pentru masaj/spa)

**Affinity** (interes general):
- ✅ Beauty Mavens
- ✅ Health & Fitness Buffs
- ⚪ Yoga & Pilates Enthusiasts (opțional)

**Detailed Demographics:**
- ✅ Vârstă: 25-54 (target premium 220-250 RON sesiune)
- ⚪ Parental status: Parents (relevant pt prenatal — opțional)
- ⚪ Household income: Top 30% (dacă disponibil pt RO)

### Custom Audience (avansat — opțional)
Crează **Custom Segment** cu:
- Search terms: `masaj`, `spa`, `relaxare`, `stress`, `back pain`, `wellness`
- URLs vizitate: competitori (deep tissue Liliana, saloane masaj București)

### Workflow optimizare după luna 1
1. **Săpt 1-4:** colectează data per audiență (cost, CTR, conversions)
2. **După 30 zile:**
   - Audiențe cu Conv Rate > 5% → bid adjustment **+20%**
   - Audiențe cu 0 conversii + 30+ clicks → bid adjustment **-50%** sau exclude
   - Top performer → consideră switch la **Targeting mode**
3. **După 100+ conversii:** Creează custom audience "Past Converters" pentru remarketing

---

## Negative Keywords (Campaign Level)

**Listă completă în `01 - Keyword Research.md` § Negative Keywords** (8 categorii, 150+ termeni).

### Resumat priority negatives (TOP 20)
```
aparat
aparate
perna
perne
dispozitiv
rola
roller
bat
bete
vibromasaj
saltea
ustensile
instrumente
cupa
scarpinatoare
medicura
liliana          ← competitor!
curs
cursuri
angajare
erotic
salon
salonuri
gratis
gratuit
```

⚠️ Aplică ca **Phrase Match negatives** (NU exact, pt a captura variantele).

---

## Conversion Tracking (din Tracking Setup v4)

**Primary conversion (Google Ads):**
- `generate_lead` (tel + WhatsApp click) — Submit lead form, Active

**Behavioral events** (NU ca conversion, doar pentru optimizare):
- phone_click cu button_label → vezi care CTA convertește
- service_interest cu service_name → vezi care serviciu interesează
- scroll_depth, time_engaged → quality of traffic per source

---

## Pre-Launch Checklist

### Campaign Setup
- [ ] Campanie creată cu numele `[SEARCH] GoaMasaj — Bucuresti`
- [ ] Budget zilnic 20 RON aplicat
- [ ] Geo: Bucharest +15km, presence-based
- [ ] Limbă: Romanian + English
- [ ] Network: Search ONLY (NO Display, NO Partners)
- [ ] Bid strategy: Manual CPC
- [ ] Ad rotation: Optimize

### Ad Groups
- [ ] 4 Ad Groups create cu max CPC corespunzător
- [ ] Keywords adăugate per AG (Phrase + Exact)
- [ ] Min 1 RSA per AG cu 15 headlines + 4 descriptions
- [ ] Final URL = https://goamasaj.ro/ per AG

### Negatives
- [ ] Negative keywords aplicate la CAMPANIE level (din lista 8 categorii)
- [ ] Negative keyword list salvată în Shared library pt reutilizare

### Extensions
- [ ] Call Extension activată cu +40 770 475 210
- [ ] 4 Sitelinks adăugate
- [ ] Callouts adăugate
- [ ] Structured Snippets (Services)
- [ ] Location extension (după GBP claim)

### Audiences (Observation mode)
- [ ] **Verificat: mode = Observation, NU Targeting**
- [ ] In-market: Beauty & Personal Care adăugat
- [ ] Affinity: Beauty Mavens + Health & Fitness Buffs adăugate
- [ ] Demographics: vârstă 25-54 selectat

### Tracking
- [x] GTM Container live (Version 4 - 14.05.2026)
- [x] GA4 + Google Ads linked
- [x] generate_lead Primary conversion (Active)
- [x] Behavioral tracking layer publicat
- [ ] DebugView GA4 verificat să primească events

### Pre-Launch Smoke Test
- [ ] Preview ads — toate variantele se afișează corect
- [ ] Final URL încarcă fără erori
- [ ] Click pe ad (test) → ajunge pe site → click pe telefon → conversion înregistrată în Google Ads
- [ ] Mobile preview verificat
- [ ] Budget pacing OK pentru prima zi (pause până e gata totul)

### Launch Day
- [ ] Confirmă cu Eduard că totul e setat
- [ ] Activează campania dimineața (8-9 AM)
- [ ] Monitorizare primele 4 ore
- [ ] Search Terms check după prima zi
- [ ] Adăugare negatives noi din Search Terms

---

## Optimizare săptămânală (Week 1-4)

| Week | Acțiuni |
|---|---|
| **Week 1** | Search Terms zilnic, negatives noi, ajustare bids -20%/+20% pe keywords cu data |
| **Week 2** | Pause keywords cu CPL > 200 RON, RSA report (paușăm headlines slabe) |
| **Week 3** | A/B test second RSA în AG1 + AG3 (best performers) |
| **Week 4** | Verificare CPA per AG, redistribuire buget între AG-uri |

---

## Note importante

⚠️ **NU activăm Smart Bidding (Maximize Conversions/Target CPA) până când:**
- Avem **min 30 conversii primary** în ultimele 30 zile
- Quality Score stabil pe top keywords (≥6/10)

⚠️ **Verificare zilnică primele 7 zile:**
- Search Terms raport (negativizare)
- Conversion tracking — apar conversii?
- Quality Score pe top keywords
- Budget consumat vs zile rămase

📞 **Call CTA prioritate #1:** Cea mai importantă conversie e apelul. Toate ad-urile prioritizează telefonul peste WhatsApp în CTA-uri.
