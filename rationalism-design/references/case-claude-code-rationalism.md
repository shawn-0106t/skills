# Case: Claude Code — Engineering Rationalism

Source: distilled from Claude Code product CSS (327KB); calibrated 2026-07. Re-verified 2026-10-14 against live claude.com/product/claude-code — the page no longer references claude-brand.shared.min.css; evidence is now 5 Next.js CSS chunks (411,932 B total; md5-10: 6977a2552d / 75228f833e / 715db7abaa / 240946d138 / 42a1a87d90) plus Playwright 1.64 / Edge 155 computed-style probes and DOM scans. 2026-10 revisions: token annotations renamed site-wide (the site dropped its `--swatch--*` / `--_theme---*` naming), primary CTA fill, interactive accent, backdrop-filter, diffuse shadow tiers, figure strategy. The serif ban stands (exempted from verification by owner request).
Temperament: **engineering pragmatism**. Material honesty, functional minimalism — the interface reads like a sheet of engineering drafting paper, not a glowing screen.

**Claim labels.** Every value below is either *measured* (verified against the live web artifacts) or a *case stance* (a deliberate simplification or deviation — the live site does it differently, we do it this way on purpose). Do not present stances as measurements. **Counts are version-locked**: any ×N occurrence count is only valid inside the CSS version it was counted in — cite the md5 above when citing a count; the durable claims are the values and their relative orders.

## Three Inviolable Rules
1. **Paper, not screen**: the base color is unbleached paper (`#faf9f5` / `#f5f4ed`) — not pure white, not glass. (Measured 2026-10: body computed background rgb(250,249,245) ✓; tokens now `--color-gray-050` / `--color-gray-100` — the former `--swatch--gray-*` names are retired.)
2. **Alpha is functional**: transparency is only for color fade-out (hover, borders, disabled states). Measured 2026-10: backdrop-filter on the live page is **zero** — 0 definitions in CSS, 0 elements in DOM; the fixed header uses no blur. Glassmorphism is banned without exception.
3. **Four radius states only** *(case stance)*: `0px` (structural / full-bleed), `8px` (functional / inputs / buttons — rectangular primary CTA buttons measured here), `12px` (cards / panels), `9999px` (pill CTA / labels / chips / segmented controls). Fuzzy middle values (4/16/20/24px) are banned — inside this case.

## When to Use
Tool interfaces, dashboards, technical product pages, report pages for technical readers. When the user says "reference claude.com / anthropic / Claude Code style", use this case directly. Default is the light base (`#faf9f5`); dark mode is optional.

## Colors
Warm gray ramp + terracotta accent family. No gradients, no neon. Hex values re-measured 2026-10: the site renamed its token system (`--swatch--*` → `--color-*`, `--_theme---*` → `--theme-*` / `--hs-*`); values unchanged unless noted.

Light (default):

| Role | hex | Usage |
|---|---|---|
| bg-primary | `#faf9f5` | Paper white — `--color-gray-050` / `--theme-background-primary` (body computed ✓) |
| bg-surface | `#f5f4ed` | Warmer paper — `--color-gray-100` / `--theme-background-secondary` |
| bg-elevated | `#ffffff` | Pure white, elevated surfaces only |
| text-primary | `#141413` | Near-black — `--color-gray-950`; **also the measured primary-CTA fill** (ink button, 2026-10) |
| text-secondary | `#5e5d59` | Warm gray, body / descriptions — `--color-gray-600` |
| text-tertiary | `#87867f` | Gray, placeholders / hints — `--color-gray-500` |
| text-muted | `#b0aea5` | Cloud gray, disabled / small text — `--color-gray-400` |
| accent | `#d97757` | Terracotta — `--color-clay` / `--theme-accent-clay-primary`. Spend as text, hairlines, small marks, tinted backgrounds — the 2026-10 marketing page fills **no button** with it |
| accent-deep | `#c46849` | `--color-clay-dark` = `--color-focus` — the measured focus-outline color (former `--_theme---heroes-accent` token deleted) |
| accent-hover | `#c6613f` | `--color-clay-hover`; also resolves the interactive/button tokens (`--theme-accent-clay-interactive`, `--theme-button-clay-bg/-border`) |
| border | `#e8e6dc` | Warm light-gray 1px line — `--color-gray-200` |
| border-hover | `#d1cfc5` | Interactive border, darker — `--color-gray-300` |
| error | `#b53333` | Functional red — `--hs-error` (former `--_theme---error-text`) |
| functional-blue | `#2c84db` | Theme-toggle / switch on-state only — `--color-switch-on`. **Not a focus color** — no outline/ring on the page resolves to it (the embedded AppShell demo's focus outline uses `--shell-accent-blue` = `#1f6fe5`) |

Historical: `#c96442` (former `--swatch--clay-interactive`, "brand-side interactive") was **deleted from the live CSS** by 2026-10 (0 occurrences); the interactive role now resolves to `#c6613f`. Treat `#c96442` as a case stance if you want a four-step clay ramp — not as a live value.

Dark (optional):

| Role | hex | Usage |
|---|---|---|
| bg-primary | `#141413` | Anthropic slate-dark |
| bg-surface | `#1f1e1d` | Elevated surfaces — `--color-gray-850` |
| text-primary | `#faf9f5` | Ivory |
| text-secondary | `#b0aea5` | Cloud gray |
| border | `#faf9f51a` | 10% ivory fade border — *unverifiable on the 2026-10 marketing page* (dark tokens absent from its CSS, possibly color-mix-derived now); re-verify before citing |
| border-hover | `#faf9f533` | 20% ivory — same caveat |

## Type Scale
**Sans-serif only; serifs are banned without exception.**

- Prefer native system sans (zero download, instant render):
  `"Microsoft YaHei", "PingFang SC", -apple-system, "SF Pro Display", "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif`
- Web-font fallback (load only when system fonts unavailable):
  `"Inter", "Noto Sans SC", "Source Han Sans SC", Arial, sans-serif`
- Mono for code / data / terminal feel:
  `"JetBrains Mono", "SF Mono", ui-monospace, "Cascadia Code", "Fira Code", Consolas, monospace`
- CJK: YaHei (Win) / PingFang (macOS) / Noto Sans SC (web fallback); Latin: -apple-system / SF Pro / Inter
- Figure strategy: numerals use tabular figures (tnum) — *measured 2026-10 the live site itself declares `tabular-nums`* (3 rule sites; the former `pnum lnum` declaration is gone), so this is no longer a case-vs-live deviation. Mono stays reserved for code, raw identifiers, and data; labels and UI text stay sans even inside this case.

Scale — the 11 fluid tokens re-verified 2026-10 **exact, endpoints and linear coefficients**. The vw mid-coefficients below are linear px approximations of the live rem-based interpolation — endpoints are exact. Fixed body tiers were restructured on the live site (see table):

| token | value | usage |
|---|---|---|
| micro | 10px | labels, badges (present ×1 ✓) |
| caption | 12.5px | timestamps, metadata (live tuned 12px → 12.5px, ×8) |
| body-3 | 15px | dense UI text — computed body is 15px / 1.5 |
| body-2 | 17px | standard body; also button text — live merges these two tiers into one fluid `clamp(15px, .1878vw + 14.2958px, 17px)` (×8); both endpoints measured real (large buttons 17px ✓) |
| body-1 | clamp(19px, 18.714px + 0.089vw, 20px) | primary reading |
| body-lg-2 | clamp(20px, 19.143px + 0.268vw, 23px) | emphasized body |
| body-lg-1 | clamp(22px, 21.429px + 0.179vw, 24px) | lead paragraph |
| headline-6 | clamp(16px, 15.143px + 0.268vw, 19px) | |
| headline-5 | clamp(20px, 18.571px + 0.446vw, 25px) | |
| headline-4 | clamp(23px, 20.429px + 0.804vw, 32px) | computed h3 = 32px (top end) ✓ |
| headline-3 | clamp(28px, 25.714px + 0.714vw, 36px) | |
| headline-2 | clamp(30px, 26px + 1.25vw, 44px) | |
| headline-1 | clamp(34px, 28.857px + 1.607vw, 52px) | computed h2 = 52px (top end) ✓ |
| display-2 | clamp(36px, 28px + 2.5vw, 64px) | computed h1 = 64px ✓ |
| display-1 | clamp(42px, 33.429px + 2.679vw, 72px) | |

Line-height: tighter 1.1 (display only) / snug 1.2 (headlines) / normal 1.3 (subtitles) / relaxed 1.5 (CJK body, generous) / loose 1.6 (long-form). CJK body line-height ≥ 1.6. Measured 2026-10: h1 70.4/64 = 1.1, h2 62.4/52 = 1.2, body 22.5/15 = 1.5 — all three tiers ✓.

## Spacing
**Use px, not rem** — tool interfaces demand pixel precision.

Exception for text-heavy pages (reports, long-form, landing pages): font sizes may use rem so user browser-zoom settings are respected; borders, 1px hairlines, and icon grids stay in px (they don't need to scale). This case's own tool/dashboard surfaces keep px throughout.

Ramp: 2 / 4 / 6 / 8 / 12 / 16 / 20 / 24 / 32 / 40 / 48 / 56 / 64 / 80 / 96 / 128 / 200px — all 17 verified as `--sp-2 … --sp-200` ✓ (2026-10).

- Inside components: tight (8px–24px) — measured paddings 8 / 16 / 24 ✓
- Between sections — measured live values are fluid, viewport-interpolated clamps:

| tier | live clamp (px equivalent) | fixed constant for desktop artboards |
|---|---|---|
| section-sm | 64 → 96 (computed 96) | 64px |
| section-main | 96 → 128 (computed 128 across sections) | 128px |
| page-top | 192 → 240 (computed 192) | 240px (generous, luxurious breathing room) |

(2026-10: the former section-lg 128→200 tier no longer exists in the live CSS — dropped from measured claims.)

## Radius
Four states *(case stance)*: `0px` (structural / full-bleed / brutal), `8px` (functional / inputs / buttons — rectangular primary CTA buttons measured here), `12px` (cards / panels), `9999px` (pill CTA / labels / chips / segmented controls).

Measured context (2026-10): the retired 2026-07 brand CSS counted 12px ×77 / 8px ×50 / 16px ×47 — version-locked, not comparable. Current product chunks: `var(--br-12)` ×34 > `var(--br-8)` ×29 > `var(--br-16)` ×24 (most-used order preserved); raw `6px` also appears ×14 (shell/demo internals), and DOM-computed radii are led by 4px / 6px from the embedded terminal demo. All ten `--br-2/4/6/8/12/16/24/32/48/64` tokens are defined ✓; pill (9999px / 100vw) ×3. The four-state system remains a deliberate simplification: it produces the same read with fewer decisions. Banned inside this case: 2 / 4 / 6 / 16 / 20 / 24 / 32px for general UI elements.

## Shadows
Light is primarily "etched". Measured diffuse tiers as of 2026-10 — the 2026-07 trio (`0 4px 24px #0000000d` ×10 / `0 4px 20px #629eda29` / `0 .75rem 1.5rem 0 #00000026`) is retired: the first survives only as ×1 residue, the latter two are gone.

Four permitted patterns:

```css
/* 1. Focus — measured 2026-10: outline, not a shadow ring */
:focus-visible {
  outline: 2px solid var(--color-focus);  /* = #c46849 ✓ */
  outline-offset: 4px;  /* Button module. Site-wide offset-2 rules outnumber it (×20 vs ×10);
                           DOM tab-walk: 2px on 9/12 stops, 4px exactly on the Button-module CTAs (3/12) */
}
/* brand pages (older distillation): outline-color: #c96442, offset 2px — token deleted 2026-10 */

/* 2. Etched input inset (product-CSS distillation — no rendered instance on the marketing page) */
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

/* 4. Measured diffuse — 2026-10 token tiers (definitions + usage counts now in tokens_report.json shadow_tokens), for cards/overlays */
--shadow-sm: 0 2px 8px  #0000000a;   /* var(--shadow-sm) — defined but 0 usage in current chunks */
--shadow-md: 0 4px 20px #0000000a;   /* var(--shadow-md), ×7 */
--shadow-lg: 0 4px 16px #0000001a;   /* var(--shadow-lg), ×1 */
/* embedded app shells: menu var(--shell-menu-shadow) = 0 12px 40px #00000026, ×3 ·
   window var(--shell-window-shadow) = 0 0 0 1px #0a0a0a0a, 0 8px 24px #00000006, 0 32px 80px #0000000a, ×1 */
```

Banned: any diffuse drop shadow outside the tiers above (e.g. `0 8px 32px rgba(0,0,0,0.2)`, `0 16px 48px rgba(0,0,0,0.25)`), layered glass shadows plus any backdrop-filter (live usage is zero), and accent-colored glow rings (a `#d97757`-alpha "micro-glow" does **not** exist on the live site). Gradients: the 16 linear-gradients on the 2026-10 page are all functional masks/scrims except one clay gradient inside the embedded CodePanel demo — the no-gradient rule otherwise holds.

## Layout Concept
Paper base + spacing jumps + one argument per page. Information hierarchy scannable in 3 seconds; each screen / page / slide carries exactly one core argument. Decoration either encodes information or gets deleted.

## Signature Element
**Material honesty itself**: paper base, etched inputs, four radius states — the three together ARE the style. No extra decorative graphics needed; restrained order is the signature.

## Key Components

Buttons — geometry re-confirmed 2026-10 (large 40px / `8px 16px`, medium 36px, icon variants pad one side 24px, radius 8px non-pill, large text 17px / weight 400); the **primary fill moved from clay to ink**:

```css
.btn-primary {
  background: #141413;               /* measured 2026-10: primary CTA is ink — clay fills no button on the page */
  color: #faf9f5;
  border: none;
  border-radius: 8px;                /* --br-8 — the live button is NOT a pill */
  height: 40px;                      /* medium = 36px; nav/small variant 15px / 500 */
  padding: 8px 16px;                 /* icon variants pad one side 24px (measured ✓) */
  font-family: var(--font-sans);
  font-size: 17px;                   /* text-body-2; large buttons measured weight 400 */
  transition: color .1s ease-in-out, background-color .2s ease-in-out,
              border-color .2s ease-in-out, box-shadow .2s ease-in-out;
}
.btn-primary:hover {
  box-shadow: 0 0 0 2px #141413;     /* same-color expansion ring — no transform (mechanism ×15 ✓) */
}
.btn-primary:focus-visible {
  outline: 2px solid #c46849;        /* --color-focus ✓ */
  outline-offset: 4px;               /* Button module; site-wide 2px dominates */
}
.btn-primary:disabled {
  opacity: .5;                       /* case stance — no disabled instance on the 2026-10 page to verify */
  cursor: not-allowed;
}

/* brand clay variant — --theme-button-clay-*: fill resolves to #c6613f (--color-clay-hover), NOT #d97757;
   its font-weight token is 500. Defined on the live site but unused on the 2026-10 marketing page. */
```

.btn-secondary — the two-layer ring mechanism matched this case's spec: resting state **verified via computed style** (`0 0 0 0 <bg>, 0 0 0 1px <border>` on rendered buttons), hover expansion **verified in static CSS** (`0 0 0 1px <bg>, 0 0 0 2px <border>` ×1 — no hover probe captured on the page):

```css
.btn-secondary {
  background: transparent;
  color: var(--text-primary);
  border: none;
  border-radius: 8px;
  height: 40px;
  padding: 8px 16px;
  font-family: var(--font-sans);
  font-size: 17px;
  box-shadow: 0 0 0 0 var(--bg-primary),
              0 0 0 1px var(--border-hover);   /* measured resting state */
}
.btn-secondary:hover {
  box-shadow: 0 0 0 1px var(--bg-primary),
              0 0 0 2px var(--border-hover);   /* ring expands to 2px — measured ✓ */
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

**Contrast note (re-scoped 2026-10).** The measured primary button is ink-on-paper (`#141413` on `#faf9f5`, ≈17.5:1) — no AA concern. The caution below now applies only if you adopt a clay fill as a case stance: 17px white on `#d97757` computes to **3.12:1** — below WCAG AA's 4.5:1 for non-large text. When using a clay button, pick one:

- Bump to ≥19px bold (qualifies as large text → 3:1 required, passes), or
- Darken the fill one step to `#c6613f` (accent-hover, 4.05:1) with ≥19px bold text, or
- For 15–17px text, darken further (`#b8552f` computes to 4.80:1 vs white) or use a neutral `.btn-secondary`, or
- Declare it a conscious brand exception in the design plan.

Never put small (≤17px) white text on `#d97757` and call it AA.

Input (etched inset — product-CSS distillation; keep as this case's stance for tool UIs):

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

2026-10 note: the marketing page's own inputs are demo-internal; their measured focus pattern is `:focus-within { border-color: var(--color-focus); outline: 1px solid var(--color-focus) }`. The etched-inset recipe above has no rendered instance on the page to verify against — treat it as distillation + stance.

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

Segmented control (pill container + pill items; the `inset 0 0 0 1px` active-state ring pattern is measured — ×5 site-wide in 2026-10; the former ×2 brand-CSS count is retired):

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

Deck bans: gradient backgrounds, gradient text, diffuse shadows beyond the measured token tiers, 4/16px-radius rectangles, container glassmorphism/blur/transparency, more than 3 data points per page, SmartArt, bento grids, decorative icons.

## Acceptance Checklist
Walk every item before delivery (case-specific, stacked on top of the general `checklist.md`):

- [ ] Base is `#faf9f5` (light) or `#141413` (dark), no gradients
- [ ] Accent limited to `#d97757` (primary) / `#c46849` (deep + focus) / `#c6613f` (interactive, ex-`#c96442`), no chromatic accent beyond the clay family
- [ ] All sans-serif (YaHei/PingFang/-apple-system/Roboto/Inter), zero serifs
- [ ] Radius only 0px / 8px / 12px / 9999px — no 4/16/20/24px (case stance)
- [ ] Shadows only: etched inset (product-side pattern) or the measured 2026-10 token tiers (`0 2px 8px #0000000a` / `0 4px 20px #0000000a` / `0 4px 16px #0000001a`, plus shell surfaces `0 12px 40px #00000026`); no accent-colored glow
- [ ] Focus: `outline: 2px solid #c46849`; offset 4px (Button module) or 2px — 2px is the site-wide majority (measured)
- [ ] backdrop-filter: none — live 2026-10 has zero usage; no glassmorphism of any kind
- [ ] Alpha transparency ≤50% and only serving functional hierarchy (hover, borders, disabled)
- [ ] No gradients (except a 37% black-to-transparent scrim at image bottoms)
- [ ] Information hierarchy scannable in 3 seconds
- [ ] One core argument per screen / page / slide
- [ ] CJK body line-height ≥ 1.6
- [ ] Numerals in tabular figures (tnum) + mono font (2026-10: live agrees — `tabular-nums`)

## Anti-Examples
- Glassmorphism of any kind: live 2026-10 has zero backdrop-filter; blur is the most dated "AI-generated" signal
- Diffuse-shadow cards beyond the measured token tiers: material dishonesty, instant failure
- 4px/16px/20px/24px radii: fuzzy middle values, conflict with the four-state system
- Serif display headlines: same palette but reads as "retro editorial", not this product style (serif ban stands)
- A third accent color, gradient text/backgrounds, bento grids, decorative icons
