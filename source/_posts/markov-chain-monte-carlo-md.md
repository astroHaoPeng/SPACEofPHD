---
title: markov-chain-monte-carlo.md
comments: true
tags:
  - draft
date: 2018-06-20 16:25:34
updated: 2018-06-20 16:25:34
categories: 学术
---


学习资料
=======

按照我的阅读顺序排序

[ref-1] [Dylon 大仙, MCMC基本原理与应用（一）, 2015-06-03](https://rstudio-pubs-static.s3.amazonaws.com/84854_b3ae47177d5c4d22a95565c2d4e063bf.html)

[ref-2] [daniel-D, 从随机过程到马尔科夫链蒙特卡洛方法](https://www.cnblogs.com/daniel-D/p/3388724.html)（不太好，讲得比较混乱）

[ref-3] [靳志辉, LDA-math-MCMC 和 Gibbs Sampling](https://cosx.org/2013/01/lda-math-mcmc-and-gibbs-sampling)（我从这里开始仔细看算法，细致平稳条件）



我的整理
====

理解这一算法的关键在于对以下几个概念的理解：
- 随机过程
- Markov 性，无后效性
- Markov Chain 的极限和平稳分布
- 概率分布的采样，数值方法
- 


主要用于计算高维积分的数值近似。

在 Bayesian statistics 里面是重要的基石。

只要有一个 Markov Chain 是不可约、遍历的，那么它的 *极限概率分布* 就可以用它的 *平稳分布* 求得。

那MCMC算法就是要构建并模拟这么一个Markov Chain使得它是不可约、遍历的而且它的平稳分布就是我们所关心的后验分布。

然后，我们就可以以Monte Carlo思想通过这一个Markov Chain的模拟样本代替后验分布做统计分析 [ref-1]。

Markov Chain 由转移概率矩阵和初始值唯一给定。


应用
==========

**我在文章里见过的**
- Orbit Uncertainty propagation
- [Deep] Bayesian Neural Network (BNN)

**其它**
- 高维度的积分和最优化问题（机器学习、物理、统计、计量等领域的基础）
- 统计力学
- 最优化，最小化或最大化目标函数
- 带有惩罚函数的似然模型选择
