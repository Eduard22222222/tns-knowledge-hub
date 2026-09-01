---
tags: [project, contract, plugins, verification, autosworld]
status: contract-draft-ready
created: 2026-06-24
---

# Contract & Verificare Plugin-uri — Auto'sWorld

## 📄 Contract (draft gata)
- **Fișiere:** `Desktop/claude/online-shop-contract/TNS_Contract_AutosWorld.html` + **`.pdf`** + **`.docx` (editabil)**
  - `.docx` generat cu `build-docx.py` (python-docx, stil TNS); `.pdf` cu `generate-contract-pdf.py` (pyppeteer/Edge)
- **Referință:** TNS-AW-CONTRACT-001
- **Design:** identic cu contractul FamilyLink (auriu/crem TNS, logo, Anexa 1 + Anexa 2)
- **Structură:** 18 articole + Anexa 1 (specs + stack plugin-uri + criterii acceptare) + Anexa 2 (PV recepție)
- **Livrare (Anexa 1 C):** 2 metode la checkout — **Easybox Sameday** (locker pe hartă) + **livrare la adresă**, cu calcul cost (plugin oficial Sameday)
- **Migrare (Anexa 1 D):** până la **3.000 SKU** automat (export/tool LitExtension/Cart2Cart); curățare manuală = extra 70€/oră. **Pricing confirmat: 4.000 € flat** (Varianta A — fără taxă separată de migrare)

### Pricing fixat în contract (v3 — FINAL: doar dezvoltare)
| | |
|---|---|
| Dezvoltare (total) | **4.000 EUR = 20.960 lei** (curs ~5,24) |
| Plată | **4 rate lunare a 5.240 lei** (fix, în LEI, fără curs), din **iulie 2026**, scadente **până pe data de 10 a lunii** (prima rată max **10 iulie 2026**) |
| Plată anticipată | oricând, fără penalități |
| IP transfer | doar la **achitarea integrală a celor 20.960 lei** (până atunci licență de utilizare) — pârghie pt TNS |
| Durată build | 5 săptămâni (prima rată = kickoff) |
| Tarif extra-scope | 70 EUR/oră |
| Costuri terțe (client plătește direct) | hosting, Oblio/SmartBill/Facturis, EasySales, comision LibraPay, tool migrare |

### 🔴 SCOASE din contract (de discutat SEPARAT, ulterior) — DE ȚINUT MINTE
- **Servicii recurente / mentenanță & securitate (cei 500 €/lună)** — scoase; Eduard discută prețul cu clientul mai încolo, se contractează separat. (Art. VII a devenit „Servicii Ulterioare" = nu fac obiectul contractului, ofertă separată.)
- **Google Ads** — scos complet din contract; ofertă/contract separat de marketing.
> Ambele rămân upsell-uri viitoare pentru TNS. Contractul curent = PUR dezvoltare (20.960 lei).

### Ce intră în 500 €/lună (Art. VII)
- **A. Mentenanță:** update-uri WP/WooCommerce/plugin-uri pe staging→producție, verificare backups, uptime
- **B. Securitate:** WAF, virtual patching prioritar, scanare malware, hardening (2FA/login/rate-limit)
- **C. Performanță/caching:** monitorizare viteză + ajustări cache/imagini/CDN
- **D. Bug fixing & ajustări minore:** până la **6 ore/lună** (peste = 70 €/oră)
- **E. Google Ads:** management campanii (Search/Shopping/PMax) + optimizare + raport lunar (buget media SEPARAT)
- **F. Raportare lunară** consolidată
- Terminabil cu **preaviz 30 zile**. NU include: dezvoltare nouă majoră, redesign, alte canale (Meta/TikTok)

### ⚠️ De completat la semnare (câmpuri aurii în PDF)
- Denumire societate + CUI + ONRC + sediu + reprezentant legal (entitatea care operează Auto'sWorld)
- Data semnării
- **Numărul de produse de migrat** din OpenCart (cost driver — de confirmat cu clientul)
- Reprezentant Beneficiar pt comunicare

## ✅ Verificare plugin-uri (toate reale + conectabile, 24.06.2026)
| Funcție | Plugin | Verificat |
|---|---|---|
| Facturare + e-Factura | **Oblio** / **SmartBill** / **Facturis** (toate 3 = opțiune în contract, la alegerea clientului; toate cu plugin WooCommerce + e-Factura) | ✅ |
| Checkout RO + CUI | **Facturare WooCommerce** (câmpuri persoană juridică CUI/Reg.Com./IBAN + autofill ANAF prin OpenAPI) | ✅ |
| Plăți | **LibraPay (Libra Internet Bank)** — procesatorul BĂNCII clientului, are plugin WooCommerce (librapay.ro), 3D Secure + antifraudă. Alt: EuPlătesc, Netopia. + ramburs | ✅ |
| AWB curieri | CurieRO (per curier, gratis), Flavor (umbrella), eAWB | ✅ |
| eMAG | **EasySales** (sync stoc/preț/comenzi + AWB + facturi; pe eMAG marketplace) | ✅ |
| **Email automat post-plată** | **⚙️ PLUGIN CUSTOM dezvoltat de noi** (vezi mai jos) | build |
| Securitate | Cloudflare + Patchstack / Wordfence (4M+ instalări) | ✅ |
| Cache | LiteSpeed Cache / WP Rocket | ✅ |
| SEO | Rank Math | ✅ |
| Cookie/GDPR | Complianz | ✅ |

**Concluzie:** întreg stack-ul cerut de client (facturare, B2B/CUI, plăți, eMAG, AWB, securitate) are plugin-uri reale, întreținute, care se conectează nativ la WooCommerce. Magazinul e 100% fezabil pe WooCommerce.

## ⚙️ Plugin CUSTOM de construit (cerință Eduard) — DE ȚINUT MINTE
**Notificare email automată post-plată.** După ce clientul plătește (confirmarea plății de la procesator), sistemul îi trimite **automat pe email**: confirmarea comenzii + **numărul AWB și link de tracking**. E o **funcție extra**, plugin dedicat dezvoltat de noi (nu off-the-shelf) — declanșat de evenimentul „plată confirmată" din WooCommerce, care preia AWB-ul generat (curier/EasySales) și îl trimite clientului. Inclus în build (Anexa 1, Săpt. 4 + criteriu recepție #4).

## 🔄 Decizii client (actualizat)
- **Procesator plăți:** **LibraPay** (procesatorul de la Libra Internet Bank — banca clientului). Scos „Netopia" ca fixare; contract flexibil (LibraPay principal, EuPlătesc/Netopia alternative). Avantaj: banii intră direct în contul Libra al clientului.
- **Facturare:** adăugat **Facturis** ca opțiune (pe lângă Oblio/SmartBill).
- **Plată website:** 4× 1.000 €/lună din iunie + opțiune plată anticipată (vezi pricing mai sus).

## Următorii pași
- [ ] Completează datele firmei Auto'sWorld + nr. produse → finalizează contractul
- [ ] Trimite contractul la client
- [ ] La kickoff: cere export catalog OpenCart (CSV/XML) + accesuri conturi
