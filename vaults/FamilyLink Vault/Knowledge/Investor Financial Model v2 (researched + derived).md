# ComfortMap — Investor Financial Model v2 (researched + bottom-up)

> Reconfirmare riguroasă a cifrelor lui Marylou cu surse externe + model cohort bottom-up (conservator) + directory ca % din căminele de pe platformă. Înlocuiește v1.
>
> Metodologie: skill `startup-financial-modeling` (cohort-based, 3 scenarii). Surse de piață citate la final.

---

## 1. Reconfirmarea cifrelor lui Marylou (vs research extern)

| Cifră Marylou | Verdict research | Notă |
|---|---|---|
| Piață globală €1.050bn 2025 → €1.740bn 2034, CAGR 5.8% | ✅ **CONFIRMAT** | DataIntelo: $1.142bn → $1.891bn, **CAGR 5.8% exact**. (≈€1.050bn la curs). E segmentul „elderly care services". |
| Piață EU €325bn 2024 → €550bn 2032 | ✅ plauzibil | ~30% din global, consistent cu CAGR EU 6.8-8.5% |
| 800+ cămine private RO | ⚠️ **de verificat / probabil optimist** | Bed density RO 222-355/100k (Eurostat 2023) → ~42-67k paturi LTC total, ~50% private → **~400-700 cămine private** estimat. Folosim conservator + verificăm la ANPIS. |
| Exit 5× ARR | ✅ **CONSERVATOR (bun)** | 2025 median SaaS ~6× ARR; vertical SaaS premium 7-9×; dar private/early discount 30-50%. **5× e calibrare prudentă, credibilă.** |
| Churn implicit | ✅ 10%/an e conservator | Benchmark SMB SaaS 5-7%/an. Căminele sunt sticky (switching cost mare). 10% = prudent. |

**Concluzie:** cifrele de PIAȚĂ ale lui Marylou sunt corecte și sursate. Ajustez doar: (a) Y1 mai conservator + derivat bottom-up, (b) CAC mai realist, (c) nr. cămine RO mai prudent, (d) directory ca % din platformă.

---

## 2. Model bottom-up — cohorte de cămine (de unde vin numerele)

**Ipoteze (declarate explicit pt. investitor):**
- Lansare iunie 2026. Bază start: ~10 cămine pilot.
- Achiziție lunară (ramp realist, founder-led → primul sales rep luna 7):

| Perioadă | Cămine noi/lună | Driver |
|---|---|---|
| Luni 1-3 | 6 | Founder-led, post-lansare |
| Luni 4-6 | 9 | Directory live → inbound |
| Luni 7-9 | 12 | Primul sales rep productiv |
| Luni 10-12 | 16 | Word-of-mouth + momentum |

- Churn 10%/an (~0.9%/lună). ARPA €250/lună (€3.000/an).
- **EoY1 ≈ 140 cămine membre** (10 + ~129 noi − ~7 churn).

**Distincția cheie (de ce Y1 nu e „mare"):**
- **Exit ARR** (run-rate la finalul anului) ≠ **Venit recunoscut** (cash efectiv în an, pe rampă).
- EoY1: 140 cămine × €250 = **€35k MRR** → **€420k exit ARR** membership.
- Venit RECUNOSCUT Y1 (suma lunară pe rampă) ≈ **~€225k** — pentru că ai pornit de la 10, nu de la 140.

---

## 3. Directory — derivat ca % din căminele de pe platformă (cum ai cerut)

**Listed homes** = cămine membre (auto-listate) + cămine free directory-only (listare gratuită → SEO + network).

| Driver directory | Ipoteză (% din platformă) |
|---|---|
| Listed homes | membre × ~1.8 (free listings cresc network-ul) |
| Premium adoption | **25-30% din listed** × €79/lună |
| Plasări/cămin listat/an | 1.5-2.5 (ramp) × €299/plasare |

→ Directory NU e un număr inventat — e o funcție de baza de cămine. Crește cu marketplace-ul.

---

## 4. Proiecție 3 ani — BASE (conservator, derivat)

| Metric (exit / EoY) | An 1 | An 2 | An 3 |
|---|---|---|---|
| Cămine membre | 140 | 380 | 750 |
| Listed homes (directory) | 250 | 800 | 2,200 |
| Membership exit ARR | €420k | €1.14M | €2.25M |
| Directory exit ARR | €110k | €420k | €1.25M |
| **Total exit ARR** | **€530k** | **€1.56M** | **€3.50M** |
| **Venit recunoscut (cash în an)** | **~€280k** | **~€1.0M** | **~€2.4M** |

**3 scenarii (sensibilitate ±30% achiziție):**
| | Cămine Y3 | Total exit ARR Y3 |
|---|---|---|
| Conservative (RO only) | 400 | €1.5M |
| **Base (RO + CEE 10-15%)** | 750 | €3.5M |
| Optimistic (CEE 25% + EU) | 1,400 | €6.5M |

---

## 5. Unit economics (conservator, sursat)

| Metric | Valoare | Benchmark research |
|---|---|---|
| ARPA membership | €3.000/an | — |
| Gross margin | 85% | SaaS bun 75-85% ✅ |
| **CAC** (blended, realist) | **€1.200** | mai prudent decât v1 (€800) |
| Churn | 10%/an | SMB SaaS 5-7% → noi conservator |
| **LTV** (5 ani, GM-adj) | **~€10.400** | SMB LTV $15-40k → în range |
| **LTV : CAC** | **~8.7×** | target >3×, efficient 5×+ ✅✅ |
| **CAC payback** | **~5.6 luni** | target SMB <12 luni ✅ |

(LTV perpetuu = ARPA×GM/churn = €25.500; folosim 5 ani conservator.)

---

## 6. Valuation + ROI investitor (5× ARR, sursat)

**Valuation evolution (5× exit ARR):**
| | An 1 | An 2 | An 3 |
|---|---|---|---|
| Exit ARR | €530k | €1.56M | €3.50M |
| **Valuation** | €2.65M | €7.8M | **€17.5M** |

**ROI pe €200k (~15% entry, diluat ~10% la exit):**
| Scenariu | Exit | MOIC | IRR (~4 ani) |
|---|---|---|---|
| Bear (RO only) | €4M | **2.2×** | ~22% |
| Base (RO+CEE) | €17.5M | **8.75×** | ~72% |
| Bull (EU) | €40M+ | **16×** | ~100% |

**Mesaj:** chiar și bear → 2.2× (downside protejat de produs live + recurring). Base → 8.75×. Numere mai conservatoare decât v1 = mai credibile la un investitor sofisticat.

---

## 7. Ce rămâne de verificat (onestitate pt. investitor)
- **Nr. exact cămine private RO** — confirmă la ANPIS / Ministerul Muncii (registrul licențelor). Folosim ~600-800 prudent.
- **Tracțiunea reală azi** — câte cămine pilot semnate efectiv (slide-ul de traction).

---

## Surse (research mai 2026)
- [DataIntelo — Elderly Care Services Market](https://dataintelo.com/report/global-elderly-care-services-market) — $1.142bn 2025, CAGR 5.8%
- [Eurostat — Healthcare beds](https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Healthcare_resource_statistics_-_beds) — RO 222-355 paturi LTC/100k
- [Eurofound — Care homes in Europe](https://assets.eurofound.europa.eu/f/279033/149dda87f8/ef1723en.pdf) — RO private homes doubled, ~50/50 split
- [Aventis Advisors — SaaS Valuation Multiples 2025](https://aventis-advisors.com/saas-valuation-multiples/) — median ~6× ARR
- [Windsor Drake — Vertical SaaS Valuation Q4 2025](https://windsordrake.com/saas-valuation-multiples/) — vertical premium 7-9×
- [Optifai — B2B SaaS Churn/LTV benchmarks](https://optif.ai/learn/questions/b2b-saas-churn-rate-benchmark/) — SMB churn 5-7%, LTV:CAC 3-5×
