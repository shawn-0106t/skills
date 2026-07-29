# Chart Color Grammar

Color in a chart explains data — it is not decoration, and it is exempt from the playbook's
single-accent discipline. But exemption is not freedom: an undisciplined chart palette reads as
template work. The rules below keep chart color as deliberate as everything else on the page.

## Brand coherence

Derive sequential scales from the page's accent hue family — opacity or lightness steps of the
accent and its neutrals. The chart then shares the page's DNA: one more reason only this page
could look this way. Categorical palettes are the exception and follow the fixed ceiling below.

## Selection order

1. **Sequential is the default.** Ordered or continuous data, magnitude differences,
   part-to-whole: one hue, stepped by opacity or lightness.
2. **Categorical is the exception.** Truly independent series with no inherent ordering
   (competitor A vs B vs C). Maximum 5 hues; beyond that, differentiate with line style
   (solid / dashed / dotted) and markers, not new colors.
3. **Diverging is the last resort.** Only when a real zero or break-even midpoint exists
   (profit/loss, deviation from a baseline). Never force a diverging scale onto data without a
   meaningful center.

## Common semantics

- **Comparable series** (same metric across categories — revenue by region, temperature by
  city): same-hue opacity steps 100 / 70 / 50 / 40 / 25%, not categorical hues.
- **Actual vs target / baseline:** accent vs neutral gray.
- **Positive vs negative** (profit/loss, risk): two hues — but never red paired with green (see
  colorblind safety below).
- **Heatmaps and stacked areas:** always sequential, never categorical.
- **Pie / donut:** prefer sequential — slices are parts of one whole; categorical only for
  genuinely independent competitors.
- **Baselines, reference lines, gridlines, "no data":** neutral gray hairlines, never accent.

## Colorblind safety

- Never pair red with green in one chart.
- Colors must stay distinguishable in grayscale — check by desaturating the verification
  screenshot.
- Never rely on color alone: direct labels, patterns, or line styles carry the same information.

## Fills and backgrounds

Tint, don't flood: area fills, highlight bands, and bar backgrounds use 10–25% alpha of the hue,
not solid fills. Solid color is reserved for the data marks themselves (lines, points, bars).
