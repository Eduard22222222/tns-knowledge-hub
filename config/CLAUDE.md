# Global instructions

## KotaDB — code intelligence (use it proactively)

KotaDB is registered as a global MCP server (`kotadb`, `default` toolset). It gives local,
dependency-aware code intelligence for any repository. Treat it as a default part of working
in code. Verified behavior on this machine (Vite + React + TS projects with `@/` path aliases):

**First use in a project — index it.**
- KotaDB does **not** auto-index. On first use in a repo, call `index_repository` with
  `repository` = a short name and `localPath` = the repo's **absolute** path.
- Indexing **requires a git root**: the folder (or an ancestor) must contain `.git`, or it
  fails with "Unable to determine project root." Most showcase folders are non-git — run
  `git init` there first, or skip KotaDB for that folder.
- `index_repository` returns a `repositoryId` UUID. Some tools (`list_recent_files`,
  `search_dependencies`) want that **UUID or full_name** as `repository`, not the short name.

**Finding code.**
- Use `search` (NOT "search_code"). `scope` must be an **array**, e.g. `scope: ["code"]` or
  `["code","symbols"]`. Modes: `paths` / `compact` / `snippet` / `full`. Confirm hits with Read.

**Safe refactor / blast radius — prefer `find_usages`.**
- `find_usages` (symbol-level) is the **primary** impact tool here. It correctly resolves
  `@/` alias imports and returns every import + call site with file, line, column, and a
  context snippet. Run it before renaming or changing the signature of any function/type/class.
- `search_dependencies` and `analyze_change_impact` are **file-level** and on these Vite
  projects they **under-report** — `@/` imports land in `unresolved_imports`, so reverse-
  dependency edges come back empty. Treat an empty `dependents` list as "unknown," not "safe";
  fall back to `find_usages` (and Grep) for the real picture. `analyze_change_impact` requires
  `change_type` ∈ {feature, refactor, fix, chore} plus a `description`.

**Scope.**
- Treat KotaDB strictly as a **code index, not a memory store**. Durable project/client
  knowledge stays in the auto-memory system and the Obsidian vaults — do not enable KotaDB's
  `memory`/`full` toolsets, which would create a competing memory store.

> `.kotadb/` is generated and machine-specific — add it to `.gitignore` in any repo you index.
