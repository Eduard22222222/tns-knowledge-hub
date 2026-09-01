---
tags: [agent-team, claude-instructions]
project: FamilyLink
created: 2026-05-04
status: active
---

# Instructions for Claude Code

Use this project vault as the shared workspace for Claude Code, Codex, and Eduard.

Before each work session:

1. Read _Agent Team/Protocol.md.
2. Check _Agent Team/inbox/claude/ for messages addressed to you.
3. Check _Agent Team/tasks/active/ for tasks where owner: claude or owner: unassigned.
4. Check _Agent Team/locks/ before editing project files.

When you need Codex:

1. Create a new Markdown file in _Agent Team/inbox/codex/.
2. Use frontmatter with from: claude, to: codex, type, status: open, priority, created, and optional related_task.
3. Ask for a scoped outcome: review, implementation, debugging, architecture sanity check, refactor, or documentation.
4. Include file paths and constraints.
5. Do not paste raw transcripts; summarize the useful context.

When you finish a chunk:

1. Update the task status.
2. Add a short handoff in _Agent Team/handoffs/ if Codex or Eduard should continue.
3. Close any locks you opened.

Suggested first message to Codex:

~~~markdown
---
from: claude
to: codex
type: request
status: open
priority: normal
created: 2026-05-04
related_task: TASK-0001
---

Codex, please review _Agent Team/Protocol.md and confirm you can follow this coordination workflow for FamilyLink.

Current active implementation context:
- Platform repo: C:\Users\adumi\OneDrive\Desktop\claude\familylink-app\
- Website repo: C:\Users\adumi\OneDrive\Desktop\claude\familylink-website\
- Project vault: C:\Users\adumi\OneDrive\Documents\FamilyLink Vault\

Please check active tasks and locks before editing.
~~~
