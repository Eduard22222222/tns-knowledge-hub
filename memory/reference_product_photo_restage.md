---
name: reference_product_photo_restage
description: Reusable Higgsfield recipe to restage ugly e-commerce product photos into premium studio shots without altering the product
metadata: 
  node_type: memory
  type: reference
  originSessionId: a897ea9b-50b1-47b9-977e-df8517b2fa93
---

Recipe proven 2026-07-13 on Auto'sWorld (see [[project_online_shop_ecommerce]]): turn bad supplier/magazine-cover product photos into premium studio packshots **without inventing or altering the product**.

- **Model: `seedream_v5_pro` (3 cr) or `seedream_v5_lite` (1 cr)** via Higgsfield CLI. Lite ≈ Pro quality for product restage — use Lite for volume. Kling (`kling_omni_image`, 0.5 cr) too dark, model gets lost. Nano_banana (MCP) = weaker, backgrounds read as AI.
- **One-step from raw source works** (magazine cover, amateur photo) — no need to pre-extract. `higgsfield generate create seedream_v5_lite --prompt "$(cat prompt.txt)" --image orig.jpg --aspect_ratio 1:1 --wait` → grep `https://\S+\.png` from output → curl download.
- **CRITICAL prompt clause**: "keep the model EXACTLY as shown INCLUDING any rust/weathering/patina/custom finish — do NOT clean, repaint, restore or beautify." Verified it preserved an intentionally-rusted "custom" die-cast (would otherwise get auto-cleaned). Also: "remove magazine text/logos/barcode/price tags and original background."
- **Auto'sWorld house style** (matches the "Night Showroom" theme): model on a **matte black lacquered wooden collector base**, background = modern auto atelier at night, **red LED light bar #D22C3A** on wall (brand red) casting rim light, polished dark floor reflection, 85mm f/2.8 shallow DoF, "indistinguishable from a real photograph." Prompt saved at `autosworld-platform/poze-legenda/_prompt.txt`.
- **CLI gotcha**: `higgsfield` is a Windows npm `.cmd` shim → Python `subprocess` fails with WinError 2. Run the batch loop in **bash** (Git Bash resolves it), not Python subprocess.
- **Upload to WooCommerce**: `POST /wp/v2/media` with raw bytes + `Content-Disposition: attachment; filename="<seo-slug>.png"`, then `POST /wp/v2/media/{id}` set `alt_text`/`title`, then `PUT /wc/v3/products/{id}` `{"images":[{"id":media_id}]}` to make it the featured image (replaces old). Scripts: `_restage_legenda.sh` + `_upload_legenda.py`.
- WP auto-generates responsive sizes (100→1536px) so the 4MB 2048² original isn't served directly. For hundreds of images, pre-compress to ~1200px JPEG before upload to save disk.
- **Scope discipline**: only restage photos that are actually bad (Auto'sWorld: ~85% were already official Solido/GT-Spirit/Norev packshots — don't touch those; risk of detail drift on collector items = returns). Restaged only the ~186 fascicule covers (Mașini de Legendă/Colecție/KIT).

**UPDATE 2026-07-16 — nanobanana/Gemini is now VIABLE (contradicts the older 'weaker' verdict):** `gemini-3.1-flash-image-preview` did 44/47 production un-boxing restages (blister/box removal + Night Showroom style) at quality ≈ Seedream, **FREE** (key = `GOOGLE_AI_API_KEY` in `%APPDATA%\Claude\claude_desktop_config.json` → call API direct from Python for batches, NOT via MCP which times out at ~60s). Un-boxing WORKS one-step (model extracted from blister faithfully). **QC failure modes to check every batch:** (1) invents OPEN doors/hoods (Countach scissor doors, Hyperfin canopy), (2) color drift (dark blue→grey, black Batplane→red), (3) wheel style drift; all fixable with corrective clauses ("doors must stay CLOSED", "color is DARK BLUE, not grey"). **NEVER restage multi-pack sets/playsets** (Giftpack 5x, diorame) — model picks one car or invents an assembly; box photo = correct representation. Note `\bpack\b` regex does NOT catch "Giftpack". Detection recipe: Gemini vision over numbered 30-cell montages, 6 montages/call = ~180 products/call, 100% accuracy vs manual check; >3 parallel calls → 500 errors.
