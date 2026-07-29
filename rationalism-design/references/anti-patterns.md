# AI-Default Anti-Pattern List

Check every design plan against this list, line by line. None of these patterns is inherently illegal — but they are "the default answer when you don't think". Unless the brief explicitly asks for one, its appearance means redo.

## The Three Big AI-Default Skins (the most common sources of template feel)
1. **Cream base + high-contrast serif display headlines + terracotta orange**: the editorial-magazine skin. When the user asks for "modern", shipping this is answering the wrong question (unless the brief wants retro/literary).
2. **Near-black base + single neon-green/vermilion accent**: the hacker/acid skin. Overused.
3. **Newspaper hairlines + zero radius + dense multi-column**: the broadsheet skin. Also overused.

## Patterns actually rejected during this skill's own development
4. **Deep-space base + blue-violet radial glow + glassmorphic cards**: the 2021 "AI-generated" standard kit, now the most dated signal there is. Frosted sticky bars, glowing stat cards, starfield backgrounds — the whole set.
5. **Generic SaaS card grid**: light-gray base + white cards + left gradient bar + icon squares + chip badges. Swap the content and it still works = template. Modern ≠ stacking this component kit.
6. **4px semantic color bar on card left edge**: when the icon and label already carry the semantics, the bar is the extra accessory — and it clashes with a soft-radius system.
7. **Decoration unrelated to content**: mosaics, particles, wave SVGs that are only "pretty". The signature element must come from the content itself.

## Copy and detail anti-patterns
8. **Order-of-magnitude bragging**: writing 25× as "two orders of magnitude" (25× ≈ 1.4 orders). Data copy must survive arithmetic.
9. **CJK orphan characters**: a long Chinese headline wraps leaving a lone "来，" on its own line. Prevent with inline-block semantic chunks.
10. **Motion as atmosphere crew**: every element floating/glowing/pulsing. Modern motion is one choreographed sequence with an order — or none at all.
11. **External dependencies**: Google Fonts, CDN images, online icon libraries. Deliverables should have zero external dependencies (unless the brief allows); use system font stacks.
12. **Forgetting reduced-motion**: any motion must ship with a `prefers-reduced-motion` fallback.

## Self-Check Questions
- Would this scheme still work for a different topic? Yes → it's a template, start over.
- If I delete this element, is information lost? No → delete it.
- Does every accent usage match a role declared in the design plan? An accent with no declared role is decoration — delete it or declare the role.
