# Top 3 Concepts — Deep Dives

---

## CONCEPT A — "Pitch Pit" (Pitch to AI Sharks)

### The hook
*"You have 60 seconds. Pitch your startup to Thiel, Buffett, Mr. Wonderful, and a skeptical Gen-Z solo-GP. Survive."*

### Loop (3–5 min per play)
1. User enters idea (one-liner + problem + who pays)
2. 4 AI Sharks take turns interrogating (streamed LLM responses with distinct voice)
3. User answers each objection in one reply
4. Sharks vote: INVEST / PASS / SNAKE (lowball term sheet)
5. Scorecard: Clarity / Market / Unit Econ / Defensibility / Charisma + "roast line" per shark
6. Shareable card: "I got 3/4 Sharks with [idea]. Can you beat me? [link]"

### Business skill taught
Fundraising intuition, objection handling, articulating a market, unit economics under pressure.

### Monetization
- Free: 2 pitches / day, 2 shark personalities
- **Pro ($7 one-time or $5/mo)**: unlimited pitches, 8 sharks (add Zuck, Jobs, Sara Blakely, a grumpy Romanian LP), export a **generated deck** from your pitch, "Why you failed" post-mortem PDF
- **Pro+**: custom shark (paste a VC's tweets, we clone them) — $15

### 48h build
- Next.js + Vercel, Supabase for auth/usage tracking, Stripe Checkout, Claude Sonnet 4.6 for sharks
- 4 shark system prompts (tone, common objections, decision rubric)
- 1 judge prompt that outputs strict JSON scorecard
- Shareable OG-image scorecard (canvas → PNG)

### Viral loop
Scorecard PNG → Twitter/LinkedIn/IG story. "Pitch me" button on card lets friend try with same idea. Organic.

### Why judges love it
- Maps directly to "Strategy Simulation" sample direction
- Obvious learning outcome (pitch skill)
- Creative use of distinct AI personas
- Visibly engaging in a live demo

### Risk
Latency of 4 streamed responses feels slow. **Mitigation**: 2 sharks talk at once in split columns, parallel streams.

---

## CONCEPT B — "Raise Me" (Salary Negotiation Arena)

### The hook
*"Walk into the raise conversation. Your boss is one of 5 archetypes. You have 8 messages to land a number you're proud of."*

### Loop (4–6 min per play)
1. Pick scenario: Raise / Remote Work / Equity / Promotion / Counter-offer
2. Pick boss archetype (or random): Cheap Founder, Corporate HR, Empathetic Director, Private-Equity Grinder, First-Time Manager
3. 8-turn chat. Each turn you pick/write your message. Boss responds in character.
4. At turn 8 (or when boss gives final number) — result reveal
5. Scorecard: Anchor Strength / Justification / BATNA use / Tone / Final $ vs ceiling
6. Shareable: "I got a 23% raise from Corporate HR. You?"

### Business skill taught
Negotiation — the single most undertaught, highest-ROI soft skill. Everyone has a salary story.

### Monetization
- Free: 2 scenarios / week
- **Pro ($5/mo)**: unlimited, all archetypes, "replay with coaching" where AI highlights your 3 best & 3 worst moves, "real-world mode" (user uploads job offer, gets tailored negotiation plan)
- Pro+ ($19 one-time): "Negotiation dossier" — 6-page PDF plan for their actual upcoming convo

### 48h build
Simpler than A. Single chat UI. One LLM call per turn. Judge prompt at end.

### Viral loop
Everyone on LinkedIn has opinions about salary. Screenshots of the "23% raise" card → comments → traffic.

### Why judges love it
- Highest "so what" factor — literally changes people's income
- Clean product thinking (one mechanic, done well)
- Instantly defensible learning outcome

### Risk
Feels less like a "game" and more like a "tool". **Mitigation**: add a streak system, boss HP bar, and a "level" progression (your archetype unlocks after you beat 3 lower ones).

---

## CONCEPT C — "Founder's Week from Hell"

### The hook
*"7 days. 21 crises. You're the CEO. What would you actually do?"*

### Loop (12–15 min per play)
1. Pick startup archetype (D2C coffee / B2B SaaS / creator tool)
2. 7 "days", each with 3 events (PR hit, cofounder threat, CAC spike, acquisition offer, fundraise choice)
3. Each event = 60-second multiple-choice or free-text decision
4. Consequences stack (hiring wrong CTO in Day 1 means Day 5 has an outage)
5. End-of-week reel: valuation, headlines about your company, the 3 decisions that saved/killed you
6. Share: "My company went from $0 to $4.2M ARR in a week. Your turn."

### Business skill taught
Strategic prioritization, tradeoffs, sequencing — the core of being a founder.

### Monetization
- Free: 1 playthrough / week
- **Pro ($7/mo)**: unlimited playthroughs, 6 archetypes (vs 2 free), "hard mode" with cap table + burn tracking, exportable "founder CV"

### 48h build
Hardest of the three. Needs a state machine, branching content, and a big LLM prompt for the weekly reel.

### Viral loop
The weekly-reel artifact is gold. Fake headlines ("TechCrunch: Adumi's SaaS acquired for $312M") are wildly shareable.

### Why judges love it
- Most "game-like" of the three → scores hardest on Creativity in Game Design
- Deep simulation surface → scores highest on Learning Experience

### Risk
Content treadmill — 21 events × 3-4 outcomes each = lots to write. **Mitigation**: generate event content with Claude at authoring time, hand-curate the top 21.

---

## Shortlist matrix (48h reality check)

| Dimension | A: Pitch Pit | B: Raise Me | C: Founder's Week |
|-----------|--------------|-------------|-------------------|
| Time to first playable | ~8h | ~6h | ~14h |
| Shareable artifact quality | High (roast card) | Medium ($ card) | Very High (fake headlines reel) |
| Clearest monetization | Very clear | Very clear | Clear |
| Judge "wow" in 30s demo | Highest | High | Medium-High |
| Chance of 100 users in 24h | Very High | High | Medium |

**Recommendation in `03-Winner-Recommendation.md`.**
