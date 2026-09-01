# Incident: Macromex Supabase Credentials Leaked Into Kandia & Bonduelle Clones

**Date:** 2026-04-09
**Severity:** High — cross-tenant data contamination
**Status:** Resolved

## What happened

When cloning the Macromex brand showcase into `kandia-brand-showcase/` and `bonduelle-showcase/` via `cp -r`, the Macromex `.env` file was copied along with everything else. It contained:

```
VITE_SUPABASE_PROJECT_ID="vscvgczggesdyfunialz"
VITE_SUPABASE_URL="https://vscvgczggesdyfunialz.supabase.co"
VITE_SUPABASE_PUBLISHABLE_KEY="eyJ..."
```

Both Kandia and Bonduelle dev servers were silently reading this `.env` and connecting to the **Macromex database**. On the Bonduelle `/competitii` page the user saw:
- Photos briefly flash, then disappear (staticComps replaced by dbComps from Supabase)
- Titles became Edenia/Corso competitions ("Castiga un weekend culinar!", "Provocarea Nuggets", etc.)
- Zero cover photos (Macromex rows don't have `cover_photo` populated)

The user's hypothesis ("because you have to be logged in") was wrong — the fetch was anonymous and succeeded against the wrong tenant's DB.

## Root causes

1. **`cp -r` copied `.env`** — which isn't excluded by `cp`
2. **Original `.gitignore` did not list `.env`** — only `*.local`, so the Macromex `.env` was committed to git and propagated everywhere
3. **`createClient()` happily accepted any URL** — no validation blocked the wrong-tenant URL
4. **`.env` overrode the placeholder fallback** in `client.ts` — the `?? 'YOUR_...'` trick only fires when the env var is missing, not when it's set to a bad value

## Fix applied

### 1. Neutralized `.env` files
Both `bonduelle-showcase/.env` and `kandia-brand-showcase/.env` now have empty values with a warning comment.

### 2. Hardened both `src/integrations/supabase/client.ts`
- Trim env values and validate: reject empty, reject `YOUR_*` placeholders, **explicitly reject any URL containing `vscvgczggesdyfunialz`** (the Macromex project ref)
- If invalid → return a **stub Supabase client** built via `Proxy` that mimics the PostgREST query-builder chain. Every `.from().select().eq().then()` resolves to `{ data: null, error: null }`. `auth.getSession()` returns no session. Storage uploads return an error.
- Logs a one-time `console.warn` on boot so the developer knows they're in offline mode

### 3. Created `.env.example` files
With clear isolation rules and a warning not to paste another tenant's credentials. Leaving values empty is explicitly documented as safe.

### 4. Updated `.gitignore` in both projects
Added `.env`, `.env.local`, `.env.*.local` to prevent future commits.

### 5. App behavior when stubbed
- `Competitii.tsx` — `dbComps` stays empty → falls back to `staticComps` → 3 Bonduelle competitions with Unsplash cover photos render cleanly
- `Auth.tsx` — signup/signin show "Supabase offline" error, which is fine for a demo shell
- `Admin.tsx` — CRUD is inert, which is also fine

## Verification
- Bonduelle dev server restarted (port 8083, 8082 was still held)
- `/competitii` now shows: "Câștigă un abonament la legume Bonduelle", "Provocarea rețetelor creative", "Recenzia lunii"
- 0 leaked Macromex titles
- 4 images total (1 logo + 3 cover photos)
- Console warning `[bonduelle] Supabase credentials are empty or invalid...` fires as expected

## Lessons / process updates

1. **Never use `cp -r` to clone projects with secrets.** Prefer a script that explicitly excludes `.env*`, `node_modules`, `.git`, build outputs.
2. **Audit `.gitignore` immediately after any fresh clone** — if `.env` isn't listed, fix that first before writing any code.
3. **Supabase client files must validate the URL** — not just check for existence. Every multi-tenant setup should blacklist other tenants' refs explicitly.
4. **Offline stub clients are a safer default than throwing** — a stub lets the UI still render the demo cleanly while loudly warning in console.
5. **When the user says "data doesn't get fucked", enforce it in code**, not just in docs. The policy file said data isolation was required; the actual code didn't enforce it until now.
