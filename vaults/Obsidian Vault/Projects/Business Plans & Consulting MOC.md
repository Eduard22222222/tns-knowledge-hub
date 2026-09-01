---
aliases: [Business Plans, Consulting, BP & Consulting]
tags: [moc, business-plan, consulting, finance]
created: 2026-06-27
updated: 2026-06-27
---

# Business Plans & Consulting MOC 📊

Nod mare pentru livrabilele de tip **plan de business / business case / modelare financiară /
consultanță** — altele decât showcase-urile FMCG ([[Macromex Brand Showcase|ConsumerVoice]]) sau
lead-gen ([[TNS Lead Gen System]]). Fiecare client primește un sub-nod legat aici; livrabilele
propriu-zise (PDF + PPTX + `model.py`) stau în folderul de cod dedicat.

## Client sub-nodes
- [[GoaMasaj Academy]] — **primul client** 🟢 plan pe 6 luni + parteneriat acreditare (școală de masaj, GOA × BioFocus)
- *(next: orice client nou de consultanță / plan de business primește nodul lui legat aici)*

## Rețeta repetabilă (template de livrabil)
1. **Model financiar = sursă unică de adevăr** în `model.py` (cohort-based, scenarii Conservator/Realist/Optimist =
   P10/P50/P90), importat ȘI de PDF ȘI de PPTX → cifrele nu pot să difere între livrabile.
2. **Business case structurat:** problemă → oportunitate de piață (TAM/SAM/SOM) → soluție → competiție →
   financiar → unit economics (CAC/LTV/payback) → riscuri → roadmap → „the ask".
3. **PDF premium** (reportlab, brandul clientului, cover + tabele + charts) + **PPTX** (python-pptx, charts native
   editabile, paletă de brand).
4. **Surse reale** pentru piață (WebSearch/WebFetch), citate în anexă.

## Skills folosite (din [[Claude Skills Index]])
- Financiar: `startup-financial-modeling`, `startup-business-analyst-financial-projections`
- Piață & business case: `startup-business-analyst-market-opportunity`, `startup-business-analyst-business-case`, `business-analyst`
- Livrabile: `pptx` (deck), reportlab (PDF)

## Lecții (de citit înainte de orice plan nou)
- ⚠️ Verifică ARITMETICA rulând `model.py` înainte de a turna cifre în PDF/PPTX.
- ⚠️ **Adună totalurile** (cumulat pe orizont), nu doar snapshot-uri pe faze — golul tipic al planurilor „de ChatGPT".
- ⚠️ Include **costurile reale** (marketing / conținut / materiale / buffer), nu doar COGS-ul evident → profit NET, nu brut.
- Diacriticele RO ies corect cu GeorgiaPro + Calibri (Windows); pe PDF strip emoji, pe PPTX rămân.

## Related
- [[Projects MOC]] · [[Creatives MOC]] · [[Claude Skills Index]] · [[The Niche Society]]
