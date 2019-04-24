---
title: 知识整理 | 机器学习中用到的概率统计知识
comments: true
abbrlink: de0c06bd
date: 2019-04-15 14:43:39
updated: 2019-04-23 15:01:35
categories: Knowledge base
tags: [math, statistics, summary]
---

已有但未完成的posts的整理：（争取5月底前完成）

- {% post_link moments-method %}

- {% post_link bishop-pattern-2006 %}

- {% post_link almosallam-heteroscedastic-2017%}
<!-- [阅读笔记：Heteroscedastic Gaussian processes for uncertain and incomplete data]() -->

- {% post_link estimation-method%}
<!-- [estimation-method]() -->

- {% post_link all-about-bayesian%}
<!-- [all-about-bayesian]() -->

- {% post_link markov-chain-monte-carlo %}
<!-- [markov-chain-monte-carlo]() -->

- {% post_link RN-gal-uncertainty-2016 %}
<!-- [博士论文 "Uncertainty in Deep Learning" 阅读笔记]() -->

- {% post_link steinwart-support-2008%}

<!-- more -->

# 定理

[機器學習裡不存在的免費午餐：NO FREE LUNCH THEOREMS](https://molecular-service-science.com/2017/12/04/no-free-lunch-theorems-in-machine-learning/)
> 也就是說，雖然 AlphaGo 的強大史無前例，但即使不考慮任何技術性細節，直接把超能演算法組合套用在其它問題的計算，也不太可能常常獲得所謂的「免費午餐」。
> 
> NFL 真正帶給我們的啟發是：盲目追求最佳演算法是沒有意義的，但是透過合理使用領域 & 專家知識在特定的議題上，我們將能得到超越(甚至大幅超越)隨機演算法平均的結果。


# 频率分布相关

[T分布：一个被啤酒厂发现的关键统计概念](https://blog.csdn.net/lengxiao1993/article/details/81985399)
> 用样本均值计算出来的方差始终（无论样本均值小于或是大于总体实际均值）比用总体均值计算出来的方差要小
> 
> 高斯分布和学生分布是统计学和机器学习中最为重要的连续概率分布的一部分。 t-分布可以用作总体方差未知， 或样本集较小时高斯分布的占位符。 这两种分布有着非常严格和正式的关联关系。


[卡方檢定 ON THE CROSS：PEARSON, YATES, FISHER 與精確檢定](https://molecular-service-science.com/2012/08/10/chi-squared-test-pearson-yates-and-fisher/)
