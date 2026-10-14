# Case: Kimi App — Paper-Alpha Chat UI

Source: distilled from live www.kimi.com (logged-out zh-CN chat home, "K3" release), probed 2026-10-14 via Playwright 1.64 / Edge 155 computed styles over 708 DOM elements + 262 runtime-injected root tokens (`--Bg-*` / `--Labels-*` / `--Fills-*` / `--ui-*` / `--Colors-*` / `--Always-*` / `--MaskBg-*` / `--Others-*` / `--Separators-*` / `--Syntax-*` / `--BgGp-*` / `--markdown-*` / `--kimi-*`) + 17 CSS chunks (69,435 B, md5-10 manifest in the probing workspace `css_manifest.json`; chunk contents not retained) + follow-up element probes (`kimi_followup_fills.json`, `kimi_followup_send.json`). The token variables are JS-injected at runtime (absent from static HTML) — computed styles are the authoritative evidence. Occurrence counts are version-locked to this crawl.
Temperament: **chromatic abstinence on paper**. The entire functional layer is one hue — black — at four alpha tiers, on a warm-white ground; hierarchy is expressed through alpha steps and fill shifts, never through new hues. Color exists only as a 5px signal dot and inside content (syntax, diff, status). Where the brand book (see boundary below) promotes signature blue to the one functional accent, the app demotes blue to a notification dot: the interface trusts grayscale discipline first.

**Claim labels.** Values tagged *measured* were verified against the live artifacts above (counts included, version-locked to the md5 manifest). Values tagged *case stance* are deliberate distillation choices — the live system does it differently or the evidence is partial. Do not present stances as measurements.

## Three Inviolable Rules
1. **One hue, four alphas**: the whole functional layer is `#000` at four alphas — Labels Primary / Secondary / Tertiary / Quaternary = `#000000e6` (90%) / `#00000099` (60%) / `#00000073` (45%) / `#0000004d` (30%) *(all measured; the four text colors observed on the page are exactly these plus `#fff` on ink)*. Hierarchy = alpha steps, not hue steps. Using fixed grays instead of alpha tiers breaks theme-flipping and breaks the case.
2. **The state machine lives in the tokens**: every color/state token — all ten families (`--Bg-*` / `--BgGp-*` / `--Fills-*` / `--Labels-*` / `--Always-*` / `--Colors-*` / `--MaskBg-*` / `--Others-*` / `--Separators-*` / `--Syntax-*`; 204 tokens measured) — ships `-hover` / `-active` variants; type/markdown/library tokens (`--ui-*`, `--markdown-*`, `--kimi-*`, `--swiper-theme-color`) are single-state. Interaction is a fill or border alpha shift (e.g. `--Fills-F1` `#00000008` → hover `#0000000f`) — never a new hue, never a lift shadow.
3. **Hue is a signal, not a surface**: the only chromatic element in chrome is the KMBlue toolkit dot — `#1783ff` at 5×5px *(measured: exactly one blue fill on the page; bbox in `kimi_followup_fills.json`)*. Content-area hues (code syntax, diff/status colors) belong to the content, not the chrome. A blue button, blue link run, or blue-filled banner breaks the case. (Token layer also carries a Swiper-library default `--swiper-theme-color: #007aff` — not used in chrome; brand-book `#007CFF` does not appear anywhere.)

## When to Use
Chat/agent product UIs, assistant homepages, tool interfaces that want the Kimi-app look ("参考 kimi.com 应用界面"). Boundary with the other two Kimi cases — three surfaces, three chromatic strategies, do not cross:
- `case-kimi-brand-visual-infra.md` (kimi.com brand book, marketing): signature blue `#007CFF` as functional accent + expressive pastels. The **app does not use that system**: its blue is `#1783ff`, and it is demoted to a dot signal.
- `case-kimi-platform-mono-docs.md` (platform.kimi.com, docs): achromatic `#111` on docs chrome, code-as-hero.
- This case: alpha-black on paper for a conversational product shell.

## Colors
All *measured* from the runtime token layer unless noted. Every `--Bg-*` / `--Fills-*` / `--Labels-*` token also ships `-hover` / `-active` variants (the state machine architecture).

Grounds:

| Role | token | value | Usage |
|---|---|---|---|
| page ground | `--Bg-GroundPC` | `#fbfaf9` | App/sidebar ground (body computed ✓); hover `#f3f3f2`, active `#eeeeed` |
| main panel | `--Bg-Primary` | `#fff` | Elevated main surface; hover `#f7f7f7`, active `#f2f2f2` |
| secondary fill | `--Bg-Secondary` | `#f5f5f5` | Sidebar items, secondary surfaces |
| glass grounds | `--Bg-Primary90/70` | `#ffffffe6` / `#ffffffb3` | Translucent panels (paired with the single blur, see Shadows) |

Labels (text) — the four-alpha ladder:

| Role | token | value |
|---|---|---|
| primary | `--Labels-Primary` | `#000000e6` |
| secondary | `--Labels-Secondary` | `#00000099` |
| tertiary | `--Labels-Tertiary` | `#00000073` |
| quaternary | `--Labels-Quaternary` | `#0000004d` |

Fills — the interaction ladder (alpha black):

| token | rest | hover | active |
|---|---|---|---|
| `--Fills-F1` | `#00000008` | `#0000000f` | `#00000014` |
| `--Fills-F2` | `#0000000d` | `#00000014` | `#00000019` |
| `--Fills-F3` | `#00000026` | `#0000002d` | `#00000031` |
| `--Fills-F4` | `#00000040` | `#00000045` | `#00000049` |

Separators: `--Separators-S1` = `#00000021` (13% black hairline; hover `#00000028` / active `#0000002c`).

KMBlue family *(measured — distinct from the brand book's `#007CFF`)*:

| token | value |
|---|---|
| `--Colors-KMBlue` | `#1783ff` |
| `-hover` / `-active` | `#167ff7` / `#167cf2` |
| `--Others-KMBlueDisabled` | `#1783ff66` |

Content hues *(measured token definitions — belong to content, not chrome)*: `--Colors-PositiveGreen` `#16c456` (+25% soft `#16c45640`), `--Colors-Red` `#ff3849` (+`#ff384940`), `--Colors-Orange` `#ff9500`, `--Colors-Purple` `#985ffb`, `--Colors-Green` `#32ff7d`, code syntax (e.g. String `#50a14f`, Comment `#a1a1a1`, Mark `#526fff`), `--Others-BubbleBlue` `#1783ff` (same hue as KMBlue; active `#167cf2`).

Masks: `--MaskBg-Base` `#0006` (scrim), `--MaskBg-Gray` `#303030e6` (tooltip/dark toast).

## Type Scale
Single system stack *(measured: 100% of text elements resolve to `-apple-system` first; weights 400 dominant, 500 for emphasis — no heavier weight observed)*:

`-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "PingFang SC", "Microsoft YaHei", sans-serif`

`--ui-*` ramp (size/line-height, all *measured token definitions*):

| token | size / lh | usage |
|---|---|---|
| `--ui-T1` | 18 / 26 | page titles |
| `--ui-T2` (+Emphasized) | 16 / 24 | section titles |
| `--ui-B1` (+Emphasized) | 15 / 22 | body / list items |
| `--ui-B2` (+Emphasized) | 14 / 20 | default body *(measured dominant: 14px ×31)* |
| `--ui-C1` (+Emphasized) | 12 / 18 | captions |
| `--ui-C2` (+Emphasized) | 10 / 14 | micro-labels |

Markdown/content tiers: H2 20px, code blocks 14px *(measured token definitions)*. Numerals: font-variant-numeric was not probed on this surface — set `tnum` in data contexts as a case stance when numbers align.

## Radius
Two anchors *(measured DOM distribution: 10px ×16, 20px ×16, 8px ×6, 12px ×6, 4px ×3, 50% ×2, 0px ×1; singles 16/22/24/34px on window/hero surfaces)* — not a strict four-state system:

- `10px` — the control anchor: sidebar items, cards, small surfaces
- `20px` — the capsule anchor: composer card toolbar pills, model selector, project/plugin triggers (capsule at their control height)
- `4–12px` support tiers for inner elements; `50%` circles (send button, dots); window/hero sweeps 16–34px

(Component chunks additionally showed 4/6/8/10/12/16/100px radii during the crawl — chunk contents not retained, manifest only.)

Case stance: when rebuilding, anchor on 10px + 20px and keep support tiers minimal; do not import the four-state rule from other cases here.

## Shadows
Chrome is essentially shadowless — hover/active are fill shifts. Two measured instances (different hosts; #1 identified on the composer card, #2's host element not identified):

```css
/* 1. Measured on the composer card: hairline etch + one soft diffuse (layered) */
box-shadow:
  rgba(0, 0, 0, 0.13) 0 0 0 0.5px inset,
  rgba(0, 0, 0, 0.10) 0 4px 16px 0;

/* 2. Measured on an unidentified surface — do not stack with #1 on one element */
box-shadow:
  rgba(0, 0, 0, 0.03) 0 4px 12px 0,
  rgba(0, 0, 0, 0.07) 0 5px 16px -4px;

/* 3. The single permitted blur */
backdrop-filter: blur(15px);   /* ×1 on the page */
```

Banned: hover-elevation shadows (interaction is fill shift), colored glows, layered glass stacks.

## Layout Concept
App shell: paper sidebar rail (the new-chat rail measured 240px wide) on `--Bg-GroundPC` + white main panel (`--Bg-Primary`); sidebar header 56px *(measured)*. The main column centers one hero object — the composer card — with icon+label pill shortcuts below and a filings footer. Navigation is icon+label rows with fill-step hover; projects/history sections are quiet text lists. Whitespace does the hierarchy work; chrome almost never draws attention to itself.

## Signature Element
**The paper-and-alpha restraint itself, capped by one blue dot**: a 5×5px KMBlue dot on the toolkit trigger is the only color in the entire chrome — a notification signal, not a style. Secondary signatures: the circular send/login trigger, the KIMI black wordmark, capsule toolbar pills. Real product UI is the page — no marketing artwork on this surface.

## Key Components
Recipes below are **case stance** — token values are measured, geometry is approximated from the live capture unless noted.

Sidebar nav item:

```css
.nav-item {
  display: flex; align-items: center; gap: 10px;
  height: 36px; padding: 0 12px; border: 0; border-radius: 10px;
  background: none; color: var(--Labels-Secondary);  /* 60% black */
  cursor: pointer; text-align: left;
}
.nav-item:hover { background: var(--Fills-F2-hover); color: var(--Labels-Primary); }
.nav-item.on { background: var(--Fills-F3); color: var(--Labels-Primary); font-weight: 500; }
```

Composer card (hero object):

```css
.composer {
  border-radius: 20px;
  background: var(--Bg-Primary);
  box-shadow:
    rgba(0, 0, 0, 0.13) 0 0 0 0.5px inset,
    rgba(0, 0, 0, 0.10) 0 4px 16px 0;
  backdrop-filter: blur(15px);
}
.composer .pill {                 /* model / project / plugin triggers */
  height: 32px; padding: 0 12px; border-radius: 20px;
  background: var(--Fills-F1); color: var(--Labels-Secondary);
}
.composer .pill:hover { background: var(--Fills-F1-hover); }
.composer .send {                 /* ink circle — fill unresolved at logged-out state (appears ink-dimmed; case stance) */
  width: 36px; height: 36px; border-radius: 50%;
  background: var(--Labels-Primary); color: #fff;
}
.toolkit-dot {                    /* the only hue in chrome */
  width: 5px; height: 5px; border-radius: 50%;
  background: var(--Colors-KMBlue);
}
```

Top-bar actions: 下载桌面端 = ink button — **measured** fill `#000000e6` (= `--Labels-Primary`), class `kimi-button primary`, white text (`kimi_followup_fills.json`); 登录 = surface pill (`--Bg-Secondary90`, Labels-Secondary — *case stance*, fill not probed per-element). Shortcut chips under the composer: white pills, `--Separators-S1` hairline, icon + label in Labels-Secondary.

Tooltip / dark toast: `--MaskBg-Gray` `#303030e6` fill *(token measured)*; radius and text styling observed during the crawl in the Tooltip chunk CSS — contents not retained.

## Acceptance Checklist
Walk every item before delivery (case-specific, stacked on top of the general `checklist.md`):

- [ ] Functional layer built from alpha-black tiers (`e6/99/73/4d` labels; `F1–F4` fills) on `#fbfaf9`/`#fff` grounds — no fixed grays substituting for alpha tiers
- [ ] Exactly one hue in chrome: KMBlue `#1783ff`, and only as a small signal (dot/badge ≤6px) — never as button fill, link color, or banner
- [ ] Content hues (syntax/diff/status) appear only inside content surfaces
- [ ] Interaction = fill/border alpha shift via `-hover`/`-active` token variants; no lift shadows, no color-morphing hovers
- [ ] Shadows only the two measured shadow layers; blur only `blur(15px)` ×1 surface
- [ ] Type: `--ui-*` ramp (T1/T2/B1/B2/C1/C2) with paired line-heights; weights 400/500 only
- [ ] Radius anchored on 10px (controls) + 20px (capsules); support tiers ≤12px (hero/window sweeps 16–34px exempt); circles 50%
- [ ] Every semantic token ships hover/active variants — a token without its state machine is incomplete
- [ ] App shell: 240px paper sidebar + white main panel; one centered hero object in the main column

## Anti-Examples
- **Brand-book blue-washing**: painting buttons/links `#007CFF` or `#1783ff` because "Kimi is blue" — that is the marketing case crossing into the app; in the app, blue is a 5px dot
- **Fixed-gray substitution**: `#666`/`#999` instead of the alpha tiers — kills theme-flipping and the layered hover states
- **Hue-rich status chrome**: painting nav/badges with the content palette (Purple/Orange/Green) — those hues belong to code blocks and diffs
- **Lift-on-hover cards**: `translateY` + shadow growth — this system moves fills, not elevations
- **Weight stacking**: 600/700 headings — the live ramp tops out at 500; hierarchy comes from size tier + alpha
