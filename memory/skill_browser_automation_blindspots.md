---
name: skill-browser-automation-blindspots
description: "Reusable browser-automation fixes — React portals invisible to get_page_text, file uploads via CORS CDN, silent server-side form rejection"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 4545310d-4b10-48f9-9b72-45984fa9ac6a
  modified: 2026-07-30T13:25:08.547Z
---

Trei capcane care m-au costat ore pe portalul TikTok Developers (30 iul 2026) și care se
repetă pe orice SPA modern.

**1. Un dialog "care nu apare" e adesea deschis — doar că nu-l citești.**
`get_page_text` extrage doar `<main>`. Modalele React randate în **portal** (montate direct în
`<body>`) nu apar acolo. Am declarat greșit „butonul nu deschide nimic detectabil prin
automatizare" și l-am pasat lui Eduard — modalul era deschis pe ecran tot timpul.
**Cum aplic:** când un dialog pare să nu se deschidă, verific cu **screenshot** înainte să
concluzionez ceva. Text extraction ≠ ce e pe ecran.

**2. „Saved" poate să mintă. Verifică prin reîncărcare forțată, nu prin toast.**
Formularul afișa toast-ul de succes, dar serverul respingea salvarea (validare eșuată pe alt
câmp). La reload totul era gol. **Cum aplic:** după orice Save important, navighez din nou la
pagină și confirm că valorile chiar au persistat. Toast-ul e UI optimist, nu dovadă.

**3. Uploadul de fișiere prin automatizare: ruta care merge e CORS CDN.**
Toate rutele evidente pică: unealta `file_upload` refuză fișiere din proiect; `fetch` din pagină
e blocat de CSP; server local pe 127.0.0.1 e blocat de Chrome (Private Network Access, HTTPS→localhost);
Ctrl+V prin CDP nu poartă fișierul; click pe input prin CDP nu deschide picker-ul nativ.
**Ce merge:** pui fișierul pe un host cu `Access-Control-Allow-Origin: *` (Netlify + `_headers`),
iar din pagină:
```js
const b = await (await fetch(url, {mode:'cors'})).blob();
const dt = new DataTransfer();
dt.items.add(new File([b], name, {type}));
input.files = dt.files;
input.dispatchEvent(new Event('change', {bubbles:true}));
```
Atenție: React consumă fișierul și golește `input.files` — verificarea corectă e **previzualizarea
din UI**, nu valoarea inputului.

**Bonus — inputuri React:** setarea `el.value` e ignorată. Folosește native setter
(`Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,'value').set`) + event `input`,
sau, mai sigur pentru câmpuri care validează, **taste reale**. Vezi și
[[skill-auth-live-verification]] și [[skill-wsl2-docker-gotchas]].
