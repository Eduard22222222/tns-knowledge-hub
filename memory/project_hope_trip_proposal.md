---
name: project-hope-trip-proposal
description: "Personal (non-client) romantic trip-proposal microsite for Eduard's girlfriend Hope (Norway), live at secret.thenichesociety.ro"
metadata: 
  node_type: memory
  type: project
  originSessionId: 4f425470-c97e-470c-8d6a-03c934eaf07b
  modified: 2026-08-17T14:18:50.528Z
---

Built a private "ask her on a trip" microsite for Hope (Eduard's girlfriend, Norwegian, clean-girl
aesthetic — pale pink/beige). Flow: entrance seal → letter reveal → "how much do you miss me"
slider (always animates/corrects to 100% no matter what she drags it to — that's the joke, not a
bug) → destination picker (grouped by region: España/Italia/Adriatic/Elsewhere, real Unsplash
photos downloaded locally) → date-range calendar → optional note → submit.

**Code:** `hope-secret/` (Vite+React+TS+framer-motion), dev port 5199, launch.json entry
`hope-secret`.

**Data:** reused the existing `clutch` Supabase project (`sjotjmpvrquyeluqdvbd`, personal account)
instead of paying for a new one — table `hope_trip_responses`, RLS allows anon INSERT only (no
read/update/delete via the public key). Eduard has to query it himself via the Supabase MCP/dashboard
to see her answer; there's no admin UI on the site.

**Deploy:** Netlify site `hope-secret-tns` (account `edumitriu04`), custom domain
`secret.thenichesociety.ro` — CNAME added directly via `netlify api createDnsRecord` on the
`thenichesociety.ro` Netlify DNS zone (zone id `69a18596e3373d00b7a7a61d`). Deployed by building
locally (`npm run build`) and `netlify deploy --prod --dir=dist` — NOT git-connected, so future
edits need a manual rebuild+redeploy, not a git push.

**Why it matters for future sessions:** if Eduard asks "did Hope answer yet" or "change the trip
page", the answer lives in that Supabase table, and edits require rebuilding+redeploying by hand
(check `hope-secret/.env.local` for the Supabase creds, gitignored).
