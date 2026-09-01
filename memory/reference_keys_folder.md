---
name: reference-keys-folder
description: Local keys/credentials folder — check here for tokens (esp. Supabase two-account setup) before asking the user
metadata: 
  node_type: memory
  type: reference
  originSessionId: 2768c176-6766-4f87-9f68-9fc39fe49127
---

Folder local de chei: **`C:\Users\adumi\.claude\keys\`** (gitignored, secrete în clar, doar pe mașină).
Index: `KEYS.md`. Verifică-l ÎNAINTE de a cere userului o credențială.

**Supabase — DOUĂ conturi** (vezi `keys/supabase.md`):
- **TNS (The Niche Society)** = DEFAULT pentru proiecte de client. Management PAT salvat în
  `keys/supabase.md` (prefix `sbp_`). Folosit prin Management API (`api.supabase.com/v1/...`,
  header `Authorization: Bearer <PAT>`, **User-Agent obligatoriu** ex. `curl/8.4.0` altfel
  Cloudflare dă 403 code 1010). Poate crea proiecte, lua service_role (`/api-keys?reveal=true`),
  rula SQL (`/database/query`). Orgs: „The Niche Society" nbatqkxvrksmjhuvrtcf + „office@…'s Org".
- **Personal (Eduard Dumitriu Org)** = contul la care sunt conectate MCP-ul Supabase + CLI-ul
  stocat pe mașină. Are tchibo-gameon, tns-leadgen, albalact, clutch. NU pentru client nou.

Regulă (userul a stabilit-o explicit): la orice proiect Supabase nou, userul spune **„personal"**
sau **„TNS"**. TNS → PAT via Management API; personal → MCP/CLI default. **Dacă NU specifică, ÎNTREABĂ
— nu presupune.** (Am greșit o dată presupunând personal când voia TNS.)
Legat de [[project-fox-saga-redeem]] + [[reference-comfortmap-deploy-git]] (regula „tot pe TNS").
