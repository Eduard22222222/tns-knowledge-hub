---
tags: [knowledge, contabilitate, ceccar, fiscal, tva]
created: 2026-07-22
updated: 2026-07-22
status: active
---

# TVA și Decont

Cum funcționează TVA-ul în conturi și cum se leagă de decontul de TVA (D300). Ancorat în date reale: verificat pe SAGA-ul GFM Venture, unde decontul bate cu jurnalul pe conturile de mai jos.

⚠️ **Cotele și plafoanele TVA se schimbă des** — cota exactă aplicabilă la o operațiune se confirmă la data ei via [[Regula — Cercetare Surse Autoritative]] (Cod Fiscal, titlul TVA + Monitorul Oficial).

## Conturile de TVA (clasa 442x)
- **4426 — TVA deductibilă**: TVA-ul de pe achiziții (crește pe **debit**)
- **4427 — TVA colectată**: TVA-ul de pe vânzări (crește pe **credit**)
- **4423 — TVA de plată**: rezultă când colectată > deductibilă (datorezi la stat)
- **4424 — TVA de recuperat**: rezultă când deductibilă > colectată (ai de recuperat/reportat)
- **4428 — TVA neexigibilă**: la TVA la încasare sau facturi neajunse la scadență

## Decontul de lună (închiderea TVA)
La sfârșit de perioadă fiscală se „sting" 4426 și 4427 unul în altul:
- Dacă **colectată > deductibilă** → diferența pe **4423 TVA de plată**
  - `4427 = %` : `4426` + `4423`
- Dacă **deductibilă > colectată** → diferența pe **4424 TVA de recuperat**
  - `%` = `4427` : `4426` (cu `4424` pe debit)

## Legătura cu D300 (verificabilă automat)
Tool-ul `saga_verificare_tva` face cross-check pe 3 surse independente și semnalează diferențele **înainte** de depunere:
1. **D300** (ce a pus SAGA pe decont — rând 19 colectată, rând 31 deductibilă, rând 38 de plată)
2. **D394** (totaluri pe facturi)
3. **Jurnalul** (rulaj 4427 colectată vs 4426 deductibilă)
Toleranță 1 leu (diferențe de rotunjire normale). Dacă nu bat → e o factură lipsă sau greșit înregistrată.

## Legături
- [[Contabilitate CECCAR MOC]] · [[Plan de Conturi General]] · [[Monografie — Achiziții și Furnizori]] · [[Monografie — Vânzări și Clienți]]
