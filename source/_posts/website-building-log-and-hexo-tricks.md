---
title: Website Building Log and Hexo Tricks
comments: true
categories:
  - Tech
tags:
  - Tech
  - Log
abbrlink: a9f2141
date: 2018-06-16 17:11:24
updated: 2019-04-26 17:24:10
---


<!-- more -->

# to-do list
- [] 添加checkbox, GMF
- [ ] 调整表格的对齐形式
- [ ] 调整行距
- [ ] 添加相册，学习资源
  - https://dlovexj.cn/gallery/
- 不错的主题
  - https://blog.zhangruipeng.me/hexo-theme-icarus/
  - https://github.com/Mrminfive/hexo-theme-skapp 支持多作者
  - https://itimetraveler.github.io/hexo-theme-hiero/
  - https://github.com/iTimeTraveler/hexo-theme-hipaper
  - 

# Attention

`abbrlink` is based on `title` but not ~~`date`~~, so, try to keep title fixed.

Use this line to include image: 
`
<img src="{% asset_path FPKE_history.png%}" width="400px" title="caption ok?">
`

# log

(2019-04-30 17:18:51)
为了实现GFM形式的换行，改为使用hexo-render-markdown-it。
顺便启用了hexo的pangu插件来解决中英混排的空格问题。

(2019-04-28 12:18:16)
改为KaTeX渲染数学公式，解决了`\bm`的支持，而且速度更快。  
使用`markdown_it_plus`来配合`KaTeX`。

(2019-04-26 18:29:33)
添加如下一段代码到NexT的`sidebar.swig`实现标签云，对源代码进行了小修正，使用`url_for()`获得相对地址。
```swig
{# PH: add to use tag cloud #}
{% if site.tags.length > 1 %}
  <script type="text/javascript" charset="utf-8" src="{{ url_for('/js/tagcloud.js') }}"></script>
  <script type="text/javascript" charset="utf-8" src="{{ url_for('/js/tagcanvas.js') }}"></script>
  <div class="widget-wrap">
      {#<h3 class="widget-title">Tag Cloud</h3>#}
      <div id="myCanvasContainer" class="widget tagcloud">
          <canvas width="240" height="180" id="resCanvas" style="width=100%">
              {{ list_tags() }}
          </canvas>
      </div>
  </div>  
{% endif %}
```


(2019-04-25 10:20:59)
通过下面这两种模型来添加图片，第一种可控制大小，第二种不可以，都利用了{% asset_path FPKE_history.png%}来获得图片url，第二种中通过`< >`使变成字符串：
```markdown
<img src="{% asset_path FPKE_history.png%}" width="80%" title="caption ok?">
<img src="{% asset_path FPKE_history.png%}" width="400px" title="caption ok?">
![description](<{% asset_path FPKE_history.png%}> "Optional title")
```

(2019-04-24 10:19:31)
迁移到VPS上，通过Cloudflare实现flexiable https，需要自己配置合适的ssl，否则无法使用full模型连接。
博客地址改到/blog/下，预期/news/给其它网站。

(2019-04-23 13:04:45)
修改`sidebar.swig`和`header.swig`实现调用[academicons](https://jpswalsh.github.io/academicons/)中提供的GoogleScholar和ResearchGate的icons。
swig似乎采用的是javascrip的就去，这两种都不会用，勉强可以看懂。

(2018-06-28 12:43:48)
使用 hexo-renderer-kramed 渲染 markdown，可以在 mathJax 中直接使用下划线，但是仍然无法使用 ^*[参考](https://dxj1113.github.io/2017/07/14/%E5%A4%84%E7%90%86hexo%E4%B8%8Emathjax%E5%85%BC%E5%AE%B9%E9%97%AE%E9%A2%98/)。
使用较少，仅在表示最优解时会用到，在写 latex 时可以批量处理。
另一种方法是修改忽略掉 markdown 对 \\ \* 等的转义，我不需要这么复杂，忽略这种方法。

(2016-06-21)
post 的 toc 全部展开：https://github.com/iissnan/hexo-theme-next/issues/531

(2016-06-16)
设置 marked 中的 breaks 为 false 可以使用空行来换行。
符合我写作 latex 的习惯。
应该是使用了 hexo-render-marked 插件。
