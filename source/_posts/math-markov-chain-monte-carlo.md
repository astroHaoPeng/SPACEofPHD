---
title: "Sampling Methods: Markov-Chain Monte-Carlo"
comments: true
categories: 
  - [Academics, Math]
  - Notes
tags:
  - draft
  - sampling
mathjax: true
abbrlink: 8715cba5
date: 2018-06-20 16:25:34
updated: 2018-06-25 16:25:34
---

# Monte Carlo integration
对于我这样的统计外行，最大的问题是在一开始没有搞明白为什么要采样，或者说采样的结果应该如何使用，而不是MCMC的算法细节。

其实我想知道的东西，名字叫 **Monte Carlo integration**，参考[这里的提问](https://stats.stackexchange.com/questions/243828/how-to-do-mc-integration-from-gibbs-sampling-of-posterior)或者[这里的PPT](https://astrostatistics.psu.edu/su14/lectures/CosPop14-2-2-BayesComp-2.pdf)。

Assuming $\theta_i$ is sampled from the distribution $p(\theta|D)$, the Monte Carlo integreation formula is:
$$
\mathbb{E}_{\theta\sim p(\theta|D)}[g(\theta)] 
= \int g(\theta) p(\theta|D) d\theta 
\approx \frac{1}{n} \sum_{\theta_i\sim p(\theta|D)} g(\theta_i) + O(\sqrt{n})
$$

The following discussion provides a very clear interpretation about *Bayes Inferencing*, but I'm not sure it's exact and 100\% correct. Need to do more reading.\
[Can a posterior expectation be used as a approximate for the true (prior) expectation?](https://stats.stackexchange.com/questions/307551/can-a-posterior-expectation-be-used-as-a-approximate-for-the-true-prior-expect)


# MCMC 是否适用于大规划问题，有上千个参数的问题

> MCMC应用的概率模型，其参数维数往往巨大，但每个参数的支撑集非常小。比如一些NLP问题的参数只取{0,1}，但维数往往达到几千甚至上万左右，这正说明了MCMC更适用这些问题。
> 
> 为什么要使用MCMC方法？ - Ni Yun的回答 - 知乎
https://www.zhihu.com/question/60437632/answer/179001481

> 目前已有的两个答案(by Ni Yun and by 李定)说得很对，是 因为维度灾难，蒙特卡洛积分法是求高维函数积分的一种非常高效的方法，而statistic inference中求参数的期望本质上就是一个积分。所以，以此为出发点，就通向了MCMC方法。
> 
> 为什么要使用MCMC方法？ - astrojhgu的回答 - 知乎
https://www.zhihu.com/question/60437632/answer/179040869

结论：
可以适用于大规划，而且我的规划也不算大。
但是效果如果，未知。
<mark>潜在的问题</mark>之一是：如果实际并没有办法做严格的regression，那么就是会导致过度学习，overfitting 严重。


学习资料
=======

按照我的阅读顺序排序

[ref-1] [Dylon 大仙, MCMC基本原理与应用（一）, 2015-06-03](https://rstudio-pubs-static.s3.amazonaws.com/84854_b3ae47177d5c4d22a95565c2d4e063bf.html)

[ref-2] [daniel-D, 从随机过程到马尔科夫链蒙特卡洛方法](https://www.cnblogs.com/daniel-D/p/3388724.html)
（不太好，讲得比较混乱）

[ref-3] [靳志辉, LDA-math-MCMC 和 Gibbs Sampling](https://cosx.org/2013/01/lda-math-mcmc-and-gibbs-sampling)
（我从这里开始仔细看算法，细致平稳条件）

[ref-4] [shenxiaolu1984, 蒙特卡洛-马尔科夫链(MCMC)初步](https://blog.csdn.net/shenxiaolu1984/article/details/50499898)
（简要介绍了4种采用方法，具体算法的公式挂了）

[ref-5] [shenxiaolu1984, 蒙特卡洛-马尔科夫链(MCMC)的混合速度](https://blog.csdn.net/shenxiaolu1984/article/details/50543457)

[ref-6] [qy20115549, HMC(Hamiltonian Monte Carlo抽样算法详细介绍)](https://blog.csdn.net/qy20115549/article/details/54561643)
（未看）

[ref-7] [随机模拟-Monte Carlo积分及采样（详述直接采样、接受-拒绝采样、重要性采样）](https://www.jianshu.com/p/3d30070932a8)
（讲了 Monte Carlo 积分与几种常见的采样方式的解释比较直观和深刻。MCMC 的主要作用之一是用来 支持 Monte Carlo 积分，其中涉及到了对某概率 $f(x)$ 的采样。）

[ref-8] [Bin的专栏, 随机采样方法整理与讲解（MCMC、Gibbs Sampling等）](https://www.cnblogs.com/xbinworld/p/4266146.html)
（推荐。基本是最正确的理解顺序。）

[ref-9] [再谈MCMC方法](https://bindog.github.io/blog/2015/10/15/revisit-mcmc-method/)\
讲到用MCMC破解凯撒密码



[ref-wiki-MCMC] [Markov chain Monte Carlo](https://en.wikipedia.org/wiki/Markov_chain_Monte_Carlo)（未看）

[ref-wiki-Gibbs] 

## HMC

[如何简单地理解「哈密尔顿蒙特卡洛 (HMC)」？](https://zhuanlan.zhihu.com/p/32315762)/
写得比较简略，对入门不是很有帮助。




我的整理
====

理解这一算法的关键在于对以下几个概念的理解：
- 随机过程
- Markov 性，无后效性
- Markov Chain 的极限和平稳分布
- 概率分布的采样，数值方法
- 

<!-- more -->

In statistics, Markov chain Monte Carlo (MCMC) methods comprise a class of algorithms for sampling from a probability distribution. 
是一种经典的概率分布采样方法。


主要用于计算高维积分的数值近似。

在 Bayesian statistics 里面是重要的基石。

只要有一个 Markov Chain 是不可约、遍历的，那么它的 *极限概率分布* 就可以用它的 *平稳分布* 求得。

那MCMC算法就是要构建并模拟这么一个Markov Chain使得它是不可约、遍历的而且它的平稳分布就是我们所关心的后验分布。

然后，我们就可以以Monte Carlo思想通过这一个Markov Chain的模拟样本代替后验分布做统计分析 [ref-1]。

Markov Chain 由转移概率矩阵和初始值唯一给定。

Monte Carlo 方法的每一个采样是独立的，而 Markov Chain Monte Carlo 的采样是前后关联的。


使用 MCMC
---------

设计MCMC方法的一个难处，在于如何设计合理的转移概率函数，使得MC链的稳态分布等于要求的概率分布。
MCMC的另一个问题是混合速度，在这篇博客中有所讨论。[ref-4]

MCMC是一个大类，有许多种具体算法，以下举例几种最为著名的：
- Metropolis-Hastings(MH)
引入了接受概率，并放大其中一个概率为 1 加速收敛
- Gibbs Sampling
提议概率直接使用条件概率仅采样一个元素，接受概率自然为 1（？）
- Slice Sampling
- Elliptical Slice Sampling

Gibbs Sampling
--------------

吉布斯采样适用于条件分布比边缘分布更容易采样的多变量分布 [ref-wiki-gibbs]。



# Hamiltonian Monte Carlo

Hamiltonian or Hybrid Monte Carlo (HMC)这种MCMC算法应用的是物理系统中动力学的概念来计算Markov链中的未来状态，而不是概率分布。



# 应用

**我在文章里见过的**
- Orbit Uncertainty propagation
- [Deep] Bayesian Neural Network (BNN)

**其它**
- 高维度的积分和最优化问题（机器学习、物理、统计、计量等领域的基础）
- 统计力学
- 最优化，最小化或最大化目标函数
- 带有惩罚函数的似然模型选择



# MCMC v.s. Bayes Monte Carlo (BMC)

> 1. Song S. Qian, Craig A. Stow, and Mark E. Borsuk, “On Monte Carlo methods for Bayesian inference”, Ecological Modelling, vol. 159, Jan. 2003, pp. 269–277.

- MCMC is a general methodology that provides a solution to the difficult problem of sampling from a highdimensional distribution for the purpose of numerical integration.
- BMC... 不好总结

