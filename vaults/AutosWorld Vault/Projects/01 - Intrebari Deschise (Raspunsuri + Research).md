---
tags: [project, ecommerce, open-questions, research, romania]
status: in-progress
created: 2026-06-24
---

# Întrebări Deschise — Răspunsuri + Research

Cele 8 puncte ridicate de Eduard pe 29.05.2026, fiecare cu răspuns concret + context 2026. Sursele sunt în [[Stack RO Ecommerce 2026 - Referinta]].

---

## 1️⃣ Facturare: Oblio vs Facturis
**Răspuns scurt:** oricare merge — ambele au plugin WooCommerce, ambele fac **e-Factura** și facturare automată la comandă. Diferența e profilul:

| | **Oblio** | **Facturis** | **SmartBill** |
|---|---|---|---|
| Profil | Simplu, ieftin, API curat | ERP/stocuri mai greu | Cel mai popular, integrat peste tot |
| WooCommerce | ✅ plugin | ✅ plugin | ✅ plugin |
| e-Factura ANAF | ✅ | ✅ | ✅ |
| Bun pentru | majoritatea magazinelor mici/medii | dacă are gestiune complexă, depozit | dacă vrea ecosistem larg (ex. Gomag îl folosește nativ) |

**Recomandare:** **Oblio** sau **SmartBill** pentru simplitate. Facturis doar dacă clientul are gestiune/stocuri complicate. **Criteriu obligatoriu:** soft-ul ALES trebuie să aibă (a) plugin WooCommerce, (b) conector **e-Factura**, (c) API. Toate trei le bifează.

⚠️ **Critic:** **e-Factura e OBLIGATORIE** în 2026 — B2B din 2024, **B2C din 2025**, iar din **iulie 2025 se dau amenzi** (s-a terminat perioada de grație). Deci facturarea NU e opțională, iar soft-ul trebuie să trimită automat XML-ul în SPV ANAF (UBL 2.1 / RO-CIUS), în max **5 zile lucrătoare** de la emitere.

---

## 2️⃣ Client firmă (B2B) care „nu poate factura" → să lase detaliile
**Interpretare:** la checkout, dacă vine o firmă, trebuie să poată comanda **ca persoană juridică** și să lase datele fiscale ca să primească factură pe firmă.

**Soluție (standard în WooCommerce):**
- Toggle la checkout: **„Persoană fizică / Persoană juridică"**.
- Dacă alege juridică → câmpuri: **CUI, Denumire firmă, Nr. Reg. Com., adresă, (cont IBAN, banca)**.
- **Lookup automat ANAF după CUI** — completează automat denumirea + adresa din baza ANAF (plugin RO sau API ANAF). Mai puține greșeli, mai puțin abandon.
- Datele intră direct în soft-ul de facturare → se emite **factură pe firmă** + push e-Factura.
- Dacă o comandă B2B vine cu date fiscale lipsă → comanda se **pune pe hold** și clientul e rugat să completeze înainte de facturare.

**Plugin-uri:** câmpuri RO de checkout (CUI/Reg.Com.) + plugin-ul de facturare gestionează factura pe firmă. Off-the-shelf, fără dezvoltare custom.

---

## 3️⃣ Procesator de plăți: Stripe vs Netopia
**Răspuns scurt:** pentru un magazin care vinde **în România → Netopia** (comisioane mai mici, integrare nativă RO). Stripe doar dacă vinde **internațional / SaaS / abonamente**.

| | **Netopia (mobilPay)** | **Stripe** |
|---|---|---|
| Comision | **~1%** (scade cu volumul) | **~3-4%** (mai mult internațional) |
| Piață | RO — din 2003, integrat în aproape toate magazinele | global, orientat tech/API |
| WooCommerce | ✅ modul oficial, interfață RO | ✅ plugin |
| Metode locale | card, rate prin bănci partenere, mobilPay Wallet | card global, Apple/Google Pay |
| Onboarding | RO business, rapid | ușor, dar comision local mai mare |

**Recomandare:** **Netopia primar.** Alternative RO valide: **PayU**, **EuPlătesc**. 
⚠️ **Obligatoriu și COD / plată la livrare (ramburs)** — în RO o parte mare din comenzi sunt ramburs; fără el pierzi vânzări. (Vezi și pct. 6 — rambursul aduce problema rău-platnicilor.)

---

## 4️⃣ Integrator eMAG: EasySales
**Răspuns scurt:** da, **EasySales** e instrumentul corect pentru a lega magazinul de **eMAG Marketplace**.

Ce face EasySales:
- **Sync stoc + prețuri în timp real** între WooCommerce ↔ eMAG (evită oversell când vinzi pe ambele canale)
- **Import automat comenzi** din eMAG
- **Generare AWB automată** la alegerea curierului
- **Facturare** din platformă (factură fiscală, bon, proformă, factură de stornare) — update mai 2026
- Suportă și alte marketplace-uri (Shein adăugat mai 2026 etc.)

**Cost:** abonament lunar SaaS (fără contract pe termen, fără minim) — îl **plătește clientul**, nu intră în cei 4.000 EUR.

⚠️ **Decizie de luat:** eMAG e **în scope la lansare** sau **fază 2**? Afectează scope + cost. Recomand fază 2 dacă vrem să lansăm repede site-ul propriu întâi.

> Notă: dacă mergem pe **Gomag** (vezi nota de decizie), eMAG + AWB + facturare sunt **native**, fără EasySales. Pe WooCommerce, EasySales e calea curată pentru multi-channel.

---

## 5️⃣ Research WordPress → vezi nota dedicată
Răspuns complet în [[WordPress - Decizie & Recomandare]]. Pe scurt: **WooCommerce e o alegere bună pentru acest scope și buget, CU condiții** (mentenanță + securitate + run-cost asumate de client). Alternativă serioasă de pus pe masă: **Gomag** (SaaS RO, zero-mentenanță, dar chirie + lock-in).

---

## 6️⃣ Tracker „ban" la clienți + măsuri de securitate
Două lucruri diferite — le separ:

### A) „Ban" la clienți (rău-platnici / refuz ramburs)
Problema reală în RO: clienți care comandă **ramburs** și **refuză coletul** → magazinul plătește dus + retur, produsul stă blocat. La sute de comenzi/lună = mii de lei pierderi/an.

**Ce putem face (legal, intern):**
- **Blocklist intern** după telefon/email/IP — clienți cu istoric de refuz → la următoarea comandă ramburs sunt **forțați la plata în avans** (card) sau comanda e blocată.
- **Verificare telefonică** la prima comandă (procedura simplă a redus refuzurile cu ~45% la un magazin real).
- Plugin-uri tip WooCommerce Anti-Fraud / blacklist după câmpuri de checkout.

🚨 **GDPR — atenție mare (honest assessment):** **NU** putem folosi/alimenta o **listă publică/partajată** de rău-platnici. Site-ul `clientineseriori.ro` (78.000 de persoane cu nume/telefon/adresă) a fost **amendat cu 15.000 lei** de ANSPDCP și obligat să șteargă datele — prelucrare ilegală + discriminare. 
✅ Ce e ok: **blocklist propriu, intern**, doar pentru magazinul nostru, pe bază de interes legitim, cu temei și retenție definite în politica GDPR. NU îl publicăm, NU îl partajăm, NU îl vindem.

### B) Măsuri de securitate (site)
Mai ales relevante pe WordPress (ținta #1 de hacking tocmai din cauza plugin-urilor):
- **WAF + firewall:** Wordfence sau Cloudflare
- **2FA** pe admin + ascuns `/wp-admin`, limită login attempts
- **reCAPTCHA** pe checkout + formulare (anti-bot, anti-fraudă)
- **Backups automate** + staging pentru update-uri
- **Update-uri regulate** WP/WooCommerce/plugin-uri (treaba de mentenanță → retainer)
- Hosting managed (nu shared ieftin)

> Legătură directă: punctul ăsta e **exact** motivul pentru care propun **retainer de mentenanță** în contract. Un WooCommerce nemenținut se sparge/strică în câteva luni.

---

## 7️⃣ Site mai funcțional + automatizare factură + generator AWB + legat de WordPress
Toate **realizabile** pe WooCommerce, off-the-shelf:
- **Factură automată:** Oblio/Facturis/SmartBill → factura se emite automat la plasarea/plata comenzii + push e-Factura.
- **AWB automat:** plugin curier (Sameday/FAN/Cargus/DPD) SAU prin EasySales → AWB generat la comandă, tracking trimis clientului.
- **„Legat de WordPress":** ăsta e exact **punctul forte** al WooCommerce — toate integrările RO (facturare, plăți, eMAG, AWB, e-Factura) au plugin nativ. De-asta clientul aude peste tot „WordPress".

---

## 8️⃣ E o decizie bună să lucrăm cu WordPress?
→ **Răspuns complet:** [[WordPress - Decizie & Recomandare]].
**TL;DR:** Da, e o alegere validă și economică pentru scope-ul ăsta — **dacă** clientul își asumă run-cost + mentenanță/securitate. Dacă vrea zero-bătaie-de-cap și acceptă chirie lunară + mai puțină libertate de design → **Gomag** e alternativa mai sigură. Recomand să-i punem **ambele** pe masă în contract și să aleagă informat.

---

## ✅ Acțiuni înainte de semnare
- [ ] Confirmă platforma (WooCommerce vs Gomag) cu clientul → [[WordPress - Decizie & Recomandare]]
- [ ] Separă în contract **BUILD (4.000 EUR)** vs **RUN (abonamente)** vs **MENTENANȚĂ (retainer lunar)**
- [ ] Stabilește: eMAG la lansare sau fază 2?
- [ ] Stabilește cine plătește abonamentele (client direct vs prin noi cu markup)
- [ ] Alege soft facturare (Oblio/SmartBill) + confirmă conector e-Factura
- [ ] Completează nume client + nișă în [[00 - Brief & Scope]]
