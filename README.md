# ts-upc-thesis-typst

> **免责声明**：本模板为个人开源项目，**非中国石油大学（华东）官方模板**。排版规范参考学校发布的《本科毕业设计（论文）撰写规范》制作，仅供学习交流使用。正式提交前请以学校官方提供的 Word/LaTeX 模板或教务处最新要求为准。

中国石油大学（华东）本科毕业设计（论文）Typst 模板，独立框架，开箱即用。

## 快速开始

```bash
git clone https://github.com/ttOwwA/ts-upc-thesis-typst.git
cd ts-upc-thesis-typst
typst compile thesis-upc.typ thesis-upc.pdf
```

## 使用方式

直接编辑 `thesis-upc.typ` 中的元数据与摘要内容，并在 `chapters/upc/` 下撰写各章正文即可。模板已内置封面、原创性声明、授权书、目录、页眉页脚、按章编号等全部排版功能，无需额外依赖。

## 字体安装

编译依赖以下中文字体（至少其一）：

| 字体 | 用途 |
|------|------|
| SimSun / 宋体 | 正文 |
| SimHei / 黑体 | 标题 |
| KaiTi / 楷体 | 封面信息 |
| FangSong / 仿宋 | 封面信息 |
| Times New Roman | 西文正文（Windows）|
| DejaVu Serif | 西文正文（Linux）|

Linux/WSL 可安装 Fandol 作为中文字体回退：

```bash
sudo apt-get install fonts-fandol
```

**注意**：Windows 用户编译时可能会出现 `warning: unknown font family: deja vu serif`，此为无害警告（Times New Roman 已被正确使用）。若想去掉该警告，可临时删除 `lib/fonts.typ` 中的 `"DejaVu Serif"`。

## 项目结构

```
ts-upc-thesis-typst/
├── thesis-upc.typ              # 论文入口（修改元数据、摘要、结构顺序）
├── lib.typ                     # 核心入口（字体、排版、按章编号）
├── lib/
│   ├── fonts.typ               # 字体回退链
│   ├── chinese.typ             # 中文排版（行距、缩进、章节格式）
│   ├── utils.typ               # 字号常量与工具函数
│   ├── hyperref.typ            # 目录生成
│   └── ...
├── themes/upc/
│   ├── style.typ               # UPC 核心样式（页眉页脚/摘要/声明/目录/致谢）
│   ├── titlepage.typ           # 封面模板
│   ├── logo.pdf                # 校徽
│   └── ...
├── chapters/upc/               # 正文内容
│   ├── chapter1.typ ~ chapter5.typ
│   └── appendix.typ
├── literature/
│   └── literature-upc.bib      # 参考文献
└── README.md
```

## 许可证

MIT License
