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

## Engineering Quality
- [ ] Zero external dependencies (no web fonts / images / CDN); system sans first; numerals tabular-nums; mono only for code/identifiers/logs (or a documented case-level exception)
- [ ] Long CJK headlines use inline-block semantic chunks, no orphan characters (confirmed via screenshot)
- [ ] Motion: one choreographed sequence only + `prefers-reduced-motion` fallback
- [ ] Bilingual pages: toggle button states correct, default language correct, no duplicate ids
- [ ] Keyboard focus visible (`:focus-visible`)
- [ ] Mobile grid collapses correctly (confirmed via narrow-viewport screenshot)

## Verification
- [ ] Headless Chrome screenshots (`--virtual-time-budget=5000` so animations finish) inspected with your own eyes: first screen, full-length page, narrow viewport
- [ ] Temporary screenshots / preview files deleted
