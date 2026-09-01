# TNS Supabase Secrets — DO NOT COMMIT

**Created:** 2026-05-25
**Org:** The Niche Society (Agency, Free plan)
**Project:** tns-booking
**Region:** Europe

## Database password (auto-generated)
```
FhpUOcRqaiBjAC79
```
- Used to connect directly to Postgres via psql / external clients
- Can be reset anytime from Supabase Dashboard → Settings → Database → Reset password
- NEVER commit this file
- NEVER paste in chat or shared docs

## Project identifiers
- **Project ID:** `gshdfizhwhafzrolixfw`
- **URL:** `https://gshdfizhwhafzrolixfw.supabase.co`
- **Dashboard:** https://supabase.com/dashboard/project/gshdfizhwhafzrolixfw
- **Anon (publishable) key:** `sb_publishable_yJ5tAaA2Qy8WvfbSjlVI9Q_zAdwAhEj`
- Public-safe: this is the new-format publishable key. RLS policies protect data.

---

---

## Google Ads conversion tracking (TNS)
- **Google Ads tag:** `AW-17890493567` (installed via connected tag on the GA4 Google tag `G-WQ0KPS9MMB`)
- **GA4 property linked:** 526465217
- **"Book appointment" conversion** (Primary, Count One, data-driven, 90d window):
  - `gtag('event','conversion',{send_to:'AW-17890493567/pe2PCJqpwLUcEP-I7dJC'})`
  - Fires in BookingForm.tsx only after Supabase insert succeeds (spam-resistant)
  - Deployed commit 6655ea7
- **"Calls from ads"** conversion (GoaMasaj/TNS, Primary, 60s min) — account call conversion action
- **TODO:** once booking conv has volume, demote the form-submit ("Contact" goal) to Secondary so reporting/bidding trusts booking + calls, not form spam.

This file is local-only. Vault folder is in OneDrive (not git-tracked).
