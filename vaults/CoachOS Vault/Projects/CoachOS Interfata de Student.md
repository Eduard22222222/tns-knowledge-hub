---
tags: [project, coachos, privacy, gdpr, decision-needed]
created: 2026-08-15
updated: 2026-08-15
status: idea
---

# CoachOS — Interfața de Student

Cerută de Eduard pe 15 aug. **Construită ca prototip, nu ca rută live** — și motivul nu e
prudență, e că trei decizii care nu-mi aparțin trebuie luate întâi.

Cod: `components/student-view.tsx`, randat exclusiv de `/preview` cu date inventate.
Documentul complet de decizie: `docs/STUDENT_VIEW.md` în repo.

## De ce nu e live

`PRODUCT_SPEC.md` §8 exclude explicit portalurile pentru părinți și paginile publice de
jucător. `PRIVACY_AND_SECURITY.md` spune că **nu există suprafață vizibilă jucătorului**.
Ambele aprobate pe 3 august, de Filip.

Deci prima decizie nu e „cum construim", ci **„inversăm §8?"** — și dacă da, se inversează
în scris, în spec, cu dată și motiv. Nu tacit, printr-o rută care apare.

## Cine se autentifică — cea mai grea întrebare

Majoritatea jucătorilor sunt minori. Olanda are vârsta de consimțământ digital la **16 ani**
(UAVG art. 5), maximul permis de GDPR. Sub 16, consimțământul e al părintelui, per copil,
per scop.

| Variantă | Ce înseamnă | Cost |
|---|---|---|
| **Link de partajare** | antrenorul generează un link per jucător; cine îl are vede acel jucător. Fără cont, fără parolă, fără cont pentru un copil. | cel mai ieftin — dar linkul **e** credențialul: expirare, revocare, fără nume în URL |
| **Cont de părinte** | părintele se loghează, vede copiii lui | mediu — cere tabel `guardians`, exact ce **ADR-011 a refuzat deliberat** |
| **Cont de jucător** | jucătorul se loghează | cel mai scump — conturi pentru copii + consimțământ per cont |

**Recomandarea mea: linkul**, iar argumentul e chiar al lor din ADR-011:
> *„a adăuga mai târziu un record minimal de aparținător e o migrație mică. A ne-colecta
> date personale odată strânse, nu."*

Un link nu stochează nimic nou despre nimeni.

## Ce trece granița și ce nu

Prototipul ia deja poziție, și e cea conservatoare.

**Arată:** următoarea sesiune (dată, oră, club, teren) · planul sesiunii · `next_focus` ·
obiectivele și statusul lor · propriul istoric de prezență · eticheta de nivel.

**Nu arată, deliberat:**

- **`session_participants.note`** — notița proprie a antrenorului, în stenografia lui, despre
  un copil. `next_focus` e câmpul scris **către** jucător, și e singurul care trece.
  Dacă antrenorul știe că notița poate fi citită diseară de un părinte, notița încetează să
  fie sinceră — iar notița sinceră **e** produsul.
- **Pe altcineva.** Fără listă de grup, fără alt participant, fără comparație. Un părinte care
  vede rating-ul altui copil e o scurgere de date cu pași în plus.
- **Rating-ul KNLTB ca număr.** Eticheta de nivel încurajează; cifra pornește conversații de
  clasament între părinți în parcare. Antrenorul poate spune numărul cu voce tare — aplicația
  doar nu-l publică.

## Riscul de produs, nu cel tehnic

O suprafață vizibilă jucătorului schimbă **cum scrie antrenorul**. Asta lovește exact în ce
`CLAUDE.md` spune că produsul există să protejeze: *„succesul se măsoară prin dacă sesiunile
chiar ajung documentate — frecarea e inamicul."*

Dacă publicarea e automată, fiecare notiță devine o notiță pe care părintele o poate citi
diseară. Dacă e explicită — antrenorul apasă **Share this session** — notița privată rămâne
privată.

**Recomandare: publicare explicită, per sesiune, oprită implicit.** Aceeași poziție pe care
`BACKLOG.md` §5 a luat-o deja pentru feedback-ul către client.

## Dacă merge mai departe
Ordinea din `docs/STUDENT_VIEW.md`: reversare §8 în scris → `player_share_links` (token
hash-uit, expirare, revocare) → `session_participants.shared_at` → rută `/s/[token]` cu
`noindex` și **rate limiting din prima zi** (spre deosebire de `join_club_with_code`, asta
păzește un copil cu nume) → controale de share/revoke → DPIA + notă de informare în olandeză →
extins `sharing_isolation.sql`.

Pașii 1 și 6 sunt cei lungi, și niciunul nu e cod.

## Legături
[[CoachOS Design Revision 2026-08-15]] · [[GDPR - Video si Minori in NL]] ·
[[CoachOS Roadmap]] · [[CoachOS MOC]]
