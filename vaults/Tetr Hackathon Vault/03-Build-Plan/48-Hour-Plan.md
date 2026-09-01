# 48-Hour Build Plan (assumes Concept A: Pitch Pit)

## Stack (optimized for speed, not perfection)
- **Frontend**: Next.js 14 App Router + Tailwind + shadcn/ui (Vercel deploy)
- **LLM**: Anthropic Claude Sonnet 4.6 via streaming (fast + cheap + great at character voice)
- **DB/Auth**: Supabase (anon session by default, email magic link for Pro)
- **Payments**: Stripe Checkout (hosted, no PCI pain). $100 target = ~15 Pro sales at $7.
- **Share cards**: `@vercel/og` for PNG generation
- **Analytics**: PostHog (free tier) — we NEED funnel data for the pitch
- **Domain**: grab a .fun or .app for $10 (pitchpit.fun / getpitched.app / sharkpit.app)

## Hour-by-hour

### Phase 0 — Setup (H0–H2, 2h)
- [ ] Repo, Vercel, Supabase, Stripe test mode, domain
- [ ] Auth scaffold (anon + upgrade-to-email)
- [ ] Tailwind + shadcn
- [ ] Env vars for Claude API key, Stripe, Supabase
- [ ] PostHog snippet

### Phase 1 — Core Loop (H2–H10, 8h)
- [ ] "Enter your pitch" page (one input, big CTA, nothing else)
- [ ] 4 shark panels on a results page, stream in parallel using `AbortController` + Claude streaming
- [ ] Per-shark system prompts (see `Shark-Prompts.md`) with strict tone rules
- [ ] User reply UI (one textarea, 3 rounds)
- [ ] Scorecard call after round 3 — Claude call that outputs JSON (clarity, market, economics, defensibility, charisma) + 1 roast line per shark + INVEST/PASS/SNAKE vote
- [ ] Render scorecard

### Phase 2 — Shareable Output (H10–H14, 4h)
- [ ] `@vercel/og` template for scorecard PNG (dark, "Pit" branded, 4 avatars, big verdict)
- [ ] `/share/[id]` page that renders the pitch + verdict publicly
- [ ] "Share card" + "Challenge a friend with this pitch" buttons
- [ ] OpenGraph + Twitter card meta tags on share URLs (CRITICAL for virality)

### Phase 3 — Paywall (H14–H18, 4h)
- [ ] Free tier: 2 pitches / day / IP. Middleware counter in Supabase.
- [ ] Stripe Checkout → Supabase `is_pro` flag
- [ ] Pro unlocks: 4 extra sharks (Zuck, Jobs, Sara Blakely, Grumpy RO LP), unlimited pitches, "post-mortem PDF" export
- [ ] Upgrade page with 3 clean tiers

### Phase 4 — Polish + Content (H18–H26, 8h)
- [ ] Tune shark prompts with 20+ test pitches (this is the whole product — don't skimp)
- [ ] Animate shark panels (Framer Motion, slide-in)
- [ ] Loading states, error states, mobile responsiveness
- [ ] Onboarding: example pitch placeholder so empty-state isn't scary
- [ ] Rate limiting (Upstash or Supabase edge function)
- [ ] Legal: TOS + Privacy (use a template generator)

### Phase 5 — Buffer + Bug Hunt (H26–H30, 4h)
- [ ] Invite 5 friends to break it
- [ ] Fix 3 worst bugs
- [ ] Record 30s demo video for judges
- [ ] Write 3 versions of the launch post (Twitter/LinkedIn/Reddit)

### Phase 6 — LAUNCH (H30–H47, 17h) — see `04-GTM-Launch/`
- Post to Twitter, LinkedIn, Reddit (3 subs), Indie Hackers, Product Hunt (schedule), Hacker News (Show HN)
- DM 30 founder friends
- Romanian founder groups on Telegram/WhatsApp
- Seed the first 20 scorecards from our own pitches (to prime the share-graph)

### Phase 7 — Submit (H47–H48, 1h)
- Video, deck, repo link, live URL, metrics snapshot (users + $)

## What we explicitly DON'T build
- Voice input (nice, but cuts 4h)
- User accounts beyond magic link (no passwords, no profiles)
- "Your history" page (stretch goal)
- A/B testing framework (we ship one copy)
- The hybrid "Sharks' Week" mode (strictly stretch)
- Custom investor / paste-tweets feature (post-hackathon monetization hook)

## Team roles (if solo, Claude = pair programmer)
- **Builder** (you): Next.js + Supabase + Stripe + prompt engineering
- **Content/QA**: shark voice tuning, test pitches, copy
- **GTM**: the moment code is in phase 3, start warming the launch channels

## Kill switches (when to pivot, not persist)
- By H10, if parallel streaming is ugly → fallback to sequential shark replies (still fine)
- By H18, if Stripe is blocked in Romania for new account → use Lemon Squeezy as backup
- By H26, if virality is clearly weak in test → pivot share card to a *video* (Remotion is already in your skill set from eduard-reel pipeline)
