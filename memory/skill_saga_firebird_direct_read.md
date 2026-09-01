---
name: skill_saga_firebird_direct_read
description: "Citirea bazei SAGA Firebird live cu isql (fara sa inchizi SAGA) + de ce se blocheaza meniul cu 'balanta de pornire'"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 7b813f9a-b9e1-4db6-8373-607368bc524d
  modified: 2026-07-29T13:48:50.967Z
---

Doua descoperiri care economisesc ore la Conta4U in SAGA (2026-07-28). Vezi [[project_saga_conta4u_setup]].

**1. Citirea bazei Firebird cu isql.** Conectare **embedded, direct pe calea fisierului, FARA `localhost:`** — cu `localhost:` da "Unable to complete network request" fiindca SAGA nu expune TCP.

> **CORECTIE (2026-07-29):** am scris initial ca baza se poate citi "live, cu SAGA deschis". **FALS.** SAGA tine fisierul EXCLUSIV; incercarea da `SQLSTATE 08001 ... being used by another process`. Citirile mele "live" au mers doar pentru ca instanta deschisa era **alta instalare** (cea veche din OneDrive, cu o copie GOALA a firmei), iar fisierele de pe E: erau libere. **Ca sa citesti baza, SAGA trebuie inchis.** Vezi capcana celor doua instalari mai jos.

```powershell
& 'C:\Users\adumi\SAGA-conta4u\_fb30\isql.exe' -u SYSDBA -p masterkey -i query.sql 'E:\SAGA C.3.0\0003\cont_baza.fdb'
```
Scrie SQL-ul intr-un fisier cu `Out-File -Encoding ascii`; in here-string PowerShell scapa `$` din `RDB$...` ca `` RDB`$ ``. Merge si pe `config.fdb`.

Tabele utile: `REGISTRU` (jurnalul: CONT_D, CONT_C, SUMA, DATA, VALIDAT, EXPLICATIE) = sursa de adevar pentru venituri/cheltuieli; `CONTURI` (plan de conturi + DEB_INIT/CRED_INIT = balanta de pornire); `SOCIET` (datele firmei + PRELUAT/PRELUATS/DATA_PREL); `IESIRI`/`INTRARI` (facturi); `SAFT_*` (structuri D406); `D100_DET`. Venituri = `SUM(SUMA) WHERE CONT_C STARTING WITH '7'`, cheltuieli = `CONT_D STARTING WITH '6'` (exclude 691, nedeductibil).

**2. "Pentru activarea meniului, trebuie introdusa balanta de pornire" — cauza reala.** Meniurile Fisiere/Operatii/Situatii/Diverse raman gri; doar Administrare + Ajutor merg. NU e lag si NU se rezolva din `config.fdb`:
- `FIRME.PRELUAT` in config.fdb era deja `true` (l-am setat eu) — **irelevant**.
- `SOCIET.PRELUAT` in baza firmei era deja `1` — **si asta irelevant**.
- Cauza: **`CONTURI.DEB_INIT` / `CRED_INIT` sunt toate 0** → SAGA considera ca nu exista balanta de pornire si blocheaza meniul.

Se deblocheaza pe calea legitima: Administrare -> Configurare societati -> **"Preluare date contabile..."**, confirmand balanta zero. Pentru o firma care si-a inceput activitatea in perioada acoperita de baza (Conta4U: primele inregistrari 31.03.2023, istoric complet pana azi), **sold initial zero este corect contabil**, nu un artificiu.

**3. CAPCANA CELOR DOUA INSTALARI (2026-07-29) — verifica asta PRIMA.** Existau **doua instalari SAGA care rulau simultan**, ambele cu o firma `0003 "Conta 4U SRL"`:
- `E:\SAGA C.3.0\0003\cont_baza.fdb` — **36.8 MB, 580 inregistrari** = baza REALA
- `C:\Users\adumi\OneDrive\Desktop\Conta4u\SAGA C.3.0\0003\cont_baza.fdb` — **15.5 MB, 0 inregistrari** = firma GOALA

Titlurile ferestrelor sunt IDENTICE ("SAGA C.3.0.604 Conta 4U SRL (server)"), deci nu poti distinge vizual. Verifica intotdeauna `(Get-Process sc).Path` inainte sa tragi orice concluzie. Consecinte reale: am raportat gresit ca firma are TVA "Lunar", adresa goala, fara CAEN si capital 0 — de fapt ma uitam la **firma goala** din instalarea OneDrive. Configurarea reala e corecta: **Neplatitor**, BUCURESTI SECTOR 3 str. FETESTI 44C, CAEN 6910, capital 1.000, cont ING RO09INGB0000999913713057.

Instalarea din OneDrive **nu trebuie folosita deloc** (OneDrive stergea fisierele SAGA — motivul mutarii pe E:) si ideal ar fi redenumita ca sa nu se deschida din greseala.

**4. REZOLVAT (2026-07-29): meniul se deblocheaza validand preluarea de STOCURI.** Cauza reala: `SOCIET.PRELUATS = 0` — preluarea de stocuri nu fusese niciodata validata. SAGA cere **ambele** preluari validate (contabila SI stocuri) ca sa activeze meniul, dar mesajul afisat vorbeste doar despre "balanta de pornire", ceea ce trimite pe pista gresita.

**Reteta care functioneaza** (SAGA deschis pe firma, Administrare -> Configurare societati):
1. "Preluare date contabile..." -> **Devalidez** (asta activeaza butonul Validez) -> **Validez** -> Iesire.
2. Butonul "Preluare stocuri initiale..." devine activ -> deschide-l -> **Validez** (grila goala, total 0.00 — corect pentru firma de servicii fara stocuri) -> Iesire.
3. **Inchide si redeschide SAGA** — starea meniului se evalueaza la deschiderea firmei.
4. Verificare in baza: `SELECT PRELUAT, PRELUATS FROM SOCIET` trebuie sa dea **1 / 1**.

Nu confunda cu `FIRME.PRELUAT` din `config.fdb` — ala e irelevant pentru blocaj (testat in ambele pozitii). Ipotezele mele anterioare despre flag-ul ala erau gresite.

**Istoric al pistelor false (nu le relua):** Testat empiric: mesajul "Meniul va fi activat numai dupa validarea preluarii de date" apare **si cu `FIRME.PRELUAT=TRUE`, si cu `FALSE`**. Ambele ipoteze pe care le-am sustinut (intai ca TRUE deblocheaza, apoi ca TRUE blocheaza) sunt **gresite**. In Administrare -> Configurare societati -> "Preluare date contabile..." exista butonul **Validez**, dar apare dezactivat (lacat) si click-ul nu are efect; ecranul arata corect "luna de incepere Februarie 2023" cu toate conturile pe zero. Urmatorul pas rezonabil: **suport SAGA** (licenta activa, cont `dumitriue213`) — e programul lor si deblocheaza asta de rutina.

**Lectie de proces:** cand SAGA blocheaza ceva, citeste baza direct (cu SAGA inchis) in loc sa te lupti cu GUI-ul lent. Si nu propune a doua teorie inainte s-o testezi pe prima — aici am ars doua zile pe ipoteze despre un flag care nu era cauza.
