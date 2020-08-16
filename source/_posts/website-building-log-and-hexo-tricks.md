---
title: Website Building Log and Hexo Tricks
date: 2017-01-01 00:00:00
updated: 2017-01-01 00:00:00
updated-true: 2019-06-17 18:42:52
abbrlink: a9f2141
comments: true
categories:
  - [Techniques, Software]
  - Others
tags:
  - tech
  - tricks
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
  - https://zhengmengping.github.io/2018/06/07/Hexo-NexT%E4%B8%BB%E9%A2%98%E4%B8%8B%E6%B7%BB%E5%8A%A0%E7%9B%B8%E5%86%8C%E6%A8%A1%E5%9D%97/Hexo-NexT%E4%B8%BB%E9%A2%98%E4%B8%8B%E6%B7%BB%E5%8A%A0%E7%9B%B8%E5%86%8C%E6%A8%A1%E5%9D%97/
- 不错的主题
  - https://blog.zhangruipeng.me/hexo-theme-icarus/
  - https://github.com/Mrminfive/hexo-theme-skapp 支持多作者
  - https://itimetraveler.github.io/hexo-theme-hiero/
  - https://github.com/iTimeTraveler/hexo-theme-hipaper
  - https://zhwangart.github.io/
  - http://miccall.tech/
  - 

# Collection of Hugo Themes

For Rutgers Life:
- https://themes.gohugo.io/theme/restaurant-hugo/#blog
- https://github.com/qqhann/hugo-primer
- https://themes.gohugo.io/hugo-w3-simple/
- https://github.com/yihui/hugo-xmag

For Gallery:
- https://github.com/kishaningithub/hugo-creative-portfolio-theme
- https://themes.gohugo.io/theme/parsa-hugo-personal-blog-theme/


# Bugs
- [ ] 在 Tab 中或者是 Note 中的换行渲染有问题，少空格。

# Attention

`abbrlink` is based on `title` but not ~~`date`~~, so, try to keep title fixed.



# Logs

(2020-07-06 21:41:38)\
发现一个hexo的bug，（这个bug很烦，在写公式的时候尤其需要注意）
```
在无法处理不在代码框里的 `{#`，因为在写公式时用`\newcommand{\aaa}[1]{x_{#1}}`出现了`{#`组合，无法被翻译成html。
```
解决办法：使用`{ #`，加个空格。\
参考\
[Hexo错误”expected end of comment, got end of file”](https://www.dyxmq.cn/cloud/hexo/the-hexo-error-expected-end-of-comment.html)
这里有另一个解决办法，但是不适合我的用处，[hexo generate 处理 #](http://zhang-jc.github.io/2016/09/11/hexo-generate-%E5%A4%84%E7%90%86-hashes/)


(2019-10-31 16:57:09)\
更新next.yml配置文件，数学模块的配置发生了变化，导致Katex无法渲染。


(2019-09-15 12:08:13)\
更新到NexT v7.4.0，官方去掉了对 `full-image tag` 的支持，偶尔发现可能通过`https://github.com/theme-next/hexo-next-tag`这个临时解决，添加full-image的支持。\
cv页必须用到这个tag（考虑减少对主题的依赖，如果有可能，将来转到Hugo）。


(2019-09-03 15:42:43)\
添加YouTube视频，使其居中。
必须使用`youtube-nocookie`形式的网址，即在生成embed网址时选中**Enable privacy-enhanced mode.**。\
然后使用`<iframe style="display: block; margin: auto;" width="560" height="315" src="https://www.youtube.com/embed/?????" frameborder="0" allowfullscreen></iframe>`，其中`style="display: block; margin: auto;"`需要手动粘贴到youtube地址。（参考：https://stackoverflow.com/a/44605218/11172061）
或者一劳永逸，添加这段自定义css样式（参考：https://stackoverflow.com/a/44772373/11172061）
```css
iframe {
  display: block; 
  margin: auto;
}
```


(2019-07-02 18:38:31)\
尝试使用vscode的keybinding来实现插入自定义标签，参考[这里](https://github.com/yzhang-gh/vscode-markdown/pull/454#issuecomment-494546378)。第一次接触这么专业的工具，很有新鲜感，但是不能浪费太多时间，术业有专攻。
```json
{
  "command": "editor.action.insertSnippet",
  "args": {
      "snippet": "{% note info %}\n$TM_SELECTED_TEXT\n{% endnote %}"
  },
  "key": "cmd+shift+n i",
  "when": "editorTextFocus && editorLangId == 'markdown'"
}
```

(2020-01-08 16:39:38)\
[Hexo博客及环境依赖包的正确升级方法](https://hexo.imydl.tech/archives/51612.html\)


(2019-06-20 19:04:50)\
Remove redundant `\\` in inline equations;
Remove `_` in post titles;
Change logo font.

(2019-06-19 19:54:45)\
根据这里的一系列教程\
https://eveaz.com/1093.html\
https://eveaz.com/1076.html\
https://eveaz.com/1094.html\
判断出是IP被封，升级v2ray的服务器端配置\
在cloudflare.com添加v2二级域名的A解析；
回忆`Let's encrypt`的使用，为二级域名生成证书；
使用233boy的一键安装脚本；
按照官方教程在Nginx中添加新的server转发v2ray的流量。

(2019-06-17 19:36:53)\
反馈给`hexo-generator-indexed`作者关于sticky排序打乱`-updated`排序的问题，作者及时更正。\
重新安装支持`sticky`的generator。

(2019-06-13 20:19:29)\
从这里 https://www.jianshu.com/p/70bf58c48010 看到新的一种 post-receive 的方法，不需要设置 git 用户为 root 权限。\
学习总结 Linux 下的用户权限和用户组概念。

(2019-05-23 20:50:40)\
Hexo平台迁移到笔记本：\
安装Node.js；\
安装Hexo `npm install -g hexo-cli`；\
安装Git；\
clone repo;\
`npm install`;\
安装theme-next的插件：[fancybox, pangu, han（否则白屏）](https://theme-next.org/docs/third-party-services/external-libraries#Pangu-Autospace-Support)；\
安装 `npm install -g browser-sync` 实现同步；\
运行 `Hexo s` 完成；\
配置putty的ssh的public key，使用git bash的必须转换为putty的key才可以。


(2019-05-21 20:16:07)\
`npm i vsce -g`\
`npm install -g webpack webpack-dev-server webpack-cli`\
`npm run compile`\
`vsce package`\
修改`yzhang-gh/vscode-markdown`实现快捷键插入`<mark></mark>`。
Create my first PR to the original author. 


(2019-05-19 20:03:00)\
`hexo-generator-searchdb` 引起导致搜索页面失败，猜测与对公式的支持有关。\
换用原始的 `hexo-generator-search` 可解决。


(2019-05-17 20:27:40)\
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

(2019-05-08 20:05:55)\
配置 `.ssh/config` 来实现登录不同的 github 账户，主要原理是理解 `Host` 代表的是在 push 时 `git@Host:username/repository.git` 中的位置。
参考了[这篇文章](https://www.sail.name/2017/10/02/Multiple-github-count-in-one-system/)的设置，但是文章中有一个小错误，没有强调`git@Host...`。
SSH帐户的讲解参见[这里](https://git-scm.com/book/zh/v1/%E8%B5%B7%E6%AD%A5-%E5%88%9D%E6%AC%A1%E8%BF%90%E8%A1%8C-Git-%E5%89%8D%E7%9A%84%E9%85%8D%E7%BD%AE)的官方文档。


(2019-05-03 21:54:56)\
使用firebase的数据库来计算views，NexT原生支持。
生成数据库时需要设置规则，参考了[这里](https://blog.maple3142.net/2017/11/04/hexo-next-readcount/)。\
同一地址的多次访问会被计为一次，重复刷新不会有影响。

(2019-05-02 21:42:41)\
`markdown-it-task-checkbox`选择使用这个，目前完美，有空格，不可点击。（~~`markdown-it-checkbox`~~生成的checkbox与后面的文字没有空格；~~`markdown-it-task-lists`~~生成的可点击）\
`hexo-generator-indexed`使用这个来生成主页，支持设置sticky实现置顶。（~~`hexo-generator-index-sticky`~~和~~`hexo-generator-index-top`~~都有不同程度的问题，或者不再更新）
    

(2019-04-30 17:18:51)\
为了实现GFM形式的换行，改为使用hexo-render-markdown-it。
顺便启用了hexo的pangu插件来解决中英混排的空格问题。

(2019-04-28 12:18:16)\
改为KaTeX渲染数学公式，解决了`\bm`的支持，而且速度更快。  
使用`markdown_it_plus`来配合`KaTeX`。

(2019-04-26 18:29:33)\
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


(2019-04-25 10:20:59)\
通过下面这两种模型来添加图片，第一种可控制大小，第二种不可以，都利用了{% asset_path FPKE_history.png%}来获得图片url，第二种中通过`< >`使变成字符串：
```markdown
<img src="{% asset_path FPKE_history.png%}" width="80%" title="caption ok?">
<img src="{% asset_path FPKE_history.png%}" width="400px" title="caption ok?">
![description](<{% asset_path FPKE_history.png%}> "Optional title")
```

(2019-04-24 10:19:31)\
迁移到VPS上，通过Cloudflare实现flexiable https，需要自己配置合适的ssl，否则无法使用full模型连接。
博客地址改到/blog/下，预期/news/给其它网站。

(2019-04-23 13:04:45)\
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

(2018-06-28 12:43:48)\
使用 hexo-renderer-kramed 渲染 markdown，可以在 mathJax 中直接使用下划线，但是仍然无法使用 ^*[参考](https://dxj1113.github.io/2017/07/14/%E5%A4%84%E7%90%86hexo%E4%B8%8Emathjax%E5%85%BC%E5%AE%B9%E9%97%AE%E9%A2%98/)。
使用较少，仅在表示最优解时会用到，在写 latex 时可以批量处理。
另一种方法是修改忽略掉 markdown 对 `\\`, `\*` 等的转义，我不需要这么复杂，忽略这种方法。

(2016-06-21)\
post 的 toc 全部展开：https://github.com/iissnan/hexo-theme-next/issues/531

(2016-06-16)\
设置 marked 中的 breaks 为 false 可以使用空行来换行。
符合我写作 latex 的习惯。
应该是使用了 hexo-render-marked 插件。
