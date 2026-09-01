---
name: skill_saga_d406_generare
description: "Cum se genereaza D406 SAF-T in SAGA: precondiții, cele doua erori blocante si reteta de editare in grilele VFP"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 7b813f9a-b9e1-4db6-8373-607368bc524d
  modified: 2026-07-31T17:25:45.728Z
---

Generarea **D406 (SAF-T)** in SAGA C: **Situatii - Listari -> Declaratia 406 (SAF-T)**. Nu in unealta externa "Declaratii ANAF" (aia e pentru alte declaratii si oricum nu se randeaza). Fluxul: setezi perioada -> **Actualizare date** -> **Generare declaratie**. Rezultatul ajunge in `C:\TEMP\d406\<firma>\<Luna><An>\D406_<CUI>_<data>_Inf.XML` (~230 KB pentru un trimestru mic, schema `mfp:anaf:dgti:d406:declaratie:v1`, AuditFileVersion 2.0).

**Precondiție obligatorie: luna trebuie INCHISA.** Daca nu, apare "Nu ati efectuat inchiderea de luna pentru intervalul selectat" si declaratia nu se genereaza. Inchiderea se face din **Operatii -> Inchidere luna**: valideaza pe rand sectiunile (stocuri, TVA, amortizari, **inchidere conturi de cheltuieli si venituri**) apoi butonul de jos **"Validare inchidere luna"**.

**Eroarea blocanta cea mai probabila: conturi sintetice de grad I.** Mesaj: *"Conturi folosite incorect - cand exista sintetice de grad II nu se pot folosi sintetice de grad I"*, urmat de lista conturilor. La Conta4U era **455** (creditari de asociat) care trebuia **4551**. SAF-T cere nivelul cel mai detaliat.
- SAGA ofera **Administrare -> Intretinere BD -> Modificare coduri -> "Modificare cont contabil"** (inlocuire in masa). Devine accesibil doar dupa deblocarea meniului.
- **Mai sigur pentru cateva inregistrari:** editeaza-le punctual in **Operatii -> Articole contabile**. La Conta4U erau doar 3 (creditari asociat 100/120/100 lei).

**Editarea in grilele VFP din SAGA — reteta care merge:**
- Selecteaza randul cu click (verifica sa se mute indicatorul ▶), apoi **Modific**. Click pe alt rand cat esti in editare NU muta selectia.
- Navigheaza cu **Tab**, nu cu click — click-ul pe alta celula nu muta focusul in modul editare.
- Ordine Tab la Articole contabile (rand existent): Data -> Nr.document -> **Cont debit** -> **Cont credit** -> Suma -> Valuta -> Curs -> Suma-valuta -> Explicatie.
- La facturi (linii de intrare), de la Tip pana la **Cont** sunt **11 Tab-uri**.
- Cand cazi pe un camp, valoarea veche e **selectata** — tastezi direct si o inlocuieste. Daca faci triple-click, textul se **adauga** (am ajuns la "6264093" si SAGA a intrebat daca sa creeze contul — raspuns **Nu**!).
- **"Renunt" anuleaza tot randul**, inclusiv modificari deja parute pe ecran. Foloseste **Salvez** dupa fiecare rand.
- Textele lungi introduse prin clipboard pot ateriza in campuri numerice vecine — verifica dupa fiecare paste.

**Avertismentul "Data documentului este precedenta ultimei inchideri contabile"** apare la orice editare intr-o luna inchisa. Raspunde **Da** daca modificarea nu atinge contul de profit si pierdere (ex. reclasificari intre conturi de bilant: 455->4551, 626->4093); situatiile de sfarsit de luna raman valabile.

**DEPUNEREA D406 (2026-07-31) — validare + semnare + trimitere prin aplicatia Declaratii ANAF (C:\DeclaratiiANAF\System\DeclaratiiANAF.exe):**
- **Java OBLIGATORIU, si trebuie x86 (32-biti)** — aplicatia e pe 32-biti si citeste `HKLM\SOFTWARE\WOW6432Node\JavaSoft\Java Runtime Environment` (CurrentVersion=1.8 + JavaHome). Java x64 NU e vazut → eroare "Nu aveti Java instalat". winget instaleaza doar x64 si refuza x86. Descarca MSI x86 direct: `https://api.adoptium.net/v3/installer/latest/8/ga/windows/x86/jre/hotspot/normal/eclipse`, instaleaza elevat cu `ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJavaHome,FeatureOracleJavaSoft`.
- Flux: click-dreapta pe rand → **Validare + creare PDF semnat** (prima data descarca modulul DUKIntegrator D406) → dialogul Windows CredentialUIBroker (certificat+PIN) apare adesea **negru**, userul da click si baga PIN → se creeaza `..._semnat.pdf` → selecteaza-l → buton **ANAF** (scut) → depus, recipisa in secunde.
- **La SAF-T se depune PDF-ul SEMNAT, nu XML** (XML e impachetat in PDF). Rezultat confirmat: Q2 recipisa 1185922008 "fara erori", Q1 recipisa 1185931942.
- A durat zile din cauza lantului de blocaje de MEDIU (SSD extern E: deconectat sub SAGA, Firebird fragil/omorat gresit → SQLSTATE 28000 → restart, Java lipsa/x64 gresit, ferestre VFP care fura focus). Retrospectiva completa: vault `Knowledge/SAGA — Depunere D406 SAF-T (retrospectivă erori)`.

Vezi [[skill_saga_firebird_direct_read]] pentru deblocarea meniului si [[project_saga_conta4u_setup]].
