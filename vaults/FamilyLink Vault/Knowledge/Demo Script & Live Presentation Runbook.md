---
title: Demo Script & Live Presentation Runbook
type: runbook
product: ComfortMap
audience: prezentator (Eduard) — prezentare pre-handover
status: ready — verificat live 2026-05-19 (deploy 43b083e)
---

# ComfortMap — Demo Script & Live Presentation Runbook

> Tot ce-ți trebuie ca să prezinți live, cu ce e în producție **acum**. Verificat
> live 2026-05-19: deploy `43b083e` READY, toate cele 5 conturi de demo se
> loghează, paginile publice 200.

---

## ⚡ CHEAT-SHEET (1 ecran — ăsta îl ții deschis pe telefon)

**URL login:** `https://comfortmap.ro/login` → tab **„Cu parolă"** (NU magic link la demo — vezi de ce mai jos)

| Rol | Email | Parolă |
|---|---|---|
| Super-admin (Realitatea Socială) | `marylou@realitateasociala.ro` | `demo-marylou-2026` |
| Admin cămin (Test 2 EDI) | `office@fiblyai.com` | `demo-edi-2026` |
| Familie (Test 2 EDI) | `office+familytest@thenichesociety.ro` | `demo-familytest-2026` |

> Rezervă: admin `mariana@casa-ana.ro` / `demo-mariana-2026` · familie `andrei.familie@example.com` / `demo-andrei-2026`

**Flux (3 acte):** Super-admin (+ creează cămin live) → Admin cămin (postează update + foto) → Familie (vede update + cere raport PDF).

**Cele 3 „NU":**
1. ❌ NU apăsa butonul **„Programează demo"** (Calendly inexistent → 404). Dacă te întreabă: „integrarea de programare se finalizează".
2. ❌ NU folosi tab-ul Magic link pe scenă (depinde de livrare email = așteptare). Parolă = instant.
3. ❌ NU crea 5 cămine de test. Creezi **unul** („Cămin Demo Prezentare"), apoi îl ștergi (sau mă pui să-l șterg după).

---

## 0. Pre-demo checklist (T-15 minute)

- [ ] 3 ferestre/profile browser separate, fiecare logat dinainte: **Super-admin**, **Admin cămin**, **Familie** (login cu parolă — vezi cheat-sheet). Astfel nu pierzi timp logându-te pe scenă.
- [ ] Deschide dinainte în taburi: `/platforma`, `/platforma/camine/nou`, `/caminul`, `/portal`.
- [ ] Pe contul de Familie: deschide deja un raport PDF o dată (se „încălzește" — a doua oară se deschide instant).
- [ ] Test rapid: pe fereastra Admin cămin, postează un update de probă **înainte** de demo (ca să existe conținut) — sau lasă-l pentru momentul live (mai impactant). Decizia ta.
- [ ] Internet backup (hotspot telefon) — totul e cloud, fără net nu merge nimic.
- [ ] Ai la îndemână 4-5 screenshot-uri de rezervă (vezi §4 Fallback) în caz de cădere net/Vercel.
- [ ] Confirmă o dată că `comfortmap.ro/login` se deschide.

---

## 1. Pitch-ul (90 secunde, ÎNAINTE să atingi ecranul)

> „Familiile care își duc părintele într-un cămin trăiesc cu o întrebare zilnică:
> *ce mai face, e bine?* Azi răspunsul vine pe WhatsApp, ad-hoc, sau deloc.
> Căminele n-au un mod structurat să comunice — și nici dovada transparenței pe
> care familiile o cer tot mai mult.
>
> ComfortMap rezolvă exact asta: o singură platformă unde echipa căminului
> postează zilnic update-uri cu poză și text, familia le vede în timp real, pot
> comunica direct, iar la final de săptămână familia primește automat un raport
> PDF. Totul găzduit în UE, conform GDPR.
>
> Vă arăt acum, live, întreg fluxul — din 3 perspective: cum administrăm
> platforma, cum lucrează căminul, și ce vede familia."

(Opțional credibilitate: Realitatea Socială = membru *European Ageing Network*; Cerasela Maciuca = Președintă Asociația „Acad. Nicolae Cajal". Folosește dacă audiența nu vă cunoaște.)

---

## 2. Live demo — 3 acte

### 🎬 ACT 1 — Super-admin (perspectiva Realitatea Socială) · ~4 min

**Fereastra Super-admin → `/platforma`**

1. **Overview.** „De aici Realitatea Socială vede toate căminele din rețea —
   date reale: cămine active, utilizatori, venit lunar recurent, activitate."
   Arată cardurile cu cămine reale (Casa Ana / Test 2 EDI / Vila Floarea).
2. Click **Cămine** (meniu stânga) → arată lista + filtrarea după status (Active/Trial).
3. Click pe un cămin → pagina de detaliu: rezidenți, utilizatori, audit recent.
   „Fiecare acțiune e logată — audit GDPR, retenție 5 ani."

**WOW moment — onboarding live (asta demonstrează criteriul de acceptare):**

4. Buton **„Onboardează cămin"** → `/platforma/camine/nou`.
5. Completează rapid (ai datele pregătite — vezi mai jos), **spunând în timp ce completezi**:
   - Denumire legală: `Cămin Demo Prezentare SRL` · Nume public: `Cămin Demo Prezentare`
   - Slug: `camin-demo-prezentare` *(„litere mici, fără diacritice — identificator unic")*
   - CUI: `RO99887766` · Email: `contact@camindemo.ro` · Telefon: `+40256111222`
   - Adresă: `Str. Demo nr. 1` · Oraș: `Timișoara` · Județ: `Timiș` · Cod: `300200`
   - Pachet: `T1` · **Email admin**: pune un email real la care AI acces (sau lasă gol și explică)
6. **Creează tenant** → „Și gata. Cămin nou, în trial 30 de zile, iar
   administratorul căminului tocmai a primit automat un email cu link de acces —
   fără parolă. Onboarding complet în sub 2 minute, fără echipă tehnică. Există
   și un ghid scris pas-cu-pas pentru asta."

> 🧹 După demo: spune-mi „șterge căminul demo" și îl curăț (tenant + admin +
> audit), ca producția să rămână curată.

---

### 🎬 ACT 2 — Admin cămin (perspectiva echipei căminului) · ~4 min

**Fereastra Admin cămin → `/caminul`** (logat ca `office@fiblyai.com`)

1. „Asistenta/administratorul căminului vede toți rezidenții, cine are update-uri
   recente, mesaje necitite."
2. Click pe un rezident → **postează un update zilnic**: scrie un text scurt
   („Doamna Maria a participat azi la activitatea de pictură, a mâncat bine 🎨")
   + **atașează o poză** → publică. „Asta ajunge instant la familie."
3. Arată **Mesaje** → un schimb cu familia (sau scrie un mesaj nou către familie).
4. Arată **Echipă → invită coleg** (magic link automat) și **invită familie** —
   *explică*, nu aștepta inbox-ul pe scenă: „familia primește un email cu link,
   apasă, e înăuntru — fără cont, fără parolă."
5. (Opțional) **Setări** → frecvența rapoartelor.

---

### 🎬 ACT 3 — Familia (perspectiva care vinde emoțional) · ~4 min

**Fereastra Familie → `/portal`** (logat ca `office+familytest@thenichesociety.ro`)

1. „Asta vede fiul/fiica. Update-ul postat acum 2 minute de cămin — **deja aici**,
   cu poza." Arată feed-ul + galeria.
2. **Mesaje** → răspunde la mesajul echipei. „Comunicare directă, în context, nu
   pierdută pe WhatsApp."
3. **Preferințe** → frecvența notificărilor (zilnic / săptămânal / niciodată) +
   *„familia își poate invita și alți membri"* (card invită membru).
4. **Rapoarte → „Cere raport până azi"** → se generează un **PDF real**: deschide-l.
   „Raport branded ComfortMap, cu diacritice corecte, logo, sumarul săptămânii.
   Ăsta pleacă automat în fiecare duminică pe email — dar familia poate cere
   oricând unul actualizat la zi."

> Punct tehnic de spus aici: „PDF generat server-side, font cu suport complet
> română (ă/â/î/ș/ț), stocat criptat în UE, link semnat cu expirare."

---

## 3. Specificalități tehnice (slide-ul de credibilitate — 3-4 min)

Spune-le scurt, cu încredere:

**Stack & infrastructură**
- Next.js 16 (App Router, React 19) + Supabase (Postgres + Auth + Storage) + Resend (email tranzacțional), deploy pe Vercel, CI pe fiecare push.
- **Rezidență date 100% UE:** baza de date Supabase în **Frankfurt (eu-central-1)**, email Resend în **Irlanda (eu-west-1)**. Niciun dată în afara UE → aliniere GDPR.

**Securitate & acces**
- Login **passwordless prin magic link**: token one-time, expiră în 1h, o singură folosire.
- Link **bot-safe**: pagină intermediară statică, ca preview-urile de link (WhatsApp/Gmail) să nu „consume" tokenul → fără „link expirat".
- Endpoint public **anti-enumeration**: nu poți afla dacă un email are cont; **nu se creează conturi nesolicitate** (verificat live).
- **Multi-tenant izolat**: fiecare cămin își vede doar datele lui; super-admin e cross-tenant by design (doar Realitatea Socială).
- **Audit log** pe acțiuni, intenție de retenție 5 ani (GDPR).
- Roluri: super-admin / admin cămin / staff cămin / familie owner / membru familie — fiecare cu dashboard-ul lui.

**Raportare automată**
- Cron săptămânal (duminică) → PDF real branded → email la toate familiile, respectând preferința fiecăreia (zilnic/săptămânal/niciodată).
- Raport on-demand: săptămâna curentă, luni→acum, separat de cel programat (nu se suprascriu), idempotent.

**Onboarding**
- Un cămin nou e creat de super-admin în <2 min din interfață, intră în trial 30 zile; există runbook scris → self-service fără dev (criteriu de acceptare îndeplinit).

**Model comercial:** per cămin, T1–T4 după nr. rezidenți — 150 / 250 / 350 / 450 EUR/lună; trial 30 zile.

---

## 4. Ce să NU atingi + Fallback

| Risc | Ce faci |
|---|---|
| Buton **„Programează demo"** (Calendly) | Nu-l apăsa. Dă 404 (cont Calendly inexistent). Dacă apare în discuție: „programarea demo se integrează cu Calendly, se finalizează." |
| Tab **Magic link** pe scenă | Folosește **parolă** (instant). Magic link-ul îl *descrii* ca UX pentru familii; dacă vrei să-l arăți, fă-o cu un email pre-trimis, nu aștepta inbox live. |
| Invitație/raport „nu apare în inbox imediat" | Normal — livrarea email durează secunde-minute. Nu sta pe scenă să aștepți; spune „pleacă automat" și mergi mai departe. |
| Net/Vercel pică | Treci pe screenshot-urile de rezervă; e cloud, fără net nu există plan B live. |
| Te pierzi în UI | Revii mereu la cele 4 taburi pregătite: `/platforma`, `/platforma/camine/nou`, `/caminul`, `/portal`. |

**Screenshot-uri de rezervă de pregătit (T-15):** /platforma overview, formular onboarding completat, /caminul cu un update+poză, /portal feed cu poza, un raport PDF deschis.

---

## 5. Întrebări probabile + răspunsuri (tehnic)

- **„Unde sunt datele?”** → Supabase, Frankfurt UE (eu-central-1); email Resend Irlanda UE. Nimic în afara UE. GDPR-aligned; audit log cu retenție.
- **„Cum se loghează familiile, e sigur?”** → Magic link passwordless, one-time, expiră 1h, pagină bot-safe; sau parolă. Acces pe rol, date izolate per cămin.
- **„Un cămin poate vedea datele altui cămin?”** → Nu. Multi-tenant, fiecare query e legat de cămin. Doar super-adminul (voi) e cross-tenant.
- **„Cine poate adăuga un cămin? Avem nevoie de programatori?”** → Nu. Super-adminul îl creează în <2 min din interfață; există ghid scris pas-cu-pas (tocmai ați văzut).
- **„Ce se întâmplă cu rapoartele dacă nu e nimeni?”** → Pleacă automat duminică; familia poate cere și manual unul la zi; respectă preferința de notificare.
- **„E gata de producție?”** → Faza 1 (produsul de conectare cămin↔familie) e live și funcțional acum. Faza 2 = directorul public ComfortMap (tip Booking.com pentru cămine). Onest: integrarea de programare demo (Calendly) se finalizează — restul fluxului e operațional.
- **„GDPR pentru date de sănătate?”** → Date în UE, acces pe rol, audit. Pentru Faza 2 e planificat DPIA + DPO extern (documentat în vault).

---

## 6. Închidere (30s)

> „Ce ați văzut e live, în producție, acum: căminul postează, familia vede
> instant, comunică, primește rapoarte automate — totul în UE, conform GDPR.
> Faza 1 e operațională. Următorul pas e directorul public ComfortMap. Suntem
> gata să onboardăm primele cămine."

---

## Anexă — referințe rapide

- Login: `https://comfortmap.ro/login` (tab „Cu parolă")
- Super-admin: `/platforma` · Cămin: `/caminul` · Familie: `/portal` · Onboarding: `/platforma/camine/nou`
- Credențiale: vezi cheat-sheet (conturi de TEST pe tenanturi de test — NU pe căminul client real)
- Deploy verificat: `43b083e` (production, READY, 2026-05-18→19)
- Ghid onboarding detaliat: [[Onboarding Cămin Nou — Ghid Super-Admin]]
- Stare tehnică completă: [[ComfortMap Live Audit 2026-05-18]] (vezi ROUND 3)
- One-liner arhitectură: *Next.js 16 + Supabase (Postgres/Auth/Storage, UE-Frankfurt) + Resend (email, UE-Irlanda) pe Vercel; multi-tenant, magic-link bot-safe, raportare PDF automată.*
