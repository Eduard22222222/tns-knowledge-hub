# Faza 1 — Lean MVP

## Sumar

- **Valoare contract:** 5.300 EUR (fără TVA, microîntreprindere)
- **Plată:** 2 tranșe egale (50/50) — 2.650 EUR avans + 2.650 EUR la recepție
- **Curs:** BNR din ziua semnării (30.04.2026), fix pe ambele tranșe
- **Durată:** 3 săptămâni calendaristice de la Data Kickoff
- **Data Kickoff:** prima zi lucrătoare după încasarea avansului
- **Garanție:** 90 zile defecte de funcționare, fără cost
- **Tarif post-garanție:** 70 EUR/oră (fără TVA)

## Milestones (calendaristic)

| Săptămână | Demo + livrare |
|---|---|
| **S1** (vineri demo) | Autentificare, multi-tenancy, dashboard cămin, modul rezidenți, jurnal zilnic |
| **S2** (vineri demo) | Portal familie, mesagerie, pipeline imagini, notificări email |
| **S3** (vineri prezentare finală) | Deploy producție, GDPR fundație tehnică, REST API minimal, landing page live, rapoarte săptămânale automate |

## Cadență de comunicare

- **Demo săptămânal:** vineri 16:00 (Google Meet sau Microsoft Teams), min 30 min
- **Feedback Beneficiar:** maxim 3 zile lucrătoare în scris după fiecare demo
- **Răspuns Prestator la întrebări:** max 4 ore lucrătoare în interval 09:00-19:00 L-V
- **Acceptare tacită:** doar pentru recepția finală (după 5 zile + 2 reminderuri scrise la 24h interval) — NU pentru milestone-urile săptămânale

## Scope tehnic — Anexa 1

### A. Aplicația căminului (interfață staff)
- Autentificare email + parolă
- Listă rezidenți (nume, dată naștere, foto profil, status zilnic)
- CRUD rezidenți + arhivare
- Asociere familii la rezidenți (până la 5 membri per rezident)
- Jurnal zilnic per rezident: text + 1-3 fotografii + tag-uri (masă, plimbare, medicație, dispoziție)
- Pipeline upload imagini (Sharp + Supabase Storage, compresie automată, EXIF strip)
- Mesagerie cămin → familie (per rezident)
- Dashboard simplu: număr rezidenți, update-uri săptămâna curentă, mesaje neresponsate

### B. Portalul familiei
- Acces prin invitație email cu magic link Supabase
- Timeline cronologic update-uri rezidentului
- Galerie foto navigabilă
- Mesagerie familie → cămin
- Notificări email automate la update-uri noi
- Preferințe notificări (zilnic / săptămânal / niciodată)

### C. Super-admin (Realitatea Sociala)
- Onboarding manual cămin nou (creare tenant + primul user admin)
- Listă cămine active cu metrici (rezidenți, update-uri săptămânale, familii active)
- Suspendare / reactivare cont cămin
- Vizibilitate audit log

### D. Rapoarte săptămânale automate
- Generare per familie cu agregarea update-urilor săptămânii
- Template HTML responsive cu poze și texte
- Cron job dedicat (Vercel Cron) pentru livrare la zi+oră configurabile per cămin
- Setări per cămin (ziua: luni-duminică; ora: 09:00-21:00)

### E. Site de prezentare public
- Landing page cu hero + mesaj-cheie
- Secțiune soluție pentru cămine
- Formular de contact cu email automat la Beneficiar (Resend)
- Mobile-responsive integral
- SEO de bază: meta tags, structured data (Organization, Website), sitemap.xml

### F. Infrastructură & compliance
- Multi-tenant Postgres + RLS (izolare per cămin la nivel de rând)
- Schema multi-product (users + products + tenants + user_tenant_access) — pregătită pentru ComfortMap din start
- Repository GitLab cu CI/CD pipeline funcțional (lint, test, build, deploy preview + prod)
- Date stocate exclusiv în UE (Supabase Frankfurt, Vercel EU regions, Resend EU)
- GDPR de bază: export per familie, audit log scrieri/citiri PII, ștergere cu cascade
- REST API minimal documentat (OpenAPI auto-generat din rute) — endpoint-uri minimal necesare în Faza 1, structură pregătită pentru API public Faza 2
- Production deploy pe Vercel + monitoring Sentry (EU region)
- Backup-uri automate zilnice ale bazei de date (Supabase built-in + backup manual săptămânal)

### G. Out of scope (NU în Faza 1)
- Directory de cămine cu filtre și comparare (Faza 2)
- Sistem de reviews și rating (Faza 3)
- Integrare contracte digitale și semnătură eIDAS (Faza 3)
- Aplicații mobile native iOS și Android (Faza 4)
- Multi-country și localizare lingvistică (RO singura limbă în Faza 1)
- Sistem de franciză cu multi-tenancy avansat (Faza 4)
- Facturare automatizată Stripe + e-Factura ANAF (Faza 2)
- Push notifications native (doar email în Faza 1)
- Audit complet de securitate de către terț (Faza 2-3, înainte de scale)

### H. Criterii de acceptare recepție finală

Recepția se semnează când toate criteriile sunt îndeplinite în mediul de producție (deploy live Vercel + Supabase):

1. Aplicația cămin: user staff autentificat adaugă min 3 rezidenți cu poză, scrie update zilnic cu min 2 fotografii, trimite mesaj familie
2. Portal familie: user familie primește invitație email, accesează portal prin magic link, vede update + poze, răspunde mesaj
3. Onboarding: super-admin creează al doilea tenant cămin de la zero, urmând documentația livrată cu 48h înainte, fără asistență
4. Protecție tehnică date: export complet pentru un cont, ștergere cu cascade pentru un rezident, audit log reflectă operațiuni
5. Rapoarte săptămânale: sistem trimite raport la cel puțin o familie / adresă de test
6. Site public: live, mobile-responsive, formular contact trimite email
7. 72h consecutive fără erori critice în Sentry
8. Backup-urile DB sunt configurate și verificate
9. UX: convenții uzuale UI/UX (navigare clară, butoane consistente, mobile-responsive, mesaje RO, validare formulare). Preferințe estetice subiective NU constituie temei de respingere.

### Notă utilizare comercială

Recepția Fazei 1 atestă funcționarea în producție. Operarea cu utilizatori plătitori este responsabilitatea Beneficiarului ca Operator de date (art. X contract), care trebuie să finalizeze înainte/în paralel cu primii 2-3 cămine pilot:
- DPO formal desemnat și notificat ANSPDCP
- DPIA conform art. 35 GDPR (date sănătate)
- T&C și politică de confidențialitate redactate de avocat
- Consimțământ explicit pentru date sănătate (art. 9 GDPR)

Audit independent securitate + ISO 27001 sunt recomandate la scale ≥10-15 cămine, NU sunt blocante pentru pilot.

## Resurse alocate

| Cont | Owner | Acces TNS |
|---|---|---|
| Vercel | Realitatea Sociala (email-uri lor) | admin/owner pe durata execuției |
| Supabase | Realitatea Sociala | admin/owner pe durata execuției |
| GitLab | Realitatea Sociala | maintainer/owner permanent |
| Resend | Realitatea Sociala | admin |
| Sentry | Realitatea Sociala | admin |
| Domain | Realitatea Sociala | DNS access pe durata setup |

Alternativ: dacă creare inițială pe contul Prestatorului, transfer în max 5 zile lucrătoare de la Data Kickoff (Art. VI alin. 5).

## Definiție „erori critice" (pentru SLA garanție)

> Erorile critice = erori care împiedică utilizatorii autentificați să acceseze funcționalitățile principale prevăzute în Anexa 1, secțiunile A, B, C sau D.

SLA timpi de răspuns (zile lucrătoare 09:00-19:00):
- Critic: 24h
- Major: 3 zile lucrătoare
- Minor: 10 zile lucrătoare

## Penalizări

- **Beneficiar întârzie plata:** 0,15%/zi pe sumă restantă, max valoarea sumei principale (Art. IV alin. 5)
- **Prestator întârzie livrare exclusiv din culpa proprie:** 3%/săptămână din Tranșa II, max 10% din valoarea contractului (Art. XII alin. 5). Carve-outs: modificări scope, întârzieri Beneficiar, forță majoră, indisponibilitate sub-procesatori.

## Răspundere

- Cap general: valoarea contractului (5.300 EUR)
- Carve-outs (cap nu se aplică): culpă gravă, intenție frauduloasă, încălcare confidențialitate, încălcare GDPR, încălcare IP
- Garanția de 90 zile defecte funcționare nu e afectată de cap

## Non-concurență

- Durată: 6 luni post-finalizare contract
- Scope strict: doar aplicații web/mobile dedicate comunicării cămin-familie SaaS multi-tenant pe piața RO
- Excepții: alte clienți TNS în nișa cămine/sănătate care NU sunt platforme cămin-familie, proiecte TNS existente, Faze ulterioare ale FamilyLink

## Următorii pași tehnici

1. **La semnătură (30.04.2026):** semnează 2 exemplare originale, încasare avans în 5 zile lucrătoare
2. **Data Kickoff (prima zi lucrătoare după plată avans):**
   - Creare conturi pe Realitatea Sociala (Vercel, Supabase, GitLab, Resend, Sentry)
   - Init repo GitLab cu Next.js 15 + TypeScript + Tailwind
   - Setup CI/CD pipeline
   - Schema DB inițială (users, products, tenants, user_tenant_access, residents, families, journal_entries, messages, audit_log)
   - Seed produs FamilyLink + ComfortMap (active=false)
   - RLS policies de bază
3. **Săptămâna 1:** auth, multi-tenancy, jurnal zilnic, demo vineri
4. **Săptămâna 2:** portal familie, mesagerie, imagini, demo vineri
5. **Săptămâna 3:** prod deploy, GDPR fundație, API stub, landing, rapoarte cron, prezentare finală vineri
