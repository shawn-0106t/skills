# Icon Discipline

Icons on a rationalist page must earn their place: each one operates something, points
somewhere, or identifies something. Calibrated 2026-08 against live claude.com (120 SVG icons
on /product/claude-code, 175 on /product/design) — the live site uses icons well beyond bare
controls; the rules below reflect that measured reality.

## Scope: four measured tiers

1. **Controls** — close, menu, arrows, external-link, search, theme/language toggles. Always
   allowed.
2. **Wayfinding markers** — nav dropdown items, menu list items, card-link arrows
   (measured live: `nav_dropdown_icon` ×104, `prompt_menu_item_icon` ×12, CardLink arrows ×20).
   Allowed when each item in the list gets the same treatment — the icon is the item's
   identifier, not an ornament.
3. **Identity marks** — third-party / partner logos (measured live: Slack, Google integration
   logos, shipped in their official brand colors). Allowed wherever the product relationship is
   the content.
4. **Restrained pictograms** — one glyph per feature row or card (measured live: HeroWays
   `waysIcon` ×8). Allowed when the pictogram is drawn for *this* feature, not pulled from a
   generic set. Still banned: icon-per-bullet-list decoration, icon squares on SaaS card grids,
   "make this card prettier" filler.

When a text label communicates the meaning more reliably than a glyph, use text.

## Sourcing

- Inline SVG only. No icon fonts, no external libraries, no CDN links, no fetched assets —
  the zero-dependency rule applies to icons too.
- State glyphs (checkboxes, status dots, disclosure marks) follow the same rules. Never fake
  them with box-shadow insets, border tricks, or rotated pseudo-elements — those render fuzzy
  and misaligned; draw the SVG.
- **First source: the bundled library** — `../assets/icons/` holds 105 fill-style glyphs on a
  uniform 24×24 grid, all `currentColor` (controls / wayfinding / state / media / content;
  see its README for the index and usage rules). Copy and inline from there before drawing
  anything by hand.
- Hand-draw only what the library lacks. Do not redraw from memory of Lucide / Material /
  FontAwesome shapes; if you cannot construct a clean original glyph, use a text label instead.
  Hand-drawn additions on a page that uses the library must match its fill style and 24×24 grid.
- Partner logos are the one exception to original-drawing: use the official mark, unmodified.
- Emoji are not UI icons.

## Construction

- **Grid**: one consistent grid per UI family — measured live grids are **20×20 (dominant)**,
  16×16, and 24×24. Pick one and stay on it; do not mix grids within a family.
- **Stroke**: uniform, with consistent caps and joins across all icons on the page. Measured
  live: 1.3–1.4px on the 20px grid (≈1.5–1.75px scaled to 24px). Consistency matters more than
  the absolute value. **Fill-based families** (like the bundled library) are equally valid —
  keep filled shapes and uniform visual weight; never mix stroked and filled icons in one family.
- **Color**: `currentColor` for all UI glyphs — they inherit the surrounding text color
  (measured ×119 on the product page). No gradients, no shadows. Hardcoded brand hex is allowed
  **only** for partner logos; never recolor a partner logo into `currentColor`.
- Keep geometry minimal: the fewest strokes that carry the meaning.

## Size

Measured live UI icons run 14–20px (`width=20` ×48, `16` ×21, `15` ×6, `14` ×1). Icon size
follows the host element, not arbitrary choice:

| Context | Icon size |
|---|---|
| Inline with body text, dense menus | 14–16px |
| Default buttons, chips, tabs, menu items | 16–20px |
| Toolbar buttons, primary actions | 20px |
| Standalone icon buttons | 20–24px |

**24px is the hard ceiling for UI glyphs.** Partner logos and hero illustrations are not icons
and are exempt from this ceiling — but a spot that seems to need a bigger *glyph* is usually
better solved with typography or layout.

## Accessibility & usage

- Icon-only buttons need an accessible name (`aria-label` or visually hidden text).
- Icons next to a text label get `aria-hidden="true"`.
- At most one leading + one trailing icon per button.
