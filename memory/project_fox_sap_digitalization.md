---
name: project_fox_sap_digitalization
description: "FOX (mezeluri) runs SAP; TNS discovery pitch for production+logistics digitalization side-by-side on SAP, flagship \"Production Brain\" solver"
metadata: 
  node_type: memory
  type: project
  originSessionId: 53bfe496-9f15-4d1b-ba8e-6a54e78da08a
---

Third FOX opportunity (after [[project_fox_ai_training]] and [[project_fox_saga_redeem]]). Director general wants a **label system to streamline logistics**. Discovery meeting ~2026-07-23.

**Critical fact:** FOX's ERP is **SAP** (not SAGA — "SAGA" at FOX = the music festival in the redeem project, unrelated to SAGA accounting / [[project_saga_mcp]]). Do NOT pitch SAGA-accounting integration for FOX.

**Positioning:** Clean Core — never touch SAP core; build **side-by-side extensions on SAP BTP** via OData/IDoc/events. TNS = the modern/consumer/AI layer SAP does poorly. SAP already has Batch Management, Catch Weight Management (CWM), EWM/SSCC + GS1-128 print — so ask first: S/4HANA vs ECC? EWM+CWM active? That decides build vs tuning.

**Module menu:** recall 1-click, PWA depozit + FEFO, EDI retail (SSCC in DESADV) + e-Factura orchestration, QR consumator (connected packaging, GS1 Digital Link, Sunrise 2027), giveaway-weight dashboard, OEE + digital allergen-changeover checklist, cold-chain IoT/HACCP. Biggest hidden ROI = **giveaway** (up to 3% product given away, usually unmeasured).

**Flagship "FOX Production Brain"** (advanced solver Eduard requested): closed loop = (1) Demand Simulator [ML forecast on SAP history + **MiroFish** agent-swarm scenario engine] → (2) MILP/CP-SAT optimizer over many constraints (capacity, shelf-life, allergen changeover sequencing, giveaway, raw material, shifts) → (3) what-if simulation → human-approved plan back to SAP. Pilot on 1 line/few SKU first (needs clean historical data). MiroFish = open-source multi-agent swarm simulation engine (OASIS-based) — position as scenario/what-if engine, not oracle.

**Deliverables built:** discovery package in `fox-discovery/` — `TNS_FOX_Discovery.pdf` (client leave-behind, no prices, gold style) + `TNS_FOX_Cheatsheet_Intern.pdf` (discovery questions, numbers, objections, verbal pricing, one-liners). Built with `build_fox_pdfs.py`, cloned style from [[reference_tns_proposal_template]] / RSM (rsm-romania/build_rsm_pdfs.py). Verbal pricing: discovery 2.5-4k, quick wins 8-16k, Production Brain pilot 20-40k, full program 60-120k EUR.
