---
tags: [tchibo, campaign, tender, raspuns, email, antifraud]
client: Tchibo Coffee Service Romania
status: draft-for-send
note: pretul se trimite separat
created: 2026-05-28
---

# Răspuns tender — Campanie Tailor Made "GAME ON" Cafissimo (fără preț)

> Text gata de trimis. Acoperă CE facem și CUM, inclusiv antifrauda. Cotația de preț o trimitem separat.

---

Bună ziua,

Mulțumim pentru detalii. Mai jos găsiți ce acoperim pentru campania Tailor Made „GAME ON" Cafissimo — concentrat pe **platformă și partea online**, zona pe care ne-o asumăm integral.

## Ce construim și administrăm

**1. Pagina de campanie**
Declinăm fidel KV-ul „GAME ON" furnizat de voi într-o pagină responsive (optimizată mobil, unde vine majoritatea traficului din retail): mecanica „Cumpără orice produs Cafissimo → Înscrie documentul fiscal → Câștigă", premiile, perioada (17.06–17.07.2026), retailerul și regulile pe scurt, cu link către regulament.

**2. Fluxul de înscriere**
Formular de participare + **upload document fiscal (bon)**, cu validarea câmpurilor și consimțământ GDPR explicit. Datele și bonurile sunt stocate securizat, în regiune EU.

**3. Administrarea campaniei (dashboard-ul nostru)**
Avem un panou de administrare prin care gestionăm întreaga campanie online:
- vizualizare, căutare și filtrare a tuturor înscrierilor;
- pentru fiecare înscriere: imaginea bonului + datele aferente + semnalele de risc + statusul (validată / respinsă / în verificare);
- decizii de moderare cu istoric (audit trail: cine, când, ce a decis);
- evidențierea automată a situațiilor speciale (suspiciuni de fraudă).

**4. Sistemul antifraudă** (detaliat mai jos)

**5. Raportare săptămânală**
Vă trimitem săptămânal un raport cu situația înscrierilor și evidențierea cazurilor speciale (suspiciuni de fraudă, înscrieri respinse și motivele), exact în formatul de care aveți nevoie pentru monitorizarea campaniei.

**6. Extragerea câștigătorilor și a rezervelor**
Realizăm extragerea aleatorie, auditabilă, a câștigătorilor și a rezervelor direct din platformă, pe baza înscrierilor validate, și vă punem la dispoziție listele.

## Cum gestionăm frauda (sistem antifraudă)

Aplicăm o abordare **stratificată, cu validare umană** — automatizăm verificările sigure și trimitem cazurile dubioase la verificare manuală:

- **Detecție de duplicat:** un bon nu poate fi înscris de două ori. Verificăm unicitatea documentului fiscal (număr bon, dată, magazin, valoare) și aplicăm o **amprentă digitală a imaginii (perceptual hash)** care prinde aceeași poză re-încărcată chiar dacă a fost redenumită, recompresată sau ușor decupată.
- **Detecție de manipulare a imaginii:** analizăm metadatele imaginii (EXIF) pentru urme de editare/software și aplicăm Error Level Analysis (ELA) pentru a evidenția zonele modificate într-un bon photoshopat.
- **Detecție de imagine generată/falsificată:** rulăm un model de detecție a imaginilor generate artificial care marchează bonurile suspecte. Menționăm transparent că această verificare funcționează ca **semnal de risc**, nu ca verdict automat — de aceea cazurile marcate trec prin verificare umană înainte de respingere.
- **Verificarea eligibilității:** confirmăm că documentul corespunde retailerului campaniei și conține produs Cafissimo.
- **Limitarea abuzului:** plafoane de înscriere per participant și per document fiscal, plus limitare de rată, pentru a bloca înscrierile în masă.

Toate semnalele se combină într-un scor de risc → înscrierea e validată automat, respinsă automat sau trimisă la verificare manuală. Cazurile marcate apar în raportul săptămânal.

## Securitatea platformei
Datele participanților și bonurile sunt găzduite în regiune EU, cu izolare la nivel de rând (Row-Level Security), URL-uri de încărcare semnate, criptare at-rest, protecție anti-enumerare la autentificare și politică de retenție conformă GDPR. Platforma o construim acum pe infrastructura noastră și o putem **integra ulterior sub domeniul vostru**.

## Ce rămâne în sarcina voastră
Pentru claritate, în această ofertă **nu** intră: redactarea/autentificarea notarială a regulamentului, achiziția premiilor, livrarea premiilor și PV-urile/documentele de taxe pentru premiile peste 600 lei, și contactarea/validarea fizică a câștigătorilor. Noi vă punem la dispoziție online toate datele necesare (înscrieri validate, listă câștigători + rezerve, rapoarte).

Revenim separat cu cotația de preț. Rămânem la dispoziție pentru orice clarificare.

Cu stimă,
[Nume / Consumer Voice]

---

### Notă internă (de completat de tine, nu intră în text)
- Cele 2 cifre cerute de ei (nr. clienți activi 2025, nr. campanii 2025) — le completezi tu separat; nu le-am inventat.
- Partea de antifraudă de mai sus dublează ca răspuns la întrebarea lor „ce sisteme antifraudă ați aplicat".
