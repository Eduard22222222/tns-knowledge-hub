# Typography — FamilyLink

## Filozofie

Tipografia trebuie să exprime **profesionalism cald, încredere fără rigiditate**. Două familii care lucrează împreună:
- O familie **serif** pentru titluri, ancorare emoțională, gravitas (ca o scrisoare scrisă)
- O familie **sans-serif** pentru body & UI, lizibilitate, modernism (ca o aplicație folosită de staff 8h/zi)

Evităm:
- ❌ Sans-serif geometric agresiv (Futura-like) — too tech
- ❌ Serif clasic dramatic (Bodoni, Didot) — too luxury fashion
- ❌ Display fonts (handwriting, script) — nu sunt clinice
- ❌ Fonts non-Google (cost licență, problem de delivery)

## Recomandare principală — „Editor's Pair"

### Heading: **Lora** (serif)

- **De ce:** serif modern, mai ușor decât Times sau Garamond, cu personalitate caldă. Folosit de New Yorker-style editorial. Funcționează pe tot spectrul de dimensiuni.
- **Greutăți utilizate:** 400 (regular), 600 (semibold), 700 (bold)
- **Sursă:** Google Fonts (gratuit, latină extinsă, suport diacritice română ă/â/î/ș/ț perfect)
- **Use cases:** Logo wordmark (cu modificări custom), H1-H3 in landing, titluri secțiuni dashboard, citate emoționale, subiect email

### Body & UI: **Inter** (sans-serif)

- **De ce:** designed for screens, optical sizing, suport excelent diacritice RO. Standard de facto pentru aplicații moderne (Vercel, Stripe, Notion îl folosesc). Lizibilitate la dimensiuni mici.
- **Greutăți utilizate:** 400 (regular), 500 (medium), 600 (semibold), 700 (bold)
- **Sursă:** Google Fonts (gratuit)
- **Use cases:** body text, butoane, formulare, navigare, tabele, app-ul integral

## Pereche alternativă — „Modern Editorial"

Dacă Lora pare prea „warm-traditional", alternativă mai modernă:

### Heading: **Fraunces** (serif)

- **De ce:** serif variabil, opțiuni de „opsz" (optical size) și „SOFT" (rotunjire). Foarte expresiv, premium, dar nu clasic-fashion.
- **Greutăți:** 400, 600, 700, 900 (pentru hero pe landing)
- **Sursă:** Google Fonts

### Body & UI: **Inter** (la fel ca opțiunea principală)

## Pereche alternativă 2 — „Clean Hospitality"

Dacă vrem mai puțin editorial, mai mult „hotel premium":

### Heading: **Outfit** (sans, rounded geometric)

- Folosit deja în contractul TNS curent
- Personalitate caldă, geometric dar nu rigid
- Funcționează single-family (heading + body același font, doar greutăți diferite)

### Body & UI: **Outfit** (same, regular weight)

**Avantaj:** un singur font, simplifică totul. **Dezavantaj:** mai puțină personalitate decât perechea serif+sans.

## Recomandare finală

**Mergem cu „Editor's Pair" — Lora + Inter.**

De ce:
- Lora pe heading = warmth + gravitas, exact ce vrem pentru audiența emoțională
- Inter pe body = lizibilitate la 8h/zi pentru staff, suport perfect diacritice
- Combinația e folosită de publicații serioase (medium-tier editorial)
- Ambele Google Fonts → zero cost, zero risc legal

## Scale tipografică (modular scale 1.250 — Major Third)

| Element | Font | Size | Weight | Line height | Letter spacing |
|---|---|---|---|---|---|
| **Display** (hero landing) | Lora | 56-72px | 700 | 1.1 | -0.02em |
| **H1** | Lora | 40-48px | 700 | 1.15 | -0.01em |
| **H2** | Lora | 32-36px | 600 | 1.2 | 0 |
| **H3** | Lora | 24-28px | 600 | 1.3 | 0 |
| **H4** | Inter | 20px | 600 | 1.4 | 0 |
| **Body large** | Inter | 18px | 400 | 1.6 | 0 |
| **Body** | Inter | 16px | 400 | 1.6 | 0 |
| **Body small** | Inter | 14px | 400 | 1.5 | 0 |
| **Caption** | Inter | 12px | 500 | 1.4 | 0.02em |
| **Overline** (eyebrow tags) | Inter | 11px | 600 | 1.3 | 0.15em uppercase |
| **Button** | Inter | 14-16px | 600 | 1 | 0.01em |

## Reguli de utilizare

### Hierarchy stricter
- Maxim **3 niveluri de heading** vizibile per pagină
- Body text NICIODATĂ mai mic de 14px (pentru staff care folosește 8h/zi)
- Line-height **niciodată sub 1.4** pentru body (legibilitate)

### Diacritice română
- Ambele fonturi (Lora + Inter) au suport complet ă/â/î/ș/ț
- Variantele „cu sedilă" (Ş Ţ) NU se folosesc — folosim virgulă (Ș Ț) conform standardului român modern

### Italic
- Folosim italic pentru: citate, ediții editoriale, accente subtile
- NICIODATĂ italic pentru titluri de secțiune (devine hard to read)

### Bold
- Folosim bold pentru: emfaza în body text (1-3 cuvinte per paragraf max), termeni-cheie, butoane primary
- NICIODATĂ bold pentru paragrafe întregi (își pierde sensul)

### All caps
- Doar pentru: overline / eyebrow tags (ex: „PROIECT NOU"), nav labels secundare
- NICIODATĂ paragrafe sau titluri principale all caps

## Implementare tehnică

### Next.js / Tailwind setup

```ts
// app/layout.tsx
import { Lora, Inter } from 'next/font/google'

const lora = Lora({
  subsets: ['latin', 'latin-ext'],
  variable: '--font-heading',
  weight: ['400', '600', '700'],
})

const inter = Inter({
  subsets: ['latin', 'latin-ext'],
  variable: '--font-body',
  weight: ['400', '500', '600', '700'],
})

export default function RootLayout({ children }) {
  return (
    <html className={`${lora.variable} ${inter.variable}`}>
      <body>{children}</body>
    </html>
  )
}
```

```ts
// tailwind.config.ts
fontFamily: {
  heading: ['var(--font-heading)', 'Georgia', 'serif'],
  body: ['var(--font-body)', '-apple-system', 'sans-serif'],
}
```

### Email templates (Resend)
- Email clients = limited font support
- **Fallback chain pentru email:**
  - Heading: `Lora, Georgia, 'Times New Roman', serif`
  - Body: `Inter, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif`
- Web fonts în email NU se garantează — design pentru fallback nativ

## Mostre vizuale (de generat)

[ ] Mockup heading + body în Cypress Blue + Cream White
[ ] Mostre la dimensiuni multiple (desktop, mobile)
[ ] Mostre cu diacritice complete: „Bună dimineața, Ștefania. Bunicul tău a primit un mesaj de la cămin."
[ ] Comparație Lora vs Fraunces side-by-side
