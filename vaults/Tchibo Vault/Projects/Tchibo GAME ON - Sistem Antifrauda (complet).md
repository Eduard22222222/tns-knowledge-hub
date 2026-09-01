---
tags: [tchibo, gameon, antifraud, documentation]
created: 2026-05-29
---

# Sistemul antifraudă GAME ON — complet

Filozofie: **stratificat + human-in-the-loop**. Sistemul automat scorează RISCUL și verifică ELIGIBILITATEA; cazurile neclare merg la moderator. Niciun bon nu se auto-validează ca „câștigător-eligibil" fără confirmare (OCR + om).

## Pipeline (la fiecare înscriere, în browser, gratis)

`Upload poză → OCR → 6 verificări → scor de risc 0-100 → status (respins / verificare / —) → dashboard`

## Cele 6 straturi de verificare

### 1. Duplicat — imagine (pHash / dHash)
Calculează o „amprentă perceptuală" a pozei. Dacă cineva re-încarcă aceeași poză (redenumită, recompresată, ușor decupată), distanța Hamming e mică → **duplicat**. Prinde reutilizarea aceleiași poze de bon. **+70 risc.**

### 2. Duplicat — document fiscal (DB, anti-enumeration)
La submit, un RPC `receipt_exists()` (SECURITY DEFINER) verifică dacă nr. bon sau amprenta imaginii există deja. Întoarce DOAR true/false — nu expune datele altor participanți. Bon deja înscris → **respins**.

### 3. Conținut bon — OCR (Tesseract.js, ron+eng)
Citește textul din poză și verifică:
- **Magazin = Auchan?** (caută „AUCHAN") — lipsă → **+30 risc**
- **Produs Cafissimo?** (caută „Cafissimo/Cafisimo") — lipsă → **+35 risc**
- **E chiar un bon?** (text insuficient = altă poză) — → **+35 risc**
> Acesta e stratul care prinde „biletul de muzică": fără Auchan + fără Cafissimo = 65 risc → **respins automat**.

### 4. Reconciliere număr (failsafe cerut)
Compară numărul de bon **tastat de client** cu textul **citit din poză** (OCR):
- apare verbatim în poză → match ✓
- altfel, similaritate (longest-common-substring pe cifre) 0..1
- nu apare ȘI similaritate < 0.6 → **+25 risc**, notă „Numărul introdus nu corespunde cu poza"

### 5. Manipulare imagine (Photoshop)
- **EXIF/metadata:** software de editare (Photoshop/GIMP…) sau lipsă metadata (screenshot) → **+15**
- **ELA (Error Level Analysis):** recompresează + diff → zonele editate „sar"; ridicat → **+25**

### 6. Imagine generată AI
Scor „posibil AI". Acum: euristică (lipsă EXIF + ELA foarte mic). Producție: API extern (HF `Organika/sdxl-detector`). **Semnal, nu verdict** → +30, merge la verificare umană. (Onest: detecția AI-gen nu e 100% fiabilă industry-wide.)

## Scor → status
- **≥ 60 sau duplicat → RESPINS automat**
- **altfel → VERIFICARE** (moderator confirmă legitimitatea; nimic nu se auto-validează)
- (validarea finală „câștigător-eligibil" = decizie umană în dashboard)

## Bonus: OCR autocomplete
La upload, OCR-ul pre-completează nr. bon / dată / total / magazin (editabile) și arată instant „✓ Auchan / ✓ Cafissimo detectat". UX mai bun + datele tastate devin verificabile contra pozei.

## Ce vede moderatorul (dashboard)
Fiecare înscriere: poza bonului + datele + scorul de risc + badge-uri (Duplicat / Fără Auchan / Fără Cafissimo / Nu pare bon / Nr ≠ poză / EXIF suspect / ELA editare / Posibil AI / Curat). Aprobă / verifică / respinge (logat audit) + export CSV + extragere câștigători.

## Limite oneste
- OCR pe bonuri termice reale e imperfect (Tesseract gratis); pentru acuratețe maximă → Azure Document Intelligence (model bonuri, plată/scan).
- AI-gen = semnal, nu dovadă.
- De aceea: automatul filtrează + respinge clar frauda; **omul validează eligibilitatea finală**.

## Test live (29.05.2026)
- Bilet muzică (fără Auchan/Cafissimo) → RESPINS, risc 65 ✓
- Bon cu Auchan + Cafissimo → Verificare, risc 0, nr ✓ corespunde ✓
