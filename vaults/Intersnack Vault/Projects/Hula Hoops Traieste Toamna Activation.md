---
aliases: [Hula Hoops Toamna, Roata Distracției, HH Carrefour Sept 2026]
tags: [project, intersnack, hula-hoops, activation, in-store, carrefour]
created: 2026-06-10
status: concepts-delivered
---

# Hula Hoops — „Trăiește toamna și distrează-te cu Hula Hoops!" 🍂

Activare in-store cu premii instant — **Carrefour România, 19–20 sept 2026, 15 hipermarketuri**
(Wave Advertising Group + Consumer Voice). Asset pack: **key visual + stand hero ensemble +
2 outfit-uri + SVG producție roată**.

**Fișiere:** `Desktop/claude/intersnack-activation-assets/` (refs / renders / svg + README.md cu briful complet)

## Mecanism

Cumpără HH **min 15 RON** → bon validat la standul de după case → **Roata Distracției** →
premiu instant **garantat** → recenzie **Consumer Voice** (QR tent card pe blat — decizie Eduard:
fără tabletă/totem). Mesaj: *Cumpără. Învârte. Câștigă. Spune-ne părerea ta.*

## Matricea premiilor → segmente roată (8)

| Tier | Premii | Alocare |
|---|---|---|
| Produse HH | Pungă · 2 Pungi „Distracție Dublă" · Multipack „Snack pentru Familie" | 60–70% |
| Fun branduite | Geantă Tote · Breloc · Pălărie Bucket | 20–25% |
| Premium | Card Cadou Carrefour 20 RON · 50 RON | 5–10% |

## Livrabile create (2026-06-10)

1. **Key visual** (`renders/key-visual/kv-traieste-toamna-v2.png`) — landscape stil HEIDI: parc de
   toamnă cu inele HH căzând ca frunzele, roata cu cele 8 premii NOI, mâna cu inele pe degete,
   „PREMIU GARANTAT", 3 pași (15 RON / învârte / câștigă+recenzie), 3 packs Chio HH, strip legal
   Carrefour. ⚠️ v1 există dar are roata cu premiile VECHI (voucher cinema/festival) — NU se folosește.
2. **Stand hero ensemble** (`renders/stands/stand-hero-ensemble.png`) — fundal studio simplu (cerință
   Eduard, nu in-store): counter oval re-skinned toamnă + backdrop + roată nouă pe picior roșu +
   display premii + tent card CV cu QR + **cele 2 hostesse lângă stand** purtând outfit-urile noi.
3. **Outfit 1 „Autumn Fun"** (promoter roată) — tricou roșu logo HH + sarafan reiat muștar cu inel
   brodat + bucket hat HH (tie-in cu premiul!) + tote; spate: „Trăiește toamna și distrează-te!".
4. **Outfit 2 „Shelf Promoter"** (promoter raft) — hanorac roșu logo HH + manșete cu inele + jeans +
   șapcă + lanyard „ÎNTREABĂ-MĂ DESPRE ROATA DISTRACȚIEI!"; spate: „Cumpără. Învârte. Câștigă."
5. **SVG producție roată** (`svg/roata-distractiei.svg`) — elevație 1:10: Ø800 mm, total 1800 mm,
   8 segmente alternate roșu `#DA1F2E` / galben `#FFC72C`, text orizontal ca în referință, opritor,
   hub logo, alocare premii notată.

## Lecții / note

- gpt_image_2 a copiat textul roții din referința veche la primul KV → la regenerare am enumerat
  explicit segmentele și am interzis etichetele vechi. **Regulă: referință cu text de campanie veche
  ⇒ specifică în prompt ce NU se preia.**
- Higgsfield API a dat 502 tranzitoriu (2 încercări) — credite OK (ultimate, 2185); retry cu sleep 20 a mers.

## Update 2026-06-11 — feedback + campania 2

- **Stand v2** (`stand-hero-ensemble-v2.png`) — counter micșorat la ~1 m (feedback Eduard: „ca la
  gyoza, un pic mai mare"); backdrop a primit raft de premii. v1 rămâne doar referință.
- **KV v3** (`kv-traieste-toamna-v3-ps5.png`) — testat cu PS5 la feedback, apoi **RESPINS
  2026-06-11**: Eduard a decis premii mici realiste pt credibilitate (premiile instant garantate nu
  pot susține un PS5). **FINAL = v2** (tote + bucket + breloc + carduri 20/50 RON, matricea din brief).
- **Campania 2 — „Învârte distracția pe degete!"** (consumer promo național, sept–oct 2026):
  min 2 produse / 10 RON → bon pe microsite → recenzie Consumer Voice → trageri la sorți
  săptămânale. Premii: 5× Boxă Bluetooth, 20× Căști Wireless, 100× Voucher Cinema 2 pers
  (⚠️ brief inconsistent: corp 50 vs rezumat 100; ales 100 / fond total 125 — de confirmat cu Eduard).
  KV: `kv-invarte-distractia.png` — mâna cu inele hero + obiecte entertainment + panel trageri + CV.
- Obsidian: creat nodul mare [[Creatives MOC]] în vault-ul principal + sub-nodul
  `Creatives - Hula Hoops (Intersnack)` care leagă totul.

## Update 2026-06-11 (2) — sampling tables + stand campania 2

- **Cerință nouă Eduard: SAMPLING TABLE la toate standurile** — măsuță rotundă bar-height, picior
  roșu, blat alb cu guler brănduit, pahare mici de degustare cu inele + dispenser șervețele.
- **Stand campania 1 FINAL = v3** (`stand-hero-ensemble-v3-sampling.png`): counter compact + sampling
  table stânga + roată dreapta + backdrop cu raft premii. (v2 fără sampling table = arhivă.)
- **Stand campania 2** (`stand-invarte-distractia.png`): skin entertainment (fără roată, fără frunze)
  — counter compact cu QR „Înregistrează bonul aici" + tent card CV, backdrop cu mâna gigant +
  „TRAGERI LA SORȚI SĂPTĂMÂNALE" + raft premii (boxă roșie, căști, bilete cinema + popcorn),
  sampling table stânga, hostessele în outfit-urile standard.

## Next

- [ ] Confirmare 50 vs 100 vouchere cinema (campania 2)
- [ ] Adaptare 9:16 KV pentru social la cerere
- [ ] Dieline-uri print la scară reală (wrap stand, backdrop, roll-up, roată)
- [ ] 3D real stand+roată via Blender MCP (acum conectat)
- [ ] QR real Consumer Voice în locul placeholder-ului

## Update 2026-06-11 (3) — PLATFORMĂ LIVE (single-brand Hula Hoops)
- Platforma Intersnack (3 branduri) a fost **rebrandată complet la Hula Hoops single-brand** și e LIVE: **https://intersnack-showcase.netlify.app** (demo offline, fără login).
- Pitch: platforma (recenzii + idei de servire + concursuri) e produsul vândut prin activarea in-store → cumperi în magazin → învârți roata / înregistrezi bonul → **lași o recenzie**.
- Hero = **video Higgsfield** (seara de meci, prietenii împreună cu Hula Hoops; football generic, fără mărci FIFA). Pe pagina Concursuri: ambele KV-uri finale (Trăiește toamna + Învârte distracția v2) + standurile + mecanism 3 pași + premii + CTA „lasă o recenzie" → CV.
- Produse Recenzii = **pack-shots REALE** de pe retaileri RO (Sare de mare albastru / Cașcaval galben / Barbecue & miere maro), 70g. Idei de servire: seara de meci / platou party / movie night.
- Cod: `intersnack-brand-showcase/`. Detalii tehnice complete în memoria proiectului.
- NEXT posibil: backend live (login + înregistrare bon funcțională ca la Albalact); formular CV real Hula Hoops; variante 9:16 KV.

## Related
- [[Intersnack Brand Showcase]] · Consumer Voice tent card ref în `refs/ref-cv-tent-card.png`
- VICI batch echivalent: [[VICI In-Store Activation Assets]] (VICI Vault)
</content>
