---
name: skill_linkedin_image_post_playwright
description: "The ONLY reliable way to post to LinkedIn WITH images (carousel) from this machine — Playwright MCP browser_file_upload, personal + TNS page"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 8a63e47c-d558-4ada-99d0-941df3081939
  modified: 2026-08-31T10:57:49.685Z
---

Posting to LinkedIn **with images** (single or multi-image carousel) — the method that finally worked after every other path failed.

**Use Playwright MCP** (`mcp__playwright__*`), NOT claude-in-chrome. Playwright's `browser_file_upload` intercepts the OS file chooser, so image attach just works. claude-in-chrome CANNOT do it (native picker freezes the tab; JS injection into the iframe file input is fragile and `navigator.clipboard.read()` HANGS the renderer — never call it). computer-use is sandbox-blocked (no drag/type). Postiz has no LinkedIn channel connected.

**Recipe (verified 2026-08-31, MHS 8-slide carousel on both profile + page):**
1. If Playwright shows CONNECT_TIMEOUT, it may reconnect on its own later — check the tool list before assuming it's dead. Load tools via ToolSearch `select:mcp__playwright__browser_navigate,...browser_click,...browser_file_upload,...browser_evaluate,...browser_snapshot,...browser_take_screenshot`.
2. `browser_navigate` to `linkedin.com/feed/` (personal) or `linkedin.com/company/<ID>/admin/page-posts/published/` (post AS the TNS page, company id 135305567).
3. Open composer: `browser_evaluate` clicking the button whose text/class matches "Start a post" / `share-box-feed-entry__trigger` (has-text selectors often fail — use evaluate).
4. Get refs from `browser_snapshot` (save to file, grep it). Editor = `textbox "Text editor for creating content"`; photo = `button "Add media"`; page-share "Continue" = a **link**, not a button.
5. Click "Add media" → returns "Modal state: File chooser" → then `browser_file_upload` with an ARRAY of absolute PNG paths (all slides at once = carousel). To add more to an existing set, click the "Add" (+) button → file chooser again.
6. `browser_click` "Next", then `browser_type` into the editor ref with the caption (\n newlines render as line breaks; — em-dash and → arrows type fine).
7. Post = `button.share-actions__primary-action` (has-text "Post" is ambiguous → 3 matches).
8. Refs change after each upload/step — re-snapshot or use stable selectors. Screenshot to a file + Read it to verify each step.

**Two separate posts** for reach: (a) personal profile; (b) TNS page via the admin Start-a-post. The post-success "Share this post on your page → Continue" dialog does NOT complete if you navigate away — safer to post directly from the page admin. Decline the "Redeem 1 month Premium for lei 0" upsell with "No thanks" (don't start a paid trial).

Related: [[project_tns_social_content_op]], [[skill_browser_automation_blindspots]].
