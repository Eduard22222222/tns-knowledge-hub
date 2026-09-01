# GDPR Meeting Prep — ComfortMap / FamilyLink

> Agendă pentru întâlnirea cu specialistul GDPR. Grupat pe: (A) decizii de clarificat, (B) ce avem deja, (C) gap-uri de rezolvat. Context: app procesează date despre vârstnici în cămine → **date de categorie specială (sănătate, Art. 9 GDPR)** → ștachetă ridicată.

---

## A. DECIZIA #1 — Cine e Operator (Controller) vs Persoană Împuternicită (Processor)?

Asta guvernează tot. Trebuie stabilit clar în ședință:

- **Căminele** = Operatori pentru datele rezidenților (ei decid ce se înregistrează, de ce). 
- **Realitatea Socială (ComfortMap)** = Persoană Împuternicită (procesează în numele căminelor).
- **Realitatea Socială** = Operator pentru: site public, formulare B2C (inquiry familii), date angajați proprii.

**Consecințe directe:**
1. ComfortMap are nevoie de **DPA ca împuternicit cu FIECARE cămin** (Art. 28) — contract de prelucrare, parte din contractul comercial.
2. ComfortMap are nevoie de **DPA cu fiecare subprocesator** (Supabase, Vercel, Resend, Sentry, OpenAI) — ✅ majoritatea făcute (vezi Subprocessors GDPR Audit).
3. Căminul (ca Operator) trebuie să aibă temei legal + consimțământ de la rezident/reprezentant legal.

**Întrebare pentru specialist:** e model „împuternicit" clasic sau „operatori asociați" (joint controllers, Art. 26)? Pentru un SaaS de comunicare, de obicei împuternicit — dar confirmă.

---

## B. CE AVEM DEJA (punctele tari — de prezentat)

| Cerință | Status | Detaliu |
|---|---|---|
| Date stocate în UE | ✅ | Supabase Frankfurt (eu-central-1), Vercel fra1 |
| Criptare at rest + in transit | ✅ | AES-256 (Supabase), TLS/HTTPS, HSTS |
| Access control | ✅ | RLS 100% (21/21 tabele), roluri, SECURITY DEFINER |
| Audit log per acțiune | ✅ | tabela `audit_log` — create/update/delete/login/invite/revoke |
| Dreptul la ștergere (Art. 17) | ✅ | hard delete + cascade pe rezident |
| Portabilitate / export (Art. 20) | ✅ | endpoint export date cămin |
| Consimțământ microfon (voice) | ✅ | tabela `consent_records` |
| Minimizare foto | ✅ | EXIF șters + re-comprimare la upload |
| Storage privat | ✅ | buckets private, signed URLs 7 zile |
| Politici legale publice | ✅ | /legal/confidentialitate, /cookies, /anspdcp |
| Subprocesatori cu DPA+SCC | ✅ | Supabase, Vercel, Resend, Sentry (audit 30.04.2026) |
| EU-US transfer mechanism | ✅ parțial | SCC + EU-US DPF pentru Resend/Sentry |

---

## C. GAP-URI DE REZOLVAT (onest — specialistul le va întreba)

### 1. DPO (Responsabil cu Protecția Datelor) — Art. 37 ⚠️ PROBABIL OBLIGATORIU
Procesăm date de sănătate la scară → DPO probabil **obligatoriu**. Acum: „în curs de desemnare".
→ **Decizie în ședință:** cine? (extern vs intern). Realitatea Socială = responsabilitatea Operatorului principal. Termen.

### 2. DPIA (Evaluare de Impact) — Art. 35 ⚠️ OBLIGATORIU
Pentru date categorie specială la scară = DPIA obligatorie ÎNAINTE de scale. Nu e făcută.
→ Trebuie: listă procesări, riscuri (acces angajați furnizor, transferuri US, breșe), măsuri mitigare, decizie justificată. Vezi structura în „GDPR & Supabase Access.md".

### 3. OpenAI — subprocesator NEDOCUMENTAT ⚠️ NOU
Funcția „voice transcribe" trimite **audio** (poate conține info sănătate despre rezident) la **OpenAI (US)**. NU e în auditul de subprocesatori.
→ Acțiune: DPA OpenAI + SCC + config **zero-retention** pe API + adăugat în lista subprocesatori + DPIA. SAU reconsideră (transcriere on-device / furnizor EU).

### 4. Backup-uri — Art. 32 (reziliență) ⚠️
Supabase e pe plan **FREE** acum → **fără backup automat**. GDPR Art. 32 cere „capacitatea de a restabili disponibilitatea datelor". 
→ Upgrade Supabase **Pro** ($25/lună) = backup zilnic 7 zile + PITR. (Eduard se ocupă)

### 5. Politica de retenție a datelor ⚠️
Cât păstrăm datele după: externare rezident / deces / plecare cămin? Nu e definită/implementată.
→ Definește perioade + mecanism ștergere automată. Specialistul va întreba sigur.

### 6. Procedură breșă de date — Art. 33/34
Notificare ANSPDCP în 72h + persoane afectate. Trebuie procedură documentată (cine, cum, în cât timp).

### 7. Registrul activităților de prelucrare (RoPA) — Art. 30
Atât Operatorul (cămin/RS) cât și Împuternicitul (ComfortMap) trebuie să-l mențină. De creat.

### 8. Înregistrare ANSPDCP
Pagina /legal/anspdcp zice „în curs de finalizare". De completat.

### 9. Consimțământ foto rezidenți
Foto cu rezidenți vulnerabili → consimțământ de la rezident sau reprezentant legal. De verificat că e capturat explicit (nu doar microfon).

---

## D. DREPTURILE PERSOANELOR VIZATE (Art. 15-22) — cum le acoperim

| Drept | În app | Note |
|---|---|---|
| Acces (15) | parțial | familia vede datele rezidentului ei |
| Rectificare (16) | ✅ | admin editează date cămin/rezident |
| Ștergere (17) | ✅ | cascade delete |
| Portabilitate (20) | ✅ | export endpoint |
| Restricționare (18) | ⚠️ | de definit proces |
| Opoziție (21) | ⚠️ | de definit proces |

→ Definește un **proces clar** prin care familia/rezidentul cere exercitarea drepturilor (email gdpr@comfortmap.ro + termen 30 zile — deja menționat în FAQ).

---

## E. TALKING POINTS pentru ședință (3 fraze cheie)

1. *„Arhitectura e împuternicit-operator: căminele sunt operatori, noi suntem împuternicit. Avem DPA cu toți subprocesatorii, date în UE Frankfurt, RLS 100%, audit log, criptare."*
2. *„Știm că suntem pe date Art. 9 — sănătate. Deci avem nevoie de DPIA + DPO desemnat + politica de retenție înainte de scale. Astea sunt pe roadmap."*
3. *„Singurele puncte deschise tehnice: backup (upgrade Pro în curs) + OpenAI ca subprocesator nou pentru voice (DPA + zero-retention de adăugat)."*

---

## F. PRIORITIZARE acțiuni post-ședință

**Înainte de scale (cămine plătitoare reale):**
1. DPO desemnat
2. DPIA documentată
3. DPA-uri cu căminele (template)
4. OpenAI DPA + zero-retention SAU dezactivare voice
5. Supabase Pro (backups)
6. Politică retenție + implementare
7. RoPA + procedură breșă

**Referințe vault:** `Subprocessors GDPR Audit.md`, `GDPR & Supabase Access.md`, `Security & Hardening.md`
