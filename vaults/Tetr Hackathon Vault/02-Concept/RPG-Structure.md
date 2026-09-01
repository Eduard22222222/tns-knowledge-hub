# CLUTCH — The RPG Structure

The game isn't just a chat — it's a tiny RPG. Here's how the RPG layer works and what we can ship in 48h.

## Execution tiers (pick one)

### Tier 1 — "City Map + Encounters" (RECOMMENDED for 48h)
- Small isometric low-poly city map (generated image, not a real engine)
- 6 location icons (Café 💕, Office 💼, Boardroom 🤝, Stage 🎤, Family Home 👨‍👩‍👧, Awkward Apt 😬)
- Click icon → scene transition → visual-novel encounter
- Your character = avatar card with level, XP bar, equipped tactics, inventory
- World map unlocks new districts as you level up
- **Build risk: LOW**. It's HTML + images + CSS + scene logic we already need.

### Tier 2 — "Walk the City" (+8h)
- Same map but with a clickable/walkable little character sprite
- Phaser.js or PixiJS 2D engine
- Smooth "enter building" transition
- **Build risk: MEDIUM**. Adds a fun juice layer but doesn't change gameplay.

### Tier 3 — "Full Three.js 3D" (too risky)
- Three.js + GLTF low-poly city, actual 3D character you move
- **Build risk: HIGH**. Abandon before H10 if attempted.

**Go with Tier 1. Plan Tier 2 as a stretch drop at H30.**

---

## The RPG loop

```
1. Open World Map (low-poly city)
2. Pick a district → location icon glows
3. Enter location → Briefing card
4. Play encounter (turn-based, tactic buttons, meters)
5. Resolve → stars + XP + gold + loot
6. Level up → new tactic slot / unlock new district
7. Back to map
```

## Progression systems

### Levels (1-30)
- Gain XP from every encounter (more for higher stars)
- Each level: +1 slot, new tactic or archetype unlocked

### Tactics = "Skills" (RPG terminology)
You equip up to 6 at once (early) → 8 (late). Collect 12+ total.
Each tactic has: name, icon, description, effect, cooldown (# of encounters).

### Counterpart Archetypes = "Monsters"
The Bestiary is your Pokédex. Each entry: portrait, bio, tactics vulnerable to, tactics immune to, "# times defeated", stars record.

### Gold / Currency
- Earned from encounters
- Spend on: cosmetic avatar items, extra daily attempts, "retry with coach" re-plays
- NOT pay-to-win — gold is earned, never bought. Keeps the game fair.

### Reputation axes
4 stats that grow by tactic usage:
- **Assertive** (Anchor, Walk Away, BATNA)
- **Empathetic** (Label, Mirror, Acknowledge)
- **Strategic** (Bundle, Bridge, Callback)
- **Charming** (Humor, Vulnerability, Tease)

Reputation gates some scenarios. Example: "Meeting her parents" requires Empathetic ≥ 3.

### Equipment / Loot (stretch for day 2)
After each encounter, small chance to drop a "Line Card" — a pre-written killer response you can use once in a future scene. Loot table by scenario. Classic RPG dopamine hit.

---

## What makes it *feel* like an RPG (aesthetic + audio)

- **World map** with district names like *Uptown Café District*, *Cubicle Corners*, *The Stage*, *Home Turf*, *Awkward Alley*, *The Boardroom*
- **Location "entrance" animation** — camera zoom + scene swap + chime
- **Encounter start** — "A wild *Old-School Dealer* appears!" (Pokémon-honest joke)
- **Turn indicator** — "YOUR TURN" / "THEIR TURN" like a JRPG
- **Tactic button** animation — glow, sound effect on click
- **Damage numbers** — but for rapport (+8 rapport floats off their portrait in green, -12 in red)
- **Victory screen** — stars fly in, XP bar fills, level-up fanfare
- **Low-poly consistent art** (all generated up front)
- **Sound**: 1 chill background loop, 8 short SFX (click, stars, win, loss, tactic activate, rapport+, rapport-, new unlock). Grab from pixabay royalty-free in 30 min.

---

## 48h content target

- **World map**: 1 low-poly city image (generated)
- **Scene backgrounds**: 6 (one per district) (generated)
- **Portraits**: 24 (12 counterparts × 2 moods: neutral + irritated. Drop from 3 to 2 for speed) (generated)
- **UI**: tactic buttons, meters, scorecard, world map overlays (shadcn + Tailwind + Framer)
- **SFX**: 8 royalty-free clips
- **BGM**: 1 royalty-free ambient loop

Total art assets: ~31 images. At Nanobanana ~20s per image = **~10 minutes of generation time, 2h of prompting + curation + retouching**.

---

## Tech stack addendum for RPG layer

- **State**: Zustand store for player (level, XP, gold, equipped tactics, unlocked locations, bestiary progress, rep axes), persisted to Supabase + localStorage
- **World map**: CSS positioning of absolute-positioned location buttons over the generated map image. No engine needed.
- **Scene transitions**: Framer Motion `AnimatePresence`. That's it.
- **RPG save/load**: auto-save after every encounter to Supabase row keyed by user ID
- **Tactic cooldowns, rep deltas, XP rewards**: all computed client-side (deterministic), verified server-side on Pro feature gates

---

## Why this wins the "Creativity in Game Design" rubric hard

No competitor does this. The combination of:
1. Multi-domain scenarios (interview + date + sales + family)
2. Turn-based tactic palette (real frameworks disguised as RPG skills)
3. Low-poly visual novel + RPG map aesthetic
4. Progression + loot + bestiary
5. Alt-line counterfactual coaching

...is genuinely a new genre. The judges will remember this one.
