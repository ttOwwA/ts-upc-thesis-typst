// ============================================================
// lib/headfoot.typ: 页眉页脚辅助函数
// 供主题按需调用，本身不注册全局 show 规则
// ============================================================

// 辅助函数：生成标准页眉（左右文本 + 下划线）
#let header-content(left-text: none, right-text: none, show-line: true) = {
  let sep = if show-line {
    line(length: 100%, stroke: 0.4pt)
  } else {
    none
  }

  stack(
    dir: ttb,
    spacing: 0.3em,
    if left-text != none or right-text != none {
      grid(
        columns: (1fr, 1fr),
        align(left, text(size: 10.5pt, left-text)),
        align(right, text(size: 10.5pt, right-text)),
      )
    },
    sep,
  )
}

// 辅助函数：生成居中页码页脚
#let footer-content(numbering-format: "1") = {
  context {
    let page-num = counter(page).at(here()).first()
    align(center, text(size: 10.5pt, str(page-num)))
  }
}
