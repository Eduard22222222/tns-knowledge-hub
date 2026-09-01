---
name: project_cfo_workspace
description: "Eduard's advanced CFO/financial-modeling Claude Code workspace (energy sector) — sophisticated existing setup to build on"
metadata: 
  node_type: memory
  type: project
  originSessionId: 391051ba-9e88-445b-9e93-1dc8dec526b9
---

Eduard operates an **advanced CFO / financial-modeling Claude Code workspace** at `C:\Users\adumi\Documents\CFO\` for an **energy-sector** financial function. Entities: **MET, ENEVO, BESS, IPP** (battery storage / independent power producer; covenants DSCR/leverage, IRR/NPV models, board packs). Discovered 2026-06-26 via his course doc `Curs_Claude_Code_in_Action.docx` (a self-authored study-text rewriting Anthropic's "Claude Code in Action" Skilljar course, with per-module "Notă de aplicare CFO").

**Architecture (real, in use):**
- CLAUDE.md at root + per-role (MET / ENEVO / BESS) with hierarchical inheritance; mirror `AGENTS.md`.
- 3 read-only subagents: **knowhow-retriever, figure-verifier, excel-auditor** (independent QC before delivery).
- Hook **xlsx_quickcheck.py** (PostToolUse on .xlsx → flags #REF!/#DIV/0!).
- **_workflows\** repeatable procedures: board_pack_assembly, model_ipp_build, knowhow_intake; plus skills + skill_capture.
- **KnowHow / "al doilea creier"** system, search DB + heartbeat (reads Gmail/Calendar via MCP connectors: Gmail/Outlook, Calendar, Drive, Chrome).
- Context-window rules: /compact ~70%, /clear ~90%; Plan-Mode reminder on structural tasks; **MET↔ENEVO data-isolation barrier**.
- Codex review + a **multi-advisor council**. On-disk versioning + dated backups (no git).
- Architecture doc: `C:\Users\adumi\Documents\CFO\Know How\Workspace_CFO_Cum_Lucreaza_Claude_Code.docx`.

**Why it matters:** Eduard is NOT a beginner — he runs a serious agentic workspace. The "advanced track" for TNS (new skills: tns-proposal-builder, tns-contract-builder, eval-harness, client-research) should **build on these existing patterns** (skills + workflows + read-only QC subagents + hooks), not start from scratch. The Claude Code course's module→definition→Reține→recap→verification-questions→application-note format is the **gold-standard structure** to reuse for TNS facilitator materials and [[project_fox_ai_training]] slide decks. Related: [[project_ai_dev_tooling]].
