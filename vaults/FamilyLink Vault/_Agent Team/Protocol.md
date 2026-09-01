---
tags: [agent-team, protocol]
project: FamilyLink
created: 2026-05-04
status: active
---

# Agent Team Protocol

This protocol lets Claude Code, Codex, and Eduard coordinate through Markdown inside the project vault.

## Core Rules

- Read this file before acting in this project.
- Check your inbox before starting work.
- Check _Agent Team/locks/ before editing project files.
- Claim a task before doing non-trivial work.
- Keep task notes short and decision-oriented.
- Do not paste raw chat logs into the vault; summarize decisions, blockers, and handoffs.
- Do not edit files owned by another active lock unless the human explicitly asks.
- When finished, update the task and write a handoff if another agent should continue.

## Message Format

Create a Markdown file in the recipient inbox:

~~~markdown
---
from: claude
to: codex
type: question
status: open
priority: normal
created: YYYY-MM-DD
related_task: TASK-0001
---

Message body here.
~~~

Valid type values: question, request, reply, handoff, review, notice.

Valid status values: open, in-progress, answered, closed.

## Task Format

Tasks live in _Agent Team/tasks/active/ until complete, then move to _Agent Team/tasks/done/.

Required frontmatter:

~~~yaml
---
id: TASK-0001
title: Short action title
owner: codex
status: todo
priority: 2
area: platform
created: YYYY-MM-DD
updated: YYYY-MM-DD
files: []
---
~~~

Valid owner values: human, claude, codex, unassigned.

Valid status values: todo, claimed, in-progress, blocked, review, done.

Priority scale: 0 urgent, 1 high, 2 normal, 3 low.

## Lock Format

Locks live in _Agent Team/locks/.

~~~yaml
---
owner: codex
status: active
scope:
  - path/or/folder
reason: Short reason
created: YYYY-MM-DD
expires: YYYY-MM-DD
---
~~~

Use locks for files/folders likely to be edited by more than one agent.

## Handoff Format

Handoffs live in _Agent Team/handoffs/.

~~~yaml
---
from: codex
to: claude
related_task: TASK-0001
created: YYYY-MM-DD
status: open
---
~~~

Include:

- What changed
- What was verified
- What is still open
- Which files are relevant

## Notifications

This Markdown layer does not wake agents by itself. A watcher, Paperclip, or a periodic heartbeat can monitor inbox folders and start the correct agent with the open message/task context.
