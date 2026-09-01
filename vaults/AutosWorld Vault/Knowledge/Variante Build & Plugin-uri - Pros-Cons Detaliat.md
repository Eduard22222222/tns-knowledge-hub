---
tags: [knowledge, decision, build-variants, plugins, pros-cons, woocommerce]
status: detailed-comparison
created: 2026-06-24
---

# Variante de Build & Plugin-uri — Pros/Cons Detaliat

Listă detaliată: (1) cele 4 variante de build, fiecare cu pros/cons complet, și (2) stack-ul de plugin-uri pe funcții, cu opțiuni + pros/cons + recomandare. Principiu transversal: **minim de plugin-uri = mai sigur + mai rapid** (vezi [[Vulnerabilitati Reale + Cum le Batem]]).

---

# PARTEA 1 — Variantele de build

## A) Temă clasică hand-coded (PHP)
Temă proprie scrisă de la zero (sau pe bază lean tip Underscores/blank), fără page builder.

**✅ PRO**
- Control **total** pe design — exact ce desenăm, fără compromisuri de template.
- **Lean** — cod doar cât trebuie → site rapid + suprafață mică de atac (puține dependențe).
- WooCommerce **standard** → toate plugin-urile RO (facturare/plăți/AWB/eMAG) merg garantat.
- Fără licențe de builder, fără lock-in pe un tool terț.
- Performanță foarte bună din start (fără bloat).

**❌ CONTRA**
- Orice modificare de design = **dev** (clientul nu schimbă singur layout-ul vizual).
- Timp de build mai mare decât cu builder (totul se codează).
- Mentenanță cod PHP în timp (dar puțin, fiind lean).
- Mai „old-school" față de FSE (vezi B).

**Buget 4k:** ✅ intră. **Cui i se potrivește:** vrei lean + performanță + nu te deranjează că modificările trec prin dev.

---

## B) Block theme / FSE (Full Site Editing) ⭐ RECOMANDAT pt 4k
Temă custom construită cu sistemul nativ modern WP: `theme.json` + block-uri/patterns custom.

**✅ PRO**
- Design **100% custom** + **native WP** (modul oficial modern, future-proof — direcția în care merge WordPress).
- **Lean ca A** — fără plugin de page builder → suprafață mică de atac.
- Clientul poate **ajusta conținut/layout** singur din block editor (texte, secțiuni, bannere) fără să strice design-ul de bază.
- Performanță foarte bună (cod nativ, fără overhead de builder).
- Mai ușor de întreținut decât tema clasică (mai puțin PHP custom, mai mult config).

**❌ CONTRA**
- Unele template-uri **WooCommerce în FSE** încă se maturizează → ocazional un workaround.
- Necesită **dev cu skill FSE** (mai nou, mai puțini oameni decât pe teme clasice).
- Libertate vizuală foarte exotică poate cere totuși block-uri custom (cod).

**Buget 4k:** ✅ intră lejer. **Cui i se potrivește:** **sweet spot-ul nostru** — design propriu + lean + clientul editează conținut singur + în buget.

---

## C) Page builder (Bricks recomandat > Elementor Pro)
Design custom construit **vizual** într-un builder, fără a coda o temă.

**✅ PRO**
- Design custom **vizual**, drag-and-drop — NU template generic, construiești tu layout-ul.
- **Cel mai rapid de construit** → poate **elibera ore din buget** (ajută bugetul).
- Clientul **editează singur vizual** orice (cea mai mare autonomie pt client).
- Pool mare de freelanceri care lucrează pe builder.
- Bricks e modern, mai lean și mai rapid decât Elementor.

**❌ CONTRA**
- **+1 plugin mare = țintă de mare valoare** (Bricks a avut RCE critic CVE-2024-25600; Elementor multiple CVE-uri) → vezi [[Vulnerabilitati Reale + Cum le Batem]].
- **Bloat + overhead** de performanță (mai mult cod, mai mult de optimizat).
- **Lock-in pe builder** — greu de migrat dacă renunți la el.
- Licență anuală (Bricks ~€60-130/an).
- Risc de „builder mentality" → poate aluneca spre design generic dacă nu ești disciplinat.

**Buget 4k:** ✅ poate **reduce** orele. **Cui i se potrivește:** clientul vrea să editeze singur tot + vrem build rapid. ⚠️ **Onest:** pe un magazin cu plăți + date personale, nu aș face trade-ul securitate-contra-viteză. Dacă vrei mai ieftin, mai bine **B** decât C.

---

## D) Headless (WooCommerce backend + frontend Next.js/React)
WordPress/WooCommerce = backend (admin + plugin-uri + integrări). Frontend public = aplicație separată în Next.js care trage date prin REST/GraphQL.

**✅ PRO**
- **Libertate totală de design** — fiecare pixel, React/Tailwind/animații; expresia pură a ideii „doar plugin-urile de acolo, frontend-ul nostru".
- **Performanță vârf** — Lighthouse 95+, load 4.1s→1.9s în cazuri reale.
- **Cea mai bună securitate** — frontend public are **ZERO cod WordPress expus**; nu există `wp-login` public, niciun cod de temă/plugin nu rulează pentru vizitatori; `wp-admin` stă în spatele IP/VPN. Elimină practic toată suprafața de atac din frontend.
- Decuplare → poți schimba frontend-ul fără să atingi backend-ul.

**❌ CONTRA**
- **Cost ~30% mai mare** decât temă custom → **probabil peste 4.000** pt build complet.
- **Dev specializat** (React + WP headless) → puțini oameni, **dependență de mentenanță pe noi**.
- **Checkout/plăți + unele plugin-uri RO** presupun un frontend „normal" → muncă în plus (redirect Netopia, AWB, e-Factura, plugin-uri care randează HTML clasic).
- **Build mai lung** + două sisteme de întreținut (WP + Next.js).
- Overkill dacă magazinul nu are nevoie de performanță/brand de top.

**Buget 4k:** ❌ peste → **tier premium / fază 2 / upsell.** **Cui i se potrivește:** brand care vrea frontend care iese în evidență + are buget peste 4k.

---

## Tabel sumar variante
| Criteriu | A clasică | **B FSE ⭐** | C builder | D headless |
|---|---|---|---|---|
| Design custom | ✅ total | ✅ total | ✅ vizual | ✅✅ maxim |
| Client editează singur | ❌ | 🟡 conținut | ✅ tot | ❌ |
| Performanță | 🟢 | 🟢 | 🟠 | 🟢🟢 |
| Securitate (suprafață) | 🟢 lean | 🟢 lean | 🟠 +builder | 🟢🟢 frontend curat |
| Viteză de build | 🟠 | 🟡 | 🟢 rapid | 🔴 lent |
| Buget 4.000 | ✅ | ✅ | ✅ (economisește) | ❌ peste |
| Lock-in | 🟢 niciun | 🟢 niciun | 🔴 builder | 🟡 stack nostru |

---

# PARTEA 2 — Plugin-uri (pe funcții)

> Regula: **fiecare plugin = suprafață de atac + update de întreținut.** Țintim **minimul necesar**, toate **active + bine întreținute**. Unde un singur tool acoperă mai multe funcții (ex. EasySales = eMAG+AWB+facturare), e un **câștig** (mai puține plugin-uri pe site).

## 1. Facturare + e-Factura `[ESENȚIAL]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| **Oblio** ⭐ | ieftin, API curat, simplu, e-Factura inclus, plugin WooCommerce | mai puțin „ERP" pt gestiune complexă |
| **SmartBill** | cel mai popular, ecosistem larg, e-Factura, leagă AWB în același flux | abonament puțin mai scump |
| **Facturis** | ERP/stocuri puternic, e-Factura | mai greu/complex decât trebuie pt magazin mic |
| **FGO** | alternativă RO ieftină | ecosistem mai mic |

**Recomandare:** **Oblio** (simplu/ieftin) sau **SmartBill** (dacă vrea ecosistem + leagă ușor AWB). **Obligatoriu** conector **e-Factura** (mandatory 2026). Cost = abonament client.

## 2. Plăți online `[ESENȚIAL]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| **Netopia mobilPay** ⭐ | RO, comision ~1%, plugin oficial RO, **hosted (card nu atinge site-ul)**, rate, mobilPay Wallet | onboarding RO business |
| **PayU** | RO, popular, rate | comisioane variabile |
| **EuPlătesc** | RO, ieftin | UI mai vechi |
| **Stripe** | API/DX excelent, internațional | ~3-4%, mai puțin „RO", COD slab |
| **COD / Ramburs** (core Woo) | obligatoriu în RO, gratis | aduce rău-platnicii (vezi blocklist) |

**Recomandare:** **Netopia primar + COD/ramburs obligatoriu.** Plata **hosted** = mitigare #1 anti-skimming.

## 3. eMAG / Marketplace `[OPȚIONAL — decide fază]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| **EasySales** ⭐ | sync stoc/preț real-time, import comenzi, **AWB + facturare incluse**, multi-marketplace, **1 connector = 3-4 funcții** | abonament lunar (client) |
| Plugin eMAG direct | fără SaaS intermediar | mai fragil, fără sync robust multi-canal |

**Recomandare:** **EasySales** dacă vinde și pe eMAG (consolidează eMAG+AWB+facturare → mai puține plugin-uri pe site). Decide: **lansare sau fază 2?**

## 4. AWB / Curieri `[ESENȚIAL dacă livrăm cu curier]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| **CurieRO** | plugin-uri gratuite per curier (FAN/Sameday/Cargus/DPD), AWB auto, label PDF/ZPL | per curier (mai multe plugin-uri dacă folosești mai mulți) |
| **eAWB** | multi-curier, prețuri negociate (reduceri până la ~50%) | dependență de platforma lor |
| **Flavor** (fost BookuriOnline) | **umbrella** — FAN+Sameday+Cargus+DPD într-un singur plugin | încă o dependență terță |
| **Via EasySales / SmartBill** | AWB în același flux cu facturarea, fără plugin curier separat | doar dacă folosești acel tool |

**Recomandare:** dacă folosim **EasySales sau SmartBill**, lăsăm AWB-ul acolo (zero plugin curier în plus). Altfel, **Flavor** (umbrella, 1 plugin) sau **CurieRO** pt curierul ales.

## 5. Câmpuri RO checkout + CUI/ANAF `[ESENȚIAL]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| Plugin RO checkout (județ/localitate + CUI + Reg.Com. + lookup ANAF) | persoană juridică corectă, autofill din CUI, mai puține greșeli | de ales unul bine întreținut |
| Câmpuri custom (în temă) | zero plugin extra, lean | dev + întreținere pe noi |

**Recomandare:** rezolvă punctul „B2B să lase detalii" (vezi [[01 - Intrebari Deschise (Raspunsuri + Research)]] §2). Preferabil **integrat cu soft-ul de facturare** ca să nu dublezi.

## 6. Securitate `[ESENȚIAL]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| **Wordfence** ⭐ | 4M+ instalări, WAF la nivel server, scanner malware, 2FA, login security | versiunea bună e premium; consumă resurse |
| **Patchstack** | **virtual patching** (blochează exploit înainte de update), lightweight | mai mult „shield" decât scanner complet |
| **Solid Security** | login hardening, 2FA, bun all-round | WAF mai slab decât Wordfence |
| **Cloudflare** (WAF+CDN) | apărare la nivel de rețea (înainte să ajungă la WP), + viteză | config corect necesar |

**Recomandare:** **Cloudflare (WAF/CDN) + Patchstack (virtual patching)** ± Wordfence (scanner+2FA). Defense-in-depth — nu doar un plugin (malware-ul Bricks dezactiva plugin-urile de securitate).

## 7. Performanță / Caching `[ESENȚIAL]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| **LiteSpeed Cache** ⭐ (dacă hosting LiteSpeed) | gratis, top, ESI pt coș/checkout dinamic | doar pe servere LiteSpeed/OpenLiteSpeed |
| **WP Rocket** | cel mai bun pe Apache/Nginx, exclude auto coș/checkout, $59/an | premium |
| **FlyingPress** | a depășit WP Rocket în benchmark-uri 2025 | premium, mai nou |
| W3TC / WP Super Cache | gratis | config mai delicat |

**Recomandare:** **LiteSpeed Cache** dacă alegem hosting LiteSpeed (gratis + foarte bun), altfel **WP Rocket**. WooCommerce: coș/checkout NU se cachează.

## 8. Backup `[ESENȚIAL]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| **Backup-uri la hosting managed** ⭐ | automate, off-site, zero plugin | depinde de host |
| **UpdraftPlus** | popular, off-site (S3/Drive) | încă un plugin |

**Recomandare:** preferabil **la nivel de hosting** (un plugin mai puțin). Obligatoriu **off-site + staging** pt update-uri.

## 9. SEO `[RECOMANDAT]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| **Rank Math** ⭐ | gratis generos, schema, rapid | UI încărcat |
| **Yoast SEO** | standard, stabil | features bune = premium |

## 10. GDPR / Cookie + Legal RO `[ESENȚIAL legal]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| **Complianz** / CookieYes | cookie consent conform, scan automat | config |
| Pagini legale (Termeni, Confidențialitate, Retur 14 zile, ANPC/SOL) | obligatorii legal | conținut de redactat |

## 11. Anti-fraudă / Blocklist clienți `[OPȚIONAL]`
| Opțiune | ✅ Pro | ❌ Contra |
|---|---|---|
| **WooCommerce Anti-Fraud** | scoring comenzi riscante | tuning |
| **Blacklister / Block bad customers** | blochează telefon/email/IP rău-platnic | **GDPR: doar intern!** (vezi §6 întrebări) |

**Recomandare:** blocklist **intern propriu** pt refuz-ramburs (legal). 🚨 NU listă publică (amendă ANSPDCP 15.000 lei — vezi [[Stack RO Ecommerce 2026 - Referinta]]).

---

## 🎯 Stack-ul minim recomandat (cel mai puțin risc)
1. **Temă custom FSE (varianta B)** — zero plugin de design
2. **Oblio/SmartBill** — facturare + e-Factura
3. **Netopia** (hosted) + COD
4. **EasySales** SAU plugin curier — eMAG/AWB (consolidat)
5. **Câmpuri RO + CUI** checkout
6. **Cloudflare + Patchstack** (± Wordfence) — securitate
7. **LiteSpeed/WP Rocket** — cache
8. **Rank Math** + **Complianz** — SEO + cookie
9. Backup la **hosting** + blocklist intern

≈ **8-10 plugin-uri esențiale**, fără bloat. Fiecare adăugat în plus = justificat sau respins. Asta e diferența între un magazin „sigur cât se poate" și unul care se sparge în 3 luni.

## Surse (research 24.06.2026)
- Curieri: [Creative Side](https://creative-side.ro/integrare-curieri-in-woocommerce-sameday-fan-courier-urgent-cargus-optiuni-si-bune-practici/) · [CurieRO](https://curie.ro/) · [eAWB](https://www.eawb.ro/integrari/woocommerce)
- Securitate/cache: [Patchstack caching](https://patchstack.com/articles/best-wordpress-caching-plugins/) · [WP Rocket vs LiteSpeed (RunCloud)](https://runcloud.io/blog/litespeed-vs-wp-rocket-cache) · [WooCommerce caching (WPBundle)](https://www.wpbundle.com/guides/best-woocommerce-caching-plugins)
