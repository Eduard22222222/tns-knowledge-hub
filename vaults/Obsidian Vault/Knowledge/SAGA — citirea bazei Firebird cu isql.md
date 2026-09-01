---
tags: [knowledge, contabilitate, saga, tooling]
created: 2026-07-28
updated: 2026-07-28
status: active
---

# SAGA — citirea bazei Firebird cu isql

Firmele SAGA în format Firebird (`ISFB = 1` în `FIRME`) își țin toate datele într-un singur fișier `cont_baza.fdb` din folderul firmei. **Baza se poate citi live, cu SAGA deschis** — nu trebuie închis programul, contrar a ce am crezut inițial.

## Comanda care merge

```powershell
& 'C:\Users\adumi\SAGA-conta4u\_fb30\isql.exe' -u SYSDBA -p masterkey -i query.sql 'E:\SAGA C.3.0\0003\cont_baza.fdb'
```

Detaliul care strică totul dacă îl greșești: **fără prefixul `localhost:`**. Cu el primești *„Unable to complete network request to host localhost"*, fiindcă SAGA rulează Firebird embedded și nu expune TCP. Se dă calea fișierului direct.

Scrie SQL-ul într-un fișier cu `Out-File -Encoding ascii`. În here-string-uri PowerShell trebuie scăpat `$`-ul din tabelele de sistem: `` RDB`$RELATIONS ``.

Merge la fel și pe `config.fdb` (registrul de firme) și pe copiile de siguranță — util ca să compari starea actuală cu un backup.

## Harta tabelelor

Numele sunt criptice, astea contează:

| Tabelă | Ce ține |
|---|---|
| `REGISTRU` | **Jurnalul — sursa de adevăr.** `CONT_D`, `CONT_C`, `SUMA`, `DATA`, `VALIDAT`, `EXPLICATIE` |
| `CONTURI` | Plan de conturi + `DEB_INIT` / `CRED_INIT` (balanța de pornire) |
| `SOCIET` | Datele firmei: adresă, CAEN, capital, `PLATA_TVA`, flag-uri de preluare |
| `IESIRI` / `INTRARI` | Facturi emise / primite |
| `SAFT_*` | Structurile pentru D406 |
| `S_C_INIT` | Stocuri inițiale (cantitate/valoare) — **nu** balanța contabilă |

## Calcule uzuale

Venituri și cheltuieli pe o perioadă, direct din jurnal:

```sql
SELECT COALESCE(SUM(SUMA),0) FROM REGISTRU
WHERE DATA BETWEEN '2026-01-01' AND '2026-06-30' AND CONT_C STARTING WITH '7';   -- venituri

SELECT COALESCE(SUM(SUMA),0) FROM REGISTRU
WHERE DATA BETWEEN '2026-01-01' AND '2026-06-30'
  AND CONT_D STARTING WITH '6' AND CONT_D <> '691';                              -- cheltuieli deductibile
```

`691` se exclude — cheltuiala cu impozitul pe profit nu e deductibilă la calculul propriului impozit. Stornourile sunt sume **negative** pe același cont, deci `SUM` le tratează corect automat.

## De ce contează

E de zeci de ori mai rapid decât interfața SAGA, care e lentă, pierde focusul și uneori are meniul blocat de tot — vezi [[SAGA — Preluarea de date și blocarea meniului]]. Când ceva nu torna, citește baza întâi și abia apoi te lupți cu ecranele.

Aceeași logică stă la baza MCP-ului `saga` din `saga-mcp/`, care momentan citește doar firmele DBF — extinderea lui pe Firebird ar acoperi exact firmele ca [[Conta4U — migrarea SAGA pe laptopul lui Eduard]].

Legat de: [[Contabilitate CECCAR MOC]] · [[Plan de Conturi General]]
