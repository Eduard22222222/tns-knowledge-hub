---
tags: [research, coachos, computer-vision, cost-model]
created: 2026-08-12
updated: 2026-08-12
status: active
---

# Tennis Vision — Arhitectura de Cost

Modelul de cost pentru un pipeline de vision pe tenis, per oră de video procesată. Rezultatul
unei analize din 2026-08 (verificată adversarial — trei erori corectate față de prima versiune:
cerința de 60fps, fracția de joc activ, dimensiunea fișierelor).

## Concluzia în două rânduri
**Ball tracking = ~70% din tot bugetul GPU.** Player detection, pose, court detection, stroke
classification și bounce detection, la un loc, sunt zgomot. Dacă optimizezi altceva, pierzi timpul.

## Cifrele

| Arhitectură | COGS/oră | Marjă la $12–15/lună, 5h/user |
|---|---|---|
| A. Naiv (cloud, fără optimizări) | **$3.84** | negativă |
| B. Serverless optimizat (Modal L4, EU) | **$0.52** | 76–83% |
| C. Fleet propriu (@70% utilizare) | **$0.31** | 85–90% |
| D. On-device (Apple Neural Engine) | **$0.05** | 96–98% |

La 8.000 useri × 5h/lună: **$20.8k/lună** (B), **$12.2k** (C), **$1.9k** (D) — față de **$154k**
pe arhitectura naivă, care depășește veniturile.

## Cele trei corecții care au schimbat modelul

Prima versiune a modelului era optimistă din trei motive. Merită reținute pentru că fiecare e
o capcană de proiectare, nu doar o cifră greșită:

**1. Ai nevoie de 60 fps, nu 30.** La 30fps o minge la 140 km/h parcurge 0.9–1.9 m între cadre —
mai mult decât lățimea culoarului de dublu. Nu poți localiza bounce-ul, deci nu poți spune unde
a aterizat mingea, deci nu ai produs. Fondatorul SwingVision a declarat public exact asta.
Dublează costul de inferență față de estimarea naivă.

**2. Mingea e în joc doar 10–15% din timp** pe suprafață rapidă (20–30% pe zgură). Restul e
mers după minge, servit, pauze. Un pipeline care rulează tracking pe tot clipul plătește de
5–7× degeaba. **Segmentarea activă e prima optimizare de implementat**, și singura care schimbă
ordinul de mărime.

**3. Fișierele sunt de 5.4–9.5 GB/oră** la 1080p60, nu ~3.5 GB. Consecință de produs, nu doar
de storage: pe fibră upload-ul durează ~4 minute, pe date mobile aproape o oră. Segmentarea și
compresia **pe device, înainte de upload** devin obligatorii.

## Straturi de cost (arhitectura C, cea recomandată pentru academii)

- Ball tracking (60fps, doar segmente active) — ~70%
- Player detection + tracking — ~12%
- Pose estimation (doar la contact, nu continuu) — ~8%
- Court detection (o dată per clip, nu per frame) — ~2%
- Storage + egress — ~5%
- Layer LLM de coaching — ~3% (vezi [[De ce nu un VLM pe video]])

## Testul care trebuie făcut primul

Închiriază un L4 (~$0.39/h) și măsoară FPS-ul real pentru **WASB exportat în TensorRT FP16**.
Numărul nu e publicat nicăieri: WASB e benchmarkuit pe V100 (58 FPS), iar L4 are ~3× mai puțină
memory bandwidth — ar putea fi mai lent, nu mai rapid. Costă ~$5 și mută costul final între
**$0.09 și $0.60/oră**. Nimic altceva din modelul ăsta nu are atâta incertitudine.

Test secundar: `vball-net` raportează 200+ FPS ball tracking **pe CPU** (volei). Dacă se
replică pe tenis, costul GPU aproape dispare și arhitectura D devine default.

## Implicația comercială
Pentru o academie, **cutia GPU on-prem** (RTX PRO 6000, ~€8–10k one-off, sau ~€1.030/lună la
Hetzner) acoperă chiar și 2.000 ore/lună. Costul e comparabil cu cloud-ul, dar datele nu ies din
clădire — ceea ce rezolvă obiecția GDPR pe minori ([[GDPR - Video si Minori in NL]]) și devine
argument de vânzare, nu linie de cost.

## Legături
[[CoachOS Video Analytics]] · [[De ce nu un VLM pe video]] · [[CoachOS MOC]]
