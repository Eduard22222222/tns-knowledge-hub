---
name: skill-photo-to-walkthrough-engine
description: "Working recipe for turning a set of still property photos into ONE continuous cinematic walkthrough video via Higgsfield Kling 3.0 keyframe chaining"
metadata:
  node_type: memory
  type: feedback
---

Verified 2026-08-31 on a real 2-room Bucharest apartment (13 WhatsApp photos → 49s continuous 1080p walkthrough). Code + assets in `apartment-walkthrough/`.

**The core trick — chain, don't cut.** Each clip is `--start-image A --end-image B` where B is the *next* clip's start image. Because clip N ends on exactly the frame clip N+1 opens with, plain concatenation is seamless — it reads as one unbroken gimbal take. Trim the last 2 frames of every clip before concat to kill the duplicate-frame hitch.

**Model: `kling3_0 --mode pro`, 5s, 12.5 credits/clip.** Far better value than `seedance_2_5` (45 cr) and Kling is the one that actually nails smooth dolly/pan moves. Pass `--sound off` (AI-invented room tone is useless; music goes on later).

**Upload gotcha (same class as the .wav/.mp3 bug):** feeding a `.jpg` to `--start-image` fails with an S3 `SignatureDoesNotMatch` XML dump — the presigned URL is issued for `.png` while the body is sent as `image/jpeg`. **Always convert sources to PNG first.**

**Pre-crop the sources yourself.** Phone photos are 4:3; Kling only offers 16:9 / 9:16 / 1:1. Crop to 16:9 in Pillow with a top bias (cut ~60% off the ceiling, 40% off the floor) so *you* choose what is lost, not the model.

**Order the route from the cadastral plan (releveu), not from the photo order.** WhatsApp strips EXIF, so there are no timestamps — the floor plan is the only source of true adjacency. Only chain rooms that genuinely touch. Same-open-space traversals (hall→living, living→kitchen) are near-perfect; through-a-closed-door jumps between distant rooms (kitchen→bathroom) visibly teleport and are the weak seam.

**Prompt shape that worked** (dense, per-shot, written after actually *looking* at each photo): `Continuous single gimbal take, no cuts.` + the exact move + an inventory of the real objects in BOTH frames named by material and colour + `Everything stays exactly as photographed` + a fixed tail: *"Ultra realistic real-estate cinematography, gimbal-smooth, calm walking pace, locked level horizon, no shake, natural parallax and correct perspective. Existing light only, no lighting change, no flicker. Photorealistic, wide-angle lens, straight walls stay straight. No people, no new objects, no morphing, no melting, no distortion, no text, no watermark."*

Naming the objects is what stops the drift — Kling held mirrors, reflections and furniture consistent across a 5s traversal only when they were listed explicitly.

**Test 2-3 seams before launching the full set.** Concurrency cap is 4 jobs; launch in waves and capture the returned id (`... | tail -1`) — a bad `grep` silently loses it. `generate list` needs `--video` to show video jobs at all.

Related: [[higgsfield-cli-video-recipe]], [[feedback_video_review_workflow]], [[project_apartment_walkthrough]]

**Round 2 (same session) — what "ultrarealistic" actually required:**

- **Read the door swing arcs off the releveu before prompting a door.** The quarter-circle arc's centre is the hinge and the sweep shows which way it opens. Kling's default guess was wrong on both axes (hinged left, opening outward); the plan said hinged east, opening inward. Naming `hinged on its RIGHT-HAND side and opens INWARD, away from the camera ... never toward the camera` fixed it in one shot.
- **A hand beats a self-opening door.** `A hand reaches in from the bottom right of frame, grips the chrome lever handle, presses it down and pushes the door open` produced a clean, correctly-fingered forearm and killed the ghost-door look. Self-opening reads as haunted; camera-pushes-through reads as continuous but soft.
- **Camera-physics block, appended to every prompt** — this is what removed the drone-float: *"three-axis gimbal carried by a walking person: eye height 1.55 meters above the floor, held level, zero roll, no dutch angle, only a faint organic sway from footsteps, never floating like a drone. It moves at about 0.8 meters per second, starts and stops gently. The camera never clips through walls, doors or furniture and never comes closer than 40 centimeters to any surface. Natural 180-degree shutter motion blur. Architecture is rigid: walls, door frames, floor planks and tile grout lines stay perfectly straight and never bend, breathe or warp."*
- **Never let it rotate and translate at once through a big angle.** A 180° turn while walking smears the walls. The fix that won: *"One single slow pivot on the spot, spread evenly across the whole shot at constant angular speed, like a person turning slowly in place, while the camera drifts very gently backwards"* + `must not smear, stretch, melt or duplicate during the turn`. The alternative (retreat, then turn, then walk) hallucinated a potted plant.
- **Do NOT solve a long walk by buying a 10s clip.** 10s (25 cr) gave the model 5 unanchored seconds and it invented a living room that contradicted the real one (grey fabric sofa became dark leather). Two 5s clips routed through a REAL photo as the midpoint cost the same and stay faithful. **Anchor, don't extend.**
- Source photos leak into the output: a passer-by in the exterior shot survives `no people`. Remove them from the still first if they matter.
- Don't trust a garbled glyph read off one oblique frame — the door number that looked like "801" was the real "1o8" (stylised zero) seen at an angle. Check at full res before "fixing" it.
