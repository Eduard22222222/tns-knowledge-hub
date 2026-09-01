---
tags: [project, active, fintech, salt-bank]
client: Salt Bank Romania
status: active
value: "130-170K EUR"
files: "C:/Users/adumi/OneDrive/Desktop/claude/salt-bank-project/"
---

# Salt Bank Ecosystem

**Client:** Salt Bank Romania
**Via:** [[The Niche Society]] (TNS)
**Status:** In Progress - Features Defined
**Bundle Price:** EUR 130-170K (don't show in first meeting)

## The Vision
A "Financial Operating System" - 4 interconnected digital products:

### 1. [[Calculator Fiscal PFA vs SRL]]
- Public SEO web tool for lead acquisition
- Budget: EUR 15-20K
- File: `02-calculator-fiscal.md`

### 2. [[Contabilul Partener]]
- Accountant partner dashboard with SmartBill write integration
- Budget: EUR 60-70K
- File: `01-contabilul-partener.md`

### 3. [[Financial Planner AI]]
- Conversational AI agent - "Un CFO personal in buzunar"
- Goals, forecasting, auto-allocate, Salt Score, charts, simulations
- Budget: EUR 50-65K
- File: `03-financial-planner-ai.md`

### 4. [[Investment Buddy]]
- Robo-adviser under Salt's MiFID II / ASF license
- Budget: EUR 55-70K
- File: `04-investment-buddy.md`

## Key Technical Decisions
- **SmartBill:** Write-only integration (mark payments, issue invoices via API)
- **AI Model:** Open-source self-hosted on RunPod EU (Mistral or GLM-5) - NOT cloud APIs (GDPR)
- **GPU Strategy:** 8x A100 ($6,400/mo) beats 3x H100 ($7,500/mo) for same throughput
- **Data Architecture:** Financial data stays in Salt's systems via API. Our DB = conversations, agent memory, goals, scores only
- **Infrastructure Scaling:** $300/mo pilot -> $6,400/mo at 100K users

## Meeting Strategy
1. Document 1: Vision + ROI (no price) -> they ask for offer
2. Document 2: Full technical + pricing

## Project Files
All in `salt-bank-project/`:
- `00-project-overview.md`
- `01-contabilul-partener.md`
- `02-calculator-fiscal.md`
- `03-financial-planner-ai.md`
- `04-investment-buddy.md`
- `05-meeting-strategy.md`
- `06-infrastructure-scaling.md`

## Real Cost vs Selling Price
Eduard builds this with Claude Code. Real cost ~EUR 15-20K, selling at EUR 140K+.
