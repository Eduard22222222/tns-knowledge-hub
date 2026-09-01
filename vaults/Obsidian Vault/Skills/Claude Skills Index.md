---
aliases: [Skills, Claude Skills]
tags: [moc, skills, claude-code]
---

# Claude Skills Index

Quick reference for Claude Code skills. Use `/skill-name` in Claude Code to activate.

## Most Useful for TNS Projects

### Design & Documents
- `/pdf` - Generate PDF documents
- `/pptx` - Generate PowerPoint presentations
- `/docx` - Generate Word documents
- `/xlsx` - Generate Excel spreadsheets
- `/web-artifacts-builder` - Build interactive web components
- `/theme-factory` - Generate design themes
- `/algorithmic-art` - Generate algorithmic art

### Development
- `/frontend-developer` - Frontend development patterns
- `/react-best-practices` - React patterns and best practices
- `/nextjs-best-practices` - Next.js app development
- `/tailwind-patterns` - Tailwind CSS utilities
- `/typescript-pro` - TypeScript advanced patterns
- `/api-design-principles` - API design
- `/database-design` - Database architecture
- `/stripe-integration` - Payment integration

### AI & Content
- `/prompt-engineer` - Optimize prompts
- `/ai-engineer` - AI application development
- `/rag-engineer` - RAG implementation
- `/content-creator` - Content creation
- `/seo-content-writer` - SEO-optimized content
- `/copywriting` - Persuasive copy

### Orchestration (Dynamic Workflows)
- [[Claude Dynamic Workflows]] — the 6 workflow patterns (classify-and-act, fan-out-and-synthesize, adversarial-verify, generate-and-filter, tournament, loop-until-done) + how agents & worktree **isolation** work. Runnable as `/name` from `~/.claude/workflows/`; trigger with `ultracode`.

### 3D & Image Assets (Blender + Higgsfield CLI)
- [[Blender Skills]] — 16 Blender MCP skills (photo→3D, product polish, turntable/camera anims, PolyHaven scenes, Three.js export). Saved in `Skills/Blender/`.
- [[Higgsfield Image & 3D Models]] — CLI image models incl. **GPT Image 2** (`gpt_image_2`), Nano Banana Pro, FLUX.2 + `sam_3_3d` image→3D.

### AI Video Generation (Higgsfield Seedance 2.0)
See [[Higgsfield Seedance Skills]] for the full 15-skill catalog.
- `/01-cinematic` - Film quality, dramatic lighting, Hollywood-style
- `/02-3d-cgi` - Pixar, Unreal Engine, photorealistic 3D
- `/07-ecommerce-ad` - Product ads (fashion, beauty, electronics, food)
- `/11-social-hook` - Viral scroll-stopping hooks
- `/13-fashion-lookbook` - Fashion campaigns and runway
- `/higgsfield-ai-prompt` - MCSLA prompt formula + 18 sub-skills
- `/seedance2` - @ reference system for multimodal inputs

### DevOps & Deploy
- `/vercel-deployment` - Deploy to Vercel
- `/docker-expert` - Docker containerization
- `/supabase-automation` - Supabase backend

### Proposals & Business
- `/product-manager` - Product management
- `/startup-analyst` - Business analysis
- `/competitive-landscape` - Competitor analysis
- `/pricing-strategy` - Pricing models

## Skills by Category

### [[Skills - Frontend]]
`/angular`, `/react-best-practices`, `/react-patterns`, `/nextjs-best-practices`, `/tailwind-patterns`, `/shadcn`, `/css` related skills

### [[Skills - Backend]]
`/fastapi-pro`, `/django-pro`, `/nestjs-expert`, `/nodejs-best-practices`, `/python-pro`, `/golang-pro`

### [[Skills - AI & ML]]
`/ai-engineer`, `/rag-engineer`, `/llm-app-patterns`, `/prompt-engineer`, `/computer-vision-expert`, `/voice-ai-development`

### [[Skills - Infrastructure]]
`/docker-expert`, `/kubernetes-architect`, `/terraform-specialist`, `/aws-serverless`, `/vercel-deployment`

### [[Skills - Security]]
`/security-audit`, `/vulnerability-scanner`, `/pentest-checklist`, `/web-security-testing`

### [[Skills - Business]]
`/product-manager`, `/startup-analyst`, `/pricing-strategy`, `/marketing-ideas`, `/seo-fundamentals`

### [[Skills - Documents]]
`/pdf`, `/pptx`, `/docx`, `/xlsx`, `/readme`, `/documentation`

### [[Skills - MCP Tools]]
- **Canva** - Design generation, editing, export
- **Postman** - API collections, testing, mocks
- **Supabase** - Database, auth, edge functions
- **Ahrefs** - SEO analysis, keywords, backlinks
- **Higgsfield** - AI video/image generation
- **Nanobanana** - Gemini image generation
- **Claude Preview** - Browser preview/testing
- **SAGA** (`saga`) - Read-only pe baza contabilă SAGA a Conta4U: balanță, fișă cont, jurnal, facturi, D300/D394, reconciliere extras ING (MT940). Cod în `saga-mcp/`.

### Contabilitate — `ceccar-expert`
- **`/ceccar-expert`** — creierul contabil CECCAR. **De consultat înainte** de orice înregistrare, declarație sau lucru cu datele SAGA ale Conta4U/clienților. Trimite la [[Contabilitate CECCAR MOC]] din Knowledge (monografii, plan de conturi, TVA) și impune [[Regula — Cercetare Surse Autoritative]] — la neclarități caut la Cod Fiscal / Monitorul Oficial / ANAF, nu ghicesc. Regula de aur: pregătesc și verific totul, dar **depunerea în SPV rămâne pe greenlight-ul lui Eduard, semnată cu token-ul lui**.
