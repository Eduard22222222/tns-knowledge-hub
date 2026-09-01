---
tags: [project, active, scandia, website, multi-brand]
client: Scandia Food
status: in-progress
created: 2026-04-11
---

# Scandia Brand Showcase

**Client:** Scandia Food (https://scandia.ro/)
**Status:** Code scaffold complete — awaiting client sign-off on Supabase provisioning
**Template origin:** Forked from Macromex Brand Showcase via safe clone (rsync-excluded secrets)

## Files

Located at `C:/Users/adumi/OneDrive/Desktop/claude/scandia-brand-showcase/`:

- `src/pages/ScandiaSibiu*.tsx` — Scandia Sibiu brand pages (Recenzii, Competitii, CompetitieDetail, Retete)
- `src/pages/Bucegi*.tsx` — Bucegi brand pages
- `src/pages/Sadu*.tsx` — Sadu brand pages
- `src/pages/Competitii.tsx` + `Retete.tsx` — aggregate listings
- `src/pages/Auth.tsx`, `Admin.tsx`, `Index.tsx`
- `supabase/migrations/001_scandia_schema.sql` — DB schema + 9 seeded competitions
- **Dev port:** 8084 (set in `vite.config.ts`, isolated from Macromex/Kandia/Bonduelle)

## The 3 brands in this demo

Scandia Food has **5 brands** total (Scandia Sibiu, Bucegi, Sadu, Rotina, Bălea). We're showcasing the 3 strongest for v1:

### 1. Scandia Sibiu — flagship heritage
- **Colors:** burgundy `#6B1A1D` → gold `#A8751A` gradient
- **Tagline:** "Tradiție sibiană, gust autentic."
- **Products:** Ciorbă de perisoare 400g, Pate de fazan 120g, Carne de vită în suc propriu 300g
- **Positioning:** premium, 100+ year heritage, ready meals + luxury pate

### 2. Bucegi — the pate icon
- **Colors:** forest green `#2D4A1F` → olive `#6B8040` gradient
- **Tagline:** "Pateul României, de peste 50 de ani."
- **Products:** Pate porc 300g, Pate pui 300g, Pastă pentru ouă umplute 200g
- **Positioning:** everyday nostalgia, family breakfast, most recognized Romanian pate

### 3. Sadu — rugged canned meat
- **Colors:** deep red `#8B1E1E` → charcoal `#3A2A2A` gradient
- **Tagline:** "Forța cărnii, direct în conservă."
- **Products:** Carne de vită 300g, Carne de porc 300g, Luncheon Meat 300g
- **Positioning:** camping/hiking/pantry, hearty and reliable

## Parked brands (for v2 expansion)

- **Rotina** — logo in assets, vegetable conserves
- **Bălea** — logo in assets, canned vegetables

## Content highlights

- **9 product cards** (3 brands × 3 SKUs) — all using real pack shots from the Scandia CDN
- **15 authentic Romanian reviews** — brand-tone-matched (heritage for Scandia Sibiu, familial for Bucegi, outdoor/camping for Sadu)
- **9 competitions** (3 per brand) — all thematic, with realistic Romanian prizes:
  - Masterchef acasă, 100 de ani aniversare, Comanda lunii (Scandia Sibiu)
  - Pateul copilăriei, Micul dejun de weekend, Ouă umplute 2026 (Bucegi)
  - Aventura ta cu Sadu, Rețeta de supraviețuire, Cămara perfectă (Sadu)
- **18 recipes** (6 per brand) — all authentic Romanian dishes (ciorbă, tocăniță, ouă umplute, chili de camping, canapeuri cu pate de fazan, etc.)

## Supabase isolation (critical!)

This project uses the hardened offline-stub client (see `src/integrations/supabase/client.ts`). The client:
- Blocks URLs containing `vscvgczggesdyfunialz` (Macromex), `macromex`, `kandia`, `bonduelle`, or `YOUR_` placeholders
- Falls back to a Proxy-based stub client when credentials are empty → no data leaks
- Logs `[scandia] Supabase credentials are empty or invalid...` to console on startup

The Macromex incident (2026-04-09) drove this architecture — see main vault `incident_macromex_env_leak.md`.

## Open TODOs (blocked on client sign-off)

- [ ] Fresh Supabase project (~$10/mo)
- [ ] Apply `001_scandia_schema.sql` migration
- [ ] Wire real URL + anon key into `.env.local` (NEVER `.env` — `.gitignore`-protected)
- [ ] Scandia-specific ConsumerVoice form IDs (3 placeholder URLs, one per brand)
- [ ] Update `supabase/config.toml` project_id
- [ ] Expand to Rotina + Bălea in v2

## Client decisions captured

- **2026-04-11** — Scandia Food kickoff. Chose 3 brands (Sibiu/Bucegi/Sadu) for v1 demo over the full 5. Maintains parity with Kandia's 3-brand architecture.
- **2026-04-11** — Dedicated Obsidian vault created per user standing instruction.
- **2026-04-11** — Dev port 8084 assigned. Macromex=8080, Bonduelle=8082/8083, Scandia=8084.

## Related

- [[../Knowledge/Scandia Brand Research]]
- [[../Knowledge/Scandia Product Portfolio]]
- Main vault: `Obsidian Vault/Projects/Scandia Brand Showcase.md` (pointer)
