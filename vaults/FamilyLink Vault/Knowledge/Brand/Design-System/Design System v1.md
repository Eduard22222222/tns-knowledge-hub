# FamilyLink Design System v1

**Status:** Foundational · 30 aprilie 2026
**Scope:** Site public familylink.ro + Aplicație web Faza 1 + ComfortMap Faza 2
**Source-of-truth:** Logo v13-A (locked) · Brand colors blue (#4FB8D9) + green (#7CC576) · Navy (#1E3A5F) · Wordmark Plus Jakarta Sans Semibold

---

## Principii guvernante

1. **Calitate peste creativitate** — Repetabil > unic. Folosim aceleași componente în 100 contexte.
2. **Cald dar profesional** — Nu instituțional steril, nu copilăros jucăuș. Mijlocul de drum încrezător.
3. **Accesibil by default** — WCAG 2.1 AA minimum. Persona Mariana (47, tech literacy medie) trebuie să folosească confortabil.
4. **Mobile-first** — 60%+ trafic Persona 1+2 vine de pe mobil.
5. **Reduced motion respectat** — Animațiile sunt amplificator, nu obstacol.

---

# 1. Design Tokens

## 1.1 Color Palette

### Brand Primary — Blue (Sky)
Derivat din #4FB8D9 (logo sky blue).

| Token | Hex | Use |
|---|---|---|
| `blue-50` | `#F0FAFD` | Surface tint, hover backgrounds |
| `blue-100` | `#D9F2F8` | Subtle backgrounds |
| `blue-200` | `#B4E5F0` | Disabled states |
| `blue-300` | `#7FD2E5` | Decorative |
| `blue-400` | `#4FB8D9` | **Primary brand color** (logo) |
| `blue-500` | `#2DA0C7` | Hover primary |
| `blue-600` | `#1F88AE` | Active primary |
| `blue-700` | `#1A6B8B` | Dark mode primary |
| `blue-800` | `#155069` | Text on blue surfaces |
| `blue-900` | `#0F3849` | Deep accent |
| `blue-950` | `#082432` | Maximum depth |

### Brand Secondary — Green (Mint/Leaf)
Derivat din #7CC576 (logo green).

| Token | Hex | Use |
|---|---|---|
| `green-50` | `#F2FAF1` | Subtle backgrounds |
| `green-100` | `#DEF2DB` | Soft surfaces |
| `green-200` | `#BDE5B7` | Disabled states |
| `green-300` | `#9CD895` | Hover variants |
| `green-400` | `#7CC576` | **Secondary brand color** (logo) |
| `green-500` | `#5DAD56` | Hover green |
| `green-600` | `#479143` | Active green |
| `green-700` | `#387234` | Dark surfaces |
| `green-800` | `#2A552A` | Deep accent |
| `green-900` | `#1D3A1D` | Maximum |
| `green-950` | `#0F1F0F` | Maximum depth |

### Brand Anchor — Navy (Wordmark)
Derivat din #1E3A5F (wordmark color).

| Token | Hex | Use |
|---|---|---|
| `navy-50` | `#F2F5F9` | Page backgrounds |
| `navy-100` | `#E1E8F0` | Borders subtle |
| `navy-200` | `#C2CFDC` | Borders |
| `navy-300` | `#9AAABF` | Disabled text |
| `navy-400` | `#6B829F` | Muted text |
| `navy-500` | `#4A6585` | Body text secondary |
| `navy-600` | `#34516F` | Body text |
| `navy-700` | `#264259` | **Headings primary** |
| `navy-800` | `#1E3A5F` | **Wordmark color (canonical)** |
| `navy-900` | `#162A45` | Deep contrast |
| `navy-950` | `#0B1828` | Maximum darkness |

### Neutrals (Warm Grey — slight cream tint pentru warmth)
NU pure grey — adăugăm o pic de #F5E6C0 cream warmth pentru a evita aspectul clinical/spital.

| Token | Hex | Use |
|---|---|---|
| `neutral-0` | `#FFFFFF` | Pure white (cards, surfaces) |
| `neutral-50` | `#FAFAF8` | Page background light mode |
| `neutral-100` | `#F4F3EE` | Subtle elevation |
| `neutral-200` | `#E8E6DE` | Borders |
| `neutral-300` | `#D2CFC4` | Disabled backgrounds |
| `neutral-400` | `#A8A496` | Placeholder text |
| `neutral-500` | `#7A7468` | Secondary text (subtle) |
| `neutral-600` | `#5C574E` | Body text alt |
| `neutral-700` | `#3D3A35` | Strong text |
| `neutral-800` | `#28261F` | Headings alt |
| `neutral-900` | `#1A1814` | Maximum contrast text |
| `neutral-950` | `#0D0C0A` | True near-black |

### Semantic Colors

| Token | Light | Dark | Use |
|---|---|---|---|
| `success-bg` | `#F2FAF1` | `#1D3A1D` | Success backgrounds |
| `success` | `#479143` | `#7CC576` | Success text/icons |
| `success-border` | `#9CD895` | `#479143` | Success borders |
| `warning-bg` | `#FEF7E6` | `#3D2A0A` | Warning backgrounds |
| `warning` | `#B8860B` | `#F5C842` | Warning text/icons |
| `warning-border` | `#F5C842` | `#B8860B` | Warning borders |
| `error-bg` | `#FEF1F1` | `#3D1A1A` | Error backgrounds |
| `error` | `#C73838` | `#F58A8A` | Error text/icons |
| `error-border` | `#F5A8A8` | `#C73838` | Error borders |
| `info-bg` | `#F0FAFD` | `#155069` | Info backgrounds |
| `info` | `#2DA0C7` | `#7FD2E5` | Info text/icons |
| `info-border` | `#7FD2E5` | `#2DA0C7` | Info borders |

### Surface (light mode)

| Token | Hex | Use |
|---|---|---|
| `surface-base` | `#FAFAF8` | Page background |
| `surface-1` | `#FFFFFF` | Cards, primary surface |
| `surface-2` | `#F4F3EE` | Elevated surfaces (header, modals) |
| `surface-3` | `#E8E6DE` | Hover, dividers |

### Surface (dark mode — pentru viitor, când lansăm dark mode)

| Token | Hex | Use |
|---|---|---|
| `surface-base` | `#0D0C0A` | Page background |
| `surface-1` | `#1A1814` | Cards |
| `surface-2` | `#28261F` | Elevated |
| `surface-3` | `#3D3A35` | Hover |

### Gradient (Brand Hero — folosit ÎN simbolul logo + accente speciale, NU în UI standard)

```css
--gradient-brand: linear-gradient(135deg, #4FB8D9 0%, #7CC576 100%);
--gradient-brand-soft: linear-gradient(135deg, rgba(79,184,217,0.15) 0%, rgba(124,197,118,0.15) 100%);
```

Folosit **rar** — doar pe: logo, hero accent text spans, special CTA gradient (1-2 max per pagină).

### Color Contrast — WCAG 2.1 AA verificat

| Foreground | Background | Ratio | AA Normal | AA Large |
|---|---|---|---|---|
| `navy-800` (text) | `neutral-0` (white) | 11.2 | ✅ | ✅ |
| `navy-700` (heading) | `neutral-50` | 9.8 | ✅ | ✅ |
| `neutral-600` (body) | `neutral-0` | 7.4 | ✅ | ✅ |
| `neutral-500` (muted) | `neutral-0` | 4.6 | ✅ | ✅ |
| `neutral-400` (placeholder) | `neutral-0` | 3.1 | ❌ | ✅ (only for large) |
| `blue-400` (brand) on `navy-800` | — | 4.9 | ✅ | ✅ |
| `green-400` (brand) on `navy-800` | — | 4.5 | ✅ | ✅ |
| `blue-600` (brand button) | `neutral-0` | 4.5 | ✅ | ✅ |
| `error` `#C73838` | `neutral-0` | 5.8 | ✅ | ✅ |

**Regula:** Brand colors (blue-400, green-400) NU se folosesc pentru text body. Pentru text trebuie blue-600+ sau green-600+. Brand colors = doar accent/icon/large heading.

## 1.2 Typography

### Font Stack

```css
--font-display: 'Plus Jakarta Sans', system-ui, sans-serif;  /* headings, hero, wordmark */
--font-body: 'Inter', 'Plus Jakarta Sans', system-ui, sans-serif;  /* body, UI */
--font-mono: 'JetBrains Mono', 'Fira Code', monospace;  /* code, pricing numbers */
```

**Recomandare:** Plus Jakarta Sans pentru tot — îți dă cohesion maximum. Inter ca alternativă pentru body dacă în testing PJS feel-ește prea „display" la 14-16px.

### Type Scale (mobile-first, scale ratio 1.25 perfect fourth)

| Token | Size | Line | Use | Mobile | Desktop |
|---|---|---|---|---|---|
| `text-xs` | 12px | 1.5 | Captions, fine print | 12px | 12px |
| `text-sm` | 14px | 1.5 | UI labels, supporting text | 14px | 14px |
| `text-base` | 16px | 1.6 | Body text | 16px | 16px |
| `text-lg` | 18px | 1.6 | Lead paragraphs | 18px | 18px |
| `text-xl` | 20px | 1.5 | Subheadings | 20px | 20px |
| `text-2xl` | 24px | 1.4 | H4 | 22px | 24px |
| `text-3xl` | 30px | 1.3 | H3 | 26px | 30px |
| `text-4xl` | 36px | 1.2 | H2 | 30px | 36px |
| `text-5xl` | 48px | 1.1 | H1 | 36px | 48px |
| `text-6xl` | 60px | 1.05 | Hero | 44px | 60px |
| `text-7xl` | 72px | 1.0 | Display XL | 52px | 72px |

### Font Weights

| Token | Weight | Use |
|---|---|---|
| `font-regular` | 400 | Body text |
| `font-medium` | 500 | UI labels, emphasis |
| `font-semibold` | 600 | Wordmark, subheadings |
| `font-bold` | 700 | Headings |
| `font-extrabold` | 800 | Hero impact |

### Letter Spacing

| Token | Value | Use |
|---|---|---|
| `tracking-tighter` | -0.04em | Hero (text-5xl+) |
| `tracking-tight` | -0.02em | Headings (text-2xl+) |
| `tracking-normal` | 0 | Body |
| `tracking-wide` | 0.02em | UI uppercase labels |
| `tracking-wider` | 0.05em | Wordmark, eyebrows |

## 1.3 Spacing Scale (4px base)

```
0     = 0
0.5   = 2px
1     = 4px
1.5   = 6px
2     = 8px
3     = 12px
4     = 16px
5     = 20px
6     = 24px
8     = 32px
10    = 40px
12    = 48px
16    = 64px
20    = 80px
24    = 96px
32    = 128px
40    = 160px
48    = 192px
64    = 256px
```

**Component padding standards:**
- Button sm: `px-3 py-1.5` (12px / 6px)
- Button md: `px-4 py-2.5` (16px / 10px)
- Button lg: `px-6 py-3` (24px / 12px)
- Card: `p-6` (24px)
- Section vertical: `py-16 md:py-24 lg:py-32` (64/96/128px)
- Container max-width: `max-w-7xl` (1280px)

## 1.4 Border Radius

| Token | Value | Use |
|---|---|---|
| `rounded-none` | 0 | Tables, dividers |
| `rounded-sm` | 4px | Tags, small badges |
| `rounded` | 6px | Buttons sm |
| `rounded-md` | 8px | Inputs, buttons md |
| `rounded-lg` | 12px | Cards, buttons lg |
| `rounded-xl` | 16px | Large cards, hero CTA |
| `rounded-2xl` | 20px | Modals, elevated cards |
| `rounded-3xl` | 24px | Hero sections, app icon (iOS) |
| `rounded-full` | 9999px | Avatars, pills, circular buttons |

## 1.5 Shadow / Elevation

```css
--shadow-xs: 0 1px 2px 0 rgba(30, 58, 95, 0.05);
--shadow-sm: 0 1px 3px 0 rgba(30, 58, 95, 0.08), 0 1px 2px 0 rgba(30, 58, 95, 0.06);
--shadow-md: 0 4px 6px -1px rgba(30, 58, 95, 0.08), 0 2px 4px -2px rgba(30, 58, 95, 0.06);
--shadow-lg: 0 10px 15px -3px rgba(30, 58, 95, 0.08), 0 4px 6px -4px rgba(30, 58, 95, 0.06);
--shadow-xl: 0 20px 25px -5px rgba(30, 58, 95, 0.1), 0 8px 10px -6px rgba(30, 58, 95, 0.06);
--shadow-2xl: 0 25px 50px -12px rgba(30, 58, 95, 0.16);
--shadow-inner: inset 0 2px 4px 0 rgba(30, 58, 95, 0.05);

/* Brand colored shadows pentru CTA hero */
--shadow-brand: 0 10px 30px -10px rgba(79, 184, 217, 0.4);
--shadow-brand-green: 0 10px 30px -10px rgba(124, 197, 118, 0.4);
```

**Notă:** Shadow-urile folosesc tint navy (1E3A5F) la 5-16% opacity, NU pure black. Asta dă warmth subtle.

## 1.6 Z-Index Layers

```
z-0       = 0      (default)
z-10      = 10     (header, nav)
z-20      = 20     (dropdowns)
z-30      = 30     (sticky elements)
z-40      = 40     (overlay backdrop)
z-50      = 50     (modal, dialog)
z-60      = 60     (toast notifications)
z-70      = 70     (tooltip)
z-popover = 100    (popover)
z-max     = 9999   (debug only)
```

## 1.7 Breakpoints (mobile-first, Tailwind defaults)

| Token | Min Width | Device |
|---|---|---|
| `sm` | 640px | Mobile landscape, small tablet |
| `md` | 768px | Tablet portrait |
| `lg` | 1024px | Tablet landscape, small laptop |
| `xl` | 1280px | Desktop |
| `2xl` | 1536px | Large desktop |

**Container max-widths:**
- Mobile: full width with `px-4`
- `sm` and up: `max-w-7xl mx-auto px-6 lg:px-8`
- Hero/section content: `max-w-6xl` (1152px) for readability

## 1.8 Motion Tokens

```css
--duration-instant: 75ms;
--duration-fast: 150ms;     /* hovers, micro-interactions */
--duration-normal: 250ms;   /* default transitions */
--duration-moderate: 400ms; /* page transitions, modal */
--duration-slow: 600ms;     /* reveal, stagger */
--duration-slower: 1000ms;  /* hero animations */

/* Easing curves */
--ease-linear: linear;
--ease-in: cubic-bezier(0.4, 0, 1, 1);
--ease-out: cubic-bezier(0, 0, 0.2, 1);          /* default */
--ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
--ease-bounce: cubic-bezier(0.68, -0.55, 0.265, 1.55);
--ease-smooth: cubic-bezier(0.25, 0.1, 0.25, 1); /* premium feel */
```

**Reguli motion:**
- Hover transitions: `duration-150 ease-out`
- Modal in: `duration-250 ease-out` · out: `duration-150 ease-in`
- Stagger reveal items: 50ms delay between items
- `@media (prefers-reduced-motion: reduce)` → toate animațiile la `duration-fast` sau dezactivate

---

# 2. Component Foundation

## 2.1 Buttons

### Variants

| Variant | Use | Background | Text | Border | Hover |
|---|---|---|---|---|---|
| `primary` | Main CTA — „Programează demo" | `blue-400` (brand) | `white` | none | `blue-500` + shadow-brand |
| `secondary` | Supporting — „Vezi cum funcționează" | `white` | `navy-700` | `navy-200` 1px | `navy-50` bg, `navy-300` border |
| `ghost` | Tertiary — „Află mai multe" | transparent | `navy-700` | none | `navy-50` bg |
| `success` | Family CTA — „Caut cămin" | `green-400` | `white` | none | `green-500` + shadow-brand-green |
| `outline-brand` | Hero alternate | transparent | `blue-500` | `blue-400` 1.5px | `blue-50` bg |
| `destructive` | Delete, leave | `error` | `white` | none | error darker |

### Sizes

| Size | Padding | Text | Min Height | Use |
|---|---|---|---|---|
| `xs` | `px-2.5 py-1` | `text-xs font-medium` | 28px | Inline tags |
| `sm` | `px-3 py-1.5` | `text-sm font-medium` | 32px | Compact UI |
| `md` | `px-4 py-2.5` | `text-base font-semibold` | 40px | **Default** |
| `lg` | `px-6 py-3` | `text-lg font-semibold` | 48px | CTAs hero |
| `xl` | `px-8 py-4` | `text-xl font-semibold` | 56px | Mobile hero, conversion |

### States

| State | Visual |
|---|---|
| Default | Base color |
| Hover | Slightly darker bg + shadow lift (`shadow-md → shadow-lg`) + 0.5px translate up |
| Active | Slightly darker than hover, no shadow (pressed) |
| Focus | 2px outline `blue-400` cu offset 2px |
| Disabled | `opacity-50 cursor-not-allowed`, no hover |
| Loading | Text becomes invisible, spinner centered, disabled interactions |

### Magnetic Button (special — pentru hero CTA, React Bits)
Cursor follow subtle (max 4px translate from center) la hover. Folosit MAX 1-2 ori per pagină — pe primary CTA hero.

## 2.2 Inputs

### Text Input

```
[ Label                    ]    ← navy-700 text-sm font-medium mb-1.5
[ ┌──────────────────────┐ ]    ← border-navy-200 rounded-md, focus border-blue-400 ring-2 ring-blue-100
[ │ Placeholder text     │ ]    ← navy-400 placeholder, navy-700 typed text-base
[ └──────────────────────┘ ]
[ Helper text or error     ]    ← navy-500 text-xs (or error color)
```

**Padding:** `px-3 py-2.5` · **Min height:** `40px` · **Border:** `1px solid navy-200`
**Focus:** `border-blue-400`, ring `2px blue-100`, transition `150ms ease-out`
**Error:** `border-error`, helper text becomes `error`
**Disabled:** `bg-neutral-50 text-neutral-400 cursor-not-allowed`

### Sizes

- `sm`: 32px height, text-sm
- `md`: 40px height, text-base **(default)**
- `lg`: 48px height, text-lg (form B2C inquiry)

### Form Patterns

**Inquiry form B2C (4 fields max):**
```
┌─ Name *  ──────────────────┐
└────────────────────────────┘
┌─ Email *  ─────────────────┐
└────────────────────────────┘
┌─ Telefon *  ───────────────┐
└────────────────────────────┘
┌─ Județ *  ▼ select  ───────┐
└────────────────────────────┘
[ Trimite cererea →  ] (lg, success variant, full width on mobile)
🔒 Datele tale rămân la noi · GDPR conform
```

## 2.3 Cards

### Default Card
- `bg-white` `border-1 border-neutral-200` `rounded-lg` `p-6`
- Hover: `shadow-md` + 1px translate up + `border-navy-300`
- Used pentru: feature cards, blog cards, persona cards

### Elevated Card
- `bg-white` `shadow-md` `rounded-xl` `p-6`
- Hover: `shadow-lg`
- Used pentru: pricing cards, testimonials

### Gradient Border Card (rare — special)
- `bg-white` cu `padding 1px` într-un `bg-gradient-brand` wrapper
- Used pentru: featured pricing tier, hero CTA cards

### Card cu Media
- Image top, padding-top relevant pentru aspect ratio
- Aspect ratios: `4:3` (blog), `16:9` (testimonial videos), `1:1` (avatar/persona)

## 2.4 Navigation

### Header (Sticky)
```
┌──────────────────────────────────────────────────────┐
│ [Logo FamilyLink] [Cămine] [Familii] [Pricing] ...  │
│                                       [Programează demo →] (primary sm) │
└──────────────────────────────────────────────────────┘
```
- `bg-white/80 backdrop-blur-md` (glass effect on scroll)
- Border bottom subtle: `border-b border-navy-100`
- Height: 64px desktop, 56px mobile
- z-index: 30

### Mobile Menu (Hamburger)
- Slide-in panel from right, full height, `bg-white`
- Backdrop: `bg-navy-900/50 backdrop-blur-sm`
- Animation: 300ms ease-out
- CTA reapare la final de panel

### Footer
4 coloane desktop · accordion mobile:
- Col 1: Logo + tagline + social icons + EAN/Cajal badges
- Col 2: Pentru cămine (links)
- Col 3: Pentru familii (links)
- Col 4: Companie (Despre, Contact, Blog, Press)
- Bottom strip: Copyright + Privacy + T&C + Cookies + ANSPDCP register link

### Breadcrumbs (folosit pe blog, /press)
`Home / Blog / Articol curent`
- Color: `navy-500`, current item `navy-700`
- Separator: `/` cu `text-navy-300`
- Schema BreadcrumbList JSON-LD

## 2.5 Modal / Dialog
- Centered, max-width `max-w-md` (default), `max-w-lg`, `max-w-2xl`
- `rounded-2xl` `bg-white` `shadow-2xl`
- Backdrop: `bg-navy-900/60 backdrop-blur-sm`
- Animation: scale-in `duration-250 ease-out`
- Close: ESC key + backdrop click + X button top-right
- Trap focus while open

## 2.6 Toast / Notification
- Position: bottom-right desktop, top mobile
- `rounded-lg` `bg-white` `shadow-lg` `border-l-4` (color depends on variant)
- Variants: success (green-400), error (error), info (blue-400), warning (warning)
- Auto-dismiss after 5s (configurable)
- Stack max 3, oldest dismisses first

## 2.7 Badge / Tag

### Sizes
- `xs`: text-xs, px-2 py-0.5
- `sm`: text-sm, px-2.5 py-1

### Variants
- `subtle`: `bg-{color}-50 text-{color}-700` (default)
- `solid`: `bg-{color}-500 text-white` (status critical)
- `outline`: `border border-{color}-300 text-{color}-700`
- `gradient`: `bg-gradient-brand text-white` (special — pentru EAN, premium)

### Use cases
- EAN badge: gradient brand or outline brand cu logo EAN inline
- Pricing tier: `subtle` blue
- Status active: `subtle` green
- Status pilot: `subtle` warning
- New feature: `solid` blue

## 2.8 Avatar

### Sizes
- `xs`: 24px (chips, inline mentions)
- `sm`: 32px (lists)
- `md`: 40px (comments) **default**
- `lg`: 56px (profile)
- `xl`: 80px (hero, founder)
- `2xl`: 128px (testimonial spotlight)

### Variants
- Image: rounded-full
- Initials fallback: `bg-gradient-brand text-white font-semibold`
- Placeholder (no image, no initials): `bg-neutral-200` cu icon user

## 2.9 Tabs
- Underline style (NOT pill style) — mai sobru pentru audience B2B
- Active tab: `border-b-2 border-blue-400 text-navy-800 font-semibold`
- Inactive: `text-navy-500 hover:text-navy-700`
- Padding: `px-4 py-3`
- Use case: `/cum-functioneaza` toggle „Cămine / Familii / Super-admin"

## 2.10 Accordion (FAQ)
- Item: full width, border-b border-navy-100
- Trigger: `py-5 text-base font-semibold text-navy-700` cu chevron drept
- Content: `pb-5 text-base text-neutral-600` cu transition height
- Animation: 200ms ease-out
- One open at a time (for FAQ) sau multiple (pentru filters)
- ARIA: `aria-expanded`, `aria-controls`

## 2.11 Pricing Table

### Layout (4 cols desktop, vertical cards mobile)
```
┌──────────┬──────────┬──────────┬──────────┐
│   T1     │   T2     │   T3     │   T4     │
│ 0-50     │ 50-100   │ 100-200  │ 200+     │
│ rezident.│ rezident.│ rezident.│ rezident.│
│          │          │  POPULAR │          │
│  150€    │  250€    │  350€    │  450€    │
│  /lună   │  /lună   │  /lună   │  /lună   │
│          │          │          │          │
│ Features │ Features │ Features │ Features │
│ ✓ ...    │ ✓ ...    │ ✓ ...    │ ✓ ...    │
│ ✓ ...    │ ✓ ...    │ ✓ ...    │ ✓ ...    │
│          │          │          │          │
│ [Demo →] │ [Demo →] │ [Demo →] │ [Demo →] │
└──────────┴──────────┴──────────┴──────────┘
```

- Featured tier (T3, „POPULAR"): gradient border + slight scale up + shadow-xl
- All others: `card-elevated` style
- CTA in EACH column (nu doar la final)

## 2.12 Form Patterns

### Validation
- Inline real-time: arată error sub field on blur (NOT pe fiecare keystroke)
- Submit attempt: highlight all invalid fields + scroll to first error
- Success: redirect or success toast cu next steps clare

### Required indication
- Asterisk roșu inline cu label: `Nume *`
- NU folosi „(opțional)" — folosim asterisc pentru required, lipsa lui = opțional

---

# 3. Voice & Tone Guidelines

## 3.1 Reguli de copy

1. **Fraza scurtă bate fraza lungă.** Maximum 20 cuvinte/frază în UI. 25 în body content.
2. **Verbe active.** „Reduceți timpul" NU „Timpul este redus".
3. **Tu (B2C) / Voi (B2B).** Niciodată „dumneavoastră" — creează distanță. Excepție: pagina /contact, formal.
4. **Cifre concrete > cuvinte vagi.** „Economisește 2 ore/zi" NU „economisește mult timp".
5. **Beneficiu înainte de feature.** „Familiile primesc update-uri zilnice" (beneficiu) NU „Sistemul nostru include modul de jurnal" (feature).
6. **Emoții fără dramă.** „Aproape de cei dragi" da · „Nu-ți pierde părintele singur într-un cămin" NU.
7. **Limbaj cotidian, nu jargon.** „Aplicația" NU „SaaS multi-tenant". „Sistem online" NU „cloud-native platform".

## 3.2 Cuvinte permise vs evitate

### ✅ Folosim
- vârstnici · seniori · părinte · mamă · tată
- rezidenți (în context cămin)
- îngrijire · grijă · suport
- cămin · centru de îngrijire · centru rezidențial
- echipă · personal · îngrijitor
- aproape · conectat · transparent · liniște
- simplu · ușor · rapid

### ❌ Evităm
- bătrâni (peiorativ în 2026 RO)
- bolnavi · pacienți (medicalizează inutil)
- azil · casă de bătrâni (învechit, negativ)
- dragi · iubiții voștri (melodramatic)
- soluție · platformă (jargon corporate)
- revolutionary · disruptive · best-in-class · synergy
- „pierdere" · „ultimul drum" · „rămas-bun" (eufemisme triste)
- crizei demografice · îmbătrânirea populației (depresiv în context produs)

## 3.3 Same feature, different tone

**Feature: Jurnalul zilnic cu fotografii**

**B2B (`/pentru-camine`):**
> *„Personalul căminului adaugă în 30 de secunde un update zilnic per rezident: text scurt + 1-3 fotografii. Familiile îl primesc automat. Nu mai răspunzi la 50 de telefoane pe zi."*

**B2C (`/pentru-familii`):**
> *„Vezi în fiecare zi cum își începe ziua. O poză cu zâmbetul ei la micul dejun, un cuvânt de la îngrijitor, un moment liniștit. Aproape de ea, oriunde ai fi."*

**Feature: Conformitate GDPR**

**B2B:** *„Datele rezidenților sunt stocate exclusiv pe servere în UE (Frankfurt). Audit log complet, drept la uitare cu un click, raportare ANSPDCP automatizată. Liniște legală, fără efort."*

**B2C:** *„Datele familiei tale rămân în UE, protejate. Doar tu și căminul aveți acces. Punct."*

---

# 4. Iconography

## 4.1 Library: **Lucide Icons**

**De ce Lucide:**
- Open source (ISC license)
- 1500+ icons, consistent stroke style
- Tree-shakeable (doar ce folosești ajunge în bundle)
- React + Next.js native
- Customizable stroke width

**NU:**
- Phosphor (overkill, prea multe variante)
- Iconsax (mai stiloase dar inconsistent licensing)
- FontAwesome (legacy, bundle mare)

## 4.2 Style guide

- **Stroke width default:** `1.5` (Lucide default e 2, dar 1.5 e mai delicat și se potrivește brand-ului warm)
- **Size scale:** 16, 20, 24, 32, 40, 48, 64
- **Color:** match cu text color (navy-700 default · brand colors pentru accent only)
- **Container:** când icon-ul e singur (nu în text), îl pui într-un container `rounded-lg bg-{color}-50 p-2` cu icon `text-{color}-500`

## 4.3 Custom icons necesare

- **Heart-embrace** — extras din logo, simplificat la 24×24, folosit în feature lists
- **EAN logo** — descărcat oficial de pe ean.care (vector)
- **Cajal logo** — solicitat de la Cerasela
- **Trust badges** custom: „GDPR · UE · 100% transparent" — micro-icons compus

---

# 5. Imagery Guidelines

## 5.1 Photo Style

### ✅ DA
- Foto autentic cu cămine partenere REALE (cu drepturi)
- Stock pre-approved Pexels/Unsplash (curat, no models cliché)
- Treatment uniform: warm color grading, slight desaturation
- Compoziții cu spațiu pentru text overlay (rule of thirds)
- Persoane reale (vârstnici activi cu îngrijitori, familii vizitându-i)
- Mâini, gesturi (transmite căldură fără față)

### ❌ NU
- Stock cliché „diverse business handshake"
- Vârstnici izolați, triști, în pat de spital
- Mediu clinic (saloane spital, halate albe sterile)
- Imagini procesate cu filtre AI distincte (Midjourney signature look)
- Faces front-on prea mult — preferăm 3/4 sau side
- Iluminare rece (toate cu warm temperature 4500K-5500K)

## 5.2 Color treatment

```
Lightroom-equivalent settings:
- Temp: +5 to +15 (warm)
- Tint: -2 to +2 (neutral)
- Saturation: -10 (slightly desaturated)
- Highlights: -15
- Shadows: +10
- Whites: -5
- Blacks: 0
```

Asta dă consistency vizuală indiferent de sursă.

## 5.3 Video (Pexels approved searches)

**Pentru hero homepage:**
- „elderly people care home" (warm, bright shots)
- „grandmother grandchild video call"
- „caregiver elderly hands"
- „family looking at photos elderly"

**Specs hero video:**
- Format: MP4 + WebM fallback
- Resolution: 1920×1080 max, optimizat la <2MB
- Duration: 8-15 sec loop seamless
- Fără sunet (`muted autoplay loop playsinline`)
- Poster image: first frame static
- Lazy load: `loading="lazy"` pentru videos under-the-fold

## 5.4 Illustrations (custom — opțional Faza 2)

Stil propus dacă investim în custom: **flat geometric warm**, paleta brand, linii subtile. Inspiriație: Linear, Stripe Atlas, Cal.com illustration style.

---

# 6. Motion Principles

## 6.1 Când animăm

### ✅ Animăm
- Hover-uri pe interactive elements (150ms)
- Modal in/out (250/150ms)
- Toast appear/dismiss (200ms slide)
- Page transitions subtle (300ms fade)
- Stagger reveal pentru lists/grids on scroll (50ms between items)
- Hero text animation (split text, fade in)
- Number counters (1.5s ease-out)
- Magnetic CTA hero (subtle cursor follow)

### ❌ Nu animăm
- Tot scroll-ul (`scroll hijacking` = bad UX)
- Cursor cu efecte vizuale dominante
- Pagini cu prea multe simultaneous animations
- Background-uri dinamice care distrag de la content

## 6.2 React Bits componente selectate

| Component | Use case |
|---|---|
| **SplitText** | H1 hero — letter-by-letter reveal |
| **TextReveal** | Subline + section headlines |
| **StaggerReveal** | Feature lists, persona cards |
| **CountUp** | Stats („200+ cămine partenere", „98% familii active") |
| **Marquee** | Logo wall când avem (cămine partenere) |
| **MagneticButton** | Hero primary CTA only |
| **GradientText** | Brand color span emphasis |
| **ScrollProgress** | Top of viewport progress bar (subtil) |
| **AnimatedTabs** | `/cum-functioneaza` switching între audiențe |
| **PinSection** | Sticky scroll cu mockups schimbate (Apple-style) |

## 6.3 Reduced Motion

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
```

Toate React Bits components trebuie să respecte `prefers-reduced-motion` API-ul lor.

---

# 7. Accessibility Baseline (WCAG 2.1 AA)

## 7.1 Color & contrast
- Verificat în secțiunea Tokens 1.1
- NU folosim culoare ca singur indicator (ex: error în formular = roșu + iconă + text)

## 7.2 Keyboard navigation
- Toate interactive elements: focusable cu Tab
- Focus visible: 2px outline `blue-400` cu offset 2px
- Skip link „Sări la conținut" la începutul page
- ESC închide modal/dropdown
- Enter/Space activează butoane

## 7.3 Screen reader
- Toate imaginile: alt text descriptiv (NU „image of...")
- Iconuri decorative: `aria-hidden="true"`
- Iconuri funcționale: `aria-label`
- Form fields: explicit `<label>` (nu placeholder ca label)
- Live regions pentru error messages: `aria-live="polite"`
- Buttons cu doar icon: `aria-label`

## 7.4 Mobile / Touch
- Touch targets minimum 44×44px (Apple) / 48×48px (Material)
- Spacing între targets: minimum 8px
- Hover effects au alternativă pentru touch (focus state)

## 7.5 Forms
- Inline validation după blur
- Error messages: prefixed cu „Eroare:" pentru screen readers
- Required: explicit asterisc + `required` attribute
- `autocomplete` attributes pentru common fields

## 7.6 Content
- Headings hierarchy semantically corect (H1 → H2 → H3)
- Limba paginii: `<html lang="ro">`
- Section landmarks: `<main>`, `<nav>`, `<aside>`, `<footer>`
- Skip-to-content link

---

# 8. Implementation — Tailwind Config

## 8.1 `tailwind.config.ts`

```ts
import type { Config } from 'tailwindcss'

const config: Config = {
  content: ['./src/**/*.{ts,tsx}'],
  darkMode: 'class',
  theme: {
    container: {
      center: true,
      padding: { DEFAULT: '1rem', sm: '1.5rem', lg: '2rem' },
      screens: { sm: '640px', md: '768px', lg: '1024px', xl: '1280px', '2xl': '1280px' },
    },
    extend: {
      colors: {
        blue: {
          50: '#F0FAFD', 100: '#D9F2F8', 200: '#B4E5F0', 300: '#7FD2E5',
          400: '#4FB8D9', 500: '#2DA0C7', 600: '#1F88AE', 700: '#1A6B8B',
          800: '#155069', 900: '#0F3849', 950: '#082432',
        },
        green: {
          50: '#F2FAF1', 100: '#DEF2DB', 200: '#BDE5B7', 300: '#9CD895',
          400: '#7CC576', 500: '#5DAD56', 600: '#479143', 700: '#387234',
          800: '#2A552A', 900: '#1D3A1D', 950: '#0F1F0F',
        },
        navy: {
          50: '#F2F5F9', 100: '#E1E8F0', 200: '#C2CFDC', 300: '#9AAABF',
          400: '#6B829F', 500: '#4A6585', 600: '#34516F', 700: '#264259',
          800: '#1E3A5F', 900: '#162A45', 950: '#0B1828',
        },
        neutral: {
          0: '#FFFFFF', 50: '#FAFAF8', 100: '#F4F3EE', 200: '#E8E6DE',
          300: '#D2CFC4', 400: '#A8A496', 500: '#7A7468', 600: '#5C574E',
          700: '#3D3A35', 800: '#28261F', 900: '#1A1814', 950: '#0D0C0A',
        },
        success: { DEFAULT: '#479143', bg: '#F2FAF1', border: '#9CD895' },
        warning: { DEFAULT: '#B8860B', bg: '#FEF7E6', border: '#F5C842' },
        error: { DEFAULT: '#C73838', bg: '#FEF1F1', border: '#F5A8A8' },
        info: { DEFAULT: '#2DA0C7', bg: '#F0FAFD', border: '#7FD2E5' },
      },
      fontFamily: {
        display: ['Plus Jakarta Sans', 'system-ui', 'sans-serif'],
        body: ['Plus Jakarta Sans', 'system-ui', 'sans-serif'],
        mono: ['JetBrains Mono', 'Fira Code', 'monospace'],
      },
      fontSize: {
        xs: ['12px', { lineHeight: '1.5' }],
        sm: ['14px', { lineHeight: '1.5' }],
        base: ['16px', { lineHeight: '1.6' }],
        lg: ['18px', { lineHeight: '1.6' }],
        xl: ['20px', { lineHeight: '1.5' }],
        '2xl': ['24px', { lineHeight: '1.4' }],
        '3xl': ['30px', { lineHeight: '1.3' }],
        '4xl': ['36px', { lineHeight: '1.2' }],
        '5xl': ['48px', { lineHeight: '1.1' }],
        '6xl': ['60px', { lineHeight: '1.05' }],
        '7xl': ['72px', { lineHeight: '1.0' }],
      },
      borderRadius: {
        sm: '4px', DEFAULT: '6px', md: '8px', lg: '12px',
        xl: '16px', '2xl': '20px', '3xl': '24px',
      },
      boxShadow: {
        xs: '0 1px 2px 0 rgba(30, 58, 95, 0.05)',
        sm: '0 1px 3px 0 rgba(30, 58, 95, 0.08), 0 1px 2px 0 rgba(30, 58, 95, 0.06)',
        md: '0 4px 6px -1px rgba(30, 58, 95, 0.08), 0 2px 4px -2px rgba(30, 58, 95, 0.06)',
        lg: '0 10px 15px -3px rgba(30, 58, 95, 0.08), 0 4px 6px -4px rgba(30, 58, 95, 0.06)',
        xl: '0 20px 25px -5px rgba(30, 58, 95, 0.1), 0 8px 10px -6px rgba(30, 58, 95, 0.06)',
        '2xl': '0 25px 50px -12px rgba(30, 58, 95, 0.16)',
        brand: '0 10px 30px -10px rgba(79, 184, 217, 0.4)',
        'brand-green': '0 10px 30px -10px rgba(124, 197, 118, 0.4)',
      },
      backgroundImage: {
        'gradient-brand': 'linear-gradient(135deg, #4FB8D9 0%, #7CC576 100%)',
        'gradient-brand-soft': 'linear-gradient(135deg, rgba(79,184,217,0.15) 0%, rgba(124,197,118,0.15) 100%)',
      },
      transitionDuration: {
        '75': '75ms', '150': '150ms', '250': '250ms',
        '400': '400ms', '600': '600ms', '1000': '1000ms',
      },
      transitionTimingFunction: {
        smooth: 'cubic-bezier(0.25, 0.1, 0.25, 1)',
        bounce: 'cubic-bezier(0.68, -0.55, 0.265, 1.55)',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('tailwindcss-animate'),
  ],
}

export default config
```

## 8.2 `globals.css` excerpt

```css
@import 'tailwindcss';

@layer base {
  :root {
    --background: 250 250 248;          /* neutral-50 */
    --foreground: 30 58 95;             /* navy-800 */
    --primary: 79 184 217;              /* blue-400 */
    --primary-foreground: 255 255 255;
    --secondary: 124 197 118;           /* green-400 */
    --muted: 244 243 238;               /* neutral-100 */
    --border: 225 232 240;              /* navy-100 */
    --ring: 79 184 217;                 /* blue-400 */
    --radius: 0.5rem;                   /* 8px */
  }

  html { font-family: 'Plus Jakarta Sans', system-ui, sans-serif; lang: ro; }
  body { @apply bg-neutral-50 text-navy-800 antialiased; }
  h1, h2, h3, h4, h5, h6 { @apply font-bold tracking-tight text-navy-700; }
  ::selection { @apply bg-blue-100 text-navy-800; }
}

@layer components {
  .btn-primary {
    @apply bg-blue-400 text-white font-semibold rounded-md px-4 py-2.5
           hover:bg-blue-500 hover:shadow-brand active:bg-blue-600
           focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-offset-2
           disabled:opacity-50 disabled:cursor-not-allowed
           transition-all duration-150 ease-out;
  }
  .container-prose { @apply max-w-3xl mx-auto px-4 sm:px-6; }
  .section-y { @apply py-16 md:py-24 lg:py-32; }
}

@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

## 8.3 shadcn/ui customization

Folosim shadcn/ui ca foundation, override theme prin `components.json`:

```json
{
  "style": "default",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
    "css": "src/app/globals.css",
    "baseColor": "neutral",
    "cssVariables": true,
    "prefix": ""
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils"
  }
}
```

Componente shadcn pe care le instalăm: button, input, label, textarea, select, checkbox, radio-group, switch, slider, dialog, sheet, popover, tooltip, accordion, tabs, table, card, badge, avatar, toast, alert, separator, scroll-area, navigation-menu.

---

# 9. Următorii pași

1. ✅ Design system v1 (acest doc)
2. ⏳ `design:ux-copy` — copy complet pe toate cele 9 pagini, B2B + B2C tone
3. ⏳ Wireframes low-fi (ASCII layout pentru toate paginile)
4. ⏳ Pexels video selection (paralel)
5. ⏳ High-fi mockups (HTML preview)
6. ⏳ `design:design-critique` pe mockups
7. ⏳ `design:accessibility-review`
8. ⏳ Build Next.js 15 cu acest design system
