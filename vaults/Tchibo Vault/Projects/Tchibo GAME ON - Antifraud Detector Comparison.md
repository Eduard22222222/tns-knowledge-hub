---
tags: [tchibo, campaign, antifraud, research, detectors]
created: 2026-05-28
---

# Antifraud detectors — pros/cons comparison (GAME ON campaign)

Context: receipt-upload promo. Dominant fraud = **duplicate receipts + photoshopped totals/dates**, NOT AI-generated receipts. So highest-ROI = dedup + tamper, not exotic AI-gen models.

## Candidates evaluated (real GitHub metadata)

| Repo | Lang | Stars | License | Updated | Verdict |
|---|---|---|---|---|---|
| `esimov/forensic` | Go | 145 | **MIT ✅** | 2026-04 | Copy-move forgery, mature, licensed — but Go (needs microservice) |
| `zhipeixu/FakeShield` | Python | 604 | **Apache-2.0 ✅** | 2026-05 | SOTA explainable forgery (MLLM) — heavy, GPU, overkill |
| `rahulpmishra/document-forgery-detection` | Python | 2 | ❌ none | 2026-04 | ELA+CNN on docs — right idea, but no license, tiny, Python |
| `gizemnurbektas/CNN-Based-Receipt-Fraud-Detection` | Jupyter | 0 | ❌ none | 2025-12 | Student notebook, unusable as dependency |
| `kylemollinet/ExpenseProtectPoC` | JS | 0 | ❌ none | 2026-03 | JS receipt-fraud PoC — interesting but no license, unproven |
| `HassaniAtefe/ai-or-not` | Jupyter | 8 | ❌ none | 2024-05 | AI-gen notebook, stale, no license |
| `abhiisonu/TrueLens` | HTML | 1 | ❌ none | 2026-04 | Small AI-gen UI demo, no license |
| HF `Organika/sdxl-detector` | model | — | usable via API | — | AI-gen detector, callable via HF Inference API ⭐ |

## Per-option pros/cons

### In-house (pHash dedup + ELA + EXIF) — NO repo dependency
- ✅ Catches the *actual* fraud here (duplicates, edited receipts)
- ✅ Free, runs in-browser (JS/canvas/exifr), zero hosting, zero license risk
- ✅ Full control, auditable, fits Supabase + React directly
- ✅ Instant — no model loading
- ❌ Not "AI" branded; ELA is a heuristic (flags, not proof)

### `esimov/forensic` (MIT, Go)
- ✅ Proper MIT license (reusable commercially), 145★, maintained
- ✅ Real copy-move forgery detection (catches cloned regions in edited receipts)
- ❌ Go → needs a separate microservice (can't run in browser / Supabase Edge Deno)
- ❌ Adds infra + cost for a marginal gain over ELA on this budget

### `zhipeixu/FakeShield` (Apache-2.0, Python)
- ✅ SOTA, explainable, 604★, ICLR 2025 — great for *credibility/citation*
- ✅ Properly licensed
- ❌ Multi-modal LLM → GPU hosting, slow, expensive — not viable on €800/5wk
- ❌ Massive overkill for receipt promo

### HF `Organika/sdxl-detector` via Inference API
- ✅ Real AI-gen detection without self-hosting (just an API call)
- ✅ Free tier; no GPU; plugs in as a flag → human review
- ✅ Usable now with a free HF token
- ❌ Reliability moderate on compressed/real photos (flag, not verdict — stated honestly)
- ❌ External dependency / rate limits on free tier

### No-license student repos (gizemnurbektas, rahulpmishra, ai-or-not, TrueLens, ExpenseProtectPoC)
- ✅ Useful as *reference* for approach (esp. rahulpmishra's ELA workflow)
- ❌ **No license = cannot legally reuse code in a paid client deliverable** (decisive)
- ❌ Tiny/unmaintained/unproven

## ✅ RECOMMENDATION

**Layered, JS-first, license-clean:**
1. **In-house pHash + ELA + EXIF + velocity** = the workhorse (free, in-browser, no license risk, catches real fraud). Inspired by `rahulpmishra`'s ELA workflow but written by us (clean IP).
2. **AI-gen flag via HF `Organika/sdxl-detector` Inference API** (free tier, flag→human review) — gives a real "AI image detector" in the pitch without GPU hosting.
3. **Tender credibility:** cite `FakeShield` (Apache-2.0) + `esimov/forensic` (MIT) as the documented upgrade path / optional deep-forensics layer for higher budgets.

**Avoid:** self-hosting any PyTorch research model, and reusing any no-license repo code (legal risk).

Net: ~$0 recurring (HF free tier), fully demoable, legally clean, and honest about what's deterministic vs. probabilistic.
