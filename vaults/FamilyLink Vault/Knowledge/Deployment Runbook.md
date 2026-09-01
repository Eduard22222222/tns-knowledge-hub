# FamilyLink — Deployment Runbook

**Created**: 2026-05-13
**Status**: Faza 1 cod-complete, awaiting DNS + Vercel deploy
**Build**: passing (TS clean, lint clean, 14/14 marketing pages 200 OK)

---

## 🎯 Pre-deployment checklist

### ✅ Code & infrastructure complete

- [x] Marketing site (`/`, `/pentru-camine`, `/pentru-familii`, `/cum-functioneaza`, `/tarife`, `/despre`, `/contact`, `/intrebari-frecvente`, `/blog`) — Cerasela's copy fully applied
- [x] Legal pages (`/legal/confidentialitate`, `/legal/termeni`, `/legal/cookies`, `/legal/anspdcp`) — drafts, need legal review
- [x] Lead funnel B2B (`/pentru-camine` form → `/api/v1/leads` → super-admin `/platforma/leads`)
- [x] Family inquiry funnel B2C (`/pentru-familii` form → `/api/v1/family-inquiries` → super-admin `/platforma/leads` filtered)
- [x] Super-admin dashboard cu accept/reject/contact/qualify actions + magic link auto pe accept
- [x] Onboarding fix: `/platforma/camine/nou` cu auto-invite admin (parity cu accept-lead)
- [x] Weekly reports: cron LUNI 05:00 UTC (07:00 RO), PDF cu @react-pdf/renderer, Supabase Storage `reports/` bucket, persist DB, email via Resend, idempotent
- [x] Resend wiring: API key în `.env.local`, send.ts cu Resend + mock fallback graceful
- [x] Supabase Storage: `reports` și `resident-photos` buckets create (private, PDF/image, size limits)
- [x] Migrations applied: 0001 (initial), 0002 (seed), 0003 (leads), 0004 (family inquiries)

### ⏳ Pending USER actions

#### 1. DNS records pentru `mail.familylink.ro` (Resend sending)

Trei records de adăugat în zona DNS a `familylink.ro`:

| Type | Host | Value | Priority |
|------|------|-------|----------|
| TXT | `resend._domainkey.mail` | `p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDUVftppHC192R6b3GXN/c30/n9lpneFYZIcRhyl17J0XiSwArwkITmhXR8yvMO2Sj2kkJu6Rq9nJtt8M0dpZ2RAsi1TDOUvXMuXRWIazj9pbfc5S+BIpkuNrFfUQRlmEc+plrswUYWf5a4SzcEpQHXxU7TVmUsBmomSr0Era7V9wIDAQAB` | — |
| MX | `send.mail` | `feedback-smtp.eu-west-1.amazonses.com` | 10 |
| TXT | `send.mail` | `v=spf1 include:amazonses.com ~all` | — |

**Status:** `familylink.ro` înregistrat 2026-04-22 prin ROTLD/ICI, fără nameservers configurați.

**Decision needed:** ROTLD direct vs Cloudflare delegation.

##### Option A — ROTLD direct DNS
1. Login: `https://www.rotld.ro/domadmin/` → familylink.ro + parolă + CAPTCHA + termeni
2. Menu **Servere de nume** → configurăm primele nameservers ROTLD-native pentru `familylink.ro` (sau alternativ)
3. Adăugăm cele 3 records (UI ROTLD permite TXT/MX direct)

##### Option B — Cloudflare delegation (recomandat)
1. Cont Cloudflare → Add Site `familylink.ro` → Free plan
2. Cloudflare → DNS records → adăugăm 3 records mai sus (UI mult mai bun)
3. Cloudflare îți dă 2 nameservers (ex: `kate.ns.cloudflare.com`, `mac.ns.cloudflare.com`)
4. Login ROTLD → Servere de nume → schimbi NS-urile la cele Cloudflare
5. După propagation (5min-24h) → click **Verify** în Resend dashboard pe `mail.familylink.ro`

**Verificare succes:**
- `nslookup -type=TXT resend._domainkey.mail.familylink.ro` returnează DKIM value
- Resend dashboard → `mail.familylink.ro` → status: `verified`

---

#### 2. Vercel production deploy

**Pre-requisite:** GitHub repo cu codul (push initial).

**Pași:**
1. Push code la GitHub: `gh repo create familylink-app --private --source . --push`
2. Vercel: New Project → Import GitHub repo → familylink-app
3. **Framework Preset:** Next.js
4. **Root Directory:** `./` (default)
5. **Build Command:** `npm run build` (default)
6. **Output Directory:** `.next` (default)
7. **Install Command:** `npm install`
8. **Node.js Version:** 20.x

**Environment variables** (copy din `.env.local`):

```bash
# Required
USE_REAL_DB=true
NEXT_PUBLIC_APP_URL=https://familylink.ro
NEXT_PUBLIC_SUPABASE_URL=https://vvyknkizsxkfcdhprfcf.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGc...   # din .env.local
SUPABASE_SERVICE_ROLE_KEY=eyJhbGc...        # din .env.local
SUPABASE_PROJECT_REF=vvyknkizsxkfcdhprfcf
CRON_SECRET=fl_cron_prod_<generate-32-char-random>

# Resend
RESEND_API_KEY=re_in5QiCTQ...              # din .env.local
RESEND_FROM="FamilyLink <noreply@mail.familylink.ro>"
RESEND_REPLY_TO=contact@familylink.ro
```

**⚠️ Rotează `CRON_SECRET` pentru production** — nu folosi cel din dev.

**Deploy:**
- Initial deploy: `vercel deploy --prod` sau prin Vercel dashboard
- Build time: ~30-60 sec
- Functions deployed: 21 route handlers + 1 cron (LUNI 05:00 UTC)

---

#### 3. Domain DNS pentru `familylink.ro` apex (după Vercel deploy)

După ce Vercel îți dă production URL (ex: `familylink-app-xyz.vercel.app`):

**Cloudflare DNS** (dacă ai mers pe Option B mai sus):
| Type | Host | Value | Proxy |
|------|------|-------|-------|
| A | `@` (apex) | `76.76.21.21` (Vercel IP) | DNS only |
| CNAME | `www` | `cname.vercel-dns.com` | DNS only |

**Vercel Domain Settings:**
1. Project → Settings → Domains → Add: `familylink.ro` + `www.familylink.ro`
2. Vercel îți va spune să adaugi records la DNS (mai sus)
3. După propagation → SSL auto-emis (Let's Encrypt) → live

---

## 🔥 Smoke tests post-deploy

```bash
# Site live
curl -sI https://familylink.ro | head -1
# = 200 OK

# Lead form public
curl -X POST https://familylink.ro/api/v1/leads \
  -H "Content-Type: application/json" \
  -d '{"caminName":"Test","adminEmail":"test@example.com"}'
# = 200 { ok: true, leadId: "..." }

# Family inquiry public
curl -X POST https://familylink.ro/api/v1/family-inquiries \
  -H "Content-Type: application/json" \
  -d '{"familyName":"Test","email":"test@example.com","phone":"+40712345678","judet":"Cluj"}'
# = 200 { ok: true, leadId: "..." }

# Cron manual trigger (după deploy, cu CRON_SECRET production)
curl -X POST https://familylink.ro/api/cron/weekly-reports \
  -H "Authorization: Bearer $CRON_SECRET_PROD"
# = 200 { ok: true, generated: X, sent: Y }
```

---

## 📊 Faza 1 — Final status

| Domeniu | Status | Note |
|---------|--------|------|
| Codebase (Next.js 16 + Supabase + Resend + PDF) | ✅ Production-ready | `npm run build` passes, TS clean, lint clean |
| Marketing site (14 pagini, copy Cerasela) | ✅ Live local | port la `https://familylink.ro` necesită Vercel deploy |
| Lead funnel B2B + B2C | ✅ End-to-end | API + dashboard + accept flow funcționale |
| Super-admin dashboard `/platforma/leads` | ✅ Live | list + detail + accept + magic link auto |
| Weekly reports automation | ✅ Cron + PDF + Storage + Email | LUNI 05:00 UTC = 07:00 RO |
| Onboarding cămin manual (`/platforma/camine/nou`) | ✅ Cu auto-invite admin | parity cu accept-lead |
| Magic link auth (Supabase) | ✅ End-to-end | callback PKCE wired |
| Email send (Resend) | ⏳ DNS pending | fallback graceful la mock până DNS verified |
| Production deploy (Vercel) | ⏳ User action | GitHub push + Vercel project + env vars + domain |
| Mobile apps iOS/Android | ❌ Faza 3 (2027+) | nu în scope Faza 1 |

---

## 🎬 Order of operations recomandat

1. **NOW**: User → Cloudflare signup + Add site `familylink.ro` + copy nameservers
2. **NOW**: User → ROTLD `Servere de nume` → schimbă NS la cele Cloudflare
3. **WAIT 5-30 min**: DNS propagation
4. **THEN**: Eduard / claude → Cloudflare DNS → adaugă cele 3 Resend records (DKIM + SPF MX + SPF TXT)
5. **WAIT 5 min**: DKIM/SPF propagation
6. **THEN**: Resend dashboard → click **Verify** pe `mail.familylink.ro` → status: verified
7. **TEST**: trimite test email cu `from: noreply@mail.familylink.ro` la `test@inbox.lavinia.ro` (exemplu) — verifică inbox
8. **THEN**: GitHub repo + Vercel deploy + env vars
9. **THEN**: Cloudflare DNS → add A record `@` → Vercel IP
10. **THEN**: Vercel project → Domains → add `familylink.ro` + `www`
11. **WAIT 5 min**: SSL emisă
12. **VERIFY**: `https://familylink.ro` → 200 + site live
13. **ANNOUNCE**: trimite prima demo la cămine pilot 🎉

---

## Contact pentru blocaje

- Cod: Eduard (Conta 4U / TNS)
- DNS / domenii: Cerasela / Mary-Lou (Realitatea Socială)
- Resend account: office.the.niche.society@gmail.com
- Supabase project: `vvyknkizsxkfcdhprfcf` (FamilyLink Prod, Frankfurt eu-central-1)
