---
name: project-rsm-romania-lead
description: "RSM Consulting Romania — lead nou TNS, discovery meeting 2026-07-22 pentru implementare AI în tax & consultanță"
metadata: 
  node_type: memory
  type: project
  originSessionId: 6b67b832-2ac0-4f6a-9635-bd3567f2772e
---

RSM Romania (membru rețeaua globală RSM — audit, tax, consulting, ~120 țări) a cerut un
discovery meeting pe **2026-07-22**: vor să implementeze AI în zona de tax și consultanță.

Unghi TNS: precedentul [[project-fox-ai-training]] (training corporate Claude, €1.000+€500,
contract semnat) + capabilitatea de platforme custom (Next.js+Supabase). Ladder propus la
discovery: (1) AI Readiness Workshop/training, (2) pilot pe 1-2 use-case-uri tax (research
fiscal grounded pe legislație, document review), (3) rollout + retainer. Constrângeri cheie
pentru ei: confidențialitatea datelor clienților, risc de halucinații pe legislație fiscală
(human-in-the-loop obligatoriu), EU AI Act.

Unghi tehnic propus de Eduard (2026-07-21): "agent OS local" pentru RSM RO — harness propriu
(model Hermes Agent de la Nous Research) pe schelet open-weight GLM-5.x (MIT, 744B MoE) sau
Kimi K3 (2.8T, weights din 27 iul 2026). Argument: suveranitatea datelor (self-host/EU-host),
vs. tool-urile RSM US (myRSM Tax/Luca/Atlas) care sunt US-centric și nelocalizate pe Codul
Fiscal RO. Recomandare Claude: pilot pe API enterprise cu DPA + zero-retention, open-source
on-prem ca faza 2 (GPU capex mare pentru 744B).

**Meeting-ul din 22 iul a avut loc.** Ce au cerut: (1) STRICT open-source, frică explicită de
data leaks + folosirea datelor la training; (2) au server propriu on-prem; (3) hosting acceptat:
Azure sau RunPod; (4) vor „un fel de Claude Code" = Hermes Agent + second brain; (5) 4 variante
de infrastructură cu costuri și capabilități per tier; (6) Client Gateway = grijă la deschiderea
rețelei spre exterior (soluție: DMZ + push unidirecțional); (7) use case suplimentar LinkedIn/
social media; (8) confidențialitate + restricții de securitate față de clienți.
**Decizii de poziționare (feedback Eduard 2026-07-23, REVIZUIT):** inferența e STRICT hostless
(comutare Azure Foundry ↔ RunPod), FĂRĂ cluster scump, nu se mai menționează deloc variante de
sute de mii EUR. Serverul RSM ține doar Second Brain + agentul instalat local. Agentul NU se
vinde ca „Hermes": e sistem tailored TNS („Asistentul RSM") construit pe fundația open-source
Hermes, fundația doar se explică în doc ca argument de soliditate. Varianta 1 = hostless cu
meniu de modele + diferențe de cost pe ore de birou (gpt-oss-120b $0.03/$0.18 → 10-30 EUR/lună,
DeepSeek V3.2 40-80, GLM-5 130-250, Kimi K3 700-900, pod dedicat RunPod ~600 fix); Varianta 2 =
GPU mic (2.5-4.5k EUR) în serverul lor pt. sarcini mărunte (clasificare, embeddings, anonimizare
locală). Securitatea = argument central, cu diagramă de flux de date (ce pleacă/ce nu pleacă).
Livrate în rsm-romania/: TNS_RSM_Infrastructura_AI.pdf (v2 hostless),
TNS_RSM_Client_Gateway_Functional.pdf (spec funcțional: portal + dosare de lucru + alocări cu
verificare de conflicte + matrice roluri, FĂRĂ costuri). Next step: sesiune tehnică 1h cu IT-ul RSM.

**Infrastructura v3 (2026-07-24), CORECȚIE COST importantă:** feedback Eduard = costurile v2 nu
erau realiste. Adevărul: la 30-60 useri, **serverless per-token (Azure Data Zone UE) bate DRAMATIC
podul dedicat RunPod**. RunPod dedicat = plătești placa/oră indiferent de uz → doar pt. izolare
single-tenant sau volum mare constant; modelele frontier (GLM-5.2 744B, Kimi K3 2.8T) NU se
rulează economic dedicat (ar cere 8×H200), doar per-token. Prețurile per-token din v2 erau de
fapt serverless, nu self-hosted RunPod — nu confunda cele două lumi.
Estimare reală 45 useri (~120M in + 25M out/lună, ~25 întrebări/user/zi × ~5k in + 1k out):
gpt-oss-120b 15-25 EUR, DeepSeek V3.2 45-70, GLM-5.2 160-240, Kimi K3 900-1.300, **MIX cu rutare
automată 120-200 EUR/lună**. Pod dedicat 1×H100 (gpt-oss-120b, acoperă lejer 30-60 useri):
~700-800 EUR ore birou / ~2.100-2.300 non-stop. RunPod Secure Cloud: H100 $2,89/h, H200 $4,39/h.
Piramida modele↔sarcini (ieftin+des→scump+rar): Gemma/Qwen (clasificare) → gpt-oss-120b (80% din
munca zilnică, încape pe 1×80GB) → DeepSeek V3.2 (analiză multi-pas) → GLM-5.2 (spețe grele, cel
mai bun open-weight, GPQA Diamond 91%) → Kimi K3 (agentic, context 1M, GPQA ~93%). Reper: Fable 5
GPQA ~93% ≈ GLM-5.2/Kimi (nu sacrifici calitatea pt suveranitate). **Rutarea automată = levierul
de cost** (ieftin pt 80%, scump doar pt 20%) — [[reference-gptimage2-diagrams]] Higgsfield era
fără credite, diagramele-s vectoriale reportlab în diagrams.py.
**Infrastructura v4 (2026-07-24, 18 pag) — FUZIUNE cu input ChatGPT.** Eduard a pus și ChatGPT
să facă research; a adus TNS_RSM_Infrastructura_AI_revizuit.pdf (18 pag). Am verificat matematica
lui = corectă, am integrat toată substanța în documentul nostru gold. CORECȚIA MARE pe care o
ratasem: **distincția Asistent vs Agent**. RSM a cerut „un fel de Claude Code" = AGENT, iar un
workflow agentic = 5-25 apeluri LLM/sarcină (planificare, căutare, tool calls, verificare, retry,
redactare), NU 1 apel ca la asistent → **11,5× mai mulți tokeni**. Estimarea mea de 1 apel
subestima masiv cazul agentic.
Două profile de cost separate: ASISTENT (45u × 25 × 22 × 1 apel, 5k/1k = 123,75M in / 24,75M out)
și AGENT HEAVY (30u × 15wf × 22 × 12 apeluri, 12k/2k = 1.425,6M in / 237,6M out). Cost agent:
gpt-oss $85→100-160 EUR, DeepSeek $375→450-650, GLM-5.2 $1.311→1.500-2.200, Kimi K3 $7.840→
9-12k EUR. Kimi-default = 91,7× gpt-oss, 20,9× DeepSeek. 5 scenarii de rutare cu %: Economic
350-700, Balanced 900-1.600, Premium 2.800-5.000, GLM-default 1.800-3.000, Fără-router 11-15k.
Caveat: % apeluri ≠ % tokeni.
Alte adaosuri ChatGPT integrate: rate limits/FinOps (per-user/team/model caps, kill switch,
degradare graceful), capacitate/concurență/latență („modelul încape pe GPU ≠ deservește 30-60
useri concurenți"; test 30 sesiuni concurente P50/P95 obligatoriu înainte de promisiune),
scoruri capabilitate Excel/Research/Consultant 1-5 + „nu-l folosim pentru", Excel safety (copie+
diff+aprobare, nu edit direct), skills Hermes (Planner/Router/RAG/Excel/Research/Reviewer/Memory
gate/Audit), plan 6 faze cu go/no-go, TCO (inferența=doar o linie; mentenanță 2-6k/lună, pilot
30-70k unic, producție 70-160k+ unic). RunPod rate corectat 3,29 USD/h H100 + 2×H100 pt concurență.
Poziționare: „nu vindem un chatbot de câteva sute EUR, ci o platformă internă de knowledge work".
Next step: sesiune tehnică 90 min cu IT + Legal + 2-3 consultanți. Build: build_rsm_infra.py.

**v5 (2026-07-24, 20 pag) — ajustări Eduard:** (1) SCOS secțiunea GPU local opțional. (2) În
loc de „Full Kimi K3" pusă în tabelul de rutare ca cel mai scump scenariu single-model
(~9-13k EUR), înlocuind „Fără router". (3) ADĂUGAT topologie explicită de implementare (3 secțiuni
noi): XIII „Cum se implementează" = Second Brain pe server + harness pe FIECARE laptop + acces la
model prin Gateway central (chei/buget/audit pe server, NU pe laptop; laptop fără cale directă la
furnizor); XIV „Azure vs RunPod în operare și cost" = tabel side-by-side pe ambele variante
(cum funcționează normal, cost, izolare, modele mari, când); XV „Securitatea datelor în această
topologie" = tabel laptop/server/drum-spre-furnizor cu risc+control + diagramă flux date.
Diagramă nouă: diagram_deploy. Structură finală 19 secțiuni (I-XIX).
**Fee-uri TNS:** Eduard a decis (2026-07-24) să NU punem fee-urile în doc, „banii îi zicem după".
Scos și secțiunea TCO care le acoperea implicit. Deci docul NU mai are nicio cifră de tip fee TNS.

**v6 (2026-07-24, 20 pag) — ajustări finale Eduard:**
- SCOS „Plan de implementare" și „Costul total al soluției" (TCO). Doc final = 17 secțiuni (I-XVII).
- Tabel rutare: „Full Kimi K3" în loc de „Fără router" (100% Kimi, ~9-13k EUR, cel mai scump).
- Reparată diagrama piramidă (diagram_modeltiers): overflow „IEFTIN FOARTE DES" + text bare de sus.
- ARHITECTURA CLARIFICATĂ (Eduard nu înțelesese cum am gândit-o, ceruse explicit): sistemul e
  EXACT modelul lui = app custom pe FIECARE laptop + laptop accesează serverul RSM (unde stau
  TOATE datele + memoria/Second Brain) + fiecare instanță se conectează la Azure (modelele).
  Secț. XIII rescrisă pedagogic (3 piese: laptop=panou de comandă/telecomandă fără date;
  server=seiful+memoria; Azure/RunPod=creier de închiriat). Explicat că singura micro-decizie e
  CUM ajunge laptopul la Azure: **Varianta A DIRECT** (fiecare Hermes sună Azure direct, auth
  per-user Entra ID, fără cheie comună pe laptop) vs **Varianta B PRIN SERVER** (broker central,
  cheie+buget+audit pe server). Ambele fezabile+sigure; B = control buget/audit ceva mai strâns
  (recomandat pt firmă audit), A = mai aproape de cum a gândit Eduard. Decizie la sesiunea tehnică.
  Diagrama diagram_deploy ilustrează varianta B; dacă Eduard alege A, de updatat diagrama.
- ADĂUGAT (cerință Eduard): urmărire PER UTILIZATOR — consum+cost/om, activitate (câte workflow-uri,
  ce modele), istoric detaliat (audit), plafoane+alerte per om, rapoarte pe echipă. Enabler =
  identitatea Entra ID pe fiecare cerere. Tabel + dark box în secț. XIII.

**v7 (2026-07-24) — corecții după frustrare Eduard (avea DREPTATE de 2 ori):**
1. SCOS coloanele BRUT (USD) + BUGET din tabelele de cost VIII/IX — îl confuzau. Acum o singură
   coloană „COST LUNAR ESTIMAT (EUR)". La fel „BUGET LUNAR"→„COST LUNAR ESTIMAT" în tabelul rutare.
2. SCOS secțiunea XII „Capacitate" — avea „1 H100 sau serverless" care sugera fals că GLM rulează
   pe 1 placă (GREȘIT: 1×H100 ține DOAR gpt-oss-120b; GLM/Kimi cer 8-16 plăci). Eduard s-a enervat.
3. Clarificat DISTINCȚIA fundamentală (Eduard: „la azure e pe baza de api nu? la runpod sa calculam
   usage gpu per model"): **Azure = API, plată per TOKEN, Microsoft găzduiește modelul, nu tu.
   RunPod = self-hosted, plată per ORĂ de placă, TU găzduiești modelul.** Secț III rescrisă cu asta.
4. ADĂUGAT secțiunea X nouă „Varianta RunPod: cost per model" — tabel GPU-per-model + cost ore-birou
   & 24/7: Gemma 1 placă ~220/~665 EUR, gpt-oss-120b 1×H100 ~710/~2.140, DeepSeek 8×H200 ~7.800/
   ~23.600, GLM-5.2 8×H200 ~7.800/~23.600, Kimi K3 16×H200 ~15.600/~47.200 EUR. Concluzie: pe RunPod
   doar gpt-oss-120b+modelul mic sunt rezonabile (1 placă); modelele mari = mii-zeci de mii/lună →
   se folosesc pe Azure per token. RunPod = doar izolare totală + doar gpt-oss-120b.
   Rate RunPod: H100 ~3,2 USD/h, H200 ~4,4 USD/h. Calcul în build_rsm_infra.py.
Structură finală: 17 secțiuni (I-XVII), 20 pag. LECȚIE: Eduard cunoaște infra bine, verifică
tehnic; nu inventa configurații nerealiste, separă clar API-per-token vs self-host-per-GPU.

Vault: sub-nod de creat în [[Business Plans & Consulting MOC]] dacă lead-ul avansează.
