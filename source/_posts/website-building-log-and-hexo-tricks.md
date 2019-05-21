---
title: Website Building Log and Hexo Tricks
date: 2018-06-16 17:11:24
updated: 2018-06-16 17:11:24
abbrlink: a9f2141
comments: true
categories:
  - [Techniques, Software]
  - Others
tags:
  - tech
  - log
  - website
hide: true # Add a hide parameter to the the post's Front-matter to hide the post from home page.
---


<!-- more -->

# to-do list
- [x] 添加checkbox, GMF
- [x] 添加阅读计数
- [x] 调整超宽公式自动横向滚动
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

Use this line to include image: 
`
<img src="{% asset_path FPKE_history.png%}" width="400px" title="caption ok?">
`

`abbrlink` is based on `title` but not ~~`date`~~, so, try to keep title fixed.



# log

(2019-05-19 16:03:00)
`hexo-generator-searchdb` 引起导致搜索页面失败，猜测与对公式的支持有关。\
换用原始的 `hexo-generator-search` 可解决。


(2019-05-17 12:27:40)
用这一段代码实现Katex公式在窄屏幕上的自动横向滚动。如果不加`overflow: hidden`的话，会出现竖直方向的滚动条。
```css
.katex-display > .katex {
    height: auto;
    overflow: hidden;
    overflow-x: auto;
}
```
~~用这一段代码调整 unordered list and ordered list 的缩进和左对齐，实现列表的横向滚动~~（会影响到全部list的布局，不合理）（而且会影响主页布局）\
调整：在info-aerospace-conferences 中的 `<!-- more -->` 之后插入下面这段代码，可以实现只在当前面载入，不影响主页。
``` css
<style type="text/css" rel="stylesheet">
ul, ol {
    padding-inline-start: 1.5em;
    white-space: nowrap;
    overflow: hidden;
    overflow-x: auto;
    width: auto;
}
ul li, ol li {
    text-align: left;
}
</style>
```
使用 `192.168.2.1:4000/blog/` 可以在本地用其它设备调用 `hexo s` 的页面进行调试。

(2019-05-08 13:05:55)
配置 `.ssh/config` 来实现登录不同的 github 账户，主要原理是理解 `Host` 代表的是在 push 时 `git@Host:username/repository.git` 中的位置。
参考了[这篇文章](https://www.sail.name/2017/10/02/Multiple-github-count-in-one-system/)的设置，但是文章中有一个小错误，没有强调`git@Host...`。
SSH帐户的讲解参见[这里](https://git-scm.com/book/zh/v1/%E8%B5%B7%E6%AD%A5-%E5%88%9D%E6%AC%A1%E8%BF%90%E8%A1%8C-Git-%E5%89%8D%E7%9A%84%E9%85%8D%E7%BD%AE)的官方文档。


(2019-05-03 11:54:56)
使用firebase的数据库来计算views，NexT原生支持。
生成数据库时需要设置规则，参考了[这里](https://blog.maple3142.net/2017/11/04/hexo-next-readcount/)。\
同一地址的多次访问会被计为一次，重复刷新不会有影响。

(2019-05-02 17:42:41)
`markdown-it-task-checkbox`选择使用这个，目前完美，有空格，不可点击。（~~`markdown-it-checkbox`~~生成的checkbox与后面的文字没有空格；~~`markdown-it-task-lists`~~生成的可点击）\
`hexo-generator-indexed`使用这个来生成主页，支持设置sticky实现置顶。（~~`hexo-generator-index-sticky`~~和~~`hexo-generator-index-top`~~都有不同程度的问题，或者不再更新）
    

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
          <canvas width="220" height="180" id="resCanvas" style="width=100%">
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
swig似乎采用的是javascrip的语法，这两种都不会用，勉强可以看懂。
```swig
{% if theme.social %}
  <div class="links-of-author motion-element">
    {% for name, link in theme.social %}
      <span class="links-of-author-item">
        {% set sidebarURL = link.split('||')[0] | trim %}
        {% if not (theme.social_icons.enable) or (not theme.social_icons.icons_only) %}
          {% set sidebarText = name %}
        {% endif %}
        {% if theme.social_icons.enable %}
          {% if link.split('||')[1] | trim | first == 'a' %}
            <link rel="stylesheet" href="https://cdn.rawgit.com/jpswalsh/academicons/master/css/academicons.min.css">
            {% set sidebarIcon = '<i class="ai ' + link.split('||')[1] | trim | default('user') + '"></i>' %}
          {% else %}
            {% set sidebarIcon = '<i class="fa fa-fw fa-' + link.split('||')[1] | trim | default('globe') + '"></i>' %}
          {% endif %}
        {% endif %}
        {{ next_url(sidebarURL, sidebarIcon + sidebarText, {title: name + ' &rarr; ' + sidebarURL}) }}
      </span>
    {% endfor %}
  </div>
{% endif %}
```

(2018-06-28 12:43:48)
使用 hexo-renderer-kramed 渲染 markdown，可以在 mathJax 中直接使用下划线，但是仍然无法使用 ^*[参考](https://dxj1113.github.io/2017/07/14/%E5%A4%84%E7%90%86hexo%E4%B8%8Emathjax%E5%85%BC%E5%AE%B9%E9%97%AE%E9%A2%98/)。
使用较少，仅在表示最优解时会用到，在写 latex 时可以批量处理。
另一种方法是修改忽略掉 markdown 对 \\ \* 等的转义，我不需要这么复杂，忽略这种方法。

(2016-06-21)
post 的 toc 全部展开：https://github.com/iissnan/hexo-theme-next/issues/531

(2016-06-16)
设置 marked 中的 breaks 为 false 可以使用空行来换行。
符合我写作 latex 的习惯。
应该是使用了 hexo-render-marked 插件。
