---
name: skill_saga_bilant_anual
description: "Depunerea situatiilor financiare anuale din SAGA: fluxul complet, corelatia de 1 leu care blocheaza validarea, si arhiva ZIP obligatorie"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 7b813f9a-b9e1-4db6-8373-607368bc524d
  modified: 2026-08-28T16:15:14.848Z
---

**Situatii - Listari → Bilant.** Seteaza `Data` = 31.12.<an> **din ecranul de selectie firma la pornirea SAGA** (nu doar in fereastra Bilant) — altfel intervalul de lucru nu acopera anul si nu vezi operatiunile.

Flux: `Actualizare date` → completeaza Administrator / Intocmit / Calitate in tab-ul **Informatii generale** → `Generare PDF` → se deschide formularul oficial ANAF in Adobe Reader.

**Adobe blocheaza popularea.** Bara galbena de sus: *„Data from this site is blocked"* → butonul **`Options`** (dreapta barii) → `Trust this document one time only` (suficient) sau `always`. Pana atunci formularul e gol si pare ca SAGA n-a completat nimic — **nu completa manual**, sunt sute de campuri.

**Corelatia de 1 leu la capitaluri — blocanta, nu avertisment.** SAGA lasa sa continui („Nu sunt indeplinite 1 corelatii. Doriti sa continuati?"), dar **validatorul ANAF din formular respinge**:
```
F10.R49.C1 = F10.(R04+R09+R10-R13-R16-R17-R18).C1  (29951 <> 29950)
```
Cauza: rotunjirea la leu a fiecarui rand. Fixul corect: **rd. 41 „Profitul/pierderea reportat(a) SOLD C (ct.117)" −1 leu**, in ambele coloane. NU umbla la casa/banci si NU la rd.44 (trebuie sa ramana egal cu rezultatul din CPP).

**Editeaza direct in formularul PDF, nu in grila SAGA.** Grila VFP e fragila: selectia nu se muta la double-click (typing-ul ajunge pe alt rand!), iar tastarea a 5 cifre lasa o cifra rataacita in coloana ingusta din dreapta. In PDF: click pe celula → `Ctrl+A` → tastezi → `Tab`; totalurile se recalculeaza singure.
- Daca strici o celula in SAGA: **`Actualizare formule` → Da → apoi `Actualizare date`** reseteaza tot la valorile calculate (dureaza ~90s, SAGA pare inghetata dar chiar lucreaza — nu o omori). Sterge insa TOATE ajustarile manuale.

**Coloana „inceput perioada" = bilantul anului anterior asa cum a fost DEPUS.** Verific-o pe **mfinante.gov.ro → info persoane juridice dupa CUI** (are captcha, o completeaza Eduard). Acolo vezi activ, datorii, capitaluri, cifra de afaceri, rezultat si nr. salariati din bilantul depus.

**Arhiva ZIP e OBLIGATORIE** (OMFP 2206/2020 pct.1.11 alin.4). Dupa validarea reusita apare „Atasez arhiva .ZIP". Arhiva trebuie sa contina **prima pagina a situatiilor financiare listata, semnata olograf si scanata alb-negru**, plus hotararea AGA. Daca anulezi, formularul revine la **„Formular NEVALIDAT"** si nu se poate semna.

**SAGA genereaza si documentele anexe** din butoanele de jos ale ecranului Bilant: `Hotarare AGA`, `Raportul administratorului`, `Declaratie de inactivitate`, `Distribuire dividende`. Toate sunt formulare XFA — acelasi blocaj Adobe.

Iesirile: `C:\TEMP\bilant_sc_<luna><an>\<luna><an>\<firma>\`.

**Calitate intocmit:** nu exista optiunea „administrator". Pentru un administrator care intocmeste el situatiile → **13 - alta persoana imputernicita potrivit legii**. Membru CECCAR → 21/22.

Termen: **150 zile de la 31.12** (30 mai). Peste 30 zile intarziere amenda 1.500-4.500 lei (L82/1991 art.42).

Vezi [[project_saga_conta4u_setup]], [[skill_saga_d406_generare]], [[reference_conta4u_fiscal_profile]].
