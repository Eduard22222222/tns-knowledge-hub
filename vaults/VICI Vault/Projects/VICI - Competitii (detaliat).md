---
tags: [vici, competitii, campaign, detailed]
created: 2026-06-04
---

# VICI — 3 Competiții (extrem de detaliat)

Stil adaptat din referința O'Green: înscriere + cod bon + premii cu poze. Creative-uri generate cu **Higgsfield Cinematic Studio 2.5** (cover-uri) + nanobanana (premii, decupate pe transparent).

## Creative-uri / assets (în vici-platform/src/assets/)
- Cover-uri Higgsfield: `comp-cover-instore.png`, `comp-cover-video.png`, `comp-cover-photo.png`
- Premii transparente (nanobanana + cutout): `prize-airfryer.png`, `prize-cookware.png`, `prize-utensils.png`
- Produse oficiale: `product-surimi.jpg`, `product-gyoza.jpg`, `product-salmon.jpg` · Logo: `vici-logo.png`

---

## 1. „Cumpără & Câștigă cu VICI" (in-store / bon fiscal)
- **Cover:** `comp-cover-instore.png` (cumpărător la raionul congelate)
- **Mecanică:** Cumpără **2 produse VICI** din magazinele participante → înscrie **codul bonului** + data pe platformă (sau SMS) → intri automat în tragerea la sorți.
- **Premii (cu poze):**
  - **2× Air Fryer** premium — `prize-airfryer.png`
  - 10× Set tigăi inox — `prize-cookware.png`
  - 50× Kit VICI (voucher + produse)
- **Pași:** 1. Cumpără 2× VICI · 2. Înscrie bonul · 3. Tragere la sorți
- **Câmpuri formular:** Nume, Prenume, Email, Telefon, Data bonului, Codul bonului + consimțământ GDPR
- **Retaileri:** Carrefour, Auchan, Mega Image, Kaufland, Metro (de confirmat)
- **Perioadă:** ex. 1 nov – 15 dec 2026 · **Validare:** antifraudă (dedup bon + OCR „VICI" pe poză — opțional)

## 2. „VICI Recipe Video Contest" (video — creative)
- **Cover:** `comp-cover-video.png` (creator filmând rețeta)
- **Mecanică:** Gătește o rețetă cu produse VICI (gyoza / surimi / somon), **filmează un video** (max 60s), urcă-l pe platformă + descriere rețetă. Juriu + voturi comunitate → **cea mai bună rețetă câștigă**.
- **Premii (cu poze):**
  - **Marele premiu: Set cookware premium** — `prize-cookware.png`
  - 3× Set ustensile bucătărie + cuțit chef — `prize-utensils.png`
  - 10× Kit VICI
- **Pași:** 1. Gătește cu VICI · 2. Filmează video · 3. Urcă & câștigă
- **Câmpuri:** Nume, Email, Telefon, link/upload video, titlu rețetă, ingrediente, consimțământ
- **Criterii jurizare:** creativitate, aspect, folosirea produsului VICI, voturi

## 3. „VICI Foodie Photo" (foto — best plated dish)
- **Cover:** `comp-cover-photo.png` (platou gourmet cu surimi & somon)
- **Mecanică:** Fă o **poză cu cel mai frumos platou** preparat cu VICI → urcă pe platformă → cele mai apreciate câștigă.
- **Premii (cu poze):**
  - 3× Set ustensile bucătărie — `prize-utensils.png`
  - 20× Kit VICI / vouchere
- **Pași:** 1. Gătește · 2. Fotografiază · 3. Urcă & votează
- **Câmpuri:** Nume, Email, upload poză, titlu preparat, consimțământ

---

### Note
- „Imaginile premiilor sunt cu titlu de prezentare" (disclaimer ca în O'Green).
- Premiile non-VICI (air fryer, cookware, ustensile) = achiziție separat (parte client/agenție, ca la Tchibo).
- Higgsfield CLI funcțional (`@higgsfield/cli@0.1.40`, logat) — pot genera și **video** real pentru hero/teaser când e nevoie.
