# Audit Securitate 29.05.2026 (Cătălin) — Findings & Plan Remediere

> Audit consolidat: R1 (static cod) + R2 (testare live pe localhost, Supabase local, build prod Next 16.2.4). 3 CRITICE + 5 RIDICATE + medii/info. Verdict: **necesită remedieri P0 înainte de producție**.
>
> **Verificare proprie (Claude, 29.05):** am citit codul real pentru P0. **F-01 și F-02 CONFIRMATE reale în producție** (nu doar dev). Raportul lui Cătălin e acurat. Nuanțe prod marcate mai jos.

---

## Cauza-rădăcină comună
Mai multe funcții marcate „gata" sunt de fapt **stub-uri mock** rămase din scaffolding-ul timpuriu, niciodată înlocuite cu implementare reală: `requireSession` (fallback mock), `verifyApiKey` (mock), rutele GDPR (import din `@/mocks/data`). Un singur fix pe pattern-ul de auth (F-01) închide și F-10, F-18 parțial.

---

## PRIORITATE 0 — BLOCKER (înainte de orice producție)

### F-01 🔴 Bypass autentificare `requireSession()`
- **Ce e:** funcția cade silențios pe un user mock (`user_mariana` = camin_admin) când nu există sesiune validă, în loc să arunce eroare. `src/lib/services/auth.service.ts` linia ~182.
- **Cum afectează:** orice cerere **neautentificată** la un Server Action sau rută API primește drepturi de **admin de cămin**. Date sensibile (note medicale, foto vârstnici) expuse. Middleware-ul redirecționează paginile spre /login, dar NU acoperă Server Actions și API → gaura e reală în prod.
- **Verificat prod:** ✅ REAL. `ENABLE_SUPABASE_AUTH=true` în prod, dar dacă `authUser` e null nu se aruncă → cade pe mock.
- **Fix:** când `ENABLE_SUPABASE_AUTH` e activ și nu există `authUser` → `throw new UnauthorizedError()`. Fallback mock DOAR când auth e dezactivată (dev). ~5 linii. Închide automat F-10.

### F-02 🔴 Bypass cheie API `/api/v1/residents`
- **Ce e:** `verifyApiKey()` acceptă **orice** token care începe cu `fl_live_`, fără verificare în DB. `src/lib/auth/api-key.ts`.
- **Cum afectează:** oricine cu `fl_live_orice` citește datele rezidenților (nume, dată naștere, cameră). API public Faza 2.
- **Verificat prod:** ✅ REAL (mock pur, fără ramură DB).
- **Fix:** migrare nouă tabel `api_keys` (hash SHA-256, scopes, revoked_at) + verificare reală în DB. Efort mediu. **Sau** dezactivează ruta `/api/v1/residents` până la Faza 2 dacă nu e folosită încă (cel mai rapid — taie riscul instant).

### F-03 🔴 Endpoint-uri GDPR fără auth + mock
- **Ce e:** `/api/v1/gdpr/export` și `/delete` n-au verificare de autentificare ȘI importă doar din `@/mocks/data`. `src/app/api/v1/gdpr/*/route.ts`.
- **Cum afectează:** oricine știe un `familyId` accesează/șterge date. Expunere juridică Art. 15 + 17 GDPR. (Plus: nefuncțional pe DB reală.)
- **Fix:** adaugă `supabase.auth.getUser()` + verificare `owner_user_id === user.id` + implementare reală pe DB. Efort mare. **Recomandare:** până la implementare reală, **dezactivează rutele** (returnează 501) ca să tai expunerea juridică; gestionează cererile GDPR manual prin gdpr@comfortmap.ro (cum scrie deja în FAQ).

### F-04 🟠 `adminEmail` obligatoriu blochează 100% lead-urile B2B
- **Ce e:** schema Zod cere `adminEmail` obligatoriu, dar formularul nu-l trimite → fiecare lead pică cu 400. `src/lib/validation/schemas.ts` ~linia 210.
- **Cum afectează:** **niciun lead B2B nu intră** — pâlnia de vânzări e moartă.
- **Fix:** `.optional()` pe câmp. 1 linie.

### F-08 🟠 CVE-uri Next.js (7 HIGH)
- **Ce e:** Next.js 16.2.4 are 7 vulnerabilități HIGH (bypass middleware, cache poisoning, SSRF, DoS, XSS).
- **Cum afectează:** unele (bypass middleware GHSA-267c) se combină periculos cu F-01.
- **Fix:** `npm audit fix --force` → Next.js ≥16.2.6. Verifică breaking changes. (Eu recomandasem deja bump-ul ăsta în audit-ul IT.)

---

## PRIORITATE 1 — RIDICAT (înainte de lansare publică)

### F-06 🟠 Dezabonare fără token semnat (CSRF prin email)
- **Ce e:** `/api/unsubscribe?email=X&category=Y` fără verificare criptografică.
- **Cum afectează:** oricine dezabonează pe oricine știind email-ul.
- **Fix:** link semnat HMAC (token = HMAC(email:category:ts, SECRET)) + verificare `timingSafeEqual`.

### F-07 🟠 Date cross-tenant prin API
- **Ce e:** `verifyApiKey` ignoră `tenantSlug` → mapează mereu la primul tenant activ. Un cămin vede datele altuia.
- **Cum afectează:** încalcă exact promisiunea „nimeni nu vede datele nimănui". Se rezolvă odată cu F-02 (cheia trebuie legată de tenant-ul ei).

### F-12 🟡 Bucket-uri Storage lipsă din migrări
- **Ce e:** bucket-urile Storage nu-s în migrări. Pe mediu nou → „Bucket not found".
- **Verificat prod:** ⚠️ NUANȚĂ — în **producția actuală bucket-urile EXISTĂ** (`reports` + `resident-photos`, verificat live; rapoartele s-au generat). Problema e doar **reproductibilitate** (mediu nou / `db reset` local nu le are). Cod folosește bucket `reports` (nu `weekly-reports` cum presupune auditul).
- **Fix:** migrare nouă `0018_storage_buckets.sql` care creează `reports` + `resident-photos` → mediile noi funcționează.

### F-05 🟠 Crash super-admin în mod mock
- **Ce e:** `/platforma` + `/platforma/audit` apelează `createAdminClient()` fără gardă `HAS_SUPABASE` → 500 în mod mock.
- **Verificat prod:** ⚠️ NUANȚĂ — auditul confirmă „✅ funcțional cu USE_REAL_DB=true". Prod e pe USE_REAL_DB=true → **nu crapă în prod**. Doar dev/demo. De fixat pt. robustețe.
- **Fix:** gardă `if (!HAS_SUPABASE) return getMockPlatformaData()`.

---

## PRIORITATE 2 — MEDIU
- **F-09** rate limit lipsă pe `/api/v1/contact` → adaugă `checkRateLimit`.
- **F-11** rate limit se incrementează la cereri invalide → validează ÎNAINTE de rate limit.
- **F-13** HTTP 500 când lipsește RESEND_API_KEY → gestionare elegantă (503 + skip în dev).
- **F-14** `/contact` validează manual, nu Zod → creează `submitContactSchema`.
- **F-15** mesaj eroare dezvăluie formatul cheii API → mesaj generic.
- **F-20** lipsesc headere CSP → adaugă Content-Security-Policy în `proxy.ts`.
- Rate limiting pe Redis (Upstash) pentru scalare orizontală.

## PRIORITATE 3 — SCĂZUT / finisaje
- **F-16** `themeColor` → mută în export `viewport` (warning Next 16).
- **F-17/F-18** tabel `api_keys` + GDPR real (= F-02 + F-03).
- **F-19** bucket-uri în migrări (= F-12).
- Blog `dangerouslySetInnerHTML` → DOMPurify.
- Rotație trimestrială cheie service role.
- TOTP/confirmare email la operațiuni sensibile.
- Coadă background (BullMQ) pentru cron la >100 rapoarte/min.

---

## Ce a confirmat auditul ca SOLID ✅
Arhitectură, magic links anti-phishing (POST-only), RLS multi-tenant, audit log imutabil, EXIF strip, honeypot, rate limit pe /leads + /family-inquiries, auth cron, cookie-uri sesiune, CI/CD, infrastructură EU (Frankfurt), performanță (Turbopack/ISR).

## Plan de atac recomandat (pe grupuri, Cătălin verifică după fiecare)
1. **P0 azi:** F-04 (1 linie) + F-08 (npm) întâi (rapide). Apoi F-01 (auth — cel mai important). Apoi F-03 (dezactivează rutele GDPR) + F-02 (dezactivează /api/v1/residents SAU tabel api_keys).
2. **P1:** F-06, F-07, F-12, F-05.
3. **P2/P3:** iterativ.

**Nuanță importantă de comunicat lui Cătălin:** F-12 și F-05 funcționează în prod (USE_REAL_DB=true + bucket-uri provizionate manual); sunt probleme de reproductibilitate/dev, le fixăm pentru corectitudine. F-01, F-02, F-03 sunt reale în prod — alea-s prioritatea reală.
