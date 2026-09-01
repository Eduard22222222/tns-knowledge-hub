---
aliases: [Higgsfield Image Models, Higgsfield CLI, GPT Image 2]
tags: [skills, higgsfield, image-gen, 3d, claude-code]
updated: 2026-06-10
---

# Higgsfield Image & 3D Models (CLI)

How to reach the **advanced image models** (incl. GPT Image 2 / "GPT ImageGen 2.0") and 3D.

> **Key gotcha:** the Higgsfield **MCP** (`mcp__higgsfield__*`) only exposes the **Soul** image model
> (`generate_image_soul`) + DOP video + speech. To use **GPT Image 2, FLUX.2, Nano Banana Pro,
> Seedream, Grok**, etc. you MUST use the **CLI** (`higgsfield generate create <model>`), not the MCP.
> CLI is installed (`v0.1.40`) and logged in.

## CLI quick reference
```bash
higgsfield model list                 # all models
higgsfield upload <file>              # → upload_id for image inputs
higgsfield generate create <model> --prompt "..." --image <upload_id>
higgsfield generate cost <model> ...  # price before running
higgsfield generate wait <job_set_id> # poll a job
higgsfield product-photoshoot ...     # brand-quality, mode-specific prompt enhancement
higgsfield marketplace-cards ...      # product cards
higgsfield soul-id ...                # train/manage Soul character refs
```

## Image models (model id → name)
| Use | model id | name |
|---|---|---|
| **Top text/image gen ("GPT ImageGen 2.0")** | **`gpt_image_2`** | **GPT Image 2** |
| Flux flagship | `flux_2` | FLUX.2 |
| Flux edit/instruct | `flux_kontext` | Flux Kontext |
| Google image (best) | `nano_banana_2` | Nano Banana Pro |
| Google image | `nano_banana` / `nano_banana_flash` | Nano Banana / 2 |
| Bytedance | `seedream_v4_5` / `seedream_v5_lite` | Seedream 4.5 / V5 Lite |
| xAI | `grok_image` | Grok Image |
| Recraft (vector-leaning) | `recraft_v4_1` | Recraft V4.1 |
| OpenAI variant | `openai_hazel` | OpenAI Hazel |
| Higgsfield in-house | `text2image_soul_v2` / `soul_cinematic` | Soul V2 / Soul Cinematic |
| Cinematic product | `cinematic_studio_2_5` / `cinematic_studio_image` | Cinematic Studio 2.5 / Image |
| Z | `z_image` | Z Image |
| **Utility** | `image_background_remover`, `outpaint`, `bytedance_image_upscale`, `topaz_image`, `color_grading_lut` | bg-remove / outpaint / upscale / color |

## 3D + video (selected)
| Use | model id | name |
|---|---|---|
| **Image → 3D object** | **`sam_3_3d`** | 3D Objects (fallback to Blender/Meshy) |
| Remove bg (video) | `sam_3_video` | Remove Background |
| Cinematic video | `cinematic_studio_video_v2` / `_3_5` / `cinematic_studio_3_0` | Cinematic Studio Video |
| Top general video | `seedance_2_0`, `veo3_1`, `kling3_0`, `wan2_7` | Seedance 2 / Veo 3.1 / Kling 3 / Wan 2.7 |

## Recommended for the brand-asset job (stands / outfits / wheel)
- **Outfits (woman), stands, wheel as flat/photographic renders →** `gpt_image_2` or `nano_banana_2`
  (use `product-photoshoot` for pack-quality), feed reference images via `higgsfield upload`.
- **Brand consistency / same model across shots →** train a `soul-id` ref from the reference images.
- **True 3D models (rotatable) →** Blender path ([[Blender Skills]]) or `sam_3_3d` as a quick test.
- Always `generate cost` before batch runs; smoke-test one image before spending on a set.

## Related
- [[Blender Skills]] · [[Higgsfield Seedance Skills]] · [[Claude Skills Index]]
</content>
