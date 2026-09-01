---
tags: [project, active, ai, content, clipping]
created: 2026-07-15
updated: 2026-07-15
status: active
---

# Clip Factory

Internal money-making machine: an AI clipping operation that turns long-form video (streamers,
podcasts, VODs) into short-form 9:16 clips, distributes them across a **channel army**, and earns
on **pay-per-view clipping campaigns**. Sits alongside [[Eduard AI Reels]] as a personal-brand /
internal revenue initiative under [[The Niche Society]].

Code + operating docs: `clip-factory/` on Desktop (own CLAUDE.md as the agent brain).

## The model in one line
Brands/streamers fund a pool and pay a **CPM** (per 1,000 verified views) for clips of their
content. We find the campaigns, AI-detect the viral moments, cut+caption+reframe, **uniquize** per
account, and post across a warmed fleet. Get paid per 1K views. See
[[Clipping Economy — Pay Per View Platforms]].

## Where the money is
- **ContentRewards / Whop** — CPM $0.30–$10/1K, 7–9% fee, $1.7M+ paid to 98k+ creators.
- **[[Clipping Economy — Pay Per View Platforms|Vieewzz]]** — **Romania-focused** pay-per-view
  (TikTok/IG/Shorts, no follower minimum). Priority — local, less saturated, fills the no-RO-
  Creator-Fund gap.
- ViewPaid ($1–5/1K), ClipAffiliates, Ssemble Clip Rewards — diversification.

## The three pillars
1. **Production** — yt-dlp → faster-whisper → LLM highlight scan → ffmpeg cut/reframe/caption.
   All local, no per-clip SaaS credits. Quality bar = [[Viral Short-Form Editing Rules]].
2. **Distribution** — the channel army. THE hard part. Governed by
   [[Multi-Account Clip Distribution — Anti-Shadowban]]. 3–5 posts/account/day, warmed accounts,
   per-account uniquization, staggered human-hour posting.
3. **Economics** — rank campaigns by EV/effort, learn true views/clip from a ledger, double down
   on what pays.

## Reality check (honest)
- "100 clips/day" = a **distribution** number (~15–30 distinct clips × 2–4 uniquized variants),
  not 100 unique edits.
- Bottleneck is **not** rendering — it's warmed accounts + safe posting. 100 posts/day ⇒ ~20–30
  accounts. Scale accounts, not renders.
- Posting identical files to many accounts = **network-wide shadowban in 24–48h**. Uniquization is
  mandatory, not optional.
- ToS-grey: the clipping campaigns themselves are legit/platform-run; multi-accounting is the risk
  we manage (warm-up + fingerprint separation), not one we pretend away.

## Status
- 2026-07-15 — Operation designed. Full operating docs + pipeline + anti-shadowban playbook written
  to `clip-factory/`. Rules mirrored to vault. **Next:** stand up the pipeline (install yt-dlp/
  faster-whisper/ffmpeg), open accounts on Vieewzz + Whop, run Phase 1 (3–6 warmed accounts, 1–2
  campaigns) to learn real views→earnings before scaling the fleet.

## Related
- [[Eduard AI Reels]] — sister content-production project (Higgsfield/Remotion pipeline)
- [[Viral Short-Form Editing Rules]] — the editing bible
- [[Clipping Economy — Pay Per View Platforms]] — the money map
- [[Multi-Account Clip Distribution — Anti-Shadowban]] — how the fleet survives
- [[Claude Skills Index]] — `remotion`, `videodb`, `higgsfield-*` skills feed this
