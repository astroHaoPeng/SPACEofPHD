---
title: RN_gal_uncertainty_2016
comments: true
date: 2018-06-16 15:09:29
updated: 2018-06-16 15:09:29
categories:
tags:
mathjax: true
---

在未进行观测前，假设存在关于函数 $\bm{y}=f^\bm{\omega}(\bm{x})$ 的

*先验分布 prior distribution*: 
$p(\bm{\omega})$

代表了我们对先验情况的主观猜测。

------

当获得一些观测后，可以定义

*似然函数 likelihood distribution*: 
$p(\bm{y}|\bm{x},\bm{\omega})$

反映了在当前假设的函数参数 $\bm{\omega}$ 下，$\bm{x}$ 给出观测值 $\bm{y}$ 的概率。

------

获得一个观测集合 $\bm{X} = \\{\dots,\bm{x}_i,\dots\\}$ 和 $\bm{Y} = \\{\dots,\bm{y}_i,\dots\\}$ 后，
使用 Bayes's theorem 定理可以得到

*后验分布 posterior distribution*: 
$p(\bm{\omega} | \bm{X},\bm{Y}) = \frac{p(\bm{Y} | \bm{X},\bm{\omega}) p(\bm{\omega})}{p(\bm{Y}|\bm{X})} $

由此可以得到，在给定当前观测 $(\bm{X},\bm{Y})$ 的情况下，最可能的函数参数 $\bm{\omega}$。

-----

使用这组最可能的参数，可以进行

*推理 inference*: 
$p(\bm{y}^\*|\bm{x}^\*,\bm{X},\bm{Y}) = \int p(\bm{y}^\*|\bm{x}^\*,\bm{\omega})\, p(\bm{\omega}|\bm{X},\bm{Y})\, \rm{d}\bm{\omega}$

也就是预测新输入 $\bm{x}^\*$ 的输出 $\bm{y}^\*$ 的概率分布。

-----

计算后验分布时，最重要的是需要计算 normalizer

*边缘分布 model evidence* (or *marginal likelihood*): $p(\bm{Y}|\bm{X}) = \int p(\bm{Y}|\bm{X},\bm{\omega})\, p(\bm{\omega})\, \rm{d}\bm{\omega}$

也被称作 *marginalising* the likelihood over $\bm{\omega}$.
除了对于很简单的情况，这一过程一般没有解析的方法。

