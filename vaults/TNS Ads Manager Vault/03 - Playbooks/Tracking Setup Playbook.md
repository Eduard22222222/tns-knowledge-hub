# Playbook: Tracking Setup (GTM + GA4 + Google Ads)

## Ordinea instalării — IMPORTANT

```
1. Creare GA4 property
2. Creare GTM container
3. Instalare GTM pe site
4. Configurare GA4 tag în GTM
5. Configurare conversion tags Google Ads în GTM
6. Linkare Google Ads ↔ GA4
7. Import conversii din GA4 în Google Ads
8. Test complet în Preview Mode
9. Lansare campanie (NUMAI după test reușit)
```

---

## GTM — Triggers utile pentru servicii locale

### Trigger: Click pe număr de telefon
```
Trigger type: Click — Just Links
Condition: Click URL contains tel:
```

### Trigger: Click pe WhatsApp
```
Trigger type: Click — Just Links
Condition: Click URL contains wa.me OR contains whatsapp
```

### Trigger: Form Submit
```
Trigger type: Form Submission
Condition: Form ID equals [ID form contact]
```

### Trigger: 75% Scroll Depth
```
Trigger type: Scroll Depth
Vertical scroll: 75%
```

---

## Google Ads Conversion Values (recomandate)

| Conversie | Valoare sugerată | Logică |
|---|---|---|
| Apel telefon | 50-80 RON | ~30% din prețul mediu serviciu |
| WhatsApp click | 40 RON | Mai puțin calificat decât apel |
| Form submit | 40 RON | |
| Booking completat | 150 RON | Intenție mai puternică |

---

## Enhanced Conversions (recomandat Google 2024+)

Enhanced Conversions trimite date first-party hashed (email, tel) la Google pentru match mai bun.
- Necesită: pagina de confirmare cu datele userului vizibile în DOM
- Implementare: tag GTM suplimentar sau GA4 config cu `enhanced_conversions: true`

---

## LocalBusiness Schema Markup

Adaugă pe homepage + pagina contact în `<script type="application/ld+json">`:

```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Nume Business",
  "description": "Descriere scurtă servicii",
  "url": "https://site.ro",
  "telephone": "+40XXXXXXXXX",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "București",
    "addressCountry": "RO"
  },
  "priceRange": "XXX-YYY RON",
  "openingHours": "Mo-Fr 09:00-20:00, Sa-Su 10:00-18:00"
}
```

Validare: Google Rich Results Test (search.google.com/test/rich-results)

---

## Checklist final pre-lansare campanie

- [ ] GTM instalat corect (verificat în GTM Preview)
- [ ] GA4 trimite pageviews (DebugView GA4)
- [ ] Conversion click telefon funcțional (test click → Conversions tab Google Ads)
- [ ] Conversion WhatsApp funcțional
- [ ] Google Ads linked cu GA4 (Admin → Google Ads Linking)
- [ ] Conversii importate în Google Ads (minimum 1 conversie primară marcată "Include in conversions")
- [ ] Schema markup validat (Rich Results Test)
- [ ] Site speed verificat (PageSpeed Insights mobile sub 3s)
