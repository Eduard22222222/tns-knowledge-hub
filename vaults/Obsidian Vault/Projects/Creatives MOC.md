---
aliases: [Creatives, Brand Creatives, Activation Creatives]
tags: [moc, creatives, activation, in-store, key-visual]
created: 2026-06-11
---

# Creatives MOC 🎨

Nod mare pentru **creativele de brand** (campanii in-store & consumer promo): key visuals,
standuri, roți de premii, outfit-uri promoteri, SVG-uri de producție. Fiecare brand are un
sub-nod legat aici; livrabilele propriu-zise stau în folderul de cod + vault-ul dedicat al brandului.

## Brand sub-nodes

- [[Creatives - Hula Hoops (Intersnack)]] — 2 campanii toamnă 2026 (Roata Distracției + Tragere la sorți)
- [[Creatives - VICI]] — VICI Gyoza in-store sampling (3 standuri + 2 outfit-uri)
- [[Creatives - GoaMasaj]] — brand boho-premium (dreamcatcher, aur `#e0a94c` + cream); latura de business: [[GoaMasaj Academy]]
- *(next: orice brand nou primește `Creatives - <Brand>.md` legat aici)*

## Template-ul de livrabile (rețeta repetabilă)

Pentru o campanie de activare, pachetul standard:

1. **Key Visual** — landscape 4:3, structura „HEIDI": logo ribbon sus · headline cu accent script ·
   element hero (roată/mână/produs) · buline premii (MARELE PREMIU separat) · panel alb cu 3 pași
   numerotați · packs jos · strip legal cu perioadă/retailer.
2. **Stand hero ensemble** — fundal studio gri (NU in-store, decizie Eduard), counter compact
   (~1 m, hip-height — feedback: „ca la gyoza, un pic mai mare"), backdrop, roată/mecanică,
   widget Consumer Voice (**doar QR tent card**), hostessele lângă stand purtând outfit-urile.
3. **Outfit spec-sheets** — aceeași femeie, front+back side-by-side, fundal gri, catalog-style;
   back-print cu mesajul campaniei; accesorii tie-in cu premiile (ex. bucket hat).
4. **SVG producție** — elevații 1:10 cu cote mm, culori brand exacte, editabile (roată cu segmente
   + alocări premii, stand front elevation).

## Tooling & rețete de prompt

- **Generare:** Higgsfield CLI `gpt_image_2` (4:3 KV/stand, 3:4 outfits; 2k, high). Refs prin
  `--image` (pack + logo obligatoriu). Detalii modele: [[Higgsfield Image & 3D Models]].
- **SVG preview/QC:** `npx sharp-cli --density 110 -i x.svg -o x.png` (Playwright file:// blocat).
- **3D (faza următoare):** Blender MCP conectat + [[Blender Skills]].
- **Parsare job:** `--wait --json` → câmpul `result_url`; la HTTP 502 → `sleep 20-25` + retry (mers de fiecare dată).

## Lecții QC (de citit înainte de orice batch nou)

- ⚠️ **Referință cu text de campanie veche ⇒ interzice explicit textul** în prompt și enumeră
  etichetele noi, altfel gpt_image_2 le copiază (pățit cu roata: voucher cinema/bilet festival).
- Diacriticele RO ies corect pe gpt_image_2; logo-urile complexe (oval VICI, inel Hula Hoops) ies
  fidel DOAR cu referință imagine atașată.
- Verifică VIZUAL fiecare render înainte de livrare ([[../Resources/Tools and Stack|quality standard]]);
  verifică premiile/segmentele față de brief — erorile de conținut sunt mai probabile decât cele estetice.
- Briefurile pot avea inconsistențe interne (ex. 50 vs 100 vouchere HH) — semnalează și alege varianta consistentă.

## Related
- [[Projects MOC]] · [[Claude Skills Index]] · Consumer Voice: [[../Resources/Consumer Voice Brand|Consumer Voice Brand]]
</content>
