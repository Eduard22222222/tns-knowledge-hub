---
aliases: [Blender Skills, Blender MCP, Blender 3D]
tags: [moc, skills, blender, 3d, claude-code]
updated: 2026-06-10
---

# Blender Skills (Claude Code + Blender MCP)

Hub for the **Blender 3D automation skills**, saved from
[kevinbadi/blender-skills](https://github.com/kevinbadi/blender-skills).
Full skill bodies live next to this file in `Skills/Blender/`.

> **How to "activate":** when Eduard says *"we use Blender"*, I read the relevant
> `Skills/Blender/<skill>.md` here and execute its steps through the Blender MCP
> (`execute_blender_code`). The skills are markdown playbooks — they don't need to be
> registered as `/slash` skills to be used, but they DO need the runtime deps below.

---

## ⚠️ Runtime dependencies (status on this machine, 2026-06-10)

| Dependency | Needed for | Status |
|---|---|---|
| **Blender 5.x** + [ahujasid/blender-mcp](https://github.com/ahujasid/blender-mcp) addon, connected (N-panel → BlenderMCP → Connect), socket port **9876** | every skill | ❓ addon installed by Eduard, but **not verified connected** |
| **Blender MCP server in Claude Code config** (`uvx blender-mcp`) | Claude→Blender bridge | ❌ **NOT in `.mcp.json` or `~/.claude.json`** — must be added |
| **`uv` / `uvx`** | runs the MCP server | ❌ not installed (`uvx: command not found`) |
| **Meshy API key** (`reference_meshy_api.md`) | `image-to-3d`, `multi-image-to-3d` | ❌ **no key in memory** — must be obtained from meshy.ai |
| **ffmpeg** | video encoding for camera-animation skills | ❓ unverified |

**Bottom line:** the skills are saved and ready, but the Blender pipeline is **not yet runnable
from this session**. To turn it on: install `uv`, add a `blender` entry to `.mcp.json`, open
Blender + connect the addon, and (for photo→3D) add a Meshy key. See `_repo-README.md`.

### MCP vs GitHub — the answer
- **[ahujasid/blender-mcp](https://github.com/ahujasid/blender-mcp)** (v1.5.5) = THE canonical Blender MCP *server* (the bridge). Tools: `get_scene_info`, `get_object_info`, `execute_blender_code`, `get_viewport_screenshot`, + Poly Haven / Hyper3D Rodin / Sketchfab asset integrations. If Eduard installed "blender-mcp", it is this one — there is no competing mainstream Blender MCP.
- **[kevinbadi/blender-skills](https://github.com/kevinbadi/blender-skills)** = **NOT an MCP.** It's a 16-skill pack that runs *on top of* the ahujasid MCP. These are the files saved here.
- They are **complementary, not the same**: ahujasid = the engine, kevinbadi = the playbooks.

---

## Skill catalog (16)

### 3D model generation (photo → mesh, needs Meshy key)
- **[[image-to-3d]]** — single photo → textured GLB via Meshy, import to Blender.
- **[[multi-image-to-3d]]** — 1–4 angle photos → high-accuracy GLB. *Best for our stands/wheel from reference images.* Options: `meshy-6`, PBR, polycount, symmetry, formats (glb/obj/fbx/stl/usdz).

### Product finishing / scene
- **[[product-polish]]** — import GLB and apply glossy studio product-shot finish + lighting.
- **[[blender-toolkit]]** — low-level: create primitives, materials, modifiers, Mixamo retarget. The general-purpose builder when there's no photo to derive from.
- **[[polyhaven-studio-setup]]** — pro product-photography studio (HDRI + PBR ground).
- **[[polyhaven-scene-builder]]** — full scene: HDRI + pedestal + props.
- **[[polyhaven-texture-apply]]** — apply PBR textures (metal/wood/marble…) to any object.
- **[[polyhaven-material-swap]]** — cycle materials, render each variant (great for *3 stand finishes*).
- **[[polyhaven-hdri-showcase]]** — same product across multiple HDRIs, comparison grid.

### Camera animation (ProRes 4444 + alpha, 1920×1080 24fps → ~/Desktop/Blender Videos/)
- **[[turntable]]** — classic 360° orbit.
- **[[perfect-loop]]** — seamless infinite 360°.
- **[[slow-zoom]]** — cinematic push-in on a hero detail.
- **[[dolly-rotate]]** — forward + rotate sweep.
- **[[crane-shot]]** — low→high dramatic reveal.
- **[[dynamic-full-loop]]** — speed-ramped all-faces loop with whip transitions.

### Web export
- **[[threejs-export]]** — export scene as GLB + ready-made Three.js HTML viewer (orbit + auto-rotate). *Useful if we want interactive 3D stands on the showcase sites.*

---

## Alternative 3D path (no Meshy / no Blender)
Higgsfield CLI exposes **`sam_3_3d` ("3D Objects")** — image→3D directly. Worth testing as a
fallback when Meshy/Blender aren't wired. See [[Higgsfield Image & 3D Models]].

## Related
- [[Claude Skills Index]] · [[Higgsfield Seedance Skills]] · [[Higgsfield Image & 3D Models]]
</content>
</invoke>
