---
title: Gaussian Processes for Machine Learning 读书笔记
categories:
  - 读书笔记
tags:
  - 读书笔记
  - 机器学习
  - 高斯过程
  - Gaussian Processes
abbrlink: 79506b93
data: 2017-06-05 00:00:00
---

> Rasmussen, Carl Edward, and Christopher K. I. Williams. 2006. Gaussian Processes for Machine Learning. Adaptive Computation and Machine Learning. Cambridge, Mass: MIT Press. http://www.gaussianprocess.org/gpml/chapters/.


我的 | 水平
------- | ------
数学基础 | 数学本科略高
概率基础 | 弱
计算机基础 | 一般 

# 笔记

Sec 2讲了做regression的几乎所有基础理论。


Sec 3讲做classification，没有看。


Sec 4讲不同covairance的性质，未看，待看。


在Sec 5讲模型的训练理论。
这本书里把通常的机器学习中的训练的概念称为model selection，所以作为一个外行花了很长时间才弄明白这部分是讲如何训练的。

Bayesian inference


# 待解决的问题

1. 如何实现非线性？如何直观地解释？分别从weight-space和function-space。
1. Gaussian distribution存在于哪些推导过程中？这里的过程不是指Gaussian process的process。
1. 如何训练网络？为什么计算复杂度为O(n^3)？
1. 为什么预测的计算复杂度为O(n)？预测方差的计算复杂度为O(n^2)？
1. 对大数据量的近似算法是什么原理？怎么评价近似结果？
1. 如何解释对于非Gaussian distribution使用GP的道理？
1. GP和SVM的关系？
1. GP和RBF的关系？
1. GP和其它Bayesian method的关系？有无？


# 参考资料

## 一个作者对gpml的中文解读

[Gaussian process regression的导出——权重空间视角下的贝叶斯的方法](https://zhuanlan.zhihu.com/p/27554656)：阐述了gpml中Sec 2.1的同样内容，表意更直观易懂，添加了作者自己的理解

[Gaussian process regression的简洁推导——从Function-space角度看](https://zhuanlan.zhihu.com/p/31203558)：阐述了gpml中Sec 2.2的同样内容，表意更直观易懂，添加了作者自己的理解

[【答疑解惑-I】——Gaussian process的样本生成与其mean和kernel的联系](https://zhuanlan.zhihu.com/p/31427491)

## 似然函数

[Wikipedia: Likelihood function](https://en.wikipedia.org/wiki/Likelihood_function)

In statistics, a distinction is made, depending on the roles of outcomes vs. parameters. 

- **Probability** is used before data are available to describe plausibility of a future outcome, given a value for the parameter. 
- **Likelihood** is used after data are available to describe plausibility of a parameter value.

*Likelihoods* do not have to integrate (or sum) to 1, unlike probabilities.

[中文维基：似然函数](https://zh.wikipedia.org/wiki/似然函数)

类似描述，并不要求似然函数满足归一性，所以，乘除常数对于似然函数可以忽略（忽略后用“正比于”符号连接等式两边）。

## 边缘分布

[中文维基：边缘分布](https://zh.wikipedia.org/wiki/%E8%BE%B9%E7%BC%98%E5%88%86%E5%B8%83)

关于某一个变量进行全积分。
降维操作。

[Wikipedia: Marginal distribution](https://en.wikipedia.org/wiki/Marginal_distribution)