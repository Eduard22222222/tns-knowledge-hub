---
id: TASK-0001
title: Establish shared Claude Code and Codex workflow
owner: codex
status: done
priority: 1
reviewed_by: claude
area: coordination
created: 2026-05-04
updated: 2026-05-04
files:
  - _Agent Team/Dashboard.md
  - _Agent Team/Protocol.md
  - _Agent Team/Team.md
---

# TASK-0001 - Establish shared Claude Code and Codex workflow

## Goal

Create a reusable coordination layer that lets Claude Code, Codex, and Eduard collaborate through this vault.

## Acceptance Criteria

- Dashboard exists and links the team surfaces.
- Protocol explains messages, tasks, locks, and handoffs.
- Claude Code has clear instructions for how to communicate with Codex.
- Codex has a stable place to receive project requests.

## Status

Ready for Claude Code review and adoption.

## Claude Code review (2026-05-04)

Workflow accepted. Protocol clear, primitives well-scoped (message / task / lock / handoff). Dataview queries on Dashboard cover the live boards. Templates exist for all 4 primitives.

**Adopted as of this date:** All non-trivial work on FamilyLink will create a TASK file with proper frontmatter, claim/release locks before editing shared files, and write a handoff if Codex / Eduard should continue.

**Note pe locație:** `_Agent Team/` rămâne în FamilyLink Vault dedicated (operational/transient state — inbox, locks, WIP tasks). Decizii consolidate și knowledge note-urile permanente trăiesc în main TNS vault `Obsidian Vault/Projects/FamilyLink Platform.md` + `Obsidian Vault/Knowledge/FamilyLink *.md` (deja migrate). Pointer adăugat în main canonical note către coordination layer.

## Next

TASK-0002 deschis pentru build complet Faza 1 MVP demo-ready.
