---
tags: [knowledge, content, video, clipping]
created: 2026-07-15
updated: 2026-07-15
status: active
---

# Viral Short-Form Editing Rules

The quality bar for any short-form clip (TikTok / Reels / Shorts). Used two ways in the
[[Clip Factory]]: as the rubric the AI uses to *find* moments, and as the checklist QC uses to
*approve* them. A clip that renders correctly but breaks these does not ship. (Canonical machine
copy lives in `clip-factory/rules/creative-editing-rules.md` — keep them in sync.)

## The one law: win seconds 0–2
Most drop-off happens in the first 0–3 seconds; the "decide to stay" window is ~1.5–3s. So:
- Hook stated/shown **instantly** in frame 1 — cut INTO the moment, never the run-up.
- **Pattern interrupt** in the first second (hard cut, snap-zoom, whip-pan, visual mismatch).
- First **caption on screen at 0:00** — 85% watch muted, so the caption IS the hook.
- No slow intros, no logos, no "hey guys", no dissolves in the first 5s.

## Virality rubric — what makes a moment (score 0–100)
Reward moments that are **self-contained** and hit one of: hook/open-loop, emotional peak
(laugh/shock/awe), opinion bomb (contrarian claim), revelation (secret/number/twist), conflict,
quotable line, story peak (the turn, not the setup), or high practical value (save-bait). Penalize
anything needing setup. Keep ≥70.

## Structure
`0:00–0:02 HOOK → payoff (escalate, don't wander) → last 1–2s button/cliffhanger/loop`
- Length **15–30s** (algorithm favors ~20–25s). No dead air; cut every flat waveform spot.
- **One idea per clip** — two moments = two clips.

## Pacing
- **Cut every 2–4s**; never hold a shot >3 sentences (micro-resets refresh attention).
- Alternate shot sizes; use punch-in zooms even on a single talking head.
- **Purposeful effects only** — 2026 is minimalist; over-editing *hurts* retention.

## Caption style (house)
≤7 words on screen (ideally 3–5), bold + high-contrast (white on black stroke), **word-by-word
karaoke highlight**, placed in the safe zone (out of the top ~15% / bottom ~20% UI danger zones),
timed to whisper word timestamps, on screen from 0:00.

## Framing & audio
9:16 1080×1920, subject in safe zone, never crop the top of a head, speaker-tracked crop for
talking heads, loudness normalized, required campaign audio present if mandated.

## Localize
For [[Clip Factory]] RO lanes (Vieewzz), write hooks/captions in natural Romanian, not translated
English. See the hooks library in `clip-factory/rules/hooks-library.md`.

## Learn from wins
The rubric is a starting prior; the ledger is the truth. When a clip overperforms, log why (hook
type, moment type, length) and bias future scoring toward it.

## Related
- [[Clip Factory]] — the operation this bible powers
- [[Multi-Account Clip Distribution — Anti-Shadowban]] — the other half (distribution)
- [[Eduard AI Reels]] — sister project, same retention principles apply
