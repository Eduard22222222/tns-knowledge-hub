---
tags: [knowledge, content, clipping, operations]
created: 2026-07-15
updated: 2026-07-15
status: active
---

# Multi-Account Clip Distribution — Anti-Shadowban

The hardest, highest-risk half of the [[Clip Factory]]. Rendering 100 clips is trivial; keeping a
fleet of 20–30 posting accounts alive while pushing volume is the actual skill. Break these rules
and the **whole network dies in 24–48h.** (Machine copy: `clip-factory/config/accounts.md`.)

## The threat model
Platforms (TikTok hardest, then IG) kill clip farms via four signals:
1. **Content fingerprint** — same/near-same video across many accounts flags them all. Posting one
   creative to 20–50 accounts = guaranteed network shadowban in 24–48h.
2. **Device fingerprint** — many accounts on one phone/browser = one cluster; one ban cascades.
3. **IP / network** — many accounts on one IP = cluster.
4. **Behavioral** — 6 brand-new accounts created + posting the same day is itself spam.

## The four hard rules
1. **Never post the identical file twice.** Every post is uniquized (micro-crop, speed 0.98–1.02×,
   color shift, new first frame, re-encode, fresh metadata + caption + hook). Most important rule.
2. **One identity per account** — separate device/profile + IP (antidetect browser + mobile/
   residential proxy, or real phones). Defeats device/IP clustering.
3. **Warm up before monetizing** — new account browses/likes/follows for days, posts 1 native clip/
   day, ramps to 3–5/day only after ~a week.
4. **Stagger everything** — create accounts days apart, post at jittered human hours, 3–5 posts/
   account/day MAX. Never a robotic cron.

## Warm-up ladder (per account)
Day 0 create (own device+IP, fill profile) → Day 1–2 engage only → Day 3–4 one native clip/day →
Day 5–7 ramp to 2–3/day, watch reach → Day 8+ full rotation (3–5/day, always uniquized).

## Niche lanes
Give each account ONE lane (betting / gaming / podcast / finance / reactions) and keep it there —
the algorithm learns what to show based on what's posted. Mixing lanes tanks reach. RO lanes get
priority for Vieewzz.

## Posting
Stage clips with a `scheduled_for` time; publish via a multi-account scheduler (Postiz self-hosted
/ Metricool) or warmed-device posting. **Never** blind-loop-login to 30 accounts from one machine —
that's the cluster-ban trap.

## Shadowban detection & recovery
Watch `avg_views_last_10` per account; a sudden collapse to <100–200 views = suspected shadowban.
Rest the account, audit the trigger (non-uniquized clip? flagged audio/hashtag?). Recovery 1–2
weeks. Never fix it by spinning up more same-day accounts. Retire dead accounts — churn is a
budgeted cost.

## Scale plan
Phase 1: 3–6 warmed accounts, prove real views→earnings. Phase 2: add accounts only in paying
lanes. Phase 3: 20–30+ accounts once pipeline + posting is reliable → 100 posts/day becomes safe.

## Related
- [[Clip Factory]] — the operation
- [[Clipping Economy — Pay Per View Platforms]] — why we do this
- [[Viral Short-Form Editing Rules]] — the production half
