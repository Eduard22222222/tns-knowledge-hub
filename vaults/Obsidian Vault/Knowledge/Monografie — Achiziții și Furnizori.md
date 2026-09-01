---
tags: [knowledge, contabilitate, ceccar, monografie]
created: 2026-07-22
updated: 2026-07-22
status: active
---

# Monografie — Achiziții și Furnizori

Înregistrările tip pentru intrări (facturi de la furnizori). Se leagă de tabelele `intrari` / `intr_det` din SAGA și de contul 401.

## Achiziție de marfă (cu TVA deductibilă)
Furnizezi marfă de revânzare, factură cu TVA:
```
%              =   401 Furnizori          (total factură)
  371 Mărfuri                             (baza, fără TVA)
  4426 TVA deductibilă                    (TVA)
```

## Achiziție de serviciu / cheltuială
Ex. chirie, utilități, consultanță:
```
%              =   401 Furnizori          (total)
  628 Alte chelt. cu serviciile           (baza) — sau contul de cheltuială potrivit
  4426 TVA deductibilă                    (TVA)
```
Alegerea contului de cheltuială (602 materiale, 604, 605 utilități, 611 întreținere, 612 chirii, 624 transport, 628 alte servicii...) **se verifică după natura reală** — dacă nu e clar, [[Regula — Cercetare Surse Autoritative]].

## Plata furnizorului
Vezi [[Monografie — Bancă și Casă]]:
```
401 Furnizori  =   5121 Bancă            (plată prin bancă)
401 Furnizori  =   5311 Casa             (plată în numerar)
```

## Atenție
- **TVA deductibilă doar dacă ai drept de deducere** și factura e conformă (CUI valid, toate elementele) — altfel se verifică via [[Regula — Cercetare Surse Autoritative]]
- Achiziții intracomunitare / import / taxare inversă → tratament special (4426 + 4427 simultan) — de detaliat ca notă separată când apare cazul
- Furnizor fără CUI valid = problemă pentru [[TVA și Decont]] și pentru D406/SAF-T (îl semnalează `saga_saft_readiness`)

## Legături
- [[Contabilitate CECCAR MOC]] · [[Plan de Conturi General]] · [[TVA și Decont]] · [[Monografie — Vânzări și Clienți]]
