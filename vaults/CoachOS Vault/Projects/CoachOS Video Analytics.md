---
tags: [project, coachos, computer-vision, ai, spec]
created: 2026-08-12
updated: 2026-08-12
status: idea
---

# CoachOS Video Analytics

Feature-ul nou. Ideea lui Eduard, în cuvintele lui: ai programul de antrenament al Jucătorului X,
ai un video al acelui antrenament filmat cu telefonul, AI-ul analizează video-ul și scoate
statistici avansate **contextualizate de drill-ul respectiv** — apoi AI + antrenor construiesc
un plan de îmbunătățire pe termen scurt/lung.

## De ce ideea e bună (și unde e capcana)

**Bună:** contextul de drill e activul pe care nimeni altcineva nu-l are. SwingVision știe că
mingea a aterizat la 1.2m de linia de fund. CoachOS știe că *exercițiul cerea 6 din 8 mingi
adânci pe backhand crosscourt*. Prima e o măsurătoare. A doua e coaching.

**Capcana:** "winners, unforced errors" — exact exemplele din ideea inițială — sunt **concepte
de meci, nu de drill**. Într-un exercițiu de cooperare nu există winner; într-un basket-feed nu
există unforced error. Dacă lansezi cu aceste metrici, produsul o să raporteze numere care
sună bine și nu înseamnă nimic, iar antrenorul o să-și piardă încrederea din prima sesiune.

Ce **este** măsurabil fiabil într-un drill, de la prima versiune:
- poziția de aterizare a mingii (heatmap) + adâncime pe zone
- in / out
- lungimea rally-ului, numărul de lovituri, lovituri pe minut
- consistență: % din mingi care au nimerit ținta drill-ului
- (Faza B) tipul loviturii, punctul de contact, traiectoria swing-ului

Astea răspund la "a făcut exercițiul cum trebuia?", care e fix întrebarea antrenorului.

## Faze de livrare

### Faza A — "Unde au aterizat mingile" (4–6 săptămâni)
Ball tracking + detecție de teren + bounce. Coach-ul filmează cu telefonul de pe margine,
taggează clipul la drill-ul **deja existent în CoachOS**, primește un heatmap și un procent
de consistență raportat la ținta drill-ului.

Aici e tot produsul minim viabil. Dacă asta nu impresionează un antrenor, restul nu contează.

### Faza B — "Cum a lovit" (+6–8 săptămâni)
Pose estimation → clasificare de lovitură (forehand / backhand / serviciu / voleu), punct de
contact, deschidere. Alimentează profilul avansat de jucător (P2 #14 din [[CoachOS Roadmap]]).

### Faza C — Layer de coaching (+2–3 săptămâni, ieftin)
LLM peste JSON-ul structurat produs de A+B (~10k tokens/sesiune) → narativă de coaching + plan
pentru sesiunea următoare, ancorat în biblioteca de drill-uri existentă. **$0.002–0.05/sesiune.**
Nu trimite video la LLM — vezi [[De ce nu un VLM pe video]].

## Constrângeri tehnice care schimbă totul

Trei lucruri care par detalii și sunt de fapt decizii de arhitectură (detalii complete în
[[Tennis Vision - Arhitectura de Cost]]):

1. **60 fps, nu 30.** La 30fps mingea parcurge 0.9–1.9 m între cadre — mai mult decât culoarul
   de dublu. Bounce-ul nu poate fi localizat. Nu e o optimizare, e o condiție de funcționare.
2. **Mingea e în joc 10–15% din timp** pe hard (20–30% pe zgură). Rulezi tracking pe tot
   clipul → plătești de 5–7× degeaba. Segmentarea activă e prima optimizare, nu ultima.
3. **Fișierele sunt de 5.4–9.5 GB/oră** la 1080p60. Pe fibră e ok. Pe date mobile, o oră de
   upload. Compresie/segmentare pe device înainte de upload nu e opțională.

**Ball tracking = ~70% din tot bugetul GPU.** Orice altă optimizare e zgomot.

## Economia, pe scurt

| Arhitectură | COGS / oră video |
|---|---|
| Naiv (cloud, fără optimizări) | $3.84 ← te omoară |
| Serverless optimizat (L4 EU) | $0.52 |
| Fleet propriu @70% utilizare | $0.31 |
| On-device (ANE) | $0.05 |

Pentru un deal de academie, varianta care câștigă nu e cea mai ieftină — e **cutia GPU on-prem**
(RTX PRO 6000, ~€8–10k one-off). Costul e comparabil, dar **datele nu ies din clădire**, ceea ce
transformă cea mai mare obiecție (minori + video, vezi [[GDPR - Video si Minori in NL]]) în
argument de vânzare.

## Prima acțiune, înainte de orice cod de produs

Închiriază un L4 la ~$0.39/h și **măsoară FPS-ul real** pentru ball tracking (WASB exportat în
TensorRT FP16). Nimeni nu a publicat acest număr — WASB e benchmarkuit pe V100 (58 FPS), iar L4
are ~3× mai puțină bandwidth, deci ar putea fi mai lent. Costă ~$5 și decide dacă unit
economics-ul stă în picioare: rezultatul mută costul între $0.09 și $0.60/oră.

Al doilea test: replică `vball-net` pe tenis — au raportat 200+ FPS ball tracking **pe CPU**.
Dacă se confirmă, costul GPU aproape dispare.

## Legături
[[CoachOS MOC]] · [[CoachOS Roadmap]] (P3 #23) · [[Tennis Vision - Arhitectura de Cost]] ·
[[De ce nu un VLM pe video]] · [[CoachOS - Peisaj Competitiv]]
