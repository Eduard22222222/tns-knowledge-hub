# Playbook: Google Ads pentru Afaceri Locale (Servicii la Domiciliu)

## Principii fundamentale

1. **Search only în faza 1** — Display și Performance Max consumă buget pe audiențe reci. Pentru servicii locale cu budget mic, Search cu intent ridicat e mereu mai eficient.
2. **Phrase + Exact, NO Broad** — Broad match îți mănâncă bugetul pe search terms irelevante. Cu budget sub 1000 RON/lună, nu-ți permiți această risipă.
3. **Manual CPC la start** — Smart Bidding (Target CPA, Target ROAS) are nevoie de minimum 30-50 conversii/lună pentru a funcționa. Fără date, algoritmul ghicește prost.
4. **Ad Schedule strict** — Difuzează ads doar când clientul poate răspunde. Un click la 22:00 pe un număr la care nu răspunde nimeni e buget aruncat.
5. **Negative keywords înainte de lansare** — Cel mai bun ROI din orice campanie vine din negarea search terms irelevante.

---

## Structura SKAG vs. STAG

**SKAG (Single Keyword Ad Group)** — prea granular pentru bugete mici, greu de menținut.
**STAG (Single Theme Ad Group)** — recomandat: 3-8 keywords per ad group, temă unică, extensii comune.

### Exemplu pentru servicii la domiciliu:
- AG1: `masaj la domiciliu` theme (toate variantele de "domiciliu" + "acasă")
- AG2: `masaj terapeutic` theme (toate variantele legate de durere/terapeutic)
- AG3: `masaj relaxare` theme (relaxare, suedez, aromatherapy)

---

## Quality Score — ce contează

| Factor | Greutate | Cum îmbunătățești |
|---|---|---|
| Expected CTR | ~35% | Headlines relevante, urgency, extensii |
| Ad Relevance | ~35% | Keyword în headline 1 + description |
| Landing Page Experience | ~30% | Viteză, mobile UX, conținut relevant |

**QS sub 5 = problemă.** Verifică ce e mai slab din cei 3 factori.

---

## RSA Best Practices

- **Headline 1:** Include keyword-ul principal (ex: "Masaj la Domiciliu București")
- **Headline 2:** USP sau beneficiu (ex: "Maseur Certificat, Rezultate Garantate")
- **Headline 3:** CTA sau social proof (ex: "Rezervă Acum — Confirmare 30 min")
- **Description 1:** Expansiune pe beneficii, include keyword
- **Description 2:** CTA alternativ + detalii (prețuri, disponibilitate)
- **Pin headlines:** Pin Headline 1 dacă conține keyword-ul principal — altfel Google poate combina prost

---

## Extensions — ordinea importanței (pentru servicii locale)

1. **Call Extension** — cel mai important pentru servicii locale. Afișează numărul direct în ad.
2. **Location Extension** — boost pentru căutările "near me" și Google Maps
3. **Sitelinks** — 4 minim: pagini de servicii, preturi, contact
4. **Callouts** — "Maseur Certificat", "7 zile/săptămână", "Confirmare Rapidă"
5. **Structured Snippets** — lista de servicii

---

## Geo targeting pentru servicii la domiciliu

**Varianta 1 (recomandat):** Centrul orașului + raza kilometrica (ex: 15km din centru București)
**Varianta 2:** Sectoare specifice (dacă clientul știe exact unde activează)
**Evită:** "România" sau regiune prea largă — risipă de buget pe zone unde clientul nu merge

---

## Bid Management manual — ghid CPC-uri

**Logica:** CPC max = (Valoare conversie × CVR estimat)
- Dacă un serviciu costă 220 RON și CVR (clicks→call) e 5% → max CPC rațional = 220×0.05 = 11 RON
- Pornești mai jos (3-5 RON) și ajustezi după date reale

**Ajustări de bid recomandate:**
- Mobile: +20-30% (căutările locale vin majoritar de pe telefon)
- Weekenduri: +10-20% (dacă clientul e disponibil)
- Geo: sector cu conversii bune → +15%

---

## Search Terms Audit — ritm recomandat

- **Primele 2 săptămâni:** zilnic sau la 48h
- **Luna 1-2:** săptămânal
- **Stabil:** lunar sau la bi-săptămânal

**Acțiuni posibile pe search term:**
- Irelevant complet → Negative (la nivel de campanie)
- Parțial relevant → Negative (la nivel de ad group) sau keyword nou separat
- Performant → Adaugă ca keyword Exact match

---

## Semne că ceva nu merge bine

| Simptom | Cauza probabilă | Fix |
|---|---|---|
| CTR sub 2% | Headline-uri irelevante sau QS mic | Rewrite RSA, verifică QS |
| Impression Share sub 20% | Budget prea mic sau bids prea mici | Mărește bid sau restrânge geo |
| Conversii 0 după 200 clickuri | Tracking greșit sau landing page slab | Verifică tracking, audit landing page |
| CPA triplu față de target | Trafic prost (negatives lipsă) | Urgent search terms audit |
| Cost explodat brusc | Budget set wrong sau Smart Bidding activat | Verifică settings campanie |
