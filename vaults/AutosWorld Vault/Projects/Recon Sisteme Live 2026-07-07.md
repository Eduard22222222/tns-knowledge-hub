---
tags: [project, recon, autosworld, opencart, easysales, hosting, analysis]
status: discovery
created: 2026-07-07
---

# Recon Sisteme Live Auto'sWorld — 07.07.2026

Analiză read-only (nu s-a modificat nimic pe sistemele live) pe cele 3 accesuri primite de la client.

## 🛒 OpenCart (autosworld.ro/admin) — magazinul actual
| Metric | Valoare |
|---|---|
| **Produse (SKU)** | **8.398** (168 pagini) — ⚠️ NU 3.000 cum presupuneam |
| Comenzi totale | 21.400 |
| Vânzări totale | 5,2M lei |
| Clienți | 27.300 (483 online la moment) |
| Activitate | comenzi zilnice, live (07.07.2026) |
| Feed-uri furnizori | „Update feed micromodele" + „Update feed nicoro" (stoc alimentat din feed-uri) |
| Denumiri | structurate: `Categorie : Nume, scară, brand` → bun pt mapare filtre |

## 🔗 EasySales — hub multi-canal (INIMA operațiunii)
| Metric | Valoare |
|---|---|
| Comenzi via EasySales | 14.928 |
| Magazine conectate | 2 |
| Produse (toate canalele) | 48.867 |
| Oferte active | 7.255 |
| **Marketplace-uri** | eMAG RO (36,7%), Cel.ro (20,4%), Okazii (18%), Teamdeals (17,8%), eMAG HU (5,2%), OLX (1,8%), eBay US |

→ EasySales face DEJA sync stoc + AWB + facturi pe 7 canale. **Noul WooCommerce = doar încă un „magazin" conectat la EasySales**, nu construim integrările marketplace de la zero.

## 🖥️ Hosting (cPanel CyberFolks — cloud503.c-f.ro)
| Resursă | Valoare |
|---|---|
| RAM | 12 GB (284 MB folosiți) |
| Disk | 160 GB (24 folosiți) |
| DB disk | 136 GB (634 MB actual) |
| Bandwidth | ∞ |
| CPU / procese | 100 / 240 / 120 entry proc |
| IP dedicat | 95.214.134.59 |
| Tooling | Softaculous + WordPress Manager, Git, JetBackup 5, phpMyAdmin, MultiPHP, Select PHP |
| Securitate | ModSecurity + Imunify360, SSL activ |
| Web server | CyberFolks = LiteSpeed (bun pt LiteSpeed Cache) |

→ **Hosting-ul suportă WooCommerce + 8.400 produse fără upgrade.** Se poate instala pe subdomeniu de staging (ex. `new.autosworld.ro`) fără a atinge site-ul live, apoi cutover.

## 🔴 Implicații majore (reframe proiect)
1. **Nu e un shop simplu de 3.000 SKU** — e o operațiune multi-canal (7 marketplace), 8.398 produse proprii, 21K comenzi, 27K clienți, business activ pe bani reali.
2. **Contractul (4.000 € flat) a fost scopat pe 3.000 SKU / shop simplu** → realitatea e semnificativ mai mare. **Scope + preț de rediscutat onest.**
3. **Migrare:** 8.398 produse (proprii). Clienți 27K + comenzi 21K = decizie separată (activ critic).
4. **Cutover cu grijă:** 7 canale de vânzare live + 21K comenzi + SEO de 10 ani → replatform-ul trebuie făcut pe staging + 301 + fără downtime, ca să nu pice vânzările.
5. **Vestea bună:** EasySales + hosting-ul bun reduc din muncă (marketplace-urile & AWB & facturi există deja în EasySales; hosting-ul e ok).

## Următorii pași propuși
- [ ] Aliniere cu Eduard pe scope+preț real (8.400 SKU, multi-canal, migrare clienți/comenzi?)
- [ ] Setup WooCommerce pe subdomeniu staging via Softaculous (nu atinge live-ul)
- [ ] Temă custom (varianta B) pe staging
- [ ] Conectare WooCommerce nou la EasySales (ca magazin nou)
- [ ] Migrare catalog (export OpenCart / via EasySales)
- [ ] Plăți LibraPay + facturare + Easybox/adresă + plugin email post-plată
- [ ] Plan SEO 301 înainte de cutover
