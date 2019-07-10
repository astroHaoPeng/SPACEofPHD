---
title: My MarkDown Tricks
comments: true
mathjax: false
abbrlink: 1e880d79
categories:
  - [Techniques, Softwares]
tags:
  - markdown
  - tricks
date: 2019-06-07 12:18:07
updated: 2019-06-13 18:10:46
---


# Special for Hexo-theme-next
Use this line to include image: 
```html
<img src="{% asset_path FPKE_history.png%}" class="full-image" width="400px" title="caption ok?">
```
or this (equivalent)
```
{% fullimage "{% asset_path FPKE_history.png%}" [@lazy], [alt], [title], [size] %}
```

# General HTML

Add color to text
```html
<span style="color:red">TEXT_COLORFUL</span>
```

-------

Add background color to text
```html
<span style="background-color:green">BACKGROUND_COLORFUL</span>
```
