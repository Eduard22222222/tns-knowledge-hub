---
name: higgsfield-cli-video-recipe
description: "Working Higgsfield CLI recipe for Soul-ID image→video reels (gemini_omni medias JSON workaround, concurrency limit, costs)"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 1b56b1b5-f5c7-4d59-880e-536355132181
---

Verified 2026-07-02 while building the "Enjoy" reel (see [[project_eduard_reel_content]]):

- **Soul image**: `higgsfield generate create text2image_soul_v2 --prompt "..." --aspect_ratio 9:16 --quality 2k --custom_reference_id 9ffb0f26-ecf2-4176-9922-eb9d17a8a701 --wait` (Eduard's Soul ID = "Edi"). ~0.12 credits.
- **Seedance 2.0 image→video**: `--start-image <local.png>` works directly. 1080p/5s = 45 credits, 720p = 22.5. `--generate_audio true --genre drama` gives usable ambient sound.
- **gemini_omni image→video**: `--image` and `--start-image` flags FAIL validation ("role should be 'image'"). Workaround: `higgsfield upload create <file> --json` → then `--medias '[{"role":"image","data":{"type":"media_input","id":"<upload-id>"}}]'`. 4s/9:16 = 12 credits, output is 720p (upscale in ffmpeg with lanczos+unsharp).
- `generate cost` does NOT validate medias — a cost check passing doesn't mean create will.
- **Concurrency limit: 4 jobs** on Ultimate plan (rate_limit_reached error) — launch in waves; `higgsfield generate wait <id> --timeout 20m` (flag is `--timeout`, NOT `--wait-timeout`).
- Assembly: per-scene ffmpeg segments (fps=24, setsar=1, drawtext with textfile= + relative font path to dodge Windows colon escaping) then concat demuxer `-c copy`. Build script at `eduard-brand-library/reels/enjoy-reel/build.sh`.
- Watch C: disk space before video work — it was at 0 bytes free (VS installer cache in %TEMP% held 2.4GB).
- **gemini_omni content filter** rejects innocent MEDICAL scenes (hospital room, wheelchair corridor) with status "nsfw" — retry those via Seedance 2.0, which passes them fine.
- **Caption font for TikTok-style reels**: official TikTok Sans is on google/fonts (variable) — instantiate bold via `python -m fontTools.varLib.instancer TikTokSans-Variable.ttf wght=700 opsz=28 wdth=100 slnt=0`. Closest match to native TikTok captions; Segoe UI Bold is the fallback. White + shadowcolor=black@0.45:shadowy=2, fontsize ~52/1080px, centered y≈h*0.487. Static instance saved at `eduard-brand-library/reels/enjoy-reel/fonts/TikTokSans-Bold.ttf`.
- `soul-id create --soul-2 --image <upload-id>×5` trains a character in ~10 min; but Eduard prefers HIS original "Edi" ref (9ffb0f26) — pair it with an explicit hair description ("dark hair, low fade undercut") to prevent drift, and shoot him FROM BEHIND where possible.

Verified 2026-08-21 while building the Sorina Faier "Harder" music-video demo (see [[project_sorina_faier_music_video]]):

- **Lipsync = `sync_so` (Sync Lipsync 3)**. Params are OBJECTS, not CLI media flags. `--audio`/`--video` fail with "Model does not accept media inputs"; `{"type":"media_input",...}` fails with "Media input not found". The working shape is the model-specific enum:
  `--input_audio '{"type":"audio_input","id":"<upload-id>"}' --input_video '{"type":"video_input","id":"<upload-id>"}'`
  Get valid enums by sending a deliberately wrong `type` — the error lists them all (`video_input`, `video_job`, `image2video_job`, …). Upload first with `higgsfield upload create <file> --json`. ~18 credits per 5s clip. `--sync_mode remap` + `--temperature 0.5` works. Lipsync holds up on SUNG vocals with the full mix (no vocal stem needed for a usable result).
- **`higgsfield generate cost` has a DIFFERENT schema than `create`** for object-param models — it demands `duration` and rejects `input_audio`/`input_video`. Don't bother cost-checking those; go straight to `create`.
- **Audio upload must be `.mp3`** — uploading `.wav` gets a presigned URL for `.mp3` with `content-type: audio/wav`, so S3 rejects it with a SignatureDoesNotMatch XML dump. Convert first: `ffmpeg -i x.wav -c:a libmp3lame -b:a 192k x.mp3`.
- **`prompt_language` defaults to `zh`** on seedance_2_5 / cinematic_studio_video_4_0 — always pass `--prompt_language en`.
- Costs at 720p/5s: `seedance_2_5` = 32.5 cr, `cinematic_studio_video_4_0` = 32.5 cr, `text2image_soul_v2` 2k = 0.12 cr, `sync_so` ≈ 18 cr.
- `cinematic_studio_video_4_0` exposes real DP controls: `camera_lens_id`, `camera_aperture_id`, `camera_model_id`, `light_id`, `era_id`, `genre_id`, `pacing_id`, `color_palette`, `multi_shots`.
- Useful repair models in `model list --video`: `video_deflicker` (fixes the frame-to-frame colour drift that makes cheap AI clips look broken), `topaz_video` / `bytedance_video_upscale`, `reframe` (16:9 → 9:16).
- Photoreal-face prompt string that beat the plastic "AI Barbie" look: *"shot on ARRI Alexa 35 with Cooke anamorphic glass, natural skin texture with visible pores and fine lines, absolutely no beauty retouching or skin smoothing, subtle 35mm film grain, practical light sources only"*. `nano_banana_2_skin_enhancer` exists as a dedicated fixer.
