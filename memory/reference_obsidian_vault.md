---
name: obsidian-vault-location
description: "Eduard's Obsidian vault — location, structure, AND the Zettelkasten conventions for how Claude must add/update notes (authoritative guide = the vault's own CLAUDE.md)."
metadata: 
  node_type: memory
  type: reference
  originSessionId: b833b2f7-3be7-472e-a90a-c40b90a28f50
---

Main TNS knowledgebase vault: `C:\Users\adumi\OneDrive\Documents\Obsidian Vault\`.
There are ALSO per-project vaults under `OneDrive\Documents\` (e.g. `FamilyLink Vault\`, `Bonduelle Vault\`, `Scandia Vault\`, etc. — see project memories).

**Authoritative rules live in `Obsidian Vault\CLAUDE.md`** — READ IT before writing to the vault; the summary below is a pointer, not a replacement. Related: [[feedback_obsidian_consult]].

## How to ADD a new note (Zettelkasten / slip-box)
Core principles: **atomic** (one idea per note → split + link if two), **connected** (every note MUST have ≥1 `[[wikilink]]`; no orphans), **own words** (rewrite in Eduard's voice, never paste raw), **self-contained**, **evergreen** (update existing notes rather than duplicating).

Note types → folder:
- **Fleeting** → `00-Inbox/`, file `YYYY-MM-DD - title.md`, tag `#fleeting` (temporary; process or delete within a week)
- **Permanent** → `Projects/` | `Knowledge/` | `Resources/`, descriptive filename (no IDs/timestamps), `#permanent` + category
- **MOC (structure)** → filename ends `MOC`, tag `#moc` (the navigation hubs)
- **Reference** → `Resources/`, tag `#reference` (tools/APIs/skills); skills index at `Skills/Claude Skills Index.md`

Required YAML frontmatter on every permanent note:
```yaml
---
tags: [type, category, subcategory]
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: active | delivered | archived | idea
links: []
---
```

Linking when adding: new project note → link from `Projects MOC.md` AND `Dashboard.md`; tool/service → link/create in `Resources/`; learning/pattern → new `Knowledge/` note linked back to its project; cross-project shared tech → link directly.

Per the vault's CLAUDE.md, when the user says "remember this" about **project-specific** knowledge → it goes in the vault (`Knowledge/`), which "replaces saving to Claude memory for project-specific knowledge". (User/feedback/cross-project facts still go to this auto-memory.)

**Never** put in the vault: secrets/keys/tokens/passwords, raw generated PDFs (link the path), code files (link the path), conversation logs (summarize decisions). Naming: hyphens/spaces only, no special chars, no numbering (links instead). RO project/client names stay in original language.
