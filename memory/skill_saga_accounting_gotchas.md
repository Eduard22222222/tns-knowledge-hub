---
name: skill-saga-accounting-gotchas
description: "Hard rules for reading SAGA/Conta4U accounting data — mistakes made on 2026-07-23 that must never repeat (fake employees, fake income, mislabeled rulaje)."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 7b813f9a-b9e1-4db6-8373-607368bc524d
---

Rules for interpreting SAGA C (Firebird) accounting data for Conta4U (and any client firm), learned from real mistakes Eduard caught on 2026-07-23:

1. **SALARIATI ≠ angajați activi.** The table keeps FULL history. Always filter by `DATAL` (data încetării): active = `DATAL IS NULL` or `DATAL >= today`. I claimed "3 salariați → trebuie D112" when all 3 contracts had ended in 2023–2024. Conta4U has **zero angajați activi** (so no D112).
2. **SUM(SUMA) din REGISTRU ≠ încasări/venituri.** REGISTRU is the double-entry journal: rulajele includ cheltuieli, amortizări și note de închidere (121=%). Venituri = doar CONT_C din clasa 70x (ex. 704); încasări = doar 5121 pe debit contra 4111. I showed monthly SUMA totals and they read as "income" — wrong; Jan/Feb 2026 had ZERO income (first invoice 01.04.2026 Via Sartorial, first cash receipt June).
3. **Always label what a number IS** (rulaj / venit / încasare / sold) before showing it. Eduard reads these as an accountant — sloppy labels destroy trust.
4. **Check duplicates by looking, ask before judging:** REALITATEA SOCIALA appears twice with identical 13,625.51 (30.04 + 17.06) — Eduard confirmed both are REAL (monthly invoices, equal amounts). Don't assume duplicate; don't assume valid either — ask.
5. **Conta4U fiscal profile (confirmed by Eduard + SOCIET flags):** `MICRO=0` → impozit pe PROFIT (not micro); `PLATA_TVA=3` → NEplătitor de TVA (no D300/D394); CAEN 6910; zero employees (no D112). Quarterly obligation = **D100 only**.
6. **Reading the DB directly works:** `_fb30/isql.exe -user SYSDBA -password masterkey <fdb>`. Key tables: REGISTRU (journal: DATA, CONT_D, CONT_C, SUMA, EXPLICATIE), SALARIATI, SOCIET (PRELUAT, MICRO, PLATA_TVA, DATA_INCH), CONTURI. Work on the copy `_work\conta4u_work.fdb`, never the live one while SAGA runs.
7. **Snapshot ≠ live:** data is as-of the export date (22.07.2026). Bank notes (comisioane 627, încasări) from my reconciliation in `note-propuse\` are NOT yet posted in the firm — don't double-count when computing, and check before importing.
