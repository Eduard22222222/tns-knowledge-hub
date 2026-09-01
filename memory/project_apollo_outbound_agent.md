---
name: project-apollo-outbound-agent
description: "Apollo.io outbound kit built for Al Kamara (Wave Advertising) - repo Eduard22222222/apollo-outbound-agent, private, local-master architecture"
metadata: 
  node_type: memory
  type: project
  originSessionId: a65ec229-9588-464e-8b3e-5788f7f08015
  modified: 2026-08-25T01:56:18.495Z
---

Al Kamara (CEO & BD, Wave Advertising — the Wave×TNS partner from
[[project-consumervoice-leadgen]]) asked, on 2026-08-24, for a Claude agent that runs his
personal new-business outbound on Apollo.io. His stated worry: **Cristi also has an Apollo
login** and must not see the proprietary target-company database (RO companies across all
industries, with P&L figures). He had a ~3,000-word "privacy stage" prompt drafted by another
AI and wanted it verified.

Delivered 2026-08-25: **github.com/Eduard22222222/apollo-outbound-agent** (PUBLIC, 62 files,
MIT). Built and verified from a clean clone: 41 tests pass, gate correctly blocks, local MCP
server responds.

The two findings that drove the whole design:

1. **Roughly half that prompt is not executable.** Apollo publishes no API and no MCP tool for
   permission profiles, teams, territories, saved-search visibility or email visibility —
   checkable at `docs.apollo.io/llms.txt`. An agent told to "audit the permission model" will
   hallucinate a plausible audit. Only `GET /api/v1/users/search` (master key) exists, and it
   returns `permission_set_id` without saying what that set allows.
2. **The threat model missed Apollo itself.** Apollo's Living Contributor Network ingests
   contacts from CSV uploads, CRM syncs and linked mailboxes. So the "fallback" architecture —
   local master DB, push only the batch being emailed — is the *default*, not a fallback, and
   `DATA_ISOLATION_CONFIDENCE` can never be HIGH (admin override of private sequences is
   documented behaviour).

Al is still blocked on two things only he can do: a **second Apollo seat must run the canary
test** (nobody else looking = UNVERIFIED, not PASS), and a **Law 506/2004 opinion from counsel**
on RO B2B cold email. Also flagged: his stated sending mailbox is on Wave's primary domain —
cold volume needs a separate sending domain.

Repo made public on Eduard's instruction 2026-08-25, after scrubbing: full-history secret
scan clean, no client names, and commit author email rewritten from his personal gmail to
`136263639+Eduard22222222@users.noreply.github.com` (a public repo exposes commit metadata,
which a file-content scan does not catch — do this on every public push).

Still open on Eduard's side: the GitHub token lacks `workflow` scope, so CI sits at
`ci/github-actions-ci.yml` instead of `.github/workflows/`. Fix with
`gh auth refresh -s workflow` then `git mv`.
