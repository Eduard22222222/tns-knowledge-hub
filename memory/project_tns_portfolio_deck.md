---
name: project-tns-portfolio-deck
description: "Bilingual TNS credentials/portfolio PDF generator in tns-portfolio/, built 2026-08-21 for active sales"
metadata: 
  node_type: memory
  type: project
  originSessionId: 4e0fab2f-523d-48ee-8cd9-f14ade8d78de
  modified: 2026-08-21T13:29:02.813Z
---

TNS credentials deck ("portofoliu ca un CV"), built 2026-08-21 because Eduard is actively selling.
Generator lives in `tns-portfolio/`, outputs **16-page A4 PDFs in both languages** to the desktop root:
`TNS_Portofoliu_2026.pdf` (RO) and `TNS_Portfolio_2026.pdf` (EN).

**Instagram proof without login:** the reels grid on instagram.com is unusable for automation —
the video tiles freeze Chromium's renderer and the CDN URLs are stripped by the tool's filter.
What works: pull reel shortcodes from the *main profile grid* via JS in the logged-in Chrome
(return only `/reel/CODE/` paths, never image src, or the result is blocked), then render
`instagram.com/reel/<CODE>/embed/` in headless Playwright — public, no login, one video per page
so nothing freezes. The reels tab lazy-loads only ~15 clips per batch and the page snaps back to the top, so a couple of scrolls looks like the whole account — it is not. Keep issuing real `computer` scroll+wait cycles (JS scrollTo does NOT trigger the loader) until the count list stops growing; GoaMasaj's best clip (19.9K) sat ~30 reels down and was missed twice by stopping early. Best mapping trick: once the grid is loaded, one JS pass over `a[href*="/reel/"]` returns verified `code|views` pairs. The embed shows **likes, not views**, so counts cannot be verified
per clip; keep them as aggregate stat tiles read off the reels tab and never pin a number to an
individual thumbnail.

**Structure of the generator** — content is separated from rendering so both languages stay in sync:
- `content_ro.py` / `content_en.py` — one dict each, identical key sets (parity is checked)
- `content_rsm.py` — the RSM section, merged into both dicts at import
- `make_deck.py` — all helpers + the 13 page functions; run `python tns-portfolio/make_deck.py ro|en`
- `shoot.py` (Playwright site screenshots) → `prep.py` (crop/round) → `logos.py` + `logos2.py` +
  `logowall.py` (client logo wall) → `img/`

**Design upgrade over the older `build_*_proposal.py` house style:** GeorgiaPro family
(Light / Bold / CondBlack for the oversized section numerals) instead of Palatino, still with
Segoe UI for body and the gold `#C5A55A` / cream `#FBFAF7` palette. Logo must be the autocropped
variant — the source PNG has huge transparent margins, and a light recolour is needed for dark pages.
Keep screenshots as JPEG composited on the cream page colour: PNG kept the deck at 20 MB, JPEG
brings it to ~1.5 MB, which matters because this gets emailed.

Sections: intro · services · client list + logo wall · FOX · RSM · Consumer Voice · AutosWorld ·
Contabil Augmentat · websites · marketing · HoReCa · contact.

See [[reference-tns-proposal-template]] for the older single-client proposal format — this deck is
the multi-client companion, not a replacement. Client facts feeding it live in
[[project-fox-saga-redeem]], [[project-rsm-romania-lead]], [[project-consumervoice-leadgen]],
[[project-online-shop-ecommerce]], [[project-saga-mcp]], [[project-goamasaj-ads]].

**Conta4U is NOT a client** — it is Eduard's own operating company (the legal entity behind TNS). Never list it in a portfolio client roster; the SAGA/CECCAR work ships as the *Contabil Augmentat* capability page instead, with no client name attached.
