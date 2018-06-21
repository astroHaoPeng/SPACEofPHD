---
title: 关于 Two-Line Elements 的整理
comments: true
categories:
  - 学术
tags:
  - TLE
  - 知识整理
  - 轨道
mathjax: true
date: 2018-06-13 14:40:41
updated: 2018-06-13 14:40:41
---

TLE 的生成
=========

目前没有关于如何更新和生成 TLE 的确切信息。

Vallado 通过各种渠道，给出如下描述 [ref-1]：
JSPOC 每天收集若干次观测数据；
观测通过初始的验证和 association 后，进入 OD 环节；
使用 SGP4 和数值积分器对观测数据分别进行两次定轨；
大约每 8 小时进行一次 snapshot，然后数据通过 space-track.org 公开发布。




存在的问题
--------

最根本的限制是 TLE 自身的精度不足，没有 covariance 信息，而且 TLE 还会包括 mis-tagged 数据，缺少轨道机动信息。
[ref-1].

提高精度



**文献列表：**
- [ref-1] Vallado, D., Virgili, B., and Flohrer, T., “Improved SSA Through Orbit Determination of Two-Line Element Sets,” 6th European Conference on Space Debris, Darmstadt, Germnay.: 2013.
- 

**缩写列表：**
- [JSPOC] Joint Space Operations Center (), operated by the US Air Force Space Command (AFSPC)

一些文献整理
==========


总结了2012前已有的关于 TLE 的应用和精度的研究

> Vallado, D. A., and Cefola, P. J., “Two-line element sets–practice and use,” 63rd International Astronautical Congress, Naples, Italy, 2012.

2013年进一步拓展了上文中的研究到更多的轨道类型

> Vallado, D., Virgili, B., and Flohrer, T., “Improved SSA Through Orbit Determination of Two-Line Element Sets,” 6th European Conference on Space Debris, Darmstadt, Germnay.: 2013.
