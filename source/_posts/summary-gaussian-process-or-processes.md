---
title: Gaussian Process is a plural noun describing a random function with assumed
  Gaussian joint distribution
abbrlink: c5317df1
categories:
  - Summaries
tags:
  - Machine Learning
  - Gaussian Processes
  - draft
comments: true
mathjax: true
date: 2019-06-11 17:42:03
updated: 2019-09-31 11:08:44
---



Again, I run into the question that "what's the difference between GP and GPs"?
Here, GP is Gaussian process while GPs is Gaussian process<mark>es</mark>.
So you see the difference?

In this post, I decided to solve this confusion (a better words? puzzle? bewilderment? perplexity?) once and for all.

<!-- more -->

----

According to [Wikipedia:Gaussian_process](https://en.wikipedia.org/wiki/Gaussian_process): 
> ... a Gaussian process is a stochastic process ...

So, first, we can infer that GP is countable. (This is not silly.)

----

According to [Wikipedia:Stochastic_process](https://en.wikipedia.org/wiki/Stochastic_process):
> The term random function is also used to refer to a stochastic or random process,[26][27] because a stochastic process can also be interpreted as a random element in a function space.[28][29]

So, roughly speaking, a GP is a random function, such that every finite collection of those random variables has a multivariate normal distribution.

----

According to [Wikipedia:Multivariate_normal_distribution](https://en.wikipedia.org/wiki/Multivariate_normal_distribution):
> multivariate normal distribution, multivariate Gaussian distribution, or joint normal distribution

----

结论（待进一步验证）：

| 随机变量 | GP |
| :-----: | :-: |
| 随机变量们 | GPs |
| 对一个确定值$x$进行$n$次观测，每次观测得到一个随机变量$\tilde{x}_i$ | 对一个函数$f$进行$N$次采样，每次采样得到是随机函数在某个点$x$的latent value+noise即$\tilde{f}_i=f_i+\epsilon_i$    |    然后可以通过$\sum_{i=1}^n w_i \tilde{x}_i$对$x$进行近似 | 这些不同的采样点$\tilde{f}_i$是属于不同的$\tilde{f}$，实际的$f$需要根据先验证$f\sim\mathcal{GP}$和假设的likelihood模型$\tilde{f}=f_i+\epsilon$推断。
