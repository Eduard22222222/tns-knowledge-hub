---
name: skill-wsl2-docker-gotchas
description: "Reusable WSL2+Docker debugging playbook — idle VM shutdown kills containers, Git Bash mangles /mnt paths, PM2 hides EADDRINUSE, stale browser console errors"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 4545310d-4b10-48f9-9b72-45984fa9ac6a
  modified: 2026-07-28T16:27:12.212Z
---

Capcane de infrastructură WSL2 + Docker pe laptopul lui Eduard, descoperite depanând [[project-postiz-selfhost]] (2026-07-25).

**1. WSL2 oprește VM-ul din idle → containerele mor ciclic.** Simptom: `docker ps` arată toate containerele "Up 3 seconds" la fiecare verificare, `dockerd` pare că repornește (dar `NRestarts=0`), aplicațiile cu boot lung (>60s) nu apucă NICIODATĂ să termine. Diagnostic decisiv: `wsl -d Ubuntu -- cat /proc/uptime` — dacă SCADE între verificări, VM-ul se reciclează, nu Docker. Fix: proces keepalive persistent (`wsl -d Ubuntu -u root -- sh -c 'while true; do sleep 3600; done'` în background). Un watcher cu buclă strânsă ține VM-ul viu accidental — de-aia lucrurile par stabile în timpul monitorizării și se strică imediat după.

**2. Git Bash strică path-urile `/mnt/c/...`.** `wsl -- cp "/mnt/c/..."` prin tool-ul Bash devine `C:/Program Files/Git/mnt/c/...`. Variabilele shell nu se expandează nici prin `wsl bash -c '...'` nested (quoting stâlcit). Fix: rulează `wsl` din **PowerShell** (nu face path-munging). `\\wsl.localhost\Ubuntu\root\...` dă Access denied (accesează ca user non-root).

**3. PM2 ascunde erorile reale de startup.** Un proces poate raporta `status: online, restart_time: 0` și totuși să nu asculte pe port. `docker logs` arată doar banner-ul de start, iar `~/.pm2/logs/*-error.log` poate fi GOL. Fix: rulează comanda exact ca PM2, manual: `docker exec <c> timeout 30 pnpm start` — abia atunci apare eroarea (la noi: `EADDRINUSE :::3000`, port ținut de procese rămase din ciclurile de reboot + instanțele mele de test). Un `docker restart` curat rezolvă.

**3b. Container recreat = rețele multiple PIERDUTE (Docker Compose).** Când adaugi un serviciu nou în compose şi ruleazi `docker compose up -d`, un container recreat se poate reataşa **doar la prima reţea** din listă, chiar dacă compose-ul declară două. Simptom: frontend-ul merge (200) dar API-ul dă **502**, iar PM2 raportează procesul `online, 0 restarts` — vezi punctul 3, PM2 ascunde eroarea. Adevărul e în `~/.pm2/logs/<proc>-error.log`: la noi `Name resolution failed for target dns:temporal:7233`. Diagnostic: `docker inspect <c> --format '{{json .NetworkSettings.Networks}}'` (atenţie: `{{range $k,$v := ...}}` dă *template parsing error* prin acest shell — foloseşte `json` + parse) şi `docker exec <c> getent hosts <alt-serviciu>`. Fix: `docker compose up -d --force-recreate <serviciu>`. **Verifică întotdeauna reţelele după ce adaugi un serviciu nou în compose.**

**4. Consola browserului păstrează erori STALE.** `ChunkLoadError` a persistat în buffer după ce fix-ul funcționa. Nu declara "e stricat" pe baza consolei — verifică `curl` pe chunk-ul respectiv (dădea 200) și testează funcțional (scrie în input + citește valoarea înapoi: dacă se lipește, React e hidratat).

**5. Interpretează corect codurile HTTP la verificare.** `307` pe `/` = redirect corect spre login (NU eroare — un watcher care așteaptă strict 200 raportează fals "unstable"). `502` = backend mort. `404`/`400` pe un endpoint API = backend VIU care validează cererea (= succes). Screenshot-ul poate da timeout pe pagini grele deși pagina e perfect funcțională — `read_page` e mai robust ca dovadă.
