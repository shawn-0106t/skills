# Case: Claude Code — Engineering Rationalism

Source: distilled from Claude Code product CSS (327KB); calibrated 2026-07 against claude.com/product/design (claude-brand.shared.min.css, 2.6MB): accent color / radius / shadow / blur / functional colors updated from live measurement; the serif ban stands.
Temperament: **engineering pragmatism**. Material honesty, functional minimalism — the interface reads like a sheet of engineering drafting paper, not a glowing screen.

## Three Inviolable Rules
1. **Paper, not screen**: the base color is unbleached paper (`#faf9f5` / `#f5f4ed`) — not pure white, not glass.
2. **Alpha is functional**: transparency is mainly for "color fade-out" (hover, borders, disabled states). Only two measured `backdrop-filter` values are allowed: `blur(5px)` / `blur(10px)` (sticky headers / overlays); all other glassmorphism remains banned.
3. **Four radius states only**: `0px` (structural / full-bleed), `8px` (functional / inputs / small buttons), `12px` (cards / panels — the most-used tier on the live site), `9999px` (CTA / labels / pills). Fuzzy middle values (4/16/20/24px) are banned.

## When to Use
Tool interfaces, dashboards, technical product pages, report pages for technical readers. When the user says "reference claude.com / anthropic / Claude Code style", use this case directly. Default is the light base (`#faf9f5`); dark mode is optional.

## Colors
Warm gray ramp + terracotta accent family (primary `#d97757` + heroes deep `#c46849`). No gradients, no neon.

Light (default):

| Role | hex | Usage |
|---|---|---|
| bg-primary | `#faf9f5` | Paper white — unbleached, warm |
| bg-surface | `#f5f4ed` | Warmer paper |
| bg-elevated | `#ffffff` | Pure white, elevated surfaces only |
| text-primary | `#141413` | Near-black (same as Anthropic dark base) |
| text-secondary | `#5e5d59` | Warm gray, body / descriptions |
| text-tertiary | `#87867f` | Gray, placeholders / hints |
| text-muted | `#b0aea5` | Cloud gray, disabled / small text |
| accent | `#d97757` | Terracotta — primary accent |
| accent-heroes | `#c46849` | Deep accent for heroes (measured ×141 on live site) |
| accent-hover | `#c6613f` | Deep orange hover (product-side value) |
| accent-glow | `#d977574d` | 30% alpha, hover micro-glow only |
| border | `#e8e6dc` | Warm light-gray 1px line |
| border-hover | `#d1cfc5` | Interactive border, darker |
| error | `#b53333` | Functional red (measured ×285) |
| focus | `#2c84db` | Functional blue — focus ring + theme toggle active bg (measured ×497) |

Dark (optional):

| Role | hex | Usage |
|---|---|---|
| bg-primary | `#141413` | Anthropic slate-dark |
| bg-surface | `#1f1e1d` | Elevated surfaces |
| text-primary | `#faf9f5` | Ivory |
| text-secondary | `#b0aea5` | Cloud gray |
| border | `#faf9f51a` | 10% ivory fade border |
| border-hover | `#faf9f533` | 20% ivory |

## Type Scale
**Sans-serif only; serifs are banned without exception.**

- Prefer native system sans (zero download, instant render):
  `"Microsoft YaHei", "PingFang SC", -apple-system, "SF Pro Display", "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif`
- Web-font fallback (load only when system fonts unavailable):
  `"Inter", "Noto Sans SC", "Source Han Sans SC", Arial, sans-serif`
- Mono for code / data / terminal feel:
  `"JetBrains Mono", "SF Mono", ui-monospace, "Cascadia Code", "Fira Code", Consolas, monospace`
- CJK: YaHei (Win) / PingFang (macOS) / Noto Sans SC (web fallback); Latin: -apple-system / SF Pro / Inter
- All numerals must use tabular figures (tnum)

Note: mono for code/data/terminal feel is this product's engineering heritage — a case-level exception to the general mono default; outside this case, numerals use tabular-nums in the body font.

Scale (body tiers fixed px, display tiers fluid clamp):

| token | value | usage |
|---|---|---|
| micro | 10px | labels, badges |
| caption | 12px | timestamps, metadata |
| body-3 | 15px | dense UI text |
| body-2 | 17px | standard body |
| body-1 | clamp(19px, 18.714px + 0.089vw, 20px) | primary reading |
| body-lg-2 | clamp(20px, 19.143px + 0.268vw, 23px) | emphasized body |
| body-lg-1 | clamp(22px, 21.429px + 0.179vw, 24px) | lead paragraph |
| headline-6 | clamp(16px, 15.143px + 0.268vw, 19px) | |
| headline-5 | clamp(20px, 18.571px + 0.446vw, 25px) | |
| headline-4 | clamp(23px, 20.429px + 0.804vw, 32px) | |
| headline-3 | clamp(28px, 25.714px + 0.714vw, 36px) | |
| headline-2 | clamp(30px, 26px + 1.25vw, 44px) | |
| headline-1 | clamp(34px, 28.857px + 1.607vw, 52px) | |
| display-2 | clamp(36px, 28px + 2.5vw, 64px) | |
| display-1 | clamp(42px, 33.429px + 2.679vw, 72px) | |

Line-height: tighter 1.1 (display only) / snug 1.2 (headlines) / normal 1.3 (subtitles) / relaxed 1.5 (CJK body, generous) / loose 1.6 (long-form). CJK body line-height ≥ 1.6.

## Spacing
**Use px, not rem** — tool interfaces demand pixel precision.

Ramp: 2 / 4 / 6 / 8 / 12 / 16 / 20 / 24 / 32 / 40 / 48 / 56 / 64 / 80 / 96 / 128 / 200px.

- Inside components: tight (8px–24px)
- Between sections: jumps — `--section-spacing-sm: 64px` → `--section-spacing-main: 128px` → `--section-spacing-lg: 200px`; skip the 80/96 middle tiers by default
- Page-top padding: `--section-spacing-page-top: 240px` (generous, luxurious breathing room)

## Radius
Four states: `0px` (structural / full-bleed / brutal), `8px` (functional / inputs / small buttons), `12px` (cards / panels — most-used tier on the live site ×25), `9999px` (CTA / labels / chips / segmented controls).
Banned values: 2 / 4 / 6 / 16 / 20 / 24 / 32px for general UI elements.

## Shadows
Light is primarily "etched"; only three measured diffuse tiers are allowed.

Five permitted patterns:

```css
/* 1. Focus ring — outline replacement */
--shadow-focus: 0 0 0 2px var(--focus);

/* 2. Hover micro-glow */
--shadow-glow: 0 0 8px var(--accent-glow);

/* 3. Etched input inset */
--shadow-inset:
  inset 0 0 0 1px var(--border),
  inset 0 0 3px rgba(0, 0, 0, 0.04);

/* 4. Dark-mode inner-border simulation */
--shadow-inset-dark:
  inset 1px 1px 0 -.5px #333,
  inset -1px -1px 0 -.5px #262626,
  inset 1px 1px .5px -1px rgba(255,255,255,0.15),
  inset -1px -1px .5px -1px rgba(255,255,255,0.15),
  inset 0 0 3px rgba(255,255,255,0.08),
  inset 0 0 11px rgba(255,255,255,0.04);

/* 5. Measured diffuse — only these three tiers, for cards/overlays */
--shadow-diffuse-sm: 0 4px 24px #0000000d;        /* ×10 */
--shadow-diffuse-blue: 0 4px 20px #629eda29;      /* ×5 */
--shadow-diffuse-lg: 0 .75rem 1.5rem 0 #00000026; /* ×4 */
```

Banned: any diffuse drop shadow beyond the three measured tiers (`0 4px 12px rgba(0,0,0,0.15)`, `0 8px 32px rgba(0,0,0,0.2)`, `0 16px 48px rgba(0,0,0,0.25)`) and layered glass shadows (`0 8px 32px rgba(31, 38, 135, 0.37)` + `backdrop-filter: blur(16px)`).

## Layout Concept
Paper base + spacing jumps + one argument per page. Information hierarchy scannable in 3 seconds; each screen / page / slide carries exactly one core argument. Decoration either encodes information or gets deleted.

## Signature Element
**Material honesty itself**: paper base, etched inputs, four radius states — the three together ARE the style. No extra decorative graphics needed; restrained order is the signature.

## Key Components

Buttons (primary pill orange / secondary pill outline / tertiary square text-only):

```css
.btn-primary {
  background: var(--accent);
  color: #fff;
  border-radius: var(--radius-pill);   /* 9999px */
  padding: 10px 24px;
  font-family: var(--font-sans);
  font-weight: 500;
  font-size: var(--text-body-2);      /* 17px */
  border: none;
  transition: transform 0.15s ease, background 0.15s ease;
}
.btn-primary:hover {
  background: var(--accent-hover);
  transform: scale(0.98);
}

.btn-secondary {
  background: transparent;
  color: var(--text-primary);
  border: 1px solid var(--border);
  border-radius: var(--radius-pill);
  padding: 10px 24px;
  font-family: var(--font-sans);
  font-weight: 500;
  font-size: var(--text-body-2);
}
.btn-secondary:hover {
  background: var(--bg-surface);
  border-color: var(--border-hover);
}

.btn-tertiary {
  background: transparent;
  color: var(--text-secondary);
  border: none;
  border-radius: var(--radius-sharp);  /* 0px */
  padding: 0;
  font-family: var(--font-sans);
  font-weight: 400;
  font-size: var(--text-body-2);
}
.btn-tertiary:hover {
  color: var(--text-primary);
}
```

Input (etched inset):

```css
.input-field {
  background: var(--bg-surface);       /* #f5f4ed in light mode */
  border: none;
  border-radius: var(--radius-small);  /* 8px */
  padding: 12px 16px;
  font-family: var(--font-sans);
  font-size: var(--text-body-2);       /* 17px */
  color: var(--text-primary);
  box-shadow:
    inset 0 0 0 1px var(--border),
    inset 0 0 3px rgba(0, 0, 0, 0.04);
  transition: background 0.15s ease, box-shadow 0.15s ease;
}

.input-field::placeholder {
  color: var(--text-tertiary);         /* #87867f */
}

.input-field:focus {
  background: var(--bg-elevated);        /* #ffffff */
  box-shadow:
    inset 0 0 0 1px var(--border-hover),
    inset 0 0 3px rgba(0, 0, 0, 0.06),
    0 0 0 2px rgba(44, 132, 219, 0.2); /* Focus ring */
  outline: none;
}
```

Card (minimal, optional; no outer shadow):

```css
.card {
  background: var(--bg-elevated);        /* #ffffff */
  border-radius: var(--radius-small);  /* 8px */
  padding: var(--sp-24);
  box-shadow:
    inset 0 0 0 1px var(--border);     /* 1px warm-gray line */
}

.card-sharp {
  background: var(--bg-elevated);
  border-radius: var(--radius-sharp);  /* 0px */
  padding: var(--sp-24);
  border: 1px solid var(--border);
}
```

Segmented control (pill container + pill items):

```css
.segmented {
  display: flex;
  background: var(--bg-surface);
  border-radius: var(--radius-pill);   /* 9999px outer */
  padding: var(--sp-4);
  gap: var(--sp-2);
}
.segmented-item {
  flex: 1;
  text-align: center;
  padding: var(--sp-8) var(--sp-16);
  border-radius: var(--radius-pill);   /* 9999px inner */
  font-family: var(--font-sans);
  font-size: var(--text-body-3);       /* 15px */
  font-weight: 500;
  color: var(--text-secondary);
  background: transparent;
  border: none;
  cursor: pointer;
}
.segmented-item.active {
  background: var(--bg-elevated);
  color: var(--text-primary);
  box-shadow: inset 0 0 0 1px var(--border);
}
```

## Deck Rules
Light base (`#faf9f5`) is the default for all decks:

- Headline: `#141413`, 32–48pt, weight 600, YaHei/PingFang
- Subtitle: `#5e5d59`, 20–24pt, weight 400
- Body: `#5e5d59`, 16–18pt, weight 400, line-height 1.6, max-width 60ch
- Caption: `#87867f`, 12–14pt, weight 400
- Data numerals: `#141413`, 48–96pt, weight 700, JetBrains Mono, tnum
- Accent data: `#d97757`, 48–96pt, weight 700, JetBrains Mono, tnum
- Borders: 1px `#e8e6dc`

Single-page structure (one argument per page): 240px top whitespace → headline (32–48pt, left-aligned, ≤2 lines) → 48px gap → body/evidence (16–18pt, left-aligned, ≤60ch) or data point (72pt numeral + 14pt label, left-aligned) → 48px gap → CTA/conclusion (pill button or square text link).

Image rules: full-bleed images 0px radius, no border no shadow; screenshots 8px radius + 1px `#e8e6dc` border (light base) or borderless; logos only 0px or 9999px, never 4/16px; charts 1.5pt lines, 10% fill alpha, gridlines `#e8e6dc`.

Deck bans: gradient backgrounds, gradient text, diffuse shadows beyond the three measured tiers, 4/16px-radius rectangles, container glassmorphism/blur/transparency, more than 3 data points per page, SmartArt, bento grids, decorative icons.

## Acceptance Checklist
Walk every item before delivery (case-specific, stacked on top of the general `checklist.md`):

- [ ] Base is `#faf9f5` (light) or `#141413` (dark), no gradients
- [ ] Accent limited to `#d97757` (primary) / `#c46849` (heroes deep), no third accent
- [ ] All sans-serif (YaHei/PingFang/-apple-system/Roboto/Inter), zero serifs
- [ ] Radius only 0px / 8px / 12px / 9999px — no 4/16/20/24px
- [ ] Shadows only: outline ring, micro-glow, etched inset, or the three measured diffuse tiers (`0 4px 24px #0000000d` / `0 4px 20px #629eda29` / `0 .75rem 1.5rem 0 #00000026`)
- [ ] backdrop-filter only the two measured tiers blur(5px) / blur(10px) (sticky/overlay); no other glassmorphism
- [ ] Alpha transparency ≤50% and only serving functional hierarchy (hover, borders, disabled)
- [ ] No gradients (except a 37% black-to-transparent scrim at image bottoms)
- [ ] Information hierarchy scannable in 3 seconds
- [ ] One core argument per screen / page / slide
- [ ] CJK body line-height ≥ 1.6
- [ ] Numerals in tabular figures (tnum) + mono font

## Anti-Examples
- Glassmorphism beyond the two measured blur tiers: the most dated "AI-generated" signal
- Diffuse-shadow cards beyond the three measured tiers: material dishonesty, instant failure
- 4px/16px/20px/24px radii: fuzzy middle values, conflict with the four-state system
- Serif display headlines: same palette but reads as "retro editorial", not this product style (serif ban stands)
- A third accent color, gradient text/backgrounds, bento grids, decorative icons
