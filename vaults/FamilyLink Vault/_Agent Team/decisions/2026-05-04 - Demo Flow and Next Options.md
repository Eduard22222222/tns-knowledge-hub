---
tags: [agent-team, decision, demo-flow]
project: FamilyLink
created: 2026-05-04
status: active
from: eduard
---

# Demo Flow and Next Options

Eduard confirmed the desired end-to-end demo path:

1. Login mock.
2. `/caminul`.
3. Add resident.
4. Post update with photo.
5. Switch to `/portal`.
6. See update and gallery.
7. Send message.
8. `/caminul/mesaje` replies.
9. `/platforma` sees audit log.
10. Onboard new tenant.
11. Manually run cron to generate weekly report.

Claude is handling lint cleanup for staff/family/api workstream issues noted after TASK-0003.

## Open Continuation Options

- (a) Cleanup lint warnings/errors in Claude-owned staff/family/api files.
- (b) Login UI mock with role selector: Mariana / Andrei / Mary-Lou.
- (c) Photo viewer modal + Email outbox viewer for debug.
- (d) Real Supabase auth stub interface, ready for drop-in swap when accounts arrive.
- (e) Vitest unit tests for `lib/services/`.
- (f) Git commit + push to private repo `Eduard22222222/familylink-app`.

Codex recommendation: after Claude finishes lint cleanup, continue with (b) Login UI mock, because it makes the whole demo path navigable by a human without manual URL/session assumptions. Then add (c) for demo polish and debugging visibility.
