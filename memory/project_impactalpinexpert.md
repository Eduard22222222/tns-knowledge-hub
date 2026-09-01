---
name: project_impactalpinexpert
description: "Impact Alpin Expert — real client site (rope-access/alpinism utilitar), Netlify + Lovable, RO/EN"
metadata: 
  node_type: memory
  type: project
  originSessionId: 20040b33-d36a-4bad-9023-39a15c8160a3
---

**Impact Alpin Expert SRL** — real client website for a Romanian rope-access / alpinism utilitar / facade & waterproofing company (Jud. Giurgiu, Sat Grădinari; tel +40 769 576 810; impactalpinexpress@yahoo.com; "Since 2012"). NOT a brand-showcase demo — this is a live production site.

Stack & infra (all on Eduard's Netlify account edumitriu04@gmail.com, team "IDK"):
- Netlify site name (random slug): **ephemeral-blancmange-77d93d**, site_id `818a8612-d036-4a48-a767-0036f80c2c31`. So `impactalpinexpert.netlify.app` 404s by design — only the custom domain works.
- Custom domain: **impactalpinexpert.ro** (+ www CNAME → the netlify.app). DNS is **Netlify DNS** (NS1 `p04.nsone.net`), zone_id `68e582d76c2a74c67cd4486f`.
- Repo: **github.com/Eduard22222222/alpin-lift-hub** (private). Vite + React + TS + Tailwind + shadcn/radix, bilingual RO/EN.
- Built/edited in **Lovable**.

Netlify CD IS wired & working: build_settings provider=github, branch=main, cmd `npm ci && npm run build`, publish `dist`, stop_builds=false. So the Oct 2025→Jun 2026 gap was just because the repo had NO new commits (Lovable→GitHub sync is the broken link, not Netlify). Pushing to `alpin-lift-hub` main auto-deploys. If client reports "my changes aren't showing," check Lovable's GitHub sync first.

2026-06-15: I cloned the repo to `alpin-lift-hub/`, fixed the contact email site-wide (impactalpinexpress→**impactalpinexpert@yahoo.com**) in Footer.tsx, Contact.tsx, Seo.tsx (5 spots), pushed commit dbf3bae → auto-deployed & verified live. Prior live version was the single 2025-10-13 deploy. NOTE: Seo.tsx schema phone (+40722308692) differs from the site's displayed phone (+40 769 576 810) — flagged, not yet fixed.

Eduard wants this project handed over for me to manage directly (I have netlify + gh CLIs authenticated here). See [[skill_netlify_intermittent_ssl]] for the SSL incident fixed on this domain.
