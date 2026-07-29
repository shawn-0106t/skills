# Icon Discipline

Icons on a rationalist page are functional UI, not illustration. Every icon must operate
something or point somewhere; an icon that only decorates stays banned (see `anti-patterns.md`
and the case deck rules). When a text label communicates the meaning more reliably than a glyph,
use text — icons are for universally understood actions, not for expressing concepts.

## Scope: functional only

Allowed: navigation and control glyphs — close, menu, arrows, external-link, search, theme or
language toggles, and similar actions. Everything else (feature highlights, section markers,
"make this card prettier") is decoration and remains banned.

## Sourcing

- Inline SVG only. No icon fonts, no external libraries, no CDN links, no fetched assets —
  the zero-dependency rule applies to icons too.
- Do not redraw from memory of Lucide / Material / FontAwesome shapes; if you cannot construct
  a clean original glyph, use a text label instead.
- Emoji are not UI icons.

## Construction

- 24×24 viewBox grid.
- Uniform stroke, 1.5–2px, with consistent caps and joins across all icons on the page.
- `currentColor` only — icons inherit the surrounding text color. No hardcoded hex, gradients,
  or shadows.
- Keep geometry minimal: the fewest strokes that carry the meaning.

## Size

Icon size follows the host element, not arbitrary choice:

| Context | Icon size |
|---|---|
| Inline with body text | 16px |
| Default buttons, chips, tabs (~32px controls) | 18px |
| Toolbar buttons, primary actions | 20px |
| Standalone icon buttons | 20–24px |

**24px is the hard ceiling.** If a spot seems to need a larger glyph — an empty state, a hero
mark — that is not an icon use case: solve it with typography or layout instead.

## Accessibility & usage

- Icon-only buttons need an accessible name (`aria-label` or visually hidden text).
- Icons next to a text label get `aria-hidden="true"`.
- At most one leading + one trailing icon per button.
