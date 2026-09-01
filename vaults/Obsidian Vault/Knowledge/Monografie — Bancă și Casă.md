---
tags: [knowledge, contabilitate, ceccar, monografie, banca]
created: 2026-07-22
updated: 2026-07-22
status: active
---

# Monografie — Bancă și Casă

Înregistrările de trezorerie: încasări, plăți, transferuri. Se leagă de conturile 5121 (bancă lei), 5311 (casa), 581 (viramente interne) și de reconcilierea extrasului ING.

## Încasări (bani care intră)
```
5121 Bancă     =   4111 Clienți          (încasare factură client)
5311 Casa      =   4111 Clienți          (încasare numerar / bon)
```

## Plăți (bani care ies)
```
401 Furnizori  =   5121 Bancă            (plată furnizor prin bancă)
421 Personal   =   5121 Bancă            (plată salarii)
44x Buget      =   5121 Bancă            (plată taxe/impozite)
```

## Transfer între conturi proprii (bancă ↔ casă)
Se folosește **581 Viramente interne** ca punte, ca să nu apară dublări:
```
581            =   5121 Bancă            (retragere din bancă)
5311 Casa      =   581                    (intrare în casă)
```

## Reconciliere cu extrasul bancar (ING)
Tool-ul `saga_reconciliere` compară extrasul MT940 exportat din ING cu fișa contului 5121 din SAGA:
- potrivește pe sumă + dată (± câteva zile)
- îți scoate `unbooked` = tranzacții din extras care **nu-s încă înregistrate** în SAGA (candidate de introdus)
- pe fiecare pregătesc înregistrarea propusă (pe ce cont pică) → tu validezi
- semnul: în extras încasare (+) = pe 5121 debit; plată (−) = pe 5121 credit

## Atenție
- Comisioane bancare → `627 Cheltuieli cu serviciile bancare = 5121`
- Diferențe de curs la conturi valutare → `665`/`765` (vezi 765 în datele reale GFM)
- Categorizarea automată a tranzacțiilor (OMV → combustibil 602, salarii → 421...) cere **reguli validate de Eduard** — nu inventez conturi; la caz neclar, [[Regula — Cercetare Surse Autoritative]]

## Legături
- [[Contabilitate CECCAR MOC]] · [[Plan de Conturi General]] · [[Monografie — Achiziții și Furnizori]] · [[Monografie — Vânzări și Clienți]]
