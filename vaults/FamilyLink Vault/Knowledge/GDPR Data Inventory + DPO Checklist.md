# GDPR — Inventar date + Checklist + Ce cerem de la firma DPO

> Pregătit pentru întâlnirea cu posibila firmă DPO. Bazat pe schema REALĂ din DB (extrasă 2026-05-29). Volume curente: 34 useri, 18 rezidenți, 22 familii, 34 update-uri jurnal, 15 mesaje, 349 audit, 7 cămine, **0 consimțăminte înregistrate** (gap).

---

## PARTEA 1 — INVENTARUL DE DATE (ce colectăm, pe categorii de persoane)

### A. REZIDENȚI (vârstnici) — cea mai sensibilă categorie ⚠️ Art. 9
| Câmp | Tabel | Categorie specială? | Scop |
|---|---|---|---|
| Nume complet, nume preferat | residents | — (identificare) | identificare rezident |
| Data nașterii | residents | sensibil (vârstă, vulnerabil) | profil |
| Data admiterii, externării, motiv externare | residents | — | management îngrijire |
| Nr. cameră | residents | — | logistică |
| Avatar (poză) | residents | **DA — imagine persoană identificabilă** | profil vizual |
| Note („particularități/preferințe") | residents.notes | **POATE — text liber, poate conține info sănătate** | îngrijire personalizată |
| Jurnal zilnic — text | journal_entries.body | **DA când type=`medical_note`; mood/sănătate** | comunicare cu familia |
| Jurnal — tip (medical_note, activity, milestone, daily) | journal_entries.type | **DA (medical_note = sănătate)** | clasificare |
| Jurnal — fotografii | journal_entries.photo_urls | **DA — imagini rezident vulnerabil** | update vizual familie |
| Rapoarte săptămânale (PDF) | weekly_reports.pdf_url | **DA — agregă jurnalul** | sumar familie |

→ **Concluzie:** procesăm date de sănătate + imagini ale unor adulți vulnerabili = **categorie specială Art. 9**. Temei legal necesar (probabil prestarea serviciului de îngrijire + consimțământ reprezentant legal).

### B. FAMILII (membri familie rezident)
| Câmp | Tabel | Scop |
|---|---|---|
| Nume, email, telefon, avatar | users | cont + notificări |
| Relația cu rezidentul | families.relation_to_resident | context |
| Mesaje către cămin (text + atașamente) | messages, family_admin_messages, family_hub_messages | comunicare |
| „Îmbrățișări" (mesaj) | family_hugs.message | feature emoțional |
| Preferință notificări | family_notification_preferences | consimțământ comunicări |
| Vizite (dată, note) | family_visits | log vizite |

### C. PERSONAL CĂMIN (staff / admin)
| Câmp | Tabel | Scop |
|---|---|---|
| Nume, email, telefon, avatar | users | cont |
| Rol + cămin + invitat de | user_tenant_access | acces |
| Ultima logare, preferințe UI | users | operațional |
| Autor update-uri/mesaje | journal_entries/messages.author | atribuire |

### D. LEAD-URI B2B (cămine prospect — din formulare site)
| Câmp | Tabel | Scop |
|---|---|---|
| Nume admin, email, telefon | leads | follow-up comercial |
| Cămin, oraș, județ, nr. estimat rezidenți, unelte curente | leads | calificare |
| **IP, user_agent, UTM, referrer** | leads | tracking marketing ⚠️ (necesită temei + cookie/consimțământ) |

### E. DATE TEHNICE / AUDIT
| Câmp | Tabel | Scop |
|---|---|---|
| actor, acțiune, entitate, **IP, user_agent**, metadata | audit_log | securitate + conformitate (349 înreg.) |
| Consimțăminte (tip, versiune, acordat/revocat) | consent_records | **tabelă există dar 0 rânduri = NU se capturează încă** ⚠️ |
| Date cămin: denumire legală, CUI, adresă, contact | tenants | client B2B (date companie + contact) |

### Subprocesatori care „văd" datele (recipients)
Supabase (DB+storage, Frankfurt) · Vercel (hosting, fra1) · Resend (email, US+SCC) · Sentry (erori, de.sentry.io EU) · **OpenAI (transcriere voce, US — NEDOCUMENTAT)** · GitLab (cod, US — fără PII).

---

## PARTEA 2 — CHECKLIST GDPR

### Guvernanță & roluri
- [ ] Stabilit clar: cămine = Operatori, ComfortMap = Împuternicit (Art. 28)
- [ ] DPO desemnat (Art. 37) — probabil obligatoriu (date sănătate la scară)
- [ ] RoPA — Registrul activităților de prelucrare (Art. 30) — pentru Operator ȘI Împuternicit
- [ ] DPIA — Evaluare de impact (Art. 35) — obligatorie pt. date Art. 9

### Temei legal & consimțământ
- [ ] Temei legal documentat per categorie de date (Art. 6 + Art. 9)
- [ ] ⚠️ Consimțământ EFECTIV capturat (acum `consent_records` = 0 rânduri)
- [ ] Consimțământ foto rezidenți de la rezident/reprezentant legal
- [ ] Consimțământ voce/microfon (mecanism există, de verificat că scrie în DB)
- [ ] Cookie/tracking consent (leads salvează IP+UTM)

### Drepturile persoanelor (Art. 15-22)
- [x] Ștergere (cascade delete) · Export (endpoint) · Rectificare (edit)
- [ ] Proces formal pt. acces/restricționare/opoziție + termen 30 zile
- [ ] Canal documentat (gdpr@comfortmap.ro — menționat în FAQ, de oficializat)

### Securitate (Art. 32)
- [x] Criptare at rest/transit · RLS 100% · audit log · roluri
- [ ] ⚠️ Backup (Supabase FREE acum → upgrade Pro)
- [ ] Procedură breșă de date 72h (Art. 33/34)

### Subprocesatori & transferuri
- [x] DPA + SCC: Supabase, Vercel, Resend, Sentry
- [ ] ⚠️ OpenAI (voce) — DPA + SCC + zero-retention SAU dezactivare
- [ ] Listă publică subprocesatori actualizată (+ OpenAI)
- [ ] Analiză Schrems II pt. transferuri US documentată în DPIA

### Documentație & retenție
- [ ] Politică de retenție (cât ținem după externare/deces/plecare cămin) + implementare
- [ ] Înregistrare ANSPDCP (pagina zice „în curs")
- [ ] DPA template cu căminele (ca împuternicit)
- [x] Politici publice: confidențialitate, cookies, ANSPDCP (pagini există)

---

## PARTEA 3 — CE CEREM DE LA FIRMA DPO (deliverables + întrebări)

### Servicii/deliverables de cerut în ofertă
1. **Rol DPO formal** — desemnare + înregistrare la ANSPDCP ca DPO + date de contact publice
2. **DPIA completă** pentru procesarea de date Art. 9 (sănătate vârstnici)
3. **RoPA** — registrul activităților (template + completare)
4. **DPA template** cămine (împuternicit) + revizuire DPA-uri subprocesatori
5. **Politică de retenție** + recomandări de implementare tehnică
6. **Procedură de breșă** (plan 72h) + training echipă
7. **Audit de conformitate** periodic + punct de contact pt. ANSPDCP/persoane vizate
8. **Consultanță Schrems II** pe transferurile US (Resend, Sentry, OpenAI)

### Întrebări pentru firmă (calificare)
- Aveți experiență cu **sector medical/social / date Art. 9**? Referințe?
- Sunteți DPO desemnat formal pentru alți clienți la ANSPDCP?
- Ce includeți în abonament lunar vs. one-off (DPIA, RoPA)?
- Timp de răspuns la o cerere a persoanei vizate / o breșă?
- Acoperiți și partea **tehnică** (review arhitectură, pen-test) sau doar legal/documentație?
- Cost: retainer lunar + setup one-off (DPIA+RoPA)?

### Ce le dăm NOI lor (ca să poată lucra)
- Acest inventar de date + schema DB
- Lista subprocesatorilor + DPA-urile (vault: Subprocessors GDPR Audit)
- Arhitectura (vault: ComfortMap Architecture, Security & Hardening)
- Acces la paginile legale existente

### Decizii de luat cu ei
- Operator vs împuternicit (confirmare juridică)
- E DPO obligatoriu sau opțional pentru scara noastră?
- Prioritizare: ce e blocant înainte de primul cămin plătitor real?

---

**Referințe vault:** `GDPR Meeting Prep.md`, `Subprocessors GDPR Audit.md`, `GDPR & Supabase Access.md`, `Security & Hardening.md`

**Disclaimer:** inventar tehnic + perspectivă produs. Clasificările legale (operator/împuternicit, DPO obligatoriu, temei legal) le confirmă firma DPO — ei sunt autoritatea juridică.
