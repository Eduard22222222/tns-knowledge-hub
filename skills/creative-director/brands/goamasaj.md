# GOAMASAJ — Brand Bible

## IDENTITY
- **Brand:** GoaMasaj
- **Industry:** Premium massage therapy, kinetotherapy, physiotherapy, recovery
- **Instagram:** @goamasaj
- **Website:** goamasaj.ro
- **Language:** Romanian
- **Positioning:** Expert-level therapeutic massage — science-backed, anatomy-driven, premium

## LOGO
- **File:** `C:/Users/adumi/goamasaj-logo-white-v2.png`
- **Style:** White dreamcatcher-inspired design, works on dark backgrounds
- **Format:** PNG with transparency (RGBA)
- **Placement:** Top-right corner, 90px width, 25-30px from edges
- **Inside borders on CTA slides:** offset 55px from edges

## COLOR PALETTE
| Name | RGB | Hex | Use |
|------|-----|-----|-----|
| GOLD | (212, 175, 55) | #D4AF37 | Primary accent, titles, key facts |
| GOLD_LIGHT | (232, 200, 100) | #E8C864 | Button outlines, highlights |
| GOLD_DIM | (160, 130, 40) | #A08228 | Tags, handles, subtle accents |
| WHITE | (255, 255, 255) | #FFFFFF | Secondary titles |
| OFF_WHITE | (240, 240, 240) | #F0F0F0 | Subtitles |
| LIGHT_GRAY | (180, 180, 180) | #B4B4B4 | Body text |
| DIM_GRAY | (120, 120, 120) | #787878 | Swipe indicators |
| DARK_BG | (12, 12, 12) | #0C0C0C | Canvas/panel background |
| RED_PAIN | (220, 80, 60) | #DC503C | Pain/symptom indicators |
| LINE_SUBTLE | (60, 55, 40) | #3C3728 | Inner borders, secondary lines |
| TEAL_ACCENT | (80, 200, 180) | #50C8B4 | Optional secondary accent |

## TYPOGRAPHY
| Role | Font | Size | Source |
|------|------|------|--------|
| Cover title | Oswald-Bold | 60-64px | C:/Windows/Fonts/ |
| Cover subtitle | Oswald-Bold | 34-36px | Windows/Fonts |
| Effect/cause title | Oswald-Bold | 42-48px | Windows/Fonts |
| Stat/metric | Oswald-Bold | 36px | Windows/Fonts |
| Label | Oswald-Bold | 24-28px | Windows/Fonts |
| Big number (faded) | Oswald-Bold | 120-140px | Windows/Fonts |
| Body | Outfit-Regular | 24px | canvas-fonts/ |
| Body bold | Outfit-Bold | 24px | canvas-fonts/ |
| Handle | Outfit-Bold | 20px | canvas-fonts/ |
| Tag | Outfit-Bold | 16px | canvas-fonts/ |
| Small text | Outfit-Regular | 18px | canvas-fonts/ |
| CTA big | Oswald-Bold | 64-72px | Windows/Fonts |
| CTA subtitle | Outfit-Regular | 28px | canvas-fonts/ |
| CTA button | Outfit-Bold | 34px | canvas-fonts/ |

## FONT PATHS
```python
FONTS_DIR = "C:/Users/adumi/.claude/skills/awesome-claude-skills/canvas-design/canvas-fonts/"
SYS_FONTS = "C:/Windows/Fonts/"
```

## TONE OF VOICE
- Scientific but accessible — explain anatomy without jargon
- Authoritative — positions GoaMasaj as THE expert
- Educational — provides real, usable knowledge
- Premium — never cheap, never salesy
- Direct — no fluff, no filler
- Romanian language — clean, modern Romanian (no diacritics in image text for compatibility)

## CONTENT PILLARS
1. **Anatomical education** — "What really causes your pain"
2. **Invisible science** — "What massage does inside your body"
3. **Technique breakdowns** — "Pressure points, trigger points, techniques"
4. **Myth busting** — "What you think vs what's real"
5. **Recovery/wellness** — "How to maintain results"

## VISUAL STYLE
- **Dark premium aesthetic** — pure black/near-black backgrounds
- **Gold as primary accent** — warm, luxurious, authoritative
- **Gemini AI backgrounds** — photorealistic medical/anatomical illustrations
- **NO plain text slides** — every slide has visual substance
- **Clean separation** — text NEVER overlaps visual elements
- **Gradient overlays** — fade visuals to dark for text zone
- **Minimal UI** — slide numbers, logo, handle — nothing more

## API CONFIG

**NEVER hardcode the Gemini API key in scripts or this file.** Keys keep getting auto-revoked by Google's secret scanner. Use the centralized helper instead:

```python
from google import genai
from google.genai import types
from _gemini_key import get_key  # reads GOOGLE_AI_API_KEY env var (with Windows registry fallback)

client = genai.Client(api_key=get_key())

# Generate image:
response = client.models.generate_content(
    model="gemini-2.5-flash-image",
    contents=f"Generate this image: {prompt}",
    config=types.GenerateContentConfig(
        response_modalities=["TEXT", "IMAGE"],
    ),
)
```

**One-time setup** (PowerShell, then opens any new terminal):
```powershell
[Environment]::SetEnvironmentVariable("GOOGLE_AI_API_KEY", "<your-key>", "User")
```

**Helper location:** `C:/Users/adumi/OneDrive/Desktop/claude/_gemini_key.py`. Each `generate_carouselN_visuals.py` imports it via `from _gemini_key import get_key` (works because they live in the same directory).

## OUTPUT STRUCTURE
```
C:/Users/adumi/goamasaj_carousel_N/          <- Gemini backgrounds
C:/Users/adumi/goamasaj_carousel_N/final/    <- Final composited slides
C:/Users/adumi/OneDrive/Desktop/claude/      <- Build scripts
```

## COMPLETED WORK

### Carousel #1 — "Puncte de Presiune pentru Dureri de Spate"
- **Status:** COMPLETED & APPROVED
- **Format:** 1024x1024 (early format, later standardized to 1080)
- **Slides:** 7 (cover + 5 pressure points + CTA)
- **Scripts:** `build_carousel_v2.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel/`

### Carousel #2 — "5 DURERI PE CARE LE SIMTI — SI DE UNDE VIN DE FAPT"
- **Status:** COMPLETED & APPROVED
- **Format:** 1080x1080
- **Concept:** 5 common pains + their real anatomical cause (symptom RED -> cause GOLD)
- **Slides:** 7 (cover + 5 pain reveals + CTA)
- **Scripts:** `generate_carousel2_visuals.py`, `build_carousel2_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_2/`
- **Backgrounds:** headache/trapez, lowback/psoas, shoulder/posture, upperback/rhomboid, fatigue/nervous
- **CTA:** "TRATEAZA CAUZA, NU SIMPTOMUL"

### Carousel #3 — "5 LUCRURI INVIZIBILE PE CARE MASAJUL LE FACE IN CORPUL TAU"
- **Status:** COMPLETED & APPROVED
- **Format:** 1080x1080
- **Concept:** 5 invisible internal effects of massage (all in GOLD as positive effects)
- **Slides:** 7 (cover + fascia + circulation + hormones + adhesions + lymphatic + CTA)
- **Scripts:** `generate_carousel3_visuals.py`, `build_carousel3_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_3/`
- **CTA:** "HAI SA VEZI CE POATE FACE O SEDINTA"

### Carousel #4 — "CE SE INTAMPLA DACA NU TE MASEZI 6 LUNI"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Consequence/urgency — show body degradation without massage over 6 months
- **Accent:** RED_WARN (220, 80, 60) for "6 LUNI" urgency
- **Slides:** 7 (cover + 5 consequences + CTA)
  1. Cover: "CE SE INTAMPLA DACA NU TE MASEZI 6 LUNI"
  2. Fascia se usuca si se lipeste
  3. Trigger points se multiplica
  4. Postura se degradeaza
  5. Inflamatia devine cronica
  6. Cortizolul ramane ridicat
  7. CTA: "NU LASA CORPUL SA SE DEGRADEZE"
- **Scripts:** `generate_carousel4_visuals.py`, `build_carousel4_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_4/`
- **Backgrounds:** bg_cover_neglect, bg_fascia_dries, bg_trigger_points, bg_posture_decay, bg_inflammation, bg_cortisol_high

### Carousel #5 — "3 GRESELI PE CARE LE FACI DUPA MASAJ"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Mistake avoidance — 3 common post-massage errors with fixes
- **Accent:** RED_WARN for mistake titles, GOLD for fix lines
- **Slides:** 5 (cover + 3 mistakes with fixes + CTA)
  1. Cover: "3 GRESELI PE CARE LE FACI DUPA MASAJ"
  2. Nu bei apa suficienta → FIX: "BEA 500ML APA IN URMATOAREA ORA"
  3. Faci sport intens imediat → FIX: "ASTEAPTA 24-48H PENTRU SPORT INTENS"
  4. Te intorci la postura rea → FIX: "POSTURA CORECTA 4-6 ORE DUPA MASAJ"
  5. CTA: "MASAJUL FUNCTIONEAZA DAR NUMAI DACA COOPEREZI CU CORPUL"
- **Scripts:** `generate_carousel5_visuals.py`, `build_carousel5_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_5/`
- **Backgrounds:** bg_cover_mistakes, bg_dehydration, bg_intense_exercise, bg_bad_posture_phone
- **Note:** Unique "GRESEALA X/3" tag + fix line layout

### Carousel #6 — "MASAJ VS KINETOTERAPIE — CAND AI NEVOIE DE FIECARE"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Comparison — educate audience on when each therapy is best
- **Color coding:** GOLD = Massage domain, TEAL (80, 200, 180) = Kinetoterapie domain
- **Slides:** 7 (cover + 5 content + CTA)
  1. Cover: "MASAJ VS KINETOTERAPIE — CAND AI NEVOIE DE FIECARE?"
  2. Tesut moale: muschi, fascia, tendoane (GOLD)
  3. Articulatii, ligamente, miscare (TEAL)
  4. Tensiune, stres, noduri musculare (GOLD)
  5. Post-operatoriu, instabilitate, leziuni (TEAL)
  6. Masaj + kinetoterapie = optim (GOLD_LIGHT)
  7. CTA: "MASAJ. KINETOTERAPIE. TOTUL INTR-UN SINGUR LOC."
- **Scripts:** `generate_carousel6_visuals.py`, `build_carousel6_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_6/`
- **Backgrounds:** bg_cover_vs, bg_massage_domain, bg_kineto_domain, bg_when_massage, bg_when_kineto, bg_combined

### Carousel #7 — "ANATOMIA DURERII DE GAT"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Deep-dive anatomy — 5 specific causes of neck pain
- **Slides:** 7 (cover + 5 anatomy causes + CTA)
  1. Cover: "ANATOMIA DURERII DE GAT — 5 CAUZE PE CARE TREBUIE SA LE STII"
  2. Muschiul SCM (Sternocleidomastoidian)
  3. Muschii suboccipitali
  4. Levator scapulae
  5. Compresie disc-nerv cervical
  6. Muschii scaleni si compresie TOS
  7. CTA: "GATUL TAU MERITA MAI MULTA ATENTIE"
- **Scripts:** `generate_carousel7_visuals.py`, `build_carousel7_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_7/`
- **Backgrounds:** bg_cover_neck, bg_scm_muscle, bg_suboccipital, bg_levator_scap, bg_disc_nerve, bg_scalene_muscles

### Carousel #8 — "DE CE TE DOARE DIMINEATA"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Morning pain explanations — 5 scientific reasons you wake up in pain
- **Accent:** AMBER_WARM (230, 160, 50) for morning/warmth theme
- **Slides:** 7 (cover + 5 reasons + CTA)
  1. Cover: "DE CE TE DOARE DIMINEATA? — 5 MOTIVE STIINTIFICE"
  2. Discurile se rehidrateaza noaptea
  3. Pozitia de somn te saboteaza
  4. Fascia si lichidul sinovial se rigidizeaza
  5. Inflamatia se acumuleaza noaptea
  6. Raspunsul cortizolic matinal (CAR)
  7. CTA: "NU TREBUIE SA TE DOARA IN FIECARE DIMINEATA"
- **Scripts:** `generate_carousel8_visuals.py`, `build_carousel8_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_8/`
- **Backgrounds:** bg_cover_morning, bg_disc_rehydration, bg_sleep_position, bg_morning_stiffness, bg_inflammation_night, bg_cortisol_morning

### Carousel #9 — "CE VAD EU IN CORPUL TAU IN PRIMELE 30 SECUNDE"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Insider/voyeur — therapist confession, what the body reveals instantly
- **Hook:** Curiosity + self-reference (what do MY shoulders/breath/jaw say?)
- **Slides:** 7 (cover + 5 reads + CTA)
  1. Cover: "CE VAD EU IN CORPUL TAU IN PRIMELE 30 SECUNDE"
  2. Umerii = nivel de stres (asimetrie de 1 cm)
  3. Respiratia = epuizare (chest vs belly)
  4. Soldurile = ore de scaun (rotatie interna >15°)
  5. Maxilarul = emotie reprimata (maseter + bruxism)
  6. Fascia = traume vechi (aderente palpabile)
  7. CTA: "CORPUL TAU MARTURISESTE TOTUL. EU DOAR ASCULT."
- **Scripts:** `generate_carousel9_visuals.py`, `build_carousel9_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_9/`
- **Backgrounds:** bg_cover_30sec, bg_shoulders_asymmetry, bg_breathing_pattern, bg_hip_rotation, bg_jaw_tension, bg_fascia_scars

### Carousel #10 — "NU TE DOARE UNDE CREZI — HARTA SECRETA A DURERII"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Counterintuitive shock — referred pain map, 5 places where pain location lies
- **Color coding:** RED_PAIN = felt pain, GOLD = real anatomical source. Each slide uses RED title -> arrow -> GOLD title structure.
- **Hook:** "Wait what?" reveals — pain location ≠ pain source
- **Slides:** 7 (cover + 5 reveals + CTA)
  1. Cover: "NU TE DOARE UNDE CREZI"
  2. Cap (RED) -> Trapez + SCM (GOLD)
  3. Genunchi (RED) -> Fesier mijlociu (GOLD)
  4. Furnicaturi mana (RED) -> Scaleni gat (GOLD)
  5. Apasare piept (RED) -> Diafragma + intercostali (GOLD)
  6. "Sciatica" (RED) -> Piriformis nu disc (GOLD)
  7. CTA: "TRATEZI SIMPTOMUL? VEI REVENI. TRATEAZA SURSA."
- **Scripts:** `generate_carousel10_visuals.py`, `build_carousel10_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_10/`
- **Backgrounds:** bg_cover_pain_map, bg_headache_neck, bg_knee_glute, bg_wrist_nerve, bg_chest_diaphragm, bg_sciatica_piriformis
- **Note:** New layout pattern — RED felt label + "v" arrow + GOLD real source on every content slide

### Carousel #11 — "CORPUL TINE SCOR — 5 TRAUME BLOCATE IN MUSCHII TAI"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Body Keeps the Score — emotional + visceral. 5 muscles where trauma stores
- **Accent:** GOLD primary + AMBER_WARM (230, 160, 50) for emotional warmth
- **Hook:** Deep emotional self-reference, almost spiritual undertone
- **Slides:** 7 (cover + 5 stored traumas + CTA)
  1. Cover: "CORPUL TINE SCOR — 5 TRAUME BLOCATE IN MUSCHII TAI"
  2. PSOAS — Muschiul fricii
  3. MAXILARUL — Cuvintele nespuse
  4. DIAFRAGMA — Respiratia intrerupta
  5. PLANSEUL PELVIN — Rusinea si secretul
  6. UMERII — Povara responsabilitatii
  7. CTA: "NU UITI TRAUMA. CORPUL N-O LASA. ELIBEREAZ-O."
- **Scripts:** `generate_carousel11_visuals.py`, `build_carousel11_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_11/`
- **Backgrounds:** bg_cover_keepscore, bg_psoas_fear, bg_jaw_unspoken, bg_diaphragm_breath, bg_pelvic_floor, bg_shoulders_burden
- **Note:** Layout uses TITLE (GOLD) + TITLE_SUB (AMBER_WARM) two-line header for emotional weight

### Carousel #12 — "DE CE CELEBRITATILE ARATA ASA BINE — SI CUM POTI SI TU"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Hybrid celebrity/aspirational — each slide pairs a GoaMasaj service with a daily DIY action. Pattern requested by user explicitly: problem-solving headline + LA GOAMASAJ block + TU ZILNIC block.
- **Hook:** "How they look that good" curiosity + "you can too" inclusivity
- **Critical learning:** Use EXACT service names from price list (Fusion, Anticelulitic, Relaxare, Sportiv, Terapeutic, La Birou, DeepTissue, Prenatal). Generic technique terms like "decontractant cervical" don't drive bookings — clients can't book what isn't on the website.
- **Slides:** 7 (cover + 5 hybrid + CTA)
  1. Cover: "DE CE CELEBRITATILE ARATA ASA BINE — SI CUM POTI SI TU"
  2. JAWLINE DEFINITA — Masaj Fusion + gua sha facial DIY
  3. CELULITA REDUSA — Masaj Anticelulitic + foam roller IT band DIY
  4. PIELE CLARA — Masaj Relaxare + 20 min lumina naturala dimineata DIY
  5. TONUS FARA HIPERTROFIE — Masaj Sportiv + yoga 15 min DIY
  6. POSTURA TANARA — Masaj Terapeutic + wall angels DIY
  7. CTA: "MASAJUL LOR + OBICEIURILE TALE = ASA ARATA EI"
- **Scripts:** `generate_carousel12_visuals.py`, `build_carousel12_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_12/`
- **Backgrounds:** bg_cover_celebrity, bg_jawline_fusion, bg_celulita_anticelulitic, bg_piele_relaxare, bg_tonus_sportiv, bg_postura_terapeutic
- **Layout innovation:** New hybrid template — text panel from y=620 (larger than usual y=720), with three blocks: ZONA title (gold) → "LA GOAMASAJ" + service name + body → subtle separator → "TU ZILNIC ACASA" + DIY action. Anatomical Gemini bg + small inset figure where possible (gua sha, foam roller, etc).
- **Note:** First carousel where Gemini reliably rendered both anatomical bg AND inset exercise figure (gua sha came out clean on slide 2).
- **Iteration learnings (post-feedback fix 2026-05-03):**
  - Cover for "celebritati/aspirational" hooks: skip generic editorial portrait — go for **lifestyle Instagram aesthetic** (e.g., influencer on Bali beach at golden hour, hair in wind, ocean blur). Aspiration > drama for this hook type.
  - "Piele clara" topic: lead with **dewy close-up beauty portrait** (skin texture must be the visual hero), not abstract cortisol curves. Curve can be a small overlay element.
  - Postura comparison: prompt Gemini for **EXAGGERATED silhouettes side-by-side** (not subtle X-ray). Words like "extremely hunched / extremely upright / dramatically obvious / instantly readable" force clear visual contrast. Color-code: red glow = bad, gold glow = good.

### Carousel #13 — "FACI SPORT DAR NU CRESTI? — RECOVERY E SECRETUL, NU ANTRENAMENTUL"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Gym/performance demographic — counterintuitive reveal that growth happens in recovery, not training. Hybrid pattern (massage + DIY) per user-confirmed structure.
- **Hook:** "Mananci proteina, dormi 8h, totuși zero progres — iata de ce" (gym frustration universal)
- **Audience:** Male 20-40, gym-going Bucuresti corporate with disposable income — exact demo for paid masaj privat
- **Slides:** 7 (cover + 5 hybrid + CTA)
  1. Cover: "FACI SPORT DAR NU CRESTI? RECOVERY E SECRETUL"
  2. MUSCHII CRESC IN RECOVERY — Masaj Sportiv + dus contrastant DIY
  3. OVER-TRAINING = CATABOLISM — Masaj Sportiv + 1 zi off/sapt obligatoriu
  4. FASCIA RIGIDA = SUB-STIMULARE — Masaj DeepTissue + foam roller 10 min pre-workout
  5. DOMS PRELUNGIT = ZERO RECOVERY — Masaj Sportiv + mers usor + stretching activ
  6. CORTIZOL TE MANANCA MUSCHII — Masaj Relaxare + somn 7-8h + respiratie 4-7-8
  7. CTA: "MUSCHII CRESC IN RECOVERY. NU LA SALA."
- **Scripts:** `generate_carousel13_visuals.py`, `build_carousel13_final.py`, `regen_carousel13_missing.py` (retry-with-backoff for Gemini 503 overload)
- **Output:** `C:/Users/adumi/goamasaj_carousel_13/`
- **Backgrounds:** bg_cover_gym, bg_muscle_recovery, bg_inflammation_overtraining, bg_fascia_rom, bg_doms_timeline, bg_cortisol_catabolism
- **Production note (2026-05-03):** Gemini hit 503 UNAVAILABLE multiple times during generation. The `regen_carousel{N}_missing.py` retry-with-exponential-backoff pattern (5s → 10s → 20s → 60s) is the standard fix — only regenerates files that don't exist on disk. Run with `python -u` for unbuffered output so progress is visible. Keep this template ready for future 503 events.
- **Viral hooks proven by #13:** counterintuitive shock ("recovery > training"), demographic-specific (gym bros), specific anatomical claims (DOMS 72h, IL-6/TNF-alpha, 30% cortizol drop) backed by science.

### Carousel #14 — "DRENAJ BRAZILIAN — SLABESTI VIZIBIL IN 60 MIN"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Brazilian lymphatic drainage (Renata França style) framed as visible "slimming" — explicitly water retention, NOT fat loss (kept honest). Strong before/after visual hook. Hybrid pattern.
- **Hook:** "Slabesti vizibil in 60 min — apa, nu grasime, dar diferenta se vede instant"
- **Audience:** Female 20-45, beauty/wellness oriented, pre-event clients (nunti, vacante, sedinte foto), premenstrual bloat sufferers
- **Service positioning:** "Masaj Anticelulitic — tehnica braziliana / drenaj limfatic". Considered adding "Drenaj Brazilian" as new branded service tier — listed in CTA footer alongside Anticelulitic.
- **Slides:** 7 (cover + 5 hybrid + CTA)
  1. Cover: Before/After female torso side-by-side (cool light vs warm gold) — "DRENAJ BRAZILIAN. SLABESTI VIZIBIL IN 60 MIN"
  2. CE PIERZI EXACT — Anticelulitic + ridici picioarele 15 min seara DIY
  3. CUM FUNCTIONEAZA — Anticelulitic + dry brushing 5 min dimineata DIY
  4. UNDE SE VEDE INSTANT — Anticelulitic + hidratare 2.5L + zero sare seara DIY
  5. CINE BENEFICIAZA MAXIM — Anticelulitic + monitorizeaza ciclu + programezi preventiv DIY
  6. PROTOCOLUL REAL — Anticelulitic 6-8 sedinte + 5 min self-massage cu ulei dimineata DIY
  7. CTA: "PIERZI APA. PASTREZI MUSCHII. REZULTAT VIZIBIL."
- **Scripts:** `generate_carousel14_visuals.py`, `build_carousel14_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_14/`
- **Backgrounds:** bg_cover_before_after, bg_water_retention, bg_lymphatic_system, bg_zones_results, bg_premenstrual_bloat, bg_protocol_timeline
- **Honesty note:** Carouselul mentioneaza EXPLICIT ca pierderea e apa (nu grasime). Asta protejeaza brandul de claim-uri "weight loss" potentiale problematice si pastreaza pozitionarea premium-clinical, nu fad-diet.
- **Visual win:** Gemini a randat cover-ul before/after fara prompt overreach. Cheia: aceeasi femeie pe ambele parti, lumina rece vs lumina aurie, NU exagerat in dimensiuni — credible nu absurde.
- **Lesson — body-shape comparisons:** Pentru Gemini, frame ca "bloated vs de-bloated" + "cool dim light vs warm gold light", nu "fat vs thin". Mentine credibilitatea medical-aesthetic, evita filtrele de continut si vibe-ul cheap.

### Carousel #15 — "AI DURERI DUPA O ZI LA BIROU? — NU E SCAUNUL. E PIRIFORMIS."
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Counterintuitive anatomy reveal — piriformis syndrome mimics sciatica, 80% of "sciatica" diagnoses are actually piriformis. Hybrid pattern.
- **Hook:** "Ai dureri dupa o zi la birou? Nu e scaunul. E piriformis." — universal (everyone sits), shareable ("ce-i ăla piriformis?"), counterintuitive shock.
- **HEADLINE LANGUAGE FEEDBACK (user 2026-05-03):** Avoid colloquial/crass body terms ("te doare in fund") even when accurate — sounds cheap and breaks premium positioning. Use neutral framing instead ("ai dureri dupa o zi la birou", "durere de sold", "te intepenesti"). The anatomical specificity goes in the REVEAL (slide 2+), not in the headline. Keep cover headline clinical-aspirational, never colloquial.
- **Audience:** Universal — anyone with desk job, drivers, sedentary lifestyle. Cross-gender broad appeal.
- **Color coding:** RED_PAIN pe cover si CTA ("te doare", "nu e disc") + GOLD pentru reveal ("e piriformis", "trateaza sursa"). Pattern from carousel #10 (referred pain map).
- **Slides:** 7 (cover + 5 hybrid + CTA)
  1. Cover: "AI DURERI DUPA O ZI LA BIROU? — NU E SCAUNUL. E PIRIFORMIS."
  2. MIC MUSCHI, MARE PROBLEMA — Masaj Terapeutic + figure-4 stretch 30s/parte DIY
  3. STATUL IL CRONICIZEAZA — Masaj DeepTissue + ridici-te la fiecare 60 min DIY
  4. 80% DIN 'SCIATICA' NU E DISC — Masaj Therapeutic + DeepTissue + test acasa DIY
  5. SEMNALELE CARE TE TRADEAZA — Masaj Terapeutic + minge tenis la perete DIY
  6. GRESELI CARE PRELUNGESC PROBLEMA — Masaj DeepTissue + figure-4 lent (nu forta) DIY
  7. CTA: "NU E DISC. E PIRIFORMIS. TRATEAZA SURSA."
- **Scripts:** `generate_carousel15_visuals.py`, `build_carousel15_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_15/`
- **Backgrounds:** bg_cover_piriformis_pain, bg_anatomy_piriformis, bg_sitting_compression, bg_disc_vs_piriformis, bg_signal_pattern, bg_mistakes_stretching
- **Viral grade:** Concept "nu e ce credeai" tested in #10, now applied to specific universal pain. "Piriformis" devine word-of-mouth — oameni vor share-ui doar pentru a întreba "ce-i ăla piriformis?"

### Carousel #16 — "TE DOARE SPATELE DUPA O ZI LA BIROU? — 5 TEHNICI DE MASAJ CARE FUNCTIONEAZA"
- **Status:** COMPLETED
- **Format:** 1080x1080
- **Concept:** Office back pain + 5 specific massage TECHNIQUES with photographic close-ups of therapist's hands ON a back. Hybrid pattern.
- **Hook:** "Te doare spatele dupa o zi la birou?" — universal corporate demographic. Visual hook = real therapist hands at work.
- **Slides:** 7 (cover + 5 hybrid + CTA)
  1. Cover: photo of woman at desk with back pain
  2. TRAPEZUL TENSIONAT — Kneading technique. Masaj Terapeutic + DIY auto-masaj
  3. NODUL INTRE OMOPLATI — Trigger points. Masaj DeepTissue + DIY minge tenis
  4. FASCIA LOMBARA RIGIDA — Fascial release. Masaj Fusion + DIY foam roller
  5. PSOAS BLOCAT — Indirect release. Masaj Therapeutic + DIY hip flexor stretch
  6. SUB OMOPLAT 'CARLIGUL' — Levator scapulae release. Masaj DeepTissue + DIY scapular squeeze
  7. CTA: "5 TEHNICI. EU LA TINE ACASA. TU MENTII REZULTATUL."
- **Scripts:** `generate_carousel16_visuals.py` (gpt_image_2), `regen_carousel16_flux.py` (FLUX.2 fallback), `build_carousel16_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_16/`

### NEW PRODUCTION TOOLING — Higgsfield CLI (2026-05-03)
- **Image generation:** Now using `higgsfield generate create <model> --prompt "..." --aspect_ratio 1:1 --quality high --resolution 2k --wait` instead of Gemini direct API.
- **CRITICAL Windows fix:** Python `subprocess.run` cannot find `higgsfield` in PATH on Windows. MUST use full path to `.cmd`: `C:/Users/adumi/AppData/Roaming/npm/higgsfield.cmd` + `shell=True`. Failed silently with WinError 2 otherwise.
- **Model selection:**
  - **gpt_image_2** — best for photographic close-ups of hands/bodies (excellent anatomical accuracy, magazine quality). BUT: aggressive NSFW filter — flags "bare back oiled" + similar phrasings even in clinical context.
  - **flux_2 (pro, 2k)** — strong photoreal + much more relaxed content filter. Use as fallback when gpt_image_2 NSFW-flags. Anatomically accurate, but slightly less polished editorial finish than gpt_image_2.
  - **nano_banana_2** — Google's Gemini behind Higgsfield. Use only for non-people anatomical/diagram work.
- **NSFW evasion strategies:**
  - Frame as "fully draped with thick white spa sheet, ONLY narrow strip exposed for treatment" — works on both gpt_image_2 and flux_2.
  - Remove "bare back" / "oiled" descriptions — these trigger filter.
  - Add "clinical massage table", "high-end medical-spa setting" — boosts professional framing.
  - For tricky areas (abdomen/psoas, pelvic): switch from photograph to "anatomical illustration cross-section with X-ray translucent style".
- **URL → file workflow:** Higgsfield CLI returns CloudFront URL on last stdout line. Download with `urllib.request.urlretrieve(url, path)`.
- **Output: 2048×2048 → crop to 1080 in build script (existing load_bg helper handles it).**

### Carousel #17 — "FAKE BREAKING NEWS + SERVICES SPLASH"
- **Status:** COMPLETED (pending user verification of Gabi face accuracy)
- **Concept:** Slide 1 = fake IG breaking news (Judy's Cafe pattern) — Gabi on Palatul Parlamentului with "GOAMASAJ CEL MAI BUN MASSEUR" flag. Slides 2-7 = standard hybrid ad format.
- **Slides:** cover fake news + 5 hybrid + CTA
- **Scripts:** `build_carousel17_slide1.py`, `generate_carousel17_visuals.py`, `build_carousel17_slides2to7.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_17/`

### FAKE NEWS SLIDE PATTERN (viral format)
- Mimic IG breaking news repost. White bg, gradient-ring avatar (dark navy fill + logo), verified check, "Urmareste" link in IG blue, red "STIRE DE ULTIMA ORA" tag, bold Arial black headline, hero photo rounded corners, reaction bar with counts + timestamp.
- Colors: white bg, black text, gray meta, red BREAKING (#DA2D33), IG blue (#0095F6).

### IDENTITY PRESERVATION — WINNING WORKFLOW (Soul-2 + 10 diverse frames)
**Proved on Gabi hero for carousel #17 (2026-05-03 retry):** the ONE that actually rendered Gabi's real face.

**Critical:** need **10 diverse frames**, not 5. And they must include front-facing + 3/4 + profile angles for the model to triangulate identity properly.

**Step 1: Extract frames from ALL client videos** (not just one).  
```bash
for vid in *.mp4 *.MOV; do
  ffmpeg -i "$vid" -vf "fps=1/3,scale=720:-1" -q:v 2 "frames_${vid%.*}_%03d.jpg"
done
```

**Step 2: Visual review with thumbnail grid.** Create 9-column PIL grid to eyeball which frames have clear faces. Reject frames with obstructions (client body, sunglasses, sideways angles that look like other people).

**Step 3: Pick 10 frames covering:**
- 2-3 FRONTAL clear shots (best if from POV/Ad-break style content where creator addresses camera)
- 4-5 3/4 angle shots (usually from massage session close-ups)
- 1-2 profile shots (for triangulation)
- Diversity in lighting/background helps

**Step 4: Upload each frame** → get UUID from `higgsfield upload create`.

**Step 5: Train Soul-ID** with `--soul-2` (NOT `--soul-cinematic` — that model fails on real-person training):
```bash
higgsfield soul-id create --name <Name> --soul-2 --image <uuid1> ... --image <uuid10>
```

**Step 6: Wait for training** (`higgsfield soul-id wait <soul-uuid>`, 5-15 min).

**Step 7: Generate scene** with `text2image_soul_v2 --custom_reference_id <soul-uuid> --aspect_ratio 4:3 --quality 2k --wait`. Keep prompt FOCUSED (single scene, single subject).

**What FAILED (do not repeat):**
- **Soul-cinematic** — training FAILS on real-person data (only works for stylized characters).
- **5-frame Soul-ID** — insufficient diversity, produces "similar but wrong" face.
- **gpt_image_2 `--medias` JSON array** — ignored by model, produces literal-prompt scenes (once got police scene from "breaking news" prompt).
- **nano_banana_2 with 6 `--image` refs** — produces 2 people when 1 requested.
- **flux_kontext single ref** — 60% face match, better than nothing but not real.

**Key insight:** Soul-2 with 10 well-chosen frames = ~90% face match. Under 10 frames or bad frame selection = fails. Frame diversity > frame count.

### IDENTITY PRESERVATION — WINNING WORKFLOW (gpt_image_2 iterative refinement)
**Proved on Gabi hero for carousel #17 (2026-05-03):** the ONE that actually worked.

**Step 1: Prime the reference.** Start with a single clear frontal photo of the person. If the ref is a side-profile or has awkward pose, first RUN gpt_image_2 with `--image <ref_uuid>` and a simple prompt like "portrait of this person, front-facing, neutral pose" — gpt_image_2 stays anchored to the person's identity but gives you a cleaner base image. Save the output.

**Step 2: Upload the improved output as a NEW reference.**  Then use that UUID for the actual scene generation.

**Step 3: Generate the actual scene** with gpt_image_2 `--image <new_uuid>` + a FOCUSED prompt (short, single scene). Complex multi-clause prompts fail — the model reverts to lifestyle-generic scenes. Keep prompt to ONE setting change + preserve identity clause.

**Key insight:** gpt_image_2 with a well-primed reference (Step 2 UUID) preserves face 90-95% accurately. Direct generation from a poor ref = 30-40%.

**Fallback tools** (used only if above fails):
- **flux_kontext** with `--image` = 60-70% face match, unpredictable, use as backup
- **text2image_soul_v2** with Soul-ID (trained 5 face frames via `higgsfield soul-id create --soul-2`) = 85% match but skyline/scene inaccuracy
- **nano_banana_2** with multi `--image` = generates 2 people from ambiguous prompts, weak identity

**Anti-pattern:** don't use `--medias` JSON array on gpt_image_2 — model ignores it and interprets prompt literally, producing generic scenes (once got a literal "breaking news police scene"). Use repeated `--image` flags instead.

### IDENTITY PRESERVATION (Higgsfield Soul-ID — DEFINITIVE)
**Winning workflow (proved on Gabi hero shot 2026-05-03):**
1. Extract 5+ clean face frames from client's videos using ffmpeg: `ffmpeg -i video.mp4 -vf "fps=1/2,scale=720:-1" -q:v 2 frames_%03d.jpg`
2. Upload each frame: `higgsfield upload create <path>` → returns UUID
3. Train Soul-ID: `higgsfield soul-id create --name <Name> --soul-2 --image <UUID1> ... --image <UUID5>` → returns Soul UUID
4. Wait for training: `higgsfield soul-id wait <Soul-UUID>` (takes ~5-15 min)
5. Generate with Soul model: `higgsfield generate create text2image_soul_v2 --prompt "..." --custom_reference_id <Soul-UUID> --aspect_ratio 4:3 --quality 2k --wait`
6. Face preservation is ~90% accurate — MUCH better than flux_kontext or nano_banana_2.

**Compared alternatives:**
- **flux_kontext** with `--image` = 50-60% face match, unpredictable
- **nano_banana_2** = often generates 2 people, weak identity preservation
- **text2image_soul_v2 + Soul-ID** = 85-95% match, consistent, worth the 10-min training cost

**Flag/text-on-object workflow:**
- Soul V2 renders text POORLY (garbled letters). Generate the flag as SOLID BLANK (black rectangle), then overlay clean text via PIL:
  1. Auto-detect flag bbox: find largest black-pixel region in top half of image (numpy mask on RGB<40)
  2. Fit Impact font sized to ~90% of flag width via binary search
  3. Overlay `line1` (title) + `line2` (subtitle, ~55% of line1 size) centered inside flag with 8-12% padding
- Prompt trick: explicitly say "solid black flag with NO text or design, ready for text to be added later"

### Carousel #18 — "MASAJUL VIRAL PE TIKTOK — CE E FAKE, CE E REAL"
- **Status:** COMPLETED
- **Concept:** Trend-jack + myth-busting. Debunk 5 viral TikTok massage myths (1 session change, cracking = healing, gua sha slimming, massage gun = deep tissue, cupping = detox).
- **Layout:** NEW pattern — MIT VIRAL TIKTOK (red badge) → REALITATE (gold label) → LA GOAMASAJ (service + solution).
- **Slides:** 7 (cover + 5 debunks + CTA)
- **Scripts:** `generate_carousel18_visuals.py`, `build_carousel18_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_18/`
- **Winner visuals (flux_2 pro 2k):** Split TikTok/reality for cover, before/after face for gua sha, skin cross-section infographic for massage gun depth, cupping marks + vasodilation overlay.
- **Viral hook:** Toată lumea a văzut clipurile astea. Validation ("știam că nu e real!") + share pentru cei care au încercat prostiile.

### Carousel #19 — "5 TIPARE DE CORPURI PE CARE LE VAD LA CLIENTI"
- **Status:** COMPLETED
- **Concept:** Typology reveal (quiz vibe: "in care esti tu?") — 5 body patterns from Gabi's 1000+ client experience mapped to services.
- **Layout:** Standard hybrid — TIPAR N label + name + anatomical body copy + LA GOAMASAJ (service) + TU ACASA (DIY).
- **Slides:** 7 (cover + 5 tipare + CTA)
  1. Cover: "AM VAZUT 1000+ CLIENTI. CORPUL TAU E UNUL DIN ACESTE 5 TIPARE"
  2. SEDENTAR CORPORATE → Masaj Terapeutic + La Birou
  3. SPORTIV OVER-TRAINED → Masaj Sportiv
  4. PARINTE EPUIZAT → Masaj Relaxare
  5. DIGITAL POSTURAL → Masaj Fusion
  6. POST-LEZIUNE/CHIRURGIE → Masaj DeepTissue
  7. CTA: "IN CARE TIPAR ESTI TU? PROGRAMEAZA EVALUAREA."
- **Scripts:** `generate_carousel19_visuals.py`, `build_carousel19_final.py`
- **Output:** `C:/Users/adumi/goamasaj_carousel_19/`
- **Honest framing:** CTA slide acknowledges "restul 20% = hibrizi sau cazuri unice" — avoids reductive claims while keeping the 5-type quiz hook. User specifically pushed back on 3-type version as too reductive; 5 tipare fits template + more clinically defensible.
- **Winning pattern:** Cover with all 5 silhouettes at once = instant self-recognition (which one am I?) → drives swipe-through motivation.

### REJECTED CONCEPTS (DO NOT REUSE)
- "60 DE MINUTE CARE ITI SCHIMBA CORPUL" — timeline concept, too simple, no value, no Gemini visuals
- Carousels with "intimate confession" tone (e.g., "ce simt cand te ating") — user feedback: "ai scris script de film prono", risks association with masaj erotic which is brand-poison. Stay clinical-authoritative-aspirational, never intimate-vulnerable.
- Carousels with only DIY hacks (no massage in slides, only at CTA) — user feedback: "trebuie sa fie despre masaj... noi asta vindem". Massage must be the protagonist of every slide.
- Carousels with only massage (no DIY) — user feedback: "te duci in extreme". Hybrid is the answer.

## USER PREFERENCES & FEEDBACK HISTORY
- **MUST use Gemini/NanoBanana** for visual elements — never just text on dark
- **Content must provide REAL VALUE** — save-worthy, educational
- **Must be engaging** — stop the scroll, convince people
- **Logo placement:** top-right, inside border frames on CTA
- **NO Canva** — user explicitly banned Canva usage
- **Text spacing:** always breathing room between elements, never cramped
- **Text must NEVER intersect** with image/visual elements
- **Slide numbering:** X/5 format, top-left, using font_tag in GOLD_DIM
- **Handle:** @goamasaj centered at bottom in GOLD_DIM
- **Swipe indicator:** "SWIPE >>>" on cover slide only
- **User speaks Romanian** — respond in Romanian when in creative mode
- **User calls Claude "genial"** when work is approved

## CAROUSEL IDEAS PIPELINE
*17 carousels produced (1-17). Pipeline open for new concepts using proven hybrid pattern + fake-news viral pattern.*

### USER-CONFIRMED HEADLINE PATTERN (from #12)
**Structure:** "[Aspirational/problematic statement] — și cum poți și tu" / "[problem] — iată cum oprești asta"
**Examples that fit:** "De ce X arata asa — si cum poti si tu", "Stai 8h la birou — iata ce faci sa nu te strici", "Corpul tau imbatraneste x2 — uite cum oprești asta"
**Key:** problem statement + solution promise + you-inclusion

### USER-CONFIRMED SLIDE PATTERN (from #12)
Each content slide has 3 blocks:
1. **ZONE/PROBLEM** title (gold)
2. **LA GOAMASAJ:** [exact service from price list] + 2-3 line description of what it does
3. **TU ZILNIC ACASA:** specific DIY action (stretch / exercise / hack)

### Proven hook patterns
- **Insider/voyeur** — "what I see / what therapists know" (#9)
- **Counterintuitive shock** — "you're wrong about X", RED felt -> GOLD real source (#10)
- **Emotional + visceral** — "body keeps the score", trauma in tissue (#11)
- **Aspirational + hybrid** — "celebrities look good — you can too", massage + DIY (#12)

### Future content ideas to explore:
- Mituri despre masaj (Myth busting)
- Ce tip de masaj e potrivit pentru tine (Decision tree)
- Cum sa-ti alegi terapeutul (Authority positioning)
- Durerea de spate la birou — ghid complet (Desk worker pain)
- Cat de des ar trebui sa te masezi (Frequency guide)
- Masajul si somnul — conexiunea (Sleep + massage)
- 5 semne ca ai nevoie urgenta de masaj (Urgency signals)
- 5 substante chimice eliberate la masaj (Why people get "addicted")
- "Lucrurile pe care nu ti le spune kinetoterapeutul" (continuing insider angle)
