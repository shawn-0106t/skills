# Case: Claude Code — Engineering Rationalism

Source: distilled from Claude Code product CSS (327KB); calibrated 2026-07 against claude.com/product/design (claude-brand.shared.min.css, 2.6MB). Re-verified 2026-08-26 against live claude.com/product/claude-code (Next.js chunks) and /product/design (brand CSS byte-identical to the 2026-07 snapshot). The serif ban stands.
Temperament: **engineering pragmatism**. Material honesty, functional minimalism — the interface reads like a sheet of engineering drafting paper, not a glowing screen.

**Claim labels.** Every value below is either *measured* (verified against the live web artifacts, counts included) or a *case stance* (a deliberate simplification or deviation — the live site does it differently, we do it this way on purpose). Do not present stances as measurements.

## Three Inviolable Rules
1. **Paper, not screen**: the base color is unbleached paper (`#faf9f5` / `#f5f4ed`) — not pure white, not glass. (Measured: `--swatch--gray-050` / `--swatch--gray-100`.)
2. **Alpha is functional**: transparency is mainly for "color fade-out" (hover, borders, disabled states). Only two measured `backdrop-filter` values exist on the live site: `blur(5px)` / `blur(10px)` (×2 each, sticky headers / overlays); all other glassmorphism remains banned.
3. **Four radius states only** *(case stance)*: `0px` (structural / full-bleed), `8px` (functional / inputs / buttons), `12px` (cards / panels), `9999px` (CTA / labels / pills). Fuzzy middle values (4/16/20/24px) are banned — inside this case.

## When to Use
Tool interfaces, dashboards, technical product pages, report pages for technical readers. When the user says "reference claude.com / anthropic / Claude Code style", use this case directly. Default is the light base (`#faf9f5`); dark mode is optional.

## Colors
Warm gray ramp + terracotta accent family. No gradients, no neon. All hex values measured from the live brand CSS (`--swatch--*` tokens) and product chunks.

Light (default):

| Role | hex | Usage |
|---|---|---|
| bg-primary | `#faf9f5` | Paper white — `--swatch--gray-050` |
| bg-surface | `#f5f4ed` | Warmer paper — `--swatch--gray-100` |
| bg-elevated | `#ffffff` | Pure white, elevated surfaces only |
| text-primary | `#141413` | Near-black — `--swatch--gray-950` |
| text-secondary | `#5e5d59` | Warm gray, body / descriptions — `--swatch--gray-600` |
| text-tertiary | `#87867f` | Gray, placeholders / hints — `--swatch--gray-500` |
| text-muted | `#b0aea5` | Cloud gray, disabled / small text — `--swatch--gray-400` |
| accent | `#d97757` | Terracotta — product-side `--color-clay` |
| accent-heroes | `#c46849` | `--_theme---heroes-accent` (measured ×141); also product-side `--color-clay-dark` — **the measured focus-outline color** |
| accent-hover | `#c6613f` | Product-side `--color-clay-hover` |
| accent-interactive | `#c96442` | Brand-side clay-button fill + brand focus outline — `--swatch--clay-interactive` |
| border | `#e8e6dc` | Warm light-gray 1px line — `--swatch--gray-200` |
| border-hover | `#d1cfc5` | Interactive border, darker — `--swatch--gray-300` |
| error | `#b53333` | Functional red — `--_theme---error-text` (measured ×285) |
| functional-blue | `#2c84db` | Theme-toggle active background only (measured ×497). **Not a focus color** — the live site never uses it in outlines or rings |

Dark (optional):

| Role | hex | Usage |
|---|---|---|
| bg-primary | `#141413` | Anthropic slate-dark |
| bg-surface | `#1f1e1d` | Elevated surfaces — `--swatch--gray-850` |
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
- All numerals must use tabular figures (tnum) *(case stance)* — the live product actually declares `"pnum" on, "lnum" on` (proportional lining figures); tnum is this case's choice for data alignment

Note: mono for code/data/terminal feel is this product's engineering heritage — a case-level exception to the general mono default; outside this case, numerals use tabular-nums in the body font. The exception covers code, raw identifiers, and data only: labels, micro-labels, and UI text default to sans even inside this case.

Scale (all 15 tokens measured; body tiers are fixed on the live site, display tiers fluid). The vw mid-coefficients below are linear px approximations of the live rem-based interpolation — endpoints are exact:

| token | value | usage |
|---|---|---|
| micro | 10px | labels, badges |
| caption | 12px | timestamps, metadata |
| body-3 | 15px | dense UI text |
| body-2 | 17px | standard body; also button text |
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

Exception for text-heavy pages (reports, long-form, landing pages): font sizes may use rem so user browser-zoom settings are respected; borders, 1px hairlines, and icon grids stay in px (they don't need to scale). This case's own tool/dashboard surfaces keep px throughout.

Ramp: 2 / 4 / 6 / 8 / 12 / 16 / 20 / 24 / 32 / 40 / 48 / 56 / 64 / 80 / 96 / 128 / 200px.

- Inside components: tight (8px–24px)
- Between sections — measured live values are fluid, viewport-interpolated clamps:

| tier | live clamp (px equivalent) | fixed constant for desktop artboards |
|---|---|---|
| section-sm | 64 → 96 | 64px |
| section-main | 96 → 128 | 128px |
| section-lg | 128 → 200 | 200px |
| page-top | 192 → 240 | 240px (generous, luxurious breathing room) |

## Radius
Four states *(case stance)*: `0px` (structural / full-bleed / brutal), `8px` (functional / inputs / buttons), `12px` (cards / panels), `9999px` (CTA / labels / chips / segmented controls).

Measured context: the live brand ramp is six tiers — 4px / 8px / 12px / 16px / fluid 16–24px and 16–32px / `100vw` pill — and 12px is indeed the most-used tier (×77 in the brand CSS; 8px ×50, 16px ×47). The product side additionally ships `--br-2/4/6/16/24/32/48/64`. The four-state system is a deliberate simplification: it produces the same read with fewer decisions. Banned inside this case: 2 / 4 / 6 / 16 / 20 / 24 / 32px for general UI elements.

## Shadows
Light is primarily "etched"; only three measured diffuse tiers exist on the live brand CSS.

Four permitted patterns:

```css
/* 1. Focus — measured: the live site uses outline, not a shadow ring */
:focus-visible {
  outline: 2px solid #c46849;  /* product pages: --color-focus → --color-clay-dark */
  outline-offset: 4px;
}
/* brand pages: outline-color: #c96442 (--swatch--clay-interactive), offset 2px */

/* 2. Etched input inset (product-CSS distillation — not present in the web artifacts) */
--shadow-inset:
  inset 0 0 0 1px var(--border),
  inset 0 0 3px rgba(0, 0, 0, 0.04);

/* 3. Dark-mode inner-border simulation (product-CSS distillation) */
--shadow-inset-dark:
  inset 1px 1px 0 -.5px #333,
  inset -1px -1px 0 -.5px #262626,
  inset 1px 1px .5px -1px rgba(255,255,255,0.15),
  inset -1px -1px .5px -1px rgba(255,255,255,0.15),
  inset 0 0 3px rgba(255,255,255,0.08),
  inset 0 0 11px rgba(255,255,255,0.04);

/* 4. Measured diffuse — only these three tiers, for cards/overlays */
--shadow-diffuse-sm: 0 4px 24px #0000000d;        /* ×10 */
--shadow-diffuse-blue: 0 4px 20px #629eda29;      /* ×5 */
--shadow-diffuse-lg: 0 .75rem 1.5rem 0 #00000026; /* ×4 (source: var-based, resolves to this) */
```

Banned: any diffuse drop shadow beyond the three measured tiers (`0 4px 12px rgba(0,0,0,0.15)`, `0 8px 32px rgba(0,0,0,0.2)`, `0 16px 48px rgba(0,0,0,0.25)`), layered glass shadows (`0 8px 32px rgba(31, 38, 135, 0.37)` + `backdrop-filter: blur(16px)`), and accent-colored glow rings (a `#d97757`-alpha "micro-glow" does **not** exist on the live site).

## Layout Concept
Paper base + spacing jumps + one argument per page. Information hierarchy scannable in 3 seconds; each screen / page / slide carries exactly one core argument. Decoration either encodes information or gets deleted.

## Signature Element
**Material honesty itself**: paper base, etched inputs, four radius states — the three together ARE the style. No extra decorative graphics needed; restrained order is the signature.

## Key Components

Buttons — measured from the live product Button module (`size-large`; medium = 36px / `8px 12px`, small = 28px / `4px 12px`):

```css
.btn-primary {
  background: #d97757;               /* --color-clay */
  color: #fff;
  border: none;
  border-radius: 8px;                /* --br-8 — the live button is NOT a pill */
  height: 40px;
  padding: 8px 16px;                 /* --sp-8 --sp-16; icon variants pad one side 24px */
  font-family: var(--font-sans);
  font-size: 17px;                   /* text-body-2 */
  transition: color .1s ease-in-out, background-color .2s ease-in-out,
              border-color .2s ease-in-out, box-shadow .2s ease-in-out;
}
.btn-primary:hover {
  box-shadow: 0 0 0 2px #d97757;     /* same-color expansion ring — no transform */
}
.btn-primary:focus-visible {
  outline: 2px solid #c46849;        /* --color-focus */
  outline-offset: 4px;
}
.btn-primary:disabled {
  opacity: .5;
  cursor: not-allowed;
}

.btn-secondary {
  background: transparent;
  color: var(--text-primary);
  border: none;
  border-radius: 8px;
  height: 40px;
  padding: 8px 16px;
  font-family: var(--font-sans);
  font-size: 17px;
  box-shadow: 0 0 0 1px var(--border-hover);   /* 1px ring, measured */
}
.btn-secondary:hover {
  box-shadow: 0 0 0 1px var(--bg-primary),     /* ring expands to 2px — measured */
              0 0 0 2px var(--border-hover);
}

.btn-tertiary {                     /* text-only, square — case simplification */
  background: transparent;
  color: var(--text-secondary);
  border: none;
  border-radius: 0px;
  padding: 0;
  font-family: var(--font-sans);
  font-size: 17px;
}
.btn-tertiary:hover {
  color: var(--text-primary);
}
```

Brand-side measured differences (claude.com/product/* marketing pages): button min-height 2.5rem (40px), font-weight 400 (not 500), and the clay button fills `#c96442` (`--swatch--clay-interactive`), not `#d97757`. Product-side hover darkening uses `#c6613f` (`--color-clay-hover`).

**Contrast note on the measured primary button.** 17px white on `#d97757` computes to **3.12:1** — below WCAG AA's 4.5:1 for non-large text. These hex values are faithful measurements of the live site; they are not automatically safe to ship. When using this button, pick one:

- Bump to ≥19px bold (qualifies as large text → 3:1 required, passes), or
- Darken the fill one step to `#c6613f` (accent-hover, 4.05:1) with ≥19px bold text, or
- For 15–17px text, darken further (`#b8552f` computes to 4.80:1 vs white) or use a neutral `.btn-secondary`, or
- Declare it a conscious brand exception in the design plan.

Never put small (≤17px) white text on `#d97757` and call it AA.

Input (etched inset — product-CSS distillation):

```css
.input-field {
  background: var(--bg-surface);       /* #f5f4ed in light mode */
  border: none;
  border-radius: 8px;
  padding: 12px 16px;
  font-family: var(--font-sans);
  font-size: 17px;
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
    inset 0 0 3px rgba(0, 0, 0, 0.06);
  outline: 2px solid #c46849;            /* measured focus treatment */
  outline-offset: 2px;
}
```

Card (minimal, optional; no outer shadow):

```css
.card {
  background: var(--bg-elevated);        /* #ffffff */
  border-radius: 8px;
  padding: 24px;
  box-shadow:
    inset 0 0 0 1px var(--border);     /* 1px warm-gray line */
}

.card-sharp {
  background: var(--bg-elevated);
  border-radius: 0px;
  padding: 24px;
  border: 1px solid var(--border);
}
```

Segmented control (pill container + pill items; the `inset 0 0 0 1px` active-state ring is measured ×2 in the brand CSS):

```css
.segmented {
  display: flex;
  background: var(--bg-surface);
  border-radius: 9999px;
  padding: 4px;
  gap: 2px;
}
.segmented-item {
  flex: 1;
  text-align: center;
  padding: 8px 16px;
  border-radius: 9999px;
  font-family: var(--font-sans);
  font-size: 15px;                   /* text-body-3 */
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

Single-page structure (one argument per page): 240px top whitespace → headline (32–48pt, left-aligned, ≤2 lines) → 48px gap → body/evidence (16–18pt, left-aligned, ≤60ch) or data point (72pt numeral + 14pt label, left-aligned) → 48px gap → CTA/conclusion (button or square text link).

Image rules: full-bleed images 0px radius, no border no shadow; screenshots 8px radius + 1px `#e8e6dc` border (light base) or borderless; logos only 0px or 9999px, never 4/16px; charts 1.5pt lines, 10% fill alpha, gridlines `#e8e6dc`.

Deck bans: gradient backgrounds, gradient text, diffuse shadows beyond the three measured tiers, 4/16px-radius rectangles, container glassmorphism/blur/transparency, more than 3 data points per page, SmartArt, bento grids, decorative icons.

## Acceptance Checklist
Walk every item before delivery (case-specific, stacked on top of the general `checklist.md`):

- [ ] Base is `#faf9f5` (light) or `#141413` (dark), no gradients
- [ ] Accent limited to `#d97757` (primary) / `#c46849` (heroes deep + focus) / `#c96442` (brand-side interactive), no chromatic accent beyond the clay family
- [ ] All sans-serif (YaHei/PingFang/-apple-system/Roboto/Inter), zero serifs
- [ ] Radius only 0px / 8px / 12px / 9999px — no 4/16/20/24px (case stance)
- [ ] Shadows only: etched inset (product-side pattern) or the three measured diffuse tiers (`0 4px 24px #0000000d` / `0 4px 20px #629eda29` / `0 .75rem 1.5rem 0 #00000026`); no accent-colored glow
- [ ] Focus: `outline: 2px solid #c46849`, offset 4px (measured) — not a blue shadow ring
- [ ] backdrop-filter only the two measured tiers blur(5px) / blur(10px) (sticky/overlay); no other glassmorphism
- [ ] Alpha transparency ≤50% and only serving functional hierarchy (hover, borders, disabled)
- [ ] No gradients (except a 37% black-to-transparent scrim at image bottoms)
- [ ] Information hierarchy scannable in 3 seconds
- [ ] One core argument per screen / page / slide
- [ ] CJK body line-height ≥ 1.6
- [ ] Numerals in tabular figures (tnum) + mono font (case stance; live uses pnum)

## Anti-Examples
- Glassmorphism beyond the two measured blur tiers: the most dated "AI-generated" signal
- Diffuse-shadow cards beyond the three measured tiers: material dishonesty, instant failure
- 4px/16px/20px/24px radii: fuzzy middle values, conflict with the four-state system
- Serif display headlines: same palette but reads as "retro editorial", not this product style (serif ban stands)
- A third accent color, gradient text/backgrounds, bento grids, decorative icons
