# Albalact Consumer Platform

RO-only brand platform (Consumer Voice style) for **Albalact** (Romania's largest dairy producer, part of Groupe Lactalis). Adapted from VICI/FrostBite architecture but with a **fully redesigned dairy identity** — NOT a blind clone (user: "adapt the design for them... make a masterpiece").

- **Live:** https://albalact-showcase.netlify.app (Netlify `albalact-showcase`, siteId `0f512fa3-e5b6-416a-8941-0c4425964ef3`, team edumitriu04)
- **Code:** Desktop/claude/albalact-platform/ (Vite+React+TS+Tailwind+shadcn). Vault: OneDrive/Documents/Albalact Vault/.
- **Status (2026-06-08): BUILT + DEPLOYED + VERIFIED.** Romanian only (NO language toggle — i18n fully stripped: deleted src/i18n + LanguageToggle, removed LanguageProvider, replaced every t("ro","en")→ro). Offline demo (stub Supabase).

## Identity (real, sampled from albalact.ro)
- Palette: Albalact **blue #0072BC + green #00A14E** (logo = green leaf + blue wordmark) on cream/white. Brand accents: Zuzu cyan #00AEEF, Fulga orange #F39200, Rarăul red #C8102E. Font **Poppins**+Open Sans. Tokens in src/index.css; global sed swapped VICI red→Albalact blue/green across src.
- Logo: official logo-albalact.svg.

## Content (RO)
- **Recenzii by BRAND** (matches albalact.ro grouping): Zuzu / Fulga / Rarăul, 3 REAL pack-shots each (9, from albalact.ro/wp-content/uploads/...) + brand-logo headers + reviews. Zuzu (lapte 3,5% 1,8L, iaurt vișine, iaurt piersici&caise); Fulga (iaurt băut piersici, iaurt băut căpșuni-banane, brânzică căpșuni); Rarăul (cașcaval Dalia, telemea vacă, cașcaval afumat).
- **Retete:** 3 RO dairy recipes w/ nanobanana photos (Clătite cu brânză dulce & smântână, Salată cu telemea Rarăul, Bol cu iaurt Zuzu & fructe).
- **ConsumerVoice:** all 9 product "Lasă o recenzie" buttons + homepage brand card → general form https://feedback.consumervoice.eu/f-168782 (CONSUMERVOICE_URL const in Recenzii.tsx; BrandsSection reviewLink). Opens in NEW TAB — form sends X-Frame-Options: SAMEORIGIN so it CANNOT be iframe-embedded.
- **Concursuri:** 3 detailed (Cumpără&Câștigă bon / Recipe Video Contest / Foodie Photo) — Higgsfield cinematic covers + nanobanana transparent prizes (robot bucătărie/mixer, set oale, set ustensile, coș/voucher). Deadlines 30 nov / 15 dec / 20 dec 2026.

## Tooling
- **Higgsfield CLI**: hero poster (cinematic_studio_2_5) → hero VIDEO (cinematic_studio_video_v2, --start-image) + 3 comp covers. Ran as one background bash pipeline that downloads result URLs.
- **nanobanana MCP**: 3 recipe + 3 prize images; prizes flood-filled white→transparent via PIL (rembg avoided).
- Claude-in-Chrome scraped pack-shots/logos/colors (screenshots time out on heavy PNGs — verify via DOM javascript_tool instead).

## Backend (LIVE as of 2026-06-09)
- **Dedicated Supabase** `albalact-platform` ref **sshxtlhwmjdvizgadiqa** (eu-central-1, org Eduard Dumitriu Org hvtdecfwdjtzcezcrmtb, $10/mo PAID — user approved). URL https://sshxtlhwmjdvizgadiqa.supabase.co, publishable key sb_publishable_YHQohLK27TDmC1vxThb-OQ_GeU_n9fy (public, in .env + Netlify env + bundle).
- Schema (reconstructed from code, no migration files existed): profiles (+ handle_new_user trigger, role user/admin), competitions (+ entry_count maintained by trg), competition_entries, competition_photos, is_admin() SECURITY DEFINER (avoids RLS recursion), RLS on all. Auth users created via SQL with ALL token columns='' (confirmation_token etc.) to dodge GoTrue "Database error querying schema".
- **Admin login: office.the.niche.society@gmail.com / Albalact2026!** (role=admin, pre-confirmed). Demo consumers: maria.ionescu@example.com + andrei.pop/elena.dumitru/george.stan/ioana.radu/vlad.munteanu @example.com, all password **Demo2026!**.
- Seeded 3 campaigns (Cumpără&Câștigă / Recipe Video / Foodie Photo) + 17 entries (statuses pending/approved, left unmarked so admin can demo the random winner-picker live).
- **Participation wired:** Competitii CTA — logged out → "Conectează-te pentru a participa" → /auth; logged in → inserts competition_entries row (toast "Te-ai înscris!"), shows "Înscris ✓". Maps hardcoded comp by title → DB id (fetched on mount).
- NOTE: new public sign-ups need email confirmation (default ON) — demo uses pre-confirmed accounts. Offer to disable mailer confirmation if open registration wanted.
- Verified live: frontend GET /rest/v1/competitions → 200; admin+consumer password grant → access_token OK.

## Security
- Offline Supabase stub w/ anti-leak blocklist in client.ts (blocks vici/macromex/frostbite/tchibo/kandia/bonduelle/petvia/scandia/caroli/intersnack/velpitar/nordic/cristim). No .env leaked (verified after clone). Dedicated Albalact Supabase at sign-off.

## Hard-won ops notes (OneDrive + clone)
- `cp -r vici-platform` copies node_modules (huge) over OneDrive = very slow → kill it.
- OneDrive RE-SYNCS deleted node_modules back from cloud, fighting rm/robocopy/PowerShell. Solution: **Move the dir OUT of the OneDrive folder** (to C:\Temp, same volume = instant metadata move) then rd /s /q there; OR robocopy from vici excluding node_modules and **junction node_modules** (`cmd /c mklink /J link target`) to vici's — instant, OneDrive skips reparse-point contents.
- Netlify: create site `netlify sites:create --name X --account-slug edumitriu04` (interactive team prompt breaks non-interactive → pass --account-slug). Deploy via `.netlify/state.json` {"siteId":...} + `netlify deploy --prod --dir=dist`; `--site=<name>` flag fails "Not Found".

## NEXT
- Dedicated Supabase at sign-off; optimize comp-cover PNGs (~2.8MB → webp); optional QR + proposal PDF. Admin page internal keys still "vici" (harmless, offline) — labels say Albalact.
