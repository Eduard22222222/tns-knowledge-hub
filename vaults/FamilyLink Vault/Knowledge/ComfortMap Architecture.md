# ComfortMap — Arhitectură Tehnică (Modul A, Faza 2)

> **Scop:** plan tehnic concret pentru directory-ul public ComfortMap.
> **Status:** design — gata de build când Faza 2A e semnată.
> **Estimare:** 2.5 săptămâni (modulul A din Faza 2).

---

## 1. Ce e ComfortMap

Directory public de cămine de îngrijire — „Booking.com pentru cămine". Pagini SEO-optimizate, indexabile Google, prin care familiile descoperă cămine și cer ofertă.

**Diferențiator iCamin:** ei au un „director cămine" static din date publice MS Muncii. ComfortMap = marketplace real cu profil dinamic, editat de fiecare cămin.

**Conexiunea cu produsul:** căminele listate care sunt deja tenant FamilyLink primesc un badge de încredere „Comunicare cu familia prin FamilyLink ✓" — cross-sell organic.

---

## 2. Rute & rendering

### Structura de rute (public, în afara `(staff)` / `(family)`)

```
/camine                          → index: search + filtre + listă + map
/camine/[judet]                  → landing per județ (SEO: "cămine bătrâni Brașov")
/camine/[judet]/[slug]           → profil individual cămin
```

### Strategie de rendering — ISR (Incremental Static Regeneration)

Paginile ComfortMap sunt **publice + SEO-critice** → trebuie statice și rapide.

- `/camine/[judet]/[slug]` — `generateStaticParams()` pre-generează profilurile publicate; `revalidate` la edit (când căminul salvează profilul → `revalidatePath`)
- `/camine` + `/camine/[judet]` — ISR cu `revalidate: 3600` (refresh orar)
- Avantaj: LCP rapid (HTML pre-generat), SEO perfect, cost compute minim

**De ce NU SSR pur:** fiecare crawl Google ar lovi DB-ul. ISR servește HTML static + revalidează în background.

---

## 3. Model de date

### Decizie: tabel separat `tenant_public_profiles` (NU extindere `tenants`)

`tenants` conține date operaționale + sensibile (CUI, billing, contact intern). Profilul public e o entitate distinctă cu lifecycle diferit (publish/unpublish) și expunere diferită. Izolat curat.

```sql
-- Migration 00XX_comfortmap_profiles.sql
CREATE TABLE tenant_public_profiles (
  tenant_id        UUID PRIMARY KEY REFERENCES tenants(id) ON DELETE CASCADE,
  is_published     BOOLEAN NOT NULL DEFAULT false,
  headline         TEXT,              -- "Cămin cu grădină, lângă Brașov"
  description      TEXT,              -- max ~2000 char, plain text
  facilities       TEXT[] DEFAULT '{}', -- ['gradina','kinetoterapie','meniu_diabetic',...]
  photo_urls       TEXT[] DEFAULT '{}', -- max 10, Supabase Storage
  price_from       INTEGER,           -- RON/lună, display "de la X RON"
  capacity         INTEGER,           -- locuri totale
  visiting_hours   TEXT,              -- "Zilnic 10:00–19:00"
  latitude         DOUBLE PRECISION,  -- geocodat la save
  longitude        DOUBLE PRECISION,
  published_at     TIMESTAMPTZ,
  updated_at       TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_public_profiles_published
  ON tenant_public_profiles(is_published) WHERE is_published = true;
```

Județ / oraș / adresă vin din `tenants` (există deja) — JOIN la fetch.

### Facilities — set controlat

Listă enum-like în cod (nu free-text), pentru filtrare consistentă + iconițe:
```
gradina · kinetoterapie · meniu_diabetic · camere_single · supraveghere_24h
· asistenta_medicala · activitati_sociale · transport · capela · animale_permise
```

### RLS

```sql
ALTER TABLE tenant_public_profiles ENABLE ROW LEVEL SECURITY;

-- Tenant managers editează propriul profil
CREATE POLICY tpp_manager_write ON tenant_public_profiles
  FOR ALL TO public
  USING (is_super_admin() OR is_tenant_manager(tenant_id))
  WITH CHECK (is_super_admin() OR is_tenant_manager(tenant_id));
```

**Citirea publică NU trece prin RLS anon.** Paginile ComfortMap sunt server-rendered — server-ul query-ește cu admin client (service_role), filtrează `is_published = true` și expune DOAR câmpuri safe. „Public" = HTML-ul randat e public; accesul la DB rămâne server-side privilegiat. Zero risc de leak prin RLS misconfig.

---

## 4. Componente UI

### `/camine` — index directory

```
┌─────────────────────────────────────────────┐
│  Hero: "Găsește căminul potrivit"            │
│  [ Caută după oraș sau județ ▾ ]             │
├──────────────┬──────────────────────────────┤
│ FILTRE       │  [ Listă ] [ Hartă ]  toggle │
│ ─ Județ      │  ┌────────┐ ┌────────┐       │
│ ─ Preț (RON) │  │ card   │ │ card   │       │
│ ─ Capacitate │  │ cămin  │ │ cămin  │       │
│ ─ Facilități │  └────────┘ └────────┘       │
│ ─ Distanță   │  ...                          │
└──────────────┴──────────────────────────────┘
```

Card cămin: foto cover, nume, oraș, „de la X RON/lună", capacitate, 3 iconițe facilități, badge FamilyLink dacă e tenant.

### `/camine/[judet]/[slug]` — profil cămin

- Galerie foto (max 10, `next/image` optimizat, lightbox)
- Nume + locație + hartă embedded (Mapbox)
- Descriere
- Grid facilități cu iconițe
- Preț + capacitate + ore vizitare
- CTA „Cere ofertă" → form → `family_inquiries`
- Badge „Comunicare prin FamilyLink ✓" (dacă tenant activ)
- JSON-LD schema.org `MedicalBusiness`

### Filtre

Pentru < 100 cămine: fetch toate profilurile publicate + filtrare client-side (instant, zero round-trips). La scale > 100: muta filtrarea în server component cu query params (pattern deja folosit pe `/caminul/rezidenti`).

### Compare side-by-side

State client, max 3 cămine, checkbox „Compară" pe card → drawer/pagină cu tabel comparativ. Zero backend.

---

## 5. Hartă — Mapbox (recomandat vs Google Maps)

| Criteriu | Mapbox GL JS | Google Maps |
|---|---|---|
| Free tier | 50k loads/lună | $200 credit (~28k loads) |
| DX / customizare | Excelent | OK |
| Stil brand | Custom complet | Limitat |
| **Recomandare** | **✓ Mapbox** | — |

**Geocoding:** la salvarea profilului (modul C), adresa → lat/lng prin Mapbox Geocoding API (sau Nominatim/OSM gratuit). Stocat în `tenant_public_profiles`. Harta citește coordonate, nu re-geocodează la fiecare load.

**Subprocessor nou:** Mapbox → adăugat în lista GDPR (parte din „GDPR light" 2A).

---

## 6. SEO — esența modulului

ComfortMap fără SEO = oraș-fantomă. Checklist obligatoriu:

- **`sitemap.xml` dinamic** — listează toate profilurile publicate + paginile județ; regenerat la ISR
- **`metadata` per pagină** — title („Cămin [Nume] — [Oraș] | ComfortMap"), description, canonical
- **OG image per cămin** — `opengraph-image.tsx` cu foto cover + nume (share pe WhatsApp/Facebook arată frumos)
- **JSON-LD `MedicalBusiness`** — rich snippets Google (rating, adresă, preț)
- **Landing pe județ** — `/camine/[judet]` target keyword „cămine bătrâni [județ]"
- **LCP rapid** — `next/image` pe galerii, ISR static HTML
- **Internal linking** — index → județ → profil; profil → cămine similare din județ

---

## 7. Captură lead — „Cere ofertă"

Form pe profilul căminului → tabela `family_inquiries` (există deja, cu `/api/v1/family-inquiries`).

Câmpuri: nume, telefon, email, mesaj, `tenant_id` (căminul vizat). Familia primește confirmare email; căminul/super-admin vede lead-ul în `/platforma/leads` (există deja).

**Anti-spam:** honeypot + rate-limit (pattern din `/api/v1/contact`).

---

## 8. Modulul C (Tenant Public Profile) — cuplat cu A

Modulul A **afișează**, modulul C **editează**. Se construiesc împreună:

`/caminul/profil-public` (staff, admin-only):
- Form: headline, descriere, facilități (checkboxes), preț, capacitate, ore vizitare
- Upload foto (max 10) → Supabase Storage bucket `comfortmap-photos`
- Toggle „Publicat în ComfortMap"
- **Validare anti-listing-slab:** publish blocat dacă lipsesc minime (≥1 foto, descriere ≥100 char, preț, capacitate)
- Preview live înainte de save
- La save → geocoding adresă + `revalidatePath('/camine/[judet]/[slug]')`

**Ordine de build:** întâi schema + modulul C (editare) ca să existe date → apoi modulul A (afișare) citește date reale, nu mockup.

---

## 9. Plan de build — 2.5 săptămâni

```
Săpt 1.0–1.2:  Migration tenant_public_profiles + RLS
               Modul C: form editare /caminul/profil-public + upload foto
               → poți crea un profil real de test

Săpt 1.2–1.8:  Modul A: /camine index + /camine/[judet]/[slug]
               Card-uri, galerie, layout, date reale din C
               Filtre (județ, preț, capacitate, facilități) client-side

Săpt 1.8–2.2:  Mapbox: geocoding la save + hartă pe index + embed pe profil
               Compare side-by-side

Săpt 2.2–2.5:  SEO: sitemap dinamic, metadata, JSON-LD, OG images
               „Cere ofertă" wiring → family_inquiries
               Badge FamilyLink + polish + verificare live
```

---

## 10. Riscuri tehnice

| Risc | Mitigare |
|---|---|
| Geocoding eșuează pe adrese vagi | Fallback: pin manual pe hartă în modul C |
| Cămine publică profiluri slabe (1 poză blur) | Validare pre-publish + minime obligatorii |
| Mapbox depășește free tier la scale | 50k loads/lună acoperă mult; alertă la 80% |
| SEO lent să indexeze | Normal — 2-8 săpt; submit sitemap în Search Console la lansare |
| Imagini mari → LCP slab | `next/image` + limită 10 foto + resize la upload |

---

## 11. Subprocessori noi (pentru GDPR light 2A)

| Subprocesor | Scop | Date expuse |
|---|---|---|
| Mapbox | Geocoding + hartă | Adrese cămine (date publice, NU date personale) |
| Stripe | Billing (modul B) | Date facturare cămin (nu rezidenți) |

Niciunul nu atinge date de sănătate → 2A rămâne risc GDPR scăzut. Update simplu la [[Subprocessors GDPR Audit]].

---

## Links

- [[Faza 2 — Planning 2026-05-22]] — context strategic + split 2A/2B
- [[Faza 2 — Platform Completă]] — scope complet 7 module
- [[Architecture Decisions]] — decizii multi-tenant + RLS
