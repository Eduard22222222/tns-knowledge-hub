# Ago-Filo — Tracking Setup

> **Status:** SCHELET. De auditat ce există deja pe site înainte de a adăuga.

## Ce există deja
- ✅ **Booking pipeline:** `/programare` → Supabase (`appointments`, proj `hfezamyfvwzgyriljnek`) → Zapier webhook → **WhatsApp + Google Calendar event**.
  - Zap: "AGO-FILO Programari - WhatsApp + Calendar" (cont Zapier: The Niche Society). Funcțional (verificat 2026-06-09).
- ✅ **LocalBusiness JSON-LD** pe /contact (adresă, telefon, geo, program).
- ✅ **GSC** Domain property `agofilo.ro` (cont TNS).

## De setat / verificat
- [ ] **GA4** — există? proprietate dedicată Ago-Filo.
- [ ] **GTM** — container pe site (e SPA Vite/React — atenție la SPA pageviews).
- [ ] **Google Ads Conversion Tracking:**
  - [ ] Conversie "Programare trimisă" (event la submit /programare — succes booking)
  - [ ] Conversie "Apel telefonic" (call from ads / call extension)
  - [ ] Conversie "Click WhatsApp" / "Click email"
- [ ] **Enhanced Conversions** (email/telefon din formular — avem datele în Supabase).
- [ ] Leagă GA4 ↔ Google Ads ↔ GSC.

## Note tehnice
- SPA → conversiile pe submit trebuie prinse pe state success (nu pe page load). Booking dă `isSuccess` în `BookingForm.tsx`.
- Webhook Zapier e expus în bundle-ul JS public → primește și hit-uri goale de la boți (inofensiv, dar consideră un Filter în Zap dacă crește zgomotul).
