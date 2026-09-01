# Research Synthesis & Design Brief — Website FamilyLink

**Status:** Brief executiv pentru wireframe + UX copy
**Data:** 30 aprilie 2026
**Input:** [User Research & Personas](User Research & Personas.md) + [Trust Assets & Credibility](Trust Assets & Credibility.md)

---

## Executive Summary

FamilyLink-ul are 2 audiențe care nu se suprapun (administrator cămin B2B vs familie B2C) dar consumă același site simultan. Studiile arată că ambele converg pe 3 anxietăți comune: **încredere**, **costuri ascunse**, **complexitate tehnică**. Trust-ul Cerasela + EAN dezarmează prima anxietate la nivel macro · pricing transparent + „fără contract 12 luni" o dezarmează pe a doua · screencast 90 sec interfață RO reală o dezarmează pe a treia. Designul site-ului trebuie să livreze aceste trei dezarmări **în primele 60 de secunde** pentru ambele audiențe — restul e nurturing.

---

## 6 Teme majore (Affinity Mapping)

### Tema 1 — „Voi cine sunteți?" (Identity Anxiety)
**Prevalența:** 4/4 personas explicit + Persona 4 (Răzvan) BLOCANT total fără răspuns
**Esența:** În RO B2B, lipsa identității clare = prezumție de scam. În B2C elder-care, lipsa identității = abandonment instant.
**Implicație design:** Trust assets vizibile **în primul scroll** pe homepage. Pagina `/despre` cu fotografii și roluri reale. Schema markup Organization + Person extensiv.

### Tema 2 — „Cât costă și pot anula oricând?" (Pricing Transparency)
**Prevalența:** 3/4 personas (Mariana, Andrei prin proxy, Răzvan)
**Esența:** Comportamentul SaaS modern în RO așteaptă pricing transparent. „Solicitați ofertă" = e scump = închide.
**Implicație design:** Pricing tabel mare prominent. „Fără contract pe termen lung" repetat de 3 ori. CTA „Programează demo" lângă tier (nu doar la finalul tabelului).

### Tema 3 — „Familiile/personalul nu sunt tehnici" (Tech Anxiety)
**Prevalența:** 2/4 personas explicit (Mariana, indirect Andrei pentru mama lui)
**Esența:** Frica falsă bazată pe stereotip. Trebuie demontată cu DEMO REAL în RO, nu argumente.
**Implicație design:** Screencast video 90 sec absolut prominent pe `/cum-functioneaza` + embed pe homepage. Mockup-uri în RO, nu engleză tradusă. Demo cu user actor de 60+ ani folosind cu ușurință.

### Tema 4 — „Ce câștig eu (timp/bani)?" (ROI Pragmatism)
**Prevalența:** 2/4 personas (Mariana, Răzvan) — B2B exclusiv
**Esența:** Administratorii cumpără DACA văd ROI clar în primele 60 secunde. Beneficiile soft („mai aproape de familii") nu vând singure.
**Implicație design:** ROI calculator cu input simplu („câte paturi · câte familii"), output direct („economisiți X ore/săptămână = Y RON/lună"). Comparație vs WhatsApp/Excel cu numere concrete.

### Tema 5 — „Liniștea mea emoțională" (Family Peace of Mind)
**Prevalența:** 1/4 persona dominantă (Andrei) + secundar Mary-Lou
**Esența:** Familiile NU cumpără software — cumpără eliminarea vinovăției. Copy-ul trebuie să atingă acest punct fără melodramă.
**Implicație design:** B2C pages cu story format · foto autentică · proces transparent („te sunăm în 24h"). NU vorbim de „revolution in care", vorbim de „liniștea de a ști că mama e bine".

### Tema 6 — „Sunt acolo cămine reale?" (Network Reality Check)
**Prevalența:** 2/4 personas (Andrei, Răzvan)
**Esența:** Lansare fără logo wall = problemă majoră. Trebuie compensat cu OTHER proof signals.
**Implicație design:** EAN membership badge prominent · Cerasela credibility · map vizual de „județe acoperite" (chiar dacă inițial 5-7 județe — vizual de „rețea") · text onest „suntem la început, dar partea de cămine partenere crește săptămânal".

---

## Top 5 Priorități Design (ordonate după impact)

### Priority 1 — Hero Split Funnel (homepage)
**Why critic:** Homepage-ul trebuie să servească 2 audiențe simultan FĂRĂ să confuze. Greșit aici = pierdem 50% din vizitatori în 5 secunde.
**Cum:** Hero cu un headline neutru + 2 path-uri clare clickabile („Sunt cămin" vs „Caut cămin pentru familie"). Video Pexels loop subtle în background.
**Trust strip imediat sub hero** (membri EAN + Asociația Cajal).

### Priority 2 — Pricing Transparent + Anti-FUD ("/pricing" + integrat în "/pentru-camine")
**Why critic:** Persona 1 (Mariana) părăsește site-ul în 30 sec dacă nu vede preț. Persona 4 (Răzvan) verifică pricing înainte să aprobe ceva.
**Cum:** Tabel T1-T4 transparent + featuri side-by-side + 3 anchor-uri puternice: „fără contract pe termen lung" · „anulează oricând cu 30 zile preaviz" · „demo gratuit 30 min cu om real".

### Priority 3 — Founder Credibility Block ("/despre" + slice pe "/pentru-camine")
**Why critic:** Cerasela e cel mai puternic asset al brand-ului — fără ea suntem un SaaS random; cu ea suntem „specialiști recunoscuți".
**Cum:** Bio, foto, mențiune Asociația Cajal, citat presă Ultima Oră, link articol. Block „Construit de oameni care înțeleg sectorul" pe `/pentru-camine`. Schema JSON-LD complet.

### Priority 4 — Demo Video 90 Sec (embedded pe homepage + "/cum-functioneaza")
**Why critic:** Demontează tema 3 (Tech Anxiety) instant. Mai bun decât 1000 de cuvinte.
**Cum:** Screencast cu interfață în română reală (nu mockup). Voiceover cald + actor 60+ ani folosind aplicația cu zâmbet. Maximum 90 sec. Autoplay muted cu controls vizibile.

### Priority 5 — Inquiry Form B2C Minimal ("/pentru-familii")
**Why critic:** Persona 2 abandonează la 5+ câmpuri. Goal: convertește vizitator → lead în <60 sec.
**Cum:** 4 câmpuri (nume + email + telefon + județ). Mesaj clar „te sunăm în 24h". Privacy reassurance vizibilă. Submit button mare friendly verde.

---

## Insights non-obvious

| # | Insight | Implicație |
|---|---|---|
| 1 | **Persona 1 nu cumpără software, cumpără „liniște GDPR" + „personal mai puțin obosit"**. Feature-ul „audit log GDPR" e pe locul 2 ca importanță, după „familiile nu mă mai sună de 50 ori/zi". | Pune „economiseste timp personal" ca headline pe `/pentru-camine`, NU „GDPR conform". GDPR e badge, nu titlu. |
| 2 | **Persona 4 (Răzvan, owner) NU citește site-ul liniar.** El sare la „Despre noi" → „Pricing" → înapoi pe homepage să verifice trust signals. Apoi WhatsApp-ează administratorul cu „pare ok, semnează". | `/despre` și `/pricing` trebuie să fie self-contained, fără să depindă de homepage pentru context. Fiecare pagină = mini-pitch complet. |
| 3 | **Persona 2 (Andrei) este sceptic față de soluții digitale pentru părinți elderly.** El bănuiește că tehnologia complică, nu simplifică. Trebuie convins că asta e DIFERIT. | Pe `/pentru-familii`: focus pe „mama nu trebuie să facă nimic — ea primește vizita personalului care îi pune o poză și un text scurt în jurnal". El primește update-ul automat. |
| 4 | **Niciun persona nu folosește termenul „SaaS" sau „platformă multi-tenant".** Mariana spune „aplicație", Andrei spune „site/app", Răzvan spune „program". Copy-ul trebuie să folosească limbajul lor, nu jargonul nostru. | UX copy în limbaj cotidian: „aplicația FamilyLink", „instrumentul digital", „sistem online" — NU „SaaS multi-tenant cu RLS". Acel jargon stă doar în docs tehnice. |
| 5 | **Trust assets-urile au impact asimetric pe audiențe.** EAN badge mută Persona 4 (owner) major dar e ignorat de Persona 2 (familie). Citatul Cerasela mută Persona 2 enorm dar Persona 1 (admin) îl trece cu vederea. | Plasăm trust signals SPECIFIC pe fiecare audiență, nu același block pe toate paginile. EAN pe `/pentru-camine` + footer global. Cerasela quote pe `/pentru-familii` + `/despre`. |
| 6 | **„Logo wall" lipsă nu e dealbreaker** dacă substituim cu „badge EAN + Cerasela + map județe + text onest". Vizitatorii apreciază transparența („suntem la început, dar...") mai mult decât logo-uri inflated. | Hero homepage poate include o linie de tipul „Construim rețeaua FamilyLink împreună cu cămine din BUC, CJ, BV, IS, TM și altele." — onest, nu defensive. |
| 7 | **Persona 1 (Mariana) bookmark-uiește dar nu cumpără la prima vizită.** Buying cycle B2B = 3-7 zile cu întoarceri repetate pe site. Ea verifică pricing/feature/FAQ multiple ori. | Site-ul trebuie să fie OPTIMIZED for return visits — clear navigation, sticky pricing CTA, persistent „Programează demo" button în header. Newsletter signup discrete pentru nurturing. |

---

## Hero Homepage — Recomandare Concretă

### Layout (sus → jos)

```
┌─────────────────────────────────────────────────────────┐
│  [Logo FamilyLink]              [Cămine] [Familii] [...]│  ← Sticky header
├─────────────────────────────────────────────────────────┤
│                                                          │
│        [Video Pexels loop subtle, blurred slightly]      │
│                                                          │
│   Aproape de cei dragi.                                  │
│   Liniște pentru cei care îi îngrijesc.                  │
│                                                          │
│   [BUTTON: Sunt cămin →]  [BUTTON: Caut cămin pentru ai mei →]  │
│   gradient blue           verde mint                     │
│                                                          │
│   ─────────────────────────────────────────────          │
│   Membri European Ageing Network · În parteneriat       │
│   cu Asociația „Acad. Nicolae Cajal"                    │
│   [logo EAN] [logo Cajal]                                │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

### De ce funcționează

- **Headline dual-resonance:** „Aproape de cei dragi" servește familia · „Liniște pentru cei care îi îngrijesc" servește căminul. Ambele simultan. NU forțează choice tip „are you a family or a care home?" la primul click.
- **2 CTA-uri vizual diferențiate** (gradient pe culorile brand): blue pentru cămin (mai serios/profesional), verde pentru familie (warm/life).
- **Trust strip IMEDIAT sub hero** — nu jos de tot. Persona 4 vede asta în primul scroll și aprobă. Persona 2 simte „ok ăștia sunt serioși". Persona 1 simte „comunitate profesională recunoscută".
- **Video loop subtle, NU dominant** — context emoțional fără să distragă de la CTA-uri. Idealul: cămin staff zâmbind cu rezident, color graded warm.

### Headline alternative testabile (A/B post-launch)
1. „Aproape de cei dragi. Liniște pentru cei care îi îngrijesc." (recomandat — dual-resonance)
2. „Conectăm căminele cu familiile, simplu și transparent." (mai funcțional)
3. „Comunicarea care merită vârsta înțelepciunii." (mai poetic, riscant)

---

## Strategie Plasare Trust Signals (matrix)

| Asset | Homepage | /despre | /pentru-camine | /pentru-familii | /pricing | Footer |
|---|---|---|---|---|---|---|
| **EAN badge** | Trust strip prominent | Block credibilitate | Block sub fold | Mențiune mică | Mențiune mică | Permanent |
| **Asociația Cajal** | Trust strip alături EAN | Bio Cerasela detalii | Block sub fold | Mențiune contextuală | — | Permanent |
| **Cerasela bio + foto** | NU (prea heavy hero) | Pagină principală | Mențiune scurtă | Citat + foto mic | — | — |
| **Citat presă Ultima Oră** | NU (prea heavy hero) | Block dedicat cu link | — | **Hero secundar** | — | — |
| **Speaker congres 2025** | NU | Bio Cerasela | Block sub fold | — | — | — |
| **ajutorplus60.ro link** | — | „Site asociat" | — | — | — | Permanent |
| **JSON-LD Organization** | Universal | Universal | Universal | Universal | Universal | Universal |

**Regula de aur:** Niciun asset NU pe toate paginile cu aceeași prominence. Selectează per audiență.

---

## Impact / Effort Matrix

### Must-Have pentru launch (Sprint 1)

| Element | Impact | Effort | Decision |
|---|---|---|---|
| Homepage hero split funnel + trust strip | HIGH | MED | ✅ Build |
| `/pentru-camine` cu ROI calculator + features + comparație vs WhatsApp | HIGH | HIGH | ✅ Build |
| `/pentru-familii` cu story + inquiry form minimal | HIGH | MED | ✅ Build |
| `/pricing` tabel T1-T4 transparent | HIGH | LOW | ✅ Build |
| `/despre` cu Cerasela + Mary-Lou + EAN + Cajal | HIGH | LOW | ✅ Build |
| `/contact` simplu | MED | LOW | ✅ Build |
| Sitemap.xml + robots.txt + Schema JSON-LD | HIGH | LOW | ✅ Build |
| llms.txt + llms-full.txt | MED | LOW | ✅ Build |
| Cookie banner GDPR | MED | LOW | ✅ Build |
| 2 articole blog seed | MED | MED | ✅ Build |

### Should-Have în prima lună (Sprint 2)

| Element | Impact | Effort | Decision |
|---|---|---|---|
| `/cum-functioneaza` cu screencast 90 sec | HIGH | HIGH | 🟡 Sprint 2 |
| `/intrebari-frecvente` cu FAQPage schema | MED | MED | 🟡 Sprint 2 |
| `/blog` cu 5 articole seed (extins de la 2 la 5) | MED | HIGH | 🟡 Sprint 2 |
| Calculator ROI interactive | MED | MED | 🟡 Sprint 2 |
| Press kit page `/press` | LOW | LOW | 🟡 Sprint 2 |
| Newsletter signup integration (Resend list) | MED | LOW | 🟡 Sprint 2 |

### Nice-to-Have (după validare)

| Element | Impact | Effort |
|---|---|---|
| Hartă județe interactiv (cu Mapbox) | LOW | HIGH |
| Live chat widget | MED | MED |
| Customer portal preview | LOW | HIGH |
| Multi-limbă RO/EN | LOW | HIGH |
| Booking demo direct via Cal.com integration | MED | MED |
| Testimonial videos după primii 3 cămine | HIGH | HIGH (depinde de cămine) |
| Studii de caz | HIGH | HIGH |

---

## Recomandări UX Copy (preview rapid pentru hero + sectiuni cheie)

### Hero principal
- **H1:** „Aproape de cei dragi. Liniște pentru cei care îi îngrijesc."
- **Subline:** „Platforma care conectează căminele de îngrijire cu familiile rezidenților — în timp real, transparent, simplu."
- **CTA primar (cămin):** „Sunt cămin → Programează demo gratuit"
- **CTA secundar (familie):** „Caut cămin pentru familia mea →"

### Trust strip
- „Membri **European Ageing Network** · În parteneriat cu **Asociația „Acad. Nicolae Cajal""**

### B2B headline (`/pentru-camine`)
- **H1:** „Mai puțin telefon. Mai multă îngrijire."
- **Subline:** „Personalul căminului tău economisește 2-3 ore zilnic eliminând apelurile ad-hoc ale familiilor. Tu rămâi 100% conform GDPR și transparent."
- **CTA:** „Vezi cum funcționează →"

### B2C headline (`/pentru-familii`)
- **H1:** „Ești aproape, chiar și de departe."
- **Subline:** „Vezi zilnic cum își începe ziua. Răspunzi când vrea să-ți spună ceva. Nu mai aștepți zile întregi de informații."
- **CTA:** „Spune-ne ce caută familia ta →"

### Citat Cerasela (folosit pe `/pentru-familii` + `/despre`)
> *„În România, bătrânețea a devenit o criză. Familiile nu știu ce să facă cu părinții bolnavi."*
> — Cerasela Maria Măciucă, fondatoare FamilyLink, Președintă Asociația „Acad. Nicolae Cajal"
> [Articolul integral pe Ultima Oră →]

### Pricing anchor copy
- „Toate planurile includ: comunicare nelimitată cămin-familie · jurnal zilnic · rapoarte săptămânale automate · suport tehnic · GDPR compliance · servere în UE · **fără contract pe termen lung — anulezi oricând cu 30 zile preaviz**."

---

## Risk register pentru website

| Risc | Probabilitate | Impact | Mitigare |
|---|---|---|---|
| Lipsă logo wall la lansare | HIGH | MED | Substituie cu trust signals (EAN + Cerasela + map județe) + text onest |
| Persona 2 abandonează inquiry form | MED | HIGH | Form ultra-minimal 4 câmpuri; reasurance privacy explicit |
| Persona 1 nu vede pricing → bounce | LOW | HIGH | Pricing transparent obligatoriu pe `/pentru-camine` și `/pricing`; CTA vizibil |
| Loading slow pe homepage video | MED | MED | Video loop optimizat (<2MB MP4 + WebM), poster image fallback, lazy load |
| Cerasela quote misinterpreted ca melodramatic | LOW | LOW | Pune în context profesional (presă + congres), nu izolat |
| Site arată ca template generic SaaS | MED | HIGH | React Bits animations subtile + brand colors v13-A consistent + custom illustrations |
| Mobile UX (Persona 1 verifică pe telefon) | HIGH | HIGH | Mobile-first design; CTA-uri thumb-friendly; pricing tabel scroll horizontal sau accordion |

---

## Următorii pași

1. ✅ **Synthesis acest doc** (gata)
2. ⏳ `design:design-system` — formalizez tokens + componente bazat pe brand v13-A
3. ⏳ `design:ux-copy` — scriu copy complet pentru toate cele 9 pagini
4. ⏳ Wireframes low-fi (eu, fără skill)
5. ⏳ Pexels video selection (paralel)
6. ⏳ High-fi mockups
7. ⏳ `design:design-critique` pe mockups
8. ⏳ `design:accessibility-review`
9. ⏳ Build Next.js 15 + Tailwind + React Bits
