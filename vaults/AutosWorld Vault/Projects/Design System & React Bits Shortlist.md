---
tags: [project, design, frontend, react-bits, autosworld, theme]
status: design-concept
created: 2026-07-08
---

# Auto'sWorld — Design System & React Bits Shortlist

> Directivele lui Eduard: design **100% propriu** (nu template), frontend **exquisite + dinamic + easy to go through**, să creeze **engagement** și să țină userul pe site. Întâi scheletul, apoi importul produselor (curat de client). Deploy doar când e totul gata.

## 🎨 Conceptul: „The Collector's Showroom"
Magazinul actual arată ca un depozit aglomerat. Noul site = **showroom-ul unui colecționar**: întunecat, premium, mașinile (machetele) sunt vedetele — lumina cade pe metal. Diecast = metal turnat, vopsea lucioasă, vitrine — designul împrumută exact materialele astea.

### Paleta („garage at night")
| Token | Hex | Rol |
|---|---|---|
| `--asphalt` | #101216 | fundal principal (near-black albăstrui, nu negru pur) |
| `--panel` | #1A1E24 | carduri/panouri (vitrina) |
| `--chrome` | #C9CDD4 | text principal (argintiu-metalic, nu alb pur) |
| `--racing-red` | #E63946 | accent UNIC — CTA, preț, badge „Ediție limitată" |
| `--tacho-amber` | #F4A261 | semantic secundar (stoc redus, rating) — folosit rar |
| `--pit-green` | #2A9D8F | semantic pozitiv (în stoc, comandă confirmată) |

Light mode NU — magazinele de colecție premium (Hot Wheels RLC, Mini GT) sunt dark; produsele foto pe fundal închis ies spectaculos.

### Tipografie
- **Display:** o condensată tip motorsport (ex. „Archivo Expanded/Condensed" sau „Saira Condensed") — numere de scară mari „1:18" ca element grafic
- **Body:** „Inter"-free zone → **Outfit** sau **Manrope** (curat, geometric)
- **Data/prețuri:** tabular-nums, mono-ish pt SKU
- Scările (1:8 … 1:72) devin **sistem vizual**: badge-uri tipografice mari, filtrare vizuală

### Layout
Grid de „vitrine" — carduri produs pe fundal panel cu glare metalic la hover; navigare pe categorii cu imagini mari; homepage = hero cinematic → branduri → colecții pe scară → noutăți → ediții limitate.

---

## ⚡ React Bits — Shortlist curat (nu tot ce mișcă, doar ce servește)

### Hero (momentul de „wow" — UNUL singur, nu 5)
| Componentă | Unde | De ce |
|---|---|---|
| **Hyperspeed** | fundal hero homepage | trail-uri de lumini de autostradă — **tematic perfect pentru auto**, creează instant atmosfera |
| **Split Text / Blur Text** | headline hero | intrare cinematică a titlului |
| **Count Up** | stats bar sub hero | „8.000+ machete · 27.000 colecționari · din 2014" — credibilitate animată |

### Produse & galerii (engagement pe catalog)
| Componentă | Unde | De ce |
|---|---|---|
| **Tilted Card** | cardurile de produs | tilt 3D la hover — simți că „iei macheta în mână" |
| **Glare Hover** | imaginile produselor | reflexie de lumină pe metal — fix senzația de diecast lucios |
| **Rolling Gallery** | secțiunea „Ediții limitate" | carusel 3D rotativ — vitrina rotativă de colecționar |
| **Circular Gallery / Dome Gallery** | landing colecții (ex. „Mașini de Legendă RO") | browsing imersiv al unei serii |
| **Spotlight Card** | carduri categorie | lumina urmărește cursorul — showroom feel |
| **Masonry** | pagina de inspirație/blog | layout dinamic |

### Navigare & structură (easy to go through)
| Componentă | Unde | De ce |
|---|---|---|
| **Logo Loop** | banda de branduri (DeAgostini, Solido, IXO, Mini GT, Eaglemoss…) | marquee infinit — social proof instant |
| **Gooey Nav / Pill Nav** | navigarea pe scări (1:8→1:72) | filtrarea pe scară devine joc, nu chore |
| **Dock** | bară mobilă jos (Acasă/Căutare/Coș/Cont) | UX de aplicație pe mobil |
| **Flowing Menu** | mega-menu categorii | tranziții fluide |
| **Stepper** | checkout | pași clari = mai puțin abandon |
| **Elastic Slider** | filtrul de preț | micro-delight la filtrare |

### Micro-interacțiuni (peste tot, subtile)
| Componentă | Unde |
|---|---|
| **Click Spark** | feedback la adăugare în coș |
| **Magnet** | butoanele CTA |
| **Animated List / Scroll Reveal** | intrarea secțiunilor la scroll |
| **Star Border** | badge „Ediție limitată" |

### ❌ Respinse deliberat (arată bine pe landing-uri, strică un magazin)
Splash Cursor, Blob Cursor, Ballpit, Balatro, Letter Glitch, Fuzzy/Glitch Text, ASCII — prea zgomotoase pt e-commerce; cursorul custom pe un shop = frustrare la click pe produse.

---

## 🔧 Integrarea tehnică (React Bits în temă WordPress)
React Bits = React-only; tema = WP FSE (PHP). Soluția: **React islands**:
1. WP are deja React (`wp-element`) — îl folosim, nu încărcăm alt runtime.
2. Fiecare efect = un bundle mic montat pe un `<div data-island="hyperspeed">` din temă (Vite build, esbuild).
3. **Lazy-load disciplinat:** doar hero-ul se încarcă eager; restul pe IntersectionObserver.
4. Efectele text/hover simple = **portate în CSS/vanilla JS** (fără React) — mai ieftin la runtime.
5. `prefers-reduced-motion` respectat global; pe mobil, Hyperspeed → gradient static (LCP!).
6. Budget de performanță: hero ≤ 1 efect WebGL; LCP < 2,5s; catalogul (8k produse) NU primește efecte grele per-card, doar CSS.

## Ordinea de build (per directivele Eduard)
1. **Schelet** — temă custom + design system + pagini cheie (home, categorie, produs, coș, checkout) cu produse demo
2. Demo la Eduard/client → green-light pe design
3. **Import produse** — DOAR selecția aleasă de client (nu toate cele 8.398)
4. Integrări (LibraPay, facturare, Easybox, EasySales, email plugin)
5. SEO 301 + testare → **deploy abia când totul e gata** (OpenCart rămâne live până atunci)
