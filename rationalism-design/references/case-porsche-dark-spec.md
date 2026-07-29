# Case: porsche.cn — Dark Performance-Spec Style

Source: https://www.porsche.cn/china/zh/ (distilled 2026-07)
Temperament: **sharp restraint**. Luxury comes from contrast, whitespace, and precision — the red is spent only where it cuts.

## When to Use
Data-dense pages, benchmark/performance reports, any occasion needing "premium black". Use directly when the user says "reference Porsche / performance-car website style". The content should itself have a "performance spec" quality (durations, pass rates, multiples, specs) — if it doesn't, don't force this style onto it.

## Colors
| Role | hex | Usage |
|---|---|---|
| black | `#0b0b0b` | Main base (softened pure black) |
| panel | `#141414` | Panels |
| panel-2 | `#1a1a1a` | Secondary panels / tracks |
| white | `#ffffff` | Headlines / key numerals |
| gray-1/2/3 | `#d8d8d8` / `#9a9a9a` / `#5f5f5f` | Body / secondary / labels |
| red | `#d5001c` | Sole accent (Porsche red): eyebrows, section numbers, winning values, key multiples |
| green | `#3fbf7f` | "Pass" semantics only (e.g. 10/10) |
| line | `rgba(255,255,255,.14)` / `.08` | Hairlines / soft lines |

## Type Scale
- Hero headline: `clamp(2.4rem, 6vw, 4.4rem)` / weight 800 / `letter-spacing: -.03em` / second line entirely red
- Spec numerals: `clamp(1.7rem, 3vw, 2.5rem)` / weight 800 / tabular-nums, units at 50% size
- Micro-labels: mono 10–11px / `letter-spacing: .16–.32em` / uppercase / gray-3 or red

Note: the mono micro-labels here are this style's spec-sheet signature — a case-level exception to the playbook's general mono default.

## Layout Concept
**Zero radius, zero shadow.** Panels are separated by 1px seams (grid container `gap:1px; background:line-color`) forming full-page hairline divisions. Section header = thick top hairline + red mono index number + large white headline.

## Signature Element
**The spec strip**: a row of large numerals below the hero (e.g. 96.5s / 1,334 / 25× / 10/10 / +0.22), mirroring the 0–100/horsepower/top-speed zone on Porsche model pages. Prerequisite: your content has real quantified metrics — this is how "data-dense" gets translated from weakness into style.

## Key Components
- Language toggle: square outlined button group, active state fully red
- Code tags: dark base + pale-red text + 1px soft line, no rounded capsules
- Tables: borderless, horizontal hairlines, numerals in white mono, winning values in red
- Duration bars: square tracks (panel-2 base), red = fast, gray = slow

## Anti-Examples
- Any radius / shadow / gradient glow: instant failure
- Red overuse (full-red headlines + all-red buttons + all-red labels at once): red should stay under 5% of the page in this style
- Color illustrations or emoji icons inside this style
