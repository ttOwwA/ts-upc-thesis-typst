# 从零开始写论文：modern-upc-thesis 小白上手教程

> 本教程面向从未接触过 Typst、甚至从未用过代码编辑器的同学。不用懂编程，不用装 Git，跟着步骤做就行。

---

## 写在前面：为什么要本地编辑？

Typst 有在线版，直接在浏览器里写也很方便。但本地编辑有一些不可替代的优势：

| 优势 | 说明 |
|------|------|
| 实时预览 | 修改一行，右侧立即刷新排版效果，告别改完等编译的痛苦 |
| 离线可用 | 不依赖网络，在图书馆、实验室随时随地写论文 |
| 文件安全 | 论文文件完全保存在本地电脑上，不用担心云端服务宕机或数据丢失 |
| AI 辅助写作 | 本地编辑器（如 TRAE、Claude Code、VS Code + Copilot）可以集成 AI，帮你润色语句、检查逻辑、生成摘要 |

---

## 关于 AI 辅助写作的提醒

本模板推荐使用集成了 AI 能力的编辑器（如 TRAE、VS Code 配合 AI 插件）来辅助论文写作。但请注意：

> AI 适合帮你润色语言、检查语法、梳理论证结构，或在你卡住时提供思路启发。但论文中核心的实验设计、数据分析、研究思路、创新观点和结论必须是你自己的智力成果。将毕设全权交给 AI 代写不仅违反学术诚信，也失去了本科毕业设计培养独立科研能力的根本意义。

---

## 你属于哪类用户？

| 你的情况 | 推荐路线 | 预计时间 |
|---------|---------|---------|
| 从来没用过 VSCode / TRAE，也没接触过 LaTeX | [场景 A：完全小白（推荐 TRAE）](#场景-a完全小白推荐-trae) | 15 分钟 |
| 用过 VSCode 写代码或做笔记 | [场景 B：VSCode 老用户](#场景-bvscode-老用户) | 10 分钟 |
| 之前用 LaTeX 写过论文 | [场景 C：LaTeX 迁移用户](#场景-clatex-迁移用户) | 10 分钟 |

如果不同场景中有重复的步骤，会跳转到统一的 [基础编辑指南](#基础编辑指南) 章节，避免啰嗦。

---

## 场景 A：完全小白（推荐 TRAE）

假设你从没装过 VSCode，不知道 LaTeX 是什么，只想快点开始写论文。

### 步骤 1：下载论文模板

不需要安装 Git，直接下载 ZIP 压缩包：

1. 用浏览器访问：`https://github.com/ttOwwA/ts-upc-thesis-typst/archive/refs/heads/master.zip`
2. 浏览器会自动下载一个名为 `ts-upc-thesis-typst-master.zip` 的文件
3. 下载完成后，解压到你电脑上的一个固定位置，例如 `D:\论文\ts-upc-thesis-typst-master\`

这个文件夹里包含了你写论文所需的一切：模板文件、示例图片、参考文献格式等。

### 步骤 2：安装 TRAE

TRAE 是一款 AI 原生 IDE，对中文支持很好，写论文时可以让 AI 帮你润色语言、检查格式。官网地址：https://www.trae.cn/

下载对应系统的安装包，双击运行，一路点击下一步完成安装。首次启动时选择简体中文界面。

### 步骤 3：安装 Typst 插件（Tinymist）

为了让 TRAE 认识 Typst 文件并提供实时预览，需要安装一个插件：

1. 打开 TRAE，点击左侧活动栏的扩展图标（四个方块）
2. 在搜索框中输入 `Tinymist`
3. 找到 **Tinymist Typst**，点击安装

注意：不要安装 `Typst LSP` 和 `Typst Preview` 这两个旧插件，它们已被废弃，会导致冲突。

### 步骤 4：打开论文项目

1. 在 TRAE 中，点击顶部菜单 **文件 → 打开文件夹...**（或按 `Ctrl + K Ctrl + O`）
2. 选中你刚才解压的 `ts-upc-thesis-typst-master` 文件夹，点击选择文件夹
3. 左侧的文件树中会显示项目结构

你需要关注的关键文件：

```
ts-upc-thesis-typst-master/
├── template/
│   ├── thesis.typ      <- 你的论文主文件
│   ├── ref.bib         <- 参考文献库
│   └── images/         <- 放图片的文件夹
├── demo/               <- 示例论文（可以参考排版效果）
└── docs/               <- 你正在看的教程
```

### 步骤 5：开启实时预览并编辑论文

现在进入 [基础编辑指南](#基础编辑指南)，学习如何修改论文内容、插入图片表格、导出 PDF。

等你看完基础编辑指南、已经能正常写论文之后，如果你希望利用 AI 提高效率，可以参考 [AI 辅助写作提示](#ai-辅助写作提示)。

---

## 场景 B：VSCode 老用户

假设你已经装过 VSCode，用过它写代码或做 Markdown 笔记。

### 步骤 1：下载模板

同 [场景 A 步骤 1](#步骤-1下载论文模板)，直接下载 ZIP 并解压。

### 步骤 2：安装 Tinymist 插件

1. 打开 VSCode，进入扩展商店
2. 搜索 `Tinymist`，安装 **Tinymist Typst**
3. 如果之前装过 `Typst LSP` 或 `Typst Preview`，请先卸载它们，避免冲突

### 步骤 3：打开项目并预览

1. `文件 → 打开文件夹...`，选择解压后的 `ts-upc-thesis-typst-master`
2. 打开 `template/thesis.typ`
3. 按 `Ctrl + K V` 开启右侧实时预览

### 步骤 4：编辑论文

进入 [基础编辑指南](#基础编辑指南) 学习具体编辑方法。

如果你希望获得 AI 辅助写作体验，除了 TRAE 之外，也可以选择 Claude Code、VS Code + GitHub Copilot / Continue 插件、Codex CLI 等工具，根据个人喜好选择即可。

---

## 场景 C：LaTeX 迁移用户

假设你之前用 LaTeX 写过论文，现在想试试 Typst。

### 为什么要从 LaTeX 迁移到 Typst？

| 对比项 | LaTeX | Typst |
|-------|-------|-------|
| 编译速度 | 慢（需要多次编译） | 秒级编译 |
| 实时预览 | 需额外配置 | 内置实时预览 |
| 语法复杂度 | 宏包多、命令多、容易冲突 | 语法简洁直观 |
| 错误提示 | 晦涩难懂的宏包报错 | 清晰的行号定位 |
| 中文支持 | 需配置 CTeX / XeLaTeX | 开箱即用 |

### 关键概念对照

| LaTeX | Typst | 说明 |
|-------|-------|------|
| `\section{}` | `= 标题` | 一级标题，一个 `=` |
| `\subsection{}` | `== 标题` | 二级标题，两个 `=` |
| `\textbf{}` | `*粗体*` | 星号包裹 |
| `\textit{}` | `_斜体_` | 下划线包裹 |
| `\begin{equation}` | `$ 公式 $` | 行间公式自动编号 |
| `\cite{}` | `[@标签]` | 引用参考文献 |
| `\begin{figure}` | `#figure()` | 图片环境 |
| `\begin{table}` | `#figure(kind: table)` | 表格环境 |
| `.tex` 文件 | `.typ` 文件 | 源文件扩展名 |
| `main.tex` | `thesis.typ` | 主入口文件 |

### 上手步骤

1. 下载 ZIP 并解压（同场景 A）
2. 安装 VSCode 或 TRAE + Tinymist 插件
3. 打开 `template/thesis.typ`，阅读其中的示例结构和注释
4. 将你的 LaTeX 内容翻译为 Typst 语法，大部分情况下是直接替换命令为更简洁的标记
5. 按 `Ctrl + K V` 实时观察排版效果

你会发现 Typst 的语法比 LaTeX 直观得多，不再需要记忆大量宏包和命令。

---

## 基础编辑指南

> 适用场景：已安装好编辑器（TRAE 或 VSCode）和 Tinymist 插件，打开了 `template/thesis.typ`，并按 `Ctrl + K V` 开启了右侧实时预览窗口。

### 认识 thesis.typ 的结构

打开 `thesis.typ` 后，你会看到一篇示例论文。它的结构大致如下（从上到下）：

```
导入模板 -> 设置论文信息 -> 封面 -> 原创性声明 -> 中文摘要 -> 英文摘要
-> 目录 -> 正文（各章节）-> 致谢 -> 参考文献 -> 附录
```

你只需要修改其中的内容，不需要理解每行代码的含义。

### 修改论文信息

在文件开头找到这段代码：

```typst
#show: documentclass.with(
  theme: theme-apply.with(
    title: "论文标题",
    author: "作者姓名",
    advisor: "导师姓名",
    institute: "学院名称",
    university: "中国石油大学（华东）",
  ),
)
```

把双引号里的内容改成你的真实信息即可。

再往下找到封面部分：

```typst
#titlepage(
  title: "论文标题",
  subtitle: "副标题（可选）",
  author: "作者姓名",
  student-id: "学号",
  college: "学院",
  major: "专业",
  advisor: "导师姓名",
  date: "2026年6月20日",
)
```

同样，把引号里的占位符替换为你的真实信息。副标题如果没有，可以删掉那一行。

### 修改摘要

找到 `upcabstractcn` 和 `upcabstracten` 这两块：

```typst
#upcabstractcn(
  keywords: ("关键词1", "关键词2", "关键词3"),
  cn-title: "论文标题",
) [
  在此处填写中文摘要内容。摘要应概括论文的研究背景、主要方法、核心结果与结论，字数一般在300–500字左右。
]
```

把 `keywords` 里的内容换成你的关键词，把方括号 `[...]` 里的文字换成你的真实摘要。

英文摘要同理。

### 写正文章节

在 `#show: setup-mainmatter` 之后就是正文区域。你会看到：

```typst
= 引言

在此处撰写第一章「引言」。介绍研究背景、研究意义、国内外研究现状以及本文的主要研究内容与组织结构。
```

`= 引言` 表示这是一级标题（相当于 LaTeX 的 `\section`）。你在它下面直接打字就是正文内容。

写第二章就把 `= 引言` 改成 `= 你的第二章标题`，下面的文字换成你的内容。

### 常用格式语法

| 效果 | 写法 | 示例 |
|------|------|------|
| 一级标题 | `= 标题` | `= 引言` |
| 二级标题 | `== 标题` | `== 研究背景` |
| 三级标题 | `=== 标题` | `=== 实验方法` |
| 粗体 | `*文字*` | `*重要结论*` |
| 斜体 | `_文字_` | `_术语定义_` |
| 行内公式 | `$公式$` | `$E = mc^2$` |
| 编号公式 | `$公式$ <标签>` | `$E = mc^2$ <eq:emc>` |
| 引用公式 | `@标签` | `@eq:emc` |
| 引用参考文献 | `[@标签]` | `[@蒋有绪1998]` |

### 插入图片

1. 把你的图片文件（支持 `.png`、`.jpg`、`.pdf`）放入 `template/images/` 文件夹
2. 在 `thesis.typ` 中插入：

```typst
#figure(
  image("images/你的图片.png", width: 60%),
  caption: [图片标题],
) <fig:logo>
```

3. 在正文中引用：`@fig:logo`

### 插入表格（三线表）

本模板提供了 `three-line-table` 函数，推荐用它来排版三线表：

```typst
#figure(
  kind: table,
  caption: [实验数据示例],
  three-line-table(
    columns: 4,
    header: (
      hcell("参数"),
      hcell("数值"),
      hcell("单位"),
      hcell("备注"),
    ),
    [功率密度], [6.37], [W/cm²], [最优值],
    [扫描速度], [12], [mm/s], [标准值],
  ),
) <tab:example>
```

在正文中引用：`@tab:example`

### 添加参考文献

1. 打开 `template/ref.bib` 文件
2. 按照 GB/T 7714 格式添加文献条目（可参考文件中已有的示例）
3. 在 `thesis.typ` 正文中用 `[@标签]` 引用
4. 模板会自动处理编号和排版

### 导出 PDF

写完论文后，导出 PDF 交给导师：

1. 按 `Ctrl + Shift + P` 打开命令面板
2. 输入 `Tinymist: Export the current document as PDF`
3. 选择后，PDF 会生成在 `template/` 文件夹下，文件名为 `thesis.pdf`

---

## AI 辅助写作提示

> 适用场景：你已经能熟练使用 Typst 编辑论文，希望进一步提高写作效率。

如果你在 TRAE 中写作，可以按 `Ctrl + L` 打开 AI 侧边栏，向 AI 提出以下类型的请求：

- **润色语句**：选中一段文字，让 AI 帮你改成更学术化的表达
- **检查逻辑**：写完一章后，让 AI 检查论证是否完整、有没有遗漏关键点
- **翻译摘要**：让 AI 根据中文摘要生成英文摘要初稿，你再修改
- **格式咨询**：问 "Typst 中如何插入一个跨页的三线表？"

如果你使用 VSCode，也可以搭配 Claude Code、GitHub Copilot、Continue 插件或 Codex CLI 等工具获得类似的 AI 辅助体验。

再次提醒：AI 给出的内容请务必亲自审核，确保学术观点、实验数据和结论的真实性与准确性。

---

## 字体说明（Windows 用户通常无需操作）

本模板在 Windows 上会自动使用系统自带的字体（宋体、黑体、楷体、仿宋），无需额外安装任何字体。

如果你在 TRAE / VSCode 的预览窗口中看到字体显示正常（没有方框或乱码），就说明字体配置已经成功了。

只有在以下情况才需要手动处理字体：
- 你在 Linux / WSL / macOS 上运行，且系统没有安装中文字体
- 你在 Typst Web App（在线版）中使用

这两种情况下，请将 [Fandol 字体](https://mirrors.ctan.org/fonts/fandol.zip) 下载并解压到项目根目录，Typst 会自动识别并使用它们。

Fandol 是一款开源中文字体，字形与 Windows 默认中文字体非常接近，作为回退字体效果良好。

---

## 常见问题

### Q1：预览窗口显示 "unknown font family" 警告，怎么办？

这是正常的。模板定义了一个字体回退链，如果你的系统没有列表中的某些字体，Typst 会发出警告但会自动使用下一个可用字体，不会影响最终效果。

Windows 用户常见的是 `unknown font family: deja vu serif`，这是因为 Windows 没有 DejaVu Serif 字体，但 Times New Roman 会被正确替代，可以安全忽略。

---

## 进阶资源

- [Typst 官方文档](https://typst.app/docs/) —— 最权威、最全面的语法参考
- [Typst 中文社区导航](https://typst.dev/guide/) —— 中文用户常见问题与技巧
- [本模板的 GitHub 仓库](https://github.com/ttOwwA/ts-upc-thesis-typst) —— 查看最新更新、提交 Issue

---

> 如果在使用过程中遇到问题，欢迎在本仓库的 [GitHub Issues](https://github.com/ttOwwA/ts-upc-thesis-typst/issues) 中提问。祝你论文写作顺利！
