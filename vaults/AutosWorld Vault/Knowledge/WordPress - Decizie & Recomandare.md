---
tags: [knowledge, decision, wordpress, woocommerce, custom-design, security]
status: recommendation
created: 2026-06-24
updated: 2026-06-24
---

# WordPress / WooCommerce — Decizie, Variante de Build & Securitate

> **Update 24.06:** Clientul vrea explicit **WordPress** → platforma e decisă. Eduard vrea **design custom făcut de noi (NU temă generică)**, folosind WordPress doar pentru **ecosistemul de plugin-uri** (integrările RO). Deci întrebarea reală: **cum construim design-ul custom + care e exact riscul de securitate.**

## TL;DR
- WordPress/WooCommerce = OK, e platforma cea mai integrată în RO. ✅
- „Design custom, nu template generic" se face în **4 moduri** (de la temă hand-coded → la headless). Recomandare pt buget 4.000 EUR: **temă custom (block theme / clasică hand-coded)** — bespoke, slabă în plugin-uri, intră în buget.
- **Headless** = expresia pură a ideii tale („doar plugin-urile de acolo, frontend-ul nostru") + cea mai bună securitate, dar **peste 4.000** → tier premium / fază 2.
- Riscul WordPress NU e WordPress-ul în sine — e **plugin-urile** (96% din vulnerabilități). Detaliat mai jos.

---

## 🎨 Cum facem design CUSTOM pe WooCommerce — 4 variante

| # | Abordare | Design custom? | Buget (build 4k) | Securitate | Mentenanță |
|---|---|---|---|---|---|
| **A** | **Temă clasică hand-coded** (PHP, bază lean) | ✅ total, dar editezi prin cod | ✅ intră lejer | 🟢 lean (puține plugin-uri design) | dev pt modificări |
| **B** | **Block theme / FSE** (theme.json + block-uri custom) ⭐ | ✅ total + client editează conținut vizual | ✅ intră lejer | 🟢 lean (fără page builder) | modern, future-proof |
| **C** | **Page builder** (Bricks / Elementor Pro) | ✅ vizual, NU template generic | ✅ poate **economisi ore** | 🟠 +1 plugin mare = țintă | update religios obligatoriu |
| **D** | **Headless** (WooCommerce backend + frontend Next.js/React) | ✅✅ fiecare pixel, React/Tailwind/animații | ❌ peste 4k → premium/fază 2 | 🟢🟢 cea mai bună (frontend = zero suprafață WP) | doar noi (dependență de noi) |

### A — Temă clasică hand-coded
- **Pro:** control total pe design, lean (fără plugin-uri de design → suprafață mică de atac), rapid, e WooCommerce standard deci TOATE plugin-urile RO merg.
- **Contra:** orice modificare de design = dev (clientul nu reproiectează singur vizual).
- **Buget:** ✅ intră în 4.000.

### B — Block theme / FSE ⭐ (recomandarea mea pt 4k)
- **Pro:** design 100% custom + **native** (modul modern WP, future-proof), clientul poate ajusta conținut/layout din block editor fără page builder, fără plugin extra de design.
- **Contra:** unele template-uri WooCommerce în FSE încă se maturizează; dev cu skill FSE.
- **Buget:** ✅ intră în 4.000. **Sweet spot: design propriu + lean + în buget.**

### C — Page builder (Bricks > Elementor)
- **Pro:** design complet custom **vizual** (nu e template generic — construiești tu layout-ul de la zero), clientul editează singur vizual, **mai rapid de construit → poate elibera ore din buget**. Bricks e mai lean/rapid decât Elementor.
- **Contra:** adaugi **un plugin mare = țintă de mare valoare** (Bricks a avut RCE critic neautentificat — CVE-2024-25600; Elementor mai multe CVE-uri). Bloat + overhead de performanță. Lock-in pe builder.
- **Buget:** ✅ poate **reduce** orele de build; licență ~€60-130/an.
- ⚠️ Onest: pe un magazin care procesează **plăți + date personale**, n-aș face trade-ul „securitate contra viteză de build". Dacă vrei buget mai mic, mai bine B decât C.

### D — Headless (expresia pură a ideii tale)
- **Pro:** **libertate totală de design** (frontend propriu în React/Next.js, Tailwind, animații — exact „aș folosi doar plugin-urile de acolo"), **performanță** (Lighthouse 95+, load 4.1s→1.9s în cazuri reale), **cea mai bună securitate** (vezi mai jos — frontend public = zero cod WordPress expus).
- **Contra:** **cost cu ~30% mai mare** decât temă custom → **probabil peste 4.000** pt build complet; dev specializat (doar noi → dependență de mentenanță pe noi); checkout/plăți + unele plugin-uri RO presupun un frontend „normal" → muncă în plus la integrare (redirect Netopia, AWB etc.); build mai lung.
- **Buget:** ❌ peste 4.000 pt varianta completă → **tier premium / fază 2 / upsell**.

> **Concluzie pe buget:** cei **4.000 EUR acoperă confortabil o temă custom (B sau A) + integrările RO** → asta e recomandarea care îți respectă cerința „design făcut cum trebuie, nu generic". **Headless = upsell** dacă brand-ul clientului cere un frontend care iese în evidență sau dacă vrei să crești ticketul.

---

## 🔒 EXACT care e problema cu WordPress (risk & security)

**Ideea-cheie: riscul NU e WordPress-ul în sine. E ecosistemul de plugin-uri.** Cifre actuale:

- **96% din vulnerabilități sunt în PLUGIN-uri**, ~4% în teme, iar în **core WordPress doar ~6-7 pe an, toate low-priority** (Patchstack, 2024 & H1 2025).
- **11.334 vulnerabilități noi** descoperite în ecosistemul WP **doar în 2025 — +42% față de anul precedent.** Suprafața de atac e ecosistemul, nu WP.
- WordPress rulează ~40%+ din web → **ținta #1 a boților automați.** Site-urile WP sunt scanate non-stop.

### Mecanismul (de ce se întâmplă)
Fiecare plugin = cod de la **alt vendor terț**, cu alt standard de securitate = **risc de supply chain**. Un magazin cu facturare + plăți + eMAG + AWB + e-Factura + SEO + cache + anti-fraudă ajunge ușor la **15-25 plugin-uri** — fiecare, o potențială intrare.

### Ce face concret un atacator pe un magazin WooCommerce
- **Card skimming (Magecart):** injectează JS malițios la checkout care **fură datele cardului**. → Mitigare: **plată hosted (Netopia redirect/iframe)** → datele cardului NU ating site-ul nostru.
- **Furt date personale clienți** (nume, adrese, telefoane, istoric comenzi) = **breșă GDPR** → amenzi + reputație.
- **Preluare admin / privilege escalation** → control total, defacement, spam, ransom.
- **Manipulare preț/comenzi, cupoane false.**

### De ce e o problemă CONTINUĂ (nu „set & forget")
- **Update treadmill:** când un CVE de plugin devine public, boții îl exploatează în **ore-zile**. Trebuie patch-uit rapid. DAR update-ul poate **strica site-ul** → ai nevoie de **staging + testare** → asta e muncă = **retainerul de mentenanță**. Nu există „îl fac și-l uit".
- **Plugin-uri abandonate:** un plugin care nu mai e actualizat devine o **gaură permanentă**. Plugin-urile RO de nișă (unele curier/facturare) sunt făcute de echipe mici → risc de abandon.
- **Atacuri pe login:** `wp-login.php` / `wp-admin` sunt universale → brute-force constant → nevoie de 2FA + rate-limit + login ascuns.
- **Chiar și plugin-urile „bune" iau CVE-uri:** Wordfence însuși, Bricks (RCE critic), Elementor (multiple). **Mai multe plugin-uri = mai multă suprafață, indiferent cât de „de încredere" sunt.**

### Cum schimbă riscul varianta de build (de ce contează alegerea de mai sus)
- **Mai puține plugin-uri = suprafață mai mică.** Temă custom (A/B) evită plugin-urile de design-bloat → mai lean → mai sigur. **Aici se aliniază bugetul + securitatea + cerința ta de design custom.**
- **Page builder (C)** adaugă un plugin țintă de mare valoare → update religios.
- **Headless (D)** = site-ul public e o aplicație Next.js **separată, cu ZERO cod WordPress expus vizitatorilor** → elimină practic toată suprafața de atac din frontend (nu există `wp-login` public, niciun cod de temă/plugin nu rulează pentru useri); `wp-admin` stă în spatele IP/VPN. **Cea mai puternică poziție de securitate.** Trade-ul = cost/complexitate.

### Stack-ul de mitigare (indiferent de variantă)
Hosting **managed WP** (nu shared ieftin) · **WAF** (Wordfence/Cloudflare) · **2FA** admin · login ascuns + rate-limit · **reCAPTCHA** checkout · **backups auto + staging** · **patching lunar** (retainer) · **minim de plugin-uri, toate verificate** · **plată hosted** (cardul nu atinge site-ul) · conturi admin cu privilegii minime.

> 💰 **Securitatea nu e doar cost — e linie de venit pt TNS** (hardening la build + retainer lunar) și protecția ta onestă: fără retainer, NU garantăm site-ul în timp. Un WooCommerce nemenținut, care ține plăți + date personale, e o răspundere, nu un activ.

---

## Pentru contract — ce-i propunem clientului
1. **Platformă:** WooCommerce (confirmat). **Design:** temă **custom block/FSE** (varianta B) în cei 4.000 — bespoke, nu template.
2. **Opțional premium:** **headless** ca tier superior / fază 2, dacă vrea frontend care iese în evidență (cost peste 4.000).
3. **Split obligatoriu în contract:** **BUILD (4.000)** vs **RUN** (hosting + abonamente facturare/EasySales) vs **MENTENANȚĂ & SECURITATE (retainer lunar)**.
4. **Hardening de securitate** = parte explicită din scope (nu „bonus invizibil") — listat ca livrabil + retainer.

---

## Anexă: alternativa non-WordPress (doar pt referință, clientul a ales WP)
**Gomag** (SaaS RO) ar fi avut eMAG+Netopia+SmartBill/e-Factura+AWB native, zero mentenanță plugin-uri — dar **template-uri mai rigide** (fix ce NU vrea Eduard: design generic) + chirie + lock-in. → Pe cerința „design custom făcut de noi", **WooCommerce + temă custom e răspunsul corect**, Gomag pică tocmai pe design.

## Surse (research 24.06.2026)
- Vulnerabilități: [Patchstack State of WP Security 2025](https://patchstack.com/whitepaper/state-of-wordpress-security-in-2025/) · [Patchstack 2026](https://patchstack.com/whitepaper/state-of-wordpress-security-in-2026/) · [Wordfence weekly](https://www.wordfence.com/blog/2025/12/wordfence-intelligence-weekly-wordpress-vulnerability-report-december-8-2025-to-december-14-2025/)
- Cost build / headless: [WooCommerce dev cost 2026 (Needlecode)](https://needlecode.com/blog/woocommerce/woocommerce-development-cost-2026-pricing-guide.html) · [Headless vs traditional 2026 (HaartyHanks)](https://www.haartyhanks.com/blog/headless-wordpress-vs-traditional-wordpress-2026/) · [Shopify vs Woo vs Headless cost (Pixelmovers)](https://pixelmovers.co/blog/shopify-vs-woocommerce-vs-headless-comparison)
