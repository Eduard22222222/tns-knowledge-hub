---
name: reference_conta4u_fiscal_profile
description: "Conta 4U SRL fiscal profile — NEPLATITOR TVA, zero angajati, impozit pe profit. Never re-ask these."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 7b813f9a-b9e1-4db6-8373-607368bc524d
  modified: 2026-07-28T15:52:31.855Z
---

Conta 4U SRL (CUI 47755391, J2023004333408) — profil fiscal stabilit de Eduard, **nu se reconfirma**:

- **NEPLATITOR DE TVA.** Eduard a spus asta de mai multe ori si se enerveaza (justificat) cand revin la subiect. Nu exista D300. Consecinta: D406 SAF-T = **trimestrial** (confirmat pe surse, dupa ce initial gresisem sustinand ca e anual).
- **ZERO angajati.** Nu exista D112, nu exista contributii salariale. (Am afirmat gresit candva ca ar avea 3 salariati — era alta firma; SALARIATI in DBF nu inseamna activi, trebuie filtrat DATAL.)
- **Platitor de impozit pe profit 16%** (NU microintreprindere — checkbox-ul "Impozit pe venit (microintreprindere)" e corect nebifat). D100 trimestrial, cumulat, scadent pe 25 ale lunii urmatoare trimestrului.
- Administrator semnatar in declaratii: **DUMITRIU RALUCA**. Tokenul de semnatura disponibil pe laptop e insa al lui **Adrian-Gabriel Dumitriu** (Trans Sped QCA G3, expira 05.03.2027) — de verificat cine e imputernicit pe SPV.
- Trezoreria competenta: **Sector 3** (sediu str. Fetesti 44C, Bucuresti sect. 3). Cont unic 55.03 calculat: `RO62TREZ7035503047755391`.

**ATENTIE — configurarea din SAGA NU reflecta asta:** in Administrare -> Configurare societati, "Modul de plata al TVA-ului" era setat pe **Lunar** (gresit, trebuie **Neplatitor**), iar adresa, conturile bancare, codul CAEN si capitalul social erau goale. Vezi [[project_saga_conta4u_setup]].
