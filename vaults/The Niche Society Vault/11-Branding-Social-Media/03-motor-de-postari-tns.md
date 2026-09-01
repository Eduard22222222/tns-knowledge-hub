---
tags: [branding, social-media, linkedin, content-engine]
created: 2026-07-03
updated: 2026-07-03
status: active
---

# Motorul de postări TNS (modelul „Gabi", pentru nișa AI)

Sistemul prin care TNS postează constant pe LinkedIn fără să consume timpul lui Eduard. Același principiu ca motorul de postări făcut pentru Gabi (GoaMasaj): **Claude generează în batch → Eduard aprobă în minute → se programează pe o săptămână**. Diferența: aici nișa e AI/software B2B, deci pilonii, tonul și formatele sunt altele.

## Pilonii de conținut (5)
| # | Pilon | Ce demonstrează | Pondere |
|---|---|---|---|
| P1 | **AI aplicat în business real** — mini studii de caz din proiecte (doar FrostBite/PetVia + clienți cu acord) | „știu să livrez" | 30% |
| P2 | **Build in public** — cum construiesc cu Claude Code, AI tooling, workflow-uri; cifre reale de viteză/cost | „sunt altfel decât agențiile clasice" | 25% |
| P3 | **Educație AI pentru antreprenori RO** — ce poate/nu poate AI-ul azi, pe limba patronului de firmă | „e generos, îl urmăresc" | 25% |
| P4 | **Ofertă soft** — Consumer Voice, servicii, rezultate; max 1 din 6 postări e de vânzare | „pot să-l contactez" | 10% |
| P5 | **Personal / antreprenoriat** — lecții din TNS, decizii, greșeli | „e om, nu logo" | 10% |

## Cadența
- **3 postări/săptămână**: Marți, Miercuri, Joi, publicate **8:30–9:30** (fereastra B2B RO, înainte de ședințele de la 10).
- Toate de pe **profilul personal Eduard**; pagina de companie dă repost la 2 din 3 (nu invers — reach-ul personal e de 5-10× mai mare).
- Weekend: pauză (audiența B2B nu e acolo).

## Workflow-ul săptămânal (≈30 min din timpul lui Eduard)
1. **Vineri — sesiune cu Claude (15 min)**: deschid sesiunea, cer „3 postări pentru săptămâna viitoare" → Claude trage din [[04-backlog-postari-luna-1]] + evenimentele săptămânii (proiecte livrate, lansări AI relevante), scrie draft-urile în formatul de mai jos.
2. **Review Eduard (10 min)**: aprobă / cere ton mai personal / taie. Regula: dacă un draft nu sună a Eduard, se rescrie, nu se publică.
3. **Programare (5 min)**: LinkedIn are scheduler nativ (butonul de ceas la Post) — nu e nevoie de tool plătit la 3 postări/săptămână.
4. **După publicare (10 min/post, opțional dar valoros)**: Eduard răspunde la comentarii în prima oră — algoritmul răsplătește conversația timpurie.

## Formatul unui draft (așa livrează Claude fiecare postare)
```
PILON: P2
FORMAT: text / carusel / video / poll
HOOK (primele ~200 caractere, vizibile înainte de „see more"):
BODY:
CTA (întrebare sau îndemn, nu link):
VIZUAL: descriere / prompt Nanobanana / screenshot de făcut
HASHTAGS (3-5): #ai #softwaredevelopment #antreprenoriat + 1-2 specifice
```

## Reguli de optimizare LinkedIn (nenegociabile)
1. **Hook-ul decide totul** — primele 2 rânduri trebuie să oprească scroll-ul: cifră concretă, contrast („Agenția a cerut 3 luni. Noi am livrat în 12 zile."), sau întrebare incomodă.
2. **Fără link extern în corpul postării** — LinkedIn taie reach-ul; link-ul merge în primul comentariu.
3. **Text scurt cu aer**: rânduri de 1-2 propoziții, spații albe, max ~1.300 caractere la postările text.
4. **1 idee / postare** (aceeași regulă ca în Zettelkasten).
5. **Carusel = format rege pentru educație** (P3): 7-10 slide-uri, primul slide e hook vizual — se generează cu Nanobanana/GPT Image pe estetica TNS.
6. **Video demo pentru P1**: screen-recording 30-60s pe FrostBite/PetVia cu voice-over sau captions — nimic nu vinde AI mai bine decât să-l vezi mișcându-se.
7. **Constrângerea NDA** din [[00-branding-social-moc]] se verifică la FIECARE postare P1/P2.

## KPI & review lunar (prima zi de luni din lună, 15 min)
- Follows profil + pagină, impresii/post, comentarii/post, **DM-uri și lead-uri primite** (singurul KPI care contează în bani).
- Regula de decizie: pilonul cu cel mai bun engagement crește +10% pondere luna următoare; ce nu performează 2 luni la rând se taie.
- Rezultatele se notează la secțiunea Status de mai jos (evergreen, nu note noi).

## Extensii viitoare (nu acum)
- Instagram TNS (reels din materialele video P1) — abia după ce LinkedIn rulează stabil 2 luni.
- Newsletter LinkedIn („AI pentru business-ul tău") — după 1.000+ followers.
- Automatizare completă cu task programat (Claude scheduled task săptămânal care pregătește draft-urile singur, vineri dimineața) — de activat când workflow-ul manual s-a stabilizat.

## Status
- 2026-07-03: Motor definit. Backlog luna 1 pregătit în [[04-backlog-postari-luna-1]]. Pornire după setup profil ([[02-linkedin-eduard-optimizare]]) + pagină ([[01-linkedin-company-page]]).

## Legături
- [[00-branding-social-moc]]
- [[04-backlog-postari-luna-1]]
- GoaMasaj Vault — motorul original pentru Gabi (referință de proces)
