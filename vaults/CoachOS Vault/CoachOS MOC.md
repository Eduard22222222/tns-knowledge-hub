---
tags: [moc, project, coachos]
created: 2026-08-12
updated: 2026-08-12
status: active
---

# CoachOS MOC

Punctul de intrare în proiectul CoachOS. Platformă de coaching pentru tenis — MVP existent,
intrăm în faza de dezvoltare. Partener: **Filip** (deține repo-ul + Supabase).

## Ce e CoachOS
App pentru antrenori de tenis: gestionezi jucători, grupuri, drill-uri, planifici lecții,
notezi ce s-a lucrat, plănuiești sesiunea următoare. MVP funcțional, cu buguri de CRUD.

## Note

### Proiect
- [[CoachOS Platform]] — scope, stakeholderi, stare curentă, acces
- [[CoachOS Roadmap]] — **singura sursă de adevăr pentru task-uri**, triaj P0→P3
- [[CoachOS Design Revision 2026-08-15]] — sprintul de design (Apple-like, imagini, avatare)
- [[CoachOS Interfata de Student]] — prototip + deciziile de privacy necesare
- [[CoachOS Video Analytics]] — feature-ul nou, spec + faze de livrare

### Research
- [[Tennis Vision - Arhitectura de Cost]] — cât costă real un pipeline de vision, per oră
- [[De ce nu un VLM pe video]] — de ce Gemini/GPT pe video direct nu funcționează aici
- [[CoachOS - Peisaj Competitiv]] — SwingVision, Wingfield, PlaySight, unde e golul

### Knowledge
- [[CoachOS - Audit Cod (12 aug 2026)]] — **strong points / weak points**, verdict pe cod
- [[CoachOS Skill Stack]] — ce skill-uri Claude se încarcă, pe fază
- [[GDPR - Video si Minori in NL]] — constrângerea care decide arhitectura, nu o notă de subsol

### Inbox
- [[2026-08-12 - Context dump Eduard]] — lista brută de feature-uri Day 1/2/3 + ideea de video

## Starea proiectului la 2026-08-12

Repo găsit și citit: `github.com/Starbuster135/coachos` (privat, Filip = Starbuster135).
Supabase live: `akztitfceyvodawxpwpx`, eu-central-1.

**Trei lucruri de reținut înainte de orice planificare:**
1. **Lista Day 1/2/3 e ~85% livrată** — e dinainte de 7 august. Nu planifica pe ea.
2. **Codul e bun**, peste așteptări. Riscul nu e calitatea.
3. **Produsul e single-coach prin proiectare**, cu o constituție de privacy care exclude
   suprafața pentru jucător și datele de aparținători. Direcția comercială aleasă (academie NL
   + video analytics) cere reversarea ambelor. Astea sunt decizii de produs cu Filip, nu
   datorie tehnică.

Pentru audit complet e nevoie de clone local — vezi [[CoachOS Platform]] § Acces.

## Legături
Parte din portofoliul [[The Niche Society]]. Vezi și [[Projects MOC]] în vault-ul principal.
