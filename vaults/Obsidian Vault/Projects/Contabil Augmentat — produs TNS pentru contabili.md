---
tags: [project, idea, contabilitate, ai, tns]
created: 2026-07-28
updated: 2026-07-28
status: idea
---

# Contabil Augmentat — produs TNS pentru contabili

Idee de produs (28.07.2026): împachetăm ce am construit pentru Conta4U și îl vindem altor contabili — MCP-ul de SAGA plus creierul contabil plus fluxurile, cu punere în funcțiune și instruire făcute de TNS. Nu vindem software de contabilitate; vindem **un contabil augmentat**: același SAGA pe care îl folosesc deja, dar cu un asistent care citește instant orice firmă, verifică declarațiile înainte de depunere și prinde greșelile.

## De ce e apărabil: lipsa API-ului e avantajul

SAGA C desktop **nu are API și nu va avea** — compania a confirmat că API-urile rămân exclusiv pe SAGA WEB, planificate pentru a doua jumătate a lui 2026. Dacă ar exista un API, oricine ar reface asta într-o săptămână. Nu există, iar noi avem deja cititoare funcționale pentru ambele formate (DBF vechi + Firebird nou), testate pe date reale, care merg **cu SAGA deschis** — vezi [[SAGA — citirea bazei Firebird cu isql]] și [[MCP saga — suport Firebird și unelte fiscale]].

Două piețe, nu una: contabilii mici rămași pe desktop (care nu vor avea niciodată API) și cei care trec pe SAGA WEB, unde ajungem primii dacă ne mișcăm.

## Cele trei straturi

1. **Cititorul** — partea grea tehnic, invizibilă comercial. Există și funcționează.
2. **Creierul contabil** — monografiile CECCAR, [[Regula — Cercetare Surse Autoritative]], verificările fiscale. **Diferențiatorul real.** Un LLM cu acces la bază dar fără creierul ăsta dă răspunsuri plauzibile și greșite. Dovadă din pilot: am susținut că D406 e anual (fals, e trimestrial) și am tras concluzii despre setarea de TVA citind ecranul SAGA în loc de bază.
3. **Fluxurile** — reconciliere bancară, verificare D100/D300, SAF-T readiness, diagnostic. Astea se traduc în ore economisite, deci astea se vând.

## Poziționare: copilot, nu pilot automat

| Autonom | Rămâne uman |
|---|---|
| Citit, calculat, reconciliat | Deciziile de tratament contabil |
| Verificat declarații înainte de depunere | Semnătura și depunerea |
| Pregătit fișiere de import | Apăsat Import |
| Semnalat neconcordanțe | Judecata pe cazuri neclare |

Argumentul e comercial, nu doar prudent: „AI-ul îți face contabilitatea singur" e **nevandabil** către contabili — răspunderea profesională, semnătura și amenda sunt ale lor. Ce cumpără un contabil e încredere și viteză, nu abdicare.

## De decis din start (ieftin acum, scump după)

- **Multi-firmă.** Un contabil are 30–80 de firme; configurarea trebuie gândită pe portofoliu, nu pe un singur `SAGA_ROOT`.
- **Izolarea datelor.** Secret profesional + GDPR. Se aplică aceeași regulă strictă ca la showcase-uri — vezi [[Politica de izolare a datelor pe client]].
- **Instalarea.** Un contabil nu configurează un server MCP din linia de comandă. Trebuie instalator sau punere în funcțiune făcută de TNS — de altfel un motiv bun de abonament, nu licență unică.

## Secvențiere

**Conta4U e pilotul.** E firma lui Eduard, riscul e al lui, și tot ce s-a spart în prima săptămână (meniu blocat, firmă invizibilă pentru MCP, setări citite greșit din interfață) sunt exact bug-urile pe care nu vrei să le descoperi la primul client plătitor.

Ordine: **închidem Q2 la Conta4U → încă 1–2 luni de contabilitate reală prin flux → abia apoi împachetăm.** Un produs vândut înainte de asta consumă reputația, care în piața contabilă din București e tot capitalul.

## De urmărit

Lansarea API-ului SAGA WEB (estimat S2 2026). Dacă apare, discuția „scriere automată în SAGA" devine realistă tehnic — dar presupune migrarea clientului pe SAGA WEB, produs diferit.

Legat de: [[Contabilitate CECCAR MOC]] · [[The Niche Society]] · [[Projects MOC]]
