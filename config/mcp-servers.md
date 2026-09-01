# MCP Servers — local setup

These are the local (stdio) MCP servers Eduard runs alongside Claude Code, sourced from `~/.claude.json`, the Claude Desktop config, and the project-level `.mcp.json`. **API keys below are placeholders** — two live Google AI Studio keys were found embedded in the original configs and were redacted before this repo went public. Get your own key for each service; never commit a real key here.

## Global (`~/.claude.json` → `mcpServers`)

```json
{
  "kotadb": {
    "command": "bunx",
    "args": ["kotadb@next", "--stdio", "--toolset", "default"]
  },
  "notebooklm": {
    "type": "stdio",
    "command": "npx",
    "args": ["notebooklm-mcp@latest"],
    "env": {}
  },
  "saga": {
    "type": "stdio",
    "command": "<path-to-python>",
    "args": ["<path-to>/saga-mcp/server.py"],
    "env": {
      "SAGA_ROOT": "<path to local SAGA C accounting install>",
      "SAGA_ENCODING": "cp852",
      "SAGA_FDB": "<path to Firebird .fdb snapshot>",
      "SAGA_FBCLIENT": "<path to fbclient.dll>",
      "FIREBIRD": "<path to Firebird install>",
      "SAGA_FB_CHARSET": "WIN1250"
    }
  }
}
```

- **kotadb** — local, dependency-aware code intelligence for any repo. Requires `index_repository` on first use per repo (needs a `.git` root). See `config/CLAUDE.md` for full usage rules.
- **notebooklm** — bridges to Google NotebookLM.
- **saga** — read-only bridge into a local SAGA C accounting install (Firebird DB) for Conta4U bookkeeping queries. Paths above are placeholders; this only makes sense on a machine that actually has SAGA + Conta4U's `.fdb` installed. See `memory/skill_saga_firebird_direct_read.md` and related SAGA memory files.

## Project-scoped (`.mcp.json`, shared via project config)

```json
{
  "mcpServers": {
    "nanobanana-mcp": {
      "command": "cmd",
      "args": ["/c", "npx", "-y", "@ycse/nanobanana-mcp"],
      "env": {
        "GOOGLE_AI_API_KEY": "<YOUR_GOOGLE_AI_STUDIO_KEY — get one at https://aistudio.google.com/apikey>"
      }
    },
    "higgsfield": {
      "command": "python",
      "args": ["-m", "higgsfield_mcp.server"]
    },
    "playwright": {
      "command": "cmd",
      "args": ["/c", "npx", "-y", "@playwright/mcp@latest"]
    }
  }
}
```

- **nanobanana-mcp** — Gemini/Nano Banana image generation. Needs a `GOOGLE_AI_API_KEY` env var (Google AI Studio key, free tier available).
- **higgsfield** — Higgsfield AI video/image generation CLI wrapped as an MCP server (`pip install higgsfield-mcp` or equivalent). Auth is handled by the `higgsfield` CLI's own login flow (stores a token outside this file), not via env var here. See `memory/reference_higgsfield_cli_video.md`.
- **playwright** — browser automation via `@playwright/mcp`. No credentials needed; requires `npx` (Node.js) available on PATH.

## Not yet wired up

- **Blender** (via the `ahujasid/blender-mcp` bridge) — lets Claude drive a running Blender scene directly (execute Python via `bpy`, inspect objects, render screenshots). Referenced in `memory/project_brand_3d_asset_pipeline.md` as intended for stands/outfits/product 3D work, but not yet connected on this machine. To wire it up: install the Blender add-on from that repo, start Blender with it enabled, then add the MCP server the same way as the others above.

## Built into Claude Code Desktop (nothing to install)

These aren't separately-configured MCP servers — they ship with the Claude Code Desktop app itself and just need the app installed/logged in:

- **Browser pane** (`Claude_Browser`) — an in-app Chromium tab Claude can navigate/read/screenshot/click, used for previewing dev servers and browsing docs/staging sites.
- **claude-in-chrome** — drives Eduard's *real* Chrome (existing logged-in sessions) via a paired browser extension, for tasks that need an already-authenticated site. Needs the Chrome extension installed and paired once per device.
- **computer-use** — screenshot + mouse/keyboard control of the desktop itself, for native apps with no API/MCP of their own. Gated per-application by an explicit access grant the user approves.
- **scheduled-tasks** — cron-style recurring agent runs (`/schedule`).
- **mcp-registry** — lets Claude search/suggest other MCP connectors to add.
- **terminal** — reads output from a terminal pane the user has open alongside the session.
- Session/workspace management (`spawn_task`, `mark_chapter`, directory switching, session search/history) — internal to how Claude Code Desktop tracks the session itself.

## Also referenced elsewhere on this machine

- `C:\Users\adumi\.claude\keys\` — a local folder Eduard keeps for miscellaneous tokens referenced by scripts/skills. Not included in this repo (it's a raw secrets store by design). If you're setting this up fresh, create your own equivalent and keep it out of git.
- Claude Desktop's own `claude_desktop_config.json` duplicates a `nanobanana-mcp` entry with its own (also redacted) key — the two configs aren't kept in sync automatically; pick one source of truth if you're setting this up new.

## Setting this up fresh

1. Install the servers' underlying CLIs/packages (`bunx`/`npx` pull most on demand; `higgsfield` and `saga` need their own installs — see the relevant skill/memory files).
2. Add each server with `claude mcp add <name> -s <user|project> -- <command> <args...>`, or hand-edit `~/.claude.json` / `.mcp.json` following the shapes above.
3. Supply your own API keys via env vars — never reuse someone else's.
