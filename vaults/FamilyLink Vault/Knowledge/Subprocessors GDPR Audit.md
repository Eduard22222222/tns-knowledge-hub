# Audit GDPR sub-procesatori — verdict & acțiuni

Audit efectuat 30.04.2026 înainte de semnarea contractului. Toate constatările sunt din pagini publice oficiale ale fiecărui furnizor.

## Tabel verdict

| Service | DPA + SCC | EU residency | Verdict | Acțiune kickoff |
|---|---|---|---|---|
| **Supabase** | ✅ DPA, SCC, ISO 27001, SOC 2 Type 2, HIPAA | ✅ Frankfurt (eu-central-1) | OK | Project în regiunea EU |
| **Vercel** | ✅ DPA cu SCC | ⚠️ Primary US, dar `fra1` Frankfurt disponibil | OK cu config | Deploy region = `fra1` |
| **Resend** | ✅ DPA, SCC EU Module Two, EU-US DPF | ❌ Procesare primară US | OK sub SCC + DPF | Acceptat; flag pentru DPIA Faza 2 |
| **Sentry** | ✅ DPA, SCC | ⚠️ `de.sentry.io` EU disponibil dar **irevocabil după creare** | OK doar dacă creezi pe regiune EU din start | **CRITIC: account NEW pe `de.sentry.io`, NICIODATĂ pe `sentry.io`** |
| **GitLab.com** | ✅ DPA | ❌ US (Google Cloud us-east1) | Risc minor (doar cod sursă, nu PII) | Disclose în contract; alternativă Faza 2 |

---

## Detalii per furnizor

### 1. Supabase — ✅ Cel mai solid

**Sursa:** https://supabase.com/legal/dpa, https://supabase.com/security

**Certificări:**
- SOC 2 Type 2
- ISO 27001
- HIPAA (cu BAA pe planuri Pro+)
- PCI Level 1 prin Stripe (pentru billing)

**Encryption:**
- AES-256 at rest
- TLS in transit
- Application-level encryption pentru tokens/keys

**EU residency:** Frankfurt (AWS eu-central-1) — la creare proiect alegi regiunea explicit.

**Backup:** zilnic automat pe paid tiers, Point-in-Time Recovery pe Pro+.

**DPA:** semnat via PandaDoc (request din dashboard → Settings → Legal). 

**Sub-procesatori (cunoscuți public):**
- AWS — infrastructură
- Cloudflare — CDN, DDoS
- Stripe — billing (NU date FamilyLink)

**Concluzie pentru noi:** OK pentru Faza 1 și Faza 2. Pentru date sănătate, considerăm BAA (HIPAA-compliant) în Faza 2 — chiar dacă HIPAA e US standard, semnalează maturitate operațională.

### 2. Vercel — ✅ OK cu config

**Sursa:** https://vercel.com/legal/dpa

**DPA + SCC:** DA, pentru transferurile EEA/UK/Switzerland.

**EU residency:**
- Procesare primară SUA (declarat în DPA)
- DAR: regiuni EU disponibile pentru compute (deploy region):
  - `fra1` — Frankfurt
  - `dub1` — Dublin
  - `lhr1` — London
  - `arn1` — Stockholm
- **Trebuie configurat la deploy** (în `vercel.json` sau dashboard): `"regions": ["fra1"]`

**Acțiune kickoff:** la creare proiect Vercel, set primary deployment region = `fra1`. Funcția care procesează request-urile din EU rulează în EU.

**Important:** chiar și cu region EU, edge cache static poate fi global. Pentru noi, edge cache pe HTML public (landing, comfortmap) e OK — nu conține PII.

### 3. Resend — ✅ OK sub SCC + DPF

**Sursa:** https://resend.com/legal/dpa

**DPA:** Module Two (Controller-Processor) SCC pentru EU, UK Addendum pentru UK, modificate pentru Swiss.

**EU residency:** ❌ Procesare primară SUA. Resend NU are EU region la momentul auditului.

**Compliance frameworks:**
- Standard Contractual Clauses ✓
- EU-US Data Privacy Framework (DPF) certificare ✓

**Sub-processor changes:** 14 zile prior notice cu drept de obiecție.

**Concluzie pentru noi:** Acceptabil sub GDPR (cu SCC + DPF), dar ideal de re-evaluat în DPIA Faza 2 pentru date sănătate. Email-urile către familii nu conțin date sensibile (sunt doar invitații + notificări de update), deci risc operațional mic. Alternativă viitoare: AWS SES eu-central-1, Postmark EU, sau SendGrid EU dacă apare presiune compliance suplimentară.

### 4. Sentry — ⚠️ CRITIC: alegere irevocabilă la setup

**Sursa:** https://docs.sentry.io/concepts/data-management/data-storage-location/, https://sentry.io/legal/dpa/

**DPA + SCC:** DA (Schedule 3 incorporates SCCs, Module 2 + Module 3).

**EU residency:** EXISTĂ la `de.sentry.io` (Frankfurt, Germania). Inclus pe TOATE planurile (inclusiv Free).

**LIMITARE CRITICĂ:** *"Once selected, your data storage location can't be changed. The only way to switch it is by creating a new organization."* — alegerea regiunii EU se face EXCLUSIV la crearea organizației.

**API endpoint pentru EU:** `https://de.sentry.io/api/...`

**Date stocate în EU (când alegi EU):** error events, transactions, profiles, session replays, releases, debug symbols, source maps.

**Date care RĂMÂN în US chiar și pe EU:** organizational metadata, account info pentru login backward compat (irelevante pentru PII utilizatori finali).

**Acțiune kickoff:**
1. Creează organizație nouă pe `de.sentry.io`, NU pe `sentry.io` standard
2. Alege „Data Storage Location: European Union (Frankfurt)" la setup
3. Configurează SDK-ul (`@sentry/nextjs`) cu DSN-ul de pe `de.sentry.io`
4. Verifică în Settings → Data Storage că apare „Frankfurt"

Dacă greșești și creezi pe `sentry.io` US, **nu poți recupera fără să ștergi tot și să creezi din nou** organizația — proiectele, alertele, configurările toate se reset.

### 5. GitLab.com — ⚠️ US-hosted, risc acceptabil

**Sursa:** https://about.gitlab.com/handbook/legal/data-processing-addendum/, docs.gitlab.com

**DPA:** disponibil (auth-protected pages — confirm prin canale legal/sales).

**EU residency:** ❌ GitLab.com SaaS = Google Cloud us-east1 (SUA). NU există EU region pentru GitLab.com SaaS standard.

**Alternative pentru EU residency:**
- **GitLab Dedicated EU** — variant Enterprise tier (cost mare, ~$300+/lună minim)
- **GitLab self-hosted** pe Hetzner/AWS EU — control total, dar +5-10h/lună mentenanță
- **GitHub Enterprise** cu „Enterprise Cloud Data Residency" (DACA Germania) — alternativă pentru cod, dar pierdem features GitLab (CI/CD integrat, MR-uri, etc.)

**Risc evaluat pentru FamilyLink:**
- Repository conține: cod sursă, CI/CD config, migrations SQL (schema, NU date)
- NU conține: date utilizatori finali, fotografii rezidenți, mesaje, audit log production
- PII directly in code = NONE (asigurat prin convenția de cod)
- Audit log production = în Supabase Frankfurt, NU în GitLab

Concluzie: risc residual scăzut. Acceptabil cu disclosure în contract (deja făcut în Art. VI alin. 5 + Art. X alin. 5).

**Pentru DPIA Faza 2:**
- Documentează că GitLab.com este sub-procesator US, dar prelucrează doar cod (no PII)
- Evaluează migrare către GitLab self-hosted EU dacă apare presiune externă (audit ANSPDCP, audit cămin partener mare, etc.)
- Cost migrare estimat: 8-16 ore de configurare + transfer repository

---

## Comparație alternative considerate

| Caz | Opțiunea acum | Alternativă EU dedicată | Cost diferență |
|---|---|---|---|
| Database | Supabase Pro Frankfurt | Self-host Postgres pe Hetzner Helsinki | -$25/lună + +20h/lună mentenanță |
| Hosting | Vercel Pro fra1 | Hetzner + Coolify EU | -$20/lună + +15h/lună mentenanță |
| Email | Resend SCC | AWS SES eu-central-1 | similar cost, +setup time |
| Errors | Sentry de.sentry.io | Self-host Sentry on EU | similar SaaS, +5h/lună mentenanță |
| Repo | GitLab.com US | GitLab self-host EU | -$0 (free OSS) + 5-10h/lună mentenanță |

**Concluzia generală:** Stack-ul actual cu config corect (regiuni EU explicit) îndeplinește GDPR pentru Faza 1 și Faza 2-pilot. Migrarea la EU-only stack 100% e necesară DOAR la scale (50+ cămine, audit external solicitat) și costă ~50h/lună de mentenanță suplimentară — nu merită până nu există presiunea.

---

## Acțiuni concrete la kickoff

- [ ] Crează cont Supabase, project în Frankfurt (eu-central-1)
- [ ] Crează cont Vercel, primary deploy region = fra1 (în vercel.json sau dashboard)
- [ ] **Crează organizație Sentry pe `de.sentry.io`** (NU pe sentry.io)
- [ ] Crează cont Resend
- [ ] Crează cont GitLab.com cu MFA activat
- [ ] Acceptă DPA-ul fiecăruia (din dashboard, sau request via support)
- [ ] Documentează în vault `Faza 2 Tasks` ce DPA-uri trebuie reverificate la onboarding cămine plătitoare
- [ ] Adaugă DPA-uri ca atașamente în vault `Knowledge/DPAs/` după acceptare
