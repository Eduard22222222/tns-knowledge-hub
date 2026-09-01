---
tags: [project, active, tns, lead-gen, engine, template, cold-outreach, react]
owner: The Niche Society (Eduard)
type: reusable engine / template
status: live (engine + first instance)
created: 2026-06-18
updated: 2026-06-23
---

# TNS Lead Gen — our reusable engine

**The Niche Society's own cold-outreach engine.** This is the **master template we clone** to stand up a complete lead-gen + outreach platform for *any* company / offer:
a **login dashboard** (import leads → edit the message → pick who → hit Send) + **per-company dynamic landing pages** + visit tracking + a meeting-booking CTA synced to Google Calendar.

Built by us, owned by us. Each new client/offer becomes an **instance** that links *from* this note. → see [[The Niche Society]].

---

## 🧩 Instances (built from this engine)
- [[Consumer Voice Platform (Wave x TNS)]] — 🟢 **LIVE** · first instance. Sells the Consumer Voice platform to FMCG brands (Wave × TNS). Dashboard + sending live at **`go.consumervoice.eu`**; Al sends from his own domain, office@ from TNS. Offer/brand: [[Consumer Voice Brand]].
- **Meniuri 3D — Restaurante de lux București** — 🟡 *in prep* (a 2-a ofertă, rulează pe **același** dashboard prin **șabloane salvate** + **bundle de lead-uri**). 45 restaurante fine-dining cu email real importate ca grupul „Restaurante Lux Bucuresti" (research în `tns-leadgen/data/restaurants-bucuresti.json`+`.csv`); șablon „Meniuri 3D — Restaurante" cu **demo = video în email** (thumbnail clickabil → `go.consumervoice.eu/demo-3d-menu.mp4`, fără landing page) și mesaj care cere o **întâlnire online/fizică**. Gata de trimis după warm-up — flip ★ pe „Meniuri 3D" în Mesaj înainte de batch. Open: brand/domeniu propriu + per-send template picker (ca să nu mai comuți ★ global).
- *(future instances drop here — clone the engine, swap the offer + leads + brand tokens for the next company)*

---

## What the engine does (current build — 2026-06-19)

### Login dashboard — `go.consumervoice.eu/login`
Real auth (custom HMAC tokens; 3 users). Five tabs:
- **Leads** — status pipeline (nou → trimis → deschis → booking → bounce/skip) + per-lead engagement, search/filter, inline status edit. **Grupat pe bundle-uri** — fiecare grup e un box pe care îl restrângi/ascunzi.
- **Import** — drag a cleaned **CSV / XLSX** → smart column auto-mapping → leads go straight into the platform, într-un **grup/bundle** ales (each gets its `/slug` page). Plus **manual single-contact add**.
- **Mesaj** — **mai multe șabloane salvate** (RO + EN), comuți între ele, unul marcat **activ ★** la trimitere; **variable guide** (`{{company}}`, `{{hi}}`, `{{first_name}}`, `{{sender_name}}`, `{{landing_url}}`, `{{slug}}`) + live preview + **video în email** (thumbnail clickabil → clipul, fără atașament greu) + **"Trimite test"**.
- **Trimite** — recipienți **grupați pe bundle** (select-all per grup) → multi-select → **dry-run preview** → confirmed **Send** (warm-up cap), arată From/canalul exact.
- **Analytics** — visits, bookings, totals.

### Per-company landing pages
Route `/:slug` reads the lead from Supabase **at runtime** (add leads with zero redeploy). Personalized hero + the company's brands + an industry-matched demo. Tailored section auto-cuts if a lead has no brands. Unknown slug → readable name fallback (never "Your Brand"). Booking = month calendar → day → time slot → Google Calendar event + invite.

### Email sending — per-user routing
Whoever logs in sends **from their own address**:
- `office@thenichesociety.ro` → via **Gmail** (its own address).
- Al's accounts → via **Resend** from `al@consumervoice.eu` / `al@waveadvertising.ro` (both domains **verified**, Resend Pro).
- Subject + body from the editable template; From-name MIME-encoded (no mojibake); links on the branded domain.

### Stack & infra
- **Vite + React + TS + Tailwind v4** + framer-motion (React Bits–style anims). Repo: `Desktop/claude/tns-leadgen/`.
- **Supabase** `brlztibzaeflufqepsrn` — tables: `leads` (public display) · `outreach_contacts` (private PII) · `leadgen_visits` · `leadgen_bookings` · `dashboard_users` · `email_templates` (mai multe, salvate) · `outreach_contacts.bundle` (grup) · `gmail_creds` · `resend_config` · `admin_config` · `google_calendar_creds`. Edge fns: `dashboard-auth`, `dashboard-api` v6 (list/import+bundle/send/send_test/status/templates_list/template_save/template_activate/template_delete), `book-calendar`, `admin-stats`, `import-leads`.
- **Netlify** site `consumervoice-leadgen` → custom domain **go.consumervoice.eu** (SSL).
- **Resend** (Pro) for client-domain sending · **Gmail API** (office@) for TNS sending · **Google Calendar API** for booking.

---

## 🔁 How to clone for a NEW company (the template reuse)
1. New **Supabase** project (per isolation policy) → run the schema + deploy the edge fns.
2. New **Netlify** site + custom domain for that client.
3. Swap **brand tokens** (colors / logo / copy) + the **offer** content (the pitch sections) for the new product.
4. **Import** that client's leads (CSV/XLSX) from the dashboard.
5. Wire **sending**: client domain on Resend (DKIM/SPF) or Gmail; set the editable template.
6. Add a new **instance** note above, linked from here.

## NDA
Client platforms must NOT be shown/named on a landing page. Only **FrostBite** (own demo brand) is shown — as a live iframe. Proof = aggregate stats + "built confidentially under NDA".

---

## Related
- **Owner:** [[The Niche Society]]
- **First instance:** [[Consumer Voice Platform (Wave x TNS)]] · brand [[Consumer Voice Brand]]
- **Index:** [[Projects MOC]]
- Predecessor (earlier static version): `niche-leadpages/` (heisted Polsia leads, hardcoded HTML).
