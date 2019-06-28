---
title: MATLAB画图技巧整理
categories:
  - [Techniques, Software]
tags:
  - MATLAB
  - visualize
comments: true
mathjax: false
abbrlink: 95aded09
date: 2019-05-01 18:09:30
updated: 2019-06-28 17:59:11
---


# 用线条填充图

使用 [Hatchfill2](https://www.mathworks.com/matlabcentral/fileexchange/53593-hatchfill2)\
配合 [legendflex](https://github.com/kakearney/legendflex-pkg) 对 lagend 进行控制


# SPACEofPHD 上的推送v

[优雅地作图——用Matlab画出比较漂亮的图](优雅地作图——用Matlab画出比较漂亮的图)

------

[科研绘图 | 提取两个曲面构成的交曲面（两种方法）](https://mp.weixin.qq.com/s/KNuAc0Uk73uxnhK1f7filA)

------

[科研绘图 | Matlab绘制精美的势能函数剖面图](https://mp.weixin.qq.com/s/GKiCpnhvRCW8BO1uPBT0IA)

------

link properties of graphic objects:\
`linkprop`\
`linkaxes` only links `XLim` or `YLim` or both。 内部是用 `linkprop` 实现的。

推荐：只用来展示时使用，每个axis还是通过命令单独设置，否则很难控制赋值逻辑，经常被其它函数重写。

问题：`fill`会重写之前的所有axis属性（as of 2019-05-01 18:17:59）

------

[科研绘图 | Matlab绘制精美的势能函数剖面图](https://mp.weixin.qq.com/s/GKiCpnhvRCW8BO1uPBT0IA)