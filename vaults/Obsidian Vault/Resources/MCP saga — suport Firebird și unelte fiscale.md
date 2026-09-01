---
tags: [reference, tooling, saga, contabilitate]
created: 2026-07-28
updated: 2026-07-28
status: active
---

# MCP saga — suport Firebird și unelte fiscale

Upgrade făcut pe 28.07.2026 la serverul MCP din `saga-mcp/`. Până atunci MCP-ul era inutil exact pe firma care conta: **Conta4U nu se vedea deloc**, fiindcă e firmă Firebird, iar codul recunoștea doar firme DBF. Concret: o zi întreagă de lucru s-a făcut manual, prin interfața SAGA, pe ecranul lui Eduard, când se putea face în secunde.

## Ce era stricat

`_looks_like_company_dir()` declara „firmă SAGA" doar un folder care conține cel puțin un `.dbf`. Folderul unei firme Firebird conține **un singur fișier**, `cont_baza.fdb`, și niciun `.dbf` — deci pica testul peste tot: la listare, la rezolvarea căii, la orice unealtă.

Backend-ul Firebird (`saga_fb.py`) era deja scris și corect, dar **nu era conectat**: `server.py` nu-l importa, iar `search` și `overview` mergeau direct pe fișiere DBF. În plus `_firebird_target()` nu rezolva numere de firmă („0003"), doar căi complete.

## Ce s-a schimbat

**Descoperire și rutare**
- Firmele Firebird sunt recunoscute după `cont_baza.fdb`; `list_companies` returnează acum și un câmp `backend` (`dbf` / `firebird`).
- `_firebird_target()` rezolvă și numere de firmă sub `SAGA_ROOT`.
- `search` și `overview` dispecerizează către Firebird (implementate în `saga_fb.py`).
- Stratul semantic (balanță, fișă cont, jurnal, facturi, parteneri, declarații, SAF-T) nu a trebuit atins: trece prin `read_table`, care dispeceriza deja. Asta a fost noroc de arhitectură, nu merit.

**Unelte noi**
- `saga_diagnostic` — spune **de ce e blocat meniul SAGA**. Citește `FIRME.PRELUAT` din `config.fdb`, `SOCIET.PRELUAT/PRELUATS/DATA_INCH` din baza firmei și dacă există solduri inițiale, apoi dă cauza probabilă plus reparația. Detalii în [[SAGA — Preluarea de date și blocarea meniului]].
- `saga_impozit_profit` — calculează D100 direct din jurnal: venituri 7xx − cheltuieli 6xx **fără 691**, × 16%, pe trimestru și cumulat. Compară cu ce e înregistrat efectiv în 691 și avertizează la nepotrivire.

**Subtilitate importantă la impozit:** comparația cu 691 se face față de **ultimul trimestru închis**, nu față de anul întreg. La mijlocul anului există înregistrări pe care nu le-a impozitat încă nimeni, așa că raportarea la cifra de final de an ar da mereu fals-pozitiv. Toleranța e de 1 leu, fiindcă declarațiile se depun în lei întregi.

## Verificare

`smoke_test.py` rulează tot lanțul pe instalarea reală și afișează cifrele:

```
SAGA_ROOT="E:\SAGA C.3.0" SAGA_FBCLIENT="...\_fb30\fbclient.dll" \
  .venv/Scripts/python.exe smoke_test.py 0003
```

Rezultatele pe Conta4U (28.07.2026) confirmă calculele făcute anterior de mână: trimestrul I fără venituri (impozit 0, deci nimic de scăzut în D100), trimestrul II cumulat 32.497,12 profit → **5.199,54 impozit**, față de 5.200 înregistrat în 691. SAF-T iese `ready = True`.

Merge cu **SAGA deschis** — vezi [[SAGA — citirea bazei Firebird cu isql]] pentru de ce și cum.

## Ce a rămas nefăcut

Un `saga_saft_export` care să scoată chiar XML-ul D406 nu s-a făcut: XML-ul îl generează SAGA, iar MCP-ul rămâne strict read-only. `saga_saft_readiness` verifică doar curățenia datelor care intră în el.

Legat de: [[Contabilitate CECCAR MOC]] · [[Claude Skills Index]]
