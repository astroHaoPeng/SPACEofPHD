---
title: Machine Learning
comments: true
categories:
  - Summaries
tags:
  - Machine Learning
  - Gaussian Processes
  - draft
abbrlink: c5317df1
date: 2019-06-11 17:42:03
updated:
---


Again, I run into the question that "what's the difference between GP and GPs"?
Here, GP is Gaussian process while GPs is Gaussian process<mark>es</mark>.
So you see the difference?

In this post, I decided to solve this confusion (a better words? puzzle? bewilderment? perplexity?) once and for all, If I could.


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

猜测（待进一步验证）：

| 随机变量 | GP |
| :-: | :-: |
| 随机变量的联合分布 | GPs |
| 对一个确定值$x$进行$N$次观测，每次观测得到一个随机变量$\tilde{x}_i$，然后可以通过$\sum w_i \tilde{x}_i$对$x$进行近似。| 对一个函数$f$进行$N$次测量（？），每次观测得到一个随机函数$\tilde{f}_i$，然后通过$\sum w_i \tilde{f}_i$进行近似。
| | <mark>？这里的观测怎么解释？怎么对应到GP的推导中？</mark>
