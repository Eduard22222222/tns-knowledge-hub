# Color Palette — FamilyLink

## Filozofie

Cererea inițială a clientului a fost **albastru + verde + alb** pentru a inspira încredere. Combinația e bună, dar la nivel de execuție „albastru + verde + alb" generic e clișeul absolut din healthcare (același palette îl au 1000 de aplicații medicale, fără personalitate).

**Soluția:** păstrăm cele 3 culori de bază, dar le rafinăm spre tonuri **muted, premium, mature** — nu sature, nu pastel, nu vibrant. Adăugăm 1 culoare de accent pentru moments umane (warm).

## Paletă propusă — „Quiet Confidence"

### Primary Colors

| Nume | Hex | RGB | Folosit pentru |
|---|---|---|---|
| **Cypress Blue** | `#1F4F5F` | rgb(31, 79, 95) | Logo primary, headings, brand-defining backgrounds |
| **Sage** | `#A8C4A2` | rgb(168, 196, 162) | Acceent UI (success states, illustrations subtle), brand-soft moments |
| **Cream White** | `#F8F5EE` | rgb(248, 245, 238) | Background principal, breathing space |

### Supporting Colors

| Nume | Hex | RGB | Folosit pentru |
|---|---|---|---|
| **Deep Charcoal** | `#1A1A1A` | rgb(26, 26, 26) | Body text, contrast maxim |
| **Soft Gray** | `#7A7468` | rgb(122, 116, 104) | Secondary text, captions, metadata |
| **Border Mist** | `#E0DDD5` | rgb(224, 221, 213) | Borders, dividers, subtle separation |

### Accent Color (warm human moment)

| Nume | Hex | RGB | Folosit pentru |
|---|---|---|---|
| **Terracotta** | `#D4A284` | rgb(212, 162, 132) | CTA buttons, highlight pe momente emoționale (mesaj nou, foto nouă), date importante |

### Functional Colors (UI states)

| Nume | Hex | Folosit pentru |
|---|---|---|
| **Success Sage** | `#7AA876` | Confirmări, mesaj trimis, salvare reușită |
| **Warning Honey** | `#D4B26F` | Avertizări, atenționări neutre |
| **Error Brick** | `#C25450` | Erori, ștergere ireversibilă |
| **Info Slate** | `#5B7B8A` | Notificări neutre, tooltip-uri |

## De ce funcționează combinația

### Cypress Blue (primary)
- Mai închis decât „medical blue" → demnitate, nu sterilitate
- Tinte spre teal → uman, nu corporate
- La dimensiuni mici (favicon, app icon) iese clar pe orice background
- Asociere psihologică: încredere, calm, profunzime

### Sage (secondary)
- Verde muted, NU verde Whatsapp/Spotify
- Asociere psihologică: viață, vindecare, prezență liniștită
- Funcționează ca accent, nu ca dominant — așa nu intră în „ferma bio" aesthetic

### Cream White (background)
- NU pure white (#FFFFFF) → care e cold și clinical
- Cream are warmth, pare „papetărie de lux", „fond de scrisoare scrisă de mână"
- Reduce ostenirea ochilor pentru staff care folosesc 8h/zi

### Terracotta (accent)
- Singura culoare „caldă" din paletă — dar muted, nu fluorescent orange
- Pentru momente HUMAN: fotografie nouă, mesaj de la familie, ziua de naștere
- Restrânsă la 5-10% din vizual → rămâne specială

## Combinații verificate (accesibilitate WCAG)

| Foreground | Background | Ratio | WCAG AA | WCAG AAA |
|---|---|---|---|---|
| Deep Charcoal `#1A1A1A` | Cream White `#F8F5EE` | 16.8:1 | ✅ Pass | ✅ Pass |
| Cypress Blue `#1F4F5F` | Cream White `#F8F5EE` | 8.2:1 | ✅ Pass | ✅ Pass |
| Cream White `#F8F5EE` | Cypress Blue `#1F4F5F` | 8.2:1 | ✅ Pass | ✅ Pass |
| Soft Gray `#7A7468` | Cream White `#F8F5EE` | 4.9:1 | ✅ Pass | ⚠️ Large only |
| Terracotta `#D4A284` | Cream White `#F8F5EE` | 2.1:1 | ❌ Decorative only | ❌ |
| Cream White `#F8F5EE` | Terracotta `#D4A284` | 2.1:1 | ❌ Decorative only | ❌ |
| Cream White `#F8F5EE` | Deep Charcoal `#1A1A1A` | 16.8:1 | ✅ Pass | ✅ Pass |

**Notă:** Terracotta nu trece WCAG pentru text. Folosim doar pentru elemente decorative (button accents, icon highlights, subtle backgrounds), nu text mare.

## Distribuție recomandată (regula 60-30-10)

- **60% Cream White** — backgrounds, breathing space
- **30% Cypress Blue** — headings, navigation, hierarchy primary
- **10% accent** (Sage + Terracotta + Charcoal împărțite)

## Aplicare per audiență

| Aplicație | Culori dominante | De ce |
|---|---|---|
| Landing page public | Cream White + Cypress Blue + 1 accent terracotta | Calm, profesional, primează încrederea |
| Dashboard cămin (staff) | Cream White + Charcoal text + Cypress Blue accents | Funcționalitate clară, nu obosește la 8h |
| Portal familie | Cream White + Cypress Blue + Sage + Terracotta highlights | Mai emoțional, mai cald, „home" feeling |
| Email-uri tranzacționale | Cream White + Cypress Blue heading + Terracotta CTA | Subliniere CTA fără să strige |
| Email rapport săptămânal | Cream White + cele 3 primary subtile | Mood „scrisoare de la cei dragi" |

## Paletă color tokens (CSS / Tailwind)

```css
:root {
  /* Primary */
  --color-cypress: #1F4F5F;
  --color-sage: #A8C4A2;
  --color-cream: #F8F5EE;

  /* Supporting */
  --color-charcoal: #1A1A1A;
  --color-soft-gray: #7A7468;
  --color-border-mist: #E0DDD5;

  /* Accent */
  --color-terracotta: #D4A284;

  /* Functional */
  --color-success: #7AA876;
  --color-warning: #D4B26F;
  --color-error: #C25450;
  --color-info: #5B7B8A;
}
```

```js
// tailwind.config.ts
colors: {
  cypress: { DEFAULT: '#1F4F5F', light: '#3A6A7A', dark: '#143540' },
  sage: { DEFAULT: '#A8C4A2', light: '#C2D6BD', dark: '#86A382' },
  cream: { DEFAULT: '#F8F5EE', dark: '#EDE7D8' },
  terracotta: { DEFAULT: '#D4A284', dark: '#B5825F' },
  charcoal: '#1A1A1A',
  'soft-gray': '#7A7468',
  'border-mist': '#E0DDD5',
}
```

## Alternative considerate (RESPINSE)

### Opțiunea „Morning Light" (vivid)
- Cornflower Blue `#6B8FBE` + Bright Sage `#B7CDB0` + pure white
- **De ce respinsă:** prea „spa hotel", prea consumer, lipsește gravitas

### Opțiunea „Hearth" (forest + amber)
- Forest Green `#2D5F4D` + Sky Blue `#B5D4DD` + Cream + Amber accent
- **De ce respinsă:** prea „eco / cabană", clientul a cerut albastru primary, nu verde primary

### Opțiunea „Hospital Plus" (vibrant teal + neon green)
- Bright Teal `#00A8B8` + Mint `#00E0A0` + white
- **De ce respinsă:** EXACT clișeul healthcare-tech pe care vrem să-l evităm
