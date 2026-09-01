---
name: project_saga_conta4u_setup
description: "SAGA C.3.0 installed on E: with active license; Conta4U is Firebird firm 0003 with full data. How it was set up + how to open it."
metadata: 
  node_type: memory
  type: project
  originSessionId: 7b813f9a-b9e1-4db6-8373-607368bc524d
---

SAGA contabilitate is now working on Eduard's laptop after a full-day ordeal (2026-07-23). Root problem was the C: disk being **100% full** (OneDrive hoarding local space) — fixed to ~128 GB free by moving junk to E: + OneDrive "Free up space". SAGA had been installed inside OneDrive, which kept deleting its files; the fix was to run it off a **local drive**.

**Where SAGA lives:** `E:\SAGA C.3.0\sc.exe` (drive E: "MetalMini", local/fixed, NOT OneDrive). Launch it from there. Firebird service = `FirebirdServerFirebird30_Saga`.

**License:** 1302378, WEB3, SAGA C, active until 23.07.2027 ("Licenta expira in 365 zile"). Activated online: on sagasoft.ro/licente.php the field **ID activare licenţă = 606347** (the per-install code SAGA showed) + **Parola licență = APPLE1**, then in SAGA the "Activare update" dialog logged in with account **dumitriue213** + password **APPLE1**. The SAGA account is `dumitriue213` (NOT `dumitriua557`, which is a different account that does NOT hold the license).

**Firms in this SAGA (folders under E:\SAGA C.3.0\):**
- `0001` Advanced Thinking Suport SRL (DBF) — data copied from backup but its structure conversion to v604 ERRORED (incomplete tables); may need re-copy/repair.
- `0002` GFM VENTURE SRL (DBF) — same conversion error.
- `0003` **Conta 4U SRL** (CUI 47755391, Reg J2023004333408) — **Firebird "server" firm, the real Conta4U with full data.**

**How Conta4U (0003) was created — the winning trick:** created an empty firm in SAGA (Administrare → Configurare societăți → Adaug), which made an empty `0003\cont_baza.fdb` (~16MB). Then closed SAGA, stopped Firebird, **replaced `E:\SAGA C.3.0\0003\cont_baza.fdb` with the real 38.5MB `cont_baza.fdb`** (from the migration, kept at `E:\SAGA C.3.0\0011\cont_baza.fdb` and `C:\Users\adumi\SAGA-conta4u\_work\conta4u_work.fdb`), restarted Firebird. On next open SAGA upgraded the DB structure to v604 and Conta4U opened with all data (interval 01.03.2026, e-Facturi, etc.). Backups of the clean fdb: `_work\conta4u_work.fdb` + `SAGA-conta4u\CONTA4U_migrare_2026-07-22\02_DATE_fdb\cont_baza.fdb`. (The CFB3 backup was accidentally deleted during disk cleanup — only the .fdb survives, so restore = swap the fdb, not a CFB3 restore.)

**STILL TODO:** import the March–June bank-reconciliation notes `C:\Users\adumi\SAGA-conta4u\note-propuse\DF_2026-03-01_2026-06-30.dbf` into Conta4U via **Diverse → Import date** — but FIRST verify those notes aren't already in the firm (snapshot is 22-07-2026) to avoid double entries. See [[project_saga_mcp]].

**GUI gotchas:** SAGA window keeps losing foreground — front+maximize via Win32 `ShowWindow(h,3)+SetForegroundWindow`. On startup it shows an "Activare update" login (dumitriue213/APPLE1) — click Accept. Opening a firm needs its data present or it errors "Fisierul de configurare nu exista" / loops on an "Open *.dbf" dialog.
