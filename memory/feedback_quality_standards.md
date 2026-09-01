# Quality Standards — Lessons Learned (2026-04-13)

Feedback from Eduard on common mistakes. These are NON-NEGOTIABLE rules for all future work.

## Photos MUST match the recipe/idea they represent

- NEVER use a random Unsplash photo and hope it fits. If the recipe says "platou de dip-uri cu chips", the photo MUST show dip bowls with chips — not a pizza, not ice cream, not a charcuterie board.
- ALWAYS verify every photo visually (using the Read tool on the image file) BEFORE committing it to code.
- If Unsplash doesn't have the right photo, use Nanobanana (Gemini) to GENERATE the exact image described in the recipe.
- NEVER reuse the same photo across multiple recipe cards — every card gets its own unique photo.

## Brand logos must be actual logos, not product shots

- On the homepage, hero section, and aggregate pages: use the brand's ACTUAL LOGO, not a product pack shot.
- Product pack shots are for PRODUCT CARDS inside brand sub-pages (reviews pages).
- Always check the client's website for their official logo files before falling back to product imagery.

## Hero sections should feel community-friendly

- Use the Macromex-style hero (personaj character + floating bubbles + warm background) as the default template — it's proven to feel welcoming.
- Don't use plain banner + solid color overlay — it looks corporate and cold.

## Recipes/Idei de servire must have detailed steps

- Every recipe/idea MUST have: ingredients list + numbered step-by-step instructions.
- The "Vezi detalii" button MUST open a modal showing the full recipe with:
  - Hero image
  - Title + time + servings + difficulty
  - Description
  - Ingredients list with bullet points
  - Numbered preparation steps (6-8 steps per recipe)
- Steps should be conversational Romanian, not robotic ("Nu judecăm", "Se mănâncă cu mâna, fără ceremonie!")

## Blue overlay on hero = ugly

- Never put a solid color overlay (blue, red, etc.) on the hero section background.
- Use white-to-transparent gradient from left, same as the original Macromex template.

## Competition card layout

- Description, prizes, and button must NOT overlap.
- Use `gap-3` flex column with `border-t` separator between description and prizes.
- Use `<div className="flex-1" />` spacer to push deadline + button to bottom.
- Button must be `w-full`, not `flex-1`.
- Grid: `grid-cols-1 sm:grid-cols-2 lg:grid-cols-3`

## General process rules

- Verify EVERY asset visually before using it in code.
- Don't trust Unsplash photo IDs blindly — the ID doesn't tell you what the photo actually shows.
- When in doubt, GENERATE the image with Nanobanana rather than gambling on stock photos.
