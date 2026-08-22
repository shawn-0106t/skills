---
name: rationalism-design
description: Design playbook for building distinctive, engineering-rational web pages that reject the "AI default look". Core belief - modern is not a fixed look, it is the inevitable form of the specific content. Use whenever the user asks to build, redesign, or style an HTML page, report, dashboard, landing page, or data-driven page, or says a page looks "too generic / too templated / too AI-flavored", or references a site and asks to "make it like this". Includes a structured clarification step (style anchor is a gating decision), a distilled case library (Claude Code engineering rationalism, Porsche dark performance-spec), an AI-default anti-pattern list, and a pre-delivery checklist.
---

# Rationalism Design Playbook

Build web pages with a brand voice and no AI-default feel. Core belief: **modern is not one fixed look — it is the inevitable form of this specific content**. Every page needs a reason why only it could look this way.

Scope: this is a single-page aesthetics playbook. Multi-page products additionally need information architecture, navigation patterns, page templates, and full component-state coverage — for those, defer to platform design systems (Material 3, Fluent 2); they are out of scope here.

## Five Core Disciplines

1. **The signature element comes from the content itself.** Real data, real product UI, real process — not decorative graphics. Example: a verification log turned "fixed 134 cells" into a 134-cell pixel mosaic; a product page used a real terminal session as the hero. Decoration either encodes information or gets deleted.
2. **One accent color.** Only one hue family gets to shout; everything else stays neutral. Choosing the accent is a brand-level decision (terracotta = warm honesty, Porsche red = performance luxury, brand blue = trust). Once chosen, spend it only where it cuts. Before building, declare in the design plan which roles may carry the accent (e.g. winning values, primary CTA, section indices). Accent outside a declared role means the plan is incomplete or the element is decoration. Spend the accent as text, hairlines, small marks, and tinted backgrounds — never as large fills. Two-tier extension (from the Kimi brand system): the accent is the only hue in the *functional* tier; if the brand also has an expressive color family, its boundary must be declared in the design plan (art/texture contexts only) — an expressive color crossing into UI hierarchy is decoration.
3. **Type scale is personality.** The contrast of tight-tracked headlines against quiet data micro-labels beats swapping fonts (especially when the user wants system default fonts). Setting micro-labels or numerals in mono is a case-level brand decision (see the case files), not the default. Radius vs. square corners is also a brand decision: rounded = friendly, square = precise/luxurious. Pick one and stay consistent site-wide — mixing them is an accident. Every typeface in the design plan carries a declared semantic role (Kimi's triad: Inter = functional efficiency, Geist Mono = developer precision, Sentient = literary warmth); a font with no role is decoration.
4. **Subtract.** Before delivering, ask of every element: what breaks if I delete it? The Chanel principle — take one accessory off before leaving the house. Left color bars, extra badges, and second accent colors are the first accessories to remove.
5. **Semantic line-breaking for CJK headlines.** Break long Chinese headlines into `<span style="display:inline-block">` semantic chunks so the browser only wraps between chunks — no orphan characters like a lone "来," on its own line. Keep chunks small; oversized chunks still wrap inside.

## Workflow

### 1. Position & Clarify (before any code)

Define: what the content is, who it is for, and the page's single job. Then confirm the **style anchor** — this is the gating decision, because it determines everything downstream (palette, type, layout, signature). Getting it wrong means redoing the whole design system, so it is worth one structured question.

**If the environment provides a structured question tool (e.g. AskUserQuestion), use it. Otherwise ask conversationally — at most 3 questions in one message.**

- **Q1 (gating — ask unless the answer is already explicit): style anchor?**
  - A case from the library below (name which)
  - User provides a reference site → run the distillation in Step 2
  - Neither → propose a compact plan (color / type / layout / signature) for approval before building
- **Q2 (only if genuinely ambiguous): audience + the page's single job?** Skip when the brief already answers it.
- **Q3 (only if constraints were hinted at): hard constraints** — must-include data, must-avoid elements, language requirements.

Restraint rule: infer from context whenever possible. Do not ask what you can deduce — asking too much breaks flow, and this playbook's own spirit is subtraction. One gating question plus at most two conditional ones is the ceiling.

### 2. Reference site given → distill, don't skin-copy

Fetch the reference site, then **extract its design system, not its content**:

- Colors: 4-6 named hex values (base, panel, ink, accent, support, line)
- Type scale: headline / body / label tiers, weight and tracking strategy
- Layout concept: one sentence (e.g. "warm card grid", "hairline-seamed square panels")
- Signature: the element the site is remembered for (terminal demo? spec number strip?) — and what real material in **your** content corresponds to it

See `references/case-claude-code-rationalism.md` and `references/case-porsche-dark-spec.md` for the distillation format; when the user names one of those styles, use them directly. Distill new reference sites in the same format, and append reusable ones as new case files.

### 3. Design plan self-check

Write a compact plan (color / type / layout / signature), then check it line by line against `references/anti-patterns.md`: **would this scheme still work for different content? If yes, it is a template — start over.** No code until the plan passes.

### 4. Build

- Single file, zero external dependencies (no web fonts, no external images, no JS libraries)
- Grid: two layers under one architecture (Kimi brand system) — a base grid enforces spacing and alignment everywhere; an expressive grid is released only for hero / visually focused blocks. Declare in the design plan which blocks may use the expressive grid; everything else snaps to the base grid
- Fonts: system sans first (`system-ui` stack); numerals get `font-variant-numeric: tabular-nums` inside the body font instead of a font switch; mono is reserved for code, raw identifiers, logs, and terminal excerpts — unless the user asks otherwise
- Units: px for tool/dashboard interfaces (pixel precision); on text-heavy report/long-form/landing pages, font sizes use rem so user zoom settings are respected — borders, 1px hairlines, and icon grids stay px either way
- Motion: one choreographed sequence only (entrance OR scroll-triggered), with a `prefers-reduced-motion` fallback. Functional scroll behavior (`scroll-behavior: smooth` for anchor jumps) does not count as the choreographed sequence — it is allowed on top, with the same reduced-motion fallback
- Bilingual pages: dual content blocks + a toggle function, default to the user's primary language, clear button states

### 5. Screenshot self-check (mandatory)

Never deliver blind. Screenshot with headless Chrome and inspect with your own eyes:

```bash
"/c/Program Files/Google/Chrome/Application/chrome.exe" --headless --disable-gpu \
  --window-size=1280,<page-height> --virtual-time-budget=5000 \
  --screenshot="<tmp>.png" "file:///<page-path>"
```

`--virtual-time-budget` lets entrance animations finish — without it you will misjudge elements as missing. Fix line-breaks, overflow, and contrast (≥4.5:1 body / ≥3:1 large text, see `references/checklist.md`), then re-shoot. Delete verification screenshots after use.

### 6. Before delivery

Walk `references/checklist.md`.

## Case Library

| Style | When to use | File |
|---|---|---|
| Engineering rationalism (Claude Code product UI) | Tool interfaces, dashboards, technical product pages; user names claude/anthropic style | `references/case-claude-code-rationalism.md` |
| Dark performance-spec (porsche.cn) | Data-dense pages, benchmarks, performance reports, luxury feel | `references/case-porsche-dark-spec.md` |
| Monochrome engineering docs (platform.kimi.com) | API/developer docs, spec sheets, technical reference; black-as-accent, neutral shadows, code-as-hero | `references/case-kimi-platform-mono-docs.md` |
| Kimi brand visual infra (kimi.com/resources/kimi-brand) | Brand pages, launch pages, marketing pages needing the technology + humanism dual tone; two-tier color, fonts-by-role, dual grid, De-coding texture | `references/case-kimi-brand-visual-infra.md` |
| Chart color grammar | Any page with charts or data visualization | `references/chart-colors.md` |
| Icon discipline | Any page that uses icons | `references/icons.md` |
| Section rail navigation | Long single-page docs (≥4 anchored sections) needing edge wayfinding — interaction skeleton measured from kimi.com, skin regrown from the host page | `references/nav-section-rail.md` |
| AI-default anti-patterns | Every design-plan self-check | `references/anti-patterns.md` |
| Pre-delivery checklist | Every delivery | `references/checklist.md` |
