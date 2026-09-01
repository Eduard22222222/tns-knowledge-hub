# Note negociere contract — 30 aprilie 2026

## Context

Review-ul a venit din partea Realitatea Sociala (semnat M = Mary-Lou Mihai, CTO co-fondator), cu input legal de la **Av. Daniela HOMEAG (Baroul București)**. 28 puncte + 2 extras + întrebare strategică despre Faza 2.

## Întrebarea strategică (răspuns dat)

> Pot vinde abonamente cămine după Faza 1, înainte de Faza 2 GDPR completă?

**Răspuns:** DA, cu condiții, pentru primele 2-3 cămine pilot, scalabil până la 10-15 cămine, dacă Realitatea Sociala finalizează în 4 săptămâni post-MVP:
- DPIA (art. 35 GDPR)
- DPO extern desemnat + notificat ANSPDCP
- T&C + politică de confidențialitate redactate de avocat
- Consimțământ explicit pentru date sănătate (art. 9 GDPR)

Audit terț + ISO 27001 = la scale (50+ cămine), NU sunt blocante pentru pilot.

## Răspuns la cele 28 puncte

### ✅ Acceptate ca-atare (15)

1. GitLab adăugat la sub-procesatori (Art. X alin. 5)
2. Anti-cesiune (Art. XV alin. 4 nou)
4. NDA flow-down colaboratori (Art. V alin. 3 nou)
6. Toate 8 criteriile în Anexa 2 + criteriul 9 UX
7. Opțiune „recepție condiționată" (Art. XI alin. 5 + Anexa 2 V)
8. Definiție „erori critice" (Art. V alin. 9)
11. Confirmare Eduard ↔ Conta 4U (Art. XVII alin. 7 nou)
12. Confidențialitate pre-contractuală + ComfortMap (Art. IX alin. 2)
15. Kickoff = ziua lucrătoare următoare (Art. III alin. 2)
16. Pilot fallback cu date de test (Art. VI alin. 7)
19. Lista licențelor open-source înainte de semnare (Art. VIII alin. 6)
21. Documentație 48h înainte de prezentare finală (Art. V alin. 8)
23. Tarif post-garanție 70 EUR/oră (Art. V alin. 9)
25. Insolvență involuntară bilateral (Art. XIV alin. 4 nou)
A+B (extras). Estimare Faza 2 + LOI bună-credință (Art. XVII alin. 8 nou)

### ⚠️ Acceptate cu wording favorabil (8)

3. „Producție" da, dar cu clarificare că operarea comercială rămâne responsabilitate Operator
5. „Project Lead full-time, focus principal" (NU exclusiv) — îmi păstrează libertatea pentru alți clienți TNS
9. TVA: prețul fix la regimul fiscal aplicabil la semnare; modificări retroactive prin act adițional
10. Întârzierile Beneficiar: notificare scrisă în max 2 zile lucrătoare (NU „real-time")
13. Feedback 3 zile pe milestones, 5 zile pe finală + 2 reminderuri scrise la 24h interval ÎNAINTE de acceptare tacită; tacită NU se aplică pe milestones săptămânale
14. Conturi pe Beneficiar din Data Kickoff cu acces admin/owner pentru Prestator, sau transfer în 5 zile dacă create inițial pe Prestator
18. SLA garanție 24h/3BD/10BD în zilele lucrătoare 09:00-19:00 (NU weekend)
20. UX: criterii obiective UI/UX, „preferințe estetice subiective NU constituie temei de respingere"
26. Penalizări 3%/săpt cap 10% (NU 15%), cu carve-outs (scope, întârzieri Beneficiar, forță majoră, sub-procesatori)
28. Curs FX fix din ziua semnării, ambele tranșe — risc valutar mic pe 3 săpt

### ✅ Non-compete (#27) acceptat cu narrow scope

- 6 luni (NU 18)
- Definit strict: doar „aplicații web/mobile dedicate comunicării cămin-familie SaaS multi-tenant pe piața RO" = clonă FamilyLink
- Excepții: alte clienți cămine/sănătate care NU sunt platforme cămin-familie, proiecte TNS existente, Faze ulterioare FamilyLink
- Justificare: relație pe termen lung pe care Părțile intenționează să o dezvolte

### ❌ Rămase pentru discuție la întâlnire (3)

#### 17. Pilot „GDPR conform" în Faza 1
**De ce push back:** contradicție logică — Faza 1 e tocmai NU GDPR-completă. Dacă semnezi asta, contrazici Art. X notă.
**Counter-propunere:** „Pilotul utilizează date de test sau pseudonimizate până la finalizarea condițiilor GDPR de către Beneficiar."

#### 22. Vercel/Supabase outage NU forță majoră
**De ce push back:** inacceptabil, nu controlez infrastructura globală. Le pot pierde fără vina mea.
**Counter-propunere:** „Indisponibilitatea sub-procesatorilor constituie forță majoră în limita anticipării rezonabile. Prestatorul folosește furnizori cu uptime SLA ≥99.9% și comută la alternative dacă apar probleme persistente."

#### 24. Reziliere din culpa lor + fără facturare suplimentară
**De ce push back:** nedrept — pierd ~900 EUR pe greșeala lor (60-70% muncă făcută la S2, doar 2.650 EUR avans încasat).
**Counter-propunere:** păstrăm Art. XIV alin. 2 actual (avans + facturare proporțională cu munca prestată, dovedită prin commits/timesheet).

## AVIZAT PENTRU LEGALITATE

Adăugat lângă semnături la:
- Final contract principal (Art. XVII)
- Anexa 2 (Proces-verbal de recepție)

NU pe Anexa 1 (specificații tehnice — nu sunt clauze juridice).

Format: bloc dashed border auriu, „Av. Daniela HOMEAG · Avocat — Baroul București · Semnătură și ștampilă · Data: ___ / ___ / 2026"

## Alte puncte ridicate de Realitatea Sociala (pe care le-am clarificat tehnic)

### „Multi-tenant + cross-product de la Faza 1"

**Cerere:** Vor ca un user FamilyLink să fie automat și ComfortMap user, fără rewrite când lansăm directorul public.

**Răspuns tehnic dat:** schema multi-product de la zero (users + products + tenants cu product_id + user_tenant_access cu product_id). Cost zero în Faza 1, beneficiu major în Faza 2.

### „Public directory cu pagini statice per cămin"

**Cerere:** Vor ca în Faza 2 să poată activa directorul public (ComfortMap) cu pagini SEO-friendly per cămin, fără refactor.

**Răspuns tehnic dat:** Next.js 15 ISR (Incremental Static Regeneration). Stub `app/(public)/comfortmap/[slug]/page.tsx` în Faza 1 + service `public-directory.service.ts` cu signature gata. În Faza 2 doar pornim feature flag și implementăm backfill `public_profile`. Pagini statice CDN-cached, scalabile la zeci de mii.

### „Aceeași logică pentru Server Action și API public"

**Cerere:** Nu vor să rescrie totul când adaugă API public.

**Răspuns tehnic dat:** Service-layer separation obligatorie. Server Actions și Route Handlers sunt thin wrappers de 5 linii peste `lib/services/`. Adăugare API public Faza 2 = 5-7 zile efective (auth API keys + rate limit + OpenAPI docs + rute REST), zero rewrite.

### „Supabase access la datele din Frankfurt — GDPR"

**Cerere:** Vor să verific ce angajați Supabase au acces la datele DB.

**Răspuns dat:** Pentru Faza 1 (date de test) = OK pe Supabase Pro cu DPA + SCC acceptat. Pentru Faza 2 (date reale rezidenți) = audit dedicat (vezi `Knowledge/GDPR & Supabase Access.md`) cu opțiuni: rămânem pe Supabase Team, urcăm la Enterprise cu CMK, sau self-host. Decizie după DPIA, în primele 4 săptămâni post-MVP.

## Probabilități de obținere la negociere (cele 3 push-back)

| # | Probabilitate de a obține wording-ul meu | De ce |
|---|---|---|
| 17 | Foarte mare | Logica e cristal clear; ei vor înțelege |
| 22 | Medie-mare | Industry standard pentru SaaS dependent de cloud |
| 24 | Medie-greu | Le pierd din profit dacă cedează — depinde de tonul Av. HOMEAG |

## Pași la întâlnire (30.04.2026)

1. Spune răspunsul la întrebarea strategică (Faza 2 commercial use) — deblochează emoțional
2. „Am acceptat 25 din 28 + extras A,B; pe non-compete am ajustat doar scope-ul (narrow definition)"
3. Discută cele 3 push-back-uri cu counter-propunerile
4. Dacă acceptă, semnați pe loc 2 exemplare originale
5. Eu emit factura pentru Tranșa I (avans 2.650 EUR) prin e-Factura după semnătură
6. Plată în 5 zile lucrătoare → Data Kickoff = prima zi lucrătoare următoare

## Risk register pentru execuție Faza 1

| Risc | Probabilitate | Impact | Mitigare |
|---|---|---|---|
| Întârziere Beneficiar feedback | Medie | Mediu | Notificare scrisă în 2 zile + reminderuri; extinde termen |
| Cămin pilot se retrage S3 | Mică | Mic | Fallback cu date de test (Art. VI alin. 7) |
| Vercel/Supabase outage | Mică | Mediu | Forță majoră (în discuție) + monitor uptime |
| Scope creep | Medie | Mare | Act adițional obligatoriu pentru orice schimbare |
| Bug critic post-recepție | Mică | Mediu | Garanție 90 zile + SLA |
| Eduard indisponibil | Mică | Mare | „Focus principal" nu „exclusiv" — pot delega tasks tehnice către colaborator |
