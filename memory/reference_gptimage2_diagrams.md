---
name: reference_gptimage2_diagrams
description: "Working recipe for clean text-bearing diagrams (n8n flows, charts) via GPT Image 2 on the Higgsfield CLI"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 391051ba-9e88-445b-9e93-1dc8dec526b9
---

GPT Image 2 (via the **Higgsfield CLI**, not MCP) produces **clean, correctly-spelled text inside diagrams** — n8n-style flowcharts, comparison panels, quadrant matrices, labeled charts. Far better at on-image text than nanobanana/Gemini. Validated building the FOX Day-1 deck (see [[project_fox_ai_training]]): 10/10 diagrams came out with crisp labels on the first try.

**Recipe (Git Bash):**
- CLI: `higgsfield` / `hf` (npm global at `~/AppData/Roaming/npm/`). Model id = `gpt_image_2`. Params: `aspect_ratio` (16:9, 4:3, 1:1, 3:2, 9:16…), `quality` (low/medium/high), `resolution` (1k/2k/4k).
- Command: `higgsfield generate create gpt_image_2 --prompt "<EN prompt>" --aspect_ratio 16:9 --quality high --resolution 2k --wait --json` → prints JSON with a clean CloudFront `.png` URL; download it (no query string, regex `https://[^\s"'<>]+\.png` works).
- For a batch: write each prompt to a file, loop in a **background** bash job (`run_in_background`), download each, then Read each PNG to QA visually. ~60–90s per image.

**Prompt rules that worked:** write the prompt in **English**, put node labels in **Romanian WITHOUT diacritics** (diacritics risk garbling; ASCII reads fine in a diagram), specify a fixed house-style string (e.g. "clean minimal n8n-style flowchart, cream #F4EFE3, charcoal #1A1A1A, muted gold #C9A84C, thin arrows, rounded rectangle nodes, generous whitespace, 16:9, no people, crisp legible text"), and list each node + its exact label + a small line icon.

**Deck integration:** 16:9 diagrams shrink badly when placed under bullets (`sl_wide`) — they end up ~50% width. A dedicated **big-image layout** (compact header + image filling the slide + 1-line caption) makes them dominate. YouTube transcripts for source material: `pip install youtube-transcript-api`, then `YouTubeTranscriptApi().fetch(video_id, languages=['en'])`.
