# Scandia Brand Showcase

**Client:** Scandia Food (https://scandia.ro/)
**Status:** Code scaffold complete, awaiting client sign-off on Supabase provisioning
**Template:** Forked from macromex-brand-showcase via SAFE clone (tar --exclude of .env/.git/node_modules)
**Created:** 2026-04-11

## Location

- Code: `C:/Users/adumi/OneDrive/Desktop/claude/scandia-brand-showcase/`
- **Dedicated Obsidian vault:** `C:/Users/adumi/OneDrive/Documents/Scandia Vault/`
- Pointer note in main vault: `Obsidian Vault/Projects/Scandia Brand Showcase.md`
- **Dev server port: 8084**

## The 3 brands (of 5 total in Scandia portfolio)

- **Scandia Sibiu** — flagship heritage, burgundy `#6B1A1D` → gold `#A8751A` gradient
  - Ciorbă de perisoare 400g, Pate de fazan 120g, Carne de vită 300g
- **Bucegi** — iconic pate ficat, forest green `#2D4A1F` → olive `#6B8040`
  - Pate porc 300g, Pate pui 300g, Pastă pentru ouă umplute 200g
- **Sadu** — rugged canned meat, deep red `#8B1E1E` → charcoal `#3A2A2A`
  - Carne de vită 300g, Carne de porc 300g, Luncheon Meat 300g

Parked for v2: Rotina, Bălea (canned vegetables — assets already in repo).

## Routes (flat brand-prefixed, parallel to Kandia)

- `/` `/auth` `/admin`
- `/scandia-sibiu-recenzii`, `/scandia-sibiu-competitii`, `/scandia-sibiu-competitii/:id`, `/scandia-sibiu-retete`
- `/bucegi-recenzii`, `/bucegi-competitii`, `/bucegi-retete`
- `/sadu-recenzii`, `/sadu-competitii`, `/sadu-retete`
- `/competitii`, `/retete` (aggregate listings)

## Content quality notes

- Real product pack shots from gomagcdn.ro/domains/scandia.ro/files/product/medium/
- 15 authentic Romanian reviews, brand-tone-matched
- 9 thematic competitions (3 per brand) with realistic RON prizes
- 18 authentic Romanian recipes (6 per brand), matched to Unsplash food photography

## Supabase isolation (critical)

- `src/integrations/supabase/client.ts` uses the hardened stub-fallback pattern from the 2026-04-09 Macromex leak fix
- URL blocklist: `vscvgczggesdyfunialz`, `macromex`, `kandia`, `bonduelle`, `YOUR_`
- No `.env` file created — safe clone used tar --exclude to strip the Macromex .env
- `.env.example`, `.gitignore`, and vite.config.ts port 8084 are in place

## Blocked TODOs (awaiting client sign-off)

- Fresh Supabase project provisioning (~$10/mo)
- Apply `supabase/migrations/001_scandia_schema.sql`
- Wire real Supabase URL + anon key into `.env.local`
- Scandia-specific ConsumerVoice form IDs (3 placeholders)
