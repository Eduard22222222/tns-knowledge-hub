---
tags: [knowledge, familylink, auth, magic-link, supabase, gdpr]
project: "[[FamilyLink Platform]]"
created: 2026-05-07
updated: 2026-05-07
status: active
---

# FamilyLink Magic Link Flow

> Flow autentificare familii prin email cu link unic — fără parolă. Conform [[FamilyLink Faza 1 MVP]] §B.

## De ce magic link pentru familii?

Familiile rezidenților nu sunt utilizatori "frecvenți" în sensul SaaS clasic. Ele:
- Deschid email-ul de pe telefon, click pe notificare zilnică update.
- Nu au nevoie să-și creeze un cont, să țină minte încă o parolă.
- Vârsta medie 35-55 ani — varietate mare de tech literacy.

Magic link rezolvă: **un click → ești înăuntru**. Sesiune persistă 90 zile, deci nu repeți des fluxul.

Staff (cămin admin/staff) și super-admin folosesc parolă — ei lucrează zilnic, au password manager, au nevoie de control fin pe sesiune.

## Două fluxuri paralele

| | **Familie** | **Staff** |
|---|---|---|
| Trigger location | Resident detail sidebar | `/caminul/echipa` listă |
| Required link | rezident specific | doar tenant |
| Email tone | Cald, emoțional, gradient blue+green | Profesional, instituțional, navy+cream |
| Subject | "vezi cum se simte [rezident]" | "te-a invitat ca [rol]" |
| Redirect after click | `/portal` | `/caminul` |
| Rol DB | `family_owner` | `camin_admin` sau `camin_staff` |
| FK link | `families.resident_id` | `user_tenant_access.tenant_id` |
| Login frecv ulterior | Magic link la nevoie | Parolă recomandată zilnic |
| Server Action | `inviteFamilyAction` | `inviteStaffAction` |
| Email template | `familyInviteTemplate` | `staffInviteTemplate` |

## Componentele tehnice

### 1. Invite (staff inițiat)
**File:** `src/app/(staff)/_actions.ts` — `inviteFamilyAction`

```
Form (staff UI) → inviteFamilyAction (Server Action)
  → Supabase admin.generateLink({ type: 'magiclink', email })
    fallback: admin.inviteUserByEmail (creează user dacă nu există)
  → email branded prin Resend (familyInviteTemplate din lib/email/send.ts)
  → audit log entry
```

UI invitation: `src/app/(staff)/caminul/rezidenti/[id]/invita-familie/`
- Form: ownerName + relation + email + mesaj opțional
- Button "Invită familie" pe sidebar dashboard rezident (când nu există familie asociată)
- "+ Adaugă alt membru" pe sidebar când există deja o familie (max 5 membri per rezident)

### 2. Email cu link unic
**Template:** `src/lib/email/send.ts` — `familyInviteTemplate(args)`

Conținut:
- Saluts personalizat (nume primitor)
- Hero: "Bună, [Nume]. [Cămin] te invită în FamilyLink — locul în care primești update-uri zilnice și fotografii cu [Rezident]."
- CTA mare: "Intră în FamilyLink" → linkul Supabase
- Footer: "Linkul expiră în 7 zile."

Subject: `[Cămin] te invită în FamilyLink — vezi cum se simte [Rezident]`

### 3. Auth callback (familia dă click)
**File:** `src/app/auth/callback/route.ts` (Route Handler GET)

Flow:
1. Familia dă click pe link în email
2. Browser deschide `https://app.familylink.ro/auth/callback?code=XXX&type=magiclink`
3. Route Handler:
   a. Citește `code` din query
   b. `supabase.auth.exchangeCodeForSession(code)` → primește session cookies (HttpOnly, Secure, SameSite=Lax)
   c. Audit log entry (`action: "login"`, `metadata: { method: "magic_link" }`)
   d. Update `users.last_login_at`
   e. Determină destinația rolă-aware:
      - Try DB query pe `user_tenant_access`
      - Fallback email-mapping pentru demo
      - Default `family_owner` pentru magic link
4. `NextResponse.redirect("/portal")` — ajunge direct în portalul lui

### 4. Login alternative (familia revine)
**File:** `src/app/login/login-form.tsx`

Două tab-uri:
- **Cu parolă** (staff/super-admin) — `signInWithPassword`
- **Magic link** (familii) — `signInWithOtp({ shouldCreateUser: false })`

`shouldCreateUser: false` previne signup random — doar invitate de staff pot avea cont.

## Securitate

- Link-ul e single-use (Supabase invalidate după primul click)
- Expirare 1h pentru OTP, 7 zile pentru invite
- `redirectTo` whitelist via Supabase Auth → Settings → Site URL + redirect URLs
- HttpOnly cookies → JavaScript client nu poate citi token-ul
- PKCE flow (cod + verifier) — protejat împotriva interception
- Rate limit Supabase: 4 email/oră per recipient (free tier) — production cu Resend SMTP nu are această limitare

## Configurare necesară în Supabase Dashboard

### Authentication → URL Configuration
- **Site URL:** `https://app.familylink.ro` (production) sau `http://localhost:3000` (dev)
- **Redirect URLs:**
  - `http://localhost:3000/**`
  - `https://app.familylink.ro/**`
  - `https://*.familylink.ro/**`
  - `https://*-vercel.app/**` (pentru preview deploys)

### Authentication → Email Templates
Customize default Supabase emails (Romanian copy):
- Magic Link: subject "Conectează-te la FamilyLink"
- Invite User: subject "[Cămin] te invită în FamilyLink"

Sau (recommended pentru control complet) — disable default emails și folosește Resend cu template-urile noastre din `lib/email/send.ts`.

### Authentication → Providers → Email
- Enable **Email** provider
- Disable **Allow new users to sign up** (in production — only invite-based)
- **Confirm email** = true (dar prin invite e auto-confirmed)

### SMTP (production)
Supabase Dashboard → Settings → Auth → SMTP Settings:
- Host: `smtp.resend.com`
- Port: 587
- Username: `resend`
- Password: `RESEND_API_KEY`
- Sender: `FamilyLink <noreply@familylink.ro>` (cu DNS verified pe Resend)

## Open TODOs

- [ ] Configure custom SMTP Resend în Supabase Dashboard (production blocker)
- [ ] DNS verification pentru `noreply@familylink.ro` pe Resend (SPF + DKIM)
- [ ] Test rate limit cu 10+ familii invitate consecutiv (Supabase free are 4/h)
- [ ] Email open tracking via Resend webhooks → audit log enrichment
- [ ] "Renew session" prompt când sesiunea aproape expiră (90 zile)
- [ ] Fallback flow pentru familiile care pierd email-ul: la `/login` → tab Magic Link → trimite alt link

## Related

- [[FamilyLink Architecture Decisions]] §5 (Auth flows)
- [[FamilyLink GDPR Approach]]
- [[FamilyLink Subprocessors EU Audit]] — Resend EU + Supabase EU
- [[FamilyLink Faza 1 MVP]] §B — Portalul familiei
