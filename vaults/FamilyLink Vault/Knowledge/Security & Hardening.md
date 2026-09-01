# Security & Hardening — ComfortMap

> Snapshot din auditul IT 2026-05-28. Verifică `pg_tables` / `curl -sI` / `npm audit` înainte de a cita ca fapt — codul evoluează.

## Postură de securitate (stare la 2026-05-28)

| Categorie | Status | Detaliu |
|---|---|---|
| HTTPS + HSTS | ✅ | redirect 308, `max-age=63072000; includeSubDomains; preload` |
| Headers | ✅ | `X-Frame-Options: DENY`, `X-Content-Type-Options: nosniff` pe `/api/*` (vercel.json) |
| RLS coverage | ✅ | 21/21 tabele publice cu RLS activ |
| SECURITY DEFINER helpers | ✅ | `has_tenant_access`, `is_tenant_manager`, `is_super_admin`, `is_assigned_to_resident`, `is_family_of_resident`, `is_family_member_of`, `rls_auto_enable` (anti-recursion R4) |
| Storage | ✅ | buckets `reports` + `resident-photos` PRIVATE, signed URLs 7 zile |
| Email auth | ✅ | SPF + DKIM + DMARC, mail-tester 10/10, List-Unsubscribe RFC 8058 |
| Secrets | ✅ | `.env*` gitignored, 0 secrete în repo |
| Integritate DB | ✅ | 0 rânduri orfane (residents/families/journal/access) |
| npm audit | ⚠️ | Next.js minor bump pentru patch-uri de securitate (`npm audit fix --force` → 16.2.6) |
| DMARC policy | ⚠️ minor | `p=none` (warm-up); tighten la `quarantine`→`reject` după ~4 săpt. |

## Cloudflare — NU îl folosim, și e ok

DNS-ul e pe **Vercel** (nu Cloudflare). Vercel Pro acoperă nativ ce-ar aduce Cloudflare la scale-ul nostru:
- DDoS L3/4 + L7 (Attack Challenge Mode), Vercel Firewall (WAF), BotID (bot detection), rate-limit via Edge Middleware, geo-block.

Cloudflare ar merita doar la trafic foarte mare (>1M req/zi) sau geo-fencing strict. Acum adaugă doar complexitate (al doilea CDN hop + migrare DNS). **Decizie: rămânem pe Vercel-native.** De activat în dashboard când e nevoie: Vercel Firewall ON + BotID ON.

## Brute-force pe /login — 3 layere

1. **Supabase auth rate-limit (default ON):** 5 fail/5min/IP la parolă, 30/oră/email, 30/oră/IP magic link. Cel mai important, gratis, automat.
2. **App-level (de adăugat dacă vrem):** counter IP+email pe Server Action `/login`, lockout 15 min după 5 fail.
3. **Vercel Firewall:** block IP-uri >100 req/min pe `/auth/*` + known bot networks.

## Magic link 24h (decizie 2026-05-28)

Expirarea e **globală** în Supabase (`MAILER_OTP_EXP`) — nu se poate per-link. Decizie: **24h pentru toți** (login, invite, recovery), nu sistem de token custom.

**De făcut în Supabase Dashboard** (NU se poate din cod fără PAT de management):
→ Authentication → Emails → **"Email OTP Expiration"** → `86400` (= 24h, maximul permis).

Codul (email copy „24 de ore") e deja actualizat în: `magic-link.service.ts` (HTML + text), `login-form.tsx`, `platforma/camine/[id]/magic-link-button.tsx`.

⚠️ Dacă setarea NU e schimbată în dashboard, linkul tot expiră în 1h iar emailul minte „24h".

## Backups (răspuns pentru auditor)

Supabase **are** backups — auditorul greșește dacă spune că nu.
- **Database → Backups:** backup zilnic automat, 7 zile rolling (pe Pro).
- **PITR** (Point-in-Time Recovery): add-on plătit, 7/14/28 zile, restore la secundă.
- **Manual:** `supabase db dump` oricând.
- Free tier = fără backup automat → dacă proiectul e Free și vrem DR, upgrade la Pro ($25/lună).

## Editare date cămin (sprint R, 2026-05-28)

- **Admin cămin** (`/caminul/setari`): editează nume cămin, email, telefon, adresă, cod poștal. Gate `camin_admin`/`super_admin`. Fix bug multi-rol (`requireStaffSession` în loc de `access[0]`).
- **Super-admin** (`/platforma/camine/[id]`): editează TOATE câmpurile (+ denumire legală, CUI, tier). `updateTenantDetailsAction`, gate `super_admin`.

## Bug pattern recurent — multi-rol

`session.access[0]?.tenantId` = bug la useri cu roluri multiple (ex: Cerasela = family_owner + camin_admin pe Cajal). Fix: `requireStaffSession` / `pickHighestAccess` / `requireTenantContext`. La orice Server Action nou care scrie date tenant-scoped → grep `access[0]` + gate rol explicit (UI care ascunde formularul NU e suficient — staff poate face POST).
