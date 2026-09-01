# Obsidian Vault — Claude Code Instructions

This vault belongs to Eduard Dumitriu / The Niche Society (TNS). Claude Code has full read/write access to this vault. Follow these rules exactly when creating, updating, or organizing notes.

## Vault Location
`C:\Users\adumi\OneDrive\Documents\Obsidian Vault\`

## System: Zettelkasten Method

This vault uses a **Zettelkasten** (slip-box) system. Every note must follow these principles:

### Core Principles
1. **Atomicity** — One idea per note. If a note covers two distinct ideas, split it into two notes and link them.
2. **Connectivity** — Every note must link to at least one other note using `[[wikilinks]]`. Orphan notes are not allowed.
3. **Own words** — Never copy-paste raw content. Rewrite in Eduard's voice (conversational, direct, Romanian context when relevant).
4. **Self-contained** — Each note should make sense on its own without needing to read the linked notes first.
5. **Evergreen** — Notes are living documents. Update them when new information arrives rather than creating duplicates.

### Note Types

#### 1. Fleeting Notes (`00-Inbox/`)
- Quick captures, raw ideas, meeting notes, things to process later
- Filename: `YYYY-MM-DD - descriptive title.md`
- Tag: `#fleeting`
- These are **temporary** — they must be processed into permanent notes or deleted within a week
- Example: `2026-04-06 - Salt Bank meeting feedback.md`

#### 2. Permanent Notes (`Projects/`, `Knowledge/`, `Resources/`)
- Refined, atomic ideas extracted from fleeting notes or work sessions
- Filename: descriptive title (e.g., `Salt Bank Ecosystem.md`, not IDs or timestamps)
- Must have YAML frontmatter (see template below)
- Must have at least one `[[wikilink]]` to another note
- Tag: `#permanent` plus category tags

#### 3. Structure Notes (MOCs — Maps of Content)
- Index notes that organize and link groups of permanent notes
- Filename: ends with `MOC` (e.g., `Projects MOC.md`)
- Tag: `#moc`
- These are the **entry points** for navigating the vault
- Keep them updated when adding new permanent notes to their domain

#### 4. Reference Notes (`Resources/`)
- External knowledge: tools, APIs, frameworks, skills documentation
- Filename: descriptive (e.g., `Claude Skills Index.md`, `Stripe API Reference.md`)
- Tag: `#reference`

### Folder Structure
```
Obsidian Vault/
├── CLAUDE.md              # These instructions (do not modify unless asked)
├── Dashboard.md           # Main entry point / home MOC
├── 00-Inbox/              # Fleeting notes, unprocessed captures
├── Projects/              # One note per project (TNS clients, internal)
│   └── Projects MOC.md
├── Knowledge/             # Domain knowledge, patterns, learnings
│   └── Knowledge MOC.md
├── Skills/                # Claude Code skills reference
│   └── Claude Skills Index.md
├── Resources/             # Tools, stack, company info, external refs
├── Templates/             # Note templates
└── Daily/                 # Daily notes (optional, if Eduard uses them)
```

### YAML Frontmatter Template
Every permanent note MUST have this frontmatter:

```yaml
---
tags: [type, category, subcategory]
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: active | delivered | archived | idea
links: []  # optional — for explicit backlink tracking
---
```

**Required tags by note type:**
- Projects: `#project` + `#active` or `#delivered` or `#archived`
- Knowledge: `#knowledge` + domain tag (e.g., `#fintech`, `#ai`, `#marketing`)
- Skills: `#skill` or `#reference`
- Fleeting: `#fleeting`
- MOCs: `#moc`

### Linking Rules

1. **When creating a new project note:** Link it from `Projects MOC.md` AND from `Dashboard.md`
2. **When referencing a tool/service:** Create or link to its note in `Resources/` (e.g., `[[Higgsfield]]`, `[[Supabase]]`)
3. **When referencing a company:** Link to `[[The Niche Society]]` or create a client note
4. **When a project uses specific skills:** Link to `[[Claude Skills Index]]` entries
5. **When extracting a pattern/learning:** Create a Knowledge note and link back to the project it came from
6. **Cross-project links:** If two projects share tech, approach, or learnings, link them directly

### How Claude Should Work With This Vault

#### When starting a new project:
1. Create a note from `Templates/New Project Template.md` in `Projects/`
2. Add a row to the Dashboard table
3. Add a link in `Projects MOC.md`
4. Link to relevant tools in `Resources/`

#### When finishing a work session:
1. Update the project note with key decisions, changes, progress
2. Update `status` in frontmatter if changed
3. Update `Dashboard.md` recent activity section
4. If new patterns/learnings emerged, create a Knowledge note

#### When the user says "remember this" or shares a learning:
1. Create a permanent note in `Knowledge/` (atomic — one idea)
2. Link it to the relevant project and any related knowledge notes
3. This replaces saving to Claude memory for project-specific knowledge

#### When organizing or reviewing:
1. Process any notes in `00-Inbox/` — convert to permanent notes or delete
2. Check for orphan notes (no incoming links) and connect them
3. Update MOCs if new notes were added to their domain
4. Archive completed projects (change status, move to bottom of MOC)

### Naming Conventions
- **Projects:** `Client Name + Project Type.md` (e.g., `Salt Bank Ecosystem.md`)
- **Knowledge:** `Descriptive Concept.md` (e.g., `GPU Pricing A100 vs H100.md`)
- **Resources:** `Tool or Entity Name.md` (e.g., `SmartBill API.md`)
- **Fleeting:** `YYYY-MM-DD - description.md`
- No special characters except hyphens and spaces. No IDs or Zettelkasten numbering — we use links instead.

### What NOT to put in this vault
- Secrets, API keys, passwords, tokens
- Raw generated PDFs (link to file path instead)
- Code files (those stay in project directories, link to paths)
- Conversation logs (summarize key decisions instead)

### Graph View Optimization
- Use consistent note titles so links don't break
- Prefer `[[Note Title]]` over `[[Note Title|alias]]` unless the alias is much clearer
- Color coding via tags: Obsidian can color graph nodes by tag — use `#project`, `#knowledge`, `#reference`, `#moc` consistently
- The graph should show: Dashboard at center, MOCs as hubs, projects as clusters, knowledge notes as bridges between clusters

### Romanian Context
- Project names stay in their original language (e.g., "Contabilul Partener", "Calculator Fiscal")
- Client names in original form
- Internal notes can mix Romanian and English naturally (as Eduard does)
- Proposals are typically in Romanian, reference them by their Romanian titles
