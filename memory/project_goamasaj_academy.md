---
name: project_goamasaj_academy
description: "GoaMasaj Academy — massage school: site /academie + platformă cursanți (BI leads + plăți) + PRODUCȚIE materiale de curs premium din sursă BioFocus. BioFocus split ABANDONAT, cursul se vinde întreg de GOA"
metadata: 
  node_type: memory
  type: project
  originSessionId: defcd149-c637-4907-b31a-86f62cc907f4
  modified: 2026-08-17T19:49:30.067Z
---

**PIVOT 2026-07-14 (decizia lui Eduard):** NU se mai face split cu BioFocus — GOA vinde cursul
întreg: 4 module × 1.800 lei = **7.200 lei cursul complet** (plătibil pe module). Certificarea =
"certificat de absolvire GOA Masaj Academy" (⚠️ wording-ul de acreditare de reconfirmat cu Gabi).

**PRODUCȚIE MATERIALE DE CURS (2026-07-15, direcție nouă de la Eduard):**
Gabi are în WhatsApp („Sculpt by Gabi" = Holoc Gabriel, Business Account, official@goamasaj.ro)
suportul de curs de la **Centrul BioFocus** (școala unde s-a calificat). ~17 PDF-uri catalogate:
- **Suporturi mari:** SUPORT DE CURS TERAPEUTIC 2020 (33p), SOMATIC 2020 (34p),
  DRENAJ LIMFATIC (29p), REFLEXO 2020 (28p).
- **Somatic pe zone:** 1-Somatic introducere, 2-spatele (var. extinsă), 3-zona cervicală,
  4-membru inferior, 5-torace_abdomen, 6-membru superior, 7-capul.
- **Reflexo (PPT→PDF):** 1-intro&Renal, 2-limfatic, 3-Nervos, 4-Respirator, 6-Endocrin, 7-Cardio
  (posibil lipsă 5-). Toate au logo/brand BioFocus pe pagini.
- În aceeași conversație: 7 slide-uri carusel IG (slide_01-07.png, „FACI SPORT DAR NU CREȘTI?
  recovery"), GOA-Masaj-Academy-Propunere-Parteneriat.pptx, GOA-Masaj-Academy-Plan-de-Business.pdf
  (ultimele 2 = livrabilele NOASTRE, nu suport de curs).

**Plan (decis):** BioFocus = SURSĂ/schelet. Producem versiunea GOA **originală + premium**:
explicații rescrise (Gabi validează → copyright-safe), diagrame/grafică custom, poze mai bune,
**lecții video** (Higgsfield/Remotion din stack), design system unitar (Playfair+Inter, ink+gold).
NU copiem paginile BioFocus (risc IP — GOA = școală concurentă). Abordare recomandată: PILOT pe
1 modul (recomand Masaj Somatic = modul 01, fundamentul) → sample premium → green-light Gabi → scale.

**BLOCKER descărcare:** dublu-click pe doc în WhatsApp Web = preview (VIEWING merge, nu e blocat).
Descărcarea în masă (multi-select) a declanșat protecția Chrome „block multiple downloads" pt
web.whatsapp.com → acum blochează și single downloads; reload NU curăță permisiunea persistată.
Fix: Eduard dă „Allow" pe iconița de descărcări blocate din bara de adresă (e Chrome-ul LUI real
via claude-in-chrome), apoi descarc una-câte-una în folder `Desktop/claude/goamasaj-suport-curs/`
(deja creat). Alternativ: citesc conținutul din preview (screenshots) pt modulul-pilot, fără download.
Skill relevant: [[skill_whatsapp_web_file_send]] (clipboard trick pt send; aici e download).

**Faza web (începută 2026-07-14, decisă SEO-wise):**
- Pagina de vânzare = **goamasaj.ro/academie** (subdirector, NU subdomeniu — moștenește autoritatea
  domeniului); platforma de cursanți (LMS + tracking plăți) = viitor subdomeniu, noindex, Supabase propriu.
- Site static nou în `Desktop/claude/goamasaj-academie/` (acum Vite+React v3, vezi mai jos).
- **Site-ul principal goamasaj.ro = repo GitHub `Eduard22222222/bucuresti-zen-glow`** (Vite+React+
  shadcn+prerender, Netlify site `timely-khapse-f30e83`, auto-deploy din main). Clonat local în
  `Desktop/claude/goamasaj-site/` (preview port 5183).
- Fapte verificate pt copy: Gabriel Dănuț Holoc, tehnician maseur certificat Min. Muncii +
  Min. Educației, calificare 1.080 ore media 10 (la Biofocus), specializări drenaj/terapeutic/deep
  tissue/dry needling IAOM-US.

**Plăți (decis 2026-07-15):** **Stripe** (cel mai simplu; Gabi își face cont) + **transfer bancar**
(0% comision, metoda principală pt 7.200 lei în rate). Netopia/EuPlătesc mai ieftine dar negociabile;
la volum mic transferul e cel mai ieftin. FACTURARE RO (e-Factura) se face oricum din SmartBill/Oblio
indiferent de procesator — Stripe adaugă doar taxare inversă pe comision (firmă IE). LMS are deja:
pagină Setări plată (IBAN+link Stripe global), link Stripe per-cursant, plăți parțiale (avans/rest).
DE FĂCUT când Gabi are Stripe: pune IBAN + Payment Link în Setări.

**PIPELINE ANATOMIE CORECTĂ (2026-07-15) — Blender + Z-Anatomy:**
Eduard a respins imaginile AI de anatomie („ne trebuie absolute anatomical accuracy") — pe drept:
Higgsfield/Soul produce anatomie *plauzibilă*, nu corectă (omoplați detașați, straturi imposibile).
Prompt-urile NU rezolvă asta. Soluție adoptată: randăm din **Z-Anatomy** (date BodyParts3D derivate
din RMN real, CC BY-SA) — corect prin construcție.
- Model: `goamasaj-curs-premium/anatomy3d/Z-Anatomy/Startup.blend` (307MB, din Z-Anatomy.zip 83MB,
  repo GitHub Z-Anatomy/Models-of-human-anatomy). Sisteme: schelet 2218, muscular 894, limfatic,
  nervos, cardiovascular, visceral.
- Script: `anatomy3d/render.py`, presets spate|cervical|limfatic|corp. Rulare:
  `blender.exe -b Z-Anatomy/Startup.blend -P render.py -- spate "//out/x.png" [--fast]`
- **CAPCANE rezolvate (toate necesare, altfel iese cadru gol/gri):**
  1. `scene.render.use_sequencer=False` + `use_compositing=False` + `scene.use_nodes=False`
     — fișierul are VSE+compositor care ÎNLOCUIESC randarea cu un cadru gri plat (asta a fost
     cauza principală, m-a costat multe iterații).
  2. EEVEE randează GOL headless → folosește `CYCLES` + `cycles.device="CPU"`.
  3. Colecțiile sunt ascunse la nivel de LayerCollection (`hide_viewport`), nu doar hide_render →
     setează recursiv pe layer_collection ȘI pe collection.
  4. Obiectele muscular au flaguri proprii de ascundere → forțează `ob.hide_render=False` per obiect.
  5. Ascunde obiectele FONT + titlurile mesh („SKELETAL SYSTEM" etc.) și fascia
     (nume conțin "ascia"/"aponeuros"/"sheath") — fascia acoperă mușchii ca strat translucid.
  6. `use_freestyle=False` (fișierul vine cu contur activat).
  7. `c.all_objects` poate întoarce None (referințe rupte) → guard.
- Randări gata: `media/anatomie-corecta/01-spate-muschi.png`, `02-cervical.png` (1920x1080).
  Imaginile AI mutate în `media/ai-decor/` — DOAR decor, nu material didactic.
- Atribuire obligatorie CC BY-SA: „Model Z-Anatomy (CC BY-SA 4.0)".

**FIX IMPORTANT /academie (2026-07-15) — ar fi rupt producția:**
Academy e o aplicație separată servită sub `/academie` (proxy). Cu `base` default `/`, index.html
referea `/assets/...` absolut → sub goamasaj.ro/academie browserul cerea asset-urile de la site-ul
PRINCIPAL → se încărca aplicația greșită și randa pagina 404 (simptom raportat de Eduard în dev).
Fix aplicat:
- `goamasaj-academie/vite.config.ts`: **`base: "/academie/"`** (asset-urile ies `/academie/assets/…`).
- `goamasaj-academie/netlify.toml`: redirect `/academie/* → /:splat` (200) ca URL-ul standalone de
  staging să rămână funcțional (acolo fișierele stau în rădăcină).
- `goamasaj-site/vite.config.ts`: `server.proxy` `/academie → localhost:5182` **FĂRĂ rewrite**
  (dev server-ul Academy servește deja sub /academie/ din base). Paritate dev↔prod.
- Producție (netlify.toml site principal): redirect-urile TAIE prefixul (`/academie/* → …/:splat`),
  fiindcă pe site-ul Academy build-ul stă în rădăcină. Verificat: html 200 + asset 200 pe staging.
Notă dev: `localhost:5182/` acum face 302 → `localhost:5182/academie/` (normal cu base setat).
Notă tooling: `npx --yes vite` în launch.json nu pornea; folosește `npm run dev` (Vite ~45s boot).

**Status 2026-07-15 (v3 — conversion-first + BI, sesiune continuată):**
- **Font schimbat pe Playfair Display + Inter** (match exact goamasaj.ro — repo folosea Cormorant,
  Eduard urât).
- **Pagina Academy = conversion-first cu FUNNEL de mentorship** (nu checkout direct): CTA principal
  "Rezervă o discuție 1:1" → formular → "Te sunăm în 24h". Hero: buton mare ALB "Intră în platformă"
  (.btn-white) + link "Vezi programa" jos. Secțiune diferențiere (materiale 3D, metodologie
  interactivă, antreprenoriat, digital+platformă). Poze reale în fiecare modul + bonus 05 freelancing.
  SEO "curs masaj București" + JSON-LD Course+LocalBusiness.
- **Lead capture în platformă** (nu Netlify Forms): formular Academy POST → edge fn `submit-lead`
  (public, honeypot) → tabela `leads`.
- **LMS complet** în `Desktop/claude/goamasaj-cursanti/` (Vite+React+TS+Tailwind, port 5184):
  - Login, portal cursant (module/lecții signed URLs, achitat/rest/progres).
  - Admin: Cursanți (achitat/rest per cursant), profil cursant `/admin/cursant/:id` (plăți parțiale
    avans/rest + link Stripe per-cursant), Lecții (upload Storage), Grupe, **BI Lead-uri**
    `/admin/lead-uri` (KPI cine-a-sunat/rată conversie, convertește lead→cursant cu prefill),
    **Setări plată** `/admin/setari-plata` (IBAN + Stripe link).
  - Supabase pe **contul PERSONAL** Eduard (Eduard Dumitriu Org): ref **topvbletxspwayshjidl**,
    eu-central-1, $10/lună. Migrații 0001-0003 aplicate, edge fns create-student + submit-lead.
    RLS 100% (advisor curat). Admin Gabi: **goa.masaj@gmail.com / GoaAcademy2026!**.
    Chei în `keys/goamasaj-academy.md`. TODO manual: activează HIBP în Dashboard.
- E2E verificat LIVE (lead→BI→convertit→avans 500→rest 6700; login cursant; RLS negativ).
- **NIMIC DEPLOYAT — Eduard a RETRAS ok-ul de deploy.** Când vine OK: push goamasaj-site→main,
  deploy LMS + subdomeniu cursanti.goamasaj.ro, wire Stripe.
- Modificări site principal COMMIT local goamasaj-site/ (b24915b), NEpush.

**Status 2026-08-17 (atlas 3D + video + Lecția 2):**
- **Atlas anatomic 3D interactiv** în LMS la `/anatomie` (link în nav cursant ȘI admin — Gabi îl
  proiectează la curs; card și în pagina Modulului 1). `Viewer3D.tsx` + `lib/anatomie-ro.ts`:
  **616 mesh-uri, toate 213 denumiri unice traduse în RO** (verificat 213/213), filtru pe 11 regiuni,
  căutare RO+latină, butoane Față/Spate, highlight auriu, badge „Modul I". Model `public/model/muschi.glb`
  (1.4MB, Draco) + decoder în `public/draco/`. Detalii de implementare: [[skill_zanatomy_3d_web]].
  Verificat live: click pe flanc → „Mușchiul oblic extern abdominal (dreapta)", pe coapsă → „vast lateral",
  pe spate → „mare dorsal".
- **3 clipuri Higgsfield** (seedance_2_0, image→video din POZELE REALE ale lui Gabi, 1080p/5s, ~45cr each):
  `goamasaj-curs-premium/media/video/` — antebrat-spate, cupping, pietre-calde. Trimise lui Eduard,
  AȘTEAPTĂ feedback care merg. Demonstrațiile de tehnică NU se pot face cu AI — trebuie filmate cu Gabi
  (marcajele `.vid` din lecție sunt exact acele locuri).
- **Lecția 2 — Protocolul spatelui** (`lectia-somatic-02.html`): poziționare, cele 3 linii de lucru,
  5 neteziri, fricțiune/frământare/vibrație/tapotament, avertismente (rinichi, coloană, lombar),
  încheiere cu presiuni + respirație dirijată. Sursă: cap. III.1 din SUPORT SOMATIC 2020, rescris.
- Turntable anatomice gata: `media/video/anatomie-spate.mp4` + `anatomie-cervical.mp4` (36 cadre,
  1280×720, cervical la `--exposure 65` altfel trapezul se albește). Script `anatomy3d/build-turntable.sh`.
- **MODULUL I COMPLET — toate 7 lecțiile** (`lectia-somatic-01..07.html` + `modul-01-index.html`),
  fiecare cu PDF (`pdf/`) și deck de proiecție (`ppt/GOA-Modul-01-Lectia-0N-*.pptx`, bază comună
  `ppt/deck-base.js`). Sursa: cap. III.1–III.7 din SUPORT SOMATIC 2020, rescris.
- **Lecțiile sunt ÎN PLATFORMĂ**: 7 rânduri în `lessons` (module_id 1) + PDF-uri în bucket-ul privat
  `materials/modul-1/lectia-0N.pdf`. Verificat live ca student: URL semnat 200 `application/pdf`;
  test negativ fără cont = 400 pe toate căile (inclusiv `/object/public/`).
  Upload făcut cu sesiunea de admin (anon key din `goamasaj-cursanti/.env.local` + contul lui Gabi).
- Higgsfield: cont ireneai020504@gmail.com, ultimate, ~1010 credite rămase.
- **AȘTEAPTĂ DE LA EDUARD/GABI:** care din cele 3 clipuri se păstrează · filmarea demonstrațiilor de
  tehnică cu Gabi (marcajele `.vid` din lecții) · confirmarea prețului 7.200 și a formulării
  certificatului (fără „acreditat" fără furnizor ANC).

--- Istoric (planul original, pre-pivot, cu BioFocus split): vezi versiuni anterioare ---
