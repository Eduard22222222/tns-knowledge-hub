---
name: project-fox-saga-redeem
description: "FOX × SAGA Festival — platformă de redeem bilete nominale, proposal €1.400, cod/spec în fox-saga-redeem/"
metadata: 
  node_type: memory
  type: project
  originSessionId: 2768c176-6766-4f87-9f68-9fc39fe49127
---

Al doilea proiect FOX (după trainingul AI, vezi [[project-fox-ai-training]]): platformă prin care
câștigătorii concursului FOX își revendică biletele nominale la SAGA Festival. **SAGA emite
biletele** — noi facem doar interfața de redeem (magic link semnat single-use → OTP pe email →
formular date → export pentru SAGA → livrare bilet pe email). ~10 câștigători estimați, deci
scope tăiat față de spec-ul inițial: FĂRĂ SMS/SMSO, FĂRĂ Upstash/QStash, FĂRĂ generare PDF/QR.
Stack: Next.js 14 + Vercel + Supabase EU dedicat, criptare CNP la nivel de aplicație (libsodium,
NU pgsodium — deprecat) + cnp_hash HMAC pentru dedup.

Ofertă: **€1.400** preț unic (dezvoltare + găzduire + operare pe campanie), 50% avans, livrare
7–10 zile lucrătoare. Proposal PDF (2026-07-03, ref TNS-FOX-2026-002) + spec v2 pentru agent în
`fox-saga-redeem/` (SPEC.md, build_fox_saga_proposal.py, TNS_Proposal_FOX_SAGA_Redeem.pdf).

**CONTRACT SEMNAT (2026-07-10)** — build în curs. Preț final **1.400 EUR fără TVA** (TNS neplătitor),
50% avans / 50% livrare, ref TNS-FOX-CONTRACT-002. Contract + Anexa 1 (spec) + Anexa 2 (DPA) pe
formatul TNS auriu HTML→PDF (Playwright), în fox-saga-redeem/TNS_Contract_FOX_SAGA.html/.pdf.
FOX = FOX COM SERV S.R.L., CUI RO3750511, J1992001306409.

**Fluxul final confirmat:** biletele NU sunt nominale. CNP colectat prin formular pentru declarația
fiscală a FOX (temei = obligație legală). Câștigătorul: magic link (concursurifox.ro) → Turnstile →
OTP email → formular CNP → primește automat un bilet din STOCUL dat de SAGA. ~250 câștigători.
Două interfețe: (A) operare/handover, (B) dashboard sales cu tracking pe semnale CERTE (livrat+bounce
via Resend webhook + confirmare click), NU pe "opens" (nefiabil). Gestiune stoc = atribuire atomică,
fără dublă-emitere, alertă la epuizare. DPO extern implicat (250 CNP → cerut de L.190/2018).

Stack: Next.js 14 + Vercel + Supabase EU dedicat + Resend + Cloudflare Turnstile + jose (magic links).
Criptare CNP la nivel de aplicație (libsodium) + cnp_hash HMAC dedup. NU pgsodium, NU SMS, NU Upstash/QStash.
Spec complet în fox-saga-redeem/SPEC.md. Vezi [[skill-auth-live-verification]] + [[skill_security_hardening]].

De confirmat de la FOX pe parcurs: formatul stocului de bilete (PDF-uri/coduri), termenul campaniei.

**FLUXURI VERIFICATE LIVE pe TNS (2026-07-12):** fluxul câștigătorului merge cap-coadă pe UI real +
server actions + DB TNS: magic link → Turnstile (bypass când nu-i secret Cloudflare, fix în
turnstile.ts) → OTP email (dry-run: cheia Resend placeholder → codul se logează, testabil) → verify →
formular CNP → criptare AES-256-GCM + cnp_hash dedup → assign_ticket RPC (atomic) → livrare (dry-run) →
success + magic link consumat. Test integrare 11/11 (scripts/flow-test.mjs). Admin login + dashboard OK
pe TNS. Design: fundal VIDEO (Mixkit festival loop 708KB, public/saga/bg.mp4, fără overlay roșu) +
co-brand FOX(logo real)×SAGA(logo decupat din afiș 2026) + font Clash Display bold (Fontshare) + Satoshi.
Dev tools: scripts/mint-link.mjs (link test), flow-test.mjs, provision.py (migrații/seed via PAT),
seed.mjs. Webhook Resend + Turnstile: **COD COMPLET + testat** (nu mai e de scris). Resend tracking:
emailuri cu tag-uri (winner_id+kind), link „Am primit biletul" în emailul cu biletul →
/confirm/[token] (semnal CERT → status confirmed, testat: winner+ticket→confirmed), webhook
/api/webhooks/resend (verificare semnătură Svix manual + anti-replay 5min → bounce/complaint →
to_contact; testat: 200 sig-ok, 401 sig-greșită, 400 timestamp-vechi). Turnstile: bypass când
n-are secret + cale reală când e setat (client widget se încarcă la siteKey). RĂMAS = DOAR chei
externe de lipit (nu cod): RESEND_API_KEY + RESEND_WEBHOOK_SECRET (din Resend, la adăugarea
webhook-ului pe <deploy>/api/webhooks/resend) + verificare domeniu concursurifox.ro (DNS SPF/DKIM);
NEXT_PUBLIC_TURNSTILE_SITE_KEY + TURNSTILE_SECRET_KEY (Cloudflare). **RESEND (2026-07-12, via claude-in-chrome pe contul TNS office@thenichesociety.ro):** creat API key
„fox-saga-platform" (Full access) → scris în .env.local (RESEND_API_KEY, prefix re_Wsv…, validat GET
/domains HTTP 200). RĂMAS pe Resend: (1) domeniu concursurifox.ro NU e adăugat (0 domenii pe cont) →
trimiterea reală din @concursurifox.ro eșuează până e cumpărat + DNS SPF/DKIM + verificat; pt test se
poate EMAIL_FROM=onboarding@resend.dev (doar către office@thenichesociety.ro). (2) webhook Resend =
după deploy (are nevoie de URL public https://<deploy>/api/webhooks/resend → apoi RESEND_WEBHOOK_SECRET).
**TURNSTILE: GATA (2026-07-13)** — widget „fox-saga" (Managed) pe contul Cloudflare
office@thenichesociety.ro, hostname-uri localhost + concursurifox.ro (+ de adăugat fox-saga.netlify.app).
Site+secret key în .env.local + pe Netlify env; secret validat la siteverify.

**DEPLOY LIVE (2026-07-13): https://fox-saga.netlify.app** — pe Netlify contul PERSONAL Eduard
(edumitriu04@gmail.com), IZOLAT de ComfortMap. De ce Netlify nu Vercel: Vercel are o singură echipă
(family-link) cu 3 owneri (catalin.vreme@umsoft.ro, maryloumihaic — oamenii ComfortMap) → ar vedea FOX;
echipă Vercel nouă cere card (payment_method_required). Netlify personal = gratuit + izolat.
Build Windows local a picat (path-uri Windows în bundle pe Linux) → soluție: **build pe Linux via GitHub
Actions** (repo privat github.com/Eduard22222222/fox-saga-redeem, workflow .github/workflows/deploy.yml,
secrete NETLIFY_AUTH_TOKEN+NETLIFY_SITE_ID, `npm install`+node22+`netlify deploy --build --prod`). Push pe
master → redeploy automat. Netlify site id 15f189b7-c2a6-4825-a99b-1d204eea3607. Env vars setate pe site.
**WEBHOOK RESEND: GATA + testat LIVE (2026-07-13)** — creat prin API Resend (POST /webhooks, câmp
`endpoint` nu endpoint_url; events bounced/complained/delivered/delivery_delayed), signing_secret luat
din răspuns → RESEND_WEBHOOK_SECRET în .env.local + Netlify env → redeploy. Testat pe URL-ul live:
sig-ok→200+to_contact, sig-greșită→401, fără-sig→400. Token Vercel temp — REVOCAT.

**TURNSTILE hostname: GATA** — fox-saga.netlify.app adăugat la widget (3 hostname-uri: localhost,
concursurifox.ro, fox-saga.netlify.app). CF s-a dezghețat, tastare reală (type) a mers.

**DOMENIU concursurifox.ro: aproape gata (2026-07-13)** — E ÎNREGISTRAT (ROTLD, azi, expiră 2027-07-13,
registrar ICI). Creat **zonă DNS pe Netlify** (id 6a55644c5e4de4b486192814, ns dns1-4.p01.nsone.net) cu
cele 3 înregistrări Resend (DKIM TXT resend._domainkey + SPF MX send + SPF TXT send). Setat nameserverele
Netlify în ROTLD („Servere de nume" → Actualizează). **ROTLD cere CONFIRMARE PE EMAIL** (office@thenichesociety.ro)
→ user apasă link-ul din email = activează delegarea. Apoi propagă → verific domeniul în Resend prin API
(POST /domains/{id}/verify) → emailuri reale din @concursurifox.ro.
RĂMAS: doar (1) user apasă link confirmare ROTLD din inbox; apoi (2) eu verific Resend + test email live.
NS classifier a blocat prima oară schimbarea NS (delegare globală) — a mers după confirmarea explicită a userului.

**BUILD STATUS (2026-07-10):** Next.js 15 + App Router. Proiect Supabase dedicat `fox-saga`
(ref ysvhglutllttfamqjfjd, eu-central-1), schema aplicată (7 tabele, RLS 100%). Construit:
tot fluxul de redeem (magic link → Turnstile → OTP email → formular CNP → atribuire bilet din
stoc via assign_ticket() FOR UPDATE SKIP LOCKED) + **dashboard admin complet** (login Supabase
Auth + middleware, panou stats, import câștigători CSV, generare/trimitere magic links, import
stoc bilete, tracking pe semnale certe, export fiscal CSV cu decriptare logată, coadă flag/aprobare).
Libs: crypto (AES-256-GCM field + HMAC dedup), cnp checksum, jose magic links, email Resend (dry-run
dacă nu e cheie). tsc CURAT, paginile randează 200. Cod în fox-saga-redeem/, dev pe portul 3400
(config `fox-saga` în launch.json global).

**BLOCANT testare live (de la user):** (1) SUPABASE_SERVICE_ROLE_KEY încă placeholder în .env.local
→ fără el, server actions (writes) nu merg. (2) RESEND_API_KEY + verificare domeniu concursurifox.ro
placeholder (emailurile merg dry-run în consolă până atunci). (3) Cloudflare Turnstile: user n-are
acces încă (site/secret keys sunt de test). Odată pus service-role: `npm run seed` creează admin
(office@thenichesociety.ro / FoxSaga2026!) + câștigători + 10 bilete de test → walk live.

**SEEDED via MCP SQL (2026-07-10):** MCP-ul Supabase NU expune service-role secret (doar
publishable/anon — get_publishable_keys). Deci am semănat direct prin execute_sql: user admin
office@thenichesociety.ro / FoxSaga2026! (creat în auth.users cu extensions.crypt bcrypt +
auth.identities), rând în admins, 3 câștigători (unul = edumitriu04@gmail.com) + 10 bilete
SAGA-TEST-0001..10. VERIFICAT: login GoTrue OK, citiri RLS admin OK (is_admin), anon deny curat.
Fix migrație 0003: grant execute on is_admin() to anon,authenticated (altfel anon primea
„permission denied for function is_admin" în loc de deny curat). Login + citirile dashboard merg
FĂRĂ service-role (pe anon key). DOAR write-actions (import/trimitere/export) au nevoie de service-role
în .env.local — user trebuie să-l lipească din dashboard (Settings→API→service_role).

**CORECȚIE CONT (2026-07-10):** proiectul trebuia pe contul **TNS**, nu pe personal. Am creat
inițial GREȘIT pe personal (ysvhglutllttfamqjfjd, „Eduard Dumitriu Org"). RECREAT corect pe contul
TNS, org **„The Niche Society"** → ref **hcwtmmchdubriybfrbef** (https://hcwtmmchdubriybfrbef.supabase.co).
Migrații 0001-0003 + seed reaplicate, `.env.local` repointat cu anon+service_role (luate via
Management API cu PAT-ul TNS). Login/RLS/service-role verificate live OK. Proiectul personal greșit
(ysvhglutllttfamqjfjd) = DE ȘTERS (pending confirmare user).
PAT-ul TNS + toate refs sunt în [[reference-keys-folder]] (C:\\Users\\adumi\\.claude\\keys\\supabase.md).
REGULĂ: proiectele de client se creează pe contul TNS via PAT (Management API), NU pe MCP/CLI-ul
default care sunt pe contul personal.

**SUPABASE LIVE (2026-07-10):** proiect dedicat **fox-saga**, ref `ysvhglutllttfamqjfjd`, org "Eduard Dumitriu Org"
(hvtdecfwdjtzcezcrmtb), regiune eu-central-1 Frankfurt, +10$/lună (user a aprobat explicit). URL
https://ysvhglutllttfamqjfjd.supabase.co. Schema 0001 + hardening 0002 aplicate; 7 tabele, RLS 100%.
get_advisors(security) rulat + curățat: fixat search_path pe 5 funcții, `assign_ticket` revocat de la
anon/authenticated (doar service_role) — era RPC public exploatabil. Reziduuri OK: magic_links/otp_codes
RLS-fără-policy (deny-all voit) + is_admin executabil de authenticated (necesar RLS). .env.local scris
(gitignored) cu URL+anon+secrete criptare generate local+Turnstile TEST keys. DE PUS de user în .env.local:
SUPABASE_SERVICE_ROLE_KEY (ținut intenționat în afara transcriptului) + RESEND_API_KEY.

**FRONTEND + FLUX (2026-07-10):** design system FOX gata (Tailwind: fox-red #E2001A, gold #F2C14E, ink;
Inter+Poppins; hero gradient roșu→ink + sparkle) + componente: FoxLogo (wordmark placeholder până la logo
oficial FOX), Turnstile (client, cu mod demo), RedeemFlow (flux complet: welcome→OTP→formular CNP→succes,
mobile-first, copy RO), Notice (stări link invalid/expirat/folosit). Server actions complete în
src/app/redeem/[token]/actions.ts (requestOtp/resendOtp/verifyOtp/submitRedemption cu Turnstile+OTP+dedup
+criptare+assign_ticket+email). Email lib cu mod DRY-RUN cât n-avem cheia Resend. Pagini: / (landing),
/redeem/[token] (real, are nevoie de service_role la runtime), /preview (demo vizual cu mock, fără DB).
Rulează pe **localhost:3400** (config în workspace .claude/launch.json name "fox-saga", cwd fox-saga-redeem,
Next dev 3400). VERIFICAT: tsc+build verzi, flux welcome→OTP merge, buton #E2001A, Inter ok. Tool-ul de
screenshot dă timeout în mediul ăsta (verificat prin snapshot/inspect/click în schimb). URMEAZĂ: wire DB real
(user pune service_role), dashboard admin+tracking, seed test tickets, logo real FOX. Warning benign: multiple
lockfiles (C:\Users\adumi\package-lock.json) — de setat outputFileTracingRoot cândva.

**BUILD STATE (2026-07-10):** app scaffold-uit în fox-saga-redeem/ (docurile de business mutate în _docs/).
Decizie: pornit pe **Next 15 + React 19** (nu 14 — 14.2.35 avea 4 CVE high neportate; upgrade la zero cost
că n-aveam cod). Fundație gata + tsc/build verzi: schema DB (supabase/migrations/0001_init.sql — winners,
magic_links, otp_codes, redemptions, tickets-pool, audit_log append-only, admins; RLS peste tot; funcție
assign_ticket cu FOR UPDATE SKIP LOCKED pt atribuire atomică), lib/crypto.ts (AES-256-GCM field-level +
HMAC dedup), lib/cnp.ts (validare cifra control), lib/magic-link.ts (jose HS256), lib/supabase/{admin,server}.ts,
lib/audit.ts, lib/turnstile.ts, .env.example complet. URMEAZĂ: flux redeem (token→Turnstile→OTP→formular),
livrare bilet+Resend, dashboard admin+tracking. BLOCAT pe: proiect Supabase EU dedicat + chei (Resend/Turnstile)
+ brand assets FOX (pt skin UI). git init făcut de scaffold; NU comis manual încă.
