---
tags: [knowledge, contabilitate, saga, troubleshooting]
created: 2026-07-28
updated: 2026-07-28
status: active
---

# SAGA — Preluarea de date și blocarea meniului

Când deschizi o firmă în SAGA și meniurile **Fișiere / Operații / Situații-Listări / Diverse rămân gri**, iar la deschidere apare mesajul *„Meniul va fi activat numai după validarea preluării de date"* (plus, în Configurare societăți, textul roșu *„Pentru activarea meniului, trebuie introdusă balanța de pornire"*) — cauza e aproape sigur un flag de preluare, **nu date lipsă**.

## Ce înseamnă flag-ul PRELUAT

În `config.fdb`, tabela `FIRME` are coloana `PRELUAT`. Ea **nu** înseamnă „preluarea s-a terminat". Înseamnă **„firmă în curs de preluare, în așteptarea validării"**. Cât timp e `TRUE` fără ca validarea să fie făcută din interfață, SAGA ține meniul blocat intenționat — ca să nu lucrezi într-o firmă cu date pe jumătate preluate.

Concluzia contraintuitivă: **setarea `PRELUAT = TRUE` direct în bază nu deblochează meniul, ci exact invers.** E capcana în care am căzut la Conta4U — vezi [[Conta4U — migrarea SAGA pe laptopul lui Eduard]].

Există un flag paralel în baza *firmei* (`cont_baza.fdb`), tabela `SOCIET`: `PRELUAT`, `PRELUATS` (stocuri), `DATA_PREL`, `DATA_PRELS`. Astea descriu preluarea istorică (la Conta4U: `DATA_PREL = 2023-01-31`) și sunt altceva decât flag-ul din `config.fdb`.

## Ce NU e cauza

Merită eliminate din start, pentru că par vinovate și nu sunt:

- **Soldurile inițiale zero.** `CONTURI.DEB_INIT` / `CRED_INIT` toate 0 e perfect normal pentru o firmă care și-a început activitatea în perioada acoperită de bază. La Conta4U primele înregistrări sunt din 31.03.2023 și istoricul e complet până azi — n-are ce să existe „înainte". Baza originală de pe celălalt laptop are tot 0, și acolo SAGA mergea.
- **Tabela `S_C_INIT` goală.** Aia e pentru **stocuri** (`CANT_INIT`, `VAL_INIT`), nu pentru balanța contabilă. Se leagă de `PRELUATS`, nu de meniu.
- **Lag-ul interfeței.** Meniul chiar e dezactivat, nu doar lent. Test rapid: dacă „Administrare" se deschide și „Situații-Listări" nu, e dezactivare, nu focus.

## Cum verifici corect, în 2 minute

Citește baza direct, fără să închizi SAGA — vezi [[SAGA — citirea bazei Firebird cu isql]]. Interogările utile:

```sql
SELECT COD, NUME, PRELUAT FROM FIRME;                      -- in config.fdb
SELECT PRELUAT, PRELUATS, DATA_PREL FROM SOCIET;           -- in cont_baza.fdb
SELECT COUNT(*) FROM CONTURI WHERE DEB_INIT<>0 OR CRED_INIT<>0;
```

## Reparare

1. **Fă backup la `config.fdb`** înainte de orice (copiere simplă a fișierului, cu SAGA închis).
2. **Închide SAGA normal**, cu backup „Da". Niciodată din Task Manager — omorârea procesului nu comite `config.fdb` și firma dispare din listă.
3. Readu `FIRME.PRELUAT` la valoarea originală (`FALSE` la Conta4U) sau, dacă preluarea chiar e în curs, du-o la capăt din **Administrare → Configurare societăți → „Preluare date contabile…"**.
4. Redeschide SAGA și verifică meniul.

## Lecția de proces

Nu forța flag-uri direct în baza de date ca să ocolești un blocaj din interfață, dacă nu știi ce înseamnă flag-ul. Aici a costat câteva zile de lucru și a părut că „s-a stricat SAGA", când de fapt programul se comporta exact cum e proiectat. Regula din [[Regula — Cercetare Surse Autoritative]] se aplică și la unelte, nu doar la tratamente contabile: întâi afli ce face butonul, apoi îl apeși.

Legat de: [[Contabilitate CECCAR MOC]] · [[Knowledge MOC]]
