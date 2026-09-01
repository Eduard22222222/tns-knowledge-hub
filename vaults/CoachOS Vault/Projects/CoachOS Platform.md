---
tags: [project, active, coachos, saas, tennis]
created: 2026-08-12
updated: 2026-08-12
status: active
---

# CoachOS Platform

Platformă de coaching pentru tenis. MVP construit și funcțional, intrăm în faza de dezvoltare
serioasă. Partener: **Filip** — el deține repo-ul GitHub și proiectul Supabase.

## Ce face acum (din descrierea lui Eduard, neverificat în cod)
- Jucători + grupuri
- Bibliotecă de drill-uri
- Planificare de lecții / sesiuni
- Notițe per sesiune ("planning ahead" = ce lucrezi data viitoare)
- Feedback către jucători

## Cine e utilizatorul

⚠️ **Corectat 2026-08-12.** Presupusesem „antrenorul pe teren, cu racheta în mână" și
derivasem de acolo mobile-first + voice notes ca priorități. **ADR-008 spune exact invers**, și
e bazat pe discovery cu antrenorul real:

> „Discovery a stabilit că documentarea se face seara, acasă, pe laptop, câteva sesiuni odată —
> nu pe teren, pe telefon. Brief-ul inițial presupunea contrariul."

Consecințe pe care ei le-au tras deliberat: fără suport offline, fără complexitate local-first,
fără rezolvare de conflicte. Tableta și mobilul rămân complet funcționale, dar optimizate pentru
**consultare și confirmare**, nu pentru introducere de date.

Nu invalida asta fără discovery nou. Dacă ținta se mută de la un antrenor la o academie, e
posibil să se schimbe — dar atunci e o decizie nouă, luată explicit, nu o presupunere.

Utilizator secundar: jucătorul/părintele. **Momentan nu există** — `PRODUCT_SPEC.md` §8 exclude
explicit portalurile pentru părinți și paginile publice de jucător. Vezi [[CoachOS Roadmap]] P1 #7.

## Constrângeri blocate prin ADR (nu le încălca tacit)

| ADR | Decizie | Cost de reversare |
|---|---|---|
| 008 | Documentare desktop-first | mic — dar cere discovery nou |
| 010 | Doar tenis, fără câmp `sport` (deși antrenorul face și padel) | o migrație trivială |
| 011 | **Zero date de aparținători**, chiar pentru minori | *„a adăuga mai târziu un record minimal e o migrație mică. A ne-colecta date personale odată strânse, nu."* |
| 006 | Fără import (CSV/ICS/Obsidian) — datele reale sunt aproape goale: 92 jucători, doar 12 cu rating | — |
| 002 | Serii de sesiuni materializate, fără motor de recurență | editările pe serie trebuie fan-out |
| 007 | `owner_id` denormalizat pe tabelele de join | denormalizare deliberată pe calea de securitate |

## Acces

**Repo:** `github.com/Starbuster135/coachos` (privat). Starbuster135 = Filip.
Contul GitHub **thenichesociety** e collaborator **cu drepturi de admin** (tab-ul Settings e
vizibil) — accesibil prin Chrome, sesiune logată.

**Supabase live:** `CoachOS` / `akztitfceyvodawxpwpx` / **eu-central-1**.

| Cale | Stare |
|---|---|
| Chrome (thenichesociety) | ✅ Funcționează — citire prin browser |
| `gh` CLI (`Eduard22222222`) | ❌ 404 — contul nu e collaborator |
| Supabase MCP (cont personal) | ❌ Proiectul nu e pe contul personal |
| Supabase PAT TNS din `keys/` | ❌ 401, expirat — de rotit oricum |

**Pentru muncă serioasă e nevoie de clone local**, nu browsing: audit complet pe `app/`,
`lib/`, `components/`, rulat `npm run dev`, indexare KotaDB, teste. Cea mai simplă cale:
thenichesociety are admin pe repo → adaugă `Eduard22222222` ca collaborator
(Settings → Collaborators → Add people). Plus un `SUPABASE_ACCESS_TOKEN` — oricum lipsește și
în proiect (`db:push` nu funcționează, vezi [[CoachOS - Audit Cod (12 aug 2026)]]).

## Starea reală a codului la 2026-08-12

**~85% din lista Day 1/2/3 a lui Eduard e deja livrată.** Lista e dinainte de 7 august.
Detalii: [[CoachOS Roadmap]]. Calitate: [[CoachOS - Audit Cod (12 aug 2026)]] — codul e peste
așteptări (147 teste unit, 121 Playwright pe 3 viewport-uri, teste RLS contra bazei reale,
ADR-uri, log de capcane).

**Constrângerea centrală, din `CLAUDE.md`:** *„Personal coaching operating system for one
tennis coach in the Netherlands. Single user."* Direcția aleasă (academie NL) cere multi-coach —
asta e o **re-fundație**, nu un feature.

## Direcția strategică

Două lucruri diferențiază CoachOS de restul pieței, și amândouă vin din același loc:

**1. Contextul de drill.** SwingVision, Wingfield, PlaySight analizează *meciuri*. CoachOS
are deja planul de antrenament — ce drill s-a lucrat, cu ce intenție, la ce nivel. Nimeni
altcineva nu are asta. Diferența practică: în loc de "24 forehands, viteză medie 68 km/h",
poți spune "din 8 backhand-uri crosscourt cerute, 3 au aterizat dincolo de linia de serviciu
+2m — ținta era 6". Statistica devine feedback, nu raport.

**2. Amatorii fac drill-uri, nu meciuri.** ~80% din timpul de teren al unui amator e practică.
Toată piața se uită la match play. Golul e real. Vezi [[CoachOS - Peisaj Competitiv]].

Feature-ul de video ([[CoachOS Video Analytics]]) e expresia tehnică a acestor două puncte —
dar e **un produs separat cu economie separată**, nu încă un tab în app.

## Legături
- [[CoachOS MOC]] · [[CoachOS Roadmap]] · [[CoachOS Video Analytics]]
- [[CoachOS Skill Stack]] — ce încarc când lucrez la ce
- [[GDPR - Video si Minori in NL]] — decide unde rulează inferența
