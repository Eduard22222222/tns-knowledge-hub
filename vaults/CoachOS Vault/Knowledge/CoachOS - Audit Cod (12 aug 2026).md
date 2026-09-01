---
tags: [knowledge, coachos, audit, code-review]
created: 2026-08-12
updated: 2026-08-12
status: active
---

# CoachOS — Audit cod (12 aug 2026)

Analiză pe `Starbuster135/coachos` @ `main`. Snapshot descărcat prin sesiunea Chrome
(thenichesociety) și extras la `Desktop\claude\coachos\`. **105 fișiere TS/TSX, ~496 KB.**

**Limitare declarată:** snapshot ZIP, deci **fără istoric git** și fără `node_modules` — nu am
rulat `npm install`, `typecheck`, testele sau aplicația. Verificările de mai jos sunt statice
(citire + grep peste tot codul). Pentru validare completă trebuie clone real + rulat suita.

## Stack
Next.js **16.2.12** (App Router) · React 19.2 · TypeScript strict · Tailwind 4 · shadcn/ui ·
Supabase (Postgres/Auth/Storage, **EU-Frankfurt**) · Zod · React Hook Form · Vitest ·
Playwright · Vercel · Node 24.19 LTS.
Supabase live: `CoachOS` / `akztitfceyvodawxpwpx` / eu-central-1.

---

## Puncte tari

**1. Nu e un MVP vibecodat. E inginerie disciplinată.**
Verde la ultima rulare: typecheck · lint · build · **147 teste unit** · `db:validate` 118 ·
**121 Playwright pe trei viewport-uri** · `rls_isolation.sql` **și** `sharing_isolation.sql`
rulate contra bazei reale, nu doar PGlite. Puține echipe plătite fac asta.

**2. Modelul de date e gândit, nu generat.**
`owner_id` + `created_at` + `updated_at` pe fiecare tabel · RLS pe **fiecare** tabel, generat
în buclă ca o omisiune să sară în ochi · fără enum-uri Postgres (text + CHECK, ca vocabularul
să poată fi schimbat prin migrație) · `owner_id` direct pe tabelele de join, ca politicile să
rămână simple · soft delete doar unde are sens · index parțial unic pe apartenența activă la
grup (`where left_on is null`) · constraint `goals_single_target` care forțează exact o țintă.

**3. RLS scris de cineva care știe ce face.**
Politicile folosesc `(select auth.uid())`, nu `auth.uid()` — forma care evită re-evaluarea per
rând. `handle_new_user()` e `security definer` **cu `set search_path = ''`**, adică hardening-ul
corect. Ipoteza mea inițială (bug-urile de delete = politici RLS lipsă) e **greșită** — RLS-ul
acoperă complet SELECT/INSERT/UPDATE/DELETE.

**4. Log-ul de capcane din `CLAUDE.md` e cel mai valoros artefact din repo.**
Nu documentație generică, ci lucruri care i-au costat timp și pe care le-au scris ca să nu se
repete. Câteva sunt greșeli pe care le fac echipe senioare:
- `toHaveCount(0)` în Playwright trece instant pe o listă nerandată — „a produs false passes de
  două ori aici"
- „o acțiune care există nu înseamnă că e conectată" — patru acțiuni de arhivare au ajuns
  inaccesibile, acum există regression guard
- „un shell randat nu e nici el un feature" — cardul Timeline afișa hardcodat „No sessions yet",
  fără query în spate; **arăta terminat în orice screenshot**
- `toBeVisible()` nu detectează ocluzia
- ambele layout-uri responsive sunt simultan în DOM, deci `.first()` prinde markup-ul ascuns
- PostgREST `onConflict` nu poate ținti un index pe expresie — a pierdut tăcut fiecare tag nou

**5. Onestitate în documentație.**
`BACKLOG.md` scrie „cauză neidentificată" în loc să inventeze una, și „testele mai slabe care
trec sunt oneste despre ce acoperă; golul ăsta e declarat, nu acoperit cu o aserțiune care nu
demonstrează nimic". Asta e o cultură cu care se poate lucra.

**6. Privacy by design, nu ca notă de subsol.**
ADR-011 exclude datele de aparținători · fără suprafață vizibilă jucătorului · fără date
medicale · fără date reale în seed-uri/teste/screenshot-uri · transcriere cloud **respinsă
implicit** pentru că „audio-ul unui antrenor care descrie un minor cu numele e mai sensibil
decât textul rezultat". Storage EU-Frankfurt. Pentru piața olandeză, asta e deja jumătate din
argumentul de vânzare.

**7. Domeniul e modelat corect pentru NL.**
`knltb_rating` 1–9 cu scala **inversată** (9 = începător), `knltb_level_tier()` derivă nivelul
în loc să-l stocheze (ADR-004), timezone default `Europe/Amsterdam`, vocabular fixat în
`DOMAIN_GLOSSARY.md` (session ≠ lesson, club = locație, organisation = angajator).

**8. Manipularea secretelor e corectă — verificat, nu presupus.**
`lib/env.ts` validează env-ul cu Zod și separă `publicEnv` de `serverEnv()`, cu observația
corectă că „`process.env.NEXT_PUBLIC_*` e inline-uit la build **doar dacă e scris literal**".
Cheia service_role e izolată într-un singur fișier (`lib/supabase/admin.ts`) și nu apare nicăieri
în cod client. `.env.example` are 9 variabile, **toate goale** — zero secrete comise.
`.gitignore` prinde `.env*` cu excepție doar pentru `.env.example`.

**9. Separarea logicii e reală, nu declarativă.**
`lib/` conține 14 module de domeniu, iar **opt au teste co-locate**: `activity`, `calendar`,
`drills`, `goals`, `player-history`, `reports`, `sessions`, `voice`. E2E acoperă exact căile de
scriere care contează: `crud`, `delete`, `plan`, `player-history`, `community`, `voice`.
`docs/` are 14 documente + `decisions/`.

**10. Codurile de club nu sunt un oracle.**
`community/actions.ts` returnează **același mesaj indiferent de cauza eșecului**, cu comentariul
„un răspuns distinct «nu există clubul» ar transforma formularul într-un oracle de coduri".
Funcțiile `SECURITY DEFINER` au `revoke execute … from anon, public` + `grant … to authenticated`,
și `set search_path = ''`. Corect pe toate cele trei.

---

## Ce am verificat și **nu** e o problemă

Merită notat, ca să nu se re-investigheze:

- **Update/delete fără `.eq('owner_id')`.** `drills/actions.ts` și `templates/actions.ts` fac
  `.update()` / `.delete()` doar pe `.eq('id', id)`. Arată suspect, **dar e corect**: migrația de
  sharing (`20260811000000`) adaugă exclusiv politici **`for select`**
  (`drills_shared_select`, `tags_shared_select` etc.). Scrierile rămân acoperite de politicile
  `_owner_all` originale. `sharing_isolation.sql` chiar asertează că un coleg de club nu poate
  face update sau delete pe un drill partajat.
- **Ipoteza mea inițială**, că bug-urile de delete ar veni din politici RLS lipsă pe DELETE:
  **greșită**. RLS acoperă complet SELECT/INSERT/UPDATE/DELETE de la prima migrație.

---

## Puncte slabe

**1. `join_club_with_code` nu are rate limiting.** 🔴
Singurul lucru cu miros de securitate reală. Ei înșiși scriu: „accepted while codes are 1.1e12
and guard only shared drills; **revisit before anything paid or exclusive sits behind a club**."
Noi mergem exact acolo. De reparat înainte de orice discuție comercială.

**2. Arhitectura e single-user, prin proiectare explicită.** 🔴
„Single coach, no multi-tenancy." Club sharing (11 aug) e „singurul loc unde datele traversează
`owner_id`" — și e limitat la drill-uri. Pentru o academie NL cu mulți antrenori, asta e o
**re-fundație, nu un feature**. Cel mai mare risc de estimare din tot proiectul.

**3. Tooling-ul de bază e rupt.** 🟡
`SUPABASE_ACCESS_TOKEN` nesetat → `db:push` nu funcționează, migrațiile se aplică prin MCP, iar
`lib/database.types.ts` e patch-uit **de mână**. Tipuri scrise manual peste o schemă care se
mișcă = drift garantat.

**4. Un test care nu poate fi scris.** 🟡
Archive-then-view-archived: verificat manual, dar fiecare încercare de test Playwright lasă
rândul nearhivat în DB, „across several rewrites. Cause not identified." Când un test refuză
să se scrie, de obicei ascunde ceva real — race condition sau o revalidare care rescrie starea.

**5. Documentația a rămas în urma codului propriu.** 🟡
Trei derive, toate în aceeași direcție:
- `CLAUDE.md` declară stack-ul ca incluzând **shadcn/ui** și **React Hook Form**. **Niciunul nu
  există.** Grep peste tot repo-ul: **zero** apariții de `react-hook-form`, `@radix-ui`,
  `class-variance-authority` sau `cn(`. `package.json` are 7 dependențe de producție și niciuna
  nu e vreuna dintre ele. UI-ul e scris de mână în `components/ui.tsx` (167 linii). Un dezvoltator
  nou — sau un agent — care citește `CLAUDE.md` va căuta pattern-uri shadcn care nu sunt acolo.
- `BACKLOG.md` spune „not started" pentru voice notes, daily activity tracker și goals UI — toate
  trei livrate între 10 și 11 august.
- „the repository has no remote; 22 commits exist only on this machine" — repo-ul e pe GitHub cu
  36 de commit-uri.

Mic în sine, dar **exact deriva care a produs lista greșită de task-uri de la care am pornit.**

**6. O inconsecvență reală pe citirea tag-urilor.** 🟡
`app/(app)/drills/[id]/edit/page.tsx:52` citește `tags` fără `.eq('owner_id', user.id)`, în timp
ce fișierul-frate `app/(app)/drills/[id]/page.tsx:56` **îl are**. De când există
`tags_shared_select`, „lizibil" nu mai înseamnă „al meu" — fix regula pe care ei o scriu în
`CLAUDE.md`. Practic nu e exploatabil (tag-urile vin din drill-ul propriu al antrenorului), dar e
exact clasa de bug care le-a spart șase query-uri când a aterizat sharing-ul. De aliniat.

**7. Leaked-password protection dezactivat.** 🟡
Lăsat intenționat („decizia proprietarului"). Corect ca proces — dar rămâne o decizie de luat.

**8. Dictarea vocală nu are dovadă automată că merge cu microfon real.** 🟢
CI-ul stubuiește motorul de speech. Notat de ei, cu instrucțiune de sanity-check manual.

**9. Dictarea e ON by default, prin decizie asumată.** 🟢 (de reconfirmat pentru academie)
`PRIVACY_AND_SECURITY.md` §84: pornită implicit (`browser` = Web Speech API), decisă de
product owner pe 2026-08-10, **peste** o propunere anterioară de opt-in pe motive de privacy.
Raționament: „o funcție ascunsă în spatele unui flag e o funcție pe care n-o pornește nimeni".
Rezonabil pentru un singur antrenor cu propriii jucători. Pentru o academie cu minori, providerul
`browser` trimite audio la motorul de speech al browserului — de reconfirmat explicit, sau
comutat pe `local_whisper`. Există și `off`, verificat empiric că nu randează niciun microfon.

---

## Verdict

Codul e **peste așteptări** și peste ce am văzut în majoritatea proiectelor livrate de agenții.
Filip lucrează cu Claude Code, dar cu proces: ADR-uri, migrații forward-only, teste RLS contra
bazei reale, log de capcane, „definition of done" scrisă.

Riscul nu e calitatea. **Riscul e că produsul e construit deliberat pentru un singur antrenor,
cu o constituție de privacy care exclude fix lucrurile de care are nevoie direcția comercială
aleasă** (academie, multi-coach, interfață pentru jucător, video cu minori). Alea sunt decizii
de produs de luat cu Filip, nu datorie tehnică de plătit.

## Legături
[[CoachOS Platform]] · [[CoachOS Roadmap]] · [[CoachOS Video Analytics]] ·
[[GDPR - Video si Minori in NL]] · [[CoachOS MOC]]
