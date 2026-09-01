# Faza 2 — Planning Session 2026-05-22

> **Scop:** rafinează scope-ul Faza 2 înainte de discuția cu Cerasela (vineri).
> **Bazat pe:** [[Faza 2 — Platform Completă]] (draft 13 mai) + sprintul B.4–E livrat 18–22 mai.
> **Status:** propunere pentru discuție — nu finală.

---

## 1. Ce s-a schimbat de la draftul din 13 mai

Sprintul de polish 18–22 mai (9 commits, 3 migrații) a livrat features care **de-riscă părți din Faza 2**:

| Livrat în sprint | Impact pe Faza 2 |
|---|---|
| Voice transcribe (Whisper) | M1 jurnal staff extins poate refolosi dictarea pentru note interne — **~0.5 săpt economisită** |
| Discharge rezident + audit GDPR (migr 0011) | Fundație directă pentru M2-LITE dosar rezident |
| Pagination + filtre rezidenți | Lista rezidenți scalează deja; M2-LITE construiește peste |
| Admin chat familie↔admin (migr 0013) | Feature **nou, nu era în doc** — întărește poziționarea „family-first" |
| `resident_assignments` + DnD board (migr 0008/0009) | **TASK-0005 caregiver assignment = LIVRAT** — marcat done |

**Concluzie:** estimarea de 8 săptămâni din draft rămâne validă, dar cu **mai mult buffer real** (părți deja construite). Asta e bun pentru negociere — putem promite timeline cu mai multă încredere.

---

## 2. Re-scope: split 2A / 2B

Cele 7 module **nu sunt egale ca risc**. Se împart natural în două fluxuri:

### Faza 2A — Revenue Foundation (~5 săptămâni · risc LOW)

| Modul | Durată | Ce deblochează |
|---|---|---|
| A. ComfortMap Directory | 2.5 săpt | Achiziție organică clienți (SEO) |
| B. Stripe Billing | 1.5 săpt | **Revenue recurent** — abia acum poți factura automat |
| C. Tenant Public Profile | 1 săpt | Căminul își gestionează prezența pe ComfortMap |
| GDPR light | inclus | Subprocessor update (Stripe + Maps) — **zero date medicale, zero Art. 9** |

**De ce 2A primul:**
- Fără Stripe nu există mecanism de revenue recurent — e fundația de business
- ComfortMap = motorul de achiziție; cu cât e live mai repede, cu atât SEO indexează mai devreme
- **Risc legal aproape zero** — nu atinge date de sănătate, deci nu blochează nimic
- Poate începe **imediat**, fără să aștepte DPO/avocat

### Faza 2B — Clinical Parity (~4 săptămâni · risc HIGH)

| Modul | Durată | Risc |
|---|---|---|
| D. M1 Jurnal staff extins | 1 săpt | GDPR Art. 9 (date sănătate) |
| E. M2-LITE Dosar rezident | 1.5 săpt | GDPR Art. 9 (alergii, medicație) |
| F. M3-LITE Constante vitale | 1.5 săpt | MDR EU 2017/745 (clasificare medical device) |
| G. DPIA + deploy | inclus | — |

**De ce 2B separat:**
- Necesită **DPO confirmat** + **avocat MedTech consultat** ÎNAINTE — lucruri încă nebifate din checklist
- Dacă apare un blocaj legal pe clinical, nu blochează revenue-ul (2A merge deja)
- Cerasela vede 2A funcțional → decide informat dacă merge pe 2B

### Comparație: monolit vs split

| Aspect | Faza 2 monolit (8 săpt) | Split 2A + 2B |
|---|---|---|
| Time-to-revenue | Săpt 4 (Stripe în mijloc) | **Săpt 2** (Stripe prioritizat) |
| Risc legal pe contract | Tot contractul expus | Doar 2B; 2A imun |
| Decizie Cerasela | Tot-sau-nimic €14k | Commit gradual, vede 2A întâi |
| Risc pentru tine (TNS) | Blocaj legal → tot blocat | Blocaj pe 2B → 2A livrat oricum |
| Negociere | O singură rundă grea | 2A ușor de semnat, 2B după dovezi |

**Recomandare:** propune split-ul Cerasela. E mai bun pentru ambele părți — ea riscă mai puțin upfront, tu nu ești ostatic unui blocaj legal pe partea clinică.

---

## 3. Pricing pe split

### Varianta recomandată

```
Faza 2A — €7.000 + 10% equity
──────────────────────────────
  3 module revenue (ComfortMap + Stripe + Profile)
  ~5 săptămâni
  Equity grant se face AICI (momentul „mă angajez în venture")
  Plată: 2 tranșe × €3.500 (semnătură + recepție S5)

Faza 2B — €7.000 cash (SOW separat)
──────────────────────────────
  3 module clinical (Jurnal + Dosar + Constante) + DPIA
  ~4 săptămâni
  FĂRĂ equity suplimentar — e SOW cash curat
  Precondiții semnare: DPO confirmat + avocat MedTech consultat
  Plată: 2 tranșe × €3.500 (semnătură + recepție)
```

**De ce equity doar pe 2A:** equity-ul reprezintă angajamentul în venture, nu munca per oră. Îl legi de momentul de commitment (2A). 2B devine un SOW cash curat, ușor de evaluat, fără complicații de evaluare equity per sub-fază.

**Total dacă se fac ambele:** €14k + 10% equity — **identic cu draftul**. Split-ul nu schimbă suma, doar structurează riscul.

### Alternative de discutat

| Variantă | Cash | Equity | Când are sens |
|---|---|---|---|
| **A. Split recomandat** | €7k + €7k | 10% la 2A | Cerasela vrea risc minim upfront |
| **B. Monolit original** | €14k | 10% | Cerasela e 100% decisă pe toate 7 module |
| **C. Cash-heavy** | €18–20k | 0% | Dacă protecțiile equity nu se pot obține |
| **D. Equity-heavy** | €10k | 15% | Dacă crezi puternic în bull scenario + vrei full-CTO |

---

## 4. Cash vs Equity — cadru de decizie

Analiza EV din [[Faza 2 — Platform Completă]] rămâne validă: **~€51.2k return total așteptat** (€14k cash + ~€37.2k NPV equity). Dar EV-ul ascunde realitatea distribuției:

- **60% șansă (bear):** equity = ~€6k. Practic cash + bonus mic.
- **30% șansă (base):** equity = ~€45–60k.
- **10% șansă (bull):** equity = €300k+.

### Adevărul incomod

Equity-ul de 10% e **un bilet de loterie ancorat de succesul ComfortMap**. Dacă directory-ul public:
- **prinde tracțiune SEO** → cămine se listează organic → base/bull devine plauzibil
- **rămâne oraș-fantomă** (zero trafic, cămine nu se listează) → bear garantat

Deci decizia cash-vs-equity e de fapt **un pariu pe modulul A (ComfortMap)**. Care e încă un argument pentru split: faci 2A, **vezi cu ochii tăi** dacă ComfortMap atrage cămine, ABIA APOI evaluezi cât valorează equity-ul real.

### Recomandare onestă

1. **€14k cash e podeaua** — non-negociabil, acoperă munca. Nu coborî sub asta.
2. **10% equity e pariul de upside** — merită DOAR cu protecțiile. Fără vesting + anti-dilution, 10% poate fi hârtie zero.
3. **Minim de protecții** (din cele 7): păstrează ferm **#1 vesting, #2 anti-dilution, #4 drag-along, #6 board observer**. Renunță la #3/#5/#7 dacă insistă.
4. **Dacă Cerasela refuză protecțiile** → treci pe varianta C (cash-heavy €18–20k, 0% equity). Equity fără protecții nu merită nimic.
5. **Întrebarea-test** (din draft): dacă în 1 an are 20 cămine și-ți cere full-time CTO — accepți? DA → cere 15%. NU → 10% OK + non-compete strict limitat la „elder-care SaaS multi-tenant RO".

---

## 5. Prep pentru discuția cu Cerasela (vineri)

### Mesajul de deschidere

> *„Am livrat sprintul de polish — assignment system, voice, chat privat cu familia. Aplicația e solidă. Pentru Faza 2 propun să o împărțim în două: întâi partea care aduce bani (ComfortMap + facturare automată), apoi partea clinică. Așa vezi revenue-ul funcționând înainte să te angajezi la tot."*

### Ce propui concret

1. **Split 2A / 2B** — 2A începe imediat, 2B după precondiții legale
2. **2A: €7k + 10% equity, ~5 săpt** — Stripe live în săptămâna 2
3. **2B: €7k SOW separat, ~4 săpt** — semnat după DPO + avocat MedTech
4. **Term Sheet cu cele 4 protecții minime** (vesting, anti-dilution, drag-along, observer)
5. **Maintenance €500/lună** după 2A (vs €300 acum) — reflectă surface area mai mare

### Întrebări de pus CEREI (de clarificat vineri)

- [ ] Vrea **toate cele 7 module** sau prioritizează? (split-ul îi dă voie să decidă pe 2B mai târziu)
- [ ] **DPO-ul prietenului** (€100/lună) — e confirmat? Are CIPP/E? Asigurare profesională? (precondiție 2B)
- [ ] E **100% owner** Realitatea Socială SRL? (verificare Registrul Comerțului — precondiție equity)
- [ ] Acceptă **equity issuance** cu acte la notar? SRL micro permite?
- [ ] Timeline — vrea 2A gata până la o dată anume? (eveniment, target comercial?)
- [ ] Are deja cămine interesate să se listeze pe ComfortMap? (validează pariul SEO)

### Ce NU faci vineri

- ❌ Nu semna nimic pe loc — Term Sheet formal Word/PDF întâi
- ❌ Nu accepta equity fără cele 4 protecții scrise
- ❌ Nu te angaja la 2B fără DPO + avocat confirmate
- ❌ Nu promite date exacte de livrare până nu ai kickoff formal

### Checklist pre-semnătură (rămas din draft, încă nebifat)

- [ ] Verifică DPO-ul prietenului (CIPP/E, mandate, asigurare)
- [ ] Avocat MedTech RO consult 1h (€150) — clasificare constante vitale
- [ ] Verifică Cerasela = owner unic Realitatea Socială (ONRC)
- [ ] Contabil — implicații taxe equity grant
- [ ] Term Sheet draft formal cu protecțiile
- [ ] Anexă deliverables săptămânale + criterii acceptare

---

## 6. Următorii pași (acțiuni concrete)

| # | Acțiune | Cine | Când |
|---|---|---|---|
| 1 | Citește planul ăsta + decide varianta de pricing (A/B/C/D) | Eduard | înainte de vineri |
| 2 | Discuție Cerasela — propune split + pune întrebările | Eduard | vineri |
| 3 | După discuție: Term Sheet formal 2A | Claude + Eduard | post-vineri |
| 4 | Arhitectură tehnică ComfortMap — vezi [[ComfortMap Architecture]] | Claude | gata (acest sprint) |
| 5 | Dacă 2A semnat → kickoff modulul A | — | TBD |

---

## Links

- [[Faza 2 — Platform Completă]] — draftul complet (scope detaliat, 7 protecții, riscuri)
- [[ComfortMap Architecture]] — deep-dive tehnic modulul A
- [[Pricing & Business Model]] — pricing per cămin T1-T4
- [[ComfortMap Live Audit 2026-05-18]] — ce s-a livrat în sprintul de polish
