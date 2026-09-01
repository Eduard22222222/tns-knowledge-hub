# Supabase Isolation Policy

**Decision date:** 2026-04-09
**Decided by:** Eduard (explicit request)

## Rule

Each brand showcase project (Macromex, Kandia, Bonduelle, and any future clones) **must have its own dedicated paid Supabase project**. Do NOT share Supabase projects or databases between showcases.

## Rationale

- Data isolation — reviews/competitions/entries from one client must never leak into another
- Clean RLS policies per client
- Separate auth user pools per client
- Independent billing, backup, and scaling decisions per client

## Cost

- Each new Supabase project on Eduard's org: **$10/month recurring**
- Organization: Eduard Dumitriu Org (`hvtdecfwdjtzcezcrmtb`)
- Existing project: `fozwevxelozdzqyjtbuq` (Macromex-era, check before reusing)

## Workflow

1. Client signs off on project scope
2. User (Eduard) gives explicit go-ahead to create the Supabase project ($10/mo financial action = requires explicit permission)
3. Create project via Supabase MCP `create_project`
4. Apply migrations via `apply_migration`
5. Fetch publishable key via `get_publishable_keys`
6. Wire URL + key into that project's `src/integrations/supabase/client.ts`
7. Update `supabase/config.toml` project_id

## Alternatives considered and rejected

- **Shared project with schema isolation** (`kandia.*`, `bonduelle.*`) — rejected: user explicitly wants "individual ones, data doesn't get fucked"
- **Local-only SQLite** — rejected: no Supabase Auth, no realtime
