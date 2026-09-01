# UX Research — Design-Layer Dopamine + Minimal Luxury Trust

Parent: [[../README|Aesthetic]] → [[The Niche Society Vault/README|The Niche Society]]
Updated: 2026-04-17 per Eduard's direction — **no streak/gamification pressure**. Dopamine comes from design choices, not behavioral mechanics.

---

## North-star aesthetic: Minimal Luxury Trust

Think Aesop, Le Labo, Rituals, Maison Margiela retail, Apple Store. The patient should feel the clinic is **expensive, safe, and tasteful** — not a skincare TikTok.

### Principles
1. **Calm over loud** — 90% negative space, single focal point per screen
2. **Warm neutrals over clinical blue** — trust comes from warmth, not from "healthcare blue"
3. **Type as the hero** — beautiful typography does 60% of the work
4. **One accent, used with restraint** — champagne/sand used only for hierarchy moments
5. **Materials over flat** — subtle depth through shadow, blur, soft gradients. Never 1px borders when elevation works.
6. **Motion as confidence** — everything responds, never rushes, never jitters

### Palette (default theme)
```
--bg-base:    #FAFAF7  (warm paper)
--bg-surface: #FFFFFF  (card)
--bg-elevated:#F3F1EB  (nested surface, rails)
--ink-high:   #0F0F0E  (almost-black, warm)
--ink-mid:    #6B6762  (body)
--ink-low:    #A8A49C  (muted)
--accent:     #B08D5B  (champagne / old gold)
--accent-soft:#E8DCC6  (tint backgrounds)
--success:    #55876B  (muted sage, not neon green)
--danger:     #A74D3F  (terracotta, not alarm red)
```

### Typography
- Display / headings: **Instrument Serif** or **Fraunces** (editorial, serif, confidence)
- Body / UI: **Geist** or **Inter** (neutral, clean sans)
- Mono (rarely): Geist Mono for codes / references
- Display tracking: -2% on large sizes, body tracking +1% on small captions
- Line-height: 1.15 display, 1.5 body

### Radii + spacing
- Radius scale: 10 / 14 / 20 / 28 / 999
- Space scale (rem): 0.25 / 0.5 / 0.75 / 1 / 1.5 / 2 / 3 / 4 / 6 / 8
- Touch targets: 44px minimum

---

## Design-layer dopamine (per Eduard)

**No streaks. No leaderboards. No "break your streak" guilt.** Dopamine is triggered by *how things feel* when they happen, not by pressuring patients to come back.

### Where we insert dopamine
Only at **natural reward moments**: earning points, redeeming, booking confirmed, photo uploaded, review submitted, tier upgrade, doctor replied.

### The design-dopamine toolkit

#### 1. Earned-points burst
When patient earns points (e.g. after adherence check-in, review, referral):
- A subtle popup card slides up from bottom
- `+25 pts` counter animates from 0 with ease-out-cubic
- Points icon does a small rotate + scale bounce
- Soft chime sound (optional, off by default — patients can enable)
- Haptic tick on mobile devices
- Card auto-dismisses in 1.8s, can be dismissed by tap

#### 2. Redemption celebration
When patient redeems a reward:
- Card expands into full-screen overlay
- Gentle confetti (paper-texture particles, champagne + cream, never neon)
- Reward title fades in with serif display type
- "Enjoy" button with magnetic hover
- Haptic: double-tick success pattern

#### 3. Success micro-confirmations
- Save actions → green check icon scales up with spring overshoot
- Toast notifications (Sonner-style) slide in top-right with glass blur
- Copy-to-clipboard → icon morphs from copy to check, back after 1.5s

#### 4. Motion signature (applies everywhere)
- All transitions use spring physics: `stiffness: 320, damping: 28, mass: 0.8`
- Hover states lift by 2px + soft shadow grow
- Press states scale to 0.97 with haptic
- Page transitions: shared-element where possible, crossfade otherwise
- Cards enter with 8px translateY + opacity
- Numbers always count up, never snap

#### 5. Sound (opt-in, tasteful)
- Soft wooden tick on select
- Gentle chime on reward
- Warm bell on new doctor message
- Completely off by default, one-tap enable in settings
- Library: think Apple's "Tink" / "Pop" sounds, not video game coins

#### 6. Haptics (mobile)
- Light tap on selection
- Success pattern on reward earned
- Warning pattern on destructive action
- Respects OS haptics-off setting

#### 7. Peak-end moments
- End of chat thread = doctor's avatar shows "seen" with gentle glow
- End of booking = full-screen confirmation with soft wash
- End of redemption = gift icon unwraps

#### 8. Anticipation design
- Appointment cards glow slightly when within 24h
- "Your doctor replied" badge has subtle pulse (once, not looped)
- Progress bars fill with overshoot + settle

### What we WILL NOT do
- Streaks with loss pressure
- "Don't break your chain" messaging
- Red badges for inactivity
- Push notifications at random times
- Infinite-scroll trap patterns
- Leaderboards comparing patients
- FOMO timers
- Loot-box style randomness
- Shame copy ("you missed 3 days")

### What we WILL do
- Points balance (because rewards need a currency)
- Tier status (Silver → Gold → Platinum) — **no visible "risk of losing tier" pressure**, just rewards for progress
- Celebration moments when things go right
- Quiet acknowledgment when they don't ("no check-in today, that's fine — here if you need")

---

## Components — React Bits + Radix picks

### React Bits (decorative, dopamine-triggering)
- **Counter** — points balance animating
- **Shiny text / gradient text** — tier names only
- **Magnetic button** — primary CTAs
- **Spotlight card** — featured treatment
- **Blur reveal text** — onboarding hero
- **Dock** — bottom nav patient app
- **Confetti** — reward redemption only
- **Animated list** — appointment cards entering

### Radix primitives (functional, accessible)
- Dialog, Popover, Dropdown, Tooltip, Toast, Tabs, Scroll Area

### Motion library
- Framer Motion for anything custom
- `motion/react` v11+

---

## Per-screen engagement design

### Home
- Hero: appointment or today's action, serif display, generous space
- Points balance: large serif number, tier badge below
- Messages preview: 2 latest, with gentle "new" dot
- Recommended products: 2 cards max, tilted softly on hover

### Chat
- iMessage-inspired bubbles, rounded-3xl
- Doctor bubble: elevated white surface
- Patient bubble: accent-tinted
- Typing indicator: 3 dots, bouncy
- Send = bubble animates in from bottom-right

### Rewards
- Tier card: serif display, foil-effect gradient (champagne)
- Points balance: massive number, counter animation on change
- Rewards catalog: 2-column grid, tilted cards, magnetic CTAs
- Redeem → full-screen celebration

### Booking
- Calendar: clean grid, selected date ring accent
- Time slots: pills, selected = filled accent
- Confirm = full-screen success

### Profile
- Simple vertical list
- Privacy / data controls prominent (trust signal)
- Settings for sounds, haptics, notifications

---

## What this all adds up to

A product that feels like a $400 Aesop skincare store trip: calm, confident, pleasurable, and everything is a little bit beautifully-animated. Patients come back because they *enjoy* opening it, not because an app is yelling at them.
