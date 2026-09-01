# AI Layer — Architecture v0 (2026-04-17)

## Guiding principle
**AI assists, doctor decides.** Nothing the AI generates reaches the patient without doctor review, UNLESS it's explicitly non-medical (booking reminders, product info, FAQ). This protects us legally AND keeps doctors onboard.

## AI use cases, tiered by risk

### Green (auto-send OK)
- Appointment reminders
- Adherence check-in prompts ("Did you apply your cream tonight? 📸")
- FAQ answers from clinic knowledge base ("Can I shower after laser?" — pre-approved)
- Educational content about treatments
- Product information pages

### Yellow (AI-drafted, doctor approves with 1 tap)
- Replies to patient chat messages
- Treatment progress summaries
- Before/after photo analysis comments
- Skincare routine suggestions

### Red (AI never generates, ever)
- Diagnosis
- Prescription content
- Treatment decisions
- Emergency triage verdict (flag to human, don't answer)

## Core components

### 1. Doctor Copilot (the big one)
- Inbox view with AI-drafted replies for each thread
- Context: patient history, current treatment plan, last 10 messages, adherence data
- RAG source: clinic's own knowledge base (protocols, product info, FAQ) + general derm/dental knowledge packs
- Model routing: Claude Sonnet for most, Haiku for summaries, Opus for complex cases
- One-click: Approve / Edit / Regenerate / Write myself

### 2. Patient Assistant (limited scope)
- Answers FAQ from clinic KB only — NO medical advice generation
- "Let me connect you with Dr. X" for anything medical
- Helps navigate app (booking, rewards, products)
- Multilingual (RO/EN/HU)

### 3. Adherence Agent
- Monitors: did patient check in? photo uploaded? streak broken?
- Nudges: variable-reward micro-messages (gamified)
- Escalates: flags doctor if patient is 3+ days off plan
- Voice mode for older patients (optional)

### 4. Progress Analyzer
- Input: weekly before/after photos
- Output: embedding-based similarity, trend detection, flag-worthy changes
- Used by doctor, shown to patient with doctor's approval only

### 5. Triage Helper (pre-consultation)
- Patient describes issue → AI asks clarifying questions → structured summary + photos → doctor sees ready-to-read brief
- Never outputs diagnosis to patient

## Data architecture

### RAG layers
1. **Global medical KB** — shared, curated content (derm/dental/aesthetic basics)
2. **Clinic KB** — clinic's protocols, product list, pricing, FAQ
3. **Patient memory** — this patient's history, preferences, treatment arc

Each query pulls from all 3 with different weights. Patient memory uses agent-memory-systems patterns (episodic + semantic + procedural).

### Embeddings
- text-embedding-3-large or similar
- pgvector in Supabase
- Photos: CLIP embeddings for before/after similarity

### Prompt hygiene
- Every medical-adjacent prompt has a safety preamble
- Outputs go through safety classifier before auto-send
- System prompt includes clinic-specific guardrails

## Evaluation & safety
- Weekly eval suite: 50–100 real (anonymized) patient queries → human rubric
- Red-team prompts: try to get AI to diagnose, prescribe, panic the patient → should refuse
- Log every AI output + what doctor did with it (approved/edited/rejected) — use for fine-tuning signal

## Cost model (rough)
- Avg clinic: 200 patients, 3 msgs/patient/week = 2,400 msgs/week
- Doctor copilot: ~5k tokens per draft × 2,400 = 12M tokens/week = ~$50/week per clinic with Sonnet
- Target: keep AI cost <15% of MRR per clinic

## Model choices (v0)
- Primary reasoning: Claude Sonnet 4.6
- Summaries / classification: Claude Haiku 4.5
- Vision / before-after: Claude Sonnet 4.6 vision
- Embeddings: OpenAI text-embedding-3-large OR Voyage
- Voice (v2): Whisper + ElevenLabs or similar

## Open questions
- Self-host any model? (probably no for MVP)
- Fine-tune vs pure RAG? (RAG first, collect data, revisit)
- Offline mode? (no — not realistic for chat)
- Can we train on clinic data? (only with DPA + consent + anonymization)
