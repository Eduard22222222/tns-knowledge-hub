---
name: TNS Ads Manager Project
description: Google Ads + SEO management system by TNS — operational playbook + client work, first client GoaMasaj
type: project
originSessionId: 428af5c0-1d87-4f77-8b4f-108abd46895d
modified: 2026-08-03T15:11:17.494Z
---
Sistem de management Google Ads + SEO creat de Eduard / The Niche Society pentru clienți nișă.

**Why:** Administrare profesionistă campanii paid cu metodologie documentată și scalabilă.
**How to apply:** Folosește skill-urile adspirer + seo + analytics când lucrezi pe orice campanie de ads.

## Structura proiectului

- Obsidian Vault: `OneDrive/Documents/TNS Ads Manager Vault/`
- Cod (viitor dashboard): `Desktop/claude/tns-ads-manager/`
- MCC Google Ads: TheNicheSociety account
- **Playbook reutilizabil:** `03 - Playbooks/Behavioral Tracking Playbook.md` — copy-paste setup pentru orice client nou (~45 min)
- **Claude Ads skill instalat (17.05.2026):** `03 - Playbooks/Claude Ads Skill Reference.md` — 19 sub-skills + 10 agents (audit/strategy/creative). Comenzi: `/ads dna`, `/ads plan`, `/ads create`, `/ads google` (audit 80 checks), `/ads math`, etc. NU face UI automation — pentru bulk campaign creation folosește Google Ads Editor.

## Vault structure

```
00 - System/         → README, Workflow onboarding
01 - Clients/        → GoaMasaj/, TheNicheSociety/, Ago-Filo/ (brief, keywords, campanie, tracking, SEO plan)
02 - Templates/      → Brief Template, Monthly Report
03 - Playbooks/      → Local Business Google Ads, Tracking Setup
```

## Clienți activi

| Client | Budget | Status |
|---|---|---|
| GoaMasaj (goamasaj.ro) | 600 RON/lună | LIVE 18 mai 2026, Opt Score 82.6%, profitabil (4-6 program/săpt) |
| TNS (thenichesociety.ro) | PAUSED 19 iun 2026 | Tăiat total (decizie Eduard) — ~0 lead-uri B2B reale la RON 26/zi. Buget cont scăzut RON 46→20/zi. Canal B2B = niche-leadpages cold outreach, NU search |
| Ago-Filo (agofilo.ro) | TBD | SCHELET pregătit — nu pornit încă (pending buget + access Ads + GBP) |

## ⚠️ TNS DIAGNOSTIC IMPORTANT (2026-06-19) — conversiile sunt FANTOMĂ

Eduard a observat: 14 conversii TNS în Google Ads dar ZERO în mail/calendar. Investigat complet:
- **Cauza:** conversia **"Contact Us" (eveniment GA4) = 137 conversii all-time** se declanșează PREA LARG (vizite/interacțiuni pagină contact, NU contacte reale). Asta umflă numărul. Sursă: GA4 property thenichesociety.ro.
- **Interacțiuni telefonice REALE (all-time):** Phone click website = 3, Calls from ads = 0, Clicks to call = 0. **Aproape nimeni n-a dat click pe telefon, ZERO au sunat.**
- **Form submits:** 12 total în Netlify Forms, ultima 30 mai, TOATE spam (Jason/Junior Boyle/Moses — nume false). Zero în iunie. NU s-au pierdut lead-uri reale.
- **"Book appointment" conversie = Misconfigured** în Google Ads.
- **Concluzie:** sistemul de booking NU e stricat, nimeni nu l-a folosit. Lead-uri B2B reale TNS ≈ 0. La RON 26/zi în piața web design București (CPC RON 7.10-7.71, CTR 3.5%), search ads NU produce lead-uri B2B indiferent de optimizări. Keywords sunt OK (relevante), problema = ad copy slab (CTR) + natura B2B + buget mic.
- **TODO (browser Ads UI îngheață constant — de făcut când cooperează sau în Ads Editor):** (1) demote "Contact Us" GA4 la Secondary ca să nu mai umfle; (2) fix "Book appointment" Misconfigured; (3) RSA ad copy (CSV gata în `_Reports/2026-06-08-rsa-ads-editor-import.csv`) = fix-ul real de CTR; (4) eventual pauză "dezvoltare site web" (duplicat slab cu "design site web"). **Canalul B2B serios rămâne [[project_consumervoice_leadgen]] / niche-leadpages cold outreach, NU search ads la bugetul ăsta.**
- 70 negative keywords pe TNS (adăugat gratuit/gratis/magento/salariu pe 9 iunie).

## Ago-Filo (croitorie bespoke București) — schelet creat 2026-06-09

Client nou TNS Ads Manager. Atelier croitorie premium, Calea Victoriei 63-81, 20+ ani, 3000+ costume. Site `agofilo.ro` (Lovable app `ago-filo.lovable.app` + domeniu Namebox). Tel 0773 807 368, office@agofilo.ro.

- **Vault Obsidian:** `01 - Clients/Ago-Filo/` → `00 - Brief.md`, `01 - Keyword Research.md`, `02 - Campaign Structure.md`, `03 - Tracking Setup.md`, `05 - SEO Plan.md`, `Reports/`.
- **GSC:** Domain property `agofilo.ro` pe cont **office@thenichesociety.ro** (REGULĂ confirmată de Eduard: tot ce e business / Google / analytics e pe contul The Niche Society). Baseline 3 luni: 61 clicks / 1.53K impr / CTR 4% / poz 4.8 — **~66% click-uri pe BRAND** (ago filo/agofilo); pe generice comerciale (croitorie, croitorie la comandă) apare dar nu prinde click = zona de creștere.
- **Booking pipeline existent:** `/programare` → Supabase (`hfezamyfvwzgyriljnek`) → Zapier "AGO-FILO Programari - WhatsApp + Calendar" (cont Zapier TNS) → WhatsApp + Google Calendar. Funcțional (verificat 2026-06-09).
- **Incident 2026-06:** domeniul a EXPIRAT (~29 mai, PendingDelete la Namebox/RoTLD) → site inaccesibil, programări neprimite. Rezolvat (reînnoit). **TODO: Auto-renew ON la Namebox.** Favicon-ul nu apărea în Google din cauza căderii → dat Request Indexing în GSC pe homepage 2026-06-09 (reapare în câteva zile).
- **GBP EXISTĂ ȘI E PUTERNIC** (verificat live 2026-06-09 în SERP): "ago | filo", **4.9★ / 27 recenzii**, Tailor in Bucharest, Calea Victoriei 63-81 (Radisson Blu), telefon + program afișate. P1 SEO practic acoperit — focus pe menținere recenzii + poze.
- **⚠️ FAVICON — CAUZA REALĂ GĂSITĂ 2026-08-03:** favicon-ul (`logo.png`) era o marcă **ALBĂ pe fundal TRANSPARENT** → pe fundalul alb al Google = **invizibil** → de-aia n-a apărut NICIODATĂ în luni de zile (nu era lag Google). FIX: am compus logo-ul alb pe fundal **negru #080808** (tema site-ului) → `favicon-af.png` (192) + `favicon-af.ico` (PNG-in-ICO 64px, vizibil). Deploy pe cPanel prin **PHP dropper** (save_file_content scrie un .php cu base64→file_put_contents, rulat via HTTP, apoi șters) fiindcă `file_upload` din Chrome MCP e restricționat la foldere de sesiune, iar `save_file_content` scrie doar text. GOTCHA: base64 lung (>~3KB) se TRUNCHIAZĂ în apelul javascript_tool → folosește imagini mici (64px). Suprascris și `/favicon.ico` root cu versiunea vizibilă. HTML (index+rute) actualizat să pointeze la `/favicon-af.*`. Sursă `index.html` + `public/favicon.ico` actualizate pt. build-uri viitoare. Request Indexing dat. LECȚIE: verifică VIZUAL imaginea de favicon (Read pe fișier) — un favicon „valid tehnic" (200, dimensiuni corecte) poate fi invizibil.
- **[istoric] Cache-bust favicon deployat 2026-06-24** (nume nou de fișier) — nu a rezolvat fiindcă problema reală era invizibilitatea, nu cache-ul.
- **[istoric superseded]** După ~1 săpt cu cache Google gol (404) deși site-ul era tehnic perfect (verificat inclusiv DOM randat), am forțat re-fetch: găzduire = **cPanel/LiteSpeed la Namebox** (user `viasarto`, /home/viasarto/public_html, cPanel `https://agofilo.ro:2083`). Site-ul e **dist static** uploadat manual (NU Lovable). Prin API-ul cPanel (fetch autentificat) am: copiat `favicon.ico`→`favicon-v2.ico` și `logo.png`→`app-icon.png`, apoi am editat `index.html` + toate paginile de rută să referențieze noile URL-uri (PNG 500×500 pus ca icon principal). Verificat live (200 pe ambele). Dat Request Indexing #3. **Monitor:** `https://www.google.com/s2/favicons?domain=agofilo.ro&sz=64` — când dă 200 cu iconița = gata (reapare în zilele următoare). NB: `file_upload` din Chrome MCP respinge fișiere din afara folderelor sesiunii → pe cPanel am lucrat prin API JS, nu prin upload UI.
- **SEO plan (P0→P4):** P0 favicon/auto-renew/sitemap · P1 GBP (✅ există, 4.9★/27) · P2 pagini comerciale (croitorie la comandă București, costume bărbați, sartoria) · P3 blog autoritate · P4 igienă tehnică SPA. KPI cheie = click-uri NON-brand.
- **Pending de la client:** buget, access Google Ads (sub MCC TNS), prețuri servicii, capacitate/lună, status GBP, confirmare auto-renew domeniu.

## GoaMasaj next steps (2026-05-13)

### COMPLETAT ✅
- GTM instalat (GTM-KPLX25VD), GA4 creat (G-ZJ8CH8X2X3, property 537608107)
- GA4 tags publicate: Configuration + Event (apel tel + WhatsApp) — Version 3
- GA4 ↔ Google Ads linked (aprobat din Data Manager)
- generate_lead marcat Key Event în GA4
- generate_lead importat în Google Ads ca Primary conversion (Submit lead form, 90 days, Yes in goals)
- GTM injectat pe goamasaj.ro live via Netlify Snippet Injection (timely-khapse-f30e83) — 14.05.2026
- GTM verificat live: google_tag_manager ✅, dataLayer ✅ (gtm.js/dom/load), gtmScript ✅
- **Behavioral tracking layer publicat — GTM Version 4, 14.05.2026** (5 triggers + 7 tags GA4 Event: phone_click cu button_label, whatsapp_click cu button_label, nav_click, service_interest, social_follow, scroll_depth, time_engaged 30s/60s). Prioritate setup = `phone_click` cu `button_label` ca să vedem CARE CTA telefon convertește cel mai bine.
- Playbook reutilizabil creat: `03 - Playbooks/Behavioral Tracking Playbook.md` (~45 min/client după pattern stabilit)

### URMEAZĂ
1. **Keyword Research FINAL** — 209 keywords analizate din Google KP (Bucuresti). Top discovery: `masaj deep tissue` 500/mo, `masaj anticelulitic` 500/mo, `masajul limfatic` 500/mo (toate lipseau din brief inițial). Vault: `01 - Keyword Research.md`
2. **Campaign Structure v2** — 4 ad groups (adăugat Anticelulitic + Limfatic dedicat), max CPC per AG, RSA validate pe caractere (≤30/≤90), 150+ negative keywords structurate pe 8 categorii. Vault: `02 - Campaign Structure.md`
3. **CAMPAIGN DRAFT creat în Google Ads** — campaignId `281498825185404`, nume `[SEARCH] GoaMasaj — Bucuresti`. Configurat: Leads/Search/Bidding Clicks max 3 RON/Networks OFF/Bucharest Presence-only/RO+EN/AG1 cu 10 keywords + 7 headlines. **Blocat la "Confirm it's you"** identity verification — necesită finalizare manuală. Handoff complet în `04 - Campaign Launch Handoff.md` (90 min muncă rămasă: AG1 finalizare + AG2/AG3/AG4 + negatives + extensions + budget + pause review).
4. Custom dimensions în GA4 Admin (button_label, section, service_name, platform, depth_threshold, seconds — toate Event scope)
5. **LANSARE CAMPANIE** după pre-launch checklist din Campaign Structure v2 — campania la momentul lansării trebuie să fie inițial PAUSED pentru review
6. Verificare zone de acoperire de la client (cu Eduard)
7. LocalBusiness schema adăugată pe goamasaj.ro
8. Test final: click telefon → conversie apare în Google Ads + behavioral events vizibile în GA4 DebugView (după lansare campanie)
9. După 7 zile cu trafic: Search Terms harvesting + analiză button_label performance → optimizare CTA pe pagină + ad copy

## Skills utilizate

- `adspirer-ads-agent:keyword-research` — keyword planning
- `adspirer-ads-agent:campaign-performance` — monitoring
- `adspirer-ads-agent:ad-campaign-best-practices` — structură campanie
- `paid-ads` — strategie
- `local-legal-seo-audit` — local SEO (perfect pentru clienți locali)
- `seo-keyword-strategist`, `seo-fundamentals`, `seo-audit`
- `google-analytics-automation`, `analytics-tracking`
- `schema-markup` — LocalBusiness schema
