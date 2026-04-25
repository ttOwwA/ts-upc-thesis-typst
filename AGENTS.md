# AGENTS.md — ts-upc-thesis-typst

中国石油大学（华东）本科毕设论文 Typst 模板。

## 编译

```bash
typst compile demo/thesis-upc.typ demo/thesis-upc.pdf
```

开发示例入口为 `demo/thesis-upc.typ`，发布包入口为 `lib.typ`。

## 核心约束

### 严禁 LaTeX 语法
本仓库是 **Typst**，不是 LaTeX。字符串中的 `\ `、`\quad` 等不会变成空格，会原样输出为普通文本。
- 正确：`[题#h(1em)目]`、`[姓#h(2em)名]`、`"\u{2003}年\u{2003}月\u{2003}日"`
- 错误：`"题\quad 目"`、`"本\ 科\ 毕\ 业\ 设\ 计"`

### 每章必须独立分页
一级标题的 `show` 规则必须使用 `pagebreak()`（强制分页）。
- `pagebreak(weak: true)` 会跳过分页，导致各章连在一起。
- 同时存在于 `lib/chinese.typ` 和 `themes/upc/style.typ`，两处都要改。

### 按章编号：图/表/公式必须在 `lib.typ` 顶层设置
`set figure(numbering: ...)` 和 `set math.equation(numbering: ...)` 必须放在 `documentclass` 函数的顶层作用域（当前位于 `lib.typ` 中），不能放在嵌套的 `apply()` 函数内。否则 `numbering` 回调中的 `context` 不传播，导致编号失效。

对应地，计数器重置（`counter(figure.where(kind: image)).update(0)` / `counter(figure.where(kind: table)).update(0)` 等）放在 `lib.typ` 的 `show heading.where(level: 1)` 中，因为 `themes/upc/style.typ` 的同名规则会覆盖 `lib/chinese.typ` 的规则，若只在后者重置会失效。图片与表格使用独立的 kind-specific 计数器。

### 三线表续表
- **前提**：`themes/upc/style.typ` 中设置了 `show figure.where(kind: table): set block(breakable: true)`，确保 `figure` 包裹的 `table` 可以跨页分页。
- `three-line-table` 的 `continued` 参数（默认 `true`）控制跨页续表行为：
  - `continued: true`（默认）：表头跨页重复，并在续页**顶粗线上方**右对齐显示"续表X-X"（正文）或"续表A1"（附录）。
  - `continued: false`：表头不重复，适用于小型表格。
- 续表编号自动从 `counter(figure.where(kind: table))` 推断，无需手动传入。
- 续表标注字号 10pt，右对齐，与顶粗线之间保留 3pt 垂直间距。
- 首页表格的续表行为空行（高度最小化），不占用视觉空间。
- `columns` 为 `auto` 时，列数从 `header` 推断（假设单行表头）。多行表头请显式指定 `columns`。
- 续表逻辑基于 `state("_tltable-start-page")` 记录表格起始页号，通过 `context` 比较当前页与起始页判断是否为续页。

### 图片引用路径
`demo/chapters/upc/` 中的文件引用 `demo/img/` 下的图片，必须使用 `../../img/xxx.pdf`，不能写 `./img/xxx.pdf`。

## 字体

编译依赖以下中文字体（至少其一）：
- SimSun / NSimSun（正文宋体）
- SimHei（标题黑体）
- KaiTi（楷体）
- FangSong（仿宋）
- Times New Roman / DejaVu Serif（西文）

Linux/WSL 回退：
```bash
sudo apt-get install fonts-fandol
```

回退链定义在 `lib/fonts.typ`。

**平台差异说明**：
- **Windows** 自带 Times New Roman、SimSun、SimHei、KaiTi、FangSong，但通常没有 DejaVu Serif。编译时可能出现 `warning: unknown font family: deja vu serif`，此为无害警告（Times New Roman 已被正确使用）。若想去掉警告，可临时删除 `lib/fonts.typ` 中的 `"DejaVu Serif"`。
- **Linux** 通常自带 DejaVu Serif，但可能没有 Times New Roman。若使用 Fandol 作为中文字体回退，则同样可能出现关于 Times New Roman 的无害警告。

## 页眉页脚

- **frontmatter**（封面、声明、摘要、目录）：居中"中国石油大学（华东）本科毕业设计 (论文)"，楷体，下划线 `line()`，无页脚。
- **mainmatter**（正文）：居中"第 X 章  Title"，楷体，下划线，居中页码（宋体）。
- 切换函数：`setup-mainmatter`（位于 `themes/upc/style.typ`），必须以 show rule 形式使用：`#show: setup-mainmatter`。
- 附录使用 `appendix-env` 环境（位于 `themes/upc/style.typ`），自动处理附录字母编号（A/B/C）及图/表/公式的独立编号（图A1、表B2、式(B3)）。
- 致谢、参考文献的页眉手动设为 `frontmatter-header`，页脚设为 `footer-content`。

## 论文结构顺序

`demo/thesis-upc.typ` / `template/thesis.typ` 中的顺序必须固定：
封面 → 原创性声明 + 授权书（同一页） → 中文摘要 → 英文摘要 → 目录 → 正文（`#show: setup-mainmatter` 后 `#include chapters`）→ 致谢 → 参考文献 → 附录

致谢、参考文献、附录使用 `heading(level: 1, numbering: none, outlined: true)` 加入目录。

## 目录样式

- 目录标题居中，outline 的 `indent: 0pt`（在 `lib/hyperref.typ` 中设置，避免与自定义缩进叠加）。
- 目录条目有 `repeat[.]` 引导线，一级标题无缩进，二级缩进 `2em`，三级 `4em`。

## 开发工作流

- 模板开发可直接编译 `demo/thesis-upc.typ`。
- 作为独立 Typst 包，可直接复制本仓库或发布到 Typst Universe 使用。
- **修改后的人工检查**：涉及图表编号、caption 位置、页眉页脚、续表、目录层级等视觉效果的修改，编译后请务必人工查看 PDF 确认效果，不要仅依赖编译通过。

## 关键文件映射

| 用途 | 文件 |
|------|------|
| 用途 | 文件 |
|------|------|
| 包入口（Typst Universe） | `lib.typ` |
| 开发示例论文 | `demo/thesis-upc.typ` |
| 用户模板（Typst Universe） | `template/thesis.typ` |
| 封面 | `themes/upc/titlepage.typ` |
| 核心样式（页眉/页脚/章节/目录/摘要/声明） | `themes/upc/style.typ` |
| 按章编号 + 计数器重置 | `lib.typ` |
| 中文字号/行距/章节格式 | `lib/chinese.typ` |
| 三线表续表/字号常量/工具函数 | `lib/utils.typ` |
| 字体回退链 | `lib/fonts.typ` |
| 目录生成 | `lib/hyperref.typ` |
| 开发示例参考文献 | `demo/literature/literature-upc.bib` |
| 开发正文章节 | `demo/chapters/upc/chapter{1..5}.typ` |
| 开发附录 | `demo/chapters/upc/appendix.typ` |
| 校徽 | `themes/upc/logo.pdf` |
