---
tags: [moc, knowledge, contabilitate, ceccar, fiscal]
created: 2026-07-22
updated: 2026-07-22
status: active
---

# Contabilitate CECCAR MOC

Punctul de intrare pentru „creierul contabil" — cunoștințele de contabilitate și fiscalitate românească pe care Claude le consultă **înainte** de a propune înregistrări, de a pregăti declarații sau de a lucra cu datele SAGA ale Conta4U și ale clienților.

Rol: să înregistrăm corect, conform reglementărilor, nu din memorie sau intuiție. Se leagă de [[Claude Skills Index]] (skill-ul `ceccar-expert`) și de infrastructura tehnică din `saga-mcp/`.

## ⚖️ Regula de aur (citește prima)
- [[Regula — Cercetare Surse Autoritative]] — **când un tratament contabil sau fiscal nu e 100% clar, NU ghicim.** Căutăm la sursă (Codul Fiscal, Monitorul Oficial, ANAF, CECCAR), verificăm că e în vigoare, notăm cu baza legală, apoi acționăm. Fiecare speță rezolvată devine o notă nouă aici.

## 🧱 Fundamente
- [[Plan de Conturi General]] — structura pe clase (OMFP 1802/2014), cum citesc conturile din SAGA
- [[TVA și Decont]] — 4426 / 4427 / 4423 / 4424 și logica decontului lunar (leagă de D300)

## 📒 Monografii contabile (înregistrări tip)
- [[Monografie — Achiziții și Furnizori]] — intrări marfă/servicii, 401, TVA deductibilă
- [[Monografie — Vânzări și Clienți]] — ieșiri, 4111, TVA colectată
- [[Monografie — Bancă și Casă]] — încasări/plăți, 5121 / 5311, reconciliere extras
- Salarii și contribuții — *de construit* (rate se verifică la zi via [[Regula — Cercetare Surse Autoritative]])
- Amortizare imobilizări — *de construit*
- Închideri de lună (TVA, venituri/cheltuieli, 121) — *de construit*

## 🛠️ Operarea SAGA (capcane verificate)
- [[SAGA — citirea bazei Firebird cu isql]] — citești baza **live**, fără să închizi programul; harta tabelelor și calculul venituri/cheltuieli direct din `REGISTRU`
- [[SAGA — Preluarea de date și blocarea meniului]] — meniul gri = flag `PRELUAT`, **nu** date lipsă; cum diagnostichezi și repari

## 🔌 Legătură cu sistemul tehnic
- MCP-ul `saga` (18 tool-uri, read-only) citește baza SAGA: balanță, fișă cont, jurnal, facturi, declarații D300/D394, reconciliere extras ING (MT940). Cod în `saga-mcp/`. Din 28.07.2026 citește **și firmele Firebird** (Conta4U) — vezi [[MCP saga — suport Firebird și unelte fiscale]].
- Fluxul de lucru: MCP-ul citește datele reale → consult monografia potrivită de aici → propun înregistrarea/declarația → **omul validează și depune** (nu urc autonom în SPV, semnătura rămâne a lui Eduard).

## 📥 De extins
Creierul crește în două feluri: (1) materialele proprii CECCAR / standardele interne Conta4U pe care le importă Eduard, și (2) fiecare speță reală pe care o rezolvăm — o transformăm în monografie aici, cu baza legală. Vezi [[The Niche Society]].
