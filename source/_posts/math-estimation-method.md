---
title: Summary of Estimation Methods
comments: true
categories: 
  - [Academics, Math]
tags:
  - draft
  - math
  - statistics
  - MLE
  - MAP
mathjax: true
abbrlink: 88ca299d
date: 2018-07-06 16:59:54
updated: 2018-08-10 16:44:24
---

Estimation theory

# 数学概念

**似然函数 / likelihood function**

$$ \mathcal{L}(\theta \mid x) = f(x\mid\theta) $$
当 $f(x|\theta)$ 作为 $x$ 的函数时，是概率密度函数；
当 $f(x|\theta)$ 作为 $\theta$ 的函数时，是似然函数。

**后验分布 / posterior distribution**

$$ f(\theta \mid x) = \frac{f(x\mid \theta )\,g(\theta )}{\int _{\Theta }f(x\mid \vartheta )\,g(\vartheta )\,d\vartheta} $$

------------

## 最大似然估计 / maximum likelihood (ML) estimation

$$\hat{\theta}_{\rm ML}(x) = \arg \max_{\theta} \mathcal{L}(\theta|x) = \arg \max_{\theta} f(x|\theta)$$

$$\hat{\theta}_{\rm MAP}(x) = \arg \max_{\theta}{\frac{f(x\mid\theta )\,g(\theta )}{\int_{\Theta}f(x\mid\theta ')\,g(\theta ')\,d\theta '}}=\arg \max_{\theta}f(x|\theta )\,g(\theta)$$

<!-- $$\hat{\theta}_{\rm MAP}(x) = \arg \max_{{\theta }}{\frac{f(x\mid\theta )\,g(\theta )}{\int_{{\Theta }}f(x\mid\theta ')\,g(\theta ')\,d\theta '}}=\arg \max_{{\theta }}f(x|\theta )\,g(\theta)$$ -->


## 最大后验概率估计 / Maximum a posteriori (MAP) estimation

$g(\theta)$ 是假设的先验概率；分母与 $\theta$ 的取值无关；$g(\theta)$ 为均匀分布时与 $\hat\theta_{\rm ML}$ 等价。

## 贝叶斯估计

## Type-II maximum likelihood (MLII)

## Empirical Bayes estimation


-----------------

算法
===

最大期望算法

（未完成）



$$ -\frac{1}{2} \bm{\beta} \sigma^2 - \frac{1}{2} \bm{B} ( \Phi \circ (\Phi\Sigma^{-1} ) \bm{1}_m + \frac{1}{2} \cdot \bm{1}_m $$



## Method of moments (statistics)

[矩估计与最大似然估计](https://www.cnblogs.com/tangchong/p/3157710.html)

矩估计：将概率分布函数分散为不同次幂的期望来刻画。计算简便。

最大似然估计：使用 Bayesian 方法得到给定观测时的参数的分布--似然函数，然后最大化似然函数。理论上精度较高。


**高阶矩**

[概率论中「矩」（moment）的实际含义是什么，高阶矩表示数据的哪些状态？](https://www.zhihu.com/question/23236070)


[概率论中「矩」（moment）的实际含义是什么，高阶矩表示数据的哪些状态？ - 荆哲的回答 - 知乎](https://www.zhihu.com/question/23236070/answer/143316942)



未读
---

[Moment matching algorithm](http://www.cs.cmu.edu/~osogami/thesis/html/node29.html)