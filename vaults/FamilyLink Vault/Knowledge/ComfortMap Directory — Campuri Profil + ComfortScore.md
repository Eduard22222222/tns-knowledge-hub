# ComfortMap Directory — Câmpuri Profil + ComfortScore (Faza 2)

> **Sursă:** cerințe Eduard + Cerasela + Marylou (discuție Faza 2, 2026-05-29).
> **Extinde:** [[ComfortMap Architecture]] (profil simplu) → profil bogat „Booking/Airbnb pentru cămine".
> **Status:** spec produs — de validat detaliile min/max cu Cerasela + algoritmul ComfortScore cu Marylou.

---

## 1. Conceptul

Căminul se înscrie pe platformă și își completează un profil public bogat (ca pe Booking/Airbnb): preț, locuri libere, tipuri de cameră, specialiști, activități, mese, poze. Familiile caută, filtrează și compară. Fiecare cămin primește un **ComfortScore** (scor calculat de un algoritm) după care se face ranking-ul în căutare.

---

## 2. Câmpurile profilului (ce completează căminul)

### A. Identitate & locație
- Nume cămin, descriere (headline + text)
- Județ, oraș, adresă (→ geocodat pt hartă)
- Ore vizitare

### B. Disponibilitate & gen (stil Booking — „locuri libere")
- **Locuri totale** (capacitate)
- **Locuri libere** (actualizate de cămin — afișat „X locuri disponibile")
- **Gen acceptat:** femei / bărbați / mixt
- *(Opțional: data ultimei actualizări a disponibilității → semnal de profil „activ")*

### C. Tipuri de cameră (cu preț per tip — ca Airbnb)
Listă de camere, fiecare cu:
- **Tip:** individuală / dublă / triplă / salon
- **Preț:** RON/lună pentru tipul respectiv
- **Locuri libere** pe tipul ăsta
- **Facilități cameră:** baie proprie, balcon, TV, AC, mobilier propriu permis
- **Poze** specifice tipului de cameră

### D. Preț & ce include
- Preț „de la X RON/lună" (calculat din cel mai ieftin tip de cameră)
- Ce include prețul: cazare, mese, îngrijire, medicație, spălătorie
- Costuri extra (dacă există)

### E. Specialiști / personal (medic, psiholog etc.)
Listă de specialiști, fiecare cu:
- **Rol:** medic, asistent medical, psiholog, kinetoterapeut, ergoterapeut, asistent social, infirmier
- **Disponibilitate:** permanent (24/7) / program zilnic / la cerere / săptămânal
- *(Opțional: raport personal/rezidenți — un diferențiator puternic de calitate)*

### F. Activități (ergoterapie, fizioterapie...)
Listă de activități, fiecare cu:
- **Nume:** ergoterapie, fizioterapie, socializare, ieșiri/plimbări, terapie ocupațională, evenimente
- **Frecvență:** zilnic / de X ori pe săptămână / lunar
- **min/max** — *Cerasela dă detaliile exacte (ex: „min 2 ședințe fizio/săpt")*

### G. Mese
- Nr. mese pe zi (ex: 3 + 2 gustări)
- Tip servire: meniu fix / la alegere
- Diete speciale: diabetic, fără sare, vegetarian, mixat/pasat
- Ce e inclus în preț

### H. Poze
- Galerie generală (spații comune, exterior, grădină)
- + poze per tip de cameră (secțiunea C)
- Minim obligatoriu pentru publicare (anti-listing slab): ex. ≥3 poze

---

## 3. ComfortScore — algoritmul de ranking ⭐

### Ce e
Un scor (0–100, afișat poate ca stele/badge) calculat automat din câmpurile profilului. **Toate căminele au un ComfortScore.** Se folosește ca **sortare default** când cineva caută + afișat pe fiecare card.

### Structura (pondere × factor)
**Marylou dă ponderile + eventual factori suplimentari.** Schelet propus de noi:

| Factor | Ce măsoară | Semnal de date |
|---|---|---|
| **Personal/specialiști** | diversitate + disponibilitate (medic, psiholog, kineto) | secțiunea E |
| **Activități** | varietate + frecvență (ergo/fizio etc.) | secțiunea F |
| **Cazare** | % camere individuale, facilități camere | secțiunea C |
| **Mese** | nr. mese, diete speciale, ce e inclus | secțiunea G |
| **Transparență/completitudine** | preț afișat, poze suficiente, descriere completă | A, D, H |
| **Actualitate** | locuri libere actualizate recent = profil îngrijit | secțiunea B |
| **[Faza 3] Recenzii verificate** | feedback familii reale | viitor |

**Formula (placeholder, până Marylou dă ponderile):**
```
ComfortScore = round(100 × Σ (pondere_i × scor_normalizat_i))
unde Σ ponderi = 1.0, fiecare scor_i ∈ [0,1]
```

### Implementare tehnică
- Câmp `comfort_score` (numeric) pe profil, **recalculat la fiecare salvare** a profilului (funcție Postgres SAU calcul app-level în Server Action).
- Stocat (nu calculat la fiecare căutare) → ranking rapid, sortare simplă în query.
- **Transparență (recomandare):** un mic „De ce acest scor?" pe profil (breakdown pe factori) → încredere + îi motivează pe cămine să-și completeze profilul.
- **Anti-gaming:** factorii se bazează pe date verificabile (poze reale, câmpuri completate), nu pe auto-declarații nemăsurabile. Recenziile (Faza 3) adaugă validare externă.

### De decis cu Marylou
- Ponderile exacte per factor
- Scală: 0–100 vs 5 stele vs „A/B/C"
- Praguri minime (un cămin sub X nu apare deloc? sau apare ultimul?)
- Cât din scor e „completitudine profil" vs „calitate reală a serviciilor"

---

## 4. Impact pe modelul de date

Extinde `tenant_public_profiles` din [[ComfortMap Architecture]] + tabele copil:

```sql
-- Extindere tenant_public_profiles
ALTER TABLE tenant_public_profiles ADD COLUMN gender_policy TEXT;      -- 'women'|'men'|'mixed'
ALTER TABLE tenant_public_profiles ADD COLUMN available_spots INTEGER;
ALTER TABLE tenant_public_profiles ADD COLUMN meals JSONB;             -- {per_day, serving, diets[], included}
ALTER TABLE tenant_public_profiles ADD COLUMN price_includes TEXT[];
ALTER TABLE tenant_public_profiles ADD COLUMN comfort_score NUMERIC;   -- recalculat la save

-- Camere
CREATE TABLE room_types (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID REFERENCES tenants(id) ON DELETE CASCADE,
  kind TEXT,                 -- 'single'|'double'|'triple'|'salon'
  price_per_month INTEGER,   -- RON
  available_spots INTEGER,
  amenities TEXT[],          -- ['private_bath','balcony','tv','ac']
  photo_urls TEXT[]
);

-- Specialiști
CREATE TABLE camin_specialists (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID REFERENCES tenants(id) ON DELETE CASCADE,
  role TEXT,                 -- 'medic'|'psiholog'|'kineto'|'ergo'|'asistent'|...
  availability TEXT          -- 'permanent'|'daily'|'on_call'|'weekly'
);

-- Activități
CREATE TABLE camin_activities (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tenant_id UUID REFERENCES tenants(id) ON DELETE CASCADE,
  name TEXT,                 -- 'ergoterapie'|'fizioterapie'|'socializare'|...
  frequency TEXT             -- 'daily'|'weekly_2x'|'monthly'|...
);
```
RLS: tenant managers editează propriul cămin; citire publică server-side (ca în arhitectura existentă).

---

## 5. Lista extinsă Marylou — organizată + ce avem deja

### Experiență utilizator
| Cerință | Status |
|---|---|
| Logo + identitate vizuală | ✅ brand ComfortMap locked (v13-A) |
| Mockup-uri UX/UI toate rolurile | ⬜ de făcut (design pass) |
| Design rafinat profesionist | 🔄 în lucru (sprint mobil + navbar recent) |
| Multilingv RO + EN | ⬜ NOU — arhitectură i18n (next-intl) |

### Funcționalități noi
| Cerință | Status |
|---|---|
| Notificări push pe telefon | ⬜ NOU — PWA + Web Push (era Faza 3, urcat) |
| Galerie foto per rezident | ✅ există (/portal/galerie) |
| Mesaje interne staff↔staff | ⬜ NOU (avem familie↔staff + admin↔super; lipsește staff intern) |
| Istoric complet mesaje + activitate | ✅ parțial (mesaje + audit_log există) |

### Super-admin avansat
| Cerință | Status |
|---|---|
| Dashboard date agregate (activitate, useri, cămine) | 🔄 /platforma există, de adăugat agregări |
| Monitorizare utilizare platformă | ⬜ NOU (metrici de produs) |
| Gestionare abonamente + facturare bază | ⬜ = modulul B Stripe (Faza 2A) |

### Site prezentare
| Cerință | Status |
|---|---|
| Homepage, funcționalități, beneficii, contact | ✅ există (9 pagini live) |
| SEO de bază | 🔄 parțial; ComfortMap aduce SEO avansat |
| Conținut administrabil | ⬜ NOU (CMS light / blog editabil) |

### Tehnic avansat — **mare parte DEJA acoperit / în curs prin fix-urile de audit!**
| Cerință | Status |
|---|---|
| CI/CD pipeline complet | ✅ GATA (confirmat de audit) |
| Optimizare performanță + compresie imagini | ✅ GATA (Turbopack, ISR, Sharp + EXIF) |
| GDPR complet — export + mascare | 🔄 = fix F-03 (export/delete real) |
| API REST pt integrări — fundația ComfortMap | 🔄 = fix F-02 (api_keys real) |
| Securitate — rate limiting, protecții | 🔄 = fix-uri F-09/F-11/F-15/F-20 |
| Monitoring + alerte infrastructură | ✅ Sentry + Vercel Analytics (de adăugat alerting) |

**Observație cheie:** ~jumătate din „Tehnic avansat" al Maryloul e fie GATA, fie se rezolvă prin remedierile de audit pe care le facem oricum. Deci Faza 2 tehnică e mai mică decât pare pe hârtie.

---

## 6. De clarificat în discuții
- **Cu Cerasela:** detaliile min/max activități; ce specialiști sunt „must"; ce diete; ce intră în preț standard.
- **Cu Marylou:** algoritmul ComfortScore (ponderi + factori + scală); prioritate push vs multilingv.

## Links
- [[ComfortMap Architecture]] — arhitectura tehnică (rute, ISR, RLS, SEO, Mapbox)
- [[Faza 2 — Planning 2026-05-22]] — split 2A/2B + pricing
- [[Faza 2 — Platform Completă]] — scope complet 7 module
- [[Security Audit 2026-05-29 — Findings & Remediation]] — fix-urile care acoperă „tehnic avansat"
