---
tags: [project, tns, lead-gen, startup, competition, application]
created: 2026-06-24
---

# Startup Competition Application — answers (copy-paste)

**Stage to select:** ☑ MVP built — Testing with users
**Share-your-MVP link:** https://go.consumervoice.eu/nestle  (live personalized microsite, public, no login) · dashboard: https://go.consumervoice.eu/login

### What problem are you solving?
Cold outreach is how SMEs and service businesses win clients — but it's broken for them. Doing it properly means stitching together 5+ disconnected tools: a lead database, an email verifier, a copywriter, a sending/warm-up tool, a landing-page builder, and a scheduler — easily $300-500/month plus a full-time SDR to run it. Most can't afford that. So they either skip outbound entirely, or they blast unverified scraped lists that bounce ~30% of the time, land in spam, and never get a reply — quietly burning their email domain's reputation in the process. The outcome: thousands of capable businesses with no predictable pipeline. We make cold outreach that actually lands inbox — as one integrated platform a non-technical founder can run in minutes, and that an AI agent can run end-to-end on their behalf.

### Why did you pick this problem?
We live it. We run The Niche Society, a Romanian digital agency, and we needed outbound to win our own clients. Every tool we tried was too expensive, too fragmented, or sent our emails straight to spam. So we built our own engine — first to sell our services, then for a paying client (Consumer Voice), then to reach 80 Bucharest fine-dining restaurants. The pain became undeniable: our built-in verification caught ~30% dead addresses before they could bounce. If we — people who can code — struggled to wire this together and keep deliverability alive, every SME, freelancer, and agency is stuck. We're solving a problem we feel every week, for a market we already sell into.

### Who are your customers?
Two segments. (1) SMEs and service businesses — agencies, consultancies, B2B SaaS, and premium local businesses (we're piloting with Bucharest fine-dining restaurants) that need a steady flow of booked meetings but can't justify an SDR or a five-tool stack. (2) Technical founders and indie hackers who want to run outbound straight from their terminal via our Claude/Codex agent integration. Beachhead: Romanian and EU SMEs and agencies, where we already have distribution through our agency network; then self-serve globally. Expansion: a white-label tier for agencies that resell outreach to their own clients.

### What have you built so far?
A real, deployed platform — not a mockup. Live today: a login dashboard; an AI-personalized landing-page microsite generated per prospect (live at go.consumervoice.eu/<company>); built-in SMTP email verification that catches dead mailboxes before we send (it saved us ~30% bounces); multi-account sending via Gmail/Resend with per-user routing; video-in-email; open/visit tracking; and a booking flow synced to Google Calendar. We've run it for real revenue: our first paying client, Consumer Voice (~$860 build), plus 82 verified leads loaded and 34 verified cold emails sent in our restaurant pilot. Built on React + Supabase + Netlify with serverless edge functions. Next in build: the AI-agent layer (CLI/MCP) and the ICP/targeting chat.

### Why is this the best way to solve it (MOAT)?
Three layers. (1) Integration depth — we own the entire loop in one product: find → verify → personalized microsite → send → track → book. Competitors solve one slice and make you bolt on the rest. (2) A microsite per prospect, not just a personalized email line — dramatically higher engagement, and very hard to replicate as an add-on to a legacy email tool. (3) Agent-native — we expose the whole pipeline as a CLI/MCP for Claude and Codex, so a user's AI agent runs outbound end-to-end ("outbound-as-code"). That is both a product wedge and a distribution channel inside the fast-growing AI-agent ecosystem. Built-in deliverability (verification + warm-up) is the cherry on top — most charge extra for it. We aren't "another outreach tool"; we're the integrated, agent-operated layer that makes outbound actually work for non-enterprise teams.

### Traction
- Revenue (USD): **$860** (first paid build — Consumer Voice)
- Number of Customers: **1 paying** (Consumer Voice / Wave x TNS)
- Monthly Active Users: **3** (platform operators) — early
- Other Key Metrics: **82 verified leads loaded · 34 cold emails sent · ~30% dead-email catch rate before sending · live microsite + booking flow · first paid build in <2 weeks**

### Future plans (next 3 months)
1. Ship the agent layer — CLI + MCP for Claude/Codex — so the full pipeline (ICP → leads → verify → microsite → send → book) runs from one command. This is our wedge. 2. Add the ICP/targeting chat + AI copywriting so onboarding is "describe your offer," not "upload a CSV." 3. Land our first done-for-you clients at $650/mo (Core, all-in), expanding to $1,200/mo (Growth) as they scale — upselling from our live restaurant pilot and agency network. 4. Sign 2 white-label agencies (~$500/mo per client) that resell the platform under their own brand. 5. Start Phase 2 deliverability (multi-inbox, auto warm-up, sequences). We price competitively — undercutting both a $1.5–6k/mo SDR and a fragmented 5-tool stack — and a low-cost self-serve tier exists only as a PLG funnel via the agent CLI. Target: ~$2–3k MRR in the first 3 months (path to ~$12k MRR by month 18) and a public launch in the Claude/Codex community.

### How will you use the funding? (30–250 words)
Funding goes straight into the wedge and first revenue. Product (~50%): ship the agent layer — our CLI/MCP for Claude & Codex — plus the ICP chat, AI copywriting, and Phase-2 deliverability (multi-inbox, auto warm-up, sequences), turning Clutch from a working MVP into the full integrated, agent-operated platform. Growth (~30%): convert our live restaurant pilot and agency network into the first paying clients at $650/mo Core (plus white-label), targeting ~$2–3k MRR in 3 months on a path to ~$12k MRR by month 18, plus a public launch in the Claude/Codex community for low-cost PLG. Team (~15%): a part-time SDR/ops to run managed campaigns and a designer for microsites at scale. Operations (~5%): dedicated sending domains/IPs, verification volume, and EU/GDPR compliance. We're capital-efficient — already deployed and at revenue — so funding mainly buys speed: shipping the agent moat before competitors and landing premium white-label clients while the category is still forming.

### Additional note (optional)
Clutch is built by an operating agency (The Niche Society) that lives this problem daily — so every feature comes from real campaigns, not guesses. We're already deployed, at revenue, and capital-efficient; the product is the engine behind our own client work. The agent-native angle (a CLI/MCP for Claude & Codex) is timed to the AI-agent wave and gives us a distribution channel few competitors can match. We'd value mentorship on go-to-market and white-label/agency partnerships across the EU.

### Product demo video — RENDERED ✅
`clutch-deck/Clutch-Demo.mp4` (also `clutch-deck/video/out/clutch-demo.mp4`) — **53s, 1920×1080**, built with **Remotion** (TNS-branded, white/black + gold). 8 scenes: Title → Problem → real backend dashboard (Ken Burns, 106 leads/3 segments) → /nestle microsite → 3D-menu phone clip → analytics (track & book) → "your agent runs the whole loop" → close. Source: `clutch-deck/video/src/*.tsx`; re-render: `cd clutch-deck/video && npx remotion render src/index.ts ClutchDemo out/clutch-demo.mp4`. Real captures via `capture.mjs`/`capture_dash.mjs`.

#### Original 75-sec script (reference, for a future live Loom if needed)
- 0:00–0:10 — "This is Clutch — cold outreach that actually lands, run by your AI agent." (show the dashboard)
- 0:10–0:30 — Import leads → run verification; show it catching the dead emails (~30%).
- 0:30–0:50 — Open a per-prospect microsite (go.consumervoice.eu/nestle) + the email with the video thumbnail.
- 0:50–1:05 — Hit send; a booking lands in Google Calendar.
- 1:05–1:15 — "And my Claude agent runs the whole thing from the terminal. Clutch — by The Niche Society."

### Pitch deck
`clutch-deck/Clutch-Pitch-Deck.pdf` — **18 landscape slides** in the **TNS house design**. Now with a **dedicated Clutch logo** (AI-generated concentric-C + gold arc, transparent at `clutch-deck/assets/clutch-logo.png`; alternates `clutch-logo-a/b.png`) as the cover hero + "A PRODUCT BY [NS] The Niche Society" (Clutch = a tool/service sold by TNS), a **Conversion funnel** slide (1,000 verified → 5 clients, verification = 98% delivered edge; `build_clutch_extras.py`), and a **Vision** slide (NOW/NEXT/THEN → outbound-as-code). Regenerate logo/funnel via `build_clutch_extras.py`. (minimal black-on-white, Arial, NS monogram logo, spaced "T H E  N I C H E  S O C I E T Y" wordmark, light-gray cards + dark highlight boxes, **gold accent sampled from the logo**, footer) — same design language as the FOX proposal/contract. Now with **charts + real platform screenshots**:
- Slides: Cover · Problem · Solution · **Product (real backend dashboard)** · **The wedge (live microsites)** · What's different · Why now · Traction (real numbers) · **Market (positioning 2×2)** · **Revenue projection** · **Unit economics** · **Business model (pricing tiers)** · Why we win (table) · Go-to-market · Team · The ask.
- **Real numbers** pulled from the live Supabase backend (2026-06-25): 106 leads · 44 sent · 14 dead-addresses caught (~30%) · €800 · 1 paying client · 3 segments. (Most of the 142 visits are test/demo slugs — NOT claimed as traction.)
- **Real screenshots**: dashboard control room (seeded with the real pipeline via DEV-only `?demo=1`), the /nestle microsite, the landing — framed as browser windows.
Source (regenerate any time): `clutch-deck/build_clutch_deck.py` (deck) + `build_charts.py` (matplotlib charts → `charts/`) + `frame_shots.py` (browser-frame screenshots → `assets/framed/`). Live captures via `clutch-deck/video/capture.mjs` + `capture_dash.mjs` (Playwright). Dashboard demo seed: `tns-leadgen/src/lib/demoData.ts` (DEV-only, real pipeline, third-party personal names masked). Preview PNGs via `clutch-deck/_render.py`.
