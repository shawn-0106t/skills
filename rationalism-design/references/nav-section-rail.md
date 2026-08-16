# Component: Section Rail Navigation

Source: interaction skeleton measured from kimi.com `conversation-turn-navigator` (27 CSS rules extracted via WebBridge + `document.styleSheets`), 2026-08. Skin rules revised the same month after a full host-derived iteration — the imported look was rejected in review and regrown from the host page's grammar. Re-calibrate the skeleton by re-extracting the rules; never eyeball from screenshots.

A fixed edge rail for long single-page documents: collapsed it is a column of bare markers; on hover/focus a panel scales out of the marker column with one labelled row per section. Click jumps (native anchors); a scroll-spy moves the active state.

**What the measurement buys you is the skeleton — geometry, motion, state machine. The skin (what the markers and labels look like) is not part of the measurement and must be regrown from the host page. See Adaptation Rules.**

## When to Use

- Long single-page docs with **≥4 anchored sections** and centered content that leaves a free margin (rule of thumb: viewport ≥ ~80rem when the content column is 68rem).
- Below that viewport, or on short pages: omit the rail entirely. A half-legible rail is worse than none.

## Interaction Model (state machine)

1. **Collapsed (default).** A vertical strip of markers, one per section, vertically centered. The active section's marker differs **by color only** — never by size.
2. **Hover / keyboard focus on the strip.** The collapsed strip fades out (0.12s) while the panel **scales in** from the marker column: `scale(0.97) → 1`, opacity 0 → 1, 0.16s, `transform-origin` at the marker column's center. The panel's row geometry matches the collapsed pitch exactly, so markers appear to stay in place while labels materialize.
3. **Row hover.** Row gets a light surface fill; its marker grows (`scaleX(1.8)`, origin at the marker edge) — the "wave". The wave needs clearance: slot width ≥ grown marker end + 4px, or it collides with the label.
4. **Click.** Native anchor jump. The collapsed strip itself is a single hit area that only opens the panel; the panel rows carry the links.
5. **Active tracking.** An `IntersectionObserver` over the sections moves `active` (see reference implementation). Both the collapsed marker and the panel row of the active section are marked.
6. **Boundary states.** `prefers-reduced-motion`: all transitions off. Viewport too narrow: rail hidden.

## Measured Tokens

| Token | Measured value | Role |
|---|---|---|
| Trigger column | 42px wide | collapsed hit area |
| Marker (source-site skin) | 10 × 1.5px, pill radius | one per section — geometry only, restyle freely |
| Marker pitch | 32px (1.5px marker + 2×15.25px margin) | row rhythm, identical collapsed and in panel |
| Marker inset | 16px inside the trigger column | distance from viewport edge column |
| Panel | rows N×32px + 16px padding | height formula |
| Panel open | `scale(0.97)→1` + fade, 0.16s `cubic-bezier(0.23,1,0.32,1)`, origin at marker-column center | the signature motion |
| Strip close | fade to 0, 0.12s | collapsed hands off to panel |
| Row hover | surface fill + marker `scaleX(1.8)`, 0.12s | the wave |
| Wave clearance | slot width ≥ grown marker end + 4px | or the grown marker touches the label |
| Active signal | fill gray (~ink 25%) → full ink (100%) | **color only, never size** — see accent rule below |

## Adaptation Rules (distill, don't skin-copy)

- **The skin comes from the host page, not from kimi.com.** Copy the interaction, never the look. Take the marker style the page already uses in its own section grammar — e.g. the bar that precedes its section headings — and render the rail in that grammar. A rail that looks imported reads as foreign no matter how faithfully it is measured.
- **Accent: reuse a declared index role, else lightness.** If the page's design plan already declares an accent role for section indices (example: the terracotta section-index bar in `case-claude-code-rationalism.md`), the active marker may reuse that exact role — it is the same information in a second location, not a new accent spend. When no such role exists, fall back to a lightness shift on ink (25% → 100%) and spend no accent at all.
- **Labels follow the page's default label font.** Not mono by default — mono only where the page already reserves it for labels. Sentence case unless the page's grammar dictates otherwise. The source site's 14px sans and any mono styling are choices of their hosts, not rules.
- **Delete zero-information elements.** A numeral that merely restates position carries no information when the active marker already shows position — cut it. What remains: one marker per section, the active state, the label.
- **Radius / shadow / surfaces map to the page's case**, not to the source site. Example mapping for case-claude-code-rationalism: panel radius 16px → 12px; shadow → etched inset + `--shadow-diffuse-sm`; hover fill → `bg-surface`. The source site's pill marker radius likewise becomes whatever the host's marker grammar says (e.g. square).
- **Side is a mirror choice.** kimi.com keeps it right; left edge is a legal mirror for LTR pages. When mirroring, mirror `transform-origin` too (the origin must stay on the marker column: `calc(100% - 21px) center` on the right, `21px center` on the left).
- **Markers, labels, order come from the page's own section index** — the rail is the table of contents rendered as a ruler, which is what keeps it inside discipline 1 (signature from content).

## Reference Implementation

Neutral semantic tokens; map them to the active case (`--rail-ink` ≈ text-primary, `--rail-panel-bg` ≈ bg-elevated, `--rail-hover-bg` ≈ bg-surface, `--rail-line` ≈ border). `--rail-active` defaults to the lightness-shift variant; when the page declares a section-index accent role, set it to that accent instead. Left-edge variant, verified in production. Scroll-spy included; zero dependencies.

```html
<nav class="rail" aria-label="Section index">
  <ul class="rail-ticks">
    <li><a href="#disciplines" aria-label="Disciplines"></a></li>
    <!-- one per section, no visible numerals — the marker carries position -->
  </ul>
  <div class="rail-panel">
    <ul>
      <li><a href="#disciplines"><span class="slot" aria-hidden="true"><span class="tk"></span></span><span>Disciplines</span></a></li>
      <!-- same order as the markers; labels in the page's default sans, sentence case -->
    </ul>
  </div>
</nav>
```

```css
.rail {
  /* the page's declared section-index accent goes here when such a role exists;
     otherwise leave it as ink for the lightness-shift variant */
  --rail-active: var(--rail-ink);

  position: fixed; left: 8px; top: 50%; transform: translateY(-50%); z-index: 10;
}
.rail ul { list-style: none; margin: 0; padding: 0; }

/* collapsed — 32px rows, bare markers centered in the 42px column */
.rail-ticks { transition: opacity 0.12s cubic-bezier(0.23, 1, 0.32, 1); }
.rail-ticks a { display: block; position: relative; width: 42px; height: 32px; }
.rail-ticks a::before {
  content: "";
  position: absolute; left: 16px; top: 15.25px;
  width: 10px; height: 1.5px;               /* restyle to the host's marker grammar */
  background: color-mix(in srgb, var(--rail-ink) 25%, transparent);
  transition: background 0.12s ease;
}
.rail-ticks a.active::before { background: var(--rail-active); }
.rail:hover .rail-ticks,
.rail:focus-within .rail-ticks { opacity: 0; pointer-events: none; }

/* panel — scales in from the marker column */
.rail-panel {
  position: absolute; left: 0; top: 50%;
  transform: translateY(-50%) scale(0.97);
  transform-origin: 21px center;   /* right-edge variant: calc(100% - 21px) center */
  background: var(--rail-panel-bg);
  border-radius: 12px;             /* map to the case's card tier */
  box-shadow: inset 0 0 0 1px var(--rail-line), 0 4px 24px #0000000d;
  padding: 8px;
  opacity: 0; visibility: hidden;
  transition: opacity 0.16s cubic-bezier(0.23, 1, 0.32, 1),
              transform 0.16s cubic-bezier(0.23, 1, 0.32, 1),
              visibility 0s 0.16s;
}
.rail:hover .rail-panel,
.rail:focus-within .rail-panel {
  opacity: 1; visibility: visible;
  transform: translateY(-50%) scale(1);
  transition: opacity 0.16s cubic-bezier(0.23, 1, 0.32, 1),
              transform 0.16s cubic-bezier(0.23, 1, 0.32, 1),
              visibility 0s;
}
.rail-panel a {
  display: flex; align-items: center;
  height: 32px; padding-right: 8px;
  border-radius: 8px;
  text-decoration: none;
  color: var(--rail-ink-soft);     /* ≈ text-secondary */
  white-space: nowrap;
  transition: background 0.12s ease, color 0.12s ease;
}
/* 30px slot = wave clearance: marker 8–18px, wave (×1.8) ends at 26px, 4px gap */
.rail-panel .slot { position: relative; flex: 0 0 30px; width: 30px; height: 32px; }
.rail-panel .tk {
  position: absolute; left: 8px; top: 15.25px;
  width: 10px; height: 1.5px;
  background: color-mix(in srgb, var(--rail-ink) 25%, transparent);
  transform-origin: left center;   /* right-edge variant: right center */
  transition: transform 0.12s cubic-bezier(0.23, 1, 0.32, 1), background 0.12s ease;
}
.rail-panel a:hover { background: var(--rail-hover-bg); color: var(--rail-ink); }
.rail-panel a:hover .tk { background: color-mix(in srgb, var(--rail-ink) 60%, transparent); transform: scaleX(1.8); }
.rail-panel a.active { color: var(--rail-ink); font-weight: 600; }
.rail-panel a.active .tk,
.rail-panel a.active:hover .tk { background: var(--rail-active); }

@media (max-width: 79.99rem) { .rail { display: none; } }
@media (prefers-reduced-motion: reduce) {
  .rail-ticks, .rail-ticks a::before, .rail-panel, .rail-panel a, .rail-panel .tk { transition: none; }
}
```

```js
/* Scroll-spy: the section crossing the viewport's upper band owns the active
   marker. Jumps stay native anchors — no scroll hijacking. */
(() => {
  const links = [...document.querySelectorAll('.rail a[href^="#"]')];
  if (!links.length || !('IntersectionObserver' in window)) return;
  const byId = new Map();   /* section id → every rail link pointing at it */
  for (const a of links) {
    const id = a.getAttribute('href').slice(1);
    (byId.get(id) ?? byId.set(id, []).get(id)).push(a);
  }
  let active = null;
  const io = new IntersectionObserver(entries => {
    for (const e of entries) {
      if (!e.isIntersecting) continue;
      const group = byId.get(e.target.id);
      if (!group || group === active) continue;
      active?.forEach(a => a.classList.remove('active'));
      group.forEach(a => a.classList.add('active'));
      active = group;
    }
  }, { rootMargin: '-20% 0px -70% 0px' });
  byId.forEach((_, id) => {
    const el = document.getElementById(id);
    if (el) io.observe(el);
  });
})();
```

## Acceptance Checklist

- [ ] Skin derived from the host page's own section grammar — nothing looks imported from the source site
- [ ] Active differs by color only — never by size; accent used only when reusing an already-declared section-index role, otherwise the lightness fallback
- [ ] No zero-information elements (no numerals that merely restate position)
- [ ] Labels in the page's default label font and case
- [ ] Wave clearance: slot ≥ grown marker end + 4px, verified in hover state
- [ ] Panel opens with scale, not slide; origin on the marker column (mirrored with the side)
- [ ] Collapsed pitch and panel row pitch identical (32px), markers aligned across states
- [ ] Jumps are native anchors; scroll-spy is the only JS
- [ ] `prefers-reduced-motion` kills every transition; rail hidden when the margin does not exist
- [ ] Radius / shadow / surface tokens belong to the page's case, not to kimi.com
