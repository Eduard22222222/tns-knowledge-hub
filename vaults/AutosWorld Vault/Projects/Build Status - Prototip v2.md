---
tags: [project, autosworld, build, prototype, status]
status: in-progress
updated: 2026-07-10
---

# Build Status — Prototip v2 „Night Showroom Editorial"

## ✅ Aprobat de Eduard (10.07.2026)
Direcția v2 aprobată: „imi place ce ai facut, suntem pe direcția bună". V1 respins (arăta „vibecoded": font generic, animație canvas, poze AI Gemini).

## Design system v2 (regulile jocului)
- **Estetică:** Night Showroom Editorial — dark chrome (#0A0B0D/#111318), accent roșu #D22C3A (din logo), plăcuțe albe pt produse
- **Fonturi:** Clash Display (display/numerale) + General Sans (body) — Fontshare CDN
- **Logo:** cel REAL de pe site (`assets/logo-autosworld.png`, outline alb + glob cu anvelopă)
- **Hero:** video REAL Pexels — Bentley negru noaptea (`assets/video/bentley-night-hd.mp4`, 1080p, 3,9MB, licență Pexels ok)
- **Poze produse:** ORIGINALELE de pe site (hotlink autosworld.ro) — NU AI-generated (feedback explicit)
- **Motion:** word-rise hero, count-up stats, marquee branduri, tilt subtil, spark on add-to-cart. FĂRĂ gimmick-uri (magnet buttons, spotlight-uri scoase)

## Pagini gata (în `Desktop/claude/autosworld-platform/prototype/`)
| Pagină | Fișier | Status |
|---|---|---|
| Homepage | `index.html` | ✅ v2 aprobat |
| Catalog + filtre funcționale (scară/brand/preț/stoc/limitat, sort, chips) | `catalog.html` | ✅ verificat vizual |
| **Pagină produs — SEO TEMPLATE** | `product.html` | ✅ verificat vizual (demo: Dacia 1310 Salvarea) |
| Coș (bara transport gratuit ≥300 lei, qty/remove, sumar live, empty state) | `cart.html` | ✅ verificat vizual |
| Checkout one-page (PF/**PJ cu CUI→ANAF autofill**, **Easybox 16,99 / curier 21,99** cu total live, **card LibraPay hosted / ramburs +5 lei**, overlay succes cu fluxul email automat) | `checkout.html` | ✅ verificat vizual |

**Scheletul e COMPLET**: home → catalog → produs → coș → checkout, toate legate prin navigare (iconițele de coș duc la cart.html).
Screenshots verificate în `autosworld-platform/shots/`. **Preview local persistent** (run_in_background): http://127.0.0.1:5190/prototype/ — dacă pică după restart, repornește: `python -m http.server 5190 --bind 127.0.0.1 --directory "C:/Users/adumi/OneDrive/Desktop/claude/autosworld-platform"`

## 🔍 SEO Template per produs (formula, în `product.html`)
Fiecare produs generează automat din date ({marca} {model} {scara} {brand} {pret} {stoc}):
1. **Title** ≤60 car: `Macheta {marca} {model}, scara {scara} — {tip} | Auto'sWorld`
2. **Meta description** ≤155 car: beneficiu + preț + stoc + livrare
3. **Slug curat:** `/machete-auto/{marca}-{model}-scara-{x-y}`
4. **Product schema JSON-LD** — preț/stoc/brand/SKU/livrare → rich results Google
5. **BreadcrumbList schema** + breadcrumbs vizibile (internal linking spre hub-uri categorie/scară)
6. **FAQPage schema** sincron cu accordion vizibil (3 întrebări reale: dimensiuni, material, livrare)
7. **Conținut unic per produs:** specs table (cu lungimea machetei CALCULATĂ din scara + mașina reală) + „Despre modelul original" (povestea mașinii = conținut care rankează, nu thin content)
8. **og:/twitter cards** pt share
9. Alt-uri descriptive pe toate imaginile; related products = internal links

## Reguli de proiect (directivele lui Eduard — NU uita)
1. Design 100% custom — scheletul întâi, produsele după
2. **Clientul ALEGE ce produse migrăm** (nu toate cele 8.398)
3. **Deploy DOAR când totul e gata** — OpenCart rămâne live până atunci (build pe staging)
4. WordPress = doar motor + plugin-uri; fonturi/animații/design = ale noastre (temă custom pixel-identică cu prototipul)
5. Pozele produselor = originalele de pe site; AI photos respinse (Gemini looks fake); dacă vreodată AI → Higgsfield ultra-realist cu prompting serios, să se vadă că e machetă

## 🏗️ STAGING LIVE (setup headless prin API-uri, 15.07.2026)
**https://staging.autosworld.ro** — construit integral prin cPanel UAPI + Softaculous API + WP REST API (fără browser):
| Componentă | Status |
|---|---|
| Subdomeniu staging (docroot IZOLAT: `/home/autoswor/staging.autosworld.ro`, în afara public_html) | ✅ |
| PHP: staging pe **ea-php82**; ⚠️ **LIVE rămâne pe ea-php56 — NU se atinge!** (OpenCart vechi depinde de el) | ✅ |
| WordPress instalat (Softaculous API, `api=json`), RO, HTTPS forțat prin wp-config (AutoSSL emis rapid) | ✅ |
| **Anti-indexare**: `X-Robots-Tag: noindex, nofollow` în .htaccess — a NU se șterge până la cutover! | ✅ |
| **WooCommerce 10.9.4** — activ, /shop/ funcțional | ✅ |
| **LiteSpeed Cache 7.8.1** — activ, cache HIT confirmat | ✅ |
| **Rank Math SEO 1.0.273** + **Complianz GDPR 7.5.0** — active | ✅ |
| Credențiale (admin + app password REST) | `autosworld-platform/staging-credentials.txt` (local) |

Rețetă tehnică (pt. reuse): Softaculous remote API = `frontend/jupiter/softaculous/index.live.php?act=software&soft=26&api=json` cu Basic Auth cPanel; plugin-uri prin `POST /wp-json/wp/v2/plugins {"slug","status":"active"}` cu Application Password (creat via cookie login + X-WP-Nonce); fișiere prin `Fileman/upload_files` (save_file_content refuză dotfiles).

## 🎨 TEMA CUSTOM PORTATĂ PE STAGING (15.07.2026) — designul e LIVE pe WordPress
**Decizie arhitectură:** temă CLASICĂ cu override-uri WooCommerce (nu FSE) — fidelitate pixel-perfect; FSE s-ar fi luptat cu markup-ul Woo. Temă `autosworld` în `autosworld-platform/theme/autosworld/` (style.css = design system consolidat, functions.php, header/footer, front-page, index, woocommerce/{content-product, archive-product, single-product}, assets js+logo+video). Deploy: ZIP → Fileman upload → API2 `Fileman::fileop op=extract` → activare via cookie+nonce din themes.php (link JSON-escaped `&`).

| Verificat pe staging (screenshots în shots/) | Status |
|---|---|
| Homepage: video Bentley + Clash Display + hero identic prototip | ✅ |
| Catalog `/machete-auto/`: H1, 12 produse, prețuri **lei** (RON right_space, 0 zecimale), sidebar filtre | ✅ |
| **Filtrare NATIVĂ Woo testată**: filter_scara=118→10, =124→1, filter_producator=otto-mobile→3, max_price=200→2 | ✅ |
| PDP: galerie+chips, specs din atribute (Scară cu ~cm), qty+Adaugă în coș, FAQ, related | ✅ |
| **SEO schema pe produs: FAQPage + BreadcrumbList (ale noastre) + Product (WC core, preț+stoc)** | ✅ 3× JSON-LD |
| 12 produse reale seed prin wc/v3 REST (_seed.py) + 5 atribute (scara/producator/marca-auto/material/editie) | ✅ |

**Gotchas documentate:** slug termeni scara = `118` nu `1-18` (sanitize_title taie `:`); coming-soon Woo se dezactivează cu POST `/wp-json/wc-admin/options {"woocommerce_coming_soon":"no"}`; după schimbarea slug-ului paginii shop → RE-SALVEAZĂ permalinks (rewrite flush) altfel arhiva e goală; Woo Product schema nu se emite din template custom → trigger manual `WC()->structured_data->generate_product_data()` pe wp_footer prio 5; JS count-up trebuie scoped `.count[data-to]`. ⚠️ Incident recuperat: parola admin pierdută la rescrierea creds file (heredoc a truncat înainte de citire) → recuperat prin app password REST `POST /wp/v2/users/me {"password"}` — NU citi și scrie același fișier în heredoc!

## 🧭 DISCOVERY LAYER (16.07.2026) — Noutăți / Limitate / Colecții / Search / Brand wheel
| Livrat | Detaliu |
|---|---|
| **Wheel mărci auto pe homepage** | înlocuit marquee-ul de producători cu **18 logo-uri reale de mărci** (Dacia, Porsche, BMW, Audi, VW, Ferrari, Lambo, Aston, Nissan, Volvo, Bugatti, Ford, Toyota, Seat, Renault, Opel, Peugeot, Mazda) din Simple Icons CDN (culoare chrome D4D8DE), salvate local în `assets/brands/`; fiecare logo = link spre catalogul filtrat pe marca respectivă. ⚠️ Mercedes + Alfa Romeo nu există pe CDN (trademark) — de adăugat din altă sursă. |
| **/noutati/** | pagină editorială proprie (template `page-noutati.php`): hero + ultimele 12 produse + mesaje rotație stoc |
| **/editii-limitate/** | hero red-tint „Când se termină, s-a terminat." + **metrici LIVE** (6 modele, 16 bucăți, 0 reeditări) + grid DOAR produse cu pa_editie=limitata (tax_query) |
| **/colectii/** | 4 carduri editoriale curate numerotate (Mașini de Legendă RO / GT Spirit 1:18 / Otto Youngtimers / Micro 1:64), fiecare → catalog filtrat |
| **Search overlay** (lupa din header) | input mare Clash Display (?s=&post_type=product) + chips generate DIN taxonomii: scară / **marcă auto** / producător → filtrare instant. ESC/backdrop close. Woo redirectează singur-rezultat direct la produs (testat: „porsche"→PDP, „dacia"→2 rezultate). |
| Nav + footer | actualizate spre paginile noi |
Pagini create prin REST (page-{slug}.php se aplică automat). Screenshots verificate în shots/ (staging-limitate/colectii/noutati.png).

## 🎭 FORMATE DISTINCTE Noutăți & Ediții Limitate (17.07, cerința Eduard „să se știe că-s diferite")
- **/editii-limitate/ → format „certificat de serie”** (v1.2.1): carduri ORIZONTALE mari 2/rând (nu grid 4), **No. 01/06 serial** roșu Clash, badge „SERIE LIMITATĂ · scara”, **gauge de stoc animat care se golește la scroll** („doar 3 bucăți rămase / ULTIMA bucată” amber + „se epuizează”), **spotlight roșu mouse-follow** + **shine sweep** pe imagine (pattern-uri React Bits/Aceternity adaptate vanilla), CTA „REVENDICĂ PIESA”, metrici hero cu count-up.
- **/noutati/ → format „fresh drop”**: ultima intrare = **card erou 2×2** cu tag verde „ULTIMA INTRARE” (dot blink), TOATE cardurile cu timbru **„● NOU · sosit azi/acum X zile”** (dot pulse, data reală din publish date). Notă: acum toate zic „sosit azi” fiindcă seed-ul e din aceeași zi — se diversifică natural cu produse reale.
- **Bug-uri prinse & lecții:** (1) selectorul `.lim-meta div span` prindea și span.count din `<b>` → fix `div>span` (descendant vs child!). (2) Helper-ul bash de upload cu `$(python)` nested a raportat OK dar NU a scris fișierul — folosește DOAR URL-uri explicite %2F la Fileman. (3) La ORICE schimbare CSS: bump version (cache-buster) + purge LSCache (ciclare plugin litespeed-cache prin REST) — altfel utilizatorii văd site „stricat” cu CSS vechi (incidentul cu Eduard).

## 🛒 CART & CHECKOUT SKIN + MECANICA REALĂ (18.07, v1.4.1)
| Livrat | Detaliu |
|---|---|
| Pagini convertite la **shortcode clasic** | blocurile noi Woo nu permit skin custom + plugin-urile RO de plată cer checkout clasic; titluri RO („Coșul tău"/„Finalizare comandă") |
| **Zona livrare România (id 1)** | Easybox (Sameday) 16,99 · Curier la adresă 21,99 · **Transport GRATUIT ≥300 lei** — apar ca option-cards în checkout, total live |
| **Ramburs (COD)** activ | „Plătești cash sau cu cardul la primirea coletului." |
| **Default RO:B** + vânzare restricționată la RO | checkout-ul se deschide pe România/București (era US:CA!); doar județe RO |
| **Cart skin** | bara transport gratuit (hook `woocommerce_before_cart`, prag 300, verde la atins), item-cards cu tile alb, sumar sticky, cupon stilizat |
| **Checkout skin** | grid 2 coloane (formular / Comanda ta sticky), câmpuri full-width, select2 dark, payment/shipping option-cards, Plasează comanda full-width |
| `page.php` nou | wrapper lat pt cart/checkout/account, îngust pt pagini normale |
**Gotchas:** `woocommerce_default_country` cere format `RO:B` (country:state); diacriticele prin curl/shell se mojibake-uiesc → TOATE payload-urile JSON cu diacritice prin python urllib (ensure_ascii); heredoc bash mare cu CSS a picat pe Windows → Write tool + `cat file >> style.css`; fix grid checkout: `#customer_details{grid-row:1/span 9}` ca să nu împingă order_review.
**Polish rămas:** textul de confidențialitate încă EN (traducere ulterioară); free shipping nu e auto-selectat când e eligibil (Woo ia prima metodă).

## 🧱 HUB-URI SEO + LANDING CADOURI (19.07, v1.5.0) — implementarea keyword map-ului
| Livrat | Detaliu |
|---|---|
| **6 categorii-hub create** (wc/v3, id 44-49) | machete-auto-românești (Dacia asignate) · camioane · tractoare · motociclete · kituri-de-construit · vitrine-machete — fiecare cu **descriere SEO** din keyword map |
| **Descrieri pe arhive** | archive-product.php afișează term_description sub H1 (bloc .cat-desc cu bordură roșie) — verificat pe /product-category/machete-auto-romanesti/ |
| **Landing /cadouri-pasionati-auto/** | 3 tiere de buget (Sub 100 „Mici atenții" / 100–500 „Cadoul sigur" / Peste 500 „Piesa de vitrină") cu produse reale împărțite pe preț + notă de ghidare + asigurări cadou (ambalaj/retur/livrare) — țintește „cadou pasionat mașini" |
| **Footer** | + Machete auto românești, + Cadouri pentru pasionați |
| **Polish checkout** | free_shipping sortat PRIMUL (auto-selectat când e eligibil, filter woocommerce_package_rates) + text confidențialitate checkout în RO (filter woocommerce_get_privacy_policy_text) |
Verificate vizual (shots/staging-cat-ro.png, staging-gifts.png). Notă: tierele cu 1 produs arată gol pe grid 4-col — se umple la importul catalogului real.

## Next steps
- [ ] Eduard vede staging-ul → feedback
- [ ] Logo Mercedes + Alfa Romeo din altă sursă (nu-s pe Simple Icons)
- [ ] **Keyword research (Ahrefs MCP) → titluri/descrieri finale per categorie + template title Rank Math**
- [ ] Config Rank Math (wizard, sitemap, title templates) + pagina shop ca hub SEO
- [ ] Cart/checkout skin complet custom (acum e skin CSS light pe template-urile Woo)
- [ ] Plugin custom email post-plată (confirmare + AWB)
- [ ] EasySales connect (staging ca magazin nou) + import catalog curat (lista clientului)
- [ ] LibraPay + Oblio/Facturis + Sameday Easybox (conturi de la client)
- [ ] La final: cutover pe autosworld.ro cu 301 (NIMIC pe live până atunci — directiva Eduard)
