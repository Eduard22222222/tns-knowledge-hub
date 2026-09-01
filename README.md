# TNS Knowledge Hub

Portable snapshot of **The Niche Society**'s working knowledge — Obsidian vaults, Claude Code skills, and distilled project memory — bundled into one repo so a **new AI model instance** (Claude, GPT, whatever) can be handed this repo and immediately have full context on Eduard Dumitriu / TNS's projects, conventions, and tooling.

> ⚠️ **This repo is public, at Eduard's explicit request, and contains unredacted internal notes.** Client names and internal decisions inside `vaults/` and `memory/` have **not** been scrubbed — that was a deliberate choice, not an oversight. The one exception: two live Google AI Studio API keys found embedded in local MCP configs *were* redacted before push (see `config/mcp-servers.md`) — those never got committed. If you're not Eduard, treat everything here as his working notes, not as an invitation to use anything credential-shaped you might still find.

---

## What's in here

```
tns-knowledge-hub/
├── vaults/     # Full copies of every Obsidian vault (23 vaults)
├── skills/     # Full mirror of the Claude Code skills library (~1285 skills)
├── memory/     # Claude Code's distilled auto-memory (MEMORY.md index + per-topic files)
├── config/     # Global CLAUDE.md + MCP servers/connectors setup (mcp-servers.md, connectors.md)
└── scripts/    # sync.ps1 — re-pull the latest copies from the live sources
```

These are **copies**, not live syncs. The originals keep living where Obsidian and Claude Code expect them (see "Live sources" below) — that's intentional, so Obsidian's app and Claude Code's memory system keep working normally on Eduard's machine. Re-run [`scripts/sync.ps1`](scripts/sync.ps1) whenever you want this repo to reflect the current state, then commit + push the diff.

---

## Onboarding checklist for a new AI instance

If you're an AI model instance being handed this repo cold, read things in this order:

1. **This file** — orients you on structure and conventions.
2. [`vaults/Obsidian Vault/Dashboard.md`](<vaults/Obsidian Vault/Dashboard.md>) — the main TNS vault's home page / entry point.
3. [`vaults/Obsidian Vault/CLAUDE.md`](<vaults/Obsidian Vault/CLAUDE.md>) — **the authority** on how notes are structured (Zettelkasten method), how to create new notes, linking rules, naming conventions. Follow this exactly when adding anything to `vaults/Obsidian Vault/`.
4. [`memory/MEMORY.md`](memory/MEMORY.md) — the index of distilled, current project/user/feedback memory. Each line links to a file with more detail. This is the fastest way to understand "what's going on right now" across all TNS projects.
5. `config/CLAUDE.md` — how the human (Eduard) has configured Claude Code to behave globally (tool preferences, KotaDB usage, etc.). Useful context on working style even if you're not literally Claude Code.
6. [`config/mcp-servers.md`](config/mcp-servers.md) and [`config/connectors.md`](config/connectors.md) — what tools/integrations are wired up (local MCP servers + hosted claude.ai connectors) and how to set up your own. **API keys in these files are placeholders** — the originals had two live keys embedded, redacted before this repo went public.
7. Whichever `vaults/<Client> Vault/` is relevant to the task at hand — each client/project has its own vault (see map below).

## Vault map

Each vault is a separate Obsidian vault for one client, project, or internal system. One-line context per vault (cross-reference `memory/MEMORY.md` for the current, living status of each):

| Vault | What it's for |
|---|---|
| `Obsidian Vault` | **Main TNS knowledgebase.** Zettelkasten-structured: Dashboard, Projects MOC, Knowledge, Skills, Resources. Start here. |
| `The Niche Society Vault` | Core TNS product: white-label SaaS for Romanian niche clinics (derm/aesthetic/dental/wellness). |
| `Niche Society - Aesthetic Vault` | Aesthetic-clinic vertical of the Niche Society platform. |
| `Niche Society - Dental Vault` | Dental-clinic vertical of the Niche Society platform. |
| `Niche Society - Dermatology Vault` | Dermatology-clinic vertical of the Niche Society platform. |
| `Bonduelle Vault` | Consumer platform for Bonduelle România (single-brand showcase template). |
| `Scandia Vault` | 3-brand showcase for Scandia Food (Sibiu/Bucegi/Sadu). |
| `Caroli Vault` | 3-brand showcase for Caroli Foods Group (Caroli/Campofrigo/Maestro). |
| `Intersnack Vault` | Hula Hoops by Chio activation platform (rebranded from 3-brand Intersnack). |
| `Vel Pitar Vault` | 3-brand showcase for Vel Pitar (French Toast/de Vel Pitar/Chef Gourmand). |
| `Nordic Food Vault` | 3-brand showcase for Nordic Food distributor (Rana/Cirio/Voila). |
| `Cris-Tim Vault` | 3-brand showcase for Cris-Tim Family Holding. |
| `Transavia Vault` | PetVia by Transavia — mockup pet-food expansion demo. |
| `Frostbite Vault` | FrostBite — fictional premium frozen-food brand demo (Lovable-built). |
| `VICI Vault` | Consumer Voice platform for VICI (surimi/gyoza/fish), bilingual RO/EN. |
| `Albalact Vault` | Consumer platform for Albalact (Groupe Lactalis) dairy brands. |
| `Tchibo Vault` | Tchibo GAME ON — receipt-upload promo campaign with antifraud + admin dashboard. |
| `CoachOS Vault` | Tennis coaching SaaS + AI video analytics (partner project with Filip). Has its own `CLAUDE.md`. |
| `GoaMasaj Vault` | Google Ads + Academy course sales for GoaMasaj (home massage, Bucharest). |
| `AutosWorld Vault` | E-commerce replatform for AutosWorld (auto parts, OpenCart→WooCommerce). |
| `FamilyLink Vault` | FamilyLink business model — elder-care platform pricing/architecture. |
| `TNS Ads Manager Vault` | Internal Google Ads + SEO management system TNS is building. |
| `Tetr Hackathon Vault` | Tetr 48h business-game hackathon project ("Pitch Pit"). |

## Skills (`skills/`)

Full mirror of `~/.claude/skills/` — every Claude Code skill available on Eduard's machine, both TNS-custom ones and the general library (dev, security, marketing, ops, etc.). Each skill is a folder with a `SKILL.md` (instructions) and sometimes bundled scripts/assets. To add a new skill here, follow the same convention any existing skill folder uses, or use the `skill-creator` skill's pattern.

## Memory (`memory/`)

Mirror of Claude Code's auto-memory for this workspace — structured, current-state knowledge that's *not* derivable from reading code (who's doing what, why, deadlines, incidents, feedback the human has given about how to work). `MEMORY.md` is the index; each linked file has full detail with `**Why:**` / `**How to apply:**` context. When adding new persistent knowledge here, follow the same frontmatter pattern (`name`, `description`, `metadata.type`) used by existing files.

## Adding a new node (new project, new client, new piece of knowledge)

- **New client/project vault:** create `vaults/<Client Name> Vault/`, seed it from `vaults/Obsidian Vault/Templates/` if a template fits, and add an entry to the vault map above.
- **New note inside an existing vault:** follow that vault's own `CLAUDE.md` if it has one; otherwise follow `vaults/Obsidian Vault/CLAUDE.md` (Zettelkasten: atomic, linked, own words, YAML frontmatter).
- **New skill:** add a folder under `skills/` with a `SKILL.md`, mirroring the structure of existing skills.
- **New durable fact/decision:** add a file under `memory/` with proper frontmatter, then add a one-line pointer to `memory/MEMORY.md`.

## Live sources (on Eduard's machine — for re-syncing, not for the AI reading this remotely)

- Vaults: `C:\Users\adumi\OneDrive\Documents\*Vault*`
- Skills: `C:\Users\adumi\.claude\skills\`
- Memory: `C:\Users\adumi\.claude\projects\C--Users-adumi-OneDrive-Desktop-claude\memory\`
- Global config: `C:\Users\adumi\.claude\CLAUDE.md`
