# Skill: Auth Endpoints, Live Verification & Safe Handover

**Origin:** FamilyLink/ComfortMap session 2026-05-18 (magic-link login refactor — caught my own security regression via live testing).
**Type:** reusable engineering playbook. Apply on any auth/permission/security change, especially Supabase + Next.js + a transactional-email provider.

---

## The hard lessons (each = a trap + the rule)

### 1. `supabase.admin.generateLink({type:'magiclink'})` SILENTLY CREATES the user
It does **not** error for a non-existent email. It creates the auth user and returns success with `properties.hashed_token`. So any `if (error && isNotFound) {...}` branch is **dead code** for `type:'magiclink'`.
- **Consequence on a public/unauthenticated endpoint:** anyone can create unsolicited accounts + trigger emails (abuse/spam/GDPR vector).
- **Rule:** before calling `generateLink` on any public path, do an explicit existence check against your own user directory (`public.users`, case-insensitive `ilike`) and bail out if absent. `type:'invite'` is the one that's *meant* to create — gate creation behind an explicit `allowInvite` flag that is **safe by default** for public callers. The old `signInWithOtp({ shouldCreateUser:false })` had this protection built in; if you refactor away from it, you must re-add the guard yourself.

### 2. Type-correct + review-plausible + `tsc` clean can still be a security regression
The bug lived in an external API's runtime behavior, not in the types. Compiler green ≠ correct.
- **Rule:** for auth/permission/security changes, the real acceptance test is the **adversarial / negative path run LIVE** (non-existent email, wrong role, expired/replayed token), not the happy path. Always test "what should be refused" — not just "what should work".

### 3. Don't use the buggy primitive as its own verification oracle
My first "does this user exist?" check *called `generateLink`* — which itself created the account → self-fulfilling false positive that wasted a cycle.
- **Rule:** verify with a **non-mutating** method (`listUsers` scan, direct table read), never with the mutating call you're testing.

### 4. Anti-enumeration for public auth endpoints
Identical response whether or not the account exists. Success-path and not-found-path return the **same** `{ok:true}`; UI message is neutral ("if an account exists, we sent a link"). Only genuine infra errors return a different (error) state.

### 5. Bot-safe one-time links
Link-preview crawlers (WhatsApp/Gmail/Slack) auto-GET URLs in messages and **burn one-time tokens** before the human clicks.
- **Pattern:** email link → a **static landing page that verifies nothing on render** (just a button) → user click → real `/auth/callback` does `verifyOtp`. Bots don't click buttons.
- Build the magic URL on **your own domain** from `properties.hashed_token`; do **not** use `properties.action_link` (routes through the provider's `/auth/v1/verify` and depends on the Site-URL allowlist).

### 6. Confirm the deploy is actually live before testing a fix
Don't infer from elapsed time. Query the platform's deploy API by **commit SHA + state=READY** (e.g. Vercel `/v6/deployments`), and use a **behavioral discriminator** — a string/behavior that only the new build has (e.g. a changed UI message) — to prove which build is serving. (A server-action-only change has no GET-observable marker; pick a discriminator deliberately.)

### 7. Mirror config from the authoritative source, not memory
When aligning local↔prod env, **read the real prod values** (Vercel env API) — don't assume. And separate:
- **branding strings** (safe to rename: comments, display-name in `RESEND_FROM`, etc.)
- **external-system identifiers** (Sentry project slug, DB project ref, bucket names) — must keep matching the real external resource or you silently break the integration. Renaming these "for consistency" is a bug.

### 8. Documentation that is an acceptance criterion must be EXECUTED to be trusted
To claim "a non-technical user can self-serve from this doc", actually perform the flow **verbatim, in production, as that user's role**, following only the doc — then delete the test artifacts. Demonstrate; don't assert. Field rules in the doc should come from the real validation schema (zod), not guesses.

### 9. Clean up live-test pollution immediately
Probe accounts, test tenants/admins, audit rows created during verification must be deleted (FK-safe order: access/children → audit → parent; auth user + app `users` row) and the deletion **verified**. Never let test data survive into a demo/prod DB.

### 10. Secret & handover hygiene
- **Never echo live secrets into chat/logs** — transcripts persist and sync to cloud (OneDrive/etc.). The owner can read their own `.env` locally; point them to the file/dashboard instead of reproducing values.
- For client handover, **dashboard-owner invites expose keys legitimately** → raw `.env` transmission is unnecessary *and* a leak/GDPR risk. Recommend native member-invite UI per platform; **I guide, I don't perform access-control changes or send secrets**.
- **Rotate any secret that has touched an insecure channel** (chat, email, a committed file, a token baked into a git remote URL).

### 11. Heed the repo's AGENTS.md / CLAUDE.md
Non-standard framework versions + env quirks are real. Here: Next 16 + Turbopack on OneDrive → local `next build` hits EPERM file-locks; the real gate is `tsc --noEmit` **plus** the CI/Linux build, not a local build. Don't assume a background build passed — check exit code.

### 12. RLS self-referential recursion + post-auth redirect must not depend on RLS
Two linked production-down lessons (ComfortMap 2026-05-19):
- **Never put an inline subquery on table X inside table X's own RLS policy.**
  `uta_select ON user_tenant_access USING (... EXISTS(SELECT FROM
  user_tenant_access ...))` → Postgres "infinite recursion detected in policy
  for relation X" and **aborts the whole query** (not just that row). It
  cascades: every *other* table's policy that sub-selects X also recurses
  through X's policy. Membership/role lookups inside RLS MUST go through a
  `SECURITY DEFINER` helper (locked, e.g. `is_super_admin()`,
  `has_tenant_access()`, `is_tenant_manager()`) that bypasses RLS for the
  lookup. If some helpers are already SECURITY DEFINER and one clause is an
  inline subquery, that one clause is your recursion.
- **Computing a post-auth redirect via the RLS-bound (anon) client is
  fragile.** `signInWithPassword` succeeding ≠ role resolved. If the role
  query runs as the just-authed user under RLS and that errors (recursion) or
  is filtered, a swallowing `try/catch` → role undefined → destination falls
  back to "/" → user silently lands on the public site. Resolve role/tenant
  with the **admin client** after auth (the user id is cryptographically
  validated by the auth call) — mirror the `/auth/callback` pattern
  everywhere a redirect is computed. A hardcoded demo-email→role fallback
  masks this for seeded accounts and hides the bug for everyone else.
- Diagnosis tactic that worked: replicate the action's *exact* query with an
  anon client signed in as the affected user → the recursion error surfaces
  immediately and unambiguously. Then `pg_policies` / `pg_get_functiondef`
  (filter `prokind='f'` — `pg_get_functiondef` fails on aggregates) to see
  which clause is inline vs SECURITY DEFINER.

---

## Quick checklist — auth/security change

1. Does this path create/elevate anything? If public/unauth, add an explicit existence/permission gate **before** the privileged call; default safe.
2. Wrote the change → `tsc --noEmit` is necessary, **not sufficient**.
3. Deploy → confirm live by SHA + behavioral discriminator.
4. Test the **negative** path live (non-existent / wrong-role / replayed token) with a **non-mutating** oracle.
5. Test the positive path; confirm legit users still pass the new gate.
6. Anti-enumeration: identical response for exists vs not.
7. Delete every test artifact; verify gone.
8. Never print secrets; rotate anything that leaked.
9. Log what was done + what's still open in the project's SSOT (vault), not just chat.
