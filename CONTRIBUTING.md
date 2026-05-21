# Contributing
贡献

Lessons, translations, fixes, outputs — all welcome. One contribution per pull
request keeps reviews fast and lets contributor counts and credit work
correctly.
课程、翻译、修复、输出内容 —— 全都欢迎。每个 pull request 只提交一项贡献，可以让审查更快，也能让贡献者统计和署名正确生效。

## Important: the README and ROADMAP feed the website
重要：README 和 ROADMAP 会为网站提供内容

`site/build.js` parses `README.md`, `ROADMAP.md`, and `glossary/terms.md` to
generate `site/data.js`. Two patterns must stay intact in any pull request that
touches those files:
`site/build.js` 会解析 `README.md`、`ROADMAP.md` 和 `glossary/terms.md` 以生成 `site/data.js`。任何修改这些文件的 pull request 都必须保持以下两种模式不变：

- Phase headers in either `### Phase N: Name \`X lessons\`` form or --- Phase 标题必须采用 `### Phase N: Name \`X lessons\`` 这种形式，或者
  `<details><summary><b>Phase N — Name</b> ... <code>X lessons</code> ... <em>Description</em></summary>` form.
`<details><summary><b>Phase N — Name</b> ... <code>X lessons</code> ... <em>Description</em></summary>` 这种形式。
- Lesson tables with the column shape `| # | Lesson | Type | Lang |` (or --- 课程表格的列结构必须为 `| # | Lesson | Type | Lang |`（或者
  `| # | Project | Combines | Lang |` for capstone tables). The `Lang` column
  accepts plain text (`Python, TypeScript`) or the legacy emoji flags
  (`🐍 🟦 🦀 🟣 ⚛️`); both are parser-equivalent.
`| # | Project | Combines | Lang |` 用于 capstone 表格）。`Lang` 列接受纯文本（`Python, TypeScript`）或旧版 emoji 标记（`🐍 🟦 🦀 🟣 ⚛️`）；两者对解析器来说是等价的。
- ROADMAP status glyphs (`✅`, `🚧`, `⬚`) on phase headers and lesson rows. --- Phase 标题和课程行中的 ROADMAP 状态符号（`✅`、`🚧`、`⬚`）。
  Do not replace them with text — the parser keys off the exact characters.
不要用文字替换它们 —— 解析器依赖这些精确字符。

Run `node site/build.js` after editing those files; `git diff site/data.js`
should show only the timestamp change if your edit was structural-safe.
编辑这些文件后运行 `node site/build.js`；如果你的修改在结构上是安全的，`git diff site/data.js` 应该只显示时间戳变化。

## Ways to Contribute
贡献方式

### 1. Add a New Lesson
1. 添加新课程

Each lesson lives in `phases/XX-phase-name/NN-lesson-name/` with this structure:
每节课都位于 `phases/XX-phase-name/NN-lesson-name/` 中，结构如下：

```
NN-lesson-name/
├── code/           At least one runnable implementation
├── notebook/       Jupyter notebook for experimentation (optional)
├── docs/
│   └── en.md       Lesson documentation (required)
└── outputs/        Prompts, skills, or agents this lesson produces (if applicable)
```

**Lesson doc format** (`en.md`):
**课程文档格式** (`en.md`)：

```markdown
# Lesson Title

> One-line motto — the core idea in one sentence.

## The Problem

Why does this matter? What can't you do without this?

## The Concept

Explain with diagrams, visuals, and intuition. Code comes later.

## Build It

Step-by-step implementation from scratch.

## Use It

Now use a real framework or library to do the same thing.

## Ship It

The prompt, skill, agent, or tool this lesson produces.

## Exercises

1. Exercise one
2. Exercise two
3. Challenge exercise
```

### 2. Add a Translation
2. 添加翻译

Create a new file in any lesson's `docs/` folder:
在任意课程的 `docs/` 文件夹中创建一个新文件：

```
docs/
├── en.md    (English — always required)
├── zh.md    (Chinese)
├── ja.md    (Japanese)
├── es.md    (Spanish)
├── hi.md    (Hindi)
└── ...
```

Keep the same structure as the English version. Translate content, not code.
保持与英文版相同的结构。翻译内容，不要翻译代码。

### 3. Add an Output
3. 添加输出

If a lesson should produce a reusable prompt, skill, agent, or MCP server:
如果某节课应产出可复用的 prompt、skill、agent 或 MCP server：

1. Create it in the lesson's `outputs/` folder --- 在该课程的 `outputs/` 文件夹中创建它
2. Add a reference in the top-level `outputs/` index --- 在顶层 `outputs/` 索引中添加引用

**Prompt format:**
**Prompt 格式：**

```markdown
---
name: prompt-name
description: What this prompt does
phase: 14
lesson: 01
---

[System prompt or template here]
```

**Skill format:**
**Skill 格式：**

```markdown
---
name: skill-name
description: What this skill teaches
version: 1.0.0
phase: 14
lesson: 01
tags: [agents, loops]
---

[Skill content here]
```

### 4. Fix Bugs or Improve Existing Lessons
4. 修复问题或改进现有课程

- Fix code that doesn't run --- 修复无法运行的代码
- Improve explanations --- 改进讲解
- Add better diagrams --- 添加更好的图表
- Update outdated information --- 更新过时的信息

### 5. Add Exercises or Projects
5. 添加练习或项目

More exercises and projects are always welcome, especially ones that connect multiple phases.
始终欢迎更多练习和项目，尤其是那些连接多个阶段的内容。

## Guidelines
指南

- **Code must run.** Every code file should execute without errors with the listed dependencies. --- **代码必须能运行。** 每个代码文件都应在列出的依赖下无错误执行。
- **No comments in code.** Code should be self-explanatory. Use the docs for explanation. --- **代码中不要写注释。** 代码应当自解释。用文档来说明。
- **Best language for the job.** Don't force Python where TypeScript or Rust is the better choice. --- **为任务选择最合适的语言。** 当 TypeScript 或 Rust 是更好的选择时，不要强行使用 Python。
- **Build from scratch first.** Always implement the concept from first principles before showing the framework version. --- **先从零开始构建。** 在展示框架版本之前，始终先从第一性原理实现这个概念。
- **Keep it practical.** Theory serves practice, not the other way around. --- **保持实用性。** 理论服务于实践，而不是反过来。
- **No AI slop.** Write like a human. Be direct. Cut filler. --- **不要 AI 垃圾文。** 像人一样写作。直接一点。删掉废话。

## Pull Request Process
Pull Request 流程

1. Fork the repository --- Fork 仓库
2. Create a feature branch (`git checkout -b add-lesson-phase3-gradient-descent`) --- 创建一个功能分支 (`git checkout -b add-lesson-phase3-gradient-descent`)
3. Make your changes --- 进行你的修改
4. Ensure all code runs --- 确保所有代码都能运行
5. Submit a pull request with a clear description --- 提交一个描述清晰的 pull request

## Code of Conduct
行为准则

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md). Be kind, be helpful, be constructive.
请参见 [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)。保持友善，乐于帮助，提出建设性意见。

## Style
风格

- Direct prose. Cut filler. Match the manual's tone, not marketing copy. --- 行文直接。删掉废话。与手册的语气保持一致，而不是像营销文案。
- No decorative emojis in headings. Lang column emoji flags are the one --- 标题中不要使用装饰性表情符号。Lang 列中的旗帜表情符号是唯一的
  exception and only because the parser maps them.
例外，而且仅仅因为解析器会映射它们。
- Code runs as-is with the dependencies listed in the lesson. --- 代码在使用课程中列出的依赖项时可按原样运行。
- Build from scratch first, framework second. --- 先从零开始构建，框架放在第二位。
