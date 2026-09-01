---
aliases: [VICI Activation, VICI Stands, Gyoza Stands]
tags: [project, vici, activation, in-store, gyoza]
created: 2026-06-10
status: concepts-delivered
---

# VICI Gyoza — In-Store Activation Assets 🥟

Concept pack for the **VICI Gyoza in-store sampling activation**: 3 stand variants + 2 woman
brand-ambassador outfits, delivered as **photoreal renders** (GPT Image 2 via Higgsfield CLI) +
**editable SVG front elevations** with dimensions.

**Files:** `Desktop/claude/vici-activation-assets/` (refs / renders / svg + README.md)

## Inspiration → concept mapping

Reference photos: 3 real stands shot at Auchan (Maggi cooking island · Hula Hoops pack tower · Cirio tasting cart), saved in `refs/`.

| Variant | Concept | Campaign line | Pairs with outfit |
|---|---|---|---|
| **A — Gyoza Bar** | Cooking-demo island: canopy header, black wrap + lotus band `#9DB8D2`, induction hob, red LED underglow, badge „DEGUSTARE GRATUITĂ" | *Asia, direct din tigaia ta!* | 1 (Bistro Chef) |
| **B — Pack Tower** | Crate tower cu 3 variante (pui/porc&vită/legume BIO) + tejghea curbată „NOU" + topper panglică cu gyoza 3D | *Prinde gustul Asiei!* | 2 (Promo Hostess) |
| **C — Tasting Cart** | 2 module navy la raionul Congelate, toppere evantai asiatic, plită portabilă, roll-up | *Un tur al Asiei, direct din bucătăria ta!* | 1 (Bistro Chef) |

## Outfits

1. **Bistro Chef** — black mandarin chef jacket + navy kimono apron (VICI badge, GYOZA wordmark, lotus hem), black cap. Premium culinary.
2. **Promo Hostess** — VICI-red polo dress + sky-blue lotus half-apron, red cap, lanyard „DEGUSTARE GRATUITĂ". Bright retail.

Both = front+back uniform-spec sheets.

## Production notes

- Renders: `gpt_image_2`, 3:4, 2k, high; refs passed: chicken pack + color logo (+ all 3 packs for B). Diacritics rendered correctly; logo accurate (red oval + blue swoosh + bamboo-O GYOZA).
- SVGs: hand-built 1:10 elevations, brand tokens exact (red `#E2001A`, navy `#0F3B5C`, lotus `#9DB8D2`, gold `#E8A84C`); preview PNGs via sharp-cli.
- Blender path deferred deliberately — connector exists; for true 3D use skills in `Obsidian Vault/Skills/Blender/` ([[Blender Skills]]).

## Next

- [ ] Client selection → refine winning variant (side/back views, dielines, real-scale print artwork)
- [ ] Composite scene: ambassador + stand together
- [ ] True 3D (Blender MCP / sam_3_3d) for the chosen stand
- [ ] Same exercise for Intersnack (3 stands + **wheel**) — pending

## Related
- [[VICI Consumer Voice Platform]] — main platform project
- [[Blender Skills]] · [[Higgsfield Image & 3D Models]] (Obsidian Vault/Skills/)
