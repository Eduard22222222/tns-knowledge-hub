---
tags: [knowledge, contabilitate, ceccar, monografie]
created: 2026-07-22
updated: 2026-07-22
status: active
---

# Monografie — Vânzări și Clienți

Înregistrările tip pentru ieșiri (facturi către clienți). Se leagă de tabelele `iesiri` / `ies_det` din SAGA și de contul 4111.

## Vânzare de servicii (cu TVA colectată)
Cazul GFM Venture (venituri din servicii prestate, 704):
```
4111 Clienți   =   %                     (total factură)
                   704 Ven. din servicii  (baza, fără TVA)
                   4427 TVA colectată      (TVA)
```

## Vânzare de marfă
```
4111 Clienți   =   %                     (total)
                   707 Ven. din vânzarea mărfurilor  (baza)
                   4427 TVA colectată      (TVA)
```
Și descărcarea de gestiune a mărfii vândute: `607 Cheltuieli privind mărfurile = 371 Mărfuri` (la cost).

## Încasarea clientului
Vezi [[Monografie — Bancă și Casă]]:
```
5121 Bancă     =   4111 Clienți          (încasare prin bancă)
5311 Casa      =   4111 Clienți          (încasare în numerar)
```

## Atenție
- Contul de venit se alege după natura vânzării (704 servicii, 707 mărfuri, 705 studii, 758 alte venituri...) — dacă nu e clar, [[Regula — Cercetare Surse Autoritative]]
- **Cota de TVA** aplicabilă (standard vs redusă) se confirmă la data facturii — vezi avertismentul din [[TVA și Decont]]
- Bon fiscal / casă de marcat → adesea client „persoană fizică" fără CUI (legitim; `saga_saft_readiness` îl marchează ca warning, nu eroare)
- E-Factura (B2B obligatoriu): factura se emite + se trimite la SPV. Pregătesc XML-ul, dar **emiterea/trimiterea rămâne pe greenlight-ul lui Eduard**, semnată cu token-ul lui.

## Legături
- [[Contabilitate CECCAR MOC]] · [[Plan de Conturi General]] · [[TVA și Decont]] · [[Monografie — Achiziții și Furnizori]] · [[Monografie — Bancă și Casă]]
