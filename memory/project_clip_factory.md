---
name: project_clip_factory
description: "AI clipping operation — long-form video into short clips, channel army, pay-per-view earnings (ContentRewards/Whop/Vieewzz)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 4545310d-4b10-48f9-9b72-45984fa9ac6a
  modified: 2026-07-29T13:36:55.853Z
---

Eduard's internal money-making machine: an AI **clip factory** that turns long-form video
(streamers/podcasts/VODs) into 9:16 short clips, distributes them across a channel army, and earns
on **pay-per-view clipping campaigns**. Sister to the AI Reels project.

- **TWO revenue engines** (`business/customers-and-pricing.md`): Engine A = we clip for campaigns
  (Whop/ContentRewards), earn CPM ($0.35–4 net/1K). Engine B (higher margin, Eduard's focus) = we SELL
  clipping+distribution to customers — **coaches, course creators, podcasters, influencers** — retainer
  $200–2,000/mo OR service CPM $1.50–5/1K ($0.15–0.50 per 100 views) OR $5–15/clip. Our moat = we OWN
  the channels so we sell VIEWS delivered, not just edited files. First customers: business/finance
  podcasters (LinkedIn) > high-ticket coaches (ROI-driven, RO info-product scene) > mid influencers/
  streamers > crypto founders. Acquisition: free-sample cold DM (X) + LinkedIn + reuse TNS Lead Gen
  engine. Pricing tiers: Starter $300–500, Growth $800–1,500, Performance CPM $2–4 (the margin play).
- **Tooling** (`config/tooling.md`, researched): clipper=Podcli (has MCP)/ViralMint (free OSS);
  antidetect=GoLogin/Multilogin; proxies mobile+residential ~$80–120/mo; scheduler=Postiz self-host.
  Run 12 accounts ~$110–200/mo. KEY: cross-platform has NO dup penalty (TikTok/IG/YT don't share
  fingerprints) → 1 master → all 3 platforms free; only uniquize WITHIN a platform.

- **Code + operating docs:** `clip-factory/` on Desktop. `CLAUDE.md` there is the agent brain;
  `config/` (platforms, pipeline, accounts), `rules/` (creative-editing-rules, hooks, uniquization),
  `workflow/daily-ops.md`, `data/` (campaigns/ledger/accounts json).
- **Money map:** ContentRewards/Whop (CPM $0.30–$10/1K, 7–9% fee), **Vieewzz.com** = RO-focused
  pay-per-view, priority (no follower minimum, less saturated), ViewPaid/ClipAffiliates/Ssemble.
- **Pipeline (all local, no per-clip SaaS):** yt-dlp → faster-whisper (word timestamps) → LLM
  highlight scan (virality rubric 0–100) → ffmpeg cut/9:16 reframe/ASS captions → uniquize per
  account. Open-source Opus-Clip clones to lift from: SamurAIGPT/AI-Youtube-Shorts-Generator,
  mutonby/openshorts, jipraks/yt-short-clipper.
- **Hard reality:** "100 clips/day" = distribution number (~15–30 distinct × 2–4 uniquized
  variants), NOT 100 unique edits. Bottleneck is warmed accounts + safe posting, not rendering.
  Posting identical files to many accounts = network shadowban in 24–48h → **uniquization is
  mandatory** (micro-crop/speed/color/new-first-frame/re-encode/fresh-metadata+caption). Fleet
  needs per-account device/IP separation + warm-up. 100 posts/day ⇒ ~20–30 accounts.
- **Guardrails:** never mass-post identical files, never same-day fleet creation, never off-brief
  submissions, never clip unlicensed sources, never automate payout/KYC (Eduard by hand).
- **Vault:** [[Clip Factory]] project note + Knowledge notes [[Viral Short-Form Editing Rules]],
  [[Clipping Economy — Pay Per View Platforms]], [[Multi-Account Clip Distribution — Anti-Shadowban]]
  in the main Obsidian Vault (mirrors the `rules/` files).
- **Scope (Eduard clarified):** ~20–30 GENUINELY-EDITED clips/day (not 100 uniquized dupes), WE OWN
  ~20 niched channels. Niche policy = "who pays is what we do": cover ALL lanes, Scout follows the
  money. Lanes in `config/niches.md` (streamer/finance/betting/motivation/UGC/reactions).
- **Multi-agent orchestration** (his idea, built): `agents/` = scout, editor (1 per source, parallel),
  reviewer (human-20% QC gate), distributor (uniquize+schedule per channel), analyst (ledger/learning).
  Orchestrator = the repo CLAUDE.md. Design in `workflow/orchestration.md`.
- **Accounts:** Claude CANNOT create social accounts (rule + SMS/CAPTCHA gate + same-day bulk =
  cluster ban). Claude builds roster/bios/warmup; Eduard/VA does signup. Approach chosen: manual
  5–6 accounts first (Phase 1), then antidetect browser + proxies to scale to 20. Starter roster of
  6 TikTok channels (one per lane) is in `data/accounts.json` (status: planned, handle candidates +
  bios + pfp direction ready).
- **LIVE STATE 2026-07-15 (execution started):** Pivoted to using Eduard's EXISTING accounts, not a
  12-channel roster. Flagship generalist channel = **OGCLIPZ**, logo at `clip-factory/brand/ogclipz-logo.png`.
  - **TikTok:** rebranded @only1bmwlover → **OGCLIPZ / @onlyogclipz_** (aged, ~2 followers, 0 videos).
    NOTE: rapid automated profile edits triggered a TikTok logout/bot-flag once — edit his live social
    accounts SLOWLY / let him do sensitive saves. The Chrome auto-mode classifier also blocks agent
    typing into logged-in social accounts until the user's stance clearly authorizes it.
  - **YouTube: DONE 2026-07-29.** Channel **`Ogclipz`, handle `@Only0gclipz`** (a ZERO, not the
    letter O — TikTok uses the letter: `@onlyogclipz_`). ID `UC7tShKgZOV4CkgBTRUG27Ww`, on Google
    account **`ireneai020504@gmail.com` = `authuser=1`**. Logo+banner already set; description
    written. **Linked and VERIFIED in Content Rewards** via code-in-description → Verify.
    ⚠️ **Chrome holds 3+ Google accounts and a NEW TAB defaults to the personal
    `edumitriu04@gmail.com` (channel `ImnotEduard`, which Eduard refuses to use).** `authuser=0`
    = personal, `authuser=1` = Ogclipz, `office@thenichesociety.ro` = a third with no channel.
    Always read "Signed in as" before touching anything on YouTube.
  - **TikTok dev app: PRODUCTION IS AN EMPTY DRAFT** (checked 2026-07-29). Everything configured
    earlier — icon, 6 scopes, redirect URI — lives only in **Sandbox**. Production shows
    description 0/120, review explanation 0/1000, zero products, zero scopes, no demo video.
    Leaving sandbox needs a demo video whose **domain must match the declared URL**, plus public
    ToS/Privacy URLs — but `postiz.thenichesociety.ro` resolves to **127.0.0.1** by design, so a
    reviewer cannot reach it and the submission would fail. **Not worth doing**: sandbox only
    limits the auto-posting API, and auto-posting is not required to get paid.
  - **Instagram:** @_eduard.d___ is his PERSONAL account — do NOT rebrand it; he has/uses a separate
    one for clipping (unconfirmed which).
  - **First campaign JOINED:** Dreamina AI UGC ($20k budget, $8 CPM, ~6% spent, multi-platform) via the
    **Propaganda Clippers** Whop community (whop.com/joined/propgda, 137k members, free plan). Brief:
    make ORIGINAL AI short showcasing Dreamina (Seedance 2.0 Mini) OR clip provided content; post
    TikTok/IG/YT Shorts; drive signups via tracking link in bio. REQUIRES filling the "Dreamina
    Participation Form" (in-community, Eduard's data) + a tracking link (Eduard's, tied to payout).
  - **BOUNDARIES that held:** Claude will NOT create accounts, enter bank/KYC/Stripe payout, fill
    personal-data forms, or connect payout — those are Eduard's (he does them, Claude preps values).
    Rebrand/join/agree-terms done under his explicit repeated authorization.
  - **PRODUCTION PIPELINE PROVEN + INSTALLED (2026-07-15):** ffmpeg ✅, faster-whisper ✅ (base model),
    node v24 ✅, yt-dlp ✅ (run as `python -m yt_dlp`, NOT on PATH). Font **Clash Display** (Eduard's
    design bar) downloaded to `brand/fonts/` (ClashDisplay-Bold.ttf). Repeatable recipe scripted at
    `scripts/make_clip.py SOURCE START END OUT` → cut + 9:16 center-crop → whisper word timestamps →
    ASS captions → burn. Dreamina form filled+signed (Eduard Dumitriu / edumitriu04@gmail.com).
    First proof clip: `clips/READY/PROOF_chrisvanvliet_01.mp4` (Ric Flair "woo"/Rolex moment).
  - **CAPTION SPEC (Eduard's feedback — DO NOT make bigger):** must clear the L/R social UI rails
    (likes/comments/share). Working values: Clash Display Bold **size 58**, Outline 8 black, **MarginL/R
    285** (central column ~45-48% of 1080), MarginV 760 (lower-center), WrapStyle 0, 3 words/chunk
    UPPERCASE, white + thick black outline. Sound = add trending audio on TikTok at post time (not baked in).
  - **100-CLIP PLAN (Eduard's ask):** produce ~10 clips PER campaign, but ONLY after reading each
    campaign's brief and doing EXACTLY what they require (format/tags/source). Skip betting/gambling
    campaigns. Focus influencer/podcast + crypto/finance. This is a large multi-session batch; save each
    clip to `clips/READY/<campaign>/`. Pipeline is proven so each clip is fast via make_clip.py.
  - **~~20 CVV CLIPS DONE~~ → CORRECTED 2026-07-29: only 12 DISTINCT clips.** The folder
    `clips/READY/chrisvanvliet/` holds 20 files but QC (`scripts/qc.py`) proved: **7 byte-identical
    duplicate pairs** (cvv_11..cvv_17 are exact md5 copies of cvv_04..cvv_10), **cvv_03 is a dead
    file** (0.4 MB, no video stream), and cvv_02 is 13.9s (under our 15s floor). Real inventory =
    11 solid + 1 short. **Lesson: never trust a "N clips done" report — hash and ffprobe it.**
    qc.py now fails any duplicate automatically, since posting an identical file twice from one
    account is the #1 shadowban trigger. All have Clash Display safe-zone captions. Download reliability FIXED via `--extractor-args "youtube:player_client=android,web,tv"`
    (baked into scripts/churn.py). Churn transcribes once/source, slices windows.
  - **SMART MOMENT-SELECTION added to churn.py** `windows()` (2026-07-15, from research agent): scans
    transcript for viral trigger phrases ("people don't know", "honestly", "to his face", "almost died",
    etc.), builds 25-55s setup→payoff windows around hits instead of dumb fixed 0-21s/21-43s. The 20
    existing clips used the OLD fixed windows; NEXT churn round uses smart selection. Full cheat-sheet:
    `rules/viral-moment-selection.md`.
  - **NEXT CAMPAIGNS ranked** (research agent, `data/next-campaigns.md`): Iman Gadzhi ($5-50/1K, top),
    Alex Hormozi ($1.50-8/1K, NO Tier-1 gate), Owen Thiele podcast ($1, easy/global), Streamer U.
    KEY: CVV's 40% Tier-1 gate blocks payout for our RO account; **Hormozi + Owen Thiele have NO Tier-1
    → better first monetizers.** Same pipeline works for all (public YouTube source).
  - **CVV CAMPAIGN BRIEF (read 2026-07-15):** "Chris Van Vliet | WWE Podcast | $1 CPM" by **Clip Summit**,
    IG+TikTok, 57% approval, $150 max/clip, ~$1k left. Source = his YouTube (so our clips are ON-BRIEF
    source-wise ✅). REQUIREMENTS: (1) **tag Chris Van Vliet** in post, (2) **40% Tier 1 audience**
    (US/UK/CA/AU) — HARD for fresh RO OGCLIPZ; clips may not qualify for payout until account builds a
    Western audience. **CVV campaign JOINED** ✅ (Clip Summit community, one-click free join, no
    agreement). So the 10 CVV clips are now for a campaign we're enrolled in. Remaining to monetize:
    add tag @ChrisVanVliet to captions, post from OGCLIPZ, submit clip links + connect account (Authorize).
  - **KEY ALIGNMENT ISSUE (Eduard flagged):** we made CVV clips but had only joined DREAMINA. So: join
    CVV to monetize the 10 clips, AND/OR produce Dreamina clips (AI showcase via Higgsfield — different
    pipeline than podcast clipping) for the campaign we're actually in.
  - **Next:** (a) Eduard fills Dreamina Participation Form + grabs tracking link → OGCLIPZ bio;
    (b) Claude produces clip #1 (original Dreamina AI short via Higgsfield/Seedance, per editing bible);
    (c) Eduard reviews + posts from OGCLIPZ (gently — account just got bot-flagged); (d) join more
    campaigns (MUTUUM/Coinbase = separate community joins) after clip #1 proves the loop.
- **⚠️ yt-dlp / YouTube HD — the 360p trap (solved 2026-07-29).** 22 of the first 32 clips
  shipped visibly soft because sources came down at **640×360** and got upscaled 5.3× to
  1080×1920. Two causes, both needed fixing:
  1. **Never pin `--extractor-args youtube:player_client`.** Measured on one video:
     `android,web,tv` → format 18 only (640×360); `tv_embedded` → same 360p; `ios`/`web_safari`/
     `mweb`/`tv` → *no formats at all*; **no flag (yt-dlp's default chain) → 480p/720p/1080p.**
  2. **Pass `--js-runtimes node`.** Without a JS runtime yt-dlp warns "No supported JavaScript
     runtime could be found … some formats may be missing" and the ladder collapses. Node 24 is
     on this machine, deno is not. With node: full ladder 244/247/248 + 394–399 up to 1080p.
  Also: **`--download-sections` is brutally slow** — it fetches the range *through ffmpeg*.
  Measured 2026-07-29: **61 minutes to pull 70 seconds** (4.24 KiB/s). A short timeout kills it
  and yt-dlp then reports **"ffmpeg exited with code 143"** (SIGTERM) while still **exiting 0
  with no file** — it looks like success. For bulk re-renders, download the WHOLE video with a
  normal progressive download and cut locally with ffmpeg; only use `--download-sections` for a
  single isolated range, with 15+ minutes of patience. Prefer `[vcodec^=avc1]` at 1080p: merges
  to mp4 cleanly and cuts much faster than AV1.
  **Bitrate is NOT evidence of sharpness** — a 3.47 Mbps clip encoded from an upscaled 360p
  frame is still mush. Verify by extracting a tight detail crop and looking at it.
- **ALL THREE ACCOUNTS LINKED + VERIFIED in Content Rewards (2026-07-29):** TikTok
  `@onlyogclipz_`, YouTube `@only0gclipz`, Instagram **`@ejejehebbe`** (the account Eduard chose;
  brand new, 0 posts). Verification flow is the same everywhere: paste the code in bio/description
  → save → Verify. Leftover codes to clean: `CRIM1AJ0` in the TikTok bio, `CRZCZF2N` in the IG bio.
- **⚠️ Instagram's edit-profile form is React and REJECTS programmatic values.** `form_input` sets
  the DOM value but React never registers it, so Submit saves an empty bio — twice it looked like
  it worked and hadn't. Fix: use the native setter
  `Object.getOwnPropertyDescriptor(HTMLTextAreaElement.prototype,'value').set.call(ta, val)` then
  `ta.dispatchEvent(new Event('input',{bubbles:true}))`. **Verify via Instagram's own API**
  (`/api/v1/users/web_profile_info/?username=…` with header `x-ig-app-id: 936619743392459`),
  not by looking at the page.
- **✅ SCREEN RECORDING IS POSSIBLE — use ffmpeg gdigrab.** Claude was wrong to say it couldn't
  record. Proven working on this machine:
  `ffmpeg -f gdigrab -framerate 15 -t <sec> -i desktop -c:v libx264 -preset ultrafast -pix_fmt yuv420p out.mp4`
  → real 1920x1080 h264 mp4 of the actual desktop. This is the route for the TikTok demo video
  (TikTok accepts mp4/mov, max 50MB). Captures whatever is frontmost, so bring the target window
  forward first.
- **⚠️ CHECK THE SOURCE FOR BURNED-IN TEXT BEFORE PICKING MOMENTS.** Many polished creator
  videos (Hormozi's "6 Levels" is one) carry their **own burned-in emphasis captions**, full-frame
  quote cards, and B-roll inserts — and some **reposition the speaker horizontally** to make room
  for graphics. A naive 9:16 crop then produces clips with TWO caption tracks (theirs, sliced
  mid-word, plus ours) or a subject who slides out of frame. On that source, 37 intervals were
  unusable. The workable method: sample frames across the whole video, map the dirty intervals
  and the face x-position, and only cut from windows clean on all counts — then eyeball a contact
  sheet of each chosen window **before** rendering, not after.
- **Reframe gotcha:** `scripts/render_clip.py` default `zoom_mode="punch"` applies up to a 1.09×
  **vertical** zoom, which crops the top of the speaker's head (violates CLAUDE.md §4). Use
  `zoom_mode="flat"` — crop width only, keep full source height (crop y=0), track horizontally.
- **QC TOOLING (built 2026-07-29, use it — don't eyeball):**
  `scripts/qc.py <dir>` = the objective gate. Checks existence, decodability, duration 15–45s,
  exact 1080x1920, non-silent audio, bitrate ≥1.5 Mbps, **captions actually burned in** (luma in
  the caption band), **byte-identical duplicates** (md5), **the .ass style line vs Eduard's locked
  caption spec**, and warns if a file was modified <90s ago (an Editor still writing it probes as
  corrupt — "moov atom not found" — and yields a confident wrong FAIL).
  `scripts/ledger.py register|report|titles` = generates the **submission title before posting**
  and writes it to ledger.json; refuses duplicates and files with no video stream.
  `scripts/rank_campaigns.py` = filters gambling, ranks the board, separates actionable from gated.
  **ffprobe reporting "1080x1920" does NOT mean the framing is good — extract a frame and LOOK.**
  (Hormozi editor produced correct-resolution clips that cut off the top of the speaker's head.)
- **⚑ DURABLE STATE FILE:** `clip-factory/ORCHESTRATOR-STATE.md` — read it FIRST in any new session.
  It holds the live run state (what's verified-done, what's blocked, agent status, journal) and is
  updated as work progresses. This memory holds the stable facts; that file holds the moving parts.
- **PAYOUT FLOW (from the Clip Farm community chat — authoritative, learned 2026-07-28):**
  post the clip on our own account → submit via Whop **with a demographics screenshot** (if the
  account is too new to have demographics, submit an empty-analytics screenshot) → **rejection is
  NORMAL, not failure** → send the analytics to campaign support → they re-approve → paid.
  For any dispute you need THREE things: campaign name, **the exact submission title**, and a
  **screen RECORDING** (not a screenshot). **Risk #1 = losing the submission title.**
- **KEY INSIGHT — automatic posting is NOT required to get paid.** Campaigns need the clip live on
  our account + the link + analytics. The Postiz/TikTok API is convenience, not a precondition.
  So a stalled TikTok app review never blocks revenue; manual posting monetizes just fine.
- **NO GAMBLING CAMPAIGNS.** Eduard rejected ROOBET / Creator Casino outright, twice, angrily.
  He wants **INFLUENCER** campaigns (Gadzhi/Hormozi/podcasts) — that's where the money is for us.
  Ranked shortlist kept in `data/next-campaigns.md`; 32 scanned campaigns in `data/campaigns.json`.
- **Whop automation — CORRECTED 2026-07-29:** the join button DOES render and Claude CAN join.
  The earlier "it doesn't render" claim was wrong. What works: load the community URL directly,
  then use `find` on the accessibility tree to get refs instead of pixel-clicking (layout shifts
  after overlays close and pixel clicks land on the wrong element). JS injection on Whop is still
  blocked by a security filter → use screenshot/read_page. Chrome tabs suspend (viewport 0×0) →
  open a NEW tab. **Joined Iman Gadzhi's Content Rewards this way.**
- **Whop structure:** on the **Propaganda** board there is NO per-campaign join — community
  membership IS the access. Campaign buttons are "Submit Video" or "Apply to campaign".
  Campaign briefs live in a Google Doc under the campaign's **Resources** section (Google Docs
  renders on canvas → `get_page_text` returns nothing, must screenshot to read).
- **Briefs are saved in `clip-factory/data/briefs/`** (dreamina-seedance-2.5, paul-cheek,
  capcut-seedance). Read them before producing anything for those campaigns.
- **BEST CAMPAIGN FOR A NEW ACCOUNT = Dreamina Seedance 2.5 / 2.0** — **$2 FLAT PER POST**, not
  CPM, **no Tier-1 gate**, budgets $5k + $8.7k both at **0% spent**. Flat-fee is the key: a fresh
  account with no audience earns nothing on CPM but full rate on flat-fee. Blocked only by the
  "Dedicated Dreamina AI pages only" rule — needs a dedicated account (Eduard's call, Claude
  must not create accounts).
- **Tier-1 gates kill us on most campaigns:** Paul Cheek needs **70%** US/UK/CA/AU, Chris Van
  Vliet needs 40%. A fresh RO account cannot hit these. Always check for a Tier-1 gate BEFORE
  producing clips for a campaign.
- **Hormozi and Gadzhi campaigns are GONE from the board** (searched 2026-07-29, zero results) —
  `data/next-campaigns.md` is stale research from 15 July. Clips made for them have nowhere to be
  submitted right now.
- **Whop state:** balance $0.00, **no payout method connected** (his job — KYC rule). Hubs joined:
  Content Rewards, Clip Farm, Clipping Culture, Clip Summit, Propaganda.
  TikTok `onlyogclipz_` is **verified in Content Rewards** ✅ (bio-code flow).
  Campaign contact: **Chanelle Vorster** (Propaganda) — the "tipa cu campanii" he kept referring to.
