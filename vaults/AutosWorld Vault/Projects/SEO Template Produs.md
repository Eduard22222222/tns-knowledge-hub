---
tags: [project, seo, programmatic-seo, product-template, autosworld]
status: template-v1
created: 2026-07-14
---

# SEO Template Produs — Auto'sWorld

> Strategie programmatic SEO (skill: programmatic-seo) + template implementat în `autosworld-platform/prototype/product.html` (demo: Porsche 911 America GS). Fiecare din cele ~8.400 produse primește pagina lui optimizată, generată din datele produsului.

## Feasibility Index: 85/100 → STRONG FIT
| Criteriu | Scor | De ce |
|---|---|---|
| Search Pattern Validity | 18/20 | pattern clar: „macheta {model} {scara}" / „macheta auto {marca}" — exact cum caută colecționarii RO |
| Unique Value per Page | 20/25 | fiecare produs = mașină/scară/brand/preț/poze diferite; întărit cu dimensiuni calculate + editorial |
| Data Availability | 17/20 | catalog OpenCart complet (8.398 SKU, nume structurate cu scară+brand), poze, stoc din feed-uri |
| Intent Alignment | 14/15 | căutare tranzacțională → pagină de cumpărare. Match perfect |
| Competitive Feasibility | 8/10 | competitori RO mici; 10 ani domain equity autosworld.ro; eMAG batabil pe long-tail |
| Sustainability | 8/10 | WooCommerce generează automat din date; stoc/preț se actualizează singure |

## Pattern-ul de pagină (per produs)
- **URL:** `/machete-auto/{brand}/{model-slug}-scara-{scara}` (ex: `/machete-auto/gt-spirit/porsche-911-964-america-gs-scara-1-18`)
- **Title:** `Machetă {Model} {An}, scara {Scara} — {Producător} | Auto'sWorld` (≤60 car.)
- **Meta description:** model + scara + brand + material + preț + stoc + „Livrare Easybox sau curier" (≤155 car.)
- **H1:** `Machetă {Model}, scara {Scara}`
- **Alt imagini:** `Machetă auto {Model} {Culoare} {An}, scara {Scara}, {Producător} — {unghi}`
- **Canonical** self + OG product tags (preț/monedă)

## Schema JSON-LD (3 blocuri per pagină)
1. **Product + Offer** — preț RON, availability, brand, SKU, condition → rich results cu preț+stoc în Google
2. **BreadcrumbList** — Acasă › Machete auto › {Brand} › {Produs}
3. **FAQPage** — 4 întrebări generate din date (dimensiune, material, ediție, livrare)

## Mecanismele de valoare UNICĂ per pagină (anti-thin-content)
1. **Specs table** din date (model real, scară, material, culoare, serie, ambalaj)
2. **📐 „Încape în vitrină?"** — dimensiunea machetei CALCULATĂ din scara + lungimea mașinii reale (ex: 4,25m ÷ 18 = 23,6cm). Unic per produs, util real pentru colecționari — nimeni în RO nu are asta
3. **„Despre modelul real"** — 2-3 paragrafe editorial despre mașina reală + fact-boxes (exemplare produse, CP, an). Se scrie per familie de model (nu per SKU) — reutilizabil pe variante
4. **FAQ vizibil** (mirror al schema) — accordion
5. **Related products** = internal linking pe 3 axe: aceeași scară / același brand / aceeași marcă auto

## Arhitectura de linking (hub & spoke)
- Pagini hub pSEO (fac și ele parte din strategie): `/machete-auto/scara-1-18` („machete auto 1:18"), `/machete-auto/gt-spirit` („machete GT Spirit"), `/machete-auto/porsche` („machete Porsche")
- Fiecare produs → 3 hub-uri; fiecare hub → produsele lui. Breadcrumb-ul întărește ierarhia

## Reguli de indexare (quality gates)
- ✅ index: produse în stoc + epuizate dar căutate (colecționarii caută modele vechi — pagina rămâne 200 cu „anunță-mă")
- ❌ noindex: variante near-duplicate fără căutări, pagini cu date incomplete
- Sitemap-uri segmentate: products / brands / scales; canonical strict; monitorizare indexare per pattern în Search Console
- Kill switch: impresii mari + engagement zero pe un pattern → revizuire template, nu mai multe pagini

## În WooCommerce (implementare la build)
- Rank Math generează title/meta/schema din template-uri cu variabile (product fields + atribute custom: scară, brand machetă, marcă auto, an, material, lungime reală)
- Câmp custom `lungime_masina_reala_mm` → dimensiunea machetei se calculează automat
- Editorialul „Despre modelul real" = câmp per familie de model (task de conținut, se poate genera asistat + verificat)
