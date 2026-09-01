# Service Role Rotation Runbook + Faza 2 Hardening Deferred

> Închide item-urile P3 rămase din auditul 29.05.2026 care nu sunt cod.

---

## 1. Rotația cheii service role Supabase

**Frecvență recomandată:** trimestrial (la fiecare 3 luni) sau ad-hoc dacă există suspiciune de scurgere (ex: dev nou care a avut acces, leak într-un repo public, breșă upstream).

**Risc dacă NU rotești:** o cheie compromisă oferă acces complet la DB (bypass RLS). Cu cât e mai veche, cu atât e mai expusă pe disk-urile cuiva.

### Procedura (15 minute, downtime ~30 sec)

1. **Supabase Dashboard** → `comfortmap-prod` → Settings → API → secțiunea **service_role**.
2. Click **"Reveal"** pe noua cheie generată (sau **Rotate** dacă nu există încă un buton de rotație — atunci JWT secret regen din Settings → JWT).
3. Copiază noua cheie.
4. **Vercel Dashboard** → `familylink-app` → Settings → Environment Variables.
5. Editează `SUPABASE_SERVICE_ROLE_KEY` (Production + Preview):
   - Paste noua cheie.
   - Save.
6. **Trigger redeploy:** Deployments → Latest → ⋯ → **Redeploy** (fără să re-build cache).
7. După redeploy READY, verifică:
   - Login funcționează (Supabase auth folosește anon key, nu service — dar e check rapid).
   - O acțiune admin (ex: încarcă /caminul/rezidenti) — trebuie să arate datele.
   - `/api/cron/weekly-reports` cu noul `CRON_SECRET` (separat) — verificare cron neafectat.
8. **Sentry** — verifică să nu apară erori 500 de tip "JWT expired" sau "permission denied" în următoarele 5 min.

### Dacă ceva pică
- Rollback rapid: în Vercel, **Promote** ultimul deployment de dinainte de rotație → revine la cheia veche.
- Apoi investighează în liniște ce a ratat update-ul.

### Loguri
- Notează în `Activity.md` data rotației + cine a făcut-o.
- ANSPDCP / DPO nu necesită notificare (e operațiune internă de hygiene).

---

## 2. Items Faza 2+ amânate explicit (audit le marchează ca optimizări viitoare)

Auditul de pe 29.05 le-a clasificat ca P3 — **NU sunt vulnerabilități**, sunt îmbunătățiri arhitecturale pentru scalare/UX. Le revizităm când justifică efortul.

### TOTP / confirmare email la operațiuni sensibile
- **Ce e:** la acțiuni majore (ștergere tenant, export tot DB-ul, rotație chei) → cere un cod TOTP suplimentar sau confirmare prin email.
- **De ce P3:** UX-ul actual cu magic link + RLS + audit log e suficient pentru scara curentă (sub 10 admin-i super, sub 50 admin-i cămin). TOTP devine valoros când avem 100+ admin-i sau operațiuni distructive frecvente.
- **Revizităm:** când lansăm Faza 2 (ComfortMap public) + numărul de tenant-i crește, SAU dacă apare o cerere de la auditor extern pentru SOC2/ISO27001.

### Coadă background pentru cron-uri (Bull/BullMQ)
- **Ce e:** rapoartele săptămânale generate sincron (max 5 min cron Vercel) — la 100+ rapoarte/min nu mai încape în fereastră.
- **De ce P3:** acum generăm ~20 rapoarte/săptămână (sub 1/min). Departe de limită.
- **Revizităm:** când avem >10 cămine plătitoare × 50 rezidenți = 500 rapoarte/săptămână → încă încape, dar începe să fie tensionat.

### Rate-limit pe Redis (Upstash) — multi-instance
- **Ce e:** acum rate-limit-ul e in-memory per instanță Node (Vercel poate scala orizontal → fiecare instanță are propriul contor).
- **De ce P3:** Vercel rulează majoritatea cererilor pe aceeași instanță warm; rate-limit-ul „pierde" eficacitate doar la scale orizontal masiv.
- **Revizităm:** când vedem efectiv mai mulți workeri concurenți (Vercel Pro analytics) sau când lansăm API-ul public ComfortMap (Faza 2).

---

## 3. Concluzie audit 29.05

**P0/P1/P2: TOATE închise** (verificate live pe preview, gata de merge la prod).
**P3 actionable: DOMPurify pe blog + acest runbook = închise.**
**P3 arhitectural (TOTP, queue, Redis): conștient amânate la Faza 2** — nu sunt vuln-uri, sunt scalare.

Auditul lui Cătălin e **complet adresat**. Mulțumiri.

---

## Links
- [[Security Audit 2026-05-29 — Findings & Remediation]]
- [[Plan Remediere Audit — Raspuns pentru Catalin]]
- [[Security & Hardening]]
- [[Faza 2 — Planning 2026-05-22]]
