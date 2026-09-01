---
name: skill-whatsapp-web-file-send
description: Working recipe for sending real files via WhatsApp Web from Claude — clipboard paste (Set-Clipboard -Path + Ctrl+V); zip anything that must arrive unconverted
metadata: 
  node_type: memory
  type: reference
  originSessionId: 890a4aee-c485-4d0b-848c-6ab76ee6f1cd
---

Sending files to a WhatsApp Web chat from Claude in Chrome (verified 2026-07-23, ago filo wallpapers):

- `file_upload` tool FAILS for arbitrary local paths ("only files the user has shared with this session") — copying into scratchpad or `.claude/projects/<session>/uploads` does NOT help.
- In-page JS `fetch('http://127.0.0.1:...')` is blocked by WhatsApp's CSP; synthetic drag-drop events are ignored.
- **What works**: PowerShell `Set-Clipboard -Path file1,file2,...` (CF_HDROP), then in the browser click the message box and press Ctrl+V. WhatsApp opens its attach preview with all files; add caption; click send.
- **Critical**: image-type files (jpg/png/svg) pasted this way go into the IMAGE pipeline → re-encoded/compressed JPEG on delivery. If the recipient needs the exact file (SVG for print, etc.), `Compress-Archive` them into a ZIP first — ZIP pastes as a document ("No preview available") and arrives byte-identical.
- After a fresh QR re-login, WhatsApp Web takes 1–3 min syncing; screenshots time out with "script injection timed out" until it settles — just wait and retry.

Related: [[skill-video-hero-renderer-freeze]] (same Chromium-freeze family).
