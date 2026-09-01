---
name: project_brand_3d_asset_pipeline
description: "Blender + Higgsfield-CLI pipeline for brand-asset 3D/SVG/photos (stands, outfits, Intersnack wheel)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 9e2d878e-8d5b-4d0c-8b8b-6241f2538c0b
---

Pipeline for producing brand assets for the showcase clients — 3 stand variants, 2 woman-outfit
variants, and an Intersnack spin-the-wheel. Eduard supplies reference images; planning started
2026-06-10.

**Image gen → Higgsfield CLI (NOT the MCP).** CLI `@higgsfield/cli` v0.1.40, logged in. The MCP
(`mcp__higgsfield__*`) only exposes the **Soul** model; advanced models are CLI-only:
`gpt_image_2` (= "GPT ImageGen 2.0"), `nano_banana_2` (Nano Banana Pro), `flux_2`, `seedream_v4_5`,
`grok_image`. Also `sam_3_3d` ("3D Objects", image→3D). Flow: `higgsfield upload <file>` →
`generate create <model> --prompt ... --image <id>`; `generate cost` first; smoke-test before batches.

**3D objects → Blender MCP (ahujasid/blender-mcp).** This is THE canonical Blender MCP (the bridge:
`execute_blender_code`, `get_scene_info`, `get_viewport_screenshot`, PolyHaven/Hyper3D/Sketchfab).
[[project_ai_dev_tooling]]. **Gaps blocking use (2026-06-10):** (1) no `blender` entry in `.mcp.json`
or `~/.claude.json`; (2) `uv`/`uvx` not installed (server runs via `uvx blender-mcp`); (3) no Meshy
API key in memory (photo→3D skills need it); (4) Blender must be open with addon connected (port 9876).

**Blender skills** = [[kevinbadi/blender-skills]] (16 skills, NOT an MCP — playbooks on top of the
ahujasid MCP). Cloned to `blender-skills/`, saved into Obsidian `Skills/Blender/` (full bodies +
master hub `Blender Skills.md`). Most relevant: `multi-image-to-3d` (ref photos→mesh),
`polyhaven-material-swap` (3 stand finishes), `product-polish`, camera anims, `threejs-export`.
Obsidian "claude skills area" = `OneDrive/Documents/Obsidian Vault/Skills/`; index = `Claude Skills Index.md`.

**Branding:** Intersnack [[project_intersnack_brand_showcase]] — Chio red #DB2327, Tyrrells plum
#4A1942, Pom-Bär yellow #FFB800 (wheel is Intersnack-specific). VICI [[project_vici_platform]] —
red #E2001A + navy, "Tasty instantly!".

**DELIVERED 2026-06-10 — VICI Gyoza batch** (Eduard chose: VICI-only first, photoreal + SVG, Blender
deferred — he has a connector). In `vici-activation-assets/`: 3 stand renders (A Gyoza Bar island /
B Pack Tower / C Tasting Cart, mapped to Maggi/HulaHoops/Cirio Auchan reference photos i1-i3 from
Downloads, kept in refs/) + 2 outfit spec-sheets (Bistro Chef navy-kimono-apron; Promo Hostess red
polo dress) + 3 hand-built SVG 1:10 elevations (preview PNGs via `npx sharp-cli --density 110`;
Playwright file:// is blocked + flaky for this). gpt_image_2 nails RO diacritics + the VICI oval/
bamboo-O GYOZA logo when given pack+logo as `--image` refs; `--wait --json` → job has `result_url`
field. Gyoza pack aesthetic: black + sky-blue lotus band #9DB8D2, gold gyoza #E8A84C. Campaign lines:
A "Asia, direct din tigaia ta!" / B "Prinde gustul Asiei!" / C "Un tur al Asiei, direct din bucătăria
ta!". Vault doc: VICI Vault/Projects/VICI In-Store Activation Assets.md. NEXT: client picks variant →
refinement + true 3D.

**DELIVERED 2026-06-10 (evening) — Hula Hoops „Trăiește toamna" batch** in `intersnack-activation-assets/`:
KV landscape stil HEIDI (v2 = cel bun; v1 are premiile vechi pe roată — gpt_image_2 copiază text de
campanie veche din referințe dacă nu-l interzici explicit în prompt!), stand hero ensemble pe FUNDAL
STUDIO (cerința lui Eduard: nu in-store, hostesse lângă stand), 2 outfit spec-sheets (Autumn Fun sarafan
muștar+bucket hat / Shelf Promoter hanorac+lanyard), SVG producție roată Ø800 cu cele 8 premii noi.
Decizii: 15 RON prag, 1 concept hero, CV = doar QR tent card. Campanie: Carrefour 19-20 sept 2026,
15 mag., 30 promoteri, premiu garantat. HH culori: roșu #DA1F2E, galben #FFC72C, packs Chio (galben/
albastru/roșu-închis). Higgsfield 502 = tranzitoriu, retry cu sleep. Vault: Intersnack Vault/Projects/
Hula Hoops Traieste Toamna Activation.md. **Blender MCP s-a conectat în sesiune** (server „Blender" cu
execute_blender_code/render_viewport_to_path/screenshot tools + manuale RST bundled) — diferit de
ahujasid (are doc search built-in); disponibil pt faza 3D.

**2026-06-11 — feedback + Obsidian Creatives node.** Feedback Eduard pe HH: (1) counter STAND mai
mic — „ca la gyoza, un pic mai mare" → **standard de-acum: counter compact ~1m hip-height** pt toate
brandurile; (2) PS5 testat în KV apoi RESPINS — **principiu: premiile din KV trebuie să fie realiste
vs mecanică** (premii instant garantate ⇒ premii mici: tote/bucket/breloc/carduri; PS5 doar la
tragere la sorți tip premiu mare). **KV camp.1 FINAL = kv-traieste-toamna-v2.png** (v3-ps5 arhivă). **Campania 2 HH „Învârte distracția pe degete!"** (consumer
promo: bon pe microsite → recenzie CV → trageri săptămânale; 5× boxă / 20× căști / 100× voucher
cinema — brief inconsistent 50 vs 100, ales 100, de confirmat) → kv-invarte-distractia.png. Creat
**nodul mare Obsidian `Projects/Creatives MOC.md`** în vault-ul principal (template repetabil: KV
stil HEIDI + stand studio + outfit spec-sheets + SVG producție, prompt recipes, lecții QC) cu
sub-noduri per brand `Creatives - Hula Hoops (Intersnack).md` + `Creatives - VICI.md`, legate din
Projects MOC. Orice brand nou de creatives → sub-nod nou legat în Creatives MOC.

**KV camp.2 HH: FINAL = kv-invarte-distractia-v3.png** (3 runde feedback; perioada IULIE–AUGUST 2026,
nu sept–oct din brief). Feedback-ul de layout vine și de la „Al Camara" (client, prin WhatsApp screenshots
de la Eduard). Regulă întărită de Eduard: **verifică vizual render-ul ÎNAINTE de a-l declara salvat/final**
și raportează onest ce nu a ieșit (ex. logo pe bol ascuns de packs).

**Standard template (2026-06-11): SAMPLING TABLE obligatorie la toate standurile** — măsuță rotundă
bar-height, picior în culoarea brandului, guler brănduit pe blat alb, pahare mici de degustare +
dispenser șervețele, plasată lângă counter. HH campania 1 final = stand-hero-ensemble-v3-sampling.png;
HH campania 2 stand = stand-invarte-distractia.png (skin entertainment, QR „Înregistrează bonul aici",
backdrop mâna gigant + raft premii boxă/căști/cinema, fără roată).
</content>
