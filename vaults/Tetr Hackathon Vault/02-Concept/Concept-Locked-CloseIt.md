# LOCKED CONCEPT — "Close It" (working title)

**Tagline**: *Climb from yard-sale rookie to M&A shark. 30 negotiations. Every word counts.*

A turn-based negotiation game where you learn sales & negotiation **by doing**, with a tactics palette, star ratings, and a career ladder. Duolingo for negotiation, Chess.com for dealmaking, with the voice of *The Office*.

---

## 1. The Core Loop (90 seconds to understand)

You open a **Level**. The briefing card tells you:
- **Scene** ("You're buying a used BMW. Seller wants €18,000. You have €15,500 max.")
- **Your goal** (anchor + walk-away number)
- **Counterpart archetype** ("The Old-School Dealer — hates being rushed, loves flattery")
- **Star rubric** (1★ = deal closed / 2★ = deal + under budget / 3★ = deal + under budget + counterpart leaves happy)

You enter a **turn-based chat**. Each turn you:
1. Pick a **Tactic** from a palette (unlocked as you progress)
2. Write/pick your message (early levels = multiple choice, later = free text)
3. Watch the counterpart's **patience meter**, **your credibility**, and **their hidden offer** move

After 6–10 turns (or when one side walks), you get a **debrief**:
- Stars earned
- Tactics used (well / poorly)
- Coach's 3 takeaways
- Shareable scorecard PNG

---

## 2. The Career Ladder (7 Acts, ~30 Levels)

Progression is the *game*. Every Act teaches a distinct commercial skill.

| Act | Name | Skill focus | Sample levels |
|-----|------|-------------|---------------|
| 1 | Street Cred | Basics of ask & exchange | Yard sale, Flea market haggle, Sell your old iPhone |
| 2 | Retail Floor | Objection handling, upsell | Buy a used car, Sell a mattress, Phone upgrade |
| 3 | The Freelancer | Pricing yourself, scope | Design gig pricing, Scope creep push-back, Late invoice |
| 4 | Cubicle Life | Salary & career | Ask for raise, Counter-offer, Equity vs cash, Remote work |
| 5 | B2B Sales | Enterprise close | Discovery call, Procurement haggle, Renewal at risk |
| 6 | Partnerships | Equity, splits, JVs | Co-founder equity, Vendor exclusivity, Revenue share |
| 7 | M&A | Big league | Acquisition term sheet, Board negotiation, Earn-out |

Free players get Acts 1 & 2 (9 levels). Pro unlocks the rest.

---

## 3. The Tactics Palette (the game mechanic)

You start with 3 tactics. Every 3 levels you unlock 1 more. Final set: ~12.

| Tactic | What it does narratively | Game effect |
|--------|--------------------------|-------------|
| **Anchor** | Throw out a strong first number | Sets the conversation range; wrong anchor = credibility hit |
| **Mirror** | Repeat their last 3 words | +patience, pulls info out of them |
| **Label** | Name their emotion ("Sounds like you're frustrated") | +trust, reveals hidden archetype traits |
| **Silence** | Say nothing for 1 turn | +pressure, risky — can signal weakness if misused |
| **BATNA Reveal** | Mention your alternative | Hard anchor move; once per level |
| **Concede** | Give a small win | +goodwill, –ground |
| **Flinch** | Visible shock at their price | –their confidence, only works early |
| **Bundle** | Add something to the deal | Often unlocks stuck deals |
| **Split the Pie** | Offer a fair midpoint | Closes soft deals, leaves money on table |
| **Walk Away** | Threaten to leave | Huge risk, huge reward, permanent per level |
| **Deadline** | Impose time pressure | Accelerates; may damage relationship |
| **Higher Authority** | "I have to check with…" | Stalling tactic, buys another turn |

Tactics are **not free-text**. They're buttons. This is what makes it a *game* instead of a chatbot. The button colors your next message with hidden instructions to the LLM counterpart.

---

## 4. The Counterpart Archetypes (the bestiary)

Each archetype has: hidden number, patience decay curve, vulnerable tactics, immune tactics, signature lines.

Launch set (10): **The Old-School Dealer**, **The Corporate Procurement Bot**, **The Cheap Founder**, **The Empathetic HR Director**, **The Silicon Valley Shark**, **The Romanian Uncle**, **The First-Time Buyer**, **The Aggressive Broker**, **The VP Who's Been Burned**, **The Consultant Who Bills Hourly**.

Each has a 1-paragraph bio + system prompt (see `Archetypes.md`). Beating an archetype unlocks them in your **Bestiary** — pure dopamine mechanic.

---

## 5. Progression systems (the "game" layer)

- **Stars** (0-3 per level) gate next Act (need 2★ avg)
- **XP** from stars + bonus for tactic variety + bonus for short deals
- **Reputation axes** (Assertive / Empathetic / Strategic / Principled) shift based on tactic usage. Your rep changes dialogue options in later Acts.
- **Daily Deal** — one community scenario everyone plays, leaderboard reset at midnight UTC
- **Streak** for daily play
- **Bestiary** (archetype trophy case)
- **Loadouts** (Pro): equip 3 of your favorite tactics as a pre-set

---

## 6. Share artifacts (viral engine)

**Win card**: "I saved €3,400 on a BMW against The Old-School Dealer in 6 turns. 3★"
**Fail card** (funnier): "I paid €2,000 OVER ASKING for a mattress. The Corporate Procurement Bot didn't even blink. 0★. Try to do worse: [link]"
**Daily Deal card**: "Daily Deal #012: closed at 94th percentile. Global rank #238/4,112."

All PNG, all with "Play this exact scenario →" button that deep-links to the level.

---

## 7. Monetization

| Tier | Price | Unlocks |
|------|-------|---------|
| Free | — | Acts 1-2 (9 levels), 1 Daily Deal/day, 3 base tactics |
| **Pro** | **€9 one-time** | All Acts (30 levels), full tactics palette, unlimited Daily Deals, replay-with-coach mode, loadouts |
| Pro+ | €29 one-time | Everything + "Real-Life Scenario" mode (paste your actual upcoming negotiation, get a tailored practice level + 1-page prep sheet) |

$100 target: **12 Pro sales** OR 4 Pro + 3 Pro+ → realistic.

---

## 8. Why this beats Pitch Pit (and Raise Me, and Founder's Week)

| Criterion | Close It | Pitch Pit | Raise Me | Founder's Week |
|-----------|----------|-----------|----------|----------------|
| Feels like a game | ★★★★★ | ★★★ | ★★★ | ★★★★ |
| Teaches repeatedly | ★★★★★ (30 levels) | ★★★ (repeat pitches) | ★★★★ | ★★★ |
| Progression/retention | ★★★★★ | ★★ | ★★ | ★★★ |
| Shareable | ★★★★ | ★★★★★ | ★★★★ | ★★★★ |
| Build in 48h | ★★★ | ★★★★ | ★★★★ | ★★ |
| Judge rubric lock-in | ★★★★★ | ★★★★ | ★★★★ | ★★★★ |

**Close It** scores highest on the 3 rubric-critical axes: *game design creativity*, *learning loop depth*, *simulation quality*. The tradeoff is build complexity — we address that below.

---

## 9. 48h Build Strategy (Close It version)

### Ruthless MVP scope
**Day 1 ship target (H0-H24)**:
- Acts 1 & 2 only (9 levels) — that's it for launch
- 5 archetypes (not 10)
- 6 tactics unlockable (not 12)
- One linear progression path
- Stars + Bestiary + Share card
- NO Daily Deal, NO Loadouts, NO Rep axes on day 1

**Day 2 (H24-H48)**:
- Push live, start user acquisition
- While launching, add Daily Deal mode (it's just one scenario per day, fetched from a table — adds virality)
- Ship Act 3 (3 more levels) as a "content drop" at H36 (makes for a great growth post)
- Add Pro+ Real-Life Scenario mode ONLY if we have time

### What we DO build Day 1
- Level-select "world map" screen (beautiful — this sells the game in screenshots)
- Turn-based chat UI with tactic buttons
- Patience + credibility meters (animated)
- Scorecard with stars + debrief
- Share PNG with `@vercel/og`
- Stripe Checkout for Pro

### What we DON'T build
- Voice input
- Free-text tactics parsing (tactics are buttons, always)
- Cross-level carry-over
- Branching dialogue trees (counterpart is just an LLM with system prompt + state)
- Multi-character scenes (always 1v1)
- Leaderboards outside Daily Deal

---

## 10. Stack (same as before, still tight)

- Next.js 14 + Tailwind + shadcn/ui + Framer Motion
- Supabase (anon session, email for Pro) — stores: users, level_progress, bestiary_unlocks, daily_deal_scores
- Claude Sonnet 4.6 (streaming for counterpart, non-stream JSON for judge)
- Stripe Checkout
- `@vercel/og` for share cards
- PostHog for funnel

---

## 11. Open decisions for Eduard

1. **Name**: "Close It" / "Deal Quest" / "Handshake" / "The Negotiator" / "Haggle" / something Romanian-flavored ("Târguiește")? My lean: **"Close It"** (bilingual, action-verb, memorable).
2. **Level 1 scenario** (the tutorial hook — this makes or breaks first impressions). Options:
   - a) Buy a used iPhone off Facebook Marketplace (universal, funny)
   - b) Haggle at a Romanian flea market (cultural, local hook)
   - c) Sell your old MacBook to a rude buyer (relatable to the tech crowd we're launching to)
   My lean: **(a)** — most universal, best for Twitter/Reddit audience.
3. **Art direction**: Clean/modern (dark + neon, Duolingo-ish mascot) vs retro-pixel (CRT, old-school "deal" aesthetic, more viral) vs corporate-parody (Linear-clean, screenshots look like real tools). My lean: **retro-pixel with modern UI underneath** — shareable screenshots look distinctive.
4. **Counterpart avatars**: generated portraits (Nanobanana — you already have it) or text-only? Portraits bump shareability 2x. My lean: **portraits**, budget 1h at hour 10.
5. **Tutorial archetype** (the one the user beats in Level 1): "Your Cousin Who Wants Your Old iPhone" — easy, funny, teaches Anchor + Mirror. Yes?
6. **Language**: English only for launch. RO version is a Day-2 post ("for my Romanian friends") if time permits.

Call these 6 and we're in code in 20 min.
