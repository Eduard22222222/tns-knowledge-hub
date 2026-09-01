---
tags: [project, active, coachos, roadmap]
created: 2026-08-12
updated: 2026-08-12
status: active
---

# CoachOS Roadmap

> ⚠️ **Corecție 2026-08-12.** Prima versiune a acestei note triase lista lui Eduard ca și cum
> bug-urile ar fi deschise. **Nu sunt.** După citirea repo-ului real
> (`Starbuster135/coachos`), ~85% din lista Day 1/2/3 e deja livrată. Lista lui Eduard e
> dinainte de 7 august. Nu planifica pe baza ei.

## Ce e livrat deja (verificat în commit history + CLAUDE.md, 2026-08-12)

| Item din lista lui Eduard | Livrat | Commit |
|---|---|---|
| Delete + edit jucători și drill-uri | ✅ | „Add edit and delete across every entity" — 7 aug |
| Edit drill-uri salvate + tag-uri | ✅ | „Fix silent tag loss on drills; add drill editing" — 7 aug |
| Voice AI recognition | ✅ | „Voice dictation… on by default" + „on every field" — 11 aug |
| Calendar / program per sesiune | ✅ | „Rebuild the week view as a real calendar" — 11 aug |
| Istoric de lecții în pagina jucătorului | ✅ | „Show a player's session history on their page" — **12 aug** |
| Integrare socială (alți antrenori) | ✅ | „Add club sharing and a curated Community section" — 11 aug |
| Daily activity tracker | ✅ | „Add goals UI and daily activity tracker" — 10 aug |
| Planificare short/long term (goals) | ✅ | idem |
| Design palettes / design system | ✅ | „a real design system" — 3 aug + arhivare/filtrare |
| Jucătorii nu se salvează | ✅ | marcat DONE și de Eduard |
| Share (program) | 🟡 parțial | club sharing e pe **drill-uri**, nu pe program |

**Ce a rămas din lista lui:** search la adăugarea jucătorilor în grupuri · onboarding la
instalare · interfață Coach/Student · profil avansat de jucător · casete expandabile ·
redenumire „planning ahead" → „for next time" · feedback către client · drill-uri KNLTB ·
LLM peste sesiuni · video analytics.

---

## P0 — Datorie reală, din documentația lor proprie

Astea nu-s din lista lui Eduard. Sunt din `CLAUDE.md` § Known gaps și `BACKLOG.md`
§ Cross-cutting — echipa le-a notat onest și încă sunt deschise.

| # | Item | De ce contează |
|---|---|---|
| 1 | **`join_club_with_code` nu are rate limiting** | Tocmai a livrat sharing-ul (11 aug). Codurile sunt 1.1e12, dar fără throttling e brute-forceabil. Ei înșiși scriu „revisit before anything paid or exclusive sits behind a club" — iar noi exact acolo mergem. |
| 2 | **Leaked-password protection dezactivat** | Un toggle în Supabase Auth. E lăsat intenționat pentru că e decizia proprietarului — deci e o decizie de luat, nu un task de scris. |
| 3 | **`SUPABASE_ACCESS_TOKEN` nesetat** → `db:push` nu merge | Migrațiile se aplică prin MCP, iar `database.types.ts` e patch-uit de mână. Fragil. Se rezolvă cu un token. |
| 4 | **Archive-then-view-archived neacoperit de Playwright** | Verificat manual, dar toate încercările de test au lăsat rândul nearhivat în DB. Cauză neidentificată. Merită diagnosticat — un test care nu poate fi scris ascunde de obicei o problemă reală. |
| 5 | **Un `db:validate` 93/1 neexplicat** | O singură dată, nereprodus în 5 rulări. De ținut minte, nu de vânat acum. |

---

## P1 — Ce blochează direcția pe care am ales-o

Am ales **academie NL ca design partner** ([[CoachOS - Peisaj Competitiv]]). Codul actual e
construit explicit pentru altceva:

> „Personal coaching operating system for **one** tennis coach in the Netherlands.
> **Single user.**" — `CLAUDE.md`

| # | Item | Notă |
|---|---|---|
| 6 | **Multi-tenancy / multi-coach** | Ăsta e blocantul arhitectural real. Tot modelul e `owner_id = auth.uid()`. Club sharing (11 aug) e prima fisură — și e limitată deliberat la drill-uri. O academie înseamnă mulți antrenori, roluri, jucători partajați. **Nu e un feature, e o re-fundație.** De decis înainte de orice promisiune către un client. |
| 7 | **Interfață Coach / Student** | Depinde de #6 și de reversarea deciziei „no player-facing surface". |
| 8 | **Feedback către client** | `BACKLOG.md` §5 are deja forma sigură proiectată: draft din date existente → textarea editabilă → **copy/download, fără trimitere**. Asta se poate livra fără a atinge scopul de privacy. Trimiterea reală (email/link) e alt proiect. |
| 9 | Search jucători în grupuri, casete expandabile, redenumire, onboarding | Mici, clare, fără blocaje. |

---

## P2 — Valoare nouă

| # | Item | Notă |
|---|---|---|
| 10 | **LLM peste sesiuni** (breakdown + planificare) | Ieftin (~$0.002/sesiune) și rulează peste date deja structurate. Cel mai bun raport valoare/efort rămas. Atenție: datele conțin nume de minori → același principiu ca la transcriere, decide explicit unde merg. |
| 11 | **Drill-uri KNLTB + parteneriat** | `knltb_rating` (9→1, inversat) e deja în schemă, iar `knltb_level_tier()` derivă nivelul. Fundația există. Restul e deal, nu cod. |
| 12 | **Profil avansat de jucător** | `BACKLOG.md` §7 îl descrie ca „player timeline merging sessions, notes, goals and carry-forward" — pagina are deja un placeholder acolo. |

---

## P3 — [[CoachOS Video Analytics]]

**⚠️ Coliziune de principii, nu doar de efort.** Produsul are o constituție de privacy scrisă
explicit, iar video analytics o încalcă în trei puncte:

- **ADR-011: „no guardian data — clubs hold it"**
- `PRIVACY_AND_SECURITY.md`: **„no player-facing surface"**, „no public pages containing player data"
- **„No medical or health data"**
- `BACKLOG.md` §3, despre simpla *transcriere*: „audio of a coach describing a named minor is
  more sensitive than the text it becomes. It must not go to a third-party cloud transcriber
  by default."

**Video cu minori e strict mai sensibil decât audio-ul pe care l-au refuzat deja să-l trimită
în cloud.** Asta nu face feature-ul imposibil — dar înseamnă că nu e un task de inginerie, e o
**decizie de Fază 0**: reversare documentată a ADR-011, DPIA, consimțământ parental per copil
per scop, și aproape sigur inferență on-prem. Vezi [[GDPR - Video si Minori in NL]].

Discută cu Filip **înainte** de a promite ceva unei academii. E cea mai bună veste posibilă
că a scris regulile astea — înseamnă că le respectă, deci nu le va încălca tacit.

---

## Ordinea pe care aș executa-o

```
Acum        → Re-testare pe main curent, cu Filip. Lista lui Eduard e
               dinainte de 7 aug; nu știm ce mai e rupt de fapt.
Săpt. 1     → P0 #1 (rate limiting) + #3 (token) + decizia pe #2.
               #1 e singurul cu miros de securitate reală.
Săpt. 1-2   → Decizia pe multi-tenancy (#6). Blochează tot restul.
Săpt. 2-4   → P1 #8 (feedback safe) + #9 (cele mici).
Săpt. 4-6   → P2 #10 (LLM) — cel mai bun ROI rămas.
Paralel     → KNLTB (#11), deal nu cod.
Faza 0 sep. → Video analytics: decizie de privacy ÎNAINTE de arhitectură.
```

## Legături
[[CoachOS MOC]] · [[CoachOS Platform]] · [[CoachOS Video Analytics]] · [[CoachOS Skill Stack]] ·
[[GDPR - Video si Minori in NL]]
