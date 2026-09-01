---
name: skill-zanatomy-3d-web
description: "Pipeline Z-Anatomy → GLB → viewer web interactiv: export Blender, capcana numelor sanitizate de three.js, randare on-demand"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 591ed5cb-0e8d-43ad-9b6c-e0d7a54de6af
  modified: 2026-08-17T19:01:18.147Z
---

Verificat 2026-08-17 la atlasul anatomic din GOA Academy (vezi [[project_goamasaj_academy]]).

**Export Blender → web** (`anatomy3d/export_gltf.py`):
- Doar sistemul muscular, `Decimate 0.12` + Draco level 6 → **1.4 MB** din 1.65M poligoane, 423 noduri denumite.
- Exporterul glTF **refuză căile relative `//`** din Blender (`OSError WinError 123`) — dă cale absolută.
- Materialele Z-Anatomy ies **fără culoare** (`baseColorFactor` absent) → în viewer arată ca o siluetă albă. Atribuie materiale pe tip (mușchi roșu-cărămiziu `0x9d3f36`, tendon/ligament fildeș) + `ACESFilmicToneMapping`, altfel e ars.

**Capcana numelor** (asta m-a costat cel mai mult):
- `GLTFLoader` trece fiecare nume prin `PropertyBinding.sanitizeNodeName`: spațiile devin `_`, iar **caracterele `[].:/ sunt ȘTERSE**. Deci `"Latissimus dorsi muscle.l"` → `Latissimus_dorsi_musclel`, iar duplicatele primesc sufix `_2`.
- Soluția corectă: numele ANATOMIC original se ia din glTF, nu din obiect —
  `gltf.parser.associations.get(obj)?.nodes` → index → `gltf.parser.json.nodes[i].name`.

**Performanță**: 600+ mesh-uri desenate la 60fps îngheață tab-ul. Randare **on-demand** (flag `dirty` + câteva frame-uri de damping după `controls.change`) + `setPixelRatio(min(dpr,1.5))`.

**Randare stills/turntable** (`render.py`, flaguri `--turn --width --height --samples --exposure`): ~45–85 s/cadru la 1280×720, 28 samples, Cycles CPU. 36 cadre ≈ 30–50 min. Vezi și [[skill_blender_headless_render]] pentru capcanele VSE/compositor.

Trei capcane care se văd DOAR la turntable, nu la un still frontal:
1. **Etichetele „X SYSTEM" reapar** dacă a doua buclă (peste colecțiile afișate) le setează `hide_render=False`. Ele intră apoi în bounding box → **centrul rotației se mută** și corpul iese din cadru. Potrivirea numelui trebuie făcută pe **subșir** — titlurile sunt prefixate ca și colecțiile („4: MUSCULAR SYSTEM"), deci `startswith` ratează.
2. **Luminile poziționate proporțional cu `span`** ajung mult mai aproape la preset-urile apropiate (cervical span 0.7 vs 1.79 corp întreg) → cadru ars. Scalează energia cu `(span/referință)²`; pentru close-up-uri mai scade la ~65%.
3. **Culoarea world-ului se dă LINIAR.** `#0B0A08` = 0.043 sRGB → pus direct iese gri (~#3A3630); convertește sRGB→liniar.

La slide-uri: o randare 16:9 pusă într-o coloană portret cu `object-fit: cover` se decupează fix pe fascia albă și pare arsă — afișeaz-o lată, întreagă.

**Mediul de test**: browserul de automatizare de aici **nu decodează video** (readyState rămâne 0 chiar și pe mp4 deschis direct) — nu e bug de pagină; verifică fișierul cu `ffprobe` și lasă playback-ul pe seama userului. Screenshot-urile peste WebGL/video îngheață uneori renderer-ul → verifică prin DOM.
