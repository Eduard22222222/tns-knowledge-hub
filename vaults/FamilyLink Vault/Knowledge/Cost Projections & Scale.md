# Cost Projections & Scale

> **Status:** Draft pentru planning financiar
> **Last updated:** 2026-05-13
> **Context:** breakdown costuri infrastructură + operațional la fiecare scale de creștere FamilyLink

---

## TL;DR

Infra rămâne **2-5% din venit la orice scale** — excelente unit economics. Cost-ul real crește cu echipa (support + sales) odată ce treci de 20 cămine.

| Scală | Revenue/lună | Infra cost | Op cost | Gross margin |
|---|---|---|---|---|
| 1 cămin pilot | €250 | €100 | €0 (founders) | 60% |
| 3-4 cămine | €750 | €330 | €0 | 56% |
| 20 cămine | €5.000 | €510 | €0-500 (part-time) | 80-90% |
| 100 cămine | €25.000 | €4.500 | €2.000-3.300 | 69-74% |

---

## Stack curent (Faza 1 deployed)

| Layer | Provider | Cost actual |
|---|---|---|
| Frontend + API | Vercel Pro | $20/lună |
| Database | Supabase Free | $0 |
| Email transactional | Resend Free | $0 |
| Storage | Supabase Free | inclus în DB tier |
| DNS | Cloudflare | $0 |
| Domain | ROTLD .ro | ~$15/an |
| Error monitoring | Sentry Developer | $0 |
| Web Vitals + Analytics | Vercel (inclus Pro) | $0 |
| **TOTAL** | | **~$21/lună** |

---

## Scaling matrix detaliată

### 1 cămin pilot (curent — Test 2 EDI)

```
Vercel Pro:        $20/lună
Supabase Free:     $0
Resend Free:       $0   (3k emails/lună, 100/zi limit)
Cloudflare DNS:    $0
.ro domain:        $1.25/lună (amortizat $15/an)
Sentry Dev:        $0   (5k events/lună)
─────────────────────────
TOTAL:             $21/lună (~100 RON)
```

### 3-4 cămine (luni 1-6 post Faza 1)

**Triggers upgrade:**
- Resend Free trece la 3k emails/lună ~ luna 2 (30 rez × 7 daily updates × 5 familii = ~4k/lună)
- Supabase Free egress depășește 500MB/lună ~ luna 4

```
Vercel Pro:        $20/lună
Supabase Free→Pro: $0 → $25/lună (când egress >500MB)
Resend Pro:        $20/lună (50k emails)
Cloudflare DNS:    $0
.ro domain:        $1.25/lună
Sentry Dev:        $0
─────────────────────────
TOTAL:             $41-66/lună (~200-330 RON)
```

**Revenue corespunzător:** 3 cămine × 250€ T2 mediu = **€750/lună**
**Margin gross:** ~91% (excluding founder time)

### 20 cămine (an 1-2)

**Mandatory upgrades:**
- Supabase Pro obligatoriu — egress free 500MB depășit zilnic
- Resend Pro necesar — ~30k emails/lună
- Sentry Team recomandat — events crescute + Performance monitoring
- Uptime monitoring (BetterStack/Pingdom) — SLA 99.9% în contract

```
Vercel Pro:           $20/lună
Supabase Pro:         $25/lună (250GB egress, 100GB storage, PITR 7 zile)
Resend Pro:           $20/lună
Sentry Team:          $26/lună (90 zile retention + Performance)
.ro domain:           $1.25/lună
BetterStack Pro:      $10/lună (uptime + log mgmt)
─────────────────────────────
TOTAL:                $102/lună (~510 RON)
```

**One-off la 20 cămine:**
- DPIA formal: €500-1.500
- T&C + Politică confidențialitate redactate avocat: €500-1.000
- Audit securitate light: €500
- **Sub-total one-off:** €1.500-3.000

**Revenue:** 20 × €250 = **€5.000/lună**
**Margin gross:** 98% pe infra

### 100 cămine (an 2-3)

**Triggers:**
- Supabase Pro ($25) trece la Team ($599) — 1TB storage + 500GB egress + dedicated workers + PITR 28 zile
- Vercel Pro Team ($50) — limits Pro pe build minutes / functions
- Resend Scale ($90) — 500k emails (peste 100k/lună)
- Sentry Team ($80) — Replay + Performance + Crons

```
Vercel Pro Team:      $50/lună
Supabase Team:        $599/lună
Resend Scale:         $90/lună
Sentry Team:          $80/lună
Cloudflare Pro:       $25/lună (WAF + image opt)
BetterStack Pro:      $50/lună
.ro domain:           $1.25/lună
─────────────────────────────
TOTAL infra:          $895/lună (~4.500 RON)
```

**One-off la 100 cămine:**
- ISO 27001 certification: €10-20k one-off + €5-10k/an surveillance
- Penetration test annual: €3-5k/an
- Cyber insurance: €1-3k/an
- DPO certificat upgrade: ~€1.500-2.500/lună (vs €250-400 la scale mai mic)

**Revenue:** 100 × €250 = **€25.000/lună**
**Margin gross infra:** 96.5%

---

## Operațional la 100 cămine (NU infra)

| Item | Cost/lună |
|---|---|
| DPO outsourcing certificat (Privacy First / DPO Boost premium) | €300-500 |
| Customer support 1 FTE (RO mid: ~€1.500-2.500 brut) | €1.500-2.500 |
| Customer support tool (Front, Help Scout, Intercom) | €40-100 |
| Marketing / SEO / Ads (acquisition cost) | varies |
| Contabilitate + audit anual (€2.000/an amortizat) | €170 |
| **TOTAL operațional** | **€2.000-3.300** |

---

## Pragul de rentabilitate

```
1 cămin:    €250 revenue - €100 infra = €150 profit  (60% margin)
3-4 cămine: €750 - €330 = €420 (56% margin)
20 cămine:  €5k - €510 = €4.5k (90% margin)
100 cămine: €25k - €4.5k - €3k = €17.5k profit (70% margin)
```

**Bottom line:**
- Infra costuri **2-5% din venit la orice scale**
- Cost-ul real crește cu echipa (support + sales) la 20+ cămine
- La 20 cămine poți încă opera platforma part-time
- La 50+, trebuie minim 1 FTE customer success

---

## DPO — costuri reale RO

### Cadrul legal — când e OBLIGATORIU DPO

Per GDPR Art. 37 + Legea 190/2018 RO, DPO obligatoriu când:
1. Autoritate publică
2. Monitorizare sistematică pe scară largă
3. **Procesare pe scară largă de date Art. 9** (special categories — health)

FamilyLink procesează date Art. 9 (note medicale + foto rezidenți + medicație).

| Scale | Status DPO | Argumentare |
|---|---|---|
| 1 cămin pilot | Borderline | WP29: doctor individual NU e large scale |
| 3-5 cămine | Recomandare puternică | Multi-tenant aggregator + health data |
| 20+ cămine | **Obligatoriu de facto** | Clear large scale |
| 100+ cămine | Obligatoriu fără discuție | |

### Operator vs Împuternicit

Două roluri distincte:

| Rol | Cine? | DPO obligation |
|---|---|---|
| **Operator** (decide ce date colectăm) | Fiecare cămin | Cămin propriu DPO |
| **Împuternicit** (execută procesarea per DPA) | Realitatea Sociala SRL | DPO obligatoriu de la 3-5 cămine |

### Certificări care contează

**Nu e mandatory certified DPO**, dar la audit ANSPDCP CV-ul DPO-ului tău e verificat:

| Certificare | Emis de | Cost exam | Cine îl are |
|---|---|---|---|
| **CIPP/E** (gold standard EU) | IAPP | ~€600 | Top tier DPaaS |
| **CIPM** | IAPP | ~€600 | DPO managerial |
| **CDPO** | Maastricht / DataGuard | €500-1.500 | Mid-tier |
| Diplomă post-univ GDPR (RO) | Univ. București, USAMV | €1.000-2.000 | Profesori-DPO |

### DPaaS firms în România

| Furnizor | Preț basic/lună | Preț scaled/lună | Note |
|---|---|---|---|
| **Privacy First** (Bucharest) | €250-350 | €400-600 | Bună reputație |
| **DPO Boost** | €200-300 | €350-500 | Mid-market |
| **CERT Solutions** | €300-500 | €600-900 | Inclusiv audit anual light |
| **InfoCons** (firma mare) | €600-1.000 | €1.500-2.500 | Full service + training |
| **Prieten Eduard** (oferta curentă) | €100/lună | TBD | ⚠️ Verifică CIPP/E + scope + asigurare profesională |

### Ce TREBUIE inclus în €100/lună minim

- [ ] Numit oficial DPO + notificare ANSPDCP
- [ ] Răspuns la cereri data subjects (Art. 12-22) — SLA 30 zile legal
- [ ] Point of contact ANSPDCP la audit
- [ ] Consultanță email/telefon ~2-3h/lună
- [ ] Review documente (T&C, politici, DPIA) când le actualizezi
- [ ] Breach response plan + ajutor notificare 72h
- [ ] Update DPIA anual

### Ce NU intră în €100/lună (în plus)

- Audit GDPR formal anual: **€1.500-2.500/an** separat
- DPIA inițial detaliat: **€800-1.500** one-off
- Training staff cămine
- Negotiation DPA per-tenant

### Întrebări obligatorii la prieten DPO

1. **Are CIPP/E sau certificare similară?** Verifică LinkedIn / CV
2. **Câte alte mandate are?** Dacă >50 clienți la €100, e overstretched
3. **Service agreement scris** cu scope clar — NU gentleman agreement
4. **SLA răspuns:** breach 4h, request DSAR 5 zile lucrătoare
5. **Ce se întâmplă la scale?** Stabilește acum că la 10 cămine renegociezi (probabil €250/lună)
6. **E asigurat profesional?** DPO are răspundere personală — asigurare professional liability e standard

---

## Maintenance pricing (TNS → Realitatea Sociala)

### Post Faza 1 — €300/lună

```
Include:
  ✓ Monitoring 24/7 (Sentry alerts + uptime)
  ✓ Bug fixes triviale (<2h effort)
  ✓ Security patches + dependency updates
  ✓ Verificare backup-uri săptămânală
  ✓ Suport email/Slack max 5h/lună
  ✓ Raport lunar 1-pagină

Out of scope (billed la €70/h):
  ✗ Features noi
  ✗ Re-design / re-arhitectură
  ✗ Onboarding cămine noi (training)

SLA:
  - Critical: răspuns 24h
  - Major: 3 zile lucrătoare
  - Minor: 10 zile lucrătoare

Cancel: notice 30 zile
```

### Post Faza 2 — €500/lună (bump)

```
Bump pentru surface area mai mare:
  + Stripe webhook health monitoring
  + ComfortMap moderation light
  + DPIA review anual
  + Suport email/Slack max 7h/lună (vs 5h)

Tarif post-garanție: €80/oră (vs €70 după Faza 1)
```

### Industry benchmarks SaaS maintenance RO

| Tier | % din contract / 12 luni | Echivalent |
|---|---|---|
| Light (bug fixes only) | 10-15% | €44-66/lună |
| Standard (cu SLA) | 20-25% | €88-110/lună |
| Cu suport activ + improvements | 25-35% | €110-155/lună |
| Premium (SLA strict + dev continuă) | 40-50% | €177-220/lună |

**Faza 1 = €5.300:** €300/lună = 67% din contract / 12 luni → premium tier
**Faza 1 + 2 = €19.300:** €500/lună = 31% → standard premium

---

## Notificări SMS — analiza cost recurring

**Critic pentru Faza 2.5 (M4 SMS).**

Strategul propunea SMS pentru:
- Familii la fiecare update important
- Manager cămin când rezident fără update 24h
- Manager cămin când raport săpt necitit

### Math cost real RO

SMS providers RO:
| Provider | Cost/SMS |
|---|---|
| Vonage | €0.06-0.08 |
| Twilio | €0.07-0.10 |
| SMSlink (RO local) | €0.05-0.07 |
| Orange / Vodafone direct (bulk) | €0.04-0.06 |

### Volum la scale

- **100 cămine × 200 rezidenți × 5 SMS/lună:** 100.000 SMS/lună
- Cost @ €0.07: **€7.000/lună recurring**
- Cost @ €0.05 (bulk discount Orange): **€5.000/lună**

### Strategy recomandată

**❌ NU implementa SMS pentru daily updates** — distrugere unit economics.

**✅ Implementează SMS NUMAI pentru:**
1. Lipsă update >48h (alertă manager cămin) — ~5 SMS/lună per cămin
2. Raport săpt link sâmbătă seara (familie) — 4 SMS/lună per familie
3. Emergency alerts (incidente critice) — 0-2 SMS/lună
4. Magic link login pentru utilizatori care vor (opt-in) — variabil

**Total realist:** 200 SMS/lună per cămin × 100 cămine = **20.000 SMS/lună** = €1.400/lună @ €0.07
SAU bake-it in pricing (+€15-20/lună per tenant).

---

## Concluzii pentru planning

1. **Stay free tier prima jumătate de an** — Vercel Pro $20 e tot ce ai nevoie
2. **La primul cămin plătitor:** activează Resend Pro ($20) → safe email delivery
3. **La 5-7 cămine (~6 luni):** Supabase Pro ($25) — Free tier egress depășit
4. **La 15+ cămine (~1.5 ani):** Sentry Team + BetterStack + DPIA formal
5. **La 50+ cămine:** angajezi customer success FTE + Supabase Team plan

**Costul total pentru 2 ani la creștere normală (1→5→15→25 cămine):**
- An 1: 12 luni × $50/lună mediu = $600
- An 2: 12 luni × $150/lună mediu = $1.800
- **Total 24 luni infra:** ~$2.400 = €2.200

**Versus revenue 24 luni la growth:** ~€30.000-50.000
**Margin gross infra:** 94-96%

---

## Links

- [[Faza 1 — Lean MVP]]
- [[Faza 2 — Platform Completă]]
- [[Pricing & Business Model]]
- [[Subprocessors GDPR Audit]]
- [[GDPR & Supabase Access]]
