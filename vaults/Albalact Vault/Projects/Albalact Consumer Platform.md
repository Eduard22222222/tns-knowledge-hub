# Albalact Consumer Platform

Brand-platform demo (Consumer Voice style) for **Albalact** — Romania's largest dairy producer, part of **Groupe Lactalis România**. Romanian-only (no language toggle), adapted from the VICI/FrostBite showcase architecture but with a **fully redesigned dairy identity**.

- **Live:** https://albalact-showcase.netlify.app (Netlify project `albalact-showcase`, ID `0f512fa3-e5b6-416a-8941-0c4425964ef3`)
- **Code:** `OneDrive/Desktop/claude/albalact-platform/` (Vite + React + TS + Tailwind + shadcn)
- **Status (2026-06-08): BUILT + DEPLOYED.** Single-language RO. Offline demo (stub Supabase, no backend until sign-off).

## Brand & identity
- **House of brands** (from albalact.ro/branduri): Albalact, Zuzu, Fulga, Rarăul, Poiana Florilor, DZL, Horeca Top. Slogan: *"Din lapte bun și proaspăt."*
- **Palette (real, sampled from logo):** Albalact **blue `#0072BC`** + **green `#00A14E`** (logo = green leaf/heart + blue wordmark), clean cream/white background. Brand accents: Zuzu cyan `#00AEEF`, Fulga orange `#F39200`, Rarăul red `#C8102E`.
- **Font:** Poppins (headings) + Open Sans (body) — friendly, fresh, "not vibecoded".
- **Logo:** official `logo-albalact.svg` from albalact.ro.

## Structure (RO only)
- **Home (hero):** Higgsfield cinematic **video** of fresh milk pouring into a glass, green meadow + cheese (like the Tchibo/VICI hero). CTA → Concursuri.
- **Recenzii:** products organized **by brand** (matches how albalact.ro groups them) — **Zuzu / Fulga / Rarăul**, 3 real pack-shots each (9 total, downloaded from albalact.ro/wp-content/uploads) + ratings + reviews, brand-logo section headers with brand accent colors.
  - Zuzu: lapte integral 3,5% (1,8L), iaurt cu vișine 400g, iaurt cu piersici & caise 400g
  - Fulga: iaurt de băut piersici & caise, iaurt de băut căpșuni & banane, brânzică proaspătă cu căpșuni
  - Rarăul: cașcaval Dalia 450g, telemea de vacă 400g, cașcaval afumat 250g
- **Rețete:** 3 authentic RO dairy recipes (nanobanana photos): Clătite cu brânză dulce și smântână, Salată cu telemea Rarăul, Bol cu iaurt Zuzu/fructe/granola. Expandable ingredients + steps.
- **Concursuri:** 3 detailed competitions (Higgsfield cinematic covers + nanobanana transparent prize cutouts):
  1. *Cumpără & Câștigă cu Albalact* (bon fiscal) — 2× robot bucătărie, 10× set oale, 50× coș Albalact (30 nov 2026)
  2. *Albalact Recipe Video Contest* — 1× robot bucătărie, 3× set ustensile, 10× coș (15 dec 2026)
  3. *Albalact Foodie Photo* — 3× set ustensile, 20× voucher (20 dec 2026)
- **Auth / Admin:** RO; admin dashboard internal (offline).

## Tooling used
- **Higgsfield CLI** (`@higgsfield/cli`, logged in): hero poster (`cinematic_studio_2_5`) → hero video (`cinematic_studio_video_v2`, image-to-video), + 3 competition covers.
- **nanobanana MCP** (Gemini): 3 recipe photos + 3 prize images (mixer/cookware/utensils), white bg → PIL flood-fill transparent cutouts.
- **Claude-in-Chrome:** scraped albalact.ro for real pack-shots, brand logos, colors, product names.

## Security / isolation
- **Offline-safe Supabase stub** with anti-leak blocklist (`client.ts`) — blocks foreign refs (vici/macromex/frostbite/tchibo/kandia/bonduelle/petvia/...) so it can never boot against another tenant. No `.env` leaked (verified clean after clone).
- Each brand showcase needs its **own paid Supabase** at sign-off (policy_supabase_isolation).

## Build/deploy notes
- node_modules **junctioned** to vici-platform's (`mklink /J`) to dodge OneDrive's brutal file-copy slowness. Build: `npm run build`; deploy: `npx netlify deploy --prod --dir=dist` (site pinned via `.netlify/state.json` siteId; `--site=<name>` flag fails "Not Found").
- OneDrive fights deep `node_modules` deletes by re-syncing from cloud — move dirs OUT of the OneDrive folder (`C:\Temp`) to delete, or robocopy-mirror an empty dir.

## NEXT
- Dedicated Albalact Supabase at sign-off; optimize image weights (comp covers are ~2.8MB PNG — convert to webp/jpg); optional QR code; proposal PDF.
