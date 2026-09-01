---
tags: [knowledge, contabilitate, ceccar, reference]
created: 2026-07-22
updated: 2026-07-22
status: active
---

# Plan de Conturi General

Structura planului de conturi din contabilitatea românească (reglementat de **OMFP 1802/2014**, cu modificările ulterioare — de verificat la zi via [[Regula — Cercetare Surse Autoritative]]). E harta pe care o folosesc când citesc `conturi` și `registru` din SAGA prin MCP-ul `saga`.

## Clasele (prima cifră = clasa)
- **1 — Capitaluri**: capital social (101), rezultat reportat (117), rezultatul exercițiului (121), rezerve
- **2 — Imobilizări**: terenuri (211), construcții (212), echipamente (213), imobilizări necorporale (20x), amortizări (28x)
- **3 — Stocuri**: mărfuri (371), materii prime (301), produse (345), ambalaje
- **4 — Terți**: furnizori (401), clienți (4111), **TVA (442x)**, personal (421), bugetul statului (44x), asociați (45x), debitori/creditori diverși (461/462)
- **5 — Trezorerie**: bancă în lei (5121), casa în lei (5311), viramente interne (581), acreditive
- **6 — Cheltuieli**: după natură — mărfuri (607), servicii (628), salarii (641), amortizare (681), combustibil/materiale (602/604)
- **7 — Venituri**: din vânzări mărfuri (707), din servicii (704), din producție, financiare (765 diferențe de curs)
- **8 — Conturi speciale** (angajamente, în afara bilanțului)
- **9 — Gestiune internă** (contabilitate de gestiune, opțional)

## Cum le citesc în SAGA
- `conturi` (tabel SAGA): CONT, DENUMIRE, TIP (A/P), DEB_INIT/CRED_INIT = solduri inițiale
- Conturile pot avea **analitice**: `401.00008`, `4111.00001` — sufix după punct = partener/detaliu
- Convenția de sold: conturile de **activ** au sold debitor (+), cele de **pasiv** sold creditor (−). În tool-ul `saga_balanta`, `sold_final` e semnat: + = debitor, − = creditor.

## Reguli de bază (partidă dublă)
- Orice operațiune = minim un cont debitor și unul creditor, cu sume egale
- Cheltuielile (clasa 6) cresc pe debit; veniturile (clasa 7) cresc pe credit
- La sfârșit de perioadă, clasele 6 și 7 se închid prin 121 (rezultat)

## Legături
- [[Contabilitate CECCAR MOC]] · [[TVA și Decont]] · [[Monografie — Achiziții și Furnizori]] · [[Monografie — Vânzări și Clienți]]
