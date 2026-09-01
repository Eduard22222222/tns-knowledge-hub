# GDPR & Accesul Supabase la Date

## ⚠️ Întrebare critică (de verificat înainte de Faza 2)

> Au angajații Supabase Inc. (US) acces tehnic la datele stocate fizic pe serverele din Frankfurt? Și dacă da, în ce condiții?

Răspunsul afectează:
- Conformitatea GDPR sub Schrems II (decizia CJEU C-311/18, iulie 2020)
- Necesitatea de Standard Contractual Clauses (SCCs)
- Risc de „transfer internațional" implicit chiar dacă datele sunt fizic în EU
- Posibila necesitate de a migra către self-hosted Supabase sau alternativă (Hetzner Cloud + open-source Supabase, Neon EU, etc.)

## Ce știm la 30.04.2026

### Locația fizică a datelor
- **Project Frankfurt (eu-central-1)** — datele clienților sunt stocate fizic în AWS Frankfurt
- Backup-uri în aceeași regiune (AWS multi-AZ)
- CDN/edge — nu se aplică pentru date PII (DB direct)

### Subprocessor list (oficial)
Supabase publică lista subprocesatorilor la https://supabase.com/legal/sub-processors:
- Amazon Web Services (AWS) — infrastructură
- Cloudflare — DDoS, edge
- GitHub — autentificare GitHub OAuth (nu folosim)
- Stripe — billing (date Supabase, NU date FamilyLink)
- Posibil: instrumente interne de logging și suport

### Acces angajați Supabase (PUNCTUL CRITIC)
**Ce este public la nivel actual:**
- Supabase Inc. e companie US (Delaware)
- Sub CLOUD Act (US, 2018), autoritățile US pot solicita date stocate de companii US **chiar dacă** datele sunt fizic în EU
- Supabase are politică internă „employees may access customer data for support purposes" — accesibil doar cu consimțământul clientului prin support ticket sau emergency
- Pe planurile Free/Pro: support staff poate accesa proiectul cu permisiunea expresă a owner-ului
- Pe planurile **Team / Enterprise**: există opțiuni de „BYOK" (Bring Your Own Key) și „Customer Managed Encryption"

### DPA (Data Processing Agreement) Supabase
- Standard DPA disponibil la https://supabase.com/legal/dpa
- Include SCCs (Standard Contractual Clauses) UE — versiunea 2021
- Specifică categoriile de date procesate, durata, scopul
- **Trebuie acceptat formal** de Realitatea Sociala (sau de Conta 4U în numele lor) ÎNAINTE de a stoca date reale

## Ce trebuie făcut concret

### Pentru Faza 1 (urgent — înainte de kickoff)
1. **Acceptă DPA-ul Supabase** la nivel de organizație (din dashboard Supabase → Settings → Legal)
2. **Verifică în T&C-ul Supabase** secțiunile despre acces angajați la date
3. **Pune în Anexa 1 nota** că Supabase e sub-procesator și că DPA + SCC sunt acceptate (deja făcut: Art. X alin. 5 din contract)
4. **Confirmă în scris cu Realitatea Sociala** că ei (ca Operator) au acceptat DPA-ul Supabase în cadrul lor de conformitate — face parte din responsabilitatea lor de Operator (art. 28(1) GDPR — alegerea unui Persoană Împuternicită care oferă garanții suficiente)

### Pentru Faza 2 (când se onboardează căminele plătitoare)
1. **Audit formal**: trimite la Supabase support un ticket care întreabă explicit:
   > „For our EU customers' data stored in eu-central-1, who at Supabase has technical access to raw database content? Under what circumstances? What logging is in place for employee access?"
2. **Decizie**: dacă răspunsul e nesatisfăcător pentru standardul GDPR al cămine private (date sănătate sub art. 9 GDPR), evaluează:
   - **Opțiunea A:** rămânem pe Supabase Pro/Team cu DPA + SCC + audit log activat (cel mai probabil suficient pentru Faza 2)
   - **Opțiunea B:** Supabase Enterprise cu Customer Managed Keys (CMK) — adaugă cost, dar elimină accesul Supabase în clear text
   - **Opțiunea C:** self-host Supabase pe AWS Frankfurt sau Hetzner — control total, dar +20-40 ore mentenanță/lună
   - **Opțiunea D:** migrare la Neon EU sau RDS Postgres direct — pierdem features Supabase (Auth built-in, RLS UI, Storage)

### Pentru DPIA (Data Protection Impact Assessment) Faza 2
DPIA-ul (obligatoriu sub art. 35 GDPR pentru date sănătate) trebuie să includă:
- Lista completă sub-procesatori cu țara de origine și unde stochează date
- Riscuri identificate: acces angajați furnizor, transferuri internaționale implicite, breșe de date
- Măsuri de mitigare: SCC, encryption at rest + in transit, audit log, role-based access
- Decizie justificată: de ce alegerea Supabase e proporțională cu riscul

## Resurse de consultat

- [Supabase Trust Center](https://supabase.com/security)
- [Supabase DPA](https://supabase.com/legal/dpa)
- [Supabase Sub-Processors](https://supabase.com/legal/sub-processors)
- [GDPR art. 28](https://gdpr-info.eu/art-28-gdpr/) — obligațiile Persoanei Împuternicite
- [GDPR art. 35](https://gdpr-info.eu/art-35-gdpr/) — DPIA
- [Schrems II (CJEU C-311/18)](https://curia.europa.eu/juris/document/document.jsf?docid=228677) — transferuri internaționale
- [ANSPDCP — Decizia 174/2018](https://www.dataprotection.ro/) — DPIA în România
- [EDPB Recommendations 01/2020](https://edpb.europa.eu/our-work-tools/our-documents/recommendations/recommendations-012020-measures-supplement-transfer_en) — măsuri suplimentare pentru transferuri

## Recomandare strategică

Pentru Faza 1 (MVP cu date de test) — **OK pe Supabase Pro standard cu DPA acceptat**.

Pentru Faza 2 (date reale rezidenți, info sănătate) — **Audit obligatoriu**. Probabil rămânem pe Supabase Team (nu Enterprise — overkill pentru scale-ul nostru), dar cu:
- DPIA documentată
- DPO desemnat (Realitatea Sociala — responsabilitate Operator)
- T&C clinici/cămine cu consimțământ explicit pentru sub-procesare
- Audit log activ în Supabase pentru toate accesările tabelelor sensibile

## Notă pentru întâlnirea cu Realitatea Sociala (30.04.2026)

**Comunică direct:**
> „Întrebarea voastră despre accesul Supabase la datele din Frankfurt e foarte legitimă. Răspunsul corect e: Supabase are DPA cu SCC (Standard Contractual Clauses) acceptat, datele sunt fizic în EU, dar Supabase Inc. e companie US deci sub CLOUD Act. Pentru Faza 1 cu date de test = OK. Pentru Faza 2 cu date reale = trebuie un audit dedicat (DPIA + decizie de upgrade la Supabase Team sau alternative). Pun pe roadmap-ul Fazei 2 ca task separat de evaluare."

Asta îți cumpără credibilitate (le arăți că știi nuanța) fără să blochezi semnătura Faza 1.
