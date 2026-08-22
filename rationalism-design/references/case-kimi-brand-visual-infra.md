# Case: Kimi Brand Book — Visual Infra (Scientific Humanism)

Source: distilled from kimi.com/en/resources/kimi-brand (full page text + section screenshots, read 2026-08 via live browser).
Temperament: **scientific humanism** — a two-layer structure where rational order (base grid, mono micro-labels, neutral grays) carries the interface, and creative tension (signature blue, a quarantined pastel family, the De-coding texture) is spent only where it cannot confuse hierarchy. The page reads as a brand system that trusts precision first and expression second.

## Three Inviolable Rules
1. **Two-tier color architecture**: the functional tier has exactly one hue — signature blue `#007CFF` — and it alone may guide hierarchy (links, highlights, data-viz emphasis). The expressive pastel family (`#DFC8F5` / `#FFD1D4` / `#B3F4A8` / `#F4F9A7`) is quarantined to art/wallpaper/texture contexts and must never touch UI hierarchy. A pastel button or link breaks the case.
2. **Every typeface carries a declared semantic role**: Kimi's triad is Inter = functional efficiency, Geist Mono = developer-grade precision, Sentient = literary warmth. A font without a declared role in the design plan is decoration — delete it or declare the role.
3. **Texture must encode a concept**: the De-coding texture transforms organic natural textures into digital pixel arrays — nature meeting algorithm, the brand's core metaphor. A texture that is only "pretty" violates the general anti-patterns (#7); here it is doubly wrong because the texture IS the brand story.

## When to Use
Brand pages, product launch pages, marketing pages that need the "technology + humanism" dual tone. When the user says "参考 kimi.com 品牌风格 / Kimi Brand Book style", use this case directly. Boundary with `case-kimi-platform-mono-docs.md`: that case is docs/spec (achromatic, code-as-hero); this case is brand/marketing (signature blue, expressive layer). Do not cross them — a monochrome brand page is as wrong here as a blue marketing docs page is there.

## Colors
Functional tier (hierarchy and interaction):

| Role | value | Usage |
|---|---|---|
| signature blue | `#007CFF` | The one functional accent: focus guidance, data-viz highlights, key marks |
| deep navy | `#002F5B` | Depth anchor of the blue family |
| bright blue | `#00A1FF` | Blue-family support step |
| ice blue | `#A0DAF7` | Blue-family light step |
| electric cyan | `#00F6FF` | Peak-energy accent within the blue family, sparing use |

Expressive tier (quarantined — art, wallpapers, textures only):

| Role | value | Usage |
|---|---|---|
| lavender | `#DFC8F5` | Generative art, wallpaper |
| blush | `#FFD1D4` | Generative art, wallpaper |
| sprout green | `#B3F4A8` | Generative art, wallpaper |
| pale yellow | `#F4F9A7` | Generative art, wallpaper |

Neutral ramp (structure, text, backgrounds):

| Role | value | Usage |
|---|---|---|
| ink | `#121212` | Primary text |
| gray-700 | `#707070` | Secondary text |
| gray-mid | `#8D9390` | Muted labels |
| gray-300 | `#C3C3C3` | Hairlines, disabled |
| gray-100 | `#E1E3E6` | Dividers, panel seams |
| paper | `#FFFFFF` | Page background |

Data-viz rule from the brand book, consistent with `chart-colors.md`: guide attention to core metrics with precise electric-blue highlights against neutral grays.

## Type Scale
Fonts by declared semantic role (system-stack equivalents acceptable under the zero-dependency rule; the ROLE declaration is what matters, not the exact files):

| Role | Kimi's choice | Zero-dependency equivalent |
|---|---|---|
| functional efficiency (body, UI) | Inter | `system-ui` stack |
| developer precision (specs, micro-labels, numerals) | Geist Mono | ui-monospace stack |
| literary warmth (statements, quotes) | Sentient | system serif |

Headline grammar — two-line section headers, measured from the page: a functional label line (`Color System:`) followed by an emotional statement line (`A color palette full of heart and mystery.`). Label carries wayfinding, statement carries voice. Color-swatch cards carry mono micro-labels (RGB / HEX / CMYK) — the spec-sheet treatment, data as decoration.

## Layout Concept
Dual grid under one architecture: a standardized **base grid** enforces space and spacing through mathematical logic for cross-platform consistency; an **expressive grid** is released only for minimal-text, visually focused scenarios (hero, texture showcases). Declare in the design plan which blocks may use the expressive grid — everything else snaps to the base grid. Generous whitespace, light theme, minimal chrome; long pages use the right-edge section rail (see `nav-section-rail.md`, whose interaction skeleton was measured from this same site).

## Signature Element
**The De-coding texture**: organic natural textures transformed into digital pixel arrays, noise-reduced into quiet, immersive low-contrast backgrounds — the brand's "decoding" metaphor made visible. It sits between decoration and information: it encodes the brand concept without competing with content. Secondary signature: real product UI as hero (the actual New Chat / sidebar interface opens the page), plus spec-treated color swatches with mono RGB/HEX/CMYK micro-labels.

## Acceptance Checklist
Walk every item before delivery (case-specific, stacked on top of the general `checklist.md`):

- [ ] Functional tier has no second hue: every interactive/hierarchical color is signature blue `#007CFF` or a declared blue-family step
- [ ] Pastels appear only in art/wallpaper/texture contexts — none on buttons, links, badges, or data hierarchy
- [ ] Every typeface on the page has a declared semantic role in the design plan
- [ ] Any texture encodes a stated concept; purely decorative texture deleted
- [ ] Section headers follow the label + statement two-line grammar
- [ ] Design plan declares which blocks use the expressive grid; all other blocks snap to the base grid
- [ ] Hero or signature visual comes from real material (product UI, real data, brand texture), not stock decoration
- [ ] Charts: electric-blue highlights against neutral grays, per `chart-colors.md`

## Anti-Examples
- **Pastel in the functional tier**: lavender buttons, blush link colors — the expressive family escaping its quarantine is the most likely failure mode
- **Concept-free geometric texture**: particle fields, wave SVGs, generic mosaics as backgrounds — violates rule 3 and the general anti-patterns
- **Crossing cases**: importing the platform mono docs' all-grayscale chrome into a brand page (or this case's blue into docs) — the two Kimi cases are deliberate opposites
- **Statement-only headlines**: dropping the functional label line leaves wayfinding to guesswork; label-only headlines lose the voice — the grammar needs both lines
