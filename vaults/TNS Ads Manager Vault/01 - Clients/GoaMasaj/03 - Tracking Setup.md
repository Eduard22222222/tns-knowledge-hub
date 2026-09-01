# GoaMasaj — Tracking & Analytics Setup

**Status:** BEHAVIORAL TRACKING LIVE ✅ — Version 4 publicat 14.05.2026, 11 tags / 8 triggers active pe goamasaj.ro, ready to launch campaign

---

## GTM Container

- Container ID: **GTM-KPLX25VD**
- Container name: GoaMasaj
- Website: goamasaj.ro
- Install: ✅ instalat în index.html, multumim.html, regulament.html

## GA4 Property

- **Measurement ID: G-ZJ8CH8X2X3**
- Stream: GoaMasaj Web
- Stream URL: https://goamasaj.ro
- Stream ID: 14873948135
- Property: GoaMasaj (Romania, RON, Beauty & Fitness)

### Taguri de creat în GTM

#### 1. GA4 Configuration Tag
```
Tag type: Google Analytics: GA4 Configuration
Measurement ID: G-ZJ8CH8X2X3  ← READY
Trigger: All Pages
```

#### 2. Google Ads Conversion — Apel telefon
```
Tag type: Google Ads Conversion Tracking
Conversion ID: [din Google Ads cont]
Conversion label: [generat automat]
Conversion value: 50 (RON estimat pe lead)
Trigger: Click — număr telefon (+40770475210)
```

#### 3. Google Ads Conversion — WhatsApp Click
```
Tag type: Google Ads Conversion Tracking
Conversion value: 40 RON
Trigger: Click — link WhatsApp (wa.me/...)
```

> **Nota:** GoaMasaj NU are formular pe site. Conversion-urile vin doar din apeluri telefon și WhatsApp.

---

## LocalBusiness Schema Markup

De adăugat pe homepage + pagina contact:

```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Goa Masaj",
  "description": "Masaj la domiciliu în București — relaxare, terapeutic, deep tissue",
  "url": "https://goamasaj.ro",
  "telephone": "+40770475210",
  "email": "goa.masaj@gmail.com",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "București",
    "addressCountry": "RO"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "44.4268",
    "longitude": "26.1025"
  },
  "areaServed": {
    "@type": "City",
    "name": "București"
  },
  "priceRange": "220-250 RON",
  "openingHours": "TBD"
}
```

---

## GA4 Events configurate (Version 4 live)

| Eveniment | Trigger | Tip |
|---|---|---|
| `generate_lead` | Tel click + WhatsApp click | **Key Event** → conversion în Google Ads |
| `phone_click` | Tel click | Behavioral (cu `button_label`) |
| `whatsapp_click` | WhatsApp click | Behavioral (cu `button_label`) |
| `nav_click` | Nav menu click | Behavioral (cu `section`) |
| `service_interest` | Detalii/Vezi Toate Serviciile | Behavioral (cu `service_name`) |
| `social_follow` | Facebook/Instagram/TikTok click | Behavioral (cu `platform`) |
| `scroll_depth` | 25/50/75/90% scroll | Behavioral (cu `depth_threshold`) |
| `time_engaged` | 30s + 60s on page | Behavioral (cu `seconds`) |
| `page_view` | Automat GA4 | Built-in |
| `session_start` | Automat GA4 | Built-in |

**NO form_submit** — site-ul nu are formular, doar CTA telefon + WhatsApp.

---

## Checklist tracking

- [x] GTM instalat pe site (head + body) — GTM-KPLX25VD
- [x] GA4 property creată — G-ZJ8CH8X2X3
- [x] GA4 tag publicat live — Version 2, 13.05.2026
- [x] GA4 tag verificat — GTM live pe goamasaj.ro, dataLayer confirmă gtm.js/dom/load, 14.05.2026
- [x] GA4 Event tag — Apel telefon publicat — Version 3, 13.05.2026
- [x] GA4 Event tag — WhatsApp click publicat — Version 3, 13.05.2026
- [x] Conversion tracking apeluri setat — via generate_lead key event (GA4 → Google Ads)
- [x] Conversion tracking WhatsApp setat — via generate_lead key event (GA4 → Google Ads)
- [x] Google Ads linked cu GA4 — aprobat din Data Manager, 13.05.2026
- [x] Import conversii din GA4 în Google Ads — generate_lead Primary, Submit lead form, Active
- [x] **Behavioral tracking layer publicat — Version 4, 14.05.2026** (vezi mai jos)
- [ ] LocalBusiness schema adăugată
- [ ] Custom dimensions create în GA4 (button_label, section, service_name, platform, depth_threshold, seconds)
- [ ] Test final: click real telefon → conversion apare în Google Ads (după lansare campanie)

---

## Version 4 — Behavioral Tracking Layer (14.05.2026)

**Publicat:** 14.05.2026, 4:12 PM, by edumitriu04@gmail.com
**Containers:** 11 Tags / 8 Triggers / 10 Variables

### Triggere noi (5)

| Trigger | Type | Condition |
|---|---|---|
| Click — Nav Menu | All Elements | Click Text matches RegEx `Servicii\|Prețuri\|Info\|Contact\|Rezerv` |
| Click — Service Interest | All Elements | Click Text matches RegEx `Detalii\|Serviciile\|Vezi Toate` |
| Click — Social | Just Links | Click URL matches RegEx `facebook\|instagram\|tiktok` |
| Scroll Depth 25-90 | Scroll Depth | Vertical 25,50,75,90% |
| Timer 30s + Timer 60s | Timer | Interval 30000/60000ms, Limit 1, Page URL contains `goamasaj` |

### Tags noi (7) — toate GA4 Event, Measurement ID G-ZJ8CH8X2X3

| Tag Name | Event Name | Parameters | Trigger |
|---|---|---|---|
| GA4 Event — phone_click (behavioral) | `phone_click` | `button_label = {{Click Text}}` | Click — Telefon |
| GA4 Event — whatsapp_click (behavioral) | `whatsapp_click` | `button_label = {{Click Text}}` | Click — WhatsApp |
| GA4 Event — nav_click | `nav_click` | `section = {{Click Text}}` | Click — Nav Menu |
| GA4 Event — service_interest | `service_interest` | `service_name = {{Click Text}}` | Click — Service Interest |
| GA4 Event — social_follow | `social_follow` | `platform = {{Click Text}}` | Click — Social |
| GA4 Event — scroll_depth | `scroll_depth` | `depth_threshold = {{Scroll Depth Threshold}}` | Scroll Depth 25-90 |
| GA4 Event — time_engaged 30s | `time_engaged` | `seconds = 30` | Timer 30s |
| GA4 Event — time_engaged 60s | `time_engaged` | `seconds = 60` | Timer 60s |

### De ce contează pentru CAMPANIE

**Prioritate #1 = apeluri** (Eduard, 14.05.2026): `phone_click` event cu `button_label` ne arată EXACT care buton de telefon din pagina goamasaj.ro generează apeluri:
- "Sună acum" din header
- "+40770475210" din hero
- "Sună" din services
- "Sună acum pentru programare" din contact

→ Mutăm textul câștigător în Google Ads ad copy + facem CTA principal în pagină pe ce funcționează.

### Următorii pași tracking
1. Marcheaza `button_label`, `section`, `service_name`, `platform`, `depth_threshold`, `seconds` ca **Custom Dimensions** în GA4 Admin (Event scope)
2. După 24-48h cu trafic real → explore reports
3. Setup remarketing audience: "Engaged visitors" = scroll_depth ≥ 75% sau time_engaged ≥ 60s
