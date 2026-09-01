---
name: Salt Bank Ecosystem Project
description: TNS software proposal for Salt Bank Romania — 4-product digital ecosystem (Calculator Fiscal, Contabilul Partener, Financial Planner AI agent, Investment Buddy robo-adviser). All features defined with pricing, ROI, infrastructure.
type: project
---

Eduard is building a software proposition for Salt Bank Romania through TNS (The Niche Society).

**What:** 4 interconnected digital products forming a "Financial Operating System":
1. Calculator Fiscal PFA vs SRL — public SEO web tool for lead acquisition (€15-20K)
2. Contabilul Partener — accountant partner dashboard with SmartBill write integration (€60-70K)
3. Financial Planner AI — conversational agent: "Un CFO personal in buzunar" — goals, forecasting, auto-allocate, Salt Score, charts, simulations (€50-65K)
4. Investment Buddy — robo-adviser under Salt's MiFID II license (€55-70K)

**Bundle price:** €130-170K. Don't show pricing in first meeting.

**Key decisions made:**
- SmartBill integration: write-only (Option B) — mark payments, issue invoices via API
- Calculator: standalone public webpage for SEO
- Financial Planner: full conversational agent with function calling — can talk freely, generate charts, move money, run simulations, remember everything about each user
- Investment Buddy: robo-adviser (not just education) — operates under Salt's existing ASF/MiFID license
- AI model: open-source self-hosted on RunPod EU (Mistral or GLM-5). NOT cloud APIs (GDPR delay). Don't emphasize model origin in proposal.
- GPU strategy: A100s are cheaper than H100s for same throughput (8x A100 = $6,400/mo vs 3x H100 = $7,500/mo)
- Data architecture: financial data stays in Salt's systems, accessed via API. Our DB stores only conversations, agent memory, goals, scores.
- Infrastructure scales: $300/mo pilot → $6,400/mo at 100K users

**Proposal style:** Keep emojis, conversational examples, concrete Romanian scenarios (Ana 28yo IT, Mihai, etc.). Include chat mockups showing agent conversations.

**Meeting strategy:** Document 1 (vision + ROI, no price) → they ask for offer → Document 2 (full technical + pricing)

**Files:** All feature definitions saved in `C:\Users\adumi\OneDrive\Desktop\claude\salt-bank-project\`
- 00-project-overview.md
- 01-contabilul-partener.md
- 02-calculator-fiscal.md
- 03-financial-planner-ai.md
- 04-investment-buddy.md
- 05-meeting-strategy.md
- 06-infrastructure-scaling.md

**How to apply:** Reference these files when continuing this project. Maintain all decisions. Eduard builds this himself with Claude Code — real cost ~€15-20K, selling at €140K+.
