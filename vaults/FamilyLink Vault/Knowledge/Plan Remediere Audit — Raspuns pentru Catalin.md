# Plan de Remediere — Răspuns la Auditul de Securitate (29.05.2026)

> Document pentru discuția cu Cătălin. Pentru fiecare finding: ce e, de ce se întâmplă, impact, fix concret, efort. Confirmăm că am înțeles fiecare punct și avem plan clar. Arhitectura e validă — majoritatea fix-urilor sunt mici și chirurgicale.

**Verificat în cod de echipă (29.05):** F-01 și F-02 confirmate reale în prod. F-05 și F-12 funcționează în prod (sunt probleme de mediu nou/dev). Detalii la fiecare.

---

# PRIORITATE 0 — BLOCKER

## F-01 🔴 Bypass autentificare `requireSession()`

**Ce e:** Funcția care întoarce sesiunea curentă încearcă auth Supabase, dar dacă nu găsește user autentificat **nu refuză** — cade pe un user mock hardcodat (`user_mariana`, rol camin_admin), rămas din scaffolding-ul de development.

**De ce se întâmplă:** Pattern de dev („ca paginile să meargă fără login în development") care nu a fost închis pentru producție. Ramura `if (authUser)` întoarce user real, dar lipsește `else throw` — execuția cade prin la fallback-ul mock.

**Impact:** O cerere fără sesiune validă către un **Server Action** sau o **rută API** primește drepturi de admin de cămin. Paginile sunt protejate de middleware (redirect /login), dar Server Actions + API nu trec prin acel redirect. Expune date sensibile (note medicale, foto vârstnici).

**Fix (concret, `src/lib/services/auth.service.ts`):**
```ts
if (ENABLE_SUPABASE_AUTH) {
  const supabase = await createClient();
  const { data: { user: authUser } } = await supabase.auth.getUser();
  if (!authUser) throw new UnauthorizedError("Autentificare necesară.");

  const admin = createAdminClient();
  const { data: userRow } = await admin.from("users")
    .select("*").eq("id", authUser.id).single();
  if (!userRow) throw new UnauthorizedError("Cont inexistent.");

  const { data: accessRows } = await admin.from("user_tenant_access")
    .select("*").eq("user_id", authUser.id)
    .is("revoked_at", null).not("accepted_at", "is", null)
    .order("accepted_at", { ascending: false });
  return { user: mapSupabaseUser(userRow), access: (accessRows ?? []).map(mapSupabaseAccess), source: "supabase" };
}
// Fallback mock DOAR în dev (ENABLE_SUPABASE_AUTH === false)
const userId = mockUserId ?? "user_mariana";
// ...
```
Cheia: scoatem `try/catch`-ul care înghite eroarea și cade pe mock. În prod, lipsa sesiunii = 401 (paginile deja prind `UnauthorizedError` → redirect /login, implementat la task D.2).

**Efort:** Mic (~10 linii). **Închide automat și F-10** (transcribe fără auth).

---

## F-02 🔴 Bypass cheie API `/api/v1/residents`

**Ce e:** `verifyApiKey()` acceptă orice token care începe cu `fl_live_`, fără să verifice în baza de date. Mapează la primul tenant activ din mock.

**De ce:** Stub de Faza 2 (API public) — comentariul din cod descrie intenția reală, dar implementarea DB lipsește. Nu există tabel `api_keys` în migrări.

**Impact:** Oricine cu `fl_live_orice` citește datele rezidenților oricărui cămin (nume, dată naștere, cameră).

**Fix — 2 opțiuni:**
- **A (rapid, recomandat acum):** dezactivăm ruta `/api/v1/residents` (returnează 404/501) până la Faza 2 când chiar lansăm API-ul public. Riscul dispare instant, zero clienți afectați (nu e folosită încă).
- **B (complet, pentru Faza 2):** migrare `api_keys` (key_hash SHA-256, tenant_id, scopes, revoked_at) + verificare reală:
```ts
const keyHash = createHash("sha256").update(token).digest("hex");
const { data: keyRow } = await admin.from("api_keys")
  .select("tenant_id, scopes, revoked_at").eq("key_hash", keyHash).single();
if (!keyRow || keyRow.revoked_at) return resp401("INVALID_API_KEY");
// leagă la keyRow.tenant_id → închide și F-07 (cross-tenant)
```

**Efort:** A = mic. B = mediu. **B închide și F-07 + F-15 + F-17.**

---

## F-03 🔴 Endpoint-uri GDPR fără auth + mock

**Ce e:** `/api/v1/gdpr/export` și `/api/v1/gdpr/delete` nu verifică autentificarea ȘI citesc doar din mock-uri.

**Impact:** Oricine știe un `familyId` exportă sau șterge date. Expunere juridică directă (GDPR Art. 15 acces + Art. 17 ștergere).

**Fix — 2 opțiuni:**
- **A (rapid):** dezactivăm rutele (501 „Not Implemented"). Cererile GDPR le tratăm manual pe gdpr@comfortmap.ro (cum scrie deja în FAQ + pagina ANSPDCP). Taie expunerea juridică imediat.
- **B (complet):** auth + verificare proprietar + implementare reală:
```ts
const { data: { user } } = await supabase.auth.getUser();
if (!user) return resp401();
const { data: family } = await admin.from("families").select("*").eq("id", familyId).single();
if (!family || family.owner_user_id !== user.id) return resp403();
// export/delete real din DB (cascade)
```

**Efort:** A = mic. B = mare. **Recomandare:** A acum (taie riscul), B în sprint dedicat cu firma DPO.

---

## F-04 🟠 `adminEmail` obligatoriu blochează 100% lead-urile

**Ce e:** Schema Zod a formularului B2B cere `adminEmail` obligatoriu, dar formularul public nu trimite acest câmp.

**Impact:** Fiecare lead legitim eșuează cu 400. Zero lead-uri B2B colectate.

**Fix (`src/lib/validation/schemas.ts`):**
```ts
adminEmail: z.string().trim().toLowerCase().email("Email invalid.")
  .optional().transform((v) => v || null),
```
**Efort:** 1 linie. (Probabil primul de bifat — instant + deblochează vânzările.)

---

## F-08 🟠 CVE-uri Next.js (7 HIGH)

**Ce e:** Next.js 16.2.4 are 7 vulnerabilități HIGH publice (bypass middleware, cache poisoning, SSRF, DoS, XSS). Una (GHSA-267c) se combină periculos cu F-01.

**Fix:** `npm audit fix --force` → Next.js ≥16.2.6, apoi `tsc` + test rapid + deploy. **Efort:** mic (~15 min cu verificare).

---

# PRIORITATE 1 — RIDICAT (înainte de lansare publică)

## F-06 🟠 Dezabonare fără token semnat
**Ce e:** `/api/unsubscribe?email=X&category=Y` fără verificare criptografică → oricine dezabonează pe oricine.
**Fix:** link semnat HMAC. La generare: `token = HMAC(email:category:ts, UNSUBSCRIBE_SECRET)`. La verificare: `timingSafeEqual`. **Efort:** mic-mediu.

## F-07 🟠 Date cross-tenant prin API
**Ce e:** cheia API ignoră `tenantSlug`, mapează la primul tenant. Un cămin vede datele altuia.
**Fix:** se rezolvă cu F-02 opțiunea B (cheia e legată de tenant-ul ei în DB). **Efort:** inclus în F-02-B.

## F-12 🟡 Bucket-uri Storage lipsă din migrări
**Ce e:** bucket-urile Storage nu-s declarate în migrări.
**Nuanță prod:** în **producția actuală EXISTĂ** (`reports` + `resident-photos`, provizionate manual; rapoartele se generează corect — verificat live). Problema e doar pe mediu nou / `supabase db reset` local.
**Fix:** migrare `0018_storage_buckets.sql` care creează bucket-urile (nume real: `reports`, nu `weekly-reports`). **Efort:** mic.

## F-05 🟠 Crash super-admin în mod mock
**Ce e:** `/platforma` apelează `createAdminClient()` fără gardă `HAS_SUPABASE` → 500 în mod mock.
**Nuanță prod:** în prod (`USE_REAL_DB=true`) **NU crapă** — auditul o confirmă. Doar dev/demo.
**Fix:** gardă `if (!HAS_SUPABASE) return getMockPlatformaData()`. **Efort:** mic.

---

# PRIORITATE 2 — MEDIU (sprint post-lansare)

| # | Finding | Fix | Efort |
|---|---|---|---|
| F-09 | Rate limit lipsă `/contact` | adaugă `checkRateLimit` (ca pe /leads) | mic |
| F-11 | Rate limit la cereri invalide | validează Zod ÎNAINTE de rate limit | mic |
| F-13 | 500 fără RESEND_API_KEY | gestionare elegantă (skip dev, 503 prod) | mic |
| F-14 | `/contact` fără Zod | creează `submitContactSchema` | mic |
| F-15 | mesaj eroare dezvăluie format cheie | mesaj generic „Invalid or missing API key" | mic |
| F-20 | lipsesc headere CSP | adaugă Content-Security-Policy în `proxy.ts` | mediu |
| — | rate limit pe Redis | Upstash pt. scalare orizontală | mediu |

---

# PRIORITATE 3 — SCĂZUT / finisaje

| # | Finding | Fix |
|---|---|---|
| F-16 | `themeColor` deprecat | mută în export `viewport` |
| F-17/18 | api_keys + GDPR real | = F-02-B + F-03-B |
| F-19 | bucket-uri în migrări | = F-12 |
| — | blog `dangerouslySetInnerHTML` | DOMPurify |
| — | rotație cheie service role | program trimestrial + runbook |
| — | operațiuni sensibile | TOTP/confirmare email |
| — | cron la scară | coadă BullMQ >100 rapoarte/min |

---

# Plan de execuție pe grupuri (Cătălin verifică după fiecare)

**Grup 1 — quick wins (azi, ~30 min):** F-04 (1 linie) + F-08 (npm). → deploy → Cătălin reverifică lead-uri + CVE.

**Grup 2 — auth (azi/mâine, critic):** F-01 (refuză cererile neautentificate) + F-02-A & F-03-A (dezactivăm rutele expuse). → deploy → Cătălin reverifică bypass auth + API + GDPR.

**Grup 3 — P1:** F-06 (token semnat) + F-05 (gardă mock) + F-12 (bucket migrare). F-07 se închide cu F-02-B.

**Grup 4 — P2:** rate limiting + Zod uniform + CSP + mesaje eroare.

**Grup 5 — P3:** finisaje + Faza 2 (api_keys real, GDPR real cu firma DPO).

---

## Mesaj de comunicat echipei
Arhitectura e solidă (RLS, magic links, audit log, EXIF, infrastructură EU — toate confirmate de audit). Problemele critice sunt **stub-uri mock** rămase din development, nu defecte de design — se înlocuiesc chirurgical. P0 le închidem rapid, restul iterativ pe priorități, cu reverificare după fiecare grup. Mulțumim lui Cătălin — exact genul de audit de care aveam nevoie înainte de cămine plătitoare.
