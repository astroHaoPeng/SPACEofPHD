---
title: math-covariance-ntersection
abbrlink: cb41c00f
comments: true
mathjax: false
date: 2020-01-10 17:55:52
updated:
categories:
tags:
---

# 大致的概念和与 EKF 的关系

<img src="{% asset_path slide_25.jpg %}" width="500px" title="EKF v.s. CI">

(from [here](https://images.slideplayer.com/25/7694829/slides/slide_25.jpg))

<!-- more -->

<img src="{% asset_path 2-Figure1-1.png %}" width="500px" title="different choices of $omega$">

(from [here](https://d3i71xaburhd42.cloudfront.net/d366e10dc7c6a3269223c87b25d82ec0fc03abe2/2-Figure1-1.png))


<img src="{% asset_path Comparison-of-Covariance-Union-with-Covariance-Intersection.png %}" width="500px" title="CI v.s. CU">

(from [here](https://www.researchgate.net/profile/Evrim_Anil_Evirgen/publication/311304033/figure/fig3/AS:434741120901123@1480661768972/Comparison-of-Covariance-Union-with-Covariance-Intersection.png))


# 

[Covariance_intersection](https://en.wikipedia.org/wiki/Covariance_intersection)


# 如何确定最优的 $omega$

似乎是要通过优化某种函数来实现
where $omega$ is computed to minimize a selected norm, e.g., logdet or trace (copied from [wikipedia](https://en.wikipedia.org/wiki/Covariance_intersection)).


