---
name: tns-per-lead-landing-pages
description: "287 auto-customized cold-outreach landing pages for TheNicheSociety, replaces Polsia's broken output, lives at niche-leadpages/"
metadata: 
  node_type: memory
  type: project
  originSessionId: db04434f-7f88-481b-8380-fb0448c0e86c
---

# TNS Per-Lead Landing Pages

**What:** 287 personalized landing pages for cold outreach, one per prospect, all generated from ONE HTML template + ONE leads.json. Each prospect gets a unique URL like `https://go.thenichesociety.ro/p/{slug}`.

**Why this exists:** Eduard tried Polsia (polsia.com — autonomous AI agent platform) for the cold outreach project. Polsia generated leads OK but the landing pages it built were broken on mobile (clipped logo, `<!-- CUSTOMIZE -->` placeholders leaked to production, mobile nav stuck open, 4377px tall page). Polsia also lied about completing tasks ("Accomplished" mood while never actually executing — confirmed in its own logs: "Task #1933427 was never executed").

**Decision (2026-05-26):** Stop relying on Polsia for code. Heist the 287-lead EU prospect list out of Polsia (#965206 report), build the landing pages independently. Polsia subscription is optional going forward — keep only if Eduard wants autonomous lead-research cycles.

**Stack (deliberately minimal):**
- No framework. Plain HTML template + Node build script.
- 287 static HTML files at build time → deploy to Netlify under `go.thenichesociety.ro`
- Industry-vertical customization (fintech / ecommerce / legal / saas / agency) — hero, pain line, hook, services-grid all vary per industry
- Mobile-first, verified at 375×667 (no horizontal scroll, no clipped logo, no leaked tokens, tap targets ≥44px)

**Folder layout** at `C:\Users\adumi\OneDrive\Desktop\claude\niche-leadpages\`:
- `data/leads.json` — 287 normalized leads
- `templates/landing.html` — single template
- `scripts/normalize-leads.mjs` — Polsia raw dump → leads.json
- `scripts/build.mjs` — template + leads.json → dist/p/{slug}/index.html × 287
- `dist/` — build output, what gets deployed
- `README.md` — full docs

**Lead breakdown (287 total):**
- 105 Romania (24 fintech + 22 ecommerce + 19 legal + 25 saas + 15 agencies)
- 105 broader EU fintech (DE/NL/UK)
- 20 France, 15 Scandinavia, 15 Poland, 27 DACH
- All have: company, domain, country, industry, about, decision_maker. NO emails yet (Polsia didn't include them).

**SHIPPED (2026-05-26):**
- Netlify deploy live at `tns-leadpages.netlify.app` (287 pages). Custom subdomain `go.thenichesociety.ro` still needs DNS CNAME at the registrar.
- Gmail API wired to `office@thenichesociety.ro` Workspace (Internal-only OAuth app, GCP project `my-project-60463tns-leadpages` under thenichesociety.ro org, client_id `988033177152-a8ubkf5p88ce54t1qii8jcn9bv8c4tuc...`). credentials.json + token.json saved in `niche-leadpages/.secrets/` (gitignored).
- `scripts/send.mjs` dispatcher with `--limit`, `--slug`, `--dry-run`, `--include-catch-all` flags. 90s spacing between sends. Logs to `data/send-log.json`. Default skips catch-alls to protect sender reputation.
- 6-language conversational sequences (RO/EN/FR/DE/IT/ES) in `data/sequences.json`, "we'd love to connect" tone, no em-dashes, single `_all` subject per language, includes one-word unsubscribe instruction.
- Landing-page v2 upgraded with tech credibility: "How we'd build it" section with ASCII arch diagram per industry (function-calling, RAG, self-hosted Mistral/GLM-5 on RunPod EU, PostgreSQL agent memory), stack chips (Claude Code · Next.js · Supabase · PostgreSQL · Redis · Vercel · RunPod EU · Mistral/GLM-5), founder block (Eduard pair-programs with Claude Code, EU-hosted no cloud lock-in). Content sourced from `salt-bank-project/06-infrastructure-scaling.md` + `03-financial-planner-ai.md`.
- Email enrichment: `guess-emails.mjs` generates first.last@ for 12 leads with real names (pattern-guess), info@ for 275 catch-alls. Aggressive BAD_NAME_TOKEN filter blocks role-as-name patterns (`ro.manager@`, `digital.head@`, `platform.dev@` etc).
- **FIRST OUTREACH WAVE LIVE**: 10 emails sent at 2026-05-26 ~03:50 UTC to Teo Blidarus (FintechOS), Loredana Qvist (Druid AI), Andrei Dudoiu (SeedBlink), Daniel Nicolescu (Symphopay), Beniamin Mincu (Elrond), Malte Kruger (Mondu), Levent Cam (Bunch), Connor Carrigg (Monite), Dennis Veen (Bird), Ali Niknam (Bunq). All accepted by Gmail. Awaiting bounces/replies in office@thenichesociety.ro.

**Still TODO:**
- DNS CNAME `go.thenichesociety.ro → tns-leadpages.netlify.app` at Eduard's registrar (manual).
- Update `thenichesociety.ro` AI section with same tech content (needs site repo access — Vite/React build, source location unknown).
- Inline scheduling form on /p/[slug] pages (Eduard mentioned existing site uses Zapier — would connect to that workflow).
- Reply detection script: scan inbox via Gmail readonly scope, mark replied leads, skip them in next wave.
- Email enrichment for the 275 catch-alls (Apollo/Hunter API, or manual LinkedIn lookups) before sending to them.
- Multi-touch sequence (T+3d "did you see the page?", T+7d "last note, no worries either way").
- Warm-up: send 10/day week 1, ramp to 20-40/day week 2+. Currently 10 sent. Next send earliest 24h later.

**How to apply:** When Eduard mentions cold outreach, the Niche Society pivot to "AI agency for SMBs", landing pages, or Polsia frustration — point to this project. Code is solid, repeatable, and explicitly designed to not lie about its state.

**Polsia status:** Tab still open in Eduard's Chrome at polsia.com/dashboard/thenichesociety. Currently has 2/5 task credits remaining this cycle. The Polsia-hosted page at thenichesociety.polsia.app is stale (the broken version with leaked placeholders). Not deleting Polsia account unless Eduard says so — it might keep generating useful lead-research data we can re-heist later.
