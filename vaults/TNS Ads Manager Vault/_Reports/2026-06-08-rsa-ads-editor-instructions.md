# Cum aplici RSA improvements via Google Ads Editor (no API, no token, no CAPTCHA)

## Pasul 1 — Instalează Google Ads Editor (5 min, gratuit)

Download: https://ads.google.com/intl/ro/home/tools/ads-editor/

- Windows / macOS desktop app
- Login normal cu **office@thenichesociety.ro** (același cu Ads UI)
- Nu cere MCC, nu cere dev token, nu cere Cloud project

## Pasul 2 — Deschide contul 461-423-2219

În Ads Editor:
1. File → Open
2. Selectează account-ul **461-423-2219 - office@thenichesociety.ro**
3. Click "Get recent changes" sau "Download" — toate campaniile se descarcă local

## Pasul 3 — Import CSV-ul cu noile RSA

CSV-ul este la: `_Reports/2026-06-08-rsa-ads-editor-import.csv`

În Ads Editor:
1. Account → **Import** → "From file..."
2. Selectează CSV-ul de mai sus
3. În dialog: lasă default options (Match columns automatic)
4. Click **Process**
5. Editor va arăta preview: 6 noi RSA-uri urmează să fie create (una per ad group, pe lângă RSA-urile existente)
6. Review changes → toate verde = OK
7. Click **Post** (sus dreapta) → modificările ajung live în Google Ads

## Pasul 4 — Verifică Opt Score

După 5-10 minute, intră în ads.google.com → Recommendations:
- Optimization Score ar trebui să fi crescut de la 70.9% la ~74-75%
- "Improve responsive search ads" recommendation ar trebui să fie satisfied (eligible recommendation count scade)

## De ce această abordare creează RSA-uri noi (nu modifică existing)

Strategy intentionally: păstrăm RSA-urile actuale care livrează performant, adăugăm RSA-uri noi cu copy diferentiat (4P / PAS / Star-Story / AIDA / BAB frameworks). Google va distribui afișările între toate RSA-urile active și va promova natural pe cele cu ad strength mai bun.

Riscul mutării direct pe RSA-urile existente = pierdere de istoric de learning. Riscul adăugării de RSA nou = zero (Google A/B-tests automat).

## Troubleshooting

**"Ad group not found"** la import: verifică numele exact al ad group-ului în Ads Editor. Posibile variații:
- "Aplicații Mobile & AI Systems" vs "Aplicatii Mobile & AI Systems" (cu/fără diacritice)
- "Masaj Terapeutic & Deep Tissue" vs "Masaj Terapeutic and Deep Tissue"

Open ad group în Editor manual, copy-paste numele EXACT în CSV, retry import.

**"Headline too long"** la post: niciun headline din draft nu depășește 30 chars, dar verifică în UI cu un decimal point și un emoji adăugat accidentat.

**"Final URL not allowed by campaign"** : URL-urile au fost setate pe slug-uri specifice (`/servicii/masaj-anticelulitic`, etc.). Dacă slug-ul nu există încă pe site, schimbă cu `https://goamasaj.ro/` (homepage) sau `https://thenichesociety.ro/` la TNS.
