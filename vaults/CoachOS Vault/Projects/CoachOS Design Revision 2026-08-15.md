---
tags: [project, coachos, design, active]
created: 2026-08-15
updated: 2026-08-15
status: active
---

# CoachOS — Revizia de design, 15 aug 2026

Sprint de noapte cerut de Eduard. Brief-ul, în cuvintele lui: *„mai dinamic, mai
Apple-like"*, plus imagini Pexels, zonă de avatare, animații pe butoane și interfață de
student.

**ÎMPINS pe `main` la 2026-08-15**, `33057c5..36ecc95`, cinci commit-uri tematice.
Cod: `Desktop\claude\coachos\` (clone real, remote `thenichesociety@github.com`).

## Commit-urile (ca Filip să citească pe teme, nu 40 de fișiere odată)

| SHA | Ce |
|---|---|
| `fdb49eb` | Fonturi + curățat resturile create-next-app (titlu „Create Next App", Geist nefolosit, 5 SVG-uri default, sufix dublat în 22 de pagini) |
| `32ea95c` | Raze, elevație, sticlă, mișcare + login cu fotografie |
| `5204a8e` | Avatare-monograme + `initials()` cu 11 teste |
| `38a8efe` | Prototip interfață de student (NErutat) + `docs/STUDENT_VIEW.md` |
| `36ecc95` | Corectat stack-ul documentat fals + 3 capcane noi în `CLAUDE.md` |

Verificat înainte de push: typecheck · lint · **158/158 teste** · build. `.env.local`
confirmat absent din commit-uri, scanare de secrete pe tot ce pleca — curată.

## Direcția aleasă

Pornisem pe „program de meci" (editorial-sportiv). Eduard a cerut Apple-like la jumătatea
drumului, deci registrul s-a mutat: **raze mai mari, umbre stratificate, sticlă mată,
mișcare cu arc, mai mult aer**. Ancora de recunoaștere a rămas aceeași — **rigla de teren**,
două hairline-uri la 1px cu un marcaj accent de 40px, care închide fiecare `PageHeader`.

Paleta n-a fost atinsă. Verdele de teren rămâne singurul accent — profunzimea vine din
tipografie, ritm și elevație, nu din culori noi. Asta e și disciplina lor documentată.

## Ce s-a livrat

**Tipografie** — Archivo (titluri, cifre, etichete) + Instrument Sans (text). Ambele variabile,
self-hosted la build de `next/font`, zero request către Google la runtime — ceea ce ține
adevărată linia „no third-party calls" din `PRIVACY_AND_SECURITY.md`. Cifre tabulare peste tot
unde se compară numere pe coloană.

**Sistem** — scară de raze (8→24px), elevație în trei trepte cu **două** umbre fiecare
(una de contact, una de distanță — o singură umbră arată ca un sticker), `.glass` cu
`@supports` guard, `.press` pentru feedback la apăsare, `.stagger` pentru intrare în cascadă,
hairline ca tentă a foreground-ului nu gri fix.

**Imagini** — trei fotografii Pexels în `public/img/` (668 KB total). Login refăcut ca split
cu fotografie aeriană de zgură + citat. Empty state ilustrat pe primul ecran.
**Fără oameni în nicio poză, deliberat** — vezi `public/img/CREDITS.md`.

**Avatare** — monograme, nu fotografii. Patru tonuri = suprafețe de teren (clay/grass/hard/
carpet), alese din hash-ul numelui. `initials()` cu 11 teste, inclusiv pentru **particulele
olandeze**: „Sanne de Vries" → SV, nu SD; „Nour El Amrani" → NA. Aplicat în lista de jucători
(carduri + tabel), detaliu jucător, membri de grup.

**Interfață de student** — [[CoachOS Interfata de Student]].

## Ce am reparat pe drum

| Problemă | Detaliu |
|---|---|
| `app/layout.tsx` era încă default create-next-app | titlul paginii era literal **„Create Next App"**; încărca Geist Sans + Geist Mono pe care nu le folosea nicăieri |
| `public/` avea 5 SVG-uri default | next.svg, vercel.svg, window.svg, file.svg, globe.svg — șterse |
| 22 de pagini hardcodau „· CoachOS" în titlu | mutat pe `template` în layout |
| `CLAUDE.md` declara un stack fals | **shadcn/ui și React Hook Form nu există** — grep peste tot repo-ul: zero apariții de `react-hook-form`, `@radix-ui`, `class-variance-authority`, `cn(`. 7 dependențe de producție, atât. |
| `DESIGN_SYSTEM.md` §5 lista componente inexistente | rescris cu ce e efectiv acolo |
| Galeria `/preview` diverge de aplicație | își duplică markup-ul de tabel în loc să folosească ecranul real — de-aia avatarele n-au apărut la prima captură |

## Două capcane prinse la timp

**`package-lock.json` pierdea 178 de linii** după `npm install` pe Windows — npm scoate
dependențele opționale de macOS. Comis, i-ar fi stricat lui Filip instalarea. Revertit, și
notat în `CLAUDE.md` § Traps.

**Prettier semnala 63 de fișiere**, inclusiv neatinse. Nu e formatare — e `core.autocrlf=true`
care face checkout cu CRLF contra `endOfLine: lf`. **N-am rulat `prettier --write`.** Un
`.gitattributes` cu `* text=auto eol=lf` ar închide subiectul, dar renormalizează tot repo-ul
deci merită commit separat.

## Verificat

typecheck ✓ · lint ✓ · build ✓ · **158/158 teste** (147 ale lor + 11 noi) ·
fonturi confirmate încărcate în browser ✓ · capturi la 3 viewport-uri, light + dark ✓

38 fișiere modificate, 818 inserții. Zero migrații, zero politici RLS atinse, zero schimbări
de schemă.

## Ce n-am făcut, deliberat

- **Push.** Eduard a cerut local.
- **Rută live pentru student.** Vezi [[CoachOS Interfata de Student]].
- **Avatare în fluxul de documentare** — `ParticipantRow` duce `name` ca string; ar cere
  schimbat tipul și `document-form.tsx`. Ieftin, dar e cel mai dens ecran din app și merită
  făcut cu atenție, nu la 3 dimineața.
- **Search la adăugarea jucătorilor în grup** (item din lista lui Eduard) — e încă un
  `<select>` cu toți jucătorii, ceea ce nu scalează. E feature, nu design; următorul pas firesc.

## Legături
[[CoachOS MOC]] · [[CoachOS Platform]] · [[CoachOS Roadmap]] ·
[[CoachOS - Audit Cod (12 aug 2026)]]
