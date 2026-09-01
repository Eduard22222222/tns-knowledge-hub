# Skill: Web App Security Hardening (Vercel + Supabase + Next.js)

**Origin:** ComfortMap/FamilyLink session 2026-05-28 (IT audit prep + brute-force hardening question).
**Type:** reusable playbook. Apply when a client asks "are we secure / up to date / audit-ready", or when hardening a Vercel + Supabase + Next.js app.

---

## 1. "Do we need Cloudflare?" — usually NO on Vercel Pro (2024+)

Vercel now ships the features that historically justified putting Cloudflare in front. Before recommending the DNS-migration complexity of Cloudflare, check what Vercel-native already covers:

| Need | Vercel-native (Pro) | Cloudflare Free |
|---|---|---|
| DDoS L3/4 + L7 | ✅ unmetered + Attack Challenge Mode | ✅ |
| WAF | ✅ Vercel Firewall (managed + custom rules) | ✅ managed rules |
| Bot detection | ✅ BotID | ✅ Bot Fight Mode |
| Rate limiting | ✅ Edge Middleware / `@vercel/firewall` | 10k/mo free |
| Geo-block | ✅ | ✅ |

**Rule:** Cloudflare-in-front only earns its keep at very high traffic (>1M req/day) or when you need strict geo-fencing / a CDN Vercel doesn't cover. Adding it means a second CDN hop + TLS/CNAME migration + potential conflicts with Vercel ISR/image-opt. Default recommendation: turn ON Vercel Firewall + BotID first; revisit Cloudflare only if a concrete need appears.

## 2. Brute-force defense = layers, not one product

1. **Provider-native auth rate limit (already on by default in Supabase):** failed password sign-in throttled per IP + per email; magic-link / OTP / recovery capped per hour per IP. This is the single highest-leverage control and it's free + automatic. Verify it's not been disabled.
2. **App-level rate limit on the auth Server Action / route** (Edge Middleware or a counter in KV/Postgres): e.g. 5 fails / 10 min / (IP+email) → short lockout. Defense in depth above the provider limit.
3. **WAF rule** (Vercel Firewall): block IPs doing >N req/min on `/auth/*`, block known bot networks.

Don't reach for a new vendor when the threat is "someone hammers /login" — the provider limit already covers the common case; add layers 2–3 for the rest.

## 3. Magic-link / OTP expiry is a GLOBAL provider setting, not per-link

Supabase `MAILER_OTP_EXP` (Dashboard → Authentication → Emails → "Email OTP Expiration", seconds) governs ALL email links: magic-link, invite, recovery, email-change. **You cannot make one flow's link last longer than another's via the Supabase token.** Max allowed = `86400` (24h).

If a client wants "this one onboarding link should last 24h but keep others at 1h", the only way is a **custom token table** (your own `*_onboarding_tokens` row with `expires_at`, `used_at`), a landing route that validates YOUR token, then mints a fresh provider session server-side at click time (so the provider's 1h token is consumed instantly and never gates the window). That's real work — confirm the client actually needs per-flow granularity before building it. Often they're fine with "24h for everyone" → just raise the global setting + update email copy.

**Trap:** changing the global is a Dashboard / Management-API action. The `SERVICE_ROLE_KEY` in `.env` is the DATA plane — it does NOT grant auth-config changes. Those need a Personal Access Token (`sbp_…`) via the Management API, or the human flips it in the Dashboard. Don't claim you'll change it programmatically unless a PAT is actually present.

**Always update the email copy in lockstep** (`"expiră în 1 oră"` → `"expiră în 24 de ore"`). Search the whole repo — the duration string is usually hardcoded in 3+ places (email HTML, email text, login form hint, super-admin resend button). A lying "1 oră" label after a 24h config change erodes trust.

## 4. IT-audit quick battery (run these, report a table)

- `git` sync: local HEAD == deploy remote == CI remote (one SHA). Watch for a stale default-branch `HEAD` on a remote pointing at an old `master`.
- `npx tsc --noEmit` exit 0.
- `npm audit`: triage by severity; a framework `high` (e.g. Next.js) is usually one `npm audit fix --force` minor bump — do it, it closes the only red line.
- Secrets: `.env*` in `.gitignore`; `git ls-files | grep -E '\.env|secret|credential'` empty; grep src for inlined `sk-…`, `re_…`, `eyJ…`.
- Security headers live: `curl -sI` → HSTS (long max-age + preload), `X-Frame-Options: DENY`, `X-Content-Type-Options: nosniff`, HTTP→HTTPS 308.
- Email auth: SPF + DKIM + DMARC present; mail-tester ≥ 9/10. DMARC `p=none` is fine during warm-up; tighten to `quarantine`→`reject` after ~4 weeks.
- DB (Supabase): RLS enabled on 100% of public tables (`pg_tables.rowsecurity`); RLS lookups go through `SECURITY DEFINER` helpers (anti-recursion); 0 orphaned rows on FK integrity checks; private storage buckets only (signed URLs, never public).
- Backups: **Supabase DOES support backups** — Pro = 7-day daily automatic (Dashboard → Database → Backups); PITR is a paid add-on (7/14/28d). Free tier has none → if the project is Free and the client wants DR, recommend Pro. Auditor saying "Supabase doesn't do backups" is wrong; show them the tab (or note the tier).

## 5. Multi-role tenant bug pattern (recurs — grep for it)

`session.access[0]?.tenantId` is a latent bug whenever a user can hold multiple `user_tenant_access` rows (e.g. owner is also family, or admin of two homes). `[0]` is arbitrary order → wrong tenant. The fix already exists in the auth helper (`requireStaffSession` / `pickHighestAccess` / `requireTenantContext`). When you touch ANY Server Action that writes tenant-scoped data, grep for `access[0]` and replace with the helper that resolves the correct tenant + gate the role explicitly (don't trust the UI hiding the form — `camin_staff` can still POST an admin action).

## 6. Honest-assessment habit

Client is being audited → they need the *true* state, not reassurance. Lead with the one red line (e.g. "Next.js needs a patch bump") and the fact that everything else is green. Give them the verbatim sentence to relay to the auditor. Don't oversell ("bulletproof"); don't bury the one real fix.
