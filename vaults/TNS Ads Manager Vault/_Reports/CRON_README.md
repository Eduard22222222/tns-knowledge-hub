# TNS Ads Monitoring — Plan A (Chrome MCP + Cron)

**Setup date:** 2026-05-18
**Mode:** Plan A — Chrome MCP intră pe Google Ads + scrie raport în acest folder

## Cum funcționează

| Job | Schedule | Ce face |
|---|---|---|
| Daily | 09:23 Europe/Bucharest | Ambele campanii (TNS + GoaMasaj): metrici zi precedentă, anomaly check, raport `YYYY-MM-DD-daily.md` |
| Weekly | Vineri 10:11 | Deep audit `/ads google` Health Score + Search Terms, raport `YYYY-MM-DD-weekly.md` |

## Limitarea (acceptată conștient — Plan A)

Cron-urile sunt **session-only**: fire-uiesc DOAR cât timp:
1. Claude Code rulează (aplicația deschisă)
2. Claude e idle (nu mid-conversation) la ora respectivă

Dacă închizi complet Claude Code → cron-urile mor. Trebuie recreate.

## ⚙️ Cum recreezi cron-urile (dacă s-a închis sesiunea)

Spune-i lui Claude în chat, exact:

> recreate ads cron

Sau, dacă vrei manual, cere-i să ruleze `CronCreate` cu:

**DAILY (`23 9 * * *`, recurring):**
```
Account 461-423-2219. Campaigns: TNS 23860667212 (3 AGs, 26 RON/day, max CPC 12),
GoaMasaj 23854918247 (20 RON/day, max CPC 3). Open Chrome MCP → Google Ads overview
each campaign → yesterday metrics (Impr, Clicks, CTR, CPC, Cost, Conv) → anomaly check
(cost>80% budget, 0 impr after 24h, CTR<2%, CPC>80% max bid, conv=0 after 50 clicks,
status changed) → write OneDrive/Documents/TNS Ads Manager Vault/_Reports/<date>-daily.md
→ reply TL;DR + alerts. Read-only.
```

**WEEKLY (`11 10 * * 5`, recurring):**
```
Same account. /ads google deep audit both campaigns + Search Terms Report + Health Score
vs last week → write _Reports/<date>-weekly.md → reply scores + top 3 actions each. Read-only.
```

## Workflow zilnic pentru Eduard

1. Dimineața deschizi Claude Code (ca de obicei)
2. Dacă e după 09:23 și sesiunea a fost vie → raportul apare automat în chat în ~60s
3. Dacă sesiunea murise peste noapte → spune "recreate ads cron" + "verifica ads acum"
4. Citești raportul aici în `_Reports/` sau în chat
5. La 🚨 alert → decizi acțiunea, Claude o execută la confirmare

## Pista B (upgrade viitor — laptop-închis autonomy)

Necesită Google Ads API developer token (Basic) — aplicație + 1-3 zile aprobare Google +
OAuth GCP setup. Neînceput. Când vrei → cere "pornește pista B" și primești pașii.

## Campanii monitorizate

| Campanie | ID | Buget | Status (18.05) |
|---|---|---|---|
| [SEARCH] TNS - Dezvoltare & Marketing Bucuresti | 23860667212 | 26 RON/zi | 🟢 Learning |
| [SEARCH] GoaMasaj - Bucuresti | 23854918247 | 20 RON/zi | 🟢 Eligible (enabled 18.05) |
| Dezvoltați-vă afacerea cu noi (old Smart) | — | — | ⏸️ Paused (intenționat) |
