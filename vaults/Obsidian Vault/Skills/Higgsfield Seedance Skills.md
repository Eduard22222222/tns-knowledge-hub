---
aliases: [Seedance Skills, Higgsfield Skills, Seedance 2.0]
tags: [skills, claude-code, video, ai, higgsfield, seedance]
source: https://github.com/beshuaxian/higgsfield-seedance2-jineng
installed: 2026-04-15
---

# Higgsfield Seedance 2.0 Skills

15 Claude Code skills for generating production-grade Seedance 2.0 video prompts. Each skill is a complete prompt engineering framework with:

- **2-Second Hook Framework** — 10–12 scroll-stopping opener patterns
- **Timeline Segmentation** — Beat-by-beat breakdown up to 15 seconds
- **Camera Movement Encyclopedia** — 15–20+ techniques with exact prompt phrasing
- **Lighting & Atmosphere** — Setups that communicate mood and quality
- **Sound Design** — Ambient, foley, music, silence strategies
- **Material Reference Strategy** — Best practices for `@image1` `@video1` `@audio1`
- **Platform Optimization** — TikTok, Instagram, YouTube, etc.
- **5+ Production-Grade Example Prompts** — 15–25 lines each

## Installation

Skills are installed at `C:/Users/adumi/.claude/skills/`. Each can be activated in Claude Code via slash command or automatic trigger based on keywords.

Source: [beshuaxian/higgsfield-seedance2-jineng](https://github.com/beshuaxian/higgsfield-seedance2-jineng) · 99 stars · Created 2026-04-09

## The 15 Skills

### 🎬 Creative Styles

| # | Skill | Use Case | Trigger Keywords |
|---|-------|----------|------------------|
| 01 | `/01-cinematic` | Film quality — dramatic lighting, camera language, depth of field, Hollywood-style | cinematic, film, movie, dramatic, anamorphic, letterbox, noir |
| 02 | `/02-3d-cgi` | 3D rendered — Pixar, Unreal Engine, photorealistic, isometric | 3D, CGI, Pixar, Unreal, render, photoreal |
| 03 | `/03-cartoon` | 2D animation — cel-shaded, hand-drawn, flat vector, watercolor | cartoon, 2D, cel-shaded, hand-drawn, animated |
| 04 | `/04-comic-to-video` | Animate comics — manga, webtoons, storyboards, sequential art | comic, manga, webtoon, storyboard |
| 05 | `/05-fight-scenes` | Action — martial arts, sword fights, chase, superhero | fight, action, chase, battle, combat, martial arts |
| 08 | `/08-anime-action` | Japanese anime — shonen, seinen, mecha, slice-of-life, openings | anime, shonen, seinen, mecha, Japanese animation |

### 📢 Commercial & Marketing

| # | Skill | Use Case | Trigger Keywords |
|---|-------|----------|------------------|
| 06 | `/06-motion-design-ad` | Software/SaaS — product launches, feature showcases, UI demos | SaaS, product launch, feature demo, software ad |
| 07 | `/07-ecommerce-ad` | Product ads — fashion, beauty, electronics, food | ecommerce, product ad, shopify, DTC |
| 09 | `/09-product-360` | Turntable — multi-angle, hero shots, material showcase | 360, turntable, hero shot, product showcase |
| 11 | `/11-social-hook` | Viral content — scroll-stopping hooks for TikTok/Reels/Shorts | viral, scroll-stop, hook, social media |
| 12 | `/12-brand-story` | Brand narrative — origin stories, mission, culture | brand story, origin, mission, culture video |

### 🏭 Industry-Specific

| # | Skill | Use Case | Trigger Keywords |
|---|-------|----------|------------------|
| 10 | `/10-music-video` | Beat-synced — performance, narrative, visualizers | music video, beat-sync, performance, visualizer |
| 13 | `/13-fashion-lookbook` | Fashion — lookbooks, runway, outfits, campaigns | fashion, lookbook, runway, outfit, campaign |
| 14 | `/14-food-beverage` | Food — restaurant, recipe, ASMR, appetite appeal | food, restaurant, recipe, ASMR, appetite |
| 15 | `/15-real-estate` | Property — tours, architecture, interior design | real estate, property, architecture, interior |

## Seedance 2.0 Technical Specs

**Input limits:**
- Images: up to 9 (30 MB each)
- Videos: up to 3 (50 MB each, 2–15s duration)
- Audio: up to 3 (15 MB each)
- Total: max 12 files combined

**Output:** 720p video, 4–15 seconds, with synchronized audio

**@ reference syntax** (from dexhunter skill):
```
@Image1 as the first frame
reference @Video1's camera movement
BGM references @Audio1
@Image1's character as the subject
```

## The Complete Higgsfield Toolkit in Claude

Beyond the 15 style skills above, we also have:

### `/higgsfield-ai-prompt` (OSideMedia — 18 sub-skills)
- MCSLA Formula (Model · Camera · Subject · Look · Action)
- Higgsfield model guide (routes to 15+ models)
- Camera controls
- Motion presets (100+)
- Soul styles (90+)
- Cinema Studio 3.0 features
- Troubleshooting guide
- 10 genre templates

### `/seedance2` (dexhunter)
- Seedance 2.0-specific @ reference system
- Time-segmented prompts
- Camera language reference
- Video editing & extension patterns

### Higgsfield MCP Server
Direct API access (no browser needed) for Soul + DOP models:
- `generate_image_soul` — text-to-image with 90+ styles
- `generate_video_dop` — image-to-video with 100+ motion presets
- `create_character` — character references for consistency
- `get_soul_styles` / `get_motions` — list all presets
- `generate_speech_video` — talking head videos

### Playwright MCP Server
Browser automation for the full Higgsfield **platform UI** (models the API doesn't expose):
- Seedance 2.0, Seedance 2.0 Fast
- Marketing Studio, Cinema Studio 3.0
- Kling 3.0, Sora 2, Google Veo 3.1, Wan 2.7
- Apps catalog (80+ one-click apps)

## Usage Pattern

1. **Describe video idea** → Claude auto-activates the right skill based on keywords
2. **Claude generates prompt** using the skill's framework (hook + camera + lighting + timeline)
3. **Claude drives Higgsfield** via Playwright MCP — navigates, selects Seedance 2.0, uploads assets, pastes prompt
4. **Seedance generates** — 720p video with synchronized audio
5. **Claude downloads result** and saves to project folder

## Example

> *"I need a 15s cinematic video of a lone samurai walking through foggy bamboo forest at dawn"*

Claude activates `/01-cinematic`, builds a production prompt with:
- 2-second hook (macro close-up → whip cut to wide landscape)
- Camera language (dolly forward, rack focus)
- Lighting (god rays through bamboo, cool blue morning fog)
- Timeline (establish → character intro → movement → reveal)
- 5+ production prompt variations

Then Claude navigates via Playwright MCP to `higgsfield.ai/create/video?model=seedance_2_0`, selects Seedance 2.0 from the dropdown, fills the prompt textarea, clicks Generate, and waits for the result.

## Related
- [[Higgsfield Brand Deal]] — The paid partnership that kicked off this setup
- [[Eduard AI Reels]] — Personal brand reel project using this same toolchain
- [[Claude Skills Index]] — Master index of all installed Claude Code skills
