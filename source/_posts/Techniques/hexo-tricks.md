---
title: hexo-tricks
comments: true
categories:
  - Tech
tags:
  - Tech
date: 2018-06-16 17:11:23
updated: 2018-06-28 12:43:53
---

(2016-06-16)
设置 marked 中的 breaks 为 false 可以使用空行来换行。
符合我写作 latex 的习惯。
应该是使用了 hexo-render-marked 插件。

(2016-06-21)
post 的 toc 全部展开：https://github.com/iissnan/hexo-theme-next/issues/531

(2018-06-28 12:43:48)
使用 hexo-renderer-kramed 渲染 markdown，可以在 mathJax 中直接使用下划线，但是仍然无法使用 ^*[参考](https://dxj1113.github.io/2017/07/14/%E5%A4%84%E7%90%86hexo%E4%B8%8Emathjax%E5%85%BC%E5%AE%B9%E9%97%AE%E9%A2%98/)。
使用较少，仅在表示最优解时会用到，在写 latex 时可以批量处理。
另一种方法是修改忽略掉 markdown 对 \\ \* 等的转义，我不需要这么复杂，忽略这种方法。