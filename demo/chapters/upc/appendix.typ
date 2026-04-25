#import "../../../lib.typ": three-line-table
#import "../../../themes/upc/style.typ": appendix-section

#appendix-section("A")[
  == 附录 A 名词术语及缩略词

  OOP：Object-Oriented Programming，面向对象程序设计。GUI：Graphical User Interface，图形用户界面。

  附录中的插图、表格和公式同样建议使用标准环境自动生成编号。示例中，系统整体架构如图 @fig:appendix-arch 所示，核心函数说明见表 @tab:appendix-func，二次函数表达式见式 @eq:appendix-poly。

  #figure(
    image("../../img/example.pdf", width: 60%),
    caption: [系统整体架构图],
  ) <fig:appendix-arch>

  #figure(
    kind: table,
    caption: [核心函数说明表],
    three-line-table(
      columns: (auto, auto),
      header: (
        [函数名], [功能说明],
      ),
      [InitList], [初始化线性表],
      [InsertElem], [插入元素],
      [DeleteElem], [删除元素],
    )
  ) <tab:appendix-func>

  $ f(x)=a x^2+b x+c $ <eq:appendix-poly>
]

#pagebreak()

#appendix-section("B")[
  == 附录 B 线性表 Python 实现

  以下给出一种基于 Python 的简易单链表实现，涵盖插入、删除与遍历操作，供读者参考。

  ```python
  class Node:
      def __init__(self, data):
          self.data = data
          self.next = None

  class LinkedList:
      def __init__(self):
          self.head = None

      def append(self, data):
          new_node = Node(data)
          if not self.head:
              self.head = new_node
              return
          cur = self.head
          while cur.next:
              cur = cur.next
          cur.next = new_node

      def delete(self, key):
          cur = self.head
          prev = None
          while cur and cur.data != key:
              prev = cur
          cur = cur.next
          if not cur:
              return
          if prev:
              prev.next = cur.next
          else:
              self.head = cur.next

      def display(self):
          cur = self.head
          while cur:
              print(cur.data, end=" -> ")
              cur = cur.next
          print("None")

  # 示例用法
  lst = LinkedList()
  for x in [1, 2, 3, 4]:
      lst.append(x)
  lst.display()
  ```
]
