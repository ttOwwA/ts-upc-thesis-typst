// ============================================================
// thesis-upc.typ: UPC 论文入口
// 中国石油大学（华东）本科毕业设计论文
// ============================================================

#import "lib.typ": documentclass, make-outline
#import "themes/upc/style.typ": (
  apply as theme-apply,
  setup-mainmatter,
  frontmatter-header,
  mainmatter-header,
  footer-content,
  upcabstractcn,
  upcabstracten,
  upcacknowledgements,
  upcoriginality,
  upclicense,
  appendix-env,
  appendix-section,
)
#import "themes/upc/titlepage.typ": titlepage

#show: documentclass.with(
  theme: theme-apply.with(
    title: "线性表的设计和实现",
    author: "",
    advisor: "",
    institute: "",
    university: "中国石油大学（华东）",
  ),
)

// ---- 封面 ----
#titlepage(
  title: "线性表的设计和实现",
  subtitle: "基于C++ Builder 6.0的实现",
  author: "",
  student-id: "",
  college: "",
  major: "",
  advisor: "",
  date: "",
)

// ---- 原创性声明与授权书（同一页） ----
#set page(header: none, footer: none)
#upcoriginality(title: "线性表的设计和实现")
#upclicense()
#pagebreak()

// ---- 中文摘要 ----
#upcabstractcn(
  keywords: ("数据结构", "面向对象", "可视化", "算法"),
  cn-title: "线性表的设计和实现",
  cn-subtitle: "基于C++ Builder 6.0的实现",
)[
  数据结构算法设计和演示（C++）树和查找是在面向对象思想和技术的指导下，采用面向对象的编程语言（C++）和面向对象的编程工具（Borland C++ Builder 6.0）开发出来的小型应用程序。它的功能主要是将数据结构中链表、栈、队列、树、查找、图和排序部分的典型算法和数据结构用面向对象的方法封装成类，并通过类的对外接口和对象之间的消息传递来实现这些算法，同时利用 C++ Builder 6.0 中丰富的控件资源和系统资源对算法实现过程的流程和特性加以动态的演示，从而起到在数据结构教学中帮助理解、辅助教学和自我学习的作用。
]

// ---- 英文摘要 ----
#upcabstracten(
  keywords: ("data structure", "object-oriented", "visualization", "algorithm"),
  en-title: "The design and implementation of the linear form",
  en-subtitle: "Based on C++ Builder 6.0",
)[
  This paper introduces a small application program developed based on object-oriented thinking and technology, using C++ programming language and Borland C++ Builder 6.0 development tool. It encapsulates typical algorithms and data structures of linear lists, stacks, queues, trees, searching, graphs and sorting in data structure into classes by object-oriented method. The algorithms are realized through class interfaces and message passing between objects. Meanwhile, it dynamically demonstrates the process and characteristics of algorithm implementation with rich controls and system resources, which helps students understand data structure knowledge and assists teaching and self-learning.
]

// ---- 目录 ----
#make-outline(title-override: [目#h(1em)录])

// ---- 正文 ----
#show: setup-mainmatter

#include "chapters/upc/chapter1.typ"
#include "chapters/upc/chapter2.typ"
#include "chapters/upc/chapter3.typ"
#include "chapters/upc/chapter4.typ"
#include "chapters/upc/chapter5.typ"

// ---- 致谢 ----
#upcacknowledgements[
  大学四年的学习生活即将结束，在此，我要感谢所有曾经教导过我的老师和关心过我的同学，他们在我成长过程中给予了我很大的帮助。本文能够成功地完成，要特别感谢我的导师 XXX 教授的关怀和教导。

  感谢实验室的师兄师姐在课题研究过程中给予的帮助和建议，感谢我的家人和朋友一直以来的支持和鼓励。
]

// ---- 参考文献 ----
#set page(header: frontmatter-header, footer: footer-content)
#bibliography("literature/literature-upc.bib", style: "gb-7714-2015-numeric", title: [参考文献])

// ---- 附录 ----
#set page(header: frontmatter-header, footer: footer-content)
#heading(level: 1, numbering: none, outlined: true)[附#h(1em)录]
#appendix-env[
  #include "chapters/upc/appendix.typ"
]
