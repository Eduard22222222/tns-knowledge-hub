---
tags: [reference, claude-code, ai, workflows]
created: 2026-07-02
updated: 2026-07-02
status: active
---

# Claude Dynamic Workflows

Un **dynamic workflow** e un script JavaScript pe care Claude îl scrie pentru task-ul tău și un runtime îl execută în fundal, orchestrând zeci–sute de subagenți, în timp ce sesiunea ta rămâne liberă. Diferența față de subagenți/skills normali: **planul stă în cod** (bucla, ramificațiile, rezultatele intermediare), nu în context — așa că fereastra lui Claude primește doar răspunsul final. Rezolvă două probleme reale: *agentic laziness* (se oprește la jumătate și zice „gata") și *self-preferential bias* (își preferă propriul rezultat când e pus să-l verifice).

Sursă: feature-ul oficial Claude Code (vezi clipul „Master All 6 Claude Code Dynamic Workflows"). Se activează cu keyword-ul `ultracode` în prompt, sau permanent cu `/effort ultracode`.

## Cele 6 pattern-uri (folosite de inginerii Anthropic)

1. **Classify-and-Act** — muncă eterogenă: clasifică fiecare item după tip, apoi rutează la handler-ul potrivit (effort/model ieftin pentru simplu, puternic pentru complex).
2. **Fan-out-and-Synthesize** — „prea multe deodată": un agent per item în paralel (barieră), apoi un sintetizator unic le unește și de-duplică.
3. **Adversarial Verification** — omoară bias-ul: verificatori cu context PROASPĂT, puși să *refuze* claim-ul, nu să-l confirme; păstrezi doar ce supraviețuiește votului.
4. **Generate-and-Filter** — spațiu larg de soluții: generezi N candidați din unghiuri diferite, îi scorezi pe o rubrică, ții cel mai bun.
5. **Tournament** — când „care e mai bun" e mai ușor decât „dă nota 0-10": bracket cu comparații pairwise până rămâne un câștigător.
6. **Loop Until Done** — descoperire de mărime necunoscută (bug-uri, edge case-uri): rulezi runde de finderi până când K runde la rând nu mai găsesc nimic nou. Condiția de oprire stă în cod, nu în prompt.

Pentru task-uri reale **compui 2-4 pattern-uri** (ex: fan-out → adversarial-verify), nu unul singur.

## Agenți + controlul de izolare (worktree)

Un workflow nu face el munca — **orchestrează subagenți**:
- `agent(prompt, opts)` — un subagent; cu `schema` întoarce JSON validat; `opts.effort`/`opts.model` reglează costul per etapă.
- `parallel([thunks])` — concurent, dar **barieră** (așteaptă toți).
- `pipeline(items, stage1, stage2…)` — fiecare item curge prin etape **fără barieră** între ele.

**Izolarea (`isolation: 'worktree'`)** — partea care încurcă lumea: implicit toți agenții lucrează pe ACEEAȘI copie a repo-ului. Ok când doar citesc sau scrie unul singur. Dar dacă **mulți agenți EDITEAZĂ fișiere în același timp** (ex: migrare pe 200 de fișiere, un agent per fișier), s-ar călca pe picioare. Soluția: `isolation: 'worktree'` dă fiecărui agent **propriul git worktree** — o copie privată izolată a repo-ului; editează liber acolo, iar la final se colectează schimbarea (worktree-ul se șterge automat dacă n-a modificat nimic). E **scump** (~200-500ms + disk per agent), deci se folosește DOAR când există coliziune reală de scriere. Regula: *read-only sau un singur writer → fără izolare; mulți writeri simultan → worktree.*

## Librăria mea de workflows (rulabile)

Le-am salvat ca 6 comenzi în `~/.claude/workflows/` → devin `/nume` în orice proiect, parametrizate via `args`:
`/classify-and-act` · `/fan-out-synthesize` · `/adversarial-verify` · `/generate-and-filter` · `/tournament` · `/loop-until-done`. Detalii + exemplul de izolare în `~/.claude/workflows/README.md`.

Parte din arsenalul din [[Claude Skills Index]].
