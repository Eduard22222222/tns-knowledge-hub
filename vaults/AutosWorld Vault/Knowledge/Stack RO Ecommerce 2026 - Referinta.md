---
tags: [knowledge, reference, romania, ecommerce, stack, 2026]
created: 2026-06-24
---

# Stack RO E-commerce 2026 — Referință

Referință rapidă pentru tot ce ține de un magazin online RO conform, în 2026. Toate verificate prin research la 24.06.2026.

## 🧾 Facturare + e-Factura
- **e-Factura e OBLIGATORIE.** B2B din 2024, **B2C din 2025**. Din **iulie 2025 se dau amenzi** (gata perioada de grație).
- Format: **XML UBL 2.1 / RO-CIUS**, trimis prin **SPV ANAF**, în **max 5 zile lucrătoare** de la emitere.
- Din 2026: extins și la PFA/CNP (fotografi, influenceri etc.) și la persoane impozabile nestabilite în RO dar înregistrate TVA în RO.
- Softuri (toate au plugin WooCommerce + conector e-Factura): **Oblio**, **SmartBill**, **Facturis**.
  - Oblio = simplu + API curat. SmartBill = cel mai popular (Gomag îl folosește nativ). Facturis = ERP/stocuri.

## 💳 Procesatori plăți
- **Netopia (mobilPay)** — RO din 2003, **~1%** comision, modul WooCommerce oficial RO, card + rate + mobilPay Wallet. **Recomandat primar.**
- **PayU**, **EuPlătesc** — alternative RO valide.
- **Stripe** — **~3-4%**, orientat global/SaaS/API. Doar dacă vinde internațional/abonamente.
- **COD / ramburs** — obligatoriu în RO (parte mare din comenzi). Aduce problema rău-platnicilor (vezi blocklist).

## 📦 AWB / Curieri
- Curieri: **Sameday, FAN Courier, Cargus, DPD, GLS.**
- Generare AWB: plugin curier WooCommerce SAU prin **EasySales** / soft facturare. AWB automat la comandă + tracking la client.

## 🛒 eMAG / Marketplace — EasySales
- **EasySales** = automatizare multi-channel: sync stoc+prețuri real-time WooCommerce↔eMAG, import comenzi, AWB auto, facturare (factură/bon/proformă/stornare).
- Mai 2026: +Shein, +meniu inventar, +format PDF custom pt AWB.
- Abonament lunar SaaS, fără contract pe termen / fără minim. **Plătit de client.**
- Pe **Gomag** eMAG e nativ (fără EasySales).

## 🏪 Platforme
- **WooCommerce** — flexibil, deții, toate integrările RO, dar mentenanță+securitate pe tine. → [[WordPress - Decizie & Recomandare]]
- **Gomag** — #1 SaaS RO (>4.500 magazine), eMAG+Netopia+SmartBill/e-Factura+AWB **native**, GoBots automatizări. Chirie + lock-in.
- **Shopify** — UX bun, dar eMAG greoi (via EasySales), e-Factura RO slabă, COD clunky.

## 🔒 Securitate WordPress
WAF (Wordfence/Cloudflare) · 2FA admin · ascuns wp-admin · limit login · reCAPTCHA checkout · backups auto + staging · update-uri regulate · hosting managed.

## ⚖️ GDPR — blocklist clienți
- ✅ **Blocklist intern propriu** (interes legitim, doar magazinul nostru) — OK.
- 🚨 **Listă publică/partajată de rău-platnici = ILEGAL.** `clientineseriori.ro` (78k persoane) → amendat **15.000 lei** de ANSPDCP + ștergere date.
- Nu publica, nu partaja, nu vinde lista. Definește temei + retenție în politica GDPR.

## 📋 Alte obligații 2026 (eMAG/online RO)
- **DAC7** — raportare platforme digitale.
- **GPSR** — conformitate siguranța produsului.
- **Prag TVA** — 395.000 lei.
- Pagini legale obligatorii: Termeni, GDPR/Confidențialitate, Retur (drept retragere 14 zile), Cookie, date firmă + ANPC/SOL.

## Surse (research 24.06.2026)
- e-Factura 2026: [Marosa](https://marosavat.com/vat-news/romania-e-invoicing-e-reporting) · [Enlivy](https://enlivy.ro/ghid-efactura-anaf/) · [iApp](https://iapp.ro/articol/e-factura-in-2026-termene-noi-obligatii-extinse-si-ce-inseamna-asta-in-practica)
- EasySales: [Product updates mai 2026](https://easy-sales.com/blog/ro/product-updates-mai-2026) · [AWB & Invoices](https://easy-sales.com/ro/awb-and-invoices) · [Pricing](https://easy-sales.com/us/pricing)
- Plăți: [Netopia vs Stripe (Noda)](https://noda.live/ro/articles/stripe-vs-netopia) · [Ghid procesatori 2026 (Webhipsters)](https://webhipsters.ro/procesatori-de-plati-online-in-romania/) · [Netopia WP plugin](https://wordpress.org/plugins/netopia-payments-payment-gateway/)
- Gomag vs WooCommerce: [Gomag preturi](https://www.gomag.ro/preturi) · [WooCommerce vs Shopify RO 2026 (Novaweb)](https://novaweb.ro/woocommerce-vs-shopify-in-romania-2026/) · [REGNET magazin legal 2026](https://www.regnet.ro/cum-deschizi-un-magazin-online-legal-in-romania-2026/)
- Blocklist/GDPR: [Lista rușinii (Click)](https://click.ro/news/national/comanzi-online-si-refuzi-sa-platesti-ramburs-ajungi-pe-lista-rusinii) · [Colete refuzate (Capital)](https://www.capital.ro/coletul-refuzat-la-livrare-o-problema-ignorata-care-costa-imm-urile-mii-de-lei-pe-an.html) · [ECOMpedia](https://ecompedia.ro/ne-putem-apara-intr-un-fel-de-clientii-care-nu-accepta-comanda-cand-vine-curierul/)
