---
title: estimation-method
comments: true
date: 2018-07-06 16:59:54
updated: 2018-08-10 16:44:24
categories: Academics
tags:
  - 数学
mathjax: true
---

Estimation theory

# 数学概念

**似然函数 / likelihood function**

$$ \mathcal{L}(\theta \mid x) = f(x\mid\theta) $$
当 $f(x|\theta)$ 作为 $x$ 的函数时，是概率密度函数；
当 $f(x|\theta)$ 作为 $\theta$ 的函数时，是似然函数。

**后验分布 / posterior distribution**

$$ f(\theta \mid x)={\frac {f(x\mid \theta )\,g(\theta )}{\int _{\Theta }f(x\mid \vartheta )\,g(\vartheta )\,d\vartheta }} $$

------------

**最大似然估计 / maximum likelihood (ML) estimation**

$$\hat{\theta}_{\rm ML}(x) = \arg \max_{\theta} \mathcal{L}(\theta|x) = \arg \max_{\theta} f(x|\theta)$$

$$ \hat{\theta}_{\rm MAP}(x) = \arg \max_{{\theta }}{\frac{f(x\mid\theta )\,g(\theta )}{\int_{{\Theta }}f(x\mid\theta ')\,g(\theta ')\,d\theta '}}=\arg \max_{{\theta }}f(x|\theta )\,g(\theta ) $$


**最大后验概率估计 / Maximum a posteriori (MAP) estimation**

$g(\theta)$ 是假设的先验概率；分母与 $\theta$ 的取值无关；$g(\theta)$ 为均匀分布时与 $\hat\theta_{\rm ML}$ 等价。

**贝叶斯估计**

-----------------

算法
===

最大期望算法

（未完成）



$$ -\frac{1}{2} \bm{\beta} \sigma^2 - \frac{1}{2} \bm{B} ( \Phi \circ (\Phi\Sigma^{-1} ) \bm{1}_m + \frac{1}{2} \cdot \bm{1}_m $$

