---
tags: [fleeting, coachos]
created: 2026-08-12
---

# 2026-08-12 — Context dump Eduard

Captura brută, așa cum a venit. Procesată în [[CoachOS Roadmap]] (triaj P0–P3) și
[[CoachOS Video Analytics]] (ideea de vision). Se șterge după ce roadmap-ul e validat cu Filip.

#fleeting

## To add for future
- Integrare cu date video pentru statistici avansate

## Day 1
- Voice AI recognition — antrenorul dictează notițele (WhisperFlow, open source)
- Edit drills — tag-uri custom + editare drill-uri deja salvate
- Jucătorii nu se salvează corect la adăugare — **(DONE)**
- Design palettes
- Integrare socială — vezi la ce lucrează alți antrenori (extensie plătită)
- Trimite feedback și către clienți
- Daily activity tracker
- Planificare short/long term

## Day 2 — testing
- Nu șterge și nu editează jucători
- Nu șterge drill-uri; verifică pentru toate funcțiile dacă delete/edit sunt necesare

## Day 3
- Share function pentru program
- Calendar + program per sesiune, ușor accesibil și vizibil
- Search la adăugarea jucătorilor în grupuri
- Mai responsive
- Onboarding la instalarea app-ului
- Interfață Coach / Student
- Profil avansat de jucător
- Drill-uri de lecție aprobate KNLTB pe niveluri — parteneriat direct
- LLM / AI care descompune sesiunile și planifică sesiunile viitoare
- Casete expandabile pentru text mai lung
- Redenumire "planning ahead" → "for next time"
- Istoric de lecții în sesiunile jucătorului; lecțiile planificate nu apar

## Cele două idei (citat, în esență)
> Pleacă de la profiluri, statistici avansate. Ai programul de antrenament al Jucătorului X.
> Ai un video al acelui antrenament, filmat la practică — poate fi cu telefonul obișnuit.
> AI-ul analizează video-urile și extrage statistici avansate: număr de winners, unforced
> errors, număr de mingi adânci lovite etc., **pe baza drill-ului în care a fost filmat
> video-ul**. Apoi AI-ul, împreună cu antrenorul și cu statisticile jucătorului, construiește
> un plan de drill-uri pe termen scurt sau lung pentru îmbunătățirea anumitor aspecte.

→ Analizat în [[CoachOS Video Analytics]]. Observația critică: "winners / unforced errors" sunt
concepte de **meci**, nu de drill — nu se pot livra în Faza A fără a produce numere fără sens.
