# Trust Assets & Credibility — Website FamilyLink

**Status:** Confirmed assets · 30 aprilie 2026

---

## Asset principal — Cerasela Maria Măciucă

**Profil public:**
- Co-fondator + Administrator Realitatea Sociala S.R.L. (FamilyLink)
- **Președintă** — *Asociația pentru Calitatea Vieții Persoanei Vârstnice „Academician Nicolae Cajal"*
- Speaker la Congresul Asociației Active Aging (București, nov 2025)
- Advocate public pentru reforma sistemului de îngrijire a vârstnicilor în România
- Inițiatoare a propunerii de „Centre de urgență și tranziție pentru vârstnici"
- Site asociat: **ajutorplus60.ro** (asociația Cajal)

**Citatul de impact (din presă):**
> *„În România, bătrânețea a devenit o criză...familiile nu știu ce să facă cu părinții bolnavi."* — Cerasela Maria Măciucă, presa Ultima Oră, 19.11.2025

**Sursă presă:**
[ultima-ora.ro/cerasela-maria-maciuca-presedinta-asociatiei...](https://ultima-ora.ro/cerasela-maria-maciuca-presedinta-asociatiei-pentru-calitatea-vietii-persoanei-varstnice-academician-nicolae-cajal-propune-infiintarea-unor-centre-de-urgenta-si-tranzitie-pentru-va/)

---

## Asset secundar — Membru European Ageing Network (EAN)

**Ce e EAN:**
- European Ageing Network · founded 1989
- **13,000+ furnizori de îngrijire** în **30 țări europene**
- Parte din Global Ageing Network (Washington DC) — global reach
- Parteneri: Arjo, Hartmann (industrie), Age Platform Europe, Social Services Europe
- Membri: pentru-profit, non-profit, organizații publice — full sector representation

**De ce contează pentru noi:**
- Realitatea Sociala = membră EAN → instant European-level credibility
- Putem pune badge „Membru European Ageing Network" pe homepage
- Acces la rețeaua de 13k furnizori (potențial pipeline pentru Faza 2 ComfortMap directory)
- Citație autorizată într-o industrie altfel fragmentată

**Sursă:**
[ean.care](https://ean.care/)

---

## Cum folosim aceste assets pe site (înlocuiesc logo wall lipsă)

### 1. Hero homepage — strip de trust subtle
Sub headline + CTA-uri principale, o linie discretă:
> *„Membri ai European Ageing Network · Conectați cu Asociația pentru Calitatea Vieții Persoanei Vârstnice „Acad. Nicolae Cajal""*
+ logo EAN micuț (oficial, descărcat de pe site-ul lor) + badge text al asociației

### 2. Pagina `/despre` — secțiune dedicată „Cine suntem"
- Foto Cerasela + bio profesional cu mențiunea de Președintă a asociației
- Foto Mary-Lou + bio CTO
- Citatul ei din presă cu link la articolul Ultima Oră (cu credit + dată)
- Block dedicat „Implicare în comunitatea profesională":
  - Badge „Membru European Ageing Network" cu link
  - Badge „Asociația Cajal — site partener ajutorplus60.ro" cu link
  - Mențiune: „Speaker la Congresul Active Aging Association 2025"

### 3. Pagina `/pentru-camine` — bara de credibility sub fold
Block: *„Construit de oameni care înțeleg sectorul"*
> Echipa FamilyLink este activă în comunitatea europeană de îngrijire a vârstnicilor — fondatoarea noastră, Cerasela Maria Măciucă, conduce „Asociația pentru Calitatea Vieții Persoanei Vârstnice 'Academician Nicolae Cajal'" și suntem membri ai European Ageing Network. Înțelegem nu doar tehnologia, ci și provocările reale ale unui cămin în România de astăzi.

Asta convertește masiv pentru Persona 4 (Răzvan, owner cămin) — el caută „voi cine sunteți și de ce să am încredere?"

### 4. Pagina `/pentru-familii` — citatul în context emoțional
Hero secundar sau secțiune middle-page:
> *„În România, bătrânețea a devenit o criză. Familiile nu știu ce să facă cu părinții bolnavi.* Așa și-a început prezentarea Cerasela Maciuca, fondatoarea FamilyLink, în fața Congresului Active Aging 2025. Noi credem că alternativa există — și începe cu transparență."

(Conectează problema cu soluția într-o frază)

### 5. Footer — mențiune permanentă
> *Realitatea Sociala S.R.L. · Membru European Ageing Network · În parteneriat cu Asociația „Acad. Nicolae Cajal"*

### 6. Press kit la `/press` (sau în footer)
- Logo FamilyLink download (PNG + SVG)
- Brand colors hex
- Founder bios scurte (RO + EN)
- Articole presă (link Ultima Oră ca starter)
- High-res screenshots ale produsului
- Contact PR direct

### 7. Schema markup — Organization JSON-LD enrichment
```json
{
  "@type": "Organization",
  "name": "FamilyLink",
  "founder": [
    {
      "@type": "Person",
      "name": "Cerasela Maria Măciucă",
      "jobTitle": "Co-fondator · Președintă Asociația pentru Calitatea Vieții Persoanei Vârstnice „Academician Nicolae Cajal""
    },
    {
      "@type": "Person",
      "name": "Mary-Lou Mihai",
      "jobTitle": "Co-fondator · CTO"
    }
  ],
  "memberOf": [
    {
      "@type": "Organization",
      "name": "European Ageing Network",
      "url": "https://ean.care"
    }
  ],
  "knowsAbout": ["Senior care", "Ageing services", "Long-term care", "Elder communication"]
}
```

LLM-urile (ChatGPT Browse, Perplexity) când citesc asta înțeleg automat că suntem credibili în nișă.

---

## Trust signals to-do (ce putem adăuga progresiv)

| Asset | Cum îl obținem | Prioritate |
|---|---|---|
| Logo EAN oficial (PNG/SVG) | Download de pe ean.care media kit, sau cere direct la EAN | URGENT (pentru lansare) |
| Logo Asociația Cajal | Cerasela are deja, sau de pe ajutorplus60.ro | URGENT |
| Articole presă suplimentare | Tranziția cu Ultima Oră → solicitare interviu Hotnews/digi24 elder care | Medium-term |
| Logo wall cămine | După primii 3-5 cămine pilot semnează | Faza 1 final → Faza 2 |
| Premii / certificări | EU funding for senior care startups (Horizon, Erasmus+) | Long-term |
| Studii de caz scrise | După 2-3 luni cu primele cămine | Faza 2 |
| Video testimonial | După primii cămine pilot | Faza 2 |
| ISO 27001 certification | După audit de securitate Faza 3 | Long-term |

---

## Impact pe persoanele identificate

| Persona | Cum acest trust asset îl convinge |
|---|---|
| **Mariana (Administrator)** | „Sunt parte dintr-o rețea europeană serioasă, nu un startup random" |
| **Andrei (Familie)** | „Cerasela ÎNȚELEGE problema mea — a vorbit despre asta în presă" |
| **Mary-Lou** | „Am toolkit pentru investitori — credibility e clar pe site" |
| **Răzvan (Owner)** | „Asociație + EAN + presă = serioși. Aprobăm achiziția." |

---

## Update User Research

Persona 1 (Mariana), 2 (Andrei) și 4 (Răzvan) au acum un nou trust signal pe care nu-l aveam când am scris cele 4 personas:
- **Founder credibility prin Cerasela** — substituie parțial nevoia de „logo wall"
- **EAN membership** — substituie parțial nevoia de „presa de prestigiu"
- **Citatul în presă** — substituie nevoia de „testimonial extern"

Acest trust signal **mută conversion-ul mai sus pe pâlnie** — vizitatorii ajung la decizie de „demo" sau „inquiry" mai rapid, fără să aibă nevoie să verifice extern „voi cine sunteți?"

---

## Recomandare pentru lansare

**Trebuie din partea Realitatea Sociala înainte de launch:**
- Logo oficial EAN (de la ean.care/media-kit sau email cere)
- Logo Asociația Cajal de la ajutorplus60.ro
- Foto profesional Cerasela + Mary-Lou (head & shoulders, fundal neutru)
- Confirmare scrisă că putem cita articolul din Ultima Oră (de obicei OK pentru articole publice, dar bun de confirmat)
- 2-3 alte mențiuni presă dacă mai există (le caut eu pe Google?)
