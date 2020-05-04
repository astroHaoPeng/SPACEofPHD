---
title: Least-squares estimation, kalman filtering, and modeling -- a practical handbook
abbrlink: e8aef91d
categories:
  - [Notes, Book Notes]
tags:
  - Kalman filter
  - Neural Network
comments: true
mathjax: false
data: 2017-06-05 00:00:00
updated: 2019-10-31 11:58:40
---

> Bruce P. Gibbs, Least-squares estimation, kalman filtering, and modeling: a practical handbook, Hoboken, N.J: Wiley, 2011.

所有的估计都可以理解为 inverse modeling 的过程。(P?)

<!-- more -->

# 读书时用到的数学概念摘要




# Affine Space <span id="jumpAffineSpace"></span>

>[here says:](http://blog.csdn.net/caimouse/article/details/54574484)
>
>仿射空间与仿射变换在计算机图形学中有着很重要的应用。
> 
>为了表示平移，以及现实世界的描述，就需要使用仿射空间。
>
>仿射空间是数学中的几何结构，这种结构是欧式空间的仿射特性的推广。在仿射空间中，点与点之间做差可以得到向量，点与向量做加法将得到另一个点，但是点与点之间不可以做加法。

我简单理解为就是欧式空间。


>[维基百科 says:](https://zh.wikipedia.org/wiki/%E4%BB%BF%E5%B0%84%E7%A9%BA%E9%97%B4)
>
>仿射空间，又称线性流形，是数学中的几何结构，这种结构是欧式空间的仿射特性的推广。在仿射空间中，点与点之间做差可以得到向量，点与向量做加法将得到另一个点，但是点与点之间不可以做加法。

前一条貌似借鉴了维基百科。





# Affine transformation

定义在 [Affine Space](#jumpAffineSpace) 中

## [WikiPedia says](https://en.wikipedia.org/wiki/Affine_transformation "aa")

> Thus, every linear transformation is affine, but not every affine transformation is linear.

比线性变换的定义更广泛，我**错误地**把放射变换理解记忆为*不保持原点的线性变换*。

> a function between affine spaces which preserves points, straight lines and planes. Also, sets of parallel lines remain parallel after an affine transformation. 

几个性质
- 保点，线，面
- 保平行
- 不一定保角，距离，

> Examples of affine transformations include translation, scaling, homothety, similarity transformation, reflection, rotation, shear mapping, and compositions of them in any combination and sequence.



------------

