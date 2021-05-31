---
title: GPflow Learning Notes
comments: true
mathjax: true
abbrlink: c38048f4
categories:
  - - Techniques
    - Software
tags:
  - GPflow
date: 2019-10-30 11:23:59
updated: 2019-10-30 11:25:12
---

Official documents: https://gpflow.readthedocs.io/en/master/intro.html

> GPflow <mark>focusses on variational inference and MCMC</mark>, \
> there is **no expectation propagation or Laplace approximation**.

<!-- more -->



# SVGP paper

> Mark van der Wilk, Vincent Dutordoir, S. T. John, Artem Artemev, Vincent Adam, and James Hensman, “A Framework for Interdomain and Multioutput Gaussian Processes”, arXiv:2003.01115 [cs, stat], Mar. 2020. [[Link]](http://arxiv.org/abs/2003.01115).

## 5 Software framework

### 5.3 Implementation of SVGP

ELBO:
$$
\mathfrak{L} = \sum_{n=1}^{N} \mathbb{E}_{q(\bm{f}(\mathbf{x}_n))} [\log p(\mathbf{y}_n | \bm{f}(\mathbf{x}_n))] - \text{KL}[q(\mathbf{u}) \| p(\mathbf{u})]
\tag{56}
$$

## 7 Uncertain inputs

> ... GP-LVM, where we are interested in learning the joint posterior of two variables: 
> the distribution of the input locations $\{q_n(\mathbf{x}_n)\}T_{n=1}^N$ of the GP function and the GP mapping $f(\cdot)$ itself.

