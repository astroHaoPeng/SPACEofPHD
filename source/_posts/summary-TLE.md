---
title: 关于 Two-Line Elements 的整理
comments: true
categories:
  - Summaries
  - [Academics, Aerospace]
tags:
  - TLE
  - 知识整理
  - 轨道
  - draft
mathjax: true
abbrlink: '2e650864'
date: 2018-06-13 14:40:41
updated: 2018-06-27 17:50:36
---


TLE 的生成
=========

目前没有关于如何更新和生成 TLE 的确切信息。

Vallado 通过各种渠道，给出如下描述 [ref-1]：
JSPOC 每天收集若干次观测数据；
观测通过初始的验证和 association 后，进入 OD 环节；
使用 SGP4 和数值积分器对观测数据分别进行两次定轨；
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




TLE
===

-------

- Horstmann, A., Kebschull, C., Müller, S., Gamper, E., Hesselbach, S., Soggeberg, K., Ben Larbi, M. K., Becker, M., Lorenz, J., Wiedemann, C., and Stoll, E., “Survey of the Current Activities in the Field of Modeling the Space Debris Environment at TU Braunschweig,” Aerospace, vol. 5, Apr. 2018, p. 37.

Two Line Elements that are provided by the Joint Space Operations Center (JSpoC) have a
low precision due to the analytic SGP4-propagation theory, which can amount to several hundred
meters [41,42], whereas precise orbit data is not accessible to publicity.

--------

- Levit, C., and Marshall, W., “Improved orbit predictions using two-line elements,” Advances in Space Research, vol. 47, 2011, pp. 1107–1115.

The fitting period is initially set to ten days, typical of the period over which US Space Surveillance Network observations are fitted when generating TLEs for LEO objects (Danielson et al., 2000).

p6:
Our Initial manual experiments suggested that different fitting periods were optimal for different orbit categories. 
These results are consistent with Alfriend et al. (2002), Danielson et al. (2000).




> - Salvatore Alfano, and David Finkleman, “On selecting satellite conjunction filter parameters,” Acta Astronautica, vol. 99, 2014, pp. 193–200. [[Link]](http://dx.doi.org/10.1016/j.actaastro.2014.02.004).
> 
> In practice, the <mark>three day</mark> interval is the trustworthy lifetime of TLE data. 
Uncertainty often grows unacceptably large when orbit elements are propagated over longer than a few days because there are natural phenomena with measureable effects that occur within that time scale.