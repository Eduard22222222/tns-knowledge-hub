---
name: skill_netlify_intermittent_ssl
description: Intermittent ERR_SSL_PROTOCOL_ERROR on a Netlify custom domain = duplicate/stale apex A record
metadata: 
  node_type: memory
  type: reference
  originSessionId: 20040b33-d36a-4bad-9023-39a15c8160a3
---

Symptom: a Netlify-hosted custom domain throws `ERR_SSL_PROTOCOL_ERROR` / "a trimis un răspuns nevalid" for SOME visitors or intermittently, while loading fine for others (and fine from your own machine). Classic cause: the apex has **two A records** and DNS round-robins between them — one is Netlify's good IP, the other is a stale/wrong IP with no valid TLS cert for the domain.

**Why:** Netlify's correct apex A record is a single IP **`75.2.60.5`** (+ IPv6 `2620:4d:...`). Any extra apex A record (e.g. a leftover `99.83.190.102` from a previous host) answers ~half of lookups and fails the TLS handshake → SSL protocol error. Hurts real users AND Googlebot.

**How to diagnose (don't trust one load — it may hit the good IP):**
1. Get ALL apex A records: `https://dns.google/resolve?name=DOMAIN&type=A` (or check the Netlify DNS zone records).
2. Test EACH IP directly: `curl -sS -o /dev/null --max-time 20 -w "HTTP=%{http_code} ssl=%{ssl_verify_result} ip=%{remote_ip}\n" --resolve DOMAIN:443:THE_IP https://DOMAIN`. The bad IP returns `HTTP=000` + `schannel ... SEC_E_ILLEGAL_MESSAGE` (fatal TLS alert).

**How to fix (when DNS is Netlify-managed, NS = `*.nsone.net`):** delete the bad record via CLI —
`netlify api getDnsZones --data '{}'` → find zone_id;
`netlify api getDnsRecords --data '{"zone_id":"..."}'` → find the bad A record's id;
`netlify api deleteDnsRecord --data '{"zone_id":"...","dns_record_id":"..."}'` (returns `""` on success).
Verify against the authoritative NS to bypass cache: `nslookup -type=A DOMAIN dns1.pXX.nsone.net`. Then `ipconfig //flushdns`. Note TTL (was 3600s = up to 1h) — cached resolvers/HSTS on the client may keep failing until TTL expires; tell user to flush DNS + try incognito.

First hit: impactalpinexpert.ro, 2026-06-15 (bad record added ~2025-11-02, after the site had been working). Eduard runs many Netlify-DNS domains, so this pattern can recur. See [[project_impactalpinexpert]].
