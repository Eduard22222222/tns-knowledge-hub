---
title: Onboarding Cămin Nou — Ghid Super-Admin
type: runbook
audience: Super-admin (Realitatea Sociala)
product: ComfortMap
status: livrabil — criteriu de acceptare Faza 1
updated: 2026-05-18
---

# Onboarding cămin nou — ghid super-admin

> **Scopul documentului.** După ce parcurgi acest ghid, poți crea singură un
> cămin nou în ComfortMap, de la zero până la momentul în care administratorul
> căminului are acces în dashboard — **fără asistență tehnică**. Toți pașii se
> fac din interfață, în browser. Nu există scripturi de rulat, nu trebuie să
> ceri nimic echipei tehnice.

> **Pentru cine.** Tu, ca super-admin Realitatea Sociala
> (`marylou@realitateasociala.ro`). Doar contul de super-admin poate crea
> cămine.

> **Cât durează.** ~3 minute per cămin (formular + invitație admin automată).

---

## 0. De ce ai nevoie înainte să începi

Adună datele căminului **înainte** să deschizi formularul (le ceri căminului
prin email/telefon). Toate sunt obligatorii, mai puțin secțiunea „Admin cămin":

| Dată | Exemplu | Notă |
|---|---|---|
| Denumire legală | `Casa Bunicilor Fericiți SRL` | Numele din actele firmei |
| Nume public | `Casa Bunicilor Fericiți` | Cum apare în aplicație |
| Slug | `casa-bunicilor-fericiti` | Vezi regulile la pasul 4 — **cea mai frecventă greșeală** |
| CUI | `RO38291746` sau `38291746` | Codul fiscal |
| Email contact | `contact@casabunicilor.ro` | Emailul oficial al căminului |
| Telefon contact | `+40256123456` | Format internațional, vezi pasul 4 |
| Adresă | `Str. Salcâmilor nr. 12` | Strada și numărul |
| Oraș | `Timișoara` | |
| Județ | `Timiș` | |
| Cod poștal | `300123` | |
| Pachet | `T1` / `T2` / `T3` / `T4` | După numărul de rezidenți — vezi tabelul de mai jos |
| **(opțional)** Nume admin cămin | `Mariana Ionescu` | Persoana care administrează căminul |
| **(opțional)** Email admin cămin | `mariana@casabunicilor.ro` | Dacă îl completezi, primește **automat** link de acces |
| **(opțional)** Telefon admin | `+40721000111` | |

**Alegerea pachetului (după numărul de rezidenți ai căminului):**

| Pachet | Rezidenți | Preț |
|---|---|---|
| T1 | 0–50 | 150 EUR / lună |
| T2 | 50–100 | 250 EUR / lună |
| T3 | 100–200 | 350 EUR / lună |
| T4 | 200+ | 450 EUR / lună |

> Pachetul se poate schimba ulterior — nu e o decizie blocantă. La creare,
> căminul intră oricum în **perioadă de trial 30 de zile** (fără facturare în
> acest interval).

---

## 1. Intră în contul de super-admin

1. Deschide **https://comfortmap.ro/login** în browser.
2. Autentifică-te cu contul tău de super-admin:
   - **Cu parolă:** tab „Cu parolă" → email + parolă → *Intră în cont*.
   - **Sau magic link:** tab „Magic link" → email → *Trimite-mi link*. Primești
     pe email un buton „Intră în cont"; îl apeși și ești logată automat, fără
     parolă. (Linkul e valabil 1 oră, se folosește o singură dată.)
3. După login ajungi pe **`/platforma`** (panoul de super-admin). Dacă vezi în
   stânga meniul cu *Acasă · Lead-uri · Cămine · Utilizatori · Audit ·
   Facturare · Setări*, ești pe contul corect.

> Dacă **nu** ajungi pe `/platforma` (de ex. ajungi pe `/caminul` sau
> `/portal`), nu ești pe contul de super-admin. Deconectează-te și intră cu
> `marylou@realitateasociala.ro`.

---

## 2. Mergi la lista de cămine

În meniul din stânga, apasă **„Cămine"** (`/platforma/camine`).

Aici vezi toate căminele existente, cu status (Active / Trial / Suspendate /
Arhivate), număr de rezidenți și utilizatori. Poți căuta după nume, CUI sau
oraș.

---

## 3. Deschide formularul „Onboardează cămin"

În colțul din dreapta-sus al paginii „Cămine", apasă butonul
**„Onboardează cămin"**.

Ajungi pe formularul de creare (`/platforma/camine/nou`).

---

## 4. Completează formularul

Formularul are **două secțiuni**: *Date cămin* (obligatorii) și
*Admin cămin* (opțional, dar recomandat).

### 4.1 Date cămin — reguli exacte pe câmpuri

Respectă formatele de mai jos **exact**. Dacă un câmp e greșit, aplicația îți
arată un mesaj de eroare la salvare și nu creează căminul (nimic nu se strică —
doar corectezi și reîncerci).

| Câmp | Regulă | ✅ Corect | ❌ Greșit |
|---|---|---|---|
| Denumire legală | 2–160 caractere | `Casa Bunicilor Fericiți SRL` | (gol) |
| Nume public | 2–80 caractere | `Casa Bunicilor Fericiți` | (gol) |
| **Slug** | **doar litere mici a–z, cifre 0–9 și cratime.** Fără spații, fără diacritice, fără majuscule, fără cratimă la început/sfârșit | `casa-bunicilor-fericiti` | `Casa Bunicilor` · `casă-bunici` · `-casa-` |
| CUI | 4–24 caractere | `RO38291746` · `38291746` | `12` |
| Email contact | adresă de email validă | `contact@casabunicilor.ro` | `contact(at)…` |
| **Telefon contact** | **format E.164: `+`, prefix țară, apoi cifre (8–15 total). Fără spații, fără paranteze, fără `0` după `+`** | `+40256123456` | `0256 123 456` · `+40 256 123 456` · `0040256123456` |
| Adresă | 3–160 caractere | `Str. Salcâmilor nr. 12` | `—` |
| Oraș | 2–80 caractere | `Timișoara` | (gol) |
| Județ | 2–80 caractere | `Timiș` | (gol) |
| Cod poștal | 4–12 caractere | `300123` | `12` |
| Pachet | alege din listă T1/T2/T3/T4 | `T1 — 150 EUR/lună` | — |

> **Slug** = identificatorul scurt, unic, al căminului în sistem. Regula
> simplă: ia numele public, scoate diacriticele, treci totul cu litere mici,
> înlocuiește spațiile cu cratime. `Casa Bunicilor Fericiți` →
> `casa-bunicilor-fericiti`. Slug-ul trebuie să fie **unic** — dacă mai există
> un cămin cu același slug, aplicația te anunță și alegi altul (ex. adaugi
> orașul: `casa-bunicilor-timisoara`).

### 4.2 Admin cămin (opțional — recomandat)

Această secțiune decide **cum intră administratorul căminului în aplicație**.

- **Dacă completezi „Email admin"** → la apăsarea *Creează tenant*, sistemul
  trimite **automat** un email ComfortMap (branded, prin serverul nostru) către
  acel admin, cu un buton „Intră în cont". Adminul apasă butonul și e logat
  direct în dashboard-ul căminului (`/caminul`), fără parolă. **Aceasta este
  calea recomandată** — un singur pas, totul automat.

- **Dacă lași secțiunea goală** → căminul se creează fără administrator. Îl poți
  invita oricând mai târziu (vezi pasul 6 — butonul „Trimite magic link
  admin"). Folosește varianta asta dacă nu ai încă emailul adminului.

> Numele și telefonul adminului sunt opționale chiar dacă pui emailul — dar e
> bine să le completezi, apar în audit și facturare.

---

## 5. Apasă „Creează tenant"

La apăsarea butonului **„Creează tenant"**:

1. Aplicația validează datele. Dacă ceva e greșit, vezi mesajul roșu, corectezi
   câmpul și reapeși. **Nu se creează nimic parțial** — ori totul, ori nimic.
2. Dacă datele sunt corecte, căminul se creează cu:
   - **Status: Trial** (perioadă de probă **30 de zile**, fără facturare).
   - **0 rezidenți** (se adaugă ulterior de către adminul căminului).
3. Dacă ai pus email de admin → pleacă automat emailul cu linkul de acces.
4. Ești redirecționată automat pe **pagina căminului nou creat**
   (`/platforma/camine/{id}`). Dacă vezi această pagină cu datele căminului,
   **onboarding-ul a reușit**. ✅

---

## 6. Asigură-te că adminul căminului are acces

Pe pagina căminului (unde ai ajuns la pasul 5) ai butonul
**„Trimite magic link admin"**. Folosește-l când:

- Ai creat căminul **fără** email de admin și acum vrei să-l inviți.
- Linkul inițial **a expirat** (linkurile sunt valabile 1 oră).
- Adminul **a pierdut** emailul și vrea unul nou.
- Vrei să trimiți accesul către **alt email** (poți completa un email diferit
  în câmpul de lângă buton).

Poți apăsa butonul de câte ori e nevoie — de fiecare dată se generează un link
nou, valabil. Linkurile vechi rămân valabile până expiră sau până la prima
folosire.

---

## 7. Ce face adminul căminului mai departe (ca să știi lanțul complet)

Nu trebuie tu să faci pașii ăștia — îi face administratorul căminului — dar e
bine să-i cunoști ca să poți îndruma căminul dacă te sună:

1. Adminul primește emailul ComfortMap → apasă **„Intră în cont"** → e logat
   automat în `/caminul`.
2. Din `/caminul` adminul:
   - adaugă **rezidenții** căminului;
   - își invită **colegii (staff)** din secțiunea *Echipă*;
   - invită **familiile** rezidenților (familia primește la rândul ei un magic
     link și acces în portalul de familie `/portal`).
3. Din acel moment fluxul normal e activ: staff-ul postează update-uri zilnice
   (foto + text), familiile le văd, primesc rapoarte săptămânale automate.

---

## 8. Checklist de verificare „a reușit"

Bifează după ce ai creat un cămin:

- [ ] Am ajuns pe pagina căminului (`/platforma/camine/{id}`) cu datele corecte.
- [ ] Căminul apare în lista „Cămine" cu status **Trial**.
- [ ] (Dacă am pus email admin) Adminul confirmă că a primit emailul ComfortMap
      cu butonul „Intră în cont" (verifică și folderul Spam).
- [ ] Adminul apasă linkul și ajunge în `/caminul` fără să i se ceară parolă.
- [ ] În meniul „Audit" (`/platforma/audit`) apare o intrare nouă de tip
      *create · tenant* (dovada că s-a înregistrat în sistem).

Dacă toate sunt bifate, căminul e onboardat corect și demo-ready.

---

## 9. Depanare (probleme frecvente și soluția)

| Simptom | Cauză | Ce faci |
|---|---|---|
| „Există deja un cămin cu acest slug." | Slug-ul nu e unic | Alege alt slug (adaugă orașul: `nume-oras`) și reapasă *Creează tenant*. |
| Eroare la „Telefon" | Format greșit | Folosește `+40…` fără spații/paranteze. `0256 123 456` → `+40256123456`. |
| Eroare la „Slug" | Spații / diacritice / majuscule | Doar `a-z`, `0-9`, `-`. `Casă Noua` → `casa-noua`. |
| Eroare generică „Date invalide." | Un câmp obligatoriu gol sau prea scurt | Recitește tabelul de la 4.1 și completează câmpul semnalat. |
| Adminul nu a primit emailul | Email greșit / a ajuns în Spam / link expirat | Verifică emailul, cere-i să se uite în Spam, apoi apasă **„Trimite magic link admin"** (pasul 6). |
| „Linkul a expirat sau a fost deja folosit" (la admin) | Linkul e valabil 1h / a fost deschis o dată | Apasă din nou **„Trimite magic link admin"** și roagă adminul să apese **butonul** din email (nu doar să deschidă emailul). |
| Ajung pe `/caminul` sau `/portal` în loc de `/platforma` | Nu ești logată cu contul de super-admin | Deconectează-te, intră cu `marylou@realitateasociala.ro`. |

> **Regulă de aur:** nimic din ce faci în formular nu poate „strica" platforma.
> Dacă o validare pică, căminul pur și simplu **nu se creează** — corectezi și
> reîncerci. Singura acțiune care trimite email este apăsarea finală pe
> *Creează tenant* (cu email de admin completat) sau butonul
> *Trimite magic link admin*.

---

## 10. Întrebări frecvente

**Trebuie să rulez ceva tehnic / un script ca să creez un cămin?**
Nu. Tot procesul e în interfață, în browser. Nu există pas tehnic.

**Magic link-ul se generează „manual"?**
Nu. Se generează și se trimite **automat** de aplicație în momentul în care
apeși *Creează tenant* (cu email de admin) sau *Trimite magic link admin*.
Emailul pleacă prin serverul nostru de email (ComfortMap, domeniu verificat),
nu prin pași manuali.

**Pot crea un cămin fără să invit adminul acum?**
Da — lași secțiunea „Admin cămin" goală. Inviți adminul oricând mai târziu cu
butonul „Trimite magic link admin" de pe pagina căminului.

**Ce înseamnă „Trial 30 zile"?**
Căminul e complet funcțional, dar fără facturare 30 de zile. Statusul se poate
schimba ulterior (active / suspended / archived) de pe pagina căminului.

**Am greșit un câmp după ce am creat căminul. Ce fac?**
Datele de contact ale căminului se pot edita ulterior din zona căminului. Slug-ul
e identificatorul intern și rămâne — alege-l cu grijă la creare.

**Linkul de acces e sigur?**
Da. Expiră în 1 oră, se folosește o singură dată, te logează doar pe tine în
contul tău. Dacă cineva primește un link din greșeală și nu-l folosește, el
expiră singur.

---

## Anexă — varianta scurtă (60 de secunde)

1. `comfortmap.ro/login` → intră ca super-admin → ajungi pe `/platforma`.
2. Meniu **Cămine** → buton **Onboardează cămin**.
3. Completează *Date cămin* (atenție la **slug** = litere mici + cratime, și
   **telefon** = `+40…`).
4. Completează *Email admin* (recomandat) → adminul primește acces automat.
5. **Creează tenant** → ajungi pe pagina căminului = gata.
6. Dacă adminul nu primește emailul → butonul **Trimite magic link admin**.
