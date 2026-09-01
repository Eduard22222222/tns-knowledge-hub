---
name: ai-dev-tooling-stack
description: "Local AI dev-tooling stack set up 2026-06-01 — KotaDB code-intelligence MCP (global) + Paperclip multi-agent orchestration. Setup state, gotchas, and activation steps."
metadata: 
  node_type: memory
  type: project
  originSessionId: d1643d8a-d9f3-4f19-b1af-9b5b516cb018
---

Two tools evaluated from GitHub and set up on 2026-06-01 (analysis covered kotadb, paperclip, hermes-agent; Hermes deferred — it's a standalone Claude Code alternative, not a plugin).

## KotaDB — code intelligence (DONE, verified)
Registered as a **global** MCP server `kotadb` in `~/.claude.json` (top-level `mcpServers`),
command = absolute `~/.bun/bin/bunx.exe kotadb@next --stdio --toolset default`. Bun was installed as a prerequisite.
- **Activates only after restarting Claude Code** (MCP loads at startup). After restart, `/mcp` should list `kotadb`.
- Usage rules live in `~/.claude/CLAUDE.md` (loaded every session/project).
- **Why:** dependency-aware code search + safe-refactor impact across the many Vite/React showcase repos.
- **How to apply:** `find_usages` (symbol-level) is the reliable tool — resolves `@/` aliases, gives line/col + context. The file-level tools (`search_dependencies`, `analyze_change_impact`) **under-report** on these Vite `@/`-alias projects (imports land in `unresolved_imports`, dependents come back empty) — treat empty dependents as "unknown," not "safe." `search` needs `scope` as an array. First use per repo needs `index_repository` + a `.git` root (non-git showcase folders need `git init` first). Verified end-to-end on bonduelle-showcase (93 files, 3155 refs).

## Paperclip — multi-agent orchestration (DONE, running)
Onboarded via `npx paperclipai onboard --yes` (trusted-local). Home `~/.paperclip`, instance `default`.
- **UI/API:** http://127.0.0.1:3100 (`paperclipai run` to start; not auto-started on boot). Embedded PostgreSQL on :54329, local file storage, local-encrypted secrets, loopback-only.
- Built-in adapters loaded include **claude_local** and **codex_local** (also gemini_local, cursor, opencode_local, grok_local, hermes_local, acpx_local, etc.).
- **Multi-agent (answers the Claude+Codex question): YES** — a Claude agent and a Codex agent can work the same company/project; they coordinate asynchronously via issue comments + `@AgentName` mentions (which wake the mentioned agent) over a shared git-worktree workspace, governed by org-chart approvals.
- **Eduard's intended topology (clarified 2026-06-01):** NOT one-company-per-project. Wants ONE workspace ("company" = just the account) with each repo as a first-class **Project** inside it. Core motivation = **context-window economics**: a lead agent spawns sub-agents (each a fresh CLI process = fresh context window) that can recursively spawn their own, pushing detail work *down the tree* so the boss/lead never fills its window — only summaries bubble up. The `reportsTo` + child-issue tree IS that offload tree. He explicitly does NOT want the heavyweight CEO/board ceremony, just the lean recursive hierarchy as the mechanism. **Why:** maximize total usable context + keep the top-level agent high-level. **How to apply:** when setting up, use one workspace + projects, enable `can_create_agents` on lead agents so recursion works, keep governance minimal, and watch token budget (deep trees = many CLI wakes).
- **BLOCKER before any agent can run:** none of the agent CLIs are on PATH (`claude`, `codex`, `gemini`, `opencode`, `cursor-agent` all absent). The adapters spawn the real CLIs, so `claude_local` needs the `claude` CLI installed globally and `codex_local` needs OpenAI's `codex` CLI. npm global prefix = `C:\Users\adumi\AppData\Roaming\npm`. LLM provider not configured (optional).
- Minor: doctor warned the secrets `master.key` file perms are 666 (loopback-only, low risk) — tighten with icacls if desired.

## Agent Command Center (gamified dashboard, built 2026-06-01)
Local Vite+React+TS app at `agent-command-center/`, dev port **5290** (`npm run dev`), in the shared `.claude/launch.json` as config name `command-center`. Mission-control dark UI that visualizes the agent org chart (recursive `reportsTo` tree), each agent as an RPG-style unit (readiness ring, model-tier badge, status), plus the **alignment questionnaire** (5-Q anti-hallucination check → readiness %) and a live **escalation feed** ("would my higher-up need to know?" → runs up the chain → apex item needs the human). Hybrid data: status bar reads Paperclip's LIVE `/api/health` + `/api/adapters` via a Vite `/api`→:3100 proxy; the org itself is seeded demo data (`src/lib/seed.ts`) until a real Paperclip company exists, then `fetchOrg()` switches to live. Built as a dogfood of the boss+subagent workflow (one general-purpose subagent did the read-only API recon; main session authored the code).

## Paperclip went LIVE with real agents (2026-06-02)
- **claude CLI installed + logged in to Max.** `npm i -g @anthropic-ai/claude-code` then `claude auth login --claudeai`. CRITICAL gotcha: the standalone npm `claude` CLI has a SEPARATE credential store from the Claude Code desktop app — being logged into the app does NOT authenticate the CLI; it needs its own `claude auth login`. Verify with `claude auth status` (shows loggedIn/subscriptionType max, email edumitriu04@gmail.com). The login uses a browser OAuth that auto-completes (no manual code paste needed in practice).
- **Real company "TNS Workspace"** (id `dd4b8de7-17bc-49e7-87af-cd0159ff7e82`, prefix TNS, $100/mo budget). Created via `POST /api/companies {name}` (local_trusted = loopback auto-trusted as `local-board` admin, no auth token needed). `company` CLI has no `create`; use the API. Agent `role` is an enum: ceo/cto/cmo/cfo/security/engineer/designer/pm/qa/devops/researcher/general.
- **5 agents**, model-tiered, all claude_local on Max: Atlas (cto/Lead Architect, sonnet, reportsTo null) → Forge (engineer, sonnet) / Sable (qa, haiku) / Quill (researcher, haiku). Each has alignment+escalation rules in its managed `AGENTS.md`. Hire via `POST /api/companies/{id}/agent-hires`. Model aliases sonnet/haiku/opus are valid in `adapterConfig.model`.
- **Wake an agent**: `npx paperclipai heartbeat run --agent-id <id>` (wake-on-demand, no timers). 
- **First real Atlas heartbeat shipped working code**: followed the alignment protocol (posted 5-pt alignment comment), completed TNS-4 (research → plan doc), created+implemented TNS-5 (derive readiness/alignment from live signals) — wrote `src/lib/readiness.ts` + rewired `api.ts` to assemble per-agent signals + handled null/pending ring. Verified live: dashboard shows DERIVED readiness (Atlas 84% aligned, workers 54%) not the old flat-100 placeholder. Clean compile.
- **Gotchas**: pre-login wake failures push assigned issues to `blocked` (claude_auth_required) and leave agent `status=error` — reopen issues with `PATCH /api/issues/{id} {status:'todo', resume:true}` and re-run the heartbeat to recover. `canCreateAgents` is immutable via PATCH (UI/hire-time grant only). The `agent-command-center` repo has NO git commits yet — all work untracked; needs an initial commit checkpoint.
- **`/paperclip` global slash command** (`~/.claude/commands/paperclip.md`, created 2026-06-02) starts/resumes this whole workflow in any new session: a verify-first playbook (health → `claude auth status` → find company → operate) with all the gotchas above baked in. Honest standing note: Paperclip's own UI (localhost:3100) is the real control plane; the custom `agent-command-center` dashboard is an optional gamified lens that overlaps it.
