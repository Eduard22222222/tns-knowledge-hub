---
name: project-coachos-platform
description: "CoachOS — tennis coaching SaaS + AI video analytics, partner Filip, NL academy market; vault at Documents/CoachOS Vault/"
metadata: 
  node_type: memory
  type: project
  originSessionId: 8831f59b-5476-4f49-8200-3aca3478e474
  modified: 2026-08-15T11:06:20.123Z
---

CoachOS = platformă de coaching pentru tenis (MVP existent, în dezvoltare din 2026-08-12).
Partener: **Filip** — el deține repo-ul GitHub și proiectul Supabase. Piață țintă: academii
de tenis din **Olanda**.

Vault dedicat: `C:\Users\adumi\OneDrive\Documents\CoachOS Vault\` → entry point `CoachOS MOC.md`.
Nota-pointer în vault-ul principal: `Projects/CoachOS Platform.md`.

**Acces:** repo = `github.com/Starbuster135/coachos` (PRIVAT; Starbuster135 = Filip). Contul
GitHub **thenichesociety** e collaborator cu **admin** → accesibil doar prin **Chrome**
(`mcp__claude-in-chrome__*`), nu prin `gh` CLI (logat pe `Eduard22222222`, primește 404).
Supabase live: `CoachOS` / **akztitfceyvodawxpwpx** / eu-central-1 — NU e pe niciunul din
conturile Supabase cunoscute; PAT-ul TNS din `keys/supabase.md` e **401, expirat**.
Pentru audit complet trebuie `Eduard22222222` adăugat ca collaborator (clone + KotaDB + rulat).

**Clone cu push access — REZOLVAT 2026-08-12.** Repo clonat la `Desktop\claude\coachos\`,
remote `https://thenichesociety@github.com/Starbuster135/coachos.git`, `git push --dry-run` OK.
Trucul: **pune userul în URL** (`https://thenichesociety@github.com/...`) — altfel GCM folosește
`Eduard22222222` din cache și dă 403. Token-ul stă în Windows Credential Manager, nu în repo.
Workflow agreat cu Eduard: **dăm push direct și îl notificăm pe Filip la features noi.**

**ADR-008 — corecție importantă:** documentarea NU se face pe teren. Discovery cu antrenorul
real: seara, acasă, pe laptop, câteva sesiuni odată. Deci **desktop-first**, fără offline,
fără local-first. Nu presupune „antrenor cu racheta în mână" — e greșit și e în ADR.

**Workflow: push direct pe `main` și îl notificăm pe Filip.** Primul push TNS = 2026-08-15,
`33057c5..36ecc95`, 5 commit-uri tematice. Filip împinge activ pe main — **`git pull` înainte
de orice sesiune de lucru**.

**Conturi de test create pe proiect (2026-08-15):** `edumitriu04@gmail.com` (are date seed:
8 jucători, 8 sesiuni, 6 drill-uri, 4 obiective) și `office@thenichesociety.ro` (gol).
Datele lui Filip (3 jucători, 14 sesiuni) neatinse — toate inserările pe `owner_id`-ul lui Eduard.
`SUPABASE_SERVICE_ROLE_KEY` e în `coachos/.env.local` (gitignored) — scoate-o când nu mai
trebuie, ocolește RLS pe baza cu jucătorii reali.

**Design (rev. 2026-08-15, sprint de noapte):** direcția e **Apple-like** — raze mari, umbre
în două straturi, `.glass`, easing spring — peste ancora „riglă de teren". Fonturi Archivo +
Instrument Sans prin `next/font`. Avatarele sunt **monograme, NICIODATĂ fotografii** (minori);
4 tonuri = suprafețe de teren. Detalii: vault `CoachOS Design Revision 2026-08-15`.

**Capcane de mediu (Windows vs Mac-ul lui Filip):** `npm install` pe Windows scoate ~178 linii
de deps opționale macOS din `package-lock.json` — **verifică `git diff package-lock.json` și
revert**. Prettier raportează TOT repo-ul ca neformatat din cauza `core.autocrlf=true` —
**NU rula `prettier --write`**.

**Stack:** Next.js 16.2.12 (App Router — `middleware.ts` e redenumit **`proxy.ts`**; `cookies()`,
`headers()`, `params`, `searchParams` sunt **async**), React 19.2, TS strict, Tailwind 4,
shadcn/ui, Supabase EU-Frankfurt, Zod, Vitest, Playwright, Vercel.

**Codul e bun, nu vibecodat** (147 teste unit, 121 Playwright pe 3 viewport-uri, teste RLS
contra bazei reale, ADR-uri, migrații forward-only, log de capcane în CLAUDE.md).
**Lista Day 1/2/3 a lui Eduard e ~85% livrată** — e dinainte de 7 aug 2026. Nu planifica pe ea.

**Cele două riscuri reale (de produs, nu tehnice):**
1. `CLAUDE.md`: *„Single user. Single coach, no multi-tenancy"* — academia NL cere multi-coach =
   re-fundație, nu feature.
2. Constituția de privacy (ADR-011 fără date de aparținători, fără suprafață vizibilă
   jucătorului, fără date medicale, transcriere cloud respinsă implicit) **exclude exact ce cere
   video analytics**. Reversarea e decizie de Fază 0 cu Filip, nu task de inginerie.

**Diferențiatorul produsului:** CoachOS are planul de antrenament (ce drill, cu ce intenție),
deci poate contextualiza statisticile video la drill — SwingVision/Wingfield/PlaySight
analizează doar match play, deși amatorii fac drill-uri ~80% din timp.

**Capcană de evitat în video analytics:** "winners / unforced errors" din ideea inițială sunt
concepte de meci, nu de drill — nu se pot livra în Faza A fără a produce numere fără sens.
Faza A măsoară: poziție de aterizare, adâncime, in/out, lungime de rally, consistență vs ținta drill-ului.

Vezi [[reference-obsidian-vault]], [[reference-keys-folder]], [[reference-skills-library]].
