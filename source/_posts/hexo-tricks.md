---
title: hexo-tricks
comments: true
categories:
  - Tech
tags:
  - Tech
abbrlink: a9f2141
date: 2018-06-16 17:11:23
updated: 2019-04-25 10:25:33
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

(2019-04-23 13:04:45)
修改`sidebar.swig`和`header.swig`实现调用[academicons](https://jpswalsh.github.io/academicons/)中提供的GoogleScholar和ResearchGate的icons。
swig似乎采用的是javascrip的就去，这两种都不会用，勉强可以看懂。

(2019-04-24 10:19:31)
迁移到VPS上，通过Cloudflare实现flexiable https，需要自己配置合适的ssl，否则无法使用full模型连接。
博客地址改到/blog/下，预期/news/给其它网站。

(2019-04-25 10:20:59)
通过下面这两种模型来添加图片，第一种可控制大小，第二种不可以，都利用了{% asset_path FPKE_history.png%}来获得图片url，第二种中通过`< >`使变成字符串：
```markdown
<img src="{% asset_path FPKE_history.png%}" width="80%" title="caption ok?">
![description](<{% asset_path FPKE_history.png%}> "Optional title")
```