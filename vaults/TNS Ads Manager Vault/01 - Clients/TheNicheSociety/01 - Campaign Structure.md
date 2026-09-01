# TNS Campaign Structure v1

**Campaign:** [SEARCH] TNS - Dezvoltare & Marketing Bucuresti
**Campaign ID:** 281498832768864
**Draft ID:** 10195243430
**Status:** DRAFT (built, NOT yet published — identity verification blocks final save)
**Created:** 2026-05-17

## Settings (TOATE CONFIRMATE ✓)

| Setting | Value | Why |
|---|---|---|
| Campaign type | Search | NO Display, NO Discovery, NO PMax |
| Objective | Leads | Phone call leads + Contacts |
| Bidding | Clicks (Manual CPC with cap) | NO Smart Bidding fără date |
| Max CPC bid limit | 12 RON | Limită agresivă pentru budget mic |
| AI Max | OFF | NU vrem broad match auto-expansion |
| Search Partners | OFF | Bot traffic |
| Display Network | OFF | Garbage placements |
| Locations | Bucharest CITY | Presence only (not interest) |
| Languages | Romanian + English | RO market default |
| URL inclusions | None | DSA disabled |
| Brand inclusions | None | No brand list limiting |
| Customer acquisition | Bid equally new & existing | NOT only-new |
| Budget | 26 RON/zi (≈780/lună) | Strict cap |

## Ad Group 1: Marketing & SEO (Agenție Digitală)

**Display path:** thenichesociety.ro/marketing/bucuresti
**Final URL:** http://thenichesociety.ro

### Keywords (18 keywords, phrase + exact match)

**Phrase match:**
- "agentie marketing online bucuresti"
- "agentie seo bucuresti"
- "servicii seo bucuresti"
- "servicii marketing online"
- "agentie google ads"
- "campanii google ads bucuresti"
- "optimizare seo bucuresti"
- "specialist google ads"
- "freelancer google ads"
- "specialist seo bucuresti"
- "promovare google ads"
- "agentie digital marketing"
- "agentie publicitate online"
- "managementul campaniilor google ads"

**Exact match:**
- [agentie seo bucuresti]
- [servicii google ads]
- [agentie marketing digital]
- [creare campanii google ads]

### RSA: 7 Headlines

1. Agenție SEO & Google Ads (24 char)
2. Marketing Online București (26)
3. Specialist Google Ads Live (26)
4. Mai Multe Leaduri din Google (28)
5. Audit Gratuit Google Ads (24)
6. SEO Local pentru Afaceri (24)
7. TNS - Marketing pe Rezultat (27)

### RSA: 4 Descriptions

1. Campanii Google Ads optimizate pentru rezultate. Audit gratuit & strategie pe ROI. (82)
2. SEO local + Google Ads București. Mai multe leaduri la cost pe lead scăzut. (75)
3. Agenție marketing digital TNS. Portofoliu solid, clienți reali, rezultate lunare. (81)
4. Plătești pe rezultate, nu pe click-uri. Strategie clară, rapoarte transparente lunar. (85)

### Ad strength: Poor → Average (după keywords în headlines)

Improvement TODO post-launch:
- Add 1-2 keywords ("Google Ads", "SEO", "marketing") în 2 headlines pentru "Include popular keywords"
- Add Sitelinks (4 min): /servicii, /portofoliu, /contact, /audit-gratuit
- Add Callouts: "Audit Gratuit", "Strategie pe ROI", "Rapoarte Lunare", "Portofoliu Solid"

## Recomandări IGNORATE deliberat (de ce Optimization Score = 76.5%)

| Rec | Why we ignored |
|---|---|
| AI Max ON | Broad match auto-expansion arde budget mic pe queries irelevante |
| Search Partners ON | Bot traffic, low-quality |
| Display Network ON | Garbage placements (Smart Campaign anterior dovadă) |
| Increased budget la RON118/zi | NU mărim până nu vedem ROI |
| Apply broad match | Tara la 800 RON/lună budget |

76% Opt Score E HEALTHY pentru setup conservator. Industry avg = 80%, dar 100% înseamnă să accepți toate recomandările Google (multe contraproductive pe budget mic).

## Forecast (la 26 RON/zi)

- Weekly clicks: ~175
- Avg CPC: ~1.04 RON
- Weekly cost: ~182 RON (= 780/lună, sub budget cap)
- Estimated leads/month: 5-15 (la 5-10% CVR)

## TODO post-publish (3 AG arhitectura)

### AG2: Website & Magazin Online (NU CONSTRUIT ÎNCĂ)

Keywords sugerate (phrase + exact):
- "creare website firma bucuresti"
- "dezvoltare site web"
- "magazin online creare"
- "agentie web design bucuresti"
- "creare site profesional"
- "magazin online wordpress"
- "site prezentare firma"
- "redesign site web"
- [creare website bucuresti]
- [agentie web design]
- [magazin online firma]

### AG3: Aplicații Mobile & Software (NU CONSTRUIT ÎNCĂ)

Keywords sugerate:
- "dezvoltare aplicatie mobila"
- "agentie aplicatii mobile"
- "creare aplicatie iOS"
- "dezvoltare software custom"
- "aplicatie mobila pentru firma"
- "agentie dezvoltare app"
- "programator aplicatii mobile"
- [dezvoltare aplicatie mobila bucuresti]
- [agentie software bucuresti]

### Negatives B2B (NU adăugate încă)

Add la nivel de campanie (Shared list "TNS_B2B_Negatives"):
```
gratis
tutorial
curs
cursuri
job
joburi
stagiar
internship
"free template"
"how to make"
cum sa fac
"do it yourself"
DIY
salariu
salarii
locuri de munca
career
recrutare
angajez
caut programator
caut developer
```

## Status & Handoff la User

✅ Built: Settings + Bidding + AI Max OFF + Keywords + RSA AG1 + Display path + Budget
❌ Blocked: Identity verification dialog (Skip not offered on Review step)

### USER ACTION REQUIRED:

1. Open: https://ads.google.com/aw/campaigns/new/search/draft?campaignId=281498832768864&draftId=10195243430
2. Click into the campaign draft
3. Confirm identity (popup will appear → click Confirm, complete phone verification dacă e cerut)
4. Re-verify Budget = 26 RON/zi (poate s-a revertit la RON 142.39 dacă save-ul a fost blocat)
5. Click **Publish campaign** la final
6. Campaign starts PAUSED (per alert "None of your ads are running")
7. Pentru Enable: click campania → toggle Status ON

### NICE TO HAVE (Optional, post-launch):

8. Adaugă Sitelinks: /servicii, /portofoliu, /contact, /audit-gratuit
9. Adaugă Callouts B2B: "Audit Gratuit", "Strategie pe ROI", "Rapoarte Lunare", "Portofoliu Solid"
10. Adaugă AG2 (Website) + AG3 (Mobile App) — via Google Ads Editor (mai rapid decât UI)
11. Add 20+ B2B negatives din lista de sus

## Tracking

- GA4 link: NU am setat încă pentru TNS — separate task
- Conversion actions: NU configurat (TNS deja are AW-17890493567 instalat via Netlify pentru goamasaj.ro, dar TNS site folosește alt setup probabil)
- Google Tag pe thenichesociety.ro: VERIFICARE NECESARĂ înainte de Enable
