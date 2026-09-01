---
tags: [knowledge, contabilitate, saga, saft, retrospectiva]
created: 2026-07-31
updated: 2026-07-31
status: active
---

# SAGA — Depunere D406 SAF-T (retrospectivă erori)

Depunerea celor două D406 (Conta4U, trim. I + II 2026) a durat **zile**, cu enorm de mult timp și tokeni irosiți. Ambele s-au depus în final (Q2 recipisă 1185922008 „fără erori", Q1 recipisă 1185931942). Nota asta e despre **ce am greșit și de ce a durat**, ca să nu se repete. Legat de [[SAGA — Generare D406]] · [[Conta4U — migrarea SAGA]].

## Rețeta corectă (dacă aș fi știut-o din prima, dura ~30 min)

1. **Java trebuie instalat ÎNAINTE** — aplicația Declarații ANAF (DUKIntegrator) e pe **32-biți** și cere **Java pe 32-biți (x86)**, cu cheile de registry în `HKLM\SOFTWARE\WOW6432Node\JavaSoft\Java Runtime Environment` (CurrentVersion=1.8 + JavaHome). Java 64-biți **NU** e văzut de ea. Instalare corectă: MSI Temurin JRE 8 **x86** cu `ADDLOCAL=FeatureMain,FeatureEnvironment,FeatureJavaHome,FeatureOracleJavaSoft` (ultima creează cheile JavaSoft). winget instalează doar x64 și refuză x86 („already installed") — descarcă MSI-ul direct: `https://api.adoptium.net/v3/installer/latest/8/ga/windows/x86/jre/hotspot/normal/eclipse`.
2. În Declarații ANAF: click-dreapta pe rând → **Validare + creare PDF semnat** → la prima rulare descarcă modulul DUKIntegrator pentru D406 (dialog „Actualizare DukIntegrator" → „Descarcă declarațiile selectate").
3. Apare dialogul Windows **CredentialUIBroker** (selectare certificat + PIN) — se randează adesea **negru** (glitch); utilizatorul dă click pe el, alege certificatul, introduce PIN. Statusul „Fișierul nu a putut fi semnat!" apare tranzitoriu până se introduce PIN-ul — nu e eroare reală.
4. Se creează `..._semnat.pdf`. Selectează-l → butonul **ANAF** (scut) → se depune. Recipisă în câteva secunde, stare „În prelucrare" → „Nu există erori de validare".

**La SAF-T se depune PDF-ul semnat, NU XML-ul.** XML-ul e împachetat în PDF. Rândul XML „dispare" din listă după depunere pentru că e consolidat — nu e o eroare.

## Ce am greșit (și m-a costat ore)

1. **Java — cel mai mare.** Am dat de „Nu aveți Java instalat" de vreo 4 ori și abia târziu am realizat că trebuie **x86**, nu x64. Am pierdut o rundă instalând x64, apoi setând registry x64 degeaba (aplicația 32-bit citește WOW6432Node). Trebuia verificat din prima că unealta e pe 32-biți.
2. **Am regenerat D406 de prea multe ori.** Utilizatorul s-a enervat justificat — reveneam la „generez SAF-T" când de fapt lucram la altceva (mașina din registru). Trebuia comunicat clar ce fac la fiecare pas.
3. **Ferestrele care fură focusul** (SAGA, Declarații ANAF, Explorer, Chrome) — am pierdut zeci de acțiuni forțând ferestre în față cu Win32; forțarea a și destabilizat SAGA (Not Responding). Lecție: minimizează celelalte ferestre o dată, nu forța la fiecare pas.
4. **Am omorât procesul Firebird** ca să deblochez baza → a stricat baza de securitate (SQLSTATE 28000) → a cerut restart de laptop. Greșeală: intervenție agresivă în loc să aștept / să cer admin.
5. **SSD-ul extern (E:) s-a deconectat** sub SAGA în timpul lucrului → crash-uri repetate pe care le-am pus greșit pe seama SAGA. Lecție: [[SAGA — nu ține baza live pe disc extern]]; ține copie pe C:.
6. **DUKIntegrator/Java nu se pot ocoli** — validarea locală e obligatorie pentru semnare, deci Java e blocant, nu opțional. Am tratat-o greșit ca „opțională" o vreme.

## De ce a durat atât (cauza-rădăcină)

Un lanț de blocaje **de mediu**, nu de contabilitate: disc extern instabil + Firebird fragil + Java lipsă/greșit + ferestre VFP care pierd focus + un dialog de securitate care se randează negru. Fiecare a fost tratat reactiv, pe rând, în loc să fie diagnosticate toate la început (ex. „ce cere DUKIntegrator ca să semneze?" trebuia întrebat în minutul 1). Contabilitatea în sine (avans 4093, storno GOLF, 691, 455→4551, închidere iunie) a fost corectă și rapidă — timpul s-a dus pe infrastructură.

## Pentru data viitoare (checklist de mediu, înainte de orice)
- [ ] SAGA rulează de pe disc **local** (nu E: extern, nu OneDrive)
- [ ] **Java 8 x86** instalat, cheile WOW6432Node\JavaSoft prezente
- [ ] Token conectat, certificatul vizibil (`certutil -scinfo` → card Longmai)
- [ ] O singură instanță SAGA; celelalte ferestre minimizate
- [ ] Copie a `cont_baza.fdb` pe C: înainte de operații
