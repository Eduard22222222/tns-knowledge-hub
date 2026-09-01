# Voice & Tone — FamilyLink

## Voice (cum suntem mereu, indiferent de context)

| Ce SUNTEM | Ce NU SUNTEM |
|---|---|
| Calm și clar | Birocratic, sec, formal-inutil |
| Caldi fără exces | Sentimentali, kitschy, „pup-pup-pup" |
| Respectuoși cu vârstnicii | Patronizatori, „pentru bătrânei" |
| Profesionali | Reci, clinici, medical |
| Direcți | Vagi, defensivi, „acolo, la capitolul respectiv..." |
| Umani | Robotic-corporate „valued customer" |

## Tone (variază după context)

| Context | Tone | Exemplu |
|---|---|---|
| **Mesaj de bun venit** la familie | Caldă, calmă, primitoare | *„Bun venit, Maria. De acum ești la doar un click distanță de bunica ta."* |
| **Notificare update zilnic** | Calm-direct, factual cu blândețe | *„Marți, 13 mai. Bunica Elena a luat masa, a făcut o plimbare și a primit câteva felicitări la rebusul de azi. ☕ 3 fotografii noi."* |
| **Email rapport săptămânal** | Editorial, ca o scrisoare | *„Săptămâna care a trecut a fost una bună pentru bunicul tău. Iată ce s-a întâmplat..."* |
| **UI text staff** (butoane, formulare) | Direct, scurt | *„Adaugă rezident", „Trimite mesaj", „Salvează"* |
| **Email tehnic** (reset parolă) | Profesional, clar | *„Pentru a-ți reseta parola, accesează link-ul de mai jos. Expiră în 1 oră."* |
| **Mesaj de eroare** | Empatic, util | *„Ceva nu a mers cum trebuie. Încearcă din nou peste un moment, sau scrie-ne dacă persistă."* |
| **Pitch B2B (cămin)** | Profesional, direct, fără jargon | *„FamilyLink ajută echipa căminului să țină familiile aproape, fără să adauge muncă în plus."* |

## Reguli de scriere

### General
1. **Persoana a doua singular** (tu) pentru familii — apropiere
2. **Persoana a doua plural** (dumneavoastră) pentru staff cămin în contexte formale
3. **Active voice** mereu („Cămin a trimis o fotografie" NU „O fotografie a fost trimisă de cămin")
4. **Propoziții scurte** — max 15-20 cuvinte. Mai mult = simplificăm.
5. **Sentence case** pentru titluri și butoane (NU All Caps inutile)

### Pentru staff cămin
- Funcțional, scurt, fără emoție în UI
- Verbe de acțiune clare: „Adaugă", „Trimite", „Salvează", „Arhivează"
- NICIODATĂ jargon tech: NU „upload", DA „adaugă fotografie"
- NICIODATĂ jargon corporate: NU „onboarding", DA „adăugare cămin nou"

### Pentru familii
- Mai personal, dar nu invaziv
- Folosim numele rezidentului când e posibil
- Detalii concrete > abstract: „Bunicul a luat masa la 13:00" > „Bunicul are starea OK"
- Evităm voce robotică: NU „update detected", DA „un nou moment"

### Pentru cămine (pitch B2B)
- ROI-driven: „economisești 2h/săptămână cu telefonul către familii"
- Beneficii concrete > features: „familiile mulțumite plătesc la timp" > „platformă multi-tenant"
- Date sociale: cite număr de cămine, satisfacția familiilor

## Vocabular standard (glosar de termeni preferați)

| În loc de... | Folosim... | De ce |
|---|---|---|
| User | Utilizator / membru / familie / staff | „User" e tech-rece |
| Customer | Cămin (B2B) / Familie (B2C) | Specific, uman |
| Onboarding | Înregistrare / configurare cont | Fără jargon |
| Update | Moment / actualizare | „Update" e tech, „moment" e uman |
| Post / status | Fotografie + descriere / însemnare | Specific contextul |
| Notification | Notificare / mesaj | OK ambele, dar „mesaj" mai uman |
| Account | Cont | Standard |
| Settings | Setări | Standard |
| Dashboard | Panou / panoul căminului | Cu specificație |
| Multi-tenant | (NU folosim public) | Tech jargon, B2B intern only |
| GDPR-compliant | Date protejate / siguranță date | Pentru audiențe non-tech |
| AI / artificial intelligence | (Evităm public, e overused) | Doar dacă e relevant |

## Lungimi standard

| Element | Lungime țintă |
|---|---|
| Subiect email | 40-60 caractere |
| Preview text email | 80-120 caractere |
| Notificare push (Faza 2) | 25-50 caractere |
| Heading H1 | 3-7 cuvinte |
| Heading H2 | 4-9 cuvinte |
| Paragraf body | 2-5 propoziții |
| Buton CTA | 1-3 cuvinte |
| Microcopy (helper text) | 5-15 cuvinte |

## Diacritice — REGULĂ ABSOLUTĂ

**Folosim diacritice românești complete în TOATĂ comunicarea publică și în UI.**

- ă, â, î, ș, ț (cu virgulă, NU cu sedilă)
- NICIODATĂ scris fără diacritice (parecă scrisoare grăbită SMS)
- Dezvoltatorii setează `lang="ro"` pe `<html>` + verifică encoding UTF-8 peste tot

## Exemple aplicate

### Email — invitație familie

**Subiect:** Bunica Elena te-a invitat pe FamilyLink

**Body:**
> Bună, Maria.
>
> Bunica Elena de la Căminul Casa Senectuții te-a invitat să te alături platformei FamilyLink, unde poți vedea zilnic poze, mesaje și momente din viața ei.
>
> Apasă butonul de mai jos pentru a-ți crea contul. Link-ul expiră în 24 de ore.
>
> [Intră în portalul familiei]
>
> Cu drag,
> Echipa FamilyLink

### Notificare update nou (email)

**Subiect:** Bunica Elena are un moment nou pentru tine

**Body:**
> Bună, Maria.
>
> Astăzi la 14:30, personalul căminului a adăugat un moment nou despre bunica Elena.
>
> *„Doamna Elena a participat la atelierul de pictură de azi. A făcut o frumoasă natură moartă cu flori. Vă atașăm 3 fotografii."*
>
> [Vezi momentul în portalul familiei]

### UI — buton de eroare, formular invalid

> *„Vă rugăm să completați numele rezidentului."*
>
> NU: „Required field. Field 'name' is empty."

### Landing page — hero copy

> # Cu tine, în fiecare zi.
>
> ## FamilyLink este podul digital care păstrează prezența zilnică a celor dragi din cămin în viața familiei lor.
>
> Pentru cămine moderne care țin la oamenii pe care îi îngrijesc.
>
> [Văd cum funcționează →]

### Copy împotriva: ce să NU scriem

❌ *„Our cutting-edge AI-powered platform leverages multi-tenant architecture to facilitate seamless inter-stakeholder communication"*

✅ *„Cămin și familie, conectate zilnic prin câteva fotografii și un mesaj scurt."*

---

❌ *„Pentru bătrânei și familiile lor"*

✅ *„Pentru cei dragi, indiferent unde sunt"*

---

❌ *„URGENT! Apasă AICI pentru a vedea ULTIMUL update!!!"*

✅ *„Ai un moment nou de la cămin. Vezi-l când ai timp."*
