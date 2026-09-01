---
name: reference-comfortmap-deploy-git
description: "ComfortMap/familylink-app deploy + git remote auth gotchas (niche=Vercel repo, token expiry, GCM wrong account)"
metadata: 
  node_type: memory
  type: reference
  originSessionId: b833b2f7-3be7-472e-a90a-c40b90a28f50
  modified: 2026-07-28T12:03:19.534Z
---

Deploy + git auth setup for **familylink-app** (ComfortMap).

**REPO LOCATION (moved 2026-07-28): `C:\dev\familylink-app` — NOT the OneDrive copy.**
It used to live at `OneDrive\Desktop\claude\familylink-app`, which broke everything:
OneDrive dehydrates `node_modules` into cloud placeholders, so `next build` died with
`The cloud file provider is not running (os error 362)` / `UNKNOWN: unknown error, read`,
`tsc` took 9+ min, `rm -rf node_modules` crawled (~1k files per several minutes), folder
rename returned Access denied, and git itself failed to write refs
(`unable to append to '.git/logs/HEAD': Invalid argument` → needs
`git config windows.appendAtomically false`). Moved with robocopy (kept `.git` +
`.env.local`, excluded node_modules/.next). **Always work in `C:\dev\familylink-app`;
the OneDrive folder is stale — don't edit or build there.**

**Two people push to `main`:** Eduard AND **Cătălin Vreme** (GitHub `Snowy89`). On
2026-07-19 Cătălin pushed a 131-file terminology rebrand (cămin→serviciu social,
rezident→beneficiar) + lint fixes. A push was rejected as non-fast-forward because of it.
**ALWAYS `git fetch` the `niche` remote and rebase before pushing — never force-push
`niche`.**

**Deploy = git push to `niche` → Vercel auto-builds.** Two git remotes:
- `niche` → **github.com/thenichesociety/familylink-app** — this is the repo Vercel watches; pushing here triggers the production build for **comfortmap.ro**.
- `origin` → **github.com/Eduard22222222/familylink-app** — Eduard's personal mirror (CI only). Pushing here does NOT deploy.

Verify a deploy landed: poll `https://comfortmap.ro/api/version` → `{"sha":"<full sha>"}`; matches when live (~60-90s after push).

**Auth gotchas (2026-06-23 incident):**
- The PAT embedded in the `niche` remote URL **expired** mid-session (worked AM, dead PM) → push failed "Invalid username or token". It also fails the GitHub API with "Bad credentials".
- The machine's git `credential.helper = manager` (GCM) is cached with **Eduard22222222** — which has **no access** to the thenichesociety repo → a tokenless push to niche returns "Repository not found", and `gh` is logged in as Eduard22222222 too (also no access).
- So to deploy you need a **fresh thenichesociety PAT** (`repo` scope). One-off push without persisting it: `git push "https://<TOKEN>@github.com/thenichesociety/familylink-app.git" HEAD:main`. Then rotate/delete the token. The `niche` remote was left as the clean tokenless URL — next deploy needs auth set up again (fresh PAT in remote, or fix GCM to the thenichesociety account).
- ALWAYS redact PATs in output (`sed 's/ghp_[A-Za-z0-9]*/***/g; s#//[^@]*@#//***@#g'`) and never echo a user-pasted token.

**ACCOUNT RULE (user-stated, in Obsidian, reaffirmed 2026-06-30):** EVERYTHING for comfortmap/familylink — GitHub repo, Vercel, deploy, all platform credentials — lives under the **thenichesociety** account, NOT Eduard22222222. So before opening Chrome→GitHub for a comfortmap deploy, the browser session/PAT MUST be **thenichesociety**. Opening github.com/settings/tokens while logged in as Eduard22222222 = wrong account (his tokens can't see the repo → "Repository not found"). The user switches the Chrome GitHub session (avatar → Switch account → thenichesociety) before generating the PAT.

Generating a PAT / logging in / inviting members = the user does these (credential/access actions); Claude only navigates + guides. See [[skill_security_hardening]].
