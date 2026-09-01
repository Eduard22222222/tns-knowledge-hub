---
name: Gemini API Key Leak Incidents
description: Pattern of Google auto-revoking Gemini keys as leaked. Solution moved to env var + helper. Project itself was eventually banned (PERMISSION_DENIED on all keys).
type: project
originSessionId: 22aa63e1-aa36-4fb5-9998-8d706ccbaaba
---
**Pattern:** Gemini API keys hardcoded in scripts/brand-bibles repeatedly get auto-revoked by Google's secret scanner ("Your API key was reported as leaked"). Happened ~7 times for this user before root-cause fix.

**Root cause not the rotation, but the surface:** keys were hardcoded in 10+ files (carousel generators, brand bible, .mcp.json, Claude permission allowlist). Any one of those reaching a public surface (GitHub commit, screenshot, AI transcript indexed somewhere) would trigger Google revocation across all keys in that project.

**Eventual escalation (2026-04-29):** Google didn't just revoke keys anymore — it banned the entire Google Cloud project. New keys generated in the same project return `403 PERMISSION_DENIED. Your project has been denied access.` on any model. Fix requires creating a NEW Google Cloud project with billing enabled.

**Why:** Free tier on `gemini-2.5-flash-image` is 0 — even an unbanned project needs billing for image gen.

**How to apply:**
1. **Never hardcode keys.** All scripts must `from _gemini_key import get_key` (lives at `C:/Users/adumi/OneDrive/Desktop/claude/_gemini_key.py`). Helper reads `GOOGLE_AI_API_KEY` env var, falls back to Windows registry (HKCU/Environment) so it works without terminal restart.
2. **Set the key once via PowerShell:** `[Environment]::SetEnvironmentVariable("GOOGLE_AI_API_KEY", "<key>", "User")`. Lives in registry, never on disk in plaintext, never synced to OneDrive/GitHub.
3. **When generating new keys:** create them in a fresh Google Cloud project, enable billing, and add API restrictions (only `Generative Language API`).
4. **Smoke-test before bulk runs:** one tiny generate_content call before kicking off 21+ carousel image gens — fail fast.
5. **Files cleaned in this rotation:** all `generate_carousel*_visuals.py` (2-11), `.mcp.json`, `.claude/settings.local.json`, brand bible (`creative-director/brands/goamasaj.md`). All now reference env var, no plaintext keys remain on disk in active config.
