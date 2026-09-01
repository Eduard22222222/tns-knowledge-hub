---
tags: [project, ecommerce, woocommerce, contract-drafting, tns, autosworld, replatform]
client: Auto'sWorld (autosworld.ro) — entitate juridică TBD
status: contract-drafting
budget_build: 4000 EUR
budget_monthly: 500 EUR/luna (Google Ads + mentenanta)
created: 2026-06-24
source: brief Eduard 29.05.2026
---

# Magazin Online Auto'sWorld — Brief & Scope

Proiect TNS nou: **magazin online pentru Auto'sWorld (autosworld.ro)**. Suntem în **faza de drafting de contract**; preț stabilit **4.000 EUR** (build) + **500 EUR/lună** (Google Ads + mentenanță). Înainte de semnare avem un set de întrebări tehnice/operaționale de clarificat (vezi [[01 - Intrebari Deschise (Raspunsuri + Research)]]).

## 🚗 Despre client (recon 2026-06-24)
- **Ce vând:** **machete auto / modele die-cast la scară** (1:8 → 1:72), motociclete, kituri de colecție (DeAgostini, Eaglemoss, Hachette), vitrine, figurine, diorame. **NU piese auto** — nișă de **colecționari**, activi din **2014**, București.
- **Platforma actuală: OpenCart** (funcțional dar aglomerat). → proiectul e un **REPLATFORM OpenCart → WooCommerce custom**, nu site de la zero.
- **Vând deja pe eMAG** (pagină de brand) → integrarea **eMAG/EasySales e în scope real**, nu opțională.
- Multi-currency RON/EUR, cont clienți, wishlist, comparare produse, secțiune forum.

## ⚠️ Scope NOU rezultat din recon (de prins în contract)
1. **Migrare catalog** din OpenCart — sute/mii de SKU-uri de machete. **Cost driver major** → de confirmat numărul de produse; Beneficiarul furnizează export CSV/XML din OpenCart.
2. **Migrare SEO** — 10+ ani de vechime + rankings Google. Site nou FĂRĂ **redirect-uri 301** = pierdem tot traficul organic. Plan de migrare SEO obligatoriu în scope.
3. **Filtrare puternică** pentru colecționari: după scară (1:18, 1:43...), brand/producător, serie, ediție limitată + wishlist. Esențial pentru un catalog mare de machete.

## Ce a cerut clientul / ce a ridicat Eduard (29.05.2026)
1. **Facturare** — Oblio / Facturis (soft de facturare RO).
2. **Client persoană juridică (B2B)** care „nu poate factura" → să poată lăsa **detaliile fiscale** (CUI etc.).
3. **Procesator de plăți** — ex. Stripe / Netopia.
4. **Integrator eMAG** — EasySales.
5. **Research WordPress** — e platforma potrivită?
6. **Tracker de „ban" la clienți** + **măsuri de securitate**.
7. **Site mai funcțional** + **automatizare factură** + **generator AWB**, totul **legat de WordPress**.
8. Întrebarea-cheie: **„E o decizie bună să lucrăm cu WordPress?"** → [[WordPress - Decizie & Recomandare]]

## Scope propus (de validat în contract)

### ✅ IN — scope-ul nostru (build, 4.000 EUR)
- Magazin online funcțional (WooCommerce, dacă confirmăm WordPress) — catalog, coș, checkout, conturi clienți
- Checkout RO complet: persoană fizică + **persoană juridică** (câmpuri CUI/Reg.Com. + lookup ANAF)
- Integrare **procesator plăți** (Netopia recomandat; + ramburs/COD obligatoriu) + **plată la livrare**
- Integrare **facturare automată** (Oblio/Facturis/SmartBill) cu push la **e-Factura ANAF**
- Integrare **AWB curier** (Sameday/FAN/Cargus/DPD) — generare automată la comandă
- (Opțional, fază) Integrare **eMAG via EasySales** — sync stoc + import comenzi
- **Hardening securitate** de bază: WAF (Wordfence/Cloudflare), 2FA admin, reCAPTCHA checkout, backups
- **Blocklist intern** clienți problematici (rău-platnici / refuz ramburs) — GDPR-safe, vezi nota
- Design responsive + pagini legale (Termeni, GDPR, Retur/ANPC, Cookie)

### ❌ OUT — răspunderea clientului (de scris explicit în contract)
- **Run-cost lunar**: hosting, abonament soft facturare, abonament EasySales, mentenanță
- Conturi & contracte cu: procesator plăți (Netopia), curier, eMAG Marketplace, ANAF SPV
- Conținut: poze produse, descrieri, prețuri, stoc inițial
- Aspecte juridice: înființare/PFA/SRL, politică retur, regulament, autorizații produs (GPSR)
- Logistica offline: ambalare, predare colete, gestiune retururi fizice

## ⚠️ De clarificat ÎNAINTE de semnare (impact pe preț/contract)
1. **Build vs Run** — 4.000 EUR e DOAR build-ul. Run-cost (hosting + abonamente + mentenanță) trebuie definit separat, altfel rămâne în coada noastră ca „de ce s-a stricat". → propunere: **retainer lunar de mentenanță/securitate**.
2. **Platforma** — WooCommerce vs Gomag (SaaS RO) vs Shopify. → [[WordPress - Decizie & Recomandare]]. Decizia schimbă structura costurilor și a mentenanței.
3. **eMAG la lansare sau fază 2?** — afectează scope + cost (EasySales e abonament lunar al clientului).
4. **Cine plătește abonamentele** — direct clientul, sau prin noi cu markup? De stabilit.
5. **Nume client + nișă produs** — TBD, de completat în acest fișier.

## Decision log
| Dată | Decizie | Note |
|---|---|---|
| 29.05.2026 | Buget 4.000 EUR (build) | agreat verbal, de pus în contract |
| 2026-06-24 | Platformă **WordPress/WooCommerce CONFIRMAT** (client o vrea) | Gomag pică pe „design custom" |
| 2026-06-24 | Direcție design: **temă custom block/FSE** (nu template generic), WP doar pt plugin-uri | headless = upsell/fază 2, peste 4k |
| 2026-06-24 | Recomandare plăți: **Netopia** primar (+ COD), Stripe doar dacă vinde internațional | comisioane ~1% vs ~3-4% |
| 2026-06-24 | Facturare: orice din Oblio/Facturis/SmartBill — **obligatoriu cu conector e-Factura** | e-Factura B2B+B2C e obligatorie, amenzi active |

> Următorul pas: trecem prin [[01 - Intrebari Deschise (Raspunsuri + Research)]] cu clientul și fixăm cele 5 puncte de clarificat → apoi finalizăm contractul.
