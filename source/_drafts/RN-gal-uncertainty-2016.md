---
title: 博士论文 "Uncertainty in Deep Learning" 阅读笔记
comments: true
date: 2018-06-16 15:09:29
updated: 2018-06-16 15:09:29
categories:
 - 读书笔记
tags:
 - Thesis.phd
 - 读书笔记
 - 神经网络
 - Deep Learning
mathjax: true
---

Gal, Yarin, “Uncertainty in Deep Learning,” Doctor of Philosophy, University of Cambridge, 2016.


Bayesian modeling 的一些基础知识
========================

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

-------

*娈分推断方法 variational inference (Bayesian)*（我第一次听说）
------------------------------

因为通常无法准确计算 *后验分布*，所以定义一个

*变分推断 variational distribution*: $q_{\bm{\theta}}(\bm{\omega})$

通过最小化 Kullback–Leibler (KL) divergence 或者最大化 evidence lower bound (ELBO) 来实现
- 尽可能地解释、拟合、接近数据的分布
- 尽可能地接近先验分布（起到 Occam razor 的作用）

变分推断使用 *最优化* 替代了 Bayesian 推断中的 *marginalizing* 的过程，即使用微分代替了积分。
计算微分通常更简单。
这一方法属于 Bayesian modelling 的经典技巧。

这一方法尽可能多地 Bayesian modelling 的优势：
- 复杂模型和解释数据之间的平衡
- 生成包括模型不确定性的概率模型

This technique does not
scale to large data (evaluating R
qθ(ω) log p(Y|X,ω)dω requires calculations over the
entire dataset), and the approach does not adapt to complex models (models in which
this last integral cannot be evaluated analytically). Recent advances in VI allow us to
circumvent these difficulties, and we will get back to this topic later in §3.1.



Bayesian neural networks
========================