---
name: reference_tns_proposal_template
description: "What \"TNS proposal template / stilul nostru\" means — the canonical TNS proposal PDF standard and how to build it"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 391051ba-9e88-445b-9e93-1dc8dec526b9
---

When Eduard says **„template de proposal TNS"**, „stilul nostru The Niche Society", „oferta în stilul nostru" etc., he means the **canonical TNS proposal PDF** — built with **Python + reportlab** (a `build_<client>_proposal.py` script), NOT a Word/HTML doc.

**Canonical references to copy from (look at these FIRST):**
- `build_pbc_proposal_v2.py` → `TNS_Proposal_PopBricuCrai_FINAL.pdf` (PopBricuCrai) — cream/gold theme
- `salt-bank-project/` → `TNS_Proposal_SaltBank_*.pdf` (HTML+PDF)
- `build_mero_proposal.py`, `TNS_Proposal_AestheticLabs*`, `Propunere_Serpico_*` — black-on-white variants
- `corporate-ai-training/build_fox_proposal.py` — RO example w/ Arial diacritics (FOX training)

**NON-NEGOTIABLE: the cover MUST show the official TNS LOGO IMAGE (centered, top), not just the letter-spaced text wordmark.** I once shipped a version with only the text wordmark and Eduard called it out. Put the logo big on the cover + small on the closing page, with wordmark "T H E  N I C H E  S O C I E T Y" + tagline "Digital Solutions · Brand Development · AI Integration" under it.
- Logo file (square 499×499, transparent PNG): `C:\Users\adumi\OneDrive\Pictures\Folder nou\The nice society\Gemini_Generated_Image_t5e30qt5e30qt5e3-removebg-preview.png`. Copies: desktop/claude root `Gemini_Generated_Image_t5e30qt5e30qt5e3-removebg-preview.png` and `salt-bank-project/tns-logo.png`.

**Standard structure:** Cover (logo + wordmark + meta) → Executive Summary (personal "Stimată echipă …"/"Dear …" note) → Problem/Why → Solution → Scope/Curriculum → Pricing (tiers, big price numbers, dark emphasis box) → Why TNS → Next Steps + CTA (dark box w/ contact). Footer on every page: `CONFIDENȚIAL · The Niche Society · 2026` + page number. Cover meta block: PREPARED FOR / DATE / VALID UNTIL / REFERENCE = `TNS-<CLIENT>-2026-NNN`.

**Build conventions:**
- PDFs usually output to the `C:\Users\adumi\OneDrive\Desktop\claude` root (build scripts there too).
- Romanian text → register Arial TTF (`C:\Windows\Fonts\arial.ttf` / `arialbd.ttf`) for diacritics; use curly quotes „ ” in content (straight `"` breaks Python string literals).
- `pdftoppm` is NOT installed → verify visually by rendering pages with **PyMuPDF (`fitz`)** to PNG, then view.
- Theme variants both valid: PBC = cream (#…) + gold accent bar; MERO/AestheticLabs = clean black-on-white. Pick to match client.

See also [[feedback_proposal_style]] (emojis/concrete RO examples/honest assessments) and [[project_fox_ai_training]].
