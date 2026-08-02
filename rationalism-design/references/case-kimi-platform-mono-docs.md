# Case: Kimi Platform Docs — Monochrome Engineering Docs

Source: distilled from platform.kimi.com/docs (Mintlify base + ~11KB hand-written `custom.css` override layer, measured 2026-08 from live inline CSS and Next.js chunks).
Temperament: **achromatic discipline**. Black is the only "accent" — every interactive signal (hover, active, focus, link) is expressed through lightness contrast, never hue. The page reads like a printed spec sheet, not a branded marketing surface.

## Three Inviolable Rules
1. **Black is the accent**: `--brand-primary: #111111` (light) / `#f5f5f5` (dark). Links, hover borders, active sidebar items, tabs, TOC markers — all monochrome. Introducing any chromatic accent breaks the case.
2. **Neutral shadows only**: the single permitted elevation shadow is `0 10px 30px rgba(15, 23, 42, 0.08)` (neutral slate, 8% alpha). Colored glow shadows are banned — this is the explicit inverse of the kimi-code docs site (blue glow `rgba(10,122,255,.22)`), do not cross the two.
3. **No lift on hover**: cards never translate. Hover = border darkens to `--brand-primary` + the neutral shadow, over 0.2s. The only motion allowed anywhere is the model-card image `scale(1.05)` over 0.5s.

## When to Use
API/developer documentation, technical reference pages, spec sheets, data-dense report pages where content credibility matters more than brand warmth. When the user says "reference platform.kimi.com / Kimi 开放平台 docs style", use this case directly. Pairs with system font stacks and zero-dependency delivery.

## Colors
Full grayscale ramp; interactive states are lightness shifts within the ramp. Semantic colors (method pills GET/POST, error/success badges) are the only permitted hues and they belong to the content, not the chrome.

Light (default):

| Role | value | Usage |
|---|---|---|
| brand-primary | `#111111` | The "accent": links, hover borders, active states |
| brand-primary-strong | `#2a2a2a` | Hover deepen of links |
| brand-primary-soft | `rgba(17,17,17,0.08)` | Active sidebar item background |
| brand-text | `#171717` | Body / headings |
| brand-text-muted | `#5f5f68` | Descriptions, secondary text, icons |
| brand-border | `#e5e7eb` | 1px card/code/search borders |
| brand-border-strong | `#d4d4d8` | Emphasized border |
| brand-surface | `#f5f5f5` | Inline code bg, hero card bg, model card bg |
| brand-card-bg | `rgba(255,255,255,0.9)` | Cards (with backdrop blur, see Shadows) |
| brand-overlay | `linear-gradient(to top, rgba(10,10,10,0.78), rgba(10,10,10,0.28), transparent)` | Image-bottom scrim on model cards |

Dark:

| Role | value | Usage |
|---|---|---|
| brand-primary | `#f5f5f5` | Inverted accent |
| brand-primary-strong | `#ffffff` | Link hover |
| brand-primary-soft | `rgba(245,245,245,0.14)` | Active sidebar bg |
| brand-text | `#fafafa` | Body |
| brand-text-muted | `#a1a1aa` | Secondary |
| brand-border | `#303038` | Borders |
| brand-border-strong | `#3f3f46` | Emphasized border |
| brand-surface | `#151515` | Surfaces (page bg measured `rgb(14 14 16)` / `rgb(15 17 23)`) |
| brand-card-bg | `rgba(24,24,27,0.88)` | Cards |

## Type Scale
Body font: Inter (variable) with system fallback — `var(--font-inter), -apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif`; CJK falls through to PingFang SC / Microsoft YaHei. Mono: ui-monospace system stack for all code (this is a docs product — code blocks are the content, mono is mandatory, not decorative).

Custom-layer tiers (prose body inherits docs-framework defaults):

| token | value | usage |
|---|---|---|
| card-title | 16px / weight 500–600 / line-height 1.2 | card headings |
| card-desc | 14px / muted / line-height 1.4 | card descriptions |
| cta | 14px / weight 500 | hero CTA button |
| code-inline | 11–13px scaled down under 900px/640px breakpoints | inline code in tables |

CJK craftsmanship rule (measured, keep it): **never synthesize bold via `text-shadow`** — the site's own override disables Mintlify's synthetic-bold text-shadow because it distorts CJK glyphs. Use real font weights only. Links underline with `color-mix(in srgb, var(--brand-primary) 58%, transparent)`, deepening to 72% on hover, `text-underline-offset: 0.18em`.

## Radius
Rounded system, four working tiers: `8px` (CTA buttons), `12px` (cards / code blocks — the dominant tier), `14px` (sidebar active item), `999px` (method pills / chips). Consistent with the "friendly docs" decision — do not mix in square corners.

## Shadows
One diffuse tier only, plus one functional blur:

```css
/* 1. Card hover elevation — the only diffuse shadow in the system */
--shadow-card-hover: 0 10px 30px rgba(15, 23, 42, 0.08);

/* 2. Card backdrop — the single permitted glass element */
backdrop-filter: blur(10px);  /* paired with rgba(255,255,255,0.9) card bg */
```

Banned: colored/glow shadows of any hue, layered diffuse stacks, drop shadows on text. Search bar and method pills explicitly run `box-shadow: none`.

## Layout Concept
Docs chrome (topbar + sidebar + TOC) around a single-column prose flow; index/overview pages use 2–4 column card grids (`gap: 16px`, collapsing 4→2→1 at 1100px/700px breakpoints). Cards are media objects: 24px muted icon + title + description, whole card is the link. Hierarchy comes from weight and grayscale steps, never from color or decoration.

## Signature Element
**The code block is the hero.** Real, runnable API examples (Python / curl / Node tabs) are the page's center of gravity — content itself carries the "product UI as decoration" role. The monochrome chrome exists to get out of the code's way. Secondary signature: model cards with cover image + black scrim + white text, the only place imagery appears.

## Key Components

Link/resource card (the workhorse):

```css
.card {
  position: relative;
  display: flex;
  height: 100%;
  border: 1px solid var(--brand-border);
  border-radius: 12px;
  background: var(--brand-card-bg);
  backdrop-filter: blur(10px);
  transition: border-color 0.2s, background-color 0.2s, box-shadow 0.2s;
}
.card:hover {
  border-color: var(--brand-primary);               /* black, not blue */
  box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);   /* neutral, no glow */
}
/* body: row, gap 12px, padding 20px 16px
   icon: 24px, color var(--brand-text-muted)
   title: 16px/500; desc: 14px muted; whole card = <a> */
```

Model card (image variant):

```css
.model-card {
  border: 1px solid var(--brand-border);
  border-radius: 12px;
  background: var(--brand-surface);
  overflow: hidden;
}
.model-card__media { aspect-ratio: 123 / 92; }
.model-card__image { object-fit: cover; transition: transform 0.5s; }
.model-card:hover .model-card__image { transform: scale(1.05); }
.model-card__overlay {
  position: absolute; inset: 0;
  display: flex; align-items: flex-end;
  background: linear-gradient(to top, rgba(10,10,10,0.78), rgba(10,10,10,0.28), transparent);
}
.model-card__name { color: #fff; font-weight: 600; font-size: 16px; }
```

Hero CTA (light-on-dark, the one inverted element):

```css
.hero-cta {
  padding: 10px 20px;
  border: 1px solid rgba(255,255,255,0.14);
  border-radius: 8px;
  background: rgba(255,255,255,0.96);
  color: #111111;
  font-size: 14px; font-weight: 500;
  transition: transform 0.2s ease, background-color 0.2s ease, border-color 0.2s ease;
}
.hero-cta:hover {
  background: #ffffff;
  border-color: rgba(255,255,255,0.3);
  transform: translateY(-1px);   /* -1px only; cards never lift */
}
```

Inline code (docs-standard, keep exact):

```css
code:not(pre code) {
  background: var(--brand-surface);
  border: 1px solid var(--brand-border);
  color: var(--brand-text);
}
```

Sidebar active item: `background: var(--brand-primary-soft)` (8% black tint), `border-radius: 14px`, text in `--brand-primary`.

## Acceptance Checklist
Walk every item before delivery (case-specific, stacked on top of the general `checklist.md`):

- [ ] Only "accent" is near-black `#111111` (light) / `#f5f5f5` (dark); zero chromatic accents in chrome
- [ ] Hover states = border to `--brand-primary` + neutral shadow; no translate on cards, no color shifts
- [ ] Only diffuse shadow is `0 10px 30px rgba(15,23,42,0.08)`; no colored glow anywhere
- [ ] backdrop-filter limited to the one `blur(10px)` on cards
- [ ] Radius only 8 / 12 / 14 / 999px
- [ ] Code examples are real and runnable; code blocks are the visual center, not decoration
- [ ] Icons are ≤24px functional glyphs in muted gray; no emoji, no icon squares
- [ ] Bold via real font weights only — no text-shadow synthetic bold (CJK distortion)
- [ ] Links underlined with 58%→72% color-mix alpha, offset 0.18em
- [ ] Semantic hues (method pills, status badges) only where the content carries them

## Anti-Examples
- **Blue-glow hover** (`rgba(10,122,255,.22)` shadows, `translateY(-3px)` lift): that is the kimi-code docs style, a different case — mixing the two is the most likely failure mode, since both are "Kimi docs"
- Any chromatic accent in chrome (brand blue links, gradient CTAs): breaks rule 1
- Emoji feature icons or 44px icon squares: banned by the general icons.md, doubly wrong here
- Synthetic-bold text-shadow on CJK: visibly smears glyphs, the site's own CSS comments call this out
- Multiple shadow tiers or glassmorphic stacks beyond the single card blur
