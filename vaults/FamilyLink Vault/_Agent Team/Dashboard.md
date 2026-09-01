---
tags: [agent-team, dashboard, moc]
project: FamilyLink
created: 2026-05-04
status: active
---

# FamilyLink - Agent Team Dashboard

This folder is the coordination layer for human + Claude Code + Codex collaboration on [[FamilyLink]].

## Current Routing

| Agent | Inbox | Role | Current state |
|---|---|---|---|
| Human | [[_Agent Team/inbox/human/README|human inbox]] | Product direction, approvals, priorities | active |
| Claude Code | [[_Agent Team/inbox/claude/README|claude inbox]] | Primary implementation context, ongoing coding sessions | active |
| Codex | [[_Agent Team/inbox/codex/README|codex inbox]] | Pair engineer, review, scoped implementation, coordination tooling | active |

## Live Boards

### Active Tasks

~~~dataview
TABLE owner, status, priority, area, updated
FROM "_Agent Team/tasks/active"
SORT priority ASC, updated DESC
~~~

### Open Inbox Messages

~~~dataview
TABLE from, to, type, status, related_task, created
FROM "_Agent Team/inbox"
WHERE status = "open"
SORT created DESC
~~~

### File Locks

~~~dataview
TABLE owner, scope, reason, expires
FROM "_Agent Team/locks"
WHERE status = "active"
SORT expires ASC
~~~

## Manual Fallback

If Dataview is not enabled, open these folders directly:

- _Agent Team/tasks/active/
- _Agent Team/inbox/codex/
- _Agent Team/inbox/claude/
- _Agent Team/handoffs/
- _Agent Team/locks/

## Operating Rule

Before starting work, read [[_Agent Team/Protocol]], check your inbox, check active locks, then claim or update a task.
