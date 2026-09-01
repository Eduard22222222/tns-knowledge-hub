# CRO Audit — thenichesociety.ro
**Audit date:** 2026-05-24
**Auditor:** Eduard + Claude
**Context:** TNS Google Ads campaign primește pitches în loc de leaduri reale. Audit pe site pentru a îmbunătăți rata de conversie și calitatea leadurilor.

---

## 🔴 P0 — Critic (fix săptămâna asta)

### 1. Hero vinde TOT = vinde nimic

**Actual:**
> "Dezvoltare Web, Marketing Digital & Software Custom"
> "Creăm website-uri profesionale, aplicații mobile, campanii de marketing și soluții software personalizate. Totul într-un singur loc, alimentat de inteligență artificială."

**Probleme:**
- 4 servicii diferite în primele 2 fraze → cumpărătorul nu se identifică
- "AI-powered" generic în 2026, fără demonstrare
- Lipsește OUTCOME (rezultatul concret)
- Lipsește targetul (cui? SaaS? local biz? enterprise?)

**Fix sugerat — 3 variante de testat:**

**Varianta A (outcome-focused B2B SaaS/Startup):**
> H1: "Construim AI-Powered Web Apps care îți cresc revenue cu 30-80%"
> Sub: "Pentru SaaS, marketplace-uri și startup-uri B2B care vor să scaleze fără să angajeze o echipă internă de dezvoltare."

**Varianta B (specialist + AI):**
> H1: "Agenția care construiește produsele AI pe care competitorii tăi nu pot."
> Sub: "Web apps + integrări AI custom pentru companii care vor să devină tehnologic înainte de competiție. 200+ proiecte. Audit gratuit în 48h."

**Varianta C (specific outcome pentru ROI-driven buyers):**
> H1: "Site-uri și aplicații care nu doar arată bine — vând."
> Sub: "Construim experiențe digitale care convertesc vizitatori în clienți. Garanție de performanță sau banii înapoi."

### 2. FAKE SOCIAL PROOF WIDGET — risc mare de trust

**Actual:** popup stânga-jos cu "2 persoane vizualizează pagina", "12 persoane active acum"

**Problemă:** numerele variază aleatoriu (2/3, 8/9/11/12) și mesajele cycle artificial ("vizualizează portofoliul", "au solicitat ofertă"). Orice developer (TNS audience!) detectează imediat că-i widget fake → trust destroyed.

**Fix:**
- **Elimină widget-ul.** Sau înlocuiește cu social proof REAL: ticker cu logo-uri clienți, contor de proiecte completate (cu date verificabile), reviews Google/Trustpilot.

### 3. Inconsistență cifre = scade credibilitate

**Găsit pe site:**
- Hero: "200+ Proiecte Livrate"
- Testimoniale section: "Peste 150 de afaceri"
- "De Ce" section: "Peste 200 de proiecte"

**Fix:** alege UN număr (cel adevărat) și ține-l consistent peste tot. Dacă nu ai 200, fii sincer ("47 proiecte livrate în ultimii 2 ani" e mai credibil decât "200+" generic).

### 4. Form open = magnet de pitch-uri (confirmare problema ta)

**Fix urgent — calificare obligatorie în form:**
- Buget aproximativ proiect: `<2,000 EUR` / `2-5K` / `5-15K` / `15K+` (sliding scale)
- Tip business: SaaS / Magazin online / Servicii / Altul
- Timeline: imediat / 1-3 luni / >3 luni
- "Cum ai aflat de noi?" (dropdown)

→ Sellers nu completează BUGETUL real (de ce ți-ar zice ei?) → form valid devine self-filtering.

---

## 🟠 P1 — Important (luna asta)

### 5. Section Portfolio LIPSEȘTE — esențial pentru agency

Doar 3 testimoniale text. Lipsesc:
- Screenshot-uri site-uri/aplicații livrate
- Case studies cu cifre (înainte/după, ROI, traffic, conversii)
- Logos clienți (vizibile la fold)

**Fix:** secțiune "Lucrări recente" cu 4-6 case study cards (screenshot mare + 1 frază problemă + 1 frază soluție + 1 cifră ROI).

### 6. Adaugă BOOKING calendar (Cal.com self-hosted)

**De ce:** form e prea slow + atrage spam. Booking forțează intenție clară + filtrează pitch-uri (sellers nu pierd 30min în calendar booking).

**Plan tehnic:**
1. Cal.com self-hosted pe `book.thenichesociety.ro` (Vercel/Netlify, gratuit)
2. Tipuri meeting: "Audit Gratuit 30min", "Discovery Call 45min", "Project Scoping 60min"
3. Embed widget pe homepage hero + page Contact + Thank-you page
4. Conectat direct la Google Calendar Eduard
5. Notificare WhatsApp/Email când cineva bookuiește
6. **Trigger Google Ads conversion** când booking finalizat (asta REZOLVĂ tracking-ul broken)

**Bonus:** documentezi setup-ul ca **case study TNS** + îl vinzi ca serviciu (Cal.com setup pentru agenții = 800-1500 EUR/proiect)

### 7. Risk reversal lipsește

Nu există nicăieri pe site:
- Garanție de satisfacție
- Money-back perioadă
- Free trial sau prototip gratuit

**Fix:** adaugă în hero + footer:
> "Garanție de satisfacție 30 zile. Dacă nu-ți place strategia după primul deliverable, returnăm avansul."

### 8. CTA-urile sunt repetitive (toate sunt "Consultație")

Lipsește **micro-conversion** = pas mic, comitment scăzut.

**Fix:** adaugă în hero un al doilea CTA:
- "Audit gratuit Google Ads (valoare 500 EUR)" → form scurt (3 câmpuri) → primește PDF analiză + recomandări
- ALSO: "Descarcă ghidul: 7 erori care îți cresc CAC" → email opt-in

Asta creează **lead pipeline** (cold → educat → hot) în loc de "0 sau 1" (vizitator sau form-submit).

---

## 🟢 P2 — Nice-to-have

### 9. Pricing transparency (parțială)

Nu trebuie tarife exacte, dar ranges ajută calificarea:
- "Website prezentare: de la 1,500 EUR"
- "Magazin online: 2,500 - 8,000 EUR"
- "Aplicație mobilă: 8K - 30K EUR"
- "Custom AI integration: din 5,000 EUR + retainer"

Frica e că "alungi clienți" — realitatea: alungi NUMAI cei prea săraci pentru tine. Restul intră pre-calificați.

### 10. Speed/Mobile test

Rulează Lighthouse pe homepage. Sub 85 score = pierzi bani pe ads (Quality Score scade, CPC crește). Dacă < 85:
- Lazy load imagini
- Defer JavaScript non-critical
- Comprimă fonts, evită webfont blocking

### 11. Demo live AI

Susții "AI-Powered" — show, don't tell:
- Chatbot live pe site care răspunde întrebări vizitatori
- Demo: "Generează headline pentru afacerea ta" widget
- Calculator ROI "Cât te-ar costa proiectul tău?" cu AI

### 12. Pivot Pozițional pentru ads

Datele din TNS campaign arată că AG "Aplicații Mobile & AI Systems" are CTR 13.64% și CPA 17 RON (cel mai mic). Pivotează FOCUS-ul site-ului spre **AI + Apps** ca specializare principală, dezvoltare web ca secundar.

**New positioning sugerat:** "AI-Native Software & Web Development pentru companii care nu se mulțumesc cu basic."

---

## 🚀 Plan de execuție recomandat (în ordine)

| Săpt. | Task | Timp estimat | Impact |
|---|---|---|---|
| 1 | Elimină fake social widget | 5 min | 🔴 Trust crește |
| 1 | Calificare în form (buget+tip+timeline) | 30 min | 🔴 Pitch-uri scad 70%+ |
| 1 | Fix cifre inconsistente (alege 200) | 5 min | 🟠 Trust |
| 2 | Cal.com self-hosted + embed booking | 4-6 ore | 🔴 Conversion +50%+ |
| 2 | Hero rewrite (A/B test 2 variante) | 2 ore | 🔴 CTR ads + bounce |
| 3 | Section Portfolio cu 6 case studies | 1-2 zile | 🟠 Closer rate |
| 3 | Lead magnet PDF (ghidul 7 erori) | 1 zi | 🟠 Pipeline mid-funnel |
| 4 | Risk reversal + pricing ranges | 30 min | 🟢 Calificare |
| 4 | Lighthouse fix dacă <85 | 2-4 ore | 🟢 Quality Score |
| Ongoing | AI demo widget live | 2-3 zile | 🟢 Differentiator |

---

## TL;DR

**3 cele mai importante fix-uri imediate:**

1. **Elimină widget-ul fake "X persoane active"** — distruge trust la audience-ul tău tech-savvy
2. **Calificare în form** (buget + tip + timeline) — filtrează pitch-urile NATURAL
3. **Cal.com booking system** — micro-conversion superioară form-ului + tracking corect Google Ads + showcase-able ca serviciu TNS

**Pivot strategic:** datele din Google Ads arată că audience-ul HOT pentru TNS este **AI & Apps**, nu marketing/SEO. Site-ul ar trebui să-și mute centrul de gravitație acolo.
