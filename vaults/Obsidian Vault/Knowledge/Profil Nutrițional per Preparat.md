---
tags: [knowledge, horeca, nutritie, feature, ai]
created: 2026-07-30
updated: 2026-07-30
---

# Profil Nutrițional per Preparat

Feature-ul care scoate [[Meniu 3D AR]] din categoria „gadget" și îl bagă în categoria „infrastructură". Fiecare preparat din meniu primește profil nutrițional complet, calculat din rețeta reală a bucătăriei.

## De unde vine

Direct din **Fibly** (`Desktop/Fibly/foodlens-vision-nutrition`), unde motorul e deja construit și testat. Structura livrată acolo (`src/types/recipe.ts`) e exact ce ne trebuie:

- **Macro** — calorii, proteine, carbohidrați, grăsimi, fibre
- **27 de micronutrienți** — 12 vitamine (A, C, D, E, K, B1, B2, B3, B5, B6, B12, folat), 10 minerale (calciu, fier, magneziu, fosfor, potasiu, sodiu, zinc, cupru, mangan, seleniu), plus omega-3, omega-6, colesterol, zaharuri, grăsimi saturate, biotină, colină, iod, crom

## Diferența față de Fibly

Fibly pornește de la o **poză** și trebuie să ghicească ce e în farfurie — de acolo vine toată complexitatea cu vision și marja de eroare. La restaurant nu ghicim nimic: bucătăria ne dă **rețeta și gramajele**. Drumul e ingrediente → profil, ceea ce e mult mai simplu și mult mai precis decât ce face aplicația.

Practic reutilizăm partea grea (baza nutrițională + calculul) și tăiem partea riscantă (recunoașterea din poză).

## De ce vinde

- **Acoperă o obligație legală.** Alergenii sunt oricum obligatorii — vezi [[Alergeni obligatorii în meniu — Reg. 1169-2011]]. Dacă tot trebuie făcut, restaurantul preferă să iasă frumos.
- **Se aplică pe tot meniul**, nu doar pe preparatele scanate 3D. Un meniu de 90 de poziții primește profil pe toate 90, chiar dacă doar 25 sunt în 3D. Asta face oferta să pară mult mai plină.
- **Nimeni în România nu vinde asta la pachet cu meniul.** Meniurile QR de 80 lei/lună îți dau, cel mult, o listă de alergeni introdusă manual.
- Publicul din Nordului e exact publicul care se uită la calorii și la proteine.

## Atenție la răspundere

Profilul e **estimare pe baza rețetei declarate de restaurant**, nu analiză de laborator. Trebuie spus asta explicit în meniu și în contract. Alergenii, în schimb, se declară pe baza ingredientelor reale și rămân responsabilitatea bucătăriei — noi doar îi afișăm corect. Nu ne asumăm rolul de laborator acreditat.

## Related

- Index: [[HoReCa MOC]]
- Produsul în care intră: [[Meniu 3D AR]]
- Obligația legală: [[Alergeni obligatorii în meniu — Reg. 1169-2011]]
