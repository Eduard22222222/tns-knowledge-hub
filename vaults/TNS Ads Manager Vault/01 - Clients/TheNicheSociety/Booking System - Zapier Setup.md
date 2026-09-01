# TNS Booking System — Zapier Setup

**Created:** 2026-05-24
**Workspace:** The Niche Society (Personal)
**Calendar account target:** office@thenichesociety.ro

---

## Webhook (Zapier Catch Hook)

**URL:** `https://hooks.zapier.com/hooks/catch/26751176/4olv15t/`
**Zap ID:** 365688878
**Status:** Draft → Pending publish
**Trigger app:** Webhooks by Zapier (Premium)
**Trigger event:** Catch Hook

### Sample payload (sent 2026-05-24 for schema detection)
```json
{
  "name": "Test User",
  "email": "test@thenichesociety.ro",
  "phone": "+40712345678",
  "service": "Discovery Call",
  "duration": 30,
  "date": "2026-06-02",
  "time": "10:00",
  "message": "Test booking sample for Zapier schema detection",
  "timestamp": "2026-05-24T12:00:00+03:00",
  "startDateTime": "2026-06-02T10:00:00+03:00",
  "endDateTime": "2026-06-02T10:30:00+03:00"
}
```

---

## Action: Google Calendar → Create Detailed Event

**Account connected:** `office@thenichesociety.ro` ✅
**Calendar selected:** `office@thenichesociety.ro` (primary) ✅
**Summary:** `Programare TNS — [Service]` ✅

### Field mapping — TO FINISH MANUAL în Zapier UI

Click pe Google Calendar step din canvas, deschide tab `Configure`, completează:

**Description** (text area, suportă `\n`):
```
Programare nouă — The Niche Society

Serviciu: [insert Service token]
Durată: [insert Duration token] min

— Contact —
Nume: [insert Name token]
Email: [insert Email token]
Telefon: [insert Phone token]

— Mesaj client —
[insert Message token]

(Booking ID: [insert Timestamp token])
```

**Location:** lasă blank (TNS = remote-first; meeting URL apare din Google Meet auto, vezi mai jos).

**Start Date & Time:** `[insert Start Date Time token]` — webhook trimite deja ISO cu offset `+03:00` (DST București).

**End Date & Time:** `[insert End Date Time token]` — același format.

**Time zone:** selectează din dropdown `(GMT+02:00) Europe/Bucharest` (chiar dacă ISO are offset, setarea explicit a timezone-ului în Google Calendar event protejează contra ambiguității la DST switch oct/mar).

**Attendees:** `[insert Email token]` (clientul primește invite + reminder).

**Add Conferencing?** `Google Meet`  (auto-generated link în event).

**Send Notifications?** `Yes` (clientul primește email instant).

**Show me as:** `Busy`.

**Visibility:** `Default`.

### Test step
După Configure → click `Test step` → ar trebui să apară un event în calendar office@ pe data **2026-06-02 10:00–10:30**.
Verifică:
- ora în calendar e **10:00 EEST** (nu 07:00 UTC sau 13:00)
- attendee = `test@thenichesociety.ro`
- email invite primit pe office@

### Publish
Click `Publish` (buton mov sus-dreapta) → toggle Zap pe `ON`.

---

## Old Zaps (do not use for TNS bookings)
- `365686642` — Untitled Zap (abandoned; defaulted to Ago Filo calendar). Left as draft.
- `AGO-FILO Programari - WhatsApp...` — production Zap for Ago Filo only.
