---
name: reference-skills-library
description: "Where Eduard's Claude skills live on disk and which bundle real scripts vs instruction-only"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 391051ba-9e88-445b-9e93-1dc8dec526b9
---

Eduard's personal Claude skills library is at `C:\Users\adumi\.claude\skills\` — hundreds of skill folders. This IS what he means by "my skill index" / "de la mine din skill index" (also catalogued narratively in the Obsidian vault at `Skills/Claude Skills Index.md`, see [[reference-obsidian-vault]]). When he says "take from my skill index," pull REAL skills from here instead of authoring new ones from scratch.

**Key gotcha — most skills are instruction-only.** The data/analytics skills (`business-analyst`, `data-scientist`, `data-engineer`, `quant-analyst`, `analytics-product`, `python-pro`, `rag-engineer`) are just SKILL.md prose — NO bundled scripts.

**Skills that DO bundle runnable scripts** (the "care conțin scripturi utile" ones):
- `xlsx/` → `recalc.py` (recalculate Excel formulas) — clean, 3 files, official doc skill w/ LICENSE.
- `pdf/` → `scripts/` ×8 (convert to images, extract/fill form fields) + reference.md/forms.md.
- `docx/`, `pptx/` → have scripts BUT also 55+ ooxml XSD schema files → too heavy to bundle cleanly.

Glob is unreliable on these folders (brace + `/*` patterns returned empty); use PowerShell `Get-ChildItem -Recurse` to inspect a skill's real file tree.

Used for the FOX training deliverable (Template-uri/skills): picked `business-analyst` + `xlsx` + `pdf`. See [[project-fox-ai-training]]. My own FOX-tailored RO skills (data-analytics/board-report/file-organizer, stdlib scripts) live in `corporate-ai-training/deliverable_skills/` as a shelved alternative.
