---
name: skill_video_hero_renderer_freeze
description: "Chromium renderer FREEZE pe pagini cu <video> hero la salturi mari de scroll — pause() nu ajută, doar demontarea din DOM; + Netlify Forms e OFF by default la site-uri noi"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 591ed5cb-0e8d-43ad-9b6c-e0d7a54de6af
---

**Bug reprodus & rezolvat pe goamasaj-academie (2026-07-14):**

Pagină statică cu `<video autoplay loop muted>` în hero (100svh) → la salturi mari de scroll
(anchor links, End key, `scrollTo` peste mii de px), renderer-ul Chromium **îngheață complet**
(main thread mort: `Runtime.evaluate` și `Page.captureScreenshot` timeout; utilizatorii reali
pot lovi asta, nu e doar un artefact de captură).

**Diagnostic diferențial (ordinea contează):**
1. Screenshot negru + DOM sănătos (opacity 1, elementFromPoint corect) = artefact de paint/captură.
2. Screenshot timeout + `Runtime.evaluate` timeout = main thread REAL blocat → bug de pagină.
3. Bisectează cu `document.querySelector('video').remove()` într-un tab proaspăt → dacă
   salturile devin stabile, video-ul e cauza.

**Fix care funcționează:** demontează video-ul din DOM când secțiunea hero iese din viewport
(IntersectionObserver pe SECȚIUNE, nu pe video — elementul detached nu mai primește notificări)
și remontează-l cu `.play()` la revenire. `video.pause()` NU e suficient. Bonus: scoate
`scroll-behavior: smooth` pe pagini lungi cu video hero și evită `backdrop-filter: blur` peste
video (alte căi spre wedge de compositor).

**Bonus Netlify (a doua capcană din aceeași zi):** la site-urile Netlify NOI, Forms e dezactivat
by default — `processing_settings.ignore_html_forms: true`. POST-ul către formular dă 404 deși
pagina are `data-netlify="true"`. Fix: `netlify api updateSite` cu
`{"processing_settings":{"ignore_html_forms":false}}` + un deploy cu fișiere SCHIMBATE (deploy
identic sare post-procesarea, formularul nu se înregistrează). Verifici cu `listSiteForms`.
Notificarea pe email = `createHookBySiteId` cu `{type:"email",event:"submission_created"}`.
Legat de [[project_goamasaj_academy]].
