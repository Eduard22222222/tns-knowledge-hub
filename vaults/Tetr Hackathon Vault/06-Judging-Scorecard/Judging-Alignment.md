# Judging Criteria Alignment

How Pitch Pit maps to each of the 5 criteria, with receipts for the submission deck.

## 1. Problem Relevance & Clarity
- **Problem**: People with startup ideas have no safe, iterative, realistic environment to pitch. The feedback they get is from friends (too kind) or real VCs (too rare and punishing).
- **Evidence**: Reddit r/Entrepreneur (~4.7M), endless "roast my pitch" threads, Shark Tank is a global IP with 20+ seasons. Pitch coaching is a $500+/hr consulting product we're democratizing to $9.
- **Receipts for deck**: screenshots of Reddit threads + a one-paragraph synthesis.

## 2. Product Thinking & UX
- **Anti-pattern avoided**: We do NOT make users sign up before playing. One-click to pitch.
- **Pattern used**: Pre-filled placeholder pitches reduce cold-start anxiety.
- **Loop completion target**: 60%+ of starters finish. (Measured in PostHog.)
- **Receipts for deck**: funnel screenshot from PostHog.

## 3. Quality of Simulation & Learning Experience
- **Mechanic**: LLM-judged objections from 4 distinct investor archetypes, each with clear decision rubrics.
- **Learning loop**: pitch → objection → answer → scored outcome → roast line that explains *why*.
- **Progression**: free → Pro unlocks harder sharks → "Custom shark" unlocks coaching on a specific investor.
- **Receipts for deck**: one annotated scorecard showing *what* a user learned, concretely.

## 4. Creativity in Game Design
- **Novel**: AI-as-opponent with strong character voices is still rare. Most "business sims" are spreadsheet games with a UI skin.
- **Shareable-as-game-mechanic**: the roast card isn't just marketing, it IS the game's terminal state. Sharing a loss is half the fun (cf. Wordle's green/yellow grid).
- **Progression surprise**: after 3 good pitches, sharks "remember" you with a callback line. Small but magic. (Stretch feature if H allows.)
- **Receipts for deck**: side-by-side of a boring "biz sim" screenshot vs. our roast card.

## 5. Impact on User Understanding of Business
- **Before/after**: we can collect a 1-question pre-play poll ("how confident are you pitching?") and a 1-question post-play poll. Difference = impact story.
- **Skill transfer**: the scorecard rubric (Clarity / Market / Unit Econ / Defensibility / Charisma) mirrors a real VC memo. Users internalize the *shape* of investor thinking.
- **Receipts for deck**: scatterplot of pre vs post confidence (even with n=30 is compelling).

## Bonus judge-pleasers
- **Metrics over vibes**: every milestone backed by a screenshot (user count, $ count, completion rate).
- **Post-mortem honesty**: include a "what we cut and why" slide. Judges read maturity into it.
- **30s demo video**: start with a dramatic pitch, end with a brutal roast card. No narration over the product — let the UX speak.

## Deck outline (10 slides)
1. Title + one-liner + live URL
2. Problem (Reddit screenshots)
3. Insight (LLMs are finally good enough to be *in-character* under pressure)
4. Product demo (30s video embedded + GIF)
5. How it teaches business (scorecard + rubric maps to VC memo)
6. Milestones 1-4 with receipts
7. Metrics (funnel, K-factor, revenue)
8. What we cut
9. What's next (Custom Shark, Deck Generator, "Sharks' Week" mode)
10. Team + thanks
