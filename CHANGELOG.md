# Changelog
更新日志

What's new in the curriculum. Most recent first.
课程中的新增内容。最新的排在最前面。

Format loosely follows [Keep a Changelog](https://keepachangelog.com/). Each entry names the phase, lesson, and what changed, so learners can jump straight to the delta.
格式大致遵循 [Keep a Changelog](https://keepachangelog.com/)。每条记录都会注明阶段、课程和变更内容，方便学习者直接跳到差异处。

## [Unreleased]
[未发布]

### Added
新增
- `scripts/scaffold-lesson.sh` — scaffolder that creates `phases/NN-phase/NN-lesson/` with the full folder structure and a `docs/en.md` skeleton prefilled from `LESSON_TEMPLATE.md`. --- `scripts/scaffold-lesson.sh` — 用于创建 `phases/NN-phase/NN-lesson/` 的脚手架，包含完整的文件夹结构，以及一个根据 `LESSON_TEMPLATE.md` 预填充的 `docs/en.md` 骨架。
- `.github/PULL_REQUEST_TEMPLATE.md` — contributor checklist (code runs, no code comments, built-from-scratch-first, atomic per-lesson commit, markdown-link ROADMAP row). --- `.github/PULL_REQUEST_TEMPLATE.md` — 贡献者检查清单（代码可运行、无代码注释、优先从零开始构建、每课一个原子提交、为 ROADMAP 中对应行添加 Markdown 链接）。
- `.github/ISSUE_TEMPLATE/bug_report.md` and `new_lesson_proposal.md` — structured intake for bug reports and lesson pitches. --- `.github/ISSUE_TEMPLATE/bug_report.md` and `new_lesson_proposal.md` — 用于 bug 报告和课程提案的结构化提交流程。
- This `CHANGELOG.md`. --- 此 `CHANGELOG.md` 文件。

## 2026-04 — Phase 4: Computer Vision complete
2026-04 — 第 4 阶段：计算机视觉完成

### Added
新增
- All 28 Phase 4 lessons, covering image fundamentals through multi-modal vision (VLMs, 3D, video, self-supervised). --- 第 4 阶段全部 28 课，涵盖从图像基础到多模态视觉（VLMs、3D、视频、自监督）。
- Phase 4 rows in `ROADMAP.md` linked as markdown to the lesson folders, so the website surfaces them. --- `ROADMAP.md` 中第 4 阶段的各行已用 Markdown 链接到对应课程文件夹，因此网站会展示它们。

### Fixed
修复
- Phase 4 precision pass across 15+ lessons: --- 对第 4 阶段 15+ 课进行了精度修订：
  - `phase-4/02`: shape calculator specifies RF/stride handling for adaptive pool, flatten, and linear. --- `phase-4/02`：形状计算器明确了 adaptive pool、flatten 和 linear 的 RF/stride 处理方式。
  - `phase-4/03`: backbone selector description lists all covered families; head guidance added for OCR, medical, industrial. --- `phase-4/03`：backbone 选择器的说明列出了所有覆盖的家族；新增了面向 OCR、医疗和工业场景的 head 指导。
  - `phase-4/04`: classification diagnostics use quantitative thresholds per failure mode; `n/a` declared for undefined metrics; guard for fewer than 3 classes. --- `phase-4/04`：分类诊断为每种失败模式使用定量阈值；为未定义指标明确标注 `n/a`；增加了少于 3 个类别时的保护。
  - `phase-4/06`: detection metric reader uses `AP@0.5` (not `mAP@0.5`); per-class recall declared optional; anchor designer clarifies stride truncation and single-anchor-per-level path. --- `phase-4/06`：检测指标读取器使用 `AP@0.5`（而非 `mAP@0.5`）；明确每类 recall 为可选项；anchor 设计器澄清了 stride 截断和每层单 anchor 路径。
  - `phase-4/10`: sampler picker declares `unet_forward_ms` as an input; ControlNet guard promoted to rule 0. --- `phase-4/10`：sampler 选择器将 `unet_forward_ms` 声明为输入；ControlNet 保护规则提升为规则 0。
  - `phase-4/14`: ViT inspector aligned with refusal rule — port attempts are audited, not endorsed. --- `phase-4/14`：ViT 检查器与拒绝规则保持一致——迁移尝试会被审计，而不是被认可。
  - `phase-4/24`: open-vocab stack picker has explicit rule precedence and license-filter semantics; concept designer resolves step-5/rule-80 conflict. --- `phase-4/24`：open-vocab 栈选择器具有明确的规则优先级和 license-filter 语义；concept 设计器解决了 step-5/rule-80 冲突。
  - `phase-4/25`: VLM docs `_merge` raises descriptive `ValueError` on placeholder mismatch; CMER normalises internally. --- `phase-4/25`：VLM 文档中的 `_merge` 在占位符不匹配时会抛出带说明的 `ValueError`；CMER 在内部执行归一化。
  - `phase-4/27`: `synthetic_frames` clips GT boxes to frame H/W. --- `phase-4/27`：`synthetic_frames` 会将 GT 框裁剪到帧的 H/W 范围内。
  - `phase-4/28`: `rope_3d` validates dim split; dropped unused `F` import from DiT block example. --- `phase-4/28`：`rope_3d` 验证维度拆分；从 DiT 块示例中移除了未使用的 `F` 导入。

## 2026-Q1 and earlier
2026-Q1 及更早

### Added
已添加
- Phase 0 (Setup & Tooling): all 12 lessons. --- 第 0 阶段（环境搭建与工具链）：全部 12 课。
- Phase 1 (Math Foundations): all 22 lessons. --- 第 1 阶段（数学基础）：全部 22 课。
- Phase 2 (ML Fundamentals): all 18 lessons. --- 第 2 阶段（ML 基础）：全部 18 课。
- Phase 3 (Deep Learning Core): core lessons through perceptron, backprop, optimizers. --- 第 3 阶段（深度学习核心）：涵盖感知机、反向传播和优化器的核心课程。
- Built-in Claude Code skills: `find-your-level` (placement quiz) and `check-understanding` (per-phase quiz). --- 内置 Claude Code 技能：`find-your-level`（分级测验）和 `check-understanding`（分阶段测验）。
- Website at `aiengineeringfromscratch.com`: catalog, per-lesson pages, roadmap, 277-term glossary. --- `aiengineeringfromscratch.com` 网站：目录、每课页面、路线图、含 277 个词条的术语表。
- Initial scaffolding for all 20 phases (`phases/00-*` through `phases/19-*`). --- 全部 20 个阶段的初始脚手架（`phases/00-*` 到 `phases/19-*`）。
- `LESSON_TEMPLATE.md`, `CONTRIBUTING.md`, `ROADMAP.md`, `README.md`. --- `LESSON_TEMPLATE.md`、`CONTRIBUTING.md`、`ROADMAP.md`、`README.md`。

[Unreleased]: https://github.com/rohitg00/ai-engineering-from-scratch/compare/HEAD...HEAD
[未发布]: https://github.com/rohitg00/ai-engineering-from-scratch/compare/HEAD...HEAD
