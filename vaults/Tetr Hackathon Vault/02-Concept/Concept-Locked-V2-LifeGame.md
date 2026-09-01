# LOCKED CONCEPT V2 — "CLUTCH" (working title)

*The previous `Concept-Locked-CloseIt.md` is superseded. Reason: Eduard expanded the scope past pure sales/negotiation to cover **any high-stakes conversation in life** — interviews, dates, competitions, family, boss chats. Same mechanic, bigger universe.*

> **Tagline**: *Every conversation is a negotiation. Practice the ones that matter.*

A graphical visual-novel-style game where you walk into scripted real-life scenarios (job interview, first date, salary talk, sales pitch, awkward breakup, start-up competition), talk your way through them with AI counterparts, and get scored + coached on what you could've said better.

---

## Why this is the right idea (addressing Eduard's 6 points in order)

1. *"something I would pay for at least"* → Yes. This is the first simulator for social skills that matter. Everyone has one conversation coming up they're dreading.
2. *"graphical elements like an actual game"* → Visual-novel aesthetic. Full-screen scene backgrounds (café, boardroom, stage), animated character portraits (generated with **Nanobanana** which you already have), dialogue box with typewriter text, tactic buttons styled like JRPG action commands. Screenshots look like a game, not a chatbot.
3. *"real scenarios"* → 30+ real scenarios at launch across 6 "Life Modes". Each scenario is scripted (goal, counterpart archetype, win condition) — not open-ended.
4. *"interview, competition, date"* → Exactly the scope. See Life Modes below.
5. *"cheap so people buy it"* → Launch price **€4.99 one-time Pro** (not subscription, not €9). Price anchor = chewing gum. Conversion math: 20 Pro sales = $100.
6. *"pre-built scenarios, AI talks, learn what to do better, get a score"* → That IS the loop. Pre-scripted scene + AI counterpart + tactic palette + end-of-scene coach debrief + star score + shareable card.

---

## Name candidates (pick one)

| Name | Vibe | Pros | Cons |
|------|------|------|------|
| **CLUTCH** | Sports-clutch, game-y | Action verb, memorable, works bilingual, .gg/.app available | Slight gamer-bro energy |
| **LINES** | Minimalist, actor-y | "Got the right lines?" is a great tagline | Generic search |
| **SMOOTH** | Dating-first, charming | Highest shareability, TikTok-core | Maybe too dating-specific |
| **SAY IT** | Urgent, simple | Perfect for CTA-style onboarding | Forgettable |
| **Ice Breaker** | Playful, approachable | Fun theme | Already overused |
| **Moment** | Broad, philosophical | "Own the moment" tagline | Too abstract |
| **NPC** | Meta-joke (you're talking to NPCs) | Extremely Gen-Z viral | Insider jokey |

**My pick: CLUTCH**. Your call.

---

## The 6 Life Modes (launch content plan)

Scope-cut: ship 3 Modes on day 1 (Interview / Date / Deal), add 3 more as content drops in hours 30-48 for launch-day growth posts.

### 💼 THE INTERVIEW
Job interviews. Hardest convo most people regularly face.
- **L1**: *"Tell me about yourself"* — the opener trap. 4-turn scene.
- **L2**: *"Why should we hire you over the 3 other finalists?"* — counterpart is The Blunt CEO.
- **L3**: *Salary expectations landmine.* The Cheap Founder.
- **L4**: *Behavioral interview* ("Tell me about a time you failed"). The STAR-method gatekeeper.
- **L5 (Pro)**: *Offer negotiation.* The HR Director.

### ❤️ THE DATE
- **L1**: *First-date opener at a café.* Counterpart: The Skeptical Match from Hinge. Ice-break or you're ghosted.
- **L2**: *The "what are we" conversation.* 4 weeks in, DTR time.
- **L3**: *"You've been distant lately"* — recovering from a slump.
- **L4**: *Meeting her friends.* Group dynamics.
- **L5 (Pro)**: *The breakup you're trying to avoid.*

### 🤝 THE DEAL
Sales, freelance pricing, haggling.
- **L1**: *Selling your old iPhone on Facebook Marketplace.* Tutorial level.
- **L2**: *Haggling a used car.* Vasile The Old-School Dealer.
- **L3**: *Freelance pricing pushback.* The Cheap Founder client.
- **L4**: *Enterprise sales call.* Svetlana the Procurement Bot.
- **L5 (Pro)**: *Saving a cancelling customer.*

### 🎤 THE STAGE (ship H30-36)
Pitches, competitions, debates, public speaking Q&A.
- **L1**: *Startup competition judges' Q&A.*
- **L2**: *Debate your position against a hostile opponent.*
- **L3**: *Press conference damage control.*

### 👨‍👩‍👧 THE FAMILY (ship H36-42)
Awkward family/friend convos.
- **L1**: *Parents ask "when are you settling down / getting a real job".*
- **L2**: *Asking to borrow money from a sibling.*
- **L3**: *Saying no to a wedding invitation you can't afford.*

### 😬 THE AWKWARD (ship H42-48)
- **L1**: *Firing an underperformer who's also your friend.*
- **L2**: *Rent negotiation with a passive-aggressive roommate.*
- **L3**: *Returning a used item for a refund.*

Total: 24 scenarios at launch, 30+ by end of hackathon.

---

## The Game Layer (unchanged, retested against new scope)

**Per-scenario loop** (unchanged from CloseIt):
1. Briefing card (scene · your goal · counterpart vibe)
2. Tactic palette appears (mode-specific — different for a date vs an interview)
3. Turn-based chat with animated portraits and scene backgrounds
4. Meters: **Rapport** (replaces Credibility for social scenes) + **Counterpart Mood** (replaces Patience)
5. End-of-scene: Stars (1-3), breakdown of what went well/poorly, the *3 alt-lines* you *could* have said and how they would've played
6. Share card

**Tactic palette now mode-aware**:
- **Interview tactics**: STAR Story, Reframe, Bridge, Specific Number, Pause, Question Back
- **Date tactics**: Callback (reference what they said earlier), Vulnerability, Tease, Pivot, Plan-Forward, Silence
- **Deal tactics**: Anchor, Mirror, Label, Silence, BATNA, Bundle (from previous doc)
- **Stage tactics**: Reframe, Concede-and-Pivot, Data Drop, Story, Humor
- **Family tactics**: Acknowledge, Boundary, Story-Share, Gentle Redirect, Name-the-Tension
- **Awkward tactics**: Empathy-First, Name-the-Elephant, Offer-Alternative, Firm-Kind, Exit-Graceful

**Common mechanic**: tactics are buttons that (a) inject style instructions into the LLM counterpart, and (b) deterministically move the hidden state (rapport/mood/hidden_number) on OUR side so the game feels fair and consistent, not random.

---

## Graphical Direction (THIS is what makes it feel like a game, not a chatbot)

### Aesthetic: "Modern Visual Novel"
Think **Coffee Talk** meets **Persona 5 dialogue** meets **iMessage** — stylish, readable, screenshot-able.

### Visual components per scene
1. **Full-bleed background art** (café / boardroom / stage / bedroom / family dinner) — 6 total, one per Mode, reusable. Generated with **Nanobanana** in a consistent style (cel-shaded, flat colors, warm palette).
2. **Counterpart portrait** in bottom-left corner. 3 expressions per character (neutral / pleased / annoyed) that swap based on Rapport meter. Nanobanana again.
3. **Dialogue box** with typewriter effect, name-tag, and small mood indicator.
4. **Tactic palette** — 4-6 buttons at bottom, color-coded, with tiny icons. Disabled buttons show lock icons or "used" states.
5. **Meter HUD** — top-right shows Rapport ❤ and Mood ⚡ as animated bars.
6. **End-of-scene** — animated star reveal (1/2/3★), then coach card slides in with alt-lines.

### Why this is feasible in 48h
- Nanobanana generates 24 scene backgrounds + ~60 portraits in ~3 hours total
- Tailwind + Framer Motion handle the transitions
- Visual novel is one of the easiest "game" aesthetics to fake well — it's just static art + text

---

## Pricing (CHEAP, per Eduard's call)

| Tier | Price | Unlocks |
|------|-------|---------|
| Free | — | Interview L1-L2, Date L1-L2, Deal L1-L2 (6 scenarios total), 1 daily play |
| **Pro** | **€4.99 one-time** | All 24+ scenarios, full tactic palettes, unlimited plays, alt-line coach debrief, Bestiary |
| Pro+ | **€14.99 one-time** | Pro + "My Scenario" mode (describe a real conversation you're about to have, game generates a practice scenario for it + 1-page prep PDF) |

**$100 target math**: 20 Pro @ €4.99 = €100. Much more reachable than the €9 tier. If even *one* Pro+ sale (€15), we're at €115 with 20 Pro.

**Psychological anchor**: €4.99 < price of a coffee. Harder to say no. Expectation: 8-12% conversion on Free-to-Pro given this price, vs 3-5% at €9.

---

## Why this hits the judging rubric even harder than CloseIt

1. **Problem Relevance & Clarity**: everyone alive has upcoming hard conversations. Score ★★★★★
2. **Product Thinking & UX**: visual novel is *the* proven pattern for narrative games → accessibility is free. Score ★★★★★
3. **Quality of Simulation & Learning**: alt-lines coach shows *counterfactual* learning ("here's what would've worked better") — this is the killer learning feature. Score ★★★★★
4. **Creativity in Game Design**: "Duolingo for hard conversations" with visual-novel aesthetic + multi-mode palette is genuinely novel. Score ★★★★★
5. **Impact on User Understanding of Business**: expands "business" to its true scope — every conversation is commerce. Playing Date Mode teaches reciprocity. Interview Mode teaches positioning. This is the hack. Score ★★★★

---

## 48h Build Plan V2 (replaces old plan)

### H0-H4: Foundation
- Next.js + Tailwind + shadcn + Framer Motion scaffold
- Supabase (anon session, email magic link for Pro)
- Stripe Checkout (€4.99 and €14.99 products)
- Domain: **trclutch.com** / **clutch.gg** / **playclutch.app** — check + buy
- PostHog
- Nanobanana asset pipeline (prompt templates in `Art-Brief.md` — to write next)

### H4-H12: Core gameplay engine
- Scene renderer (background + portrait + dialogue box + tactic buttons + meters)
- Turn loop with streaming LLM counterpart
- Tactics system: deterministic state effects + prompt injection
- Meter animations
- End-of-scene scorecard component

### H12-H18: Content — 9 scenarios (3 per Mode: Interview/Date/Deal)
- Scenario JSON schema (scene id, background, counterpart, goal, turns, star rubric, alt-lines pool)
- Author 9 scenarios manually (Claude as co-writer), QA each
- Tune tactic palettes per Mode

### H18-H22: Nanobanana asset generation
- 6 scene backgrounds (one per Mode)
- 18 character portraits (3 expressions × 6 counterparts for launch)
- Logo + favicon

### H22-H26: Monetization + polish
- Paywall triggers (after L2 of each Mode)
- Stripe webhook → is_pro flag
- Share card `@vercel/og` template
- Rate limiting, legal pages, mobile polish

### H26-H30: Private soft launch
- 5 friends break it
- Fix 3 worst bugs
- Record 30s demo video

### H30-H47: LAUNCH (see updated GTM)
- Drop the 3 new Modes (Stage/Family/Awkward) as launch-day "content drops" for growth posts
- Execute channel playbook (Twitter, LinkedIn, Reddit, Indie Hackers, TikTok *because* Date mode)
- Dating angle is a TikTok goldmine — that's how we hit 100 users

### H47-H48: Submit

---

## Why TikTok matters now (didn't for CloseIt)

Once "Date Mode" exists, the game becomes a *TikTok content factory*:
- "I ran my ex's breakup text through this AI and it SCORED me"
- "Guys, watch this AI try to flirt"
- "Which line gets the second date?"

One TikTok with 50k views = 100 users easily. You're already a content creator — this is in your lane.

---

## Open decisions (final round before we start coding)

1. **Name**: Clutch / Lines / Smooth / Say It / NPC / other?
2. **Domain budget**: €10 for .gg/.app or €30+ for .com?
3. **Art style for Nanobanana**: flat cel-shaded warm palette (Coffee Talk) / anime visual-novel (Persona 5) / modern minimalist (Monument Valley)?
4. **Counterparts**: human portraits or stylized avatars (masks, animal heads) for broader appeal + less uncanny?
5. **Free tier**: is 6 scenarios the right free-to-paid gate, or should we give more (→ higher volume, lower conv) or fewer (→ faster paywall hits)?
6. **Romanian launch**: English only at launch, RO version as a "for my guys" post Day 2?

Call these and I scaffold the repo immediately.
