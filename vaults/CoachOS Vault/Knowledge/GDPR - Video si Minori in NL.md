---
tags: [knowledge, coachos, gdpr, legal, netherlands]
created: 2026-08-12
updated: 2026-08-12
status: active
---

# GDPR — Video și minori în NL

Nu e o notă de subsol de conformitate. **E constrângerea care decide unde rulează inferența**
și, la un board de club format din voluntari, e lucrul care deblochează sau ucide deal-ul.

## Faptele

**Vârsta de consimțământ = 16 ani.** Olanda a ales maximul permis de GDPR, prin UAVG art. 5.
Sub 16 ani: consimțământ parental **per copil, per scop**, iar toate drepturile persoanei
vizate se exercită de părinte. La o academie de performanță, majoritatea sportivilor sunt sub 16.

**DPIA aproape sigur obligatoriu.** Lista Autoriteit Persoonsgegevens include explicit
supravegherea video, profiling-ul și observarea sistematică a comportamentului. Un pipeline
care filmează minori și le construiește profiluri de performanță bifează toate trei.

**Verwerkersovereenkomst** (acord de prelucrare) — obligatoriu, în olandeză.

## Implicația de arhitectură

Asta e motivul real pentru care **cutia GPU on-prem** bate cloud-ul la un deal de academie,
chiar dacă costurile sunt comparabile ([[Tennis Vision - Arhitectura de Cost]]):
video-ul cu minori **nu părăsește clădirea**. Transformi cea mai grea obiecție în cel mai
puternic argument de vânzare.

Dacă totuși merge în cloud: rezidență UE obligatorie, fără excepții. AceSense a intrat pe piață
cu exact acest pitch (€19/lună + rezidență UE).

## Implicații de produs — nu doar de contract

- **Retenție:** definește un termen și șterge automat. Video de antrenament cu minori păstrat
  indefinit e o problemă în sine, indiferent de consimțământ.
- **Share program / link public** ([[CoachOS Roadmap]] P2 #15): dacă apar nume de minori într-un
  link public, ai o scurgere. Token + expirare + fără nume complete.
- **Alți copii în cadru.** Într-un drill de grup filmezi 4 copii, nu unul. Consimțământul unuia
  nu acoperă restul. Ori consimțământ pentru toți din grup, ori blur pe non-subiect.
- **Dreptul la ștergere** trebuie să funcționeze end-to-end: DB, storage, și derivatele
  (heatmaps, embeddings, JSON de analiză). De proiectat de la început, e infernal de adăugat după.

## De livrat ca activ de vânzare
DPIA + verwerkersovereenkomst **în olandeză**, pregătite înainte de prima întâlnire cu board-ul.
La un club condus de voluntari, faptul că vii cu ele gata scrise scurtează ciclul de vânzare mai
mult decât orice demo.

## Legături
[[CoachOS Video Analytics]] · [[CoachOS - Peisaj Competitiv]] · [[CoachOS MOC]]
