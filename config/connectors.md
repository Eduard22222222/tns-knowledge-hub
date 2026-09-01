# claude.ai Connectors

These are hosted, OAuth-authenticated MCP connectors managed through the claude.ai account (`edumitriu04@gmail.com`), not local files — there's nothing to copy for these; a new AI instance/account needs its own OAuth authorization per connector via claude.ai's connector settings (or `claude mcp` / `/mcp` in an interactive Claude Code session for non-claude.ai servers).

## Active (authorized, in regular use)

| Connector | Used for |
|---|---|
| **Supabase** | Managing project databases (each TNS brand showcase / client platform has its own isolated Supabase project — see `memory/policy_supabase_isolation.md`). |
| **Ahrefs** | SEO/backlink/keyword research, site audits, rank tracking, brand radar (AI-visibility tracking), web analytics — used across TNS Ads Manager and client SEO work. |
| **Canva** | Design generation/editing (brand templates, social assets). |
| **Postman** | API collection/spec management. |
| **Vercel** | Project deploys, domains, deployment protection, analytics for Vercel-hosted client platforms. |

## Configured but not yet authorized on this machine

These need `/mcp` (interactive Claude Code session) or the claude.ai connector settings to complete OAuth before their tools work:

- **Adspirer** (ads agent — Google/Meta/Amazon/TikTok/LinkedIn/ChatGPT Ads)
- **Asana**, **Atlassian** (Jira/Confluence), **Figma**, **Intercom**, **Linear**, **Notion**, **Slack** — via the `design` plugin bundle
- **Vercel** (plugin-marketplace variant, separate from the active Vercel connector above)

## Setting this up fresh

1. Go to claude.ai → Settings → Connectors (or run `/mcp` inside an interactive Claude Code session for CLI-managed ones).
2. Authorize each connector you need — this is per-account, not something exportable/importable via files.
3. Cross-reference `memory/reference_keys_folder.md` and `memory/policy_supabase_isolation.md` for which accounts/projects each connector should point to (e.g. Supabase has two separate accounts: TNS org via PAT/Management API vs. Eduard's personal account via MCP/CLI — check before requesting a key).
