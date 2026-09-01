---
tags: [social-media, linkedin, instagram, content-draft, ai-education]
created: 2026-07-10
updated: 2026-07-10
status: draft
---

# Draft-uri postări AI educaționale — pentru PAGINA TNS (nu profil personal)

Batch scris 2026-07-10. **Toate merg pe pagina de companie** (poziționare = experți AI). Pe profilul personal al lui Eduard merg poveștile/build-in-public din [[04-backlog-postari-luna-1]]. Când o postare de pe pagină merită reshare pe profil, Eduard adaugă un rând personal deasupra (nu repostare seacă).

**Regulă de voce (din memoria feedback_content_voice):** FĂRĂ „AI fără jargon" / „fără termeni tehnici" — e AI slop. Explicăm pe limba patronului prin exemple, nu prin sloganul „fără jargon". Benchmark-urile sunt REALE, cu surse (vezi mai jos).

## Împărțirea personal vs. pagină (răspuns la întrebarea lui Eduard)
| Tip conținut | Unde | De ce |
|---|---|---|
| Educație AI, analiză modele (GPT-5.6, Fable, Claude vs ChatGPT), cum se integrează AI în procese | **Pagina TNS** | Poziționează firma ca autoritate tehnică |
| Poveste personală, de ce am fondat TNS, proiecte cu nume (FOX, ComfortMap), lecții | **Profil Eduard** | Oamenii urmăresc oameni; reach personal 5-10× |
| Reshare cu take personal | Profil → citează pagina | Amplifică fără să pară corporate |

---

## SURSE BENCHMARK (verificate 2026-07-10, NU inventate)
- GPT-5.6: Artificial Analysis, Simon Willison (simonwillison.net/2026/Jul/9/gpt-5-6), Vellum, TechTimes
- Claude Fable 5: VentureBeat, llm-stats.com, Vellum, claude5.ai
- Claude vs ChatGPT: Zapier, NxCode, pecollective, tech-insider

Cifre-cheie folosite:
- GPT-5.6: 3 modele — Luna ($1/$6), Terra ($2.50/$15), Sol ($5/$30) per 1M tokens. Cutoff feb 2026, context 1M, output 128K. Terminal-Bench 2.1: 91.9% (Ultra), 88.8% (base). Artificial Analysis Intelligence Index: Sol (max) = 59.
- Claude Fable 5: Intelligence Index (max) = 60 (Sol e cu 1 punct sub, la ~1/3 din cost). SWE-Bench Pro 80.3%, SWE-bench Verified 95.5%. $10/$50 per 1M. Cel mai capabil model GA Anthropic.
- „Problema benchmark": OpenAI a publicat că ~30% din task-urile SWE-Bench Pro sunt stricate; pe el Fable ia 80%, Sol 64.6% — deci comparația e contestată.
- Claude vs ChatGPT: Claude ~95% acuratețe funcțională pe cod vs ~85% ChatGPT; Claude câștigă la context lung + urmărirea instrucțiunilor complexe + Claude Code; ChatGPT câștigă la versatilitate + multimodal + ecosistem.

---

## POST 1 (PAGINĂ) — Cum funcționează de fapt un AI (și de ce îl folosești la 10%) [Pilon: educație]
FORMAT: carusel LinkedIn (7 slide-uri) sau text lung
REV 2026-07-10: rescris pe feedback „actually useful, mai adânc" — mecanica reală, nu superficial.
HOOK:
> Toată lumea folosește AI. Aproape nimeni nu știe ce se întâmplă când apeși Enter. Iar dacă nu știi cum funcționează, plătești pentru un instrument pe care-l folosești la 10%. 5 minute și înțelegi mecanica.

BODY:
1. **Nu „știe" — a comprimat.** La antrenare a citit un volum uriaș de text și a învățat tiparele. Nu are o bază de date cu răspunsuri; are o intuiție statistică despre ce urmează. De-asta poate scrie despre orice — și de-asta uneori spune, cu aceeași siguranță, lucruri false.
2. **Cunoașterea e înghețată la o dată. Raționamentul, nu.** Știe lumea până la data antrenării (GPT-5.6 și Claude Fable 5 — feb. 2026). Nu află singur ce s-a întâmplat ieri. Dar raționează pe orice îi pui în față ACUM — contract, tabel, email.
3. **Contextul = memoria de lucru, uriașă acum.** Modelele de top țin ~1 milion de cuvinte simultan (~10 cărți). Îi dai tot manualul de proceduri + istoricul unui client + oferta concurenței și le procesează deodată. Când conversația se termină, memoria se golește — dacă n-ai un loc unde salvezi (vezi Post 3, al doilea creier).
4. **De ce halucinează — și cum oprești.** Optimizează pentru „plauzibil", nu „adevărat". Când nu are informația, o inventează convingător. Soluția nu e „să nu minți" — e să-i dai sursa. Cu documentul în față încetează să ghicească: îți citează rândul. Diferența dintre „cred că e 30 de zile" și „art. 7 spune 30, uite-l".
5. **Modelele noi «gândesc» înainte să răspundă.** Un model de raționament își face pași interni, verifică, se corectează, apoi răspunde. De-asta la calcul/logică/cod e mult mai bun decât acum un an.

Concluzie: AI-ul nu e oracol. E un motor de raționament rapid pe informația pe care i-o dai. Cine îi dă informația corectă și uneltele potrivite câștigă. Cine îl folosește ca pe un Google mai deștept, nu.
CTA: Ce te-a surprins? Sau ce n-ai înțeles niciodată despre AI? Întreabă în comentarii.
HASHTAGS: #ai #inteligentaartificiala #digitalizare #antreprenoriat #business

---

## POST 2 (PAGINĂ) — Cum automatizezi de fapt un proces (raportul lunar, pas cu pas) [Pilon: AI aplicat]
FORMAT: text + carusel 6 slide-uri (pașii agentului)
REV 2026-07-10: rescris pe feedback — exemplu concret (raport lunar) + cum acționează agentul pe el, pas cu pas. Vindem ideea de automatizare prin demonstrație.
HOOK:
> „Automatizare cu AI" sună abstract până vezi un proces real desfăcut în pași. Iau unul pe care-l are aproape orice firmă: raportul lunar. Îți arăt exact ce face un agent pe el.

BODY:
Procesul azi (manual, ~3 ore/lună): un om descarcă vânzările din platformă, deschide exportul din contabilitate, le potrivește linie cu linie, calculează pe produs și client, observă anomaliile, scrie un rezumat, îl formatează în șablon, îl trimite.

Același proces cu un agent. Definești o dată 3 lucruri — de unde ia datele, ce reguli aplică, cum arată rezultatul. Apoi, lunar, agentul:
1. **Adună** — deschide cele două fișiere (vânzări + contabilitate), din locul unde stau.
2. **Acționează** — potrivește liniile după nr. factură, calculează totalurile pe produs/client, marchează ce iese din tipar (produs vândut sub cost, client cu întârziere neobișnuită).
3. **Verifică** — recalculează, compară cu luna trecută, semnalează diferențele suspecte.
4. **Livrează** — scrie rezumatul în șablonul tău, cu anomaliile evidențiate sus.

Tu nu mai faci 3 ore. Faci 10 minute de verificat exact punctele marcate.

Diferența cheie: un agent nu „răspunde la o întrebare". Rulează un ciclu — adună → acționează → verifică — pe uneltele tale, cu regulile tale, de câte ori vrei. Un chatbot îți dă un răspuns. Un agent îți face treaba.

Ce se automatizează la fel: reconcilieri, oferte din cerere, răspunsuri la RFQ, procesare comenzi, rapoarte recurente, verificări de conformitate.
CTA: Spune-mi un proces repetitiv din firma ta și îți desfac în pași cum l-ar face un agent. Comentariu sau DM.
VIZUAL: carusel — slide/pas (Adună/Acționează/Verifică/Livrează) + „manual 3h → 10 min".
HASHTAGS: #ai #automatizare #eficienta #procese #business

---

## POST 3 (PAGINĂ) — „Al doilea creier" al firmei: ce e un harness custom [Pilon: educație/ofertă — PRODUSUL REAL]
FORMAT: carusel (6-7 slide-uri)
REV 2026-07-10: REFRAMAT complet pe feedback — nu mai e despre model privat/open-source. Vindem ideea de HARNESS CUSTOM: ce e, unelte (ce poate face în plus), al doilea creier (de unde preia info). Ăsta e produsul nostru real.
HOOK:
> Un model AI, singur, e un creier genial închis într-un borcan. Deștept — dar fără mâini, fără memorie, fără habar de firma ta. Tot ce e valoros se întâmplă când îl scoți din borcan. Se cheamă harness. Uite ce e.

BODY:
Un model brut poate doar să genereze text. Nu deschide un fișier, nu-ți știe clienții, nu-și amintește ce ai discutat săptămâna trecută. Un harness e sistemul pe care-l construiești în jurul modelului ca să devină util în firmă. Are 2 părți:

1. **Unelte — mâinile.** Fiecare unealtă = o acțiune nouă: citește/scrie fișiere, interoghează baza ta de date, trimite email-uri, caută pe web, rulează calcule, se conectează la sistemele tale (facturare, CRM, stoc). Fără unelte, AI-ul vorbește. Cu unelte, acționează.

2. **Al doilea creier — memoria.** Un loc unde stă cunoașterea firmei: proceduri, info produse, istoricul deciziilor, particularitățile fiecărui client, ce a mers și ce nu. Înainte să facă orice, AI-ul citește de acolo — răspunde din realitatea firmei tale, nu din „cultură generală de internet". Și scrie înapoi: memoria crește cu fiecare interacțiune. Firma capătă o memorie care nu pleacă când pleacă un angajat.

Împreună: nu mai ai un chatbot. Ai un sistem care știe cum funcționează firma ta (creierul), poate face lucruri în ea (uneltele), și devine mai bun cu fiecare săptămână (memoria).

Asta construim. Nu un abonament la un chat — al doilea creier al firmei, cu uneltele care contează pentru tine și cunoașterea ta înăuntru.
CTA: Ce ar trebui să „știe" un asemenea creier ca să-ți fie util din prima zi? Scrie-mi și-ți spun cum l-am construi.
VIZUAL: carusel — „creier în borcan" → unelte (listă mâini) → al doilea creier (memorie) → cele 3 împreună.
HASHTAGS: #ai #agenti #automatizare #harness #business

---

## POST 4 (PAGINĂ) — GPT-5.6 a apărut. Ce înseamnă pentru firma ta? [+ CAROUSEL INSTAGRAM]
FORMAT: LinkedIn text + Instagram carousel (8 slide-uri, generat separat în tns-brand/carousel-gpt56/)
HOOK:
> OpenAI a lansat GPT-5.6. Titlurile spun „cel mai bun model din istorie". Realitatea, cu cifre în mână, e mai nuanțată — și exact nuanța aia contează dacă bagi bani în AI pentru firma ta.

BODY:
Ce s-a lansat: 3 modele — Luna (ieftin), Terra (mijloc), Sol (vârf). Prețuri de la 1$ la 30$ per milion de cuvinte procesate. Context 1M, la zi până în februarie 2026.

Ce e impresionant (real):
→ Sol conduce pe Terminal-Bench 2.1 (test de programare) cu 91.9%
→ Pe indexul de inteligență Artificial Analysis, Sol e la 59 puncte — la ~1/3 din costul concurentului direct

Ce nu-ți spun titlurile:
→ Sol e cu **1 punct sub Claude Fable 5** pe același index de inteligență. Deci „cel mai bun" depinde de test.
→ Și aici e partea tare: **OpenAI însuși a publicat că ~30% din task-urile unui benchmark popular (SWE-Bench Pro) sunt stricate.** Pe acel test, Claude ia 80%, GPT-5.6 Sol ia 64.6%. Concluzia? Benchmark-urile se contrazic.

Lecția pentru business: **nu cumpăra hype-ul, testează pe procesul TĂU.** Modelul care câștigă un benchmark de laborator nu e neapărat cel care-ți rezolvă factura, contractul sau campania. Noi testăm modelele pe cazul concret al clientului înainte să recomandăm ceva.

CTA: Vrei să știi care model se potrivește pe ce faci tu? Scrie-ne.
VIZUAL: Instagram carousel 8 slide-uri (vezi tns-brand/carousel-gpt56/). LinkedIn: primul slide ca imagine + link în comentariu.
HASHTAGS: #gpt5 #openai #ai #inteligentaartificiala #tech

### Structura caruselului Instagram (8 slide-uri):
1. Cover — „GPT-5.6 a apărut. Ce înseamnă pentru firma ta?"
2. Familia — Luna / Terra / Sol + prețuri
3. Ce impresionează — Terminal-Bench 91.9%, index 59
4. Dar... 1 punct sub Claude Fable 5, la 1/3 din cost
5. Problema benchmark-urilor — OpenAI: ~30% task-uri stricate; Fable 80% vs Sol 64.6%
6. Ce e de fapt nou — programmatic tool calling, multi-agent, 1M context
7. Lecția pentru business — testează pe workflow-ul TĂU
8. CTA — The Niche Society + contact

---

## POST 5 (PAGINĂ) — Claude Fable 5: cel mai capabil model Anthropic [Pilon: educație]
FORMAT: text
HOOK:
> Cât timp toată lumea vorbea de GPT-5.6, Anthropic a scos Claude Fable 5 — și pe testele de programare serioasă, e cu ~11 puncte peste tot restul. Iată de ce contează pentru firme, nu doar pentru programatori.

BODY:
Cifrele (reale): pe SWE-Bench Verified — un test unde modelul trebuie să rezolve probleme reale de software — Fable 5 ia 95.5%. Pe SWE-Bench Pro, 80.3%, cu ~11 puncte peste următorul model. E cel mai capabil model disponibil public de la Anthropic.

De ce contează pentru o firmă care NU face software:
→ Modelul care e cel mai bun la cod e, de obicei, și cel mai bun la **raționament pe mai mulți pași** — exact ce-ți trebuie pentru automatizări care nu greșesc (procesare documente, verificări, fluxuri cu reguli).
→ Context de 1M cuvinte = poate „ține în cap" un contract întreg, un manual, o bază de date de proceduri, fără să piardă firul.

Onestitatea noastră: Fable 5 e scump ($10/$50 per milion de cuvinte — de câteva ori mai mult decât alternativele). Pentru sarcini simple, e risipă. Îl folosești unde chiar contează precizia. Restul le faci cu modele mai ieftine. Arta e să alegi corect — și asta facem pentru clienți.

CTA: Nu știi ce model merită pe ce task? Exact asta rezolvăm. DM.
HASHTAGS: #claude #anthropic #ai #inteligentaartificiala #business

---

## POST 6 (PAGINĂ) — Claude vs ChatGPT: care, pentru ce [Pilon: educație]
FORMAT: carusel (6 slide-uri) + text
HOOK:
> „Claude sau ChatGPT?" e întrebarea greșită. E ca „ciocan sau șurubelniță?". Depinde ce baţi. Iată împărțirea reală, cu cifre, ca să nu plătești pentru abonamentul greșit.

BODY:
Ce spun testele independente (2026):
→ Pe cod, Claude atinge ~95% acuratețe funcțională vs ~85% ChatGPT.
→ Claude câștigă clar la: **context lung** (ține documente/coduri întregi fără să piardă firul), **urmărirea instrucțiunilor complexe** (respectă reguli detaliate mai fidel) și **Claude Code** (execută proiecte întregi, nu doar răspunde).
→ ChatGPT câștigă la: **versatilitate**, **multimodal** (imagini, voce), **ecosistem de integrări**.

Un detaliu subtil care contează enorm în practică — **analiza fișierelor de instrucțiuni (.md)**:
Claude Code citește un fișier text simplu (numit CLAUDE.md) în care scrii, o dată, cum lucrează firma ta: ce format, ce reguli, ce e interzis. De fiecare dată respectă acele reguli — fără să i le repeți. E ca un angajat care a citit manualul de proceduri și nu-l uită niciodată. Asta transformă AI-ul dintr-un „ajutor ocazional" într-un membru al echipei cu reguli clare.

Concluzie pentru firme: nu alegi „câștigătorul". Alegi unealta pe task. Multe firme le folosesc pe amândouă — și noi le configurăm pe amândouă corect.

CTA: Plătești pentru un abonament AI și simți că nu-l folosești la maxim? DM — facem un audit rapid.
VIZUAL: carusel comparativ — coloane Claude / ChatGPT, apoi slide-ul cu .md files, apoi „le folosești pe amândouă".
HASHTAGS: #claude #chatgpt #ai #productivitate #business

## Status
- 2026-07-10: 6 draft-uri + spec carusel GPT-5.6. Aștept green-light Eduard pe care se publică și în ce ordine. Carusel Instagram generat în tns-brand/carousel-gpt56/.

## Legături
- [[00-branding-social-moc]]
- [[03-motor-de-postari-tns]]
- [[04-backlog-postari-luna-1]]
