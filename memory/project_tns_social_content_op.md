---
name: project_tns_social_content_op
description: TNS social content operation + daily AI-intel research routine (LinkedIn RO / IG EN)
metadata: 
  node_type: memory
  type: project
  originSessionId: 8a63e47c-d558-4ada-99d0-941df3081939
  modified: 2026-08-26T12:52:31.248Z
---

The Niche Society social-media content operation to get clients. **LinkedIn = Romanian, business/management audience; Instagram = English, broad public.** Every post solves/reveals one concrete thing, ends with comment-to-DM keyword CTA.

**Content direction (locked, hard rule):** INSIDER / complex only — real repos, agents, Claude Skills, advanced capabilities, real named tools with real use cases. NOT consumer-obvious ("write my CV", "plan a trip") and NOT already-mainstream concepts ("what is an MCP" — Eduard says everyone knows that now). Show REAL tools + real screenshots + **cropped logos** + **real GitHub stars/forks verified via GitHub API** — NEVER invent numbers (also see [[feedback_quality_standards]], [[feedback_content_voice]]). Prefer sneaky/underground high-star repos (browser-use 110k⭐, markitdown 176k⭐, crawl4ai 79k, mem0 64k, exo 47k, fabric 43k, OpenClaw 380k self-hosted-agent-on-WhatsApp).

**Deliverables root:** `OneDrive/Desktop/claude/tns-brand/` — carousels in `ig/` (v2 renderer `engine/render-carousel-v2.ps1` composites a Higgsfield illustration per slide, 1080x1350), single posts in `posts/`. Reels built in Remotion at `C:\Users\adumi\tns-remotion` (comps: Reel, AgentReel, ExplainerStack, **SoundFakeReel** = "5 things AI can do that sound fake", 1080x1920, dark+gold+Georgia house style). Illustrations via Higgsfield CLI gpt_image_2 (ivory/sage/charcoal flat-vector house prompt).

**Posted live:** LinkedIn "Claude Skills for RO accounting" post (file-tree editor image `posts/skills/`) on Eduard's personal profile AND The Niche Society company page (posting-as-page: composer → author caret → Post settings → pick page → Save).

**LinkedIn/IG media-upload limitation (important):** cannot auto-attach images — LinkedIn composer is a cross-origin iframe + native file picker can't be driven; upload_image coordinate-drop does NOT attach; there is no persistent `input[type=file]`. Workaround: I auto-TYPE the post text (RO diacritics + → arrows type fine), then **Eduard drags the PNG in and clicks Post** (5 sec). IG web needs the extension granted host permission for instagram.com (was blocked) — easier for him to post carousels from phone.

**Daily AI-intel routine:** scheduled task `tns-ai-intel-daily` (scheduled-tasks MCP, cron `0 8 * * *` → runs 08:05 local). Does ~1h research (Karpathy/Simon Willison/swyx/Nathan Lambert, GitHub Trending/OSSInsight, new AI+build tools, lead-gen tactics, AI/IT business) and writes a dated RO note to vault `The Niche Society Vault/12-AI-Intel/<date>-intel.md` (+ appends to `00-ai-intel-moc.md`) with "ce facem NOI cu asta" (use/pitch/content) and real verified stars. Feeds the content pipeline. Related: [[project_niche_society]], [[project_consumervoice_leadgen]], [[feedback_video_review_workflow]].
