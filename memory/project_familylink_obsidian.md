---
name: FamilyLink Vault & Project Notes
description: Dedicated Obsidian vault pentru proiectul FamilyLink (TNS × Realitatea Sociala) cu toată documentația tehnică, GDPR, pricing, contract review
type: reference
originSessionId: b833b2f7-3be7-472e-a90a-c40b90a28f50
---
**Vault location:** `OneDrive/Documents/FamilyLink Vault/`

## Structură

```
FamilyLink Vault/
├── Welcome.md                              ← index și overview
├── Knowledge/
│   ├── GDPR & Supabase Access.md          ← audit GDPR de făcut Faza 2 (acces Supabase EU)
│   ├── Architecture Decisions.md          ← stack, service layer, multi-product schema, RLS, RSI
│   └── Pricing & Business Model.md        ← T1-T4 (150/250/350/450 EUR/lună per cămin)
├── Projects/
│   ├── Faza 1 — Lean MVP.md               ← scope, milestones, criterii recepție, SLA, penalizări
│   └── Negotiation Notes 2026-04-30.md    ← răspuns la review-ul Av. HOMEAG
└── Daily/
```

## TODO critic Faza 2 (notat în vault)

- [ ] Audit Supabase: ce angajați au acces la DB Frankfurt sub CLOUD Act, ce logging există → ticket support Supabase
- [ ] DPIA conform art. 35 GDPR pentru date sănătate (rezidenți)
- [ ] DPO extern desemnat + notificat ANSPDCP
- [ ] T&C + politică confidențialitate redactate de avocat
- [ ] Decizie: rămânem pe Supabase Team, upgrade Enterprise cu CMK, sau self-host

**Why:** Vault-ul ăsta e single source of truth pentru proiectul FamilyLink — tot ce ține de tehnic, contract, GDPR, pricing trăiește acolo. Folosit de tine la kickoff și pe parcursul execuției.

**How to apply:** Înainte de orice decizie tehnică/contractuală pe FamilyLink, verifică ce e deja documentat în vault. Dacă faci o decizie nouă, actualizează vault-ul. Nu duplica info în chat sau în alt loc.
