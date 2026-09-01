---
tags: [tchibo, campaign, tender, cotatie, antifraud]
client: Tchibo Coffee Service Romania
price: 800 EUR (platforma online)
status: draft-for-send
created: 2026-05-28
---

# Cotație — Platformă Campanie "GAME ON" Cafissimo (Tailor Made)

> Draft pentru răspunsul la tender. Scope: STRICT platforma + partea online.
> Preț: **800 EUR** (dezvoltare + găzduire pe durata campaniei, pe infrastructura noastră).

---

## 1. Ce livrăm (partea online — responsabilitatea noastră)

Ne ocupăm integral de **platforma digitală a campaniei**, declinată din KV-ul „GAME ON" furnizat de voi:

- **Pagina de campanie** — design responsive (mobile-first) declinat fidel din KV-ul Cafissimo Gaming: mecanica „Cumpără → Înscrie bonul → Câștigă", premiile, perioada (17.06–17.07.2026), retailerul (Auchan), regulile pe scurt.
- **Flux de înscriere** — formular de participare + **upload document fiscal** (bon), cu validarea câmpurilor și consimțământ GDPR explicit.
- **Bază de date înscrieri** — stocare securizată a înscrierilor, bonurilor și datelor participanților (regiune EU).
- **Sistem antifraudă + moderare** (detaliat la secțiunea 3).
- **Dashboard de administrare** — vizualizare/căutare/filtrare înscrieri, marcarea situațiilor suspecte.
- **Tool de extragere câștigători + rezerve** — extragere aleatorie auditabilă (partea software a tragerii la sorți).
- **Raportare săptămânală** — export al înscrierilor + evidențierea situațiilor speciale (suspiciuni de fraudă), exact cum ați cerut.
- **Hardening de securitate** complet (secțiunea 3).

## 2. Ce NU intră în această cotație (partea offline — la voi)

Pentru claritate și ca să nu existe suprapuneri de responsabilitate:

- Regulamentul redactat/autentificat la notar + împuternicirea
- Achiziția premiilor (Tchibo și non-Tchibo / vouchere)
- Livrarea premiilor, recepția, PV-urile de predare și documentele de taxe pentru premiile >600 lei TVA inclus
- Contactarea și validarea fizică a câștigătorilor (logistica offline)

> Noi expunem datele și instrumentele online (lista câștigătorilor extrași, rezerve, rapoarte); execuția offline rămâne la voi / partenerii voștri.

## 3. Securitate & Antifraudă (cum adresăm cerința voastră)

Abordare **stratificată cu validare umană** — pragmatică și onestă: automatizăm ce e ieftin și sigur, iar cazurile dubioase ajung la review uman.

**Antifraudă inclusă în preț:**
- **Dedup pe document fiscal** — un bon nu poate fi înscris de mai multe ori; verificăm unicitatea (nr. bon / dată / magazin / total introduse la înscriere) + **amprentă perceptuală a imaginii (pHash)** ca să prindem aceeași poză re-uploadată.
- **Limitare de rată & plafoane** — limită de înscrieri per cont/IP și per document fiscal, ca să blocăm înscrierile în masă.
- **Coadă de moderare umană** — orice înscriere flag-uită (imagine dublată, date incomplete, tipare suspecte) intră într-o coadă de verificare; deciziile apar în raportul săptămânal.
- **Date securizate** — Supabase EU, Row-Level Security 100%, URL-uri de upload semnate, criptare at-rest, consimțământ GDPR, politică de retenție; protecție anti-enumerare pe autentificare.
- **Audit trail** — fiecare înscriere și decizie de moderare e logată (cine, când, ce).

**Add-on opțional (fază 2, cotat separat) — automatizare AI:**
- OCR automat pe bon (extragere nr. fiscal / dată / magazin / produse / total) pentru dedup și matching de produs Cafissimo fără introducere manuală.
- Semnalare automată a bonurilor editate (ELA / metadata) sau generate AI.
- Notă de onestitate: detecția imaginilor generate AI e un **semnal de risc**, nu un verdict — de aceea o ținem ca strat de flag + review uman, nu ca respingere automată.

## 4. Stack tehnic
Vite/React + Supabase EU (auth, Postgres, storage), deploy securizat. Construit acum pe infrastructura noastră, pregătit pentru **integrare ulterioară sub domeniul vostru**.

## 5. Timeline
Build + testare înainte de lansarea din **17.06.2026**. Necesită KV-ul editabil + textul final de regulament (de la voi) cu cel puțin ~1 săptămână înainte de go-live.

## 6. Preț
- **800 EUR** — dezvoltare platformă + găzduire + monitorizare pe durata campaniei (17.06–17.07.2026).
- Add-on OCR/AI antifraudă — cotat separat la cerere.

---

### Dependențe de la client (ca să respectăm deadline-ul de lansare)
- KV editabil/hi-res (avem `KV Cafissimo Gaming.jpg.jpeg`, dar pt fidelitate ideal sursă editabilă)
- Textul final al regulamentului (link/pagina de reguli)
- Lista exactă a premiilor + nr. final (max 10)
- Subdomeniul/țintă pe partea lor pentru integrarea ulterioară
