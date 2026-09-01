---
tags: [project, strategy, tns, lead-gen, product, startup, pricing]
owner: The Niche Society (Eduard)
status: exploring — productize the engine
created: 2026-06-24
---

# TNS Lead Gen — Product Strategy (white-label tool + agent CLI)

Question: turn the [[TNS Lead Gen System]] engine into a product — white-label, with a CLI/MCP for Claude & Codex, more features. Can it compete in a startup competition? How to make it better? Pricing + profitability?

## Honest verdict
- As **"another cold-outreach tool" → NO.** The space is brutally crowded: Instantly, Smartlead, Lemlist, Apollo, Clay, Woodpecker + funded AI-SDRs (11x, Artisan, AiSDR). Hard to differentiate, hard to raise, CAC is the killer.
- As **"the first agent-native outbound engine" + per-prospect microsites → YES, there's a real wedge.** That framing is new, timely, and demos like a movie.

## The wedge (what actually differentiates)
1. **Agent-native outbound — CLI + MCP for Claude/Codex.** Not a GUI like everyone else; an engine the user's AI agent *drives*: `find_leads`, `verify_emails`, `make_landing_page`, `send_campaign`, `check_bookings`. "Outbound-as-code." Nobody serious does this yet; rides the agentic wave; and the MCP itself is a **PLG distribution channel** inside the Claude/Codex community.
2. **A personalized microsite per prospect** (not just a personalized email line) — AI-generated copy + visuals (Higgsfield/Nanobanana), live at `/slug`, with booking. Much stronger than email-only personalization.
3. **Built-in SMTP verification + video-in-email** — already built; kills the ~30% dead-address bounce problem and lifts reply rate.

The moat isn't any single feature — it's the **integrated loop** (source → verify → microsite → send → book) operated by an agent. Hard to bolt onto a legacy GUI tool.

## Can it win a startup competition?
- **Hackathon / student / accelerator pitch: YES**, with the right story + a live demo: one terminal command → leads found → verified (show the dead ones caught) → microsites generated → emails sent → a real meeting books on the calendar. That 3-minute demo wins rooms.
- **Real traction to flex:** Consumer Voice live, ~80 restaurants contacted, a verifier that caught ~30% dead emails, real bookings. Judges love real usage over mockups.
- **VC-grade competition: harder** — thin moat, crowded category. Pre-empt "what stops Instantly copying you?" with: agent-native distribution + the integrated microsite/verify/book loop, plus speed of a focused team.

## How to make it better (roadmap)
**P0 — competition demo (the wow):**
- The **Claude/Codex MCP + CLI** (the headline).
- Live per-prospect **microsite generation** + the **verify → send → book** loop on stage.

**P1 — real product (to actually compete):**
- **Multi-inbox + auto warm-up** (the Instantly table-stake for deliverability at scale).
- **Unified inbox + AI reply drafting** (handle responses, not just send).
- **Built-in lead sourcing** — productize the research agent ("find me 50 leads like X").

**P2 — depth:**
- Sequences / multi-step follow-ups, A/B testing, light CRM/pipeline, team seats, integrations (HubSpot/Slack/Calendar), GDPR/consent tooling (EU edge).

## Pricing — competitive, all-in (CONFIRMED 2026-06-25)

> **Eduard's call (2026-06-25):** price **competitively, not premium**. Anchor = **$650/mo Core** (done-for-you, all-in) · **$1,200/mo Growth** (as clients scale) · **white-label ~$500/mo per client** · one-time setup **$300–500** · self-serve via Claude/Codex CLI **~$149/mo** (PLG funnel, later).
> Realistic projection (conservative): **~$2k MRR by M3 → ~$12k MRR by M18** (~18 paying clients, ~$700 blended ARPU). **~85% gross margin** (marginal cost ~$50–90/client/mo, mostly automated). The premium €1.5–3k/mo framing below is **SUPERSEDED** — kept for history. See [[feedback-pricing-strategy-first]].

## ~~Pricing — premium, white-label-first~~ (superseded — see above)
**Anchor against the cost of an SDR** (RO €1.5–3k/mo, West €4–6k) **and client LTV** (€5–50k) — NOT against Instantly's $97. €800 for the full Consumer Voice build was 3–4x underpriced.

1. **Done-for-you / managed (hero, highest margin):** setup **€1,000–2,500** + **€1,500–3,000/mo** (we run outreach end-to-end → booked meetings + dashboard). Or performance: **€100–250 / qualified meeting**. = the Consumer Voice model, but recurring.
2. **White-label platform (agencies run it themselves):** setup **€1,500–3,000** + **€500–1,500/mo** under their brand; they resell to their own clients. Recurring, scalable, *they* sell.
3. **Self-serve SaaS ($49 / $99 / $299):** low tier — kept only for the "it scales" pitch narrative + the agent-CLI PLG funnel. **The money is NOT here.**

**Why we can charge more:** replaces a €1.5–6k/mo SDR; one client win = €5–50k LTV; 5–10 booked meetings/mo = massive ROI → €2k/mo is a rounding error for the buyer.

**Economics:** 10 managed × €2,000 = **€20k/mo** (margin high: our time + tiny infra) · 10 white-label × €1,000 = **€10k/mo** (they do the selling). Fewer clients, more revenue, far less churn/support than 200 SaaS seats.

## How profitable
- **Marginal cost ≈ $3–8 / user / mo** (sending via Resend/SES ~$0.0004/email; SMTP verify ~free self-hosted; static microsites ~free; AI gen ~$2–5; shared Supabase). → **gross margin ~88–92%** (classic SaaS).
- Scenarios: 100 Pro = **~$10k MRR / ~$110k ARR**; 500 = ~$50k MRR; 20 white-label agencies × $399 = ~$8k MRR *and they do the selling*.
- **Honest:** margins are great; **CAC + churn** are the risk in a crowded market. The agent-native PLG angle is the bet for cheap CAC. Realistic bootstrapped path: **$10–50k MRR in 12–18 months** if the wedge lands; VC-rocket is a harder, separate bet.

## My recommendation (two-track)
1. **Now / sure money:** keep it as TNS's **done-for-you lead-gen service** — sell *meetings/outcomes* to RO SMBs (Consumer Voice, restaurants already prove it). High-margin services, cash today.
2. **Upside bet:** package the **agent-native CLI/MCP** as the differentiator → enter a competition with the live demo + real traction, and soft-launch PLG to technical founders/indie hackers (cheapest CAC channel). Don't try to out-feature Instantly head-on; win on "your agent runs your outbound."

Back the pitch with track 1's traction; lead the pitch with track 2's story.

## Competitor teardown — "The Deals Machine" (youtu.be/TlCQlG7Z1ts)
An AI **cold-CALLING** sales platform (phone-first, not email). Architecture: **Verticals → Intelligence → Leads/Dialer**.
- **Vertical/ICP builder:** form OR adaptive chat (each question adapts to the last answer) → builds ICP + "signals" + market-research layers; refine in plain text.
- **Self-learning playbook + coaching:** every call analyzed (prospect persona + convo + your tone + offer) → updates your script; base layer = extracted sales-guru knowledge (Cardone, Hormozi…), then your calls refine it; "teach your coach" by chatting.
- **Intelligence layer:** daily actionable insights on your niche/market; what's landing vs backfiring per call; verify signals to strengthen/weaken them.
- **Onboarding ingestion:** import transcripts/notes/PDF/MD, import your website, or "interview yourself" (chat) so the AI learns your offer.
- **Lead gen by vertical:** generate N leads with website + LinkedIn; phone hidden for compliance (reveal button).
- **Live call:** web dialer or your cell; live transcription + **coaching cards** (full/balanced/off); tag outcome after; AI drafts follow-up email; send from connected Gmail; push to HubSpot/Apollo.
- **CRM-lite + analytics + team manager** (invite reps, pooled org intelligence so new reps inherit the veteran coach, KPI/goals).

**What WE already beat them on:** per-prospect **microsites**, **agent-native CLI/MCP**, built-in **SMTP verification**, **video-in-email**. They have none of these.

### Worth integrating (ranked)
1. 🥇 **ICP/"Vertical" builder via adaptive chat** → front-end for our research agent: "describe your offer" instead of "upload a CSV."
2. 🥇 **Onboarding by ingesting website + docs ("interview yourself")** → auto-writes ICP + email + microsite copy. Killer onboarding, feeds our AI content.
3. 🥇 **Self-improving playbook/intelligence** → analyze replies + outcomes → auto-suggest better subject/copy/send-time. "Your outbound learns."
4. 🥈 **Outcome tagging + insights dashboard** (which industries reply, which microsites convert).
5. 🥈 **Team/org layer with pooled intelligence** → powers the agency/white-label tier.
6. 🥈 **CRM-lite + push to HubSpot/Apollo.**
7. ⏭️ **Live-call dialer + coaching cards** — their core, but a DIFFERENT modality. Skip for now (huge build, not our lane); optional "call mode" later for RO SMBs.

**Pitch positioning:** "The Deals Machine coaches you on *calls*; we run your *email + personalized-microsite* outbound on autopilot — and your AI agent operates the whole pipeline from the terminal." Steal their *intelligence/ICP/onboarding* feel; don't chase the dialer.

## Full integrated platform — blueprint (✅ have · ◑ partial · 🔨 build)
The complete cold-outreach stack, end to end. We already own the hard, differentiated middle.

1. **Targeting / ICP** — ICP builder via adaptive chat 🔨 · ingest website+docs to auto-build offer/ICP 🔨
2. **Lead sourcing** — AI lead-gen by ICP ◑ (research agent, productize) · CSV/XLSX + manual add ✅ · enrichment (role/LinkedIn/signals) 🔨
3. **Verification / hygiene** — SMTP mailbox verify ✅ · dedup + bounce flagging ✅ · catch-all/role detection ✅
4. **Message & content** — multi-template RO/EN ✅ · per-prospect **microsite** ✅ *(wedge)* · video-in-email ✅ · variables ✅ · AI copywriting (subject/body) 🔨
5. **Sending infra** — Gmail/Resend per-user routing ✅ · multi-inbox + rotation 🔨 · auto warm-up 🔨 · sequences/follow-ups 🔨 · SPF/DKIM/DMARC + deliverability ◑
6. **Engagement / inbox** — open+visit+booking tracking ✅ · Google Calendar booking ✅ · unified reply inbox 🔨 · AI reply drafting 🔨
7. **Intelligence** — campaign analytics ◑ · outcome tagging 🔨 · self-improving playbook (what works → suggest) 🔨 · daily insights 🔨
8. **CRM / pipeline** — status pipeline ✅ · CRM-lite view ◑ · push to HubSpot/Apollo 🔨
9. **Team / white-label** — multi-user auth ◑ · roles + KPI + pooled org intelligence 🔨 · white-label branding 🔨
10. **Agent layer (the wedge)** — CLI + MCP for Claude/Codex 🔨 · public API 🔨

→ We have ~55% built — and it's the differentiated 55% (microsites, verification, sending, tracking, booking, templates, video). The gaps are mostly the *intelligence + scale + team* layers.

## Build roadmap
- **Phase 1 — demo-ready full loop (for the pitch):** ICP adaptive-chat → productized lead-gen → SMTP verify (have) → AI email copy + microsite (have microsite) → send+video (have) → track+book (have) → outcome tags + insights → **wrap it all in the agent CLI/MCP**. One command runs the whole loop. This is the pitch.
- **Phase 2 — deliverability & scale:** multi-inbox + auto warm-up · sequences · unified inbox + AI replies.
- **Phase 3 — monetize & grow:** CRM-lite + HubSpot/Apollo · team/white-label tier · matured learning playbook · billing/tiers.

## Open: needs a product name + brand (it's "TNS Lead Gen" internally — pitch needs a name; lean into the agent-native angle).

## Related
- Engine: [[TNS Lead Gen System]] · first instance [[Consumer Voice Platform (Wave x TNS)]] · owner [[The Niche Society]]
- Adjacent: [[Tetr 48h Hackathon]] (business-game competition context)
