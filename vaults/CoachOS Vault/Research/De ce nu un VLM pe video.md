---
tags: [research, coachos, ai, llm, computer-vision]
created: 2026-08-12
updated: 2026-08-12
status: active
---

# De ce nu un VLM pe video

Întrebarea firească: de ce să construim un pipeline CV când putem trimite video-ul la Gemini
sau GPT și să întrebăm? Ar fi mai ieftin și mult mai rapid de construit.

Răspunsul: **nu funcționează, și eșuează într-un mod scump — pentru că modelul îți dă un
răspuns care sună corect.**

## Se rupe la fizică, nu la calitatea modelului

Gemini eșantionează video la **1 fps**. O minge la 140 km/h parcurge **38.9 m** între două
eșantioane. Terenul are 23.77 m. Mingea traversează tot terenul **și se întoarce** între cadre.
Nu există traiectorie de reconstruit — informația pur și simplu nu e în input.

Poți forța fps mai mare (`videoMetadata.fps`). Aici se rupe economia. Ca să vezi o minge de
5–15 px ai nevoie de `media_resolution: HIGH` = 280 tokens/frame:

| | 1 fps | 10 fps | 60 fps |
|---|---|---|---|
| Gemini 2.5 Flash HIGH | $0.34/h | $3.06/h | **$18.18/h** |
| Gemini 3.6 Flash HIGH | $1.68/h | $15.29/h | **$90.89/h** |

Pipeline-ul CV: **$0.31/oră**, cu tot cu storage și layer de coaching
([[Tennis Vision - Arhitectura de Cost]]). Singura configurație VLM la care fizica funcționează
costă de ~300× mai mult.

Plus zidul de context: la 60fps HIGH, **un singur rally** abia încape într-un request de 1M
tokens. O sesiune de o oră devine 31–56 de request-uri care nu se văd între ele.

## Cineva a testat deja exact asta

**TennisExpert (2026)**, 202 de meciuri, același VLM de 8B, se schimbă doar input-ul:

| Input | Scor | Acuratețe factuală |
|---|---|---|
| Doar video | 42.74 | 4.10 |
| Video + output CV structurat | **73.74** | **10.84** (+164%) |

Și cifra care spune tot: VLM-ul **fine-tunat** pe video singur (42.74) scorează mai prost decât
Gemini 3 Pro zero-shot (59.89). Câștigul nu e în model — e în stratul CV.

Alte benchmark-uri în aceeași direcție:
- numărare de lovituri într-un rally: cel mai bun model **28.8%** (uman 89.2%)
- bounding boxes pe imagini sportive: GPT-5 **5.70% IoU**, Gemini 2.5 Pro **3.67%**
- grounding spațial + temporal simultan: **niciun model peste 1%**
- estimare de viteze (studiul QuantiPhy): scoaterea completă a video-ului degradează scorul
  doar "modest" → **modelele răspund din prior, nu din pixeli**

Ultima e cea mai importantă pentru noi: viteza de serviciu pe care ți-o dă un VLM e o ghiceală
plauzibilă, nu o măsurătoare. Iar un antrenor o va prinde din prima.

## Unde VLM-ul chiar câștigă

Nu peste video. Peste **JSON-ul structurat** produs de pipeline-ul CV (~10k tokens/sesiune):

| Utilizare | Cost |
|---|---|
| Narativă de coaching (Flash-Lite) | **$0.002/sesiune** — 500 sesiuni per dolar |
| Evaluare tehnică pe 20 clipuri scurte | $0.042/sesiune |
| Căutare semantică ("arată-mi erorile de rever") | ~$0.002/query |

Total strat LLM: **$0.01–0.05/sesiune, 3–15% din COGS**. Calitate de model frontier la ~2% din
costul VLM-only, plus acuratețe metrică pe care un VLM nu o poate produce structural.

## Excepția: folosește VLM agresiv pentru dataset

TennisExpert a folosit Gemini 3 Pro exact pentru asta — sinteza etichetelor din transcript +
metadata, cu **95%+ acceptanță de la experți**. Ăsta e cel mai bun ROI pe termen scurt:
**VLM-ul construiește datele de antrenament, nu rulează produsul în producție.**

## Legături
[[CoachOS Video Analytics]] · [[Tennis Vision - Arhitectura de Cost]] · [[CoachOS MOC]]
