---
title: all-about-bayesian
comments: true
tags:
  - draft
date: 2018-06-22 08:56:53
updated: 2018-06-27 17:49:51
categories: Academics
---


学习资料
=======

[Jorbe, 变分法和变分贝叶斯推断](http://jorbe.sinaapp.com/2017/09/23/variational_and_variational_bayes_methods/)
（感觉文章最后缺少一些内容，为什么要得到 $P(X,Z)$ ？ 以及得到后怎么使用，下一步操作是什么？

> 当概率质量分布f(x)为正态分布时，信息熵最大。
>
> 可以通过最大这个下界来达到最小化KL(Q||P)的目的，这样做的一个好处在于，如果直接优化KL(Q||P)，由于真实后验分布往往事先不知道，而且如果用贝叶斯公式来计算P(Z|X)的复杂度特别高，因此不好直接优化KL(Q||P)。

> 为了优化L(Q)，需要引入一种叫做平均场的方法(mean field theory)，即假设每个隐变量之间服从独立同分布：
