# Pre-Delivery Checklist

Walk every item. Any failure means go back and fix it.

## Content Truthfulness
- [ ] Every numeral on the page matches the source data (re-verified, not written from memory)
- [ ] Multiples / percentages / orders of magnitude survive arithmetic (25× is not "two orders of magnitude")
- [ ] The signature element comes from the content itself, and you can explain "why only this page could look this way"

## Design Discipline
- [ ] Single accent color (semantic green/red excepted); every usage matches a role declared in the design plan; no large-area fills (backgrounds only as 10–25% tints)
- [ ] Radius strategy consistent site-wide (all-rounded or all-square)
- [ ] Checked against `anti-patterns.md`: the three default skins + rejected patterns, none triggered
- [ ] Every decorative element has a stated information payload; everything you couldn't justify is deleted
- [ ] Charts follow `chart-colors.md`: sequential by default, ≤5 categorical hues, no red+green pairing, grayscale-distinguishable
- [ ] Icons are functional only: 24×24 grid, currentColor, ≤24px, inline SVG; decorative icons still banned
- [ ] Mixed-size rows (index bar + numeral + headline) share one optical center axis (e.g. `align-items: center`) — no baseline/self-override mixing

## Engineering Quality
- [ ] Zero external dependencies (no web fonts / images / CDN); system sans first; numerals tabular-nums; mono only for code/identifiers/logs (or a documented case-level exception)
- [ ] Long CJK headlines use inline-block semantic chunks, no orphan characters (confirmed via screenshot)
- [ ] Motion: one choreographed sequence only + `prefers-reduced-motion` fallback
- [ ] Bilingual pages: toggle button states correct, default language correct, no duplicate ids
- [ ] Keyboard focus visible (`:focus-visible`)
- [ ] Mobile grid collapses correctly (confirmed via narrow-viewport screenshot)

## Contrast & States
- [ ] Body text vs background ≥ 4.5:1 (WCAG 2.2 SC 1.4.3 AA); large text (≥24px, or ≥18.66px bold) ≥ 3:1
- [ ] Non-text elements: focus indicators and control boundaries ≥ 3:1 (SC 1.4.11)
- [ ] Spot-checked at least 3 places (body text, muted text, accent text) via Chrome DevTools → color picker, which shows the ratio and AA/AAA pass/fail directly
- [ ] Exempt: purely decorative text, logotypes, disabled components
- [ ] Every interactive element has visible hover and focus states; focus ring ≥2px with ≥3:1 contrast against the background (Claude measured: `0 0 0 2px #2c84db`)
- [ ] Disabled state: alpha fade-out (text-muted color, alpha ≤50%; Material 3: 38% foreground) — exempt from contrast thresholds, but no hover effect and a non-color cue it is inert (e.g. `cursor: not-allowed`)
- [ ] Conditional states where applicable: async data → loading and error states; data-driven page → empty state. Missing means go back and build them

## Verification
- [ ] Headless Chrome screenshots (`--virtual-time-budget=5000` so animations finish) inspected with your own eyes: first screen, full-length page, narrow viewport
- [ ] Animations are progressive enhancement: if the animation never runs (headless capture, reduced-motion, no-JS), every element is still fully visible — entrance animations with `fill: both` that freeze content at `opacity: 0` fail this check
- [ ] Narrow-viewport screenshots: headless Chrome enforces a minimum layout width (~534px measured via a `window.innerWidth` probe page) regardless of `--window-size`; below that, the screenshot is a CROP of a wider layout and mimics horizontal overflow. Probe `innerWidth` before "fixing" CSS; treat ~534px as the narrowest testable width
- [ ] Temporary screenshots / preview files deleted
