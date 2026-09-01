# Faza 2 — Platform Completă

> **Status:** Draft scope + pricing — to revisit before signing.
> **Last updated:** 2026-05-13
> **Context:** discuție Eduard cu Cerasela despre fază următoare după Faza 1 MVP livrată.

---

## TL;DR

| Item | Valoare |
|---|---|
| **Cost cash** | €14.000 fix |
| **Equity** | 10% Realitatea Sociala SRL (cu 7 protecții) |
| **Durată** | 8 săptămâni de la kickoff |
| **Plată** | 4 tranșe egale de €3.500 |
| **Maintenance post-launch** | €500/lună (vs €300 acum) |
| **Garanție** | 90 zile defecte funcționare |
| **Tarif post-garanție** | €80/oră |

---

## Context strategic

### De ce Faza 2 acum (și nu mai târziu)

**Presiune competitivă imediată:** [[iCamin]] (icămin.ro) e jucătorul principal RO cu 9 ani prezență. Sunt 100% orientați intern (medic + asistent + OSS + farmacie) — **NU au portal pentru familie, nici directory real, nici rapoarte automate pentru apartinători.**

**Riscul de awaiting:** dacă FamilyLink rămâne în Faza 1 (doar portal familie), iCamin poate construi propriul portal familie în 6-12 luni, capitalizând pe relațiile lor existente cu căminele. Le-am da pe tavă diferențiatorul nostru.

**Strategia agresivă:** devenim platform completă care înlocuiește iCamin pentru operațiuni interne + adăugăm tot ce iCamin nu poate (familie + ComfortMap). Un singur abonament în loc de 2 separate.

### Mesaj de sales clar către cămine

> *"Cu FamilyLink ai TOT ce ai cu iCamin (jurnal staff, dosar rezident, constante vitale) PLUS portal familie + ComfortMap visibility. Un singur abonament, înlocuiește iCamin complet."*

### Concurența internațională

**[[Nurity (Italia)]]** — sistem clinic intern matur cu Farmadati integration + offline tablete + multi-role journals (medic/asistent/OSS). Avans tehnic 15-20 ani față de noi pe partea clinică. NU ne ajung în 1 an. Nu intră imediat în piața RO (au piață italiană mare). Bun benchmark pentru ideas (vezi Lessons learned secțiunea).

---

## Scope detailed — 7 module IN scope

### A. ComfortMap Directory (2.5 săpt)

Directory public căming cu profile SEO-optimized.

**Features:**
- Listare publică `/camine/[judet]/[slug]` per cămin
- Filtre: județ, capacitate, preț, facilități, distance
- Search + autocomplete
- Map view (Mapbox sau Google Maps)
- Comparare side-by-side max 3 cămine
- Schema.org markup (rich snippets Google)
- "Cere ofertă" form integrat cu `/family-inquiries`

**Differentiator iCamin:** ei au "director cămine" dar e listă statică din date publice MS Muncii. Noi avem **marketplace real cu profil dinamic editabil de fiecare cămin.**

### B. Stripe Billing (1.5 săpt)

Subscription per tenant pentru T1/T2/T3/T4.

**Features:**
- Stripe Subscriptions EU
- Auto-invoice lunar + email automat
- Self-service portal pentru cămin: upgrade / downgrade / cancel
- Webhooks Stripe → `tenant.status` sync (suspended la failed payment after grace period)
- Pricing tier display pe public profile

**NOT in scope Faza 2:** e-Factura ANAF integration (amânat — Stripe + manual ANAF pentru primele 12 luni). Adăugat în Faza 3.

### C. Tenant Public Profile Management (1 săpt)

Self-serve pentru cămin să-și editeze prezența pe ComfortMap.

**Features:**
- `/caminul/profil-public` — staff editează: facilități, descriere, foto (max 10), preț display, ore vizitare
- Toggle "Publicat în ComfortMap" per cămin
- Validation: verifică date complete înainte de publish (anti-listing slab)
- Preview live pe ComfortMap înainte de save

### D. M1 — Jurnal Staff Extins (1 săpt)

**Lovitură directă în M1 iCamin.**

FamilyLink are deja jurnal zilnic vizibil familiei. Extindem cu câmpuri vizibile DOAR personalului:
- Scaun, diureză, hidratare
- Hrană (cantitate, refuzuri, observații)
- Temperatură, mobilizare
- Observații medicale interne

**UX:** un singur form, două secțiuni: "Vizibil familiei" (existing) + "Note interne staff" (new). Personal completează o singură dată, sistemul afișează separat în /portal vs /caminul.

**GDPR:** Art. 9 special category — DPIA update + DPO consult înainte de implement.

### E. M2-LITE — Dosar Rezident (1.5 săpt)

**80% din valoarea dosarului iCamin.**

Lista rezidenți existentă (Faza 1) + adăugăm:
- **Date medicale de bază:** alergii (text + severitate), grup sanguin, condiții cronice
- **Medicație de fond:** listă medicamente (nume, dozaj, frecvență) — NU prescription printing (legal risk)
- **Apartinători multipli:** până la 5 contacte per rezident (vs 1 acum)
- **Documente atașate:** PDFs (acord intrare, recomandare medic etc.) cu max 5MB/file, max 20 docs/rezident

**NOT in scope:** fișe medicale complete cu istoric examinări (legal risk — cabinet medical). Asta rămâne la iCamin pentru cei care vor.

### F. M3-LITE — Constante Vitale (1.5 săpt)

**Match iCamin clinical fără MDR risk.**

- Form simplu staff pentru logare: tensiune, puls, temperatură, greutate
- Chart UI per rezident (line chart ultimele 30 zile pe fiecare metric)
- Tabel cronologic cu observații
- Export CSV pentru cabinet medical extern

**Important — NU includem în Faza 2:**
- ❌ AI summary "rezumat călduros familie" → MDR EU 2017/745 risk (vezi Risks)
- ❌ Threshold alerts (gen "TA peste 160 alertă") → "clinical decision support" classification risk
- ✅ Doar tracking + visualizare — staff interpretează, NU sistemul

Asta menține clasificarea "observation log" în loc de "medical device".

### G. GDPR DPIA Update + Production Deploy (1 săpt)

**Mandatory cu noile date Art. 9.**

- DPIA formal nou pentru Faza 2 (medicație + alergii + jurnal staff + constante vitale)
- Subprocessor list update (Stripe nou + Google Maps / Mapbox)
- T&C update cu cele 7 noi prelucrări
- Consimțământ explicit pentru date sănătate (Art. 9)
- Audit log enhancement pentru Art. 9 access events
- Production deploy + smoke test cu 1-2 cămine pilot

---

## OUT of scope Faza 2

Mutat în Faza 2.5 / Faza 3 / Faza 4 per impact + risk:

| Item | Fază | De ce nu acum |
|---|---|---|
| **M3 AI summary "rezumat călduros familie"** | Faza 3 | MDR EU risk — consult avocat MedTech mai întâi |
| **M5 Generator contracte + e-signature eIDAS** | Faza 4 | Effort 3 săpt + complexity legal review per cămin |
| **e-Factura ANAF integration** | Faza 3 | Stripe singur ok pentru primele 12 luni |
| **Reviews & ratings ComfortMap** | Faza 3 | Trebuie 10+ cămine să aibă sens |
| **Analytics super-admin extinse** | Faza 3 | Vercel Analytics + queries manuale suficiente acum |
| **PWA + push notifications** | Faza 3 | Email + magic link suficient Faza 2 |
| **M4 SMS critic (lipsă update >48h, raport săpt link)** | Faza 2.5 amendment | 1 săpt extra în luna 3, included in maintenance fee |
| **Cabinet medical complet, kinetoterapie, fișe asistent social** | NEVER | Reglementat juridic — risc nejustificat |
| **Multi-language (EN pentru Diaspora)** | Faza 4 | RO market suficient acum |
| **Mobile native iOS + Android** | Faza 4 | PWA în Faza 3 acoperă mobile use case |

---

## Timeline — săpt cu săpt

```
S1-2:  ComfortMap directory MVP (listing + filtre county/preț)
       + Stripe billing foundation
       → Demo S2: 3 cămine pilot vizibile pe map + cont test Stripe

S3-4:  Stripe billing complet (webhooks + self-service)
       + ComfortMap polish (search, map, compare side-by-side)
       + Tenant public profile management
       → Demo S4: prima factură automată Stripe + profil cămin live ComfortMap

S5:    M1 Jurnal staff extins (UI split public/private + permisiuni)
       → Demo S5: staff loghează jurnal cu note interne, familia vede doar partea publică

S6:    M2-LITE Dosar rezident (alergii + medicație + apartinători multipli + documente)
       → Demo S6: 1 rezident complet cu dosar editat de staff

S7:    M3-LITE Constante vitale (form + chart UI + DB schema)
       → Demo S7: 30 zile constante vitale pentru un rezident cu charts

S8:    DPIA update + GDPR review + production deploy + bug buffer
       → Recepție finală cu Cerasela
```

**Buffer total:** ~1 săpt distribuită în S8 pentru bug fixes + polish UX.

---

## Pricing — €14.000 + 10% equity

### Structura plății

```
Plată în 4 tranșe egale de €3.500
─────────────────────────────────
Tranșa 1 — €3.500 — la semnătură (avans pentru kickoff)
Tranșa 2 — €3.500 — la finalul S2 demo (ComfortMap + Stripe live)
Tranșa 3 — €3.500 — la finalul S5 demo (jurnal staff + tenant profile)
Tranșa 4 — €3.500 — la recepție finală S8

Curs: BNR din ziua semnării, fix pe toate tranșele
Termen plată: 7 zile calendaristice de la fiecare milestone semnat
```

### Cash equivalence analysis

- €14.000 / 8 săpt / 40h = **€43.75/oră** efectiv
- Versus €25/h la oferta inițială (€8k) — 75% îmbunătățire
- Versus €50/h piață mid-senior RO — încă sub, dar acceptable cu equity sweetener

### Equity value analysis

10% Realitatea Sociala SRL cu 3 scenarii:

| Scenariu | Probabilitate | Year 3 ARR | Exit multiple | Exit value | 10% TNS |
|---|---|---|---|---|---|
| **Bear** (5-10 cămine, stagnare) | 60% | €30k | 1-2× | €30-60k | €3-6k |
| **Base** (50 cămine via ComfortMap) | 30% | €150k | 3-4× | €450-600k | €45-60k |
| **Bull** (200 cămine, viral growth) | 10% | €600k | 5-7× | €3-4.2M | €300-420k |

**Expected Value:** 0.60 × €4.500 + 0.30 × €52.500 + 0.10 × €360.000 = **~€54.500**
**NPV @ 10% discount, 4 ani:** ~€37.200

**Total expected return TNS:** €14.000 cash + €37.200 NPV equity = **~€51.200**
vs varianta cash pură €22.000 → în scenariile base+bull, faci ~2.3× mai mult.

### Trade-off

- **PRO:** skin în game = aliniere succes; cash în 4 tranșe = manageable pentru Cerasela; reduce front-load risk
- **CONTRA:** dependent de exit care e rar în RO startup market; 60% probabilitate scenariu bear (equity = ~€6k)

---

## Cele 7 protecții equity (NEGOCIABILE FERM)

**Fără ele, 10% nu valorează nimic.** De inclus în SPA (Shareholder Purchase Agreement):

| # | Clauză | Ce face |
|---|---|---|
| 1 | **Vesting 2 ani, cliff 6 luni** | Equity vested treptat; cliff la 6 luni primești 25%, după 2 ani 100% |
| 2 | **Anti-dilution până raise > €500k** | Dacă Cerasela ridică round mic (gen €100k angel), 10% rămâne 10%. Doar peste €500k raise se diluează |
| 3 | **Pro-rata rights** | La orice rundă finanțare, dreptul să cumperi câtă equity să-ți păstrezi % |
| 4 | **Drag-along** | Dacă Cerasela vinde 51%, te ia obligatoriu și pe tine la same price multiple |
| 5 | **Tag-along** | Invers: dacă vrei să vinzi 10% al tău, Cerasela trebuie să-ți accepte buyer-ul |
| 6 | **Board observer seat** | Drept la raport financiar anual + să fii informat de decizii majore (no vot) |
| 7 | **Veto pe decizii majore** | Vânzare companie / dizolvare / schimbare obiect activitate — necesită acord tău |

### Strategy negociere

- Începe cu toate 7 → Cerasela va vrea să taie din ele
- Compromis acceptabil: păstrează **1, 2, 4, 6** (vesting + anti-dilution + drag-along + observer)
- Renunță la 5 și 7 dacă insistă
- **NU renunța la 1 (vesting)** — fără asta, 10% poate rămâne hârtie zero dacă ea renunță

---

## Risks identificate

### 1. GDPR escalation (HIGH)

Faza 1 procesează date sănătate "ușoare". Faza 2 cu jurnal infirmieră + constante vitale + medicație = **Art. 9 hard**.

**Implicații:**
- DPO obligatoriu (acum borderline → obligatoriu)
- DPIA reuvalut anual
- Audit ANSPDCP mai probabil
- Subprocessor list mai mare (Stripe, Google Maps, etc.)

**Mitigation:**
- DPO @ €100/lună (oferta prietenului) verificat ÎNAINTE semnătură
- DPIA formal nou inclus în scope Faza 2 (S8)
- T&C update cu consimțământ explicit Art. 9

### 2. MDR EU 2017/745 risk (MEDIUM-HIGH)

Dacă FamilyLink generează "rezumat AI călduros familie" care interpretează date clinice → poate fi clasificat ca **Class IIa medical device software** → CE marking + €30-100k compliance cost.

**Mitigation:**
- **NU includem AI summary în Faza 2** — amânat în Faza 3 cu legal review prealabil
- Constante vitale = "observation log" (staff records observations), NOT "clinical monitoring"
- Avocat MedTech RO consult 1h (€150) înainte de Faza 3 scope final

### 3. SMS recurring cost (MEDIUM)

Strategul propunea SMS pentru fiecare update. Math:
- 100 cămine × 200 rezidenți × 5 SMS/lună = 100k SMS/lună
- Cost @ €0.07/SMS = **€7.000/lună recurring** la scale

**Mitigation:**
- M4 SMS critic mutat în Faza 2.5 (amânat)
- Când implementăm: NUMAI alerte critice (lipsă update >48h, raport săpt link) — NU daily updates SMS
- Charge premium per-tenant pentru SMS (€30-50/lună adăugat)
- Volumul ~10× mai mic decât propunerea originală

### 4. Scope creep + dilution value prop (MEDIUM)

Mergem să "înlocuim iCamin complet" → riscăm să pierdem focus pe family connection (USP-ul actual).

**Mitigation:**
- Faza 2 strict cele 7 module — nu adăugăm scope mid-flight
- Pitch sales rămâne "family-first" + bonus admin (NU "we replace iCamin")
- Maintenance fee crescut (€300 → €500) reflectă surface area mai mare

### 5. Timeline tight (LOW-MEDIUM)

8 săpt este -25% comprimat vs estimarea inițială 10.5 săpt.

**Mitigation:**
- Drop M4 SMS din scope (-0.5-1 săpt) → mutat în Faza 2.5
- Utilizare AI dev tools (Claude Code) pentru speed-up pe CRUD routine
- Buffer 1 săpt distribuită în S8 pentru bugs

---

## Maintenance post-Faza 2

```
€500/lună maintenance retainer (vs €300 post-Faza 1)
─────────────────────────────────
Include:
  ✓ Monitoring 24/7 (Sentry alerts + uptime)
  ✓ Bug fixes triviale (<2h effort)
  ✓ Security patches + dependency updates
  ✓ Verificare backup-uri săptămânală
  ✓ Stripe webhook health monitoring
  ✓ ComfortMap moderation light (flag inappropriate listings)
  ✓ DPIA review anual
  ✓ Suport email/Slack: max 7h/lună (vs 5h Faza 1)
  ✓ Raport lunar 1-pagină

Out of scope (billed separat la €80/h):
  ✗ Features noi sau M4 SMS implementation (dacă vrei să accelerezi)
  ✗ Re-design / re-arhitectură
  ✗ Onboarding cămine noi (training >2h)
  ✗ Integrări custom cu sisteme externe

SLA:
  - Critical: răspuns 4h, fix 24h
  - Major: răspuns 8h, fix 3 zile lucrătoare
  - Minor: 10 zile lucrătoare

Cancel: notice 30 zile, fără penalități
```

---

## Recomandări pentru Eduard (TNS)

### Strategic — întreabă-te înainte să semnezi

**€14k + 10% equity + €500/lună + Faza 3 ulterioară te transformă în founding CTO de facto la Realitatea Sociala.**

| Implicații pozitive | Implicații de gândit |
|---|---|
| Skin în game = aliniere succes | Limitezi capacitate alți clienți TNS în nișa elder care 6 luni |
| Acces decisional + influență strategie | Conflict potențial cu alți clienți TNS în healthcare general |
| Upside major dacă scaleaza | Time commitment > Faza 1 (calls săpt cu Cerasela ca cofounder) |
| Track record portofoliu ("I built FamilyLink") | Cerasela poate deveni geloasă pe alte proiecte TNS |

**Întrebare-test:** dacă în 1 an Cerasela are 20 cămine plătitoare și-ți cere să fii full-time CTO, ai accepta?
- **DA, full-time:** 10% equity e subestimat, cere 15-20%
- **NU, TNS rămâne main focus:** 10% OK dar limitează non-compete clause strict ("elder care SaaS multi-tenant RO" — nu toată healthcare)

### Înainte de semnătură — checklist

- [ ] Verifică prietenul-DPO (cei €100/lună): are CIPP/E? Câte alte mandate are? E asigurat profesional?
- [ ] Avocat MedTech RO consult 1h pentru clasificare constante vitale + dosar medical
- [ ] Verifică Cerasela este 100% owner Realitatea Sociala (Registrul Comerțului)
- [ ] Discută cu contabilul pe implicații taxe pentru equity grant
- [ ] Confirm SRL micro permite equity issuance cu acte la notar
- [ ] Term Sheet draft formal cu cele 7 protecții
- [ ] DPIA Faza 2 schiță (poate face DPO-ul prietenului)

---

## Links

- [[Faza 1 — Lean MVP]] — contractul anterior pentru context
- [[Negotiation Notes 2026-04-30]] — note negociere Faza 1
- [[Pricing & Business Model]] — pricing strategy per cămin
- [[Architecture Decisions]] — decizii tehnice care influențează scope
- [[GDPR & Supabase Access]] — context legal
- [[Subprocessors GDPR Audit]] — listă subprocessori curentă

---

## TODO înainte de a semna

- [ ] Decide cash vs equity ratio final (€14k+10% sau alternative?)
- [ ] Validate scope cu Cerasela (vor TOATE cele 7 module sau prioritizăm?)
- [ ] Pregătește Term Sheet detaliat ca document Word/PDF
- [ ] Anexa 1 nouă cu deliverables săptămânale + criterii acceptare
- [ ] DPIA Faza 2 draft (cu DPO)
- [ ] Avocat consult pe MedTech + GDPR
- [ ] Verifică non-concurență clauză (limitată corect)
