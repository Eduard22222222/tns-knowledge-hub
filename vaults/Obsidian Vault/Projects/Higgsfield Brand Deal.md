---
tags: [project, active, brand-deal, paid, ai, reels, higgsfield, claude-code]
status: active
type: influencer-partnership
partner: Higgsfield
contact: John K
created: 2026-04-15
---

# Higgsfield × Claude — Creator Brand Deal

**Type:** First paid influencer partnership
**Status:** 🟢 Setup complete, ready to film
**Deliverable:** Instagram Reel · 40–90 seconds
**Contact:** John K @ Higgsfield
**Dropbox:** [Apr 9 - Claude + Higgsfield](https://www.dropbox.com/scl/fo/fycmt53t7c6qas229m69b/)

## The Concept

Show what's possible when **Claude Code** is plugged into **Higgsfield Seedance 2.0** via the **Playwright MCP**. The angle: "vibe marketing" — the content-creation equivalent of vibe coding. You describe what you want, the system builds it. Claude autonomously drives the Higgsfield UI while the creator does nothing but talk to camera.

Target feel: **genuine discovery**, not an ad. Viewer should think "how did I not know about this?"

## Hard Requirements (from brief)

| # | Requirement |
|---|---|
| 1 | Format: IG Reel, 40–90 sec |
| 2 | "Claude" must appear in first 3 words of hook |
| 3 | Tag @higgsfield.ai in caption |
| 4 | Hashtags: #Higgsfield #Seedance2 #ClaudeAI #AIMarketing #GenerativeAI #AIVideo |
| 5 | Discount CTA: "Up to 70% off unlimited Seedance on Higgsfield" |
| 6 | Show Seedance 2.0 being selected in Higgsfield dropdown |
| 7 | Show Claude Code terminal on screen |
| 8 | CTA: Comment "CLAUDE" for DM with workflow link |
| 9 | Use visuals from Dropbox MEDIA folder for CTA overlay |
| 10 | 80% value / 20% product — feel like a workflow tutorial |

## Brief Scene Structure (guideline, not mandatory)

1. **Hook** — Face-to-camera, "Claude" in first 3 words, laptop with terminal + AI videos behind
2. **Setup** — Screen recording of terminal opening, "connected Claude Code to Higgsfield using Playwright MCP"
3. **Skills reveal** — VS Code showing `SEEDANCE_SKILLS.md` file
4. **Automation** — Split screen: terminal thinking (green text) on left, Higgsfield dashboard moving autonomously on right (model dropdown → Seedance 2.0 → upload → prompt → generate)
5. **Results** — Montage of stunning Seedance 2.0 outputs
6. **CTA** — Back to camera, "comment CLAUDE for the workflow"

## Tech Stack — Setup Complete ✅

### MCP Servers (`.mcp.json`)
- **playwright** — Browser automation for Higgsfield UI (`@playwright/mcp@latest`)
- **higgsfield** — Direct API access to Soul + DOP models
- **nanobanana-mcp** — Backup for background generation

### Claude Skills (installed to `~/.claude/skills/`)
- **15 Seedance 2.0 skills** from [beshuaxian/higgsfield-seedance2-jineng](https://github.com/beshuaxian/higgsfield-seedance2-jineng)
- **higgsfield-ai-prompt** (18 sub-skills, MCSLA formula) from OSideMedia
- **seedance2** (@ reference system) from dexhunter

See [[Higgsfield Seedance Skills]] for the full skill catalog.

### Playwright Workflow (verified working)
```
Claude → Playwright MCP → Chromium → higgsfield.ai/create/video
     → click Model dropdown → select "Seedance 2.0"
     → fill prompt textarea (#prompt)
     → upload image (input[type=file])
     → click Generate button
     → wait for output → download video
```

## Brand Library Assets

Located at `C:/Users/adumi/OneDrive/Desktop/claude/eduard-brand-library/`:
- 5 Eduard reference photos (earth tones, quiet luxury)
- 8 viral reel analyses
- Typography system
- Cross-reel patterns (dark env, lyric-sync, TKandz audio)
- 10-scene master production plan (pre-existing — different from this brand deal)

## Related
- [[Eduard AI Reels]] — Personal brand reel project (separate from this paid deal)
- [[Higgsfield Seedance Skills]] — 15 new skills installed for Seedance 2.0

## Next Steps
- [ ] Build consolidated `SEEDANCE_SKILLS.md` (the file shown on-camera in Scene 3)
- [ ] Rehearse full Playwright → Higgsfield generation flow
- [ ] Download Dropbox MEDIA assets (Anniversary Sale discount visuals)
- [ ] Film face-to-camera intercuts
- [ ] Screen record Claude driving Higgsfield end-to-end
- [ ] Edit in DaVinci Resolve
- [ ] Post to Instagram with discount CTA
