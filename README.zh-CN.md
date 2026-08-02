# skills

**[English](README.md)** | 中文

一个面向 AI 编程 agent（Claude Code / Kimi Code 及其他兼容 `SKILL.md` 格式的 agent）的个人 skill 合集。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 简介

本仓库中的每个 skill 都是一个自包含目录，遵循 Agent Skills 格式：以 `SKILL.md` 为入口
（YAML frontmatter + 指令），可选配一个 `references/` 文件夹存放提炼的案例文档和检查清单。
把 skill 文件夹放进 agent 的 skills 目录，即可被 agent 自动识别和调用。

## Skill 列表

| Skill | 说明 |
|---|---|
| [rationalism-design](rationalism-design/) | 网页设计方法论 playbook：打造独特、工程理性的网页，拒绝"AI 默认脸"。 |

## rationalism-design

核心信条：**现代不是一种固定的长相，而是特定内容的必然形态**。
每个页面都需要一个"只有它能长这样"的理由。

适用场景：页面看起来"太通用 / 太模板化 / AI 味太重"，或需要新建、重设计 HTML 页面、
报告、dashboard、落地页、数据驱动页面。

### 包含内容

- **五大核心纪律** —— 标志性元素必须来自内容本身、单一强调色、字体层级即个性、
  交付前先做减法、中文标题的语义化断行。
- **有门禁的工作流** —— 先确认风格锚点（它决定配色、字体、布局和签名元素），
  参考网站只提炼其设计体系而不照搬表皮，写代码之前必须通过方案级自查。
- **提炼过的案例库** —— 从真实网站实测蒸馏出的现成设计体系：
  | 案例 | 气质 | 适用场景 |
  |---|---|---|
  | Claude Code 工程理性风 | 纸感底色、陶土橙强调色、仅四种圆角 | 工具界面、dashboard、技术产品页 |
  | 保时捷暗黑性能风 | 零圆角零阴影、发丝线分格、红色占比 ≤5% | 数据密集页、跑分/性能报告、高级感 |
  | Kimi 开放平台文档黑白风 | 黑即强调色、中性阴影、代码即 hero | API/开发者文档、技术参考页 |
- **横向规范** —— 图表配色语法（默认顺序色阶、分类色 ≤5 种、色盲安全）和图标纪律
  （仅功能性内联 SVG、24×24 网格、`currentColor`）。
- **AI 默认反模式清单** —— 会导致设计方案被打回的模板化套路，构建前逐行对照检查。
- **交付前检查清单** —— 内容真实性、设计纪律、工程质量，以及强制的 headless Chrome
  截图验证。

### 目录结构

```
rationalism-design/
├── SKILL.md                                    # 入口：设计纪律 + 工作流
└── references/
    ├── case-claude-code-rationalism.md         # 完整设计体系：配色、字体、间距、组件
    ├── case-porsche-dark-spec.md               # 暗黑性能风格设计体系
    ├── case-kimi-platform-mono-docs.md         # 黑白文档风设计体系
    ├── chart-colors.md                         # 图表配色语法
    ├── icons.md                                # 图标纪律
    ├── anti-patterns.md                        # 需要拒绝的 AI 默认模式
    └── checklist.md                            # 交付前检查清单
```

## 安装

把 skill 文件夹复制到你的 agent 的 skills 目录：

```bash
# Claude Code
cp -r rationalism-design ~/.claude/skills/

# Kimi Code (Windows)
cp -r rationalism-design ~/.kimi-code/skills/
```

重启 agent（或重新加载 skills）后，直接描述需求即可 —— 比如"用这组数据做个 dashboard"
或"这个页面太普通了，重新设计" —— skill 会被自动激活。

## License

[MIT](LICENSE) © 2026 Shawn Qi
