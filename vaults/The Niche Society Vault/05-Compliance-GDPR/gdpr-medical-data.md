# GDPR + Romanian Medical Data — What We Must Do

## The short version
Medical data is **Article 9 "special category" personal data** under GDPR. Penalties up to €20M or 4% of turnover. Clinics are the **data controllers**, we're the **data processor**. This is not optional, and it's the single biggest reason clinics will pay us — if we do it right.

## Baseline requirements

### 1. Legal basis
- Clinics need explicit consent from patients for processing on our platform (not just the implied medical relationship consent)
- We need a DPA (Data Processing Agreement) with EVERY clinic — template required

### 2. Data residency
- **EU hosting mandatory** — Supabase EU region (Frankfurt or Dublin)
- No US-based subprocessors for PHI unless SCCs + DPF
- If a clinic wants RO-only residency, need a plan B (self-hosted Supabase on Hetzner Bucharest? DigitalOcean Frankfurt at minimum)

### 3. Encryption
- At rest: AES-256 (Supabase default ✓)
- In transit: TLS 1.3 ✓
- Photos (before/after, prescriptions): encrypted storage, signed URLs only, no public buckets
- Chat messages: at minimum encrypted at rest, consider E2E for messages (hard with AI copilot — trade-off to document)

### 4. Access control
- Row-level security in Supabase (multi-tenant)
- Clinic isolation: Ioana from Clinic A CANNOT see data from Clinic B, even with same email
- Doctor can only see their assigned patients unless clinic-admin
- Audit log: every read/write on patient data tagged with user_id + timestamp

### 5. Patient rights (GDPR chapters III)
- **Access**: patient can download all their data (JSON + photos zip)
- **Rectification**: patient can edit their profile
- **Erasure** ("right to be forgotten"): irreversible delete within 30 days. ⚠️ BUT medical retention law in RO requires some records kept 10–30 years — resolve conflict with tombstone + restricted clinic access
- **Portability**: export in machine-readable format
- **Restriction**: pause processing without deleting

### 6. Data minimization
- Don't collect what we don't need
- Don't keep what we don't use
- Auto-delete old chat after X years (configurable per clinic)

### 7. Breach notification
- 72-hour notification to ANSPDCP (Romanian DPA)
- Patients notified if high risk

### 8. DPO (Data Protection Officer)
- Likely required (we process special category data at scale)
- Can be external / fractional for MVP

## Romanian-specific additions
- **ANSPDCP** (Autoritatea Națională de Supraveghere a Prelucrării Datelor cu Caracter Personal) is the RO DPA
- Registration of processing activities may be required
- Medical records retention: 30 years for patient chart, 1 year for appointment records (verify with counsel)
- Law 677/2001 is repealed, only GDPR + Law 190/2018 apply
- E-prescription (SIPE) integration: regulated by CNAS, not mandatory for private clinics but big UX win

## Security measures we'll implement from day 1
- [ ] MFA for doctors and admins
- [ ] Session timeout (15 min for doctor, 30 for admin)
- [ ] Password policy (12+ chars, breach check via HIBP API)
- [ ] Rate limiting on all endpoints
- [ ] Audit log append-only table
- [ ] Backup strategy (daily, 30-day retention, tested restore)
- [ ] Pen test before first paying clinic
- [ ] Disaster recovery plan documented
- [ ] Vendor list (subprocessors) public and kept current

## Things to decide later
- Do we offer BAA-equivalent for clinics serving non-EU patients?
- On-premise option for hospital-level clients?
- Certifications: ISO 27001? ISO 13485 (medical devices)? HDS (France)?

## References
- GDPR Articles 6, 9, 13, 25, 28, 32, 33, 34, 35
- Law 190/2018 (RO GDPR implementation)
- Law 95/2006 Title VI (patient rights)
- ANSPDCP guidelines for healthcare
