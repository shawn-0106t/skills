# skills

**English** | [中文](README.zh-CN.md)

A personal collection of skills for AI coding agents (Claude Code / Kimi Code and other `SKILL.md`-compatible agents).

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## About

Each skill in this repository is a self-contained directory following the Agent Skills format:
a `SKILL.md` entry point (YAML frontmatter + instructions), optionally backed by a
`references/` folder with distilled case files and checklists. Drop a skill folder into your
agent's skills directory and it becomes available to the agent automatically.

## Skills

| Skill | Description |
|---|---|
| [rationalism-design](rationalism-design/) | Design playbook for building distinctive, engineering-rational web pages that reject the "AI default look". |

## rationalism-design

Core belief: **modern is not one fixed look — it is the inevitable form of the specific content**.
Every page needs a reason why only it could look that way.

Use it when a page looks "too generic / too templated / too AI-flavored", or when building or
redesigning an HTML page, report, dashboard, landing page, or data-driven page.

### What it provides

- **Five core disciplines** — signature elements derived from the content itself, one accent
  color, type scale as personality, subtraction before delivery, semantic line-breaking for
  CJK headlines.
- **A gated workflow** — clarify the style anchor first (it decides palette, type, layout and
  signature), distill reference sites into design systems instead of skin-copying them, and
  pass a plan-level self-check before writing any code.
- **A distilled case library** — ready-to-use design systems measured from real sites:
  | Case | Temperament | Use for |
  |---|---|---|
  | Claude Code engineering rationalism | paper base, terracotta accent, four radius states | tool interfaces, dashboards, technical product pages |
  | porsche.cn dark performance-spec | zero radius, zero shadow, hairline seams, red ≤5% | data-dense pages, benchmarks, luxury feel |
  | Kimi platform docs monochrome | black-as-accent, neutral shadows, code-as-hero | API/developer docs, technical reference pages |
- **Cross-cutting grammars** — chart color grammar (sequential by default, ≤5 categorical
  hues, colorblind-safe) and icon discipline (functional inline SVG only, 24×24 grid, `currentColor`).
- **An AI-default anti-pattern list** — the template skins and lazy patterns that get a design
  plan rejected, checked line by line before building.
- **A pre-delivery checklist** — content truthfulness, design discipline, engineering quality,
  and mandatory headless-Chrome screenshot verification.

### Structure

```
rationalism-design/
├── SKILL.md                                    # entry point: disciplines + workflow
└── references/
    ├── case-claude-code-rationalism.md         # full design system: colors, type, spacing, components
    ├── case-porsche-dark-spec.md               # dark spec-sheet design system
    ├── case-kimi-platform-mono-docs.md         # monochrome docs design system
    ├── chart-colors.md                         # chart color grammar
    ├── icons.md                                # icon discipline
    ├── anti-patterns.md                        # AI-default patterns to reject
    └── checklist.md                            # pre-delivery checklist
```

## Installation

Copy the skill folder into your agent's skills directory:

```bash
# Claude Code
cp -r rationalism-design ~/.claude/skills/

# Kimi Code (Windows)
cp -r rationalism-design ~/.kimi-code/skills/
```

Restart the agent (or reload skills), then just describe what you want — e.g. *"build a
dashboard for this data"* or *"this page looks too generic, redesign it"* — and the skill
activates on its own.

## License

[MIT](LICENSE) © 2026 Shawn Qi
