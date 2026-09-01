---
tags: [project, active, horeca, produs, ar, 3d]
created: 2026-07-30
updated: 2026-07-30
status: active
---

# Meniu 3D AR

Produsul principal al liniei [[HoReCa MOC]]. Clientul restaurantului scanează un QR de pe masă, se deschide meniul în browser (fără aplicație, fără cont), alege un preparat și îl vede **3D fotorealist, la scară reală, așezat pe masa lui**, prin camera telefonului. Poate să se învârtă în jurul farfuriei înainte să comande.

## Cum funcționează tehnic

Lanțul e standard și bine susținut în 2026, nu e nimic exotic:

- **Captură** — fotogrametrie pe preparatul real (60–100 de poze din jurul farfuriei). Ăsta e și modul în care lucrează ARmenu în UK, cu Apple Object Capture.
- **Livrare** — `<model-viewer>` detectează platforma singur: pe **Android** deschide GLB în Scene Viewer, pe **iOS** deschide USDZ în AR Quick Look. Ambele sunt native în sistem, deci promisiunea „fără aplicație" e reală, nu marketing.
- **Meniul propriu-zis** — aplicație web pe domeniul restaurantului, cu CMS pentru prețuri și descrieri.

## Ce ne diferențiază

Un meniu 3D fără altceva e ușor de copiat și există deja ca produs de raft în Europa. Diferența noastră e că lipim peste el [[Profil Nutrițional per Preparat]] — macro + 27 de micronutrienți + alergeni, pentru **fiecare** preparat din meniu, nu doar pentru cele scanate 3D. Asta rezolvă și o obligație legală a restaurantului ([[Alergeni obligatorii în meniu — Reg. 1169-2011]]), ceea ce mută discuția de la „gadget frumos" la „infrastructură".

## Demo-ul — atenție

Video-ul folosit în campania de email (`tns-leadgen/public/demo-3d-menu.mp4`) **nu e al nostru**. E demo-ul comercial al **Tapzy** (`tapzy.be`, Belgia), în franceză, iar URL-ul `tapzy.be` se vede citeț în bara Safari în majoritatea cadrelor cu meniul. E acceptabil ca „uite ce înseamnă asta" într-un email rece; **nu** e acceptabil într-o ofertă plătită prezentată ca munca noastră.

Pentru oferte folosim mockup-uri proprii, desenate în identitatea clientului, cu preparatele lui reale. Vezi decizia în [[Pricing HoReCa — benchmark de piață]].

## Economia produsului

Primul client e o investiție în template, exact ca [[Macromex Brand Showcase]] pentru familia ConsumerVoice: platforma se construiește o dată și se reclonează. Efortul cade de la ~10–12 zile la ~4–5 zile începând cu al doilea client. De aceea merită să intrăm în Nordului cu toate trei localurile, nu doar cu unul.

Costul variabil real per client e captura 3D (timp pe teren + preparatele pe care restaurantul le platează pentru noi), nu software-ul.

## Related

- Index: [[HoReCa MOC]]
- Pricing: [[Pricing HoReCa — benchmark de piață]]
- Feature diferențiator: [[Profil Nutrițional per Preparat]]
- Produs complementar: [[Carduri NFC Google Review]]
- Sursa lead-urilor: [[TNS Lead Gen System]]
- Primul prospect: [[Tuya Bucharest]]
