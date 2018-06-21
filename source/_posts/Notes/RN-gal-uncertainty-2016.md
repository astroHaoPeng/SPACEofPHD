---
title: 博士论文 "Uncertainty in Deep Learning" 阅读笔记
date: 2018-06-16 15:09:29
updated: 2018-06-21 18:44:29
categories:
  - 笔记
tags:
  - Thesis.phd
  - 读书笔记
  - 神经网络
  - Deep Learning
mathjax: true
---

Gal, Yarin, “Uncertainty in Deep Learning,” Doctor of Philosophy, University of Cambridge, 2016.


全文的主要贡献
===========

(p15) We will thus concentrate on the development of practical techniques to obtain model
confidence in deep learning, techniques which are also well rooted within the theoretical
foundations of probability theory and Bayesian modelling. Specifically, we will make use
of stochastic regularisation techniques (SRTs).

These techniques adapt the
model output stochastically as a way of model regularisation (hence the name stochastic
regularisation). This results in the loss becoming a random quantity, which is optimised
using tools from the stochastic non-convex optimisation literature. Popular SRTs include
dropout [Hinton et al., 2012], multiplicative Gaussian noise [Srivastava et al., 2014],
dropConnect [Wan et al., 2013], and countless other recent techniques4,5.

作者对 NN 的一些讨论
===

CNN
---

经常用在图像识别。卷积层处理空间信息；pooling 层缩减维度。

Convolutional neural networks (CNNs). CNNs [LeCun et al., 1989; Rumelhart
et al., 1985] are popular deep learning tools for image processing, which can solve tasks
that until recently were considered to lie beyond our reach [Krizhevsky et al., 2012;
Szegedy et al., 2014]. The model is made of a recursive application of convolution and
pooling layers, followed by inner product layers at the end of the network (simple NNs
as described above). A convolution layer is a linear transformation that preserves spatial
information in the input image (depicted in figure 1.1). Pooling layers simply take the
output of a convolution layer and reduce its dimensionality (by taking the maximum of
each (2, 2) block of pixels for example). The convolution layer will be explained in more
detail in section §3.4.1.

RNN
---

擅长处理序列数据，比如自然语言识别、语言生成、视频处理、其它（？）。

Recurrent neural networks (RNNs). RNNs [Rumelhart et al., 1985; Werbos, 1988]
are sequence-based models of key importance for natural language understanding, language
generation, video processing, and many other tasks [Kalchbrenner and Blunsom,
2013; Mikolov et al., 2010; Sundermeyer et al., 2012; Sutskever et al., 2014].


PILCO
-----

PILCO [Deisenroth and Rasmussen, 2011], for example, is a data-efficient probabilistic
model-based policy search algorithm. PILCO analytically propagates uncertain state
distributions through a Gaussian process dynamics model. This is done by recursively
feeding the output state distribution (output uncertainty) of one time step as the input
state distribution (input uncertainty) of the next time step, until a fixed time horizon T.

与 GP 的关系
----------

使用无穷个 neuron，每个 weight 都取为高斯分布，则成为 GP。

对有限个 weights，则是 BNN。

(p14) Even though modern deep learning models used in practice do not capture model
confidence, they are closely related to a family of probabilistic models which induce
probability distributions over functions: the Gaussian process.
Given a neural network,
by placing a probability distribution over each weight (a standard normal distribution for
example), a Gaussian process can be recovered in the limit of infinitely many weights (see
Neal [1995] or Williams [1997]). For a finite number of weights, model uncertainty can still
be obtained by placing distributions over the weights—these models are called Bayesian
neural networks.


Bayesian modeling 的一些基础知识
========================

在未进行观测前，假设存在关于函数 $\bm{y}=f^\bm{\omega}(\bm{x})$ 的

> *先验分布 prior distribution*: 
$p(\bm{\omega})$

代表了我们对先验情况的主观猜测。

------

当获得一些观测后，可以定义

> *似然函数 likelihood distribution*: 
$p(\bm{y}|\bm{x},\bm{\omega})$

反映了在当前假设的函数参数 $\bm{\omega}$ 下，$\bm{x}$ 给出观测值 $\bm{y}$ 的概率。

<!-- more -->
------

获得一个观测集合 $\bm{X} = \\{\dots,\bm{x}_i,\dots\\}$ 和 $\bm{Y} = \\{\dots,\bm{y}_i,\dots\\}$ 后，
使用 Bayes's theorem 定理可以得到

> *后验分布 posterior distribution*: 
$p(\bm{\omega} | \bm{X},\bm{Y}) = \frac{p(\bm{Y} | \bm{X},\bm{\omega}) p(\bm{\omega})}{p(\bm{Y}|\bm{X})} $

由此可以得到，在给定当前观测 $(\bm{X},\bm{Y})$ 的情况下，最可能的函数参数 $\bm{\omega}$。

-----

使用这组最可能的参数，可以进行

> *推理 inference*: 
$p(\bm{y}^\*|\bm{x}^\*,\bm{X},\bm{Y}) = \int p(\bm{y}^\*|\bm{x}^\*,\bm{\omega})\, p(\bm{\omega}|\bm{X},\bm{Y})\, \rm{d}\bm{\omega}$ ...... (eq-1)

也就是预测新输入 $\bm{x}^\*$ 的输出 $\bm{y}^\*$ 的概率分布。

-----

计算后验分布时，最重要的是需要计算 normalizer

> *边缘分布 model evidence* (or *marginal likelihood*): $p(\bm{Y}|\bm{X}) = \int p(\bm{Y}|\bm{X},\bm{\omega})\, p(\bm{\omega})\, \rm{d}\bm{\omega}$

也被称作 *marginalising* the likelihood over $\bm{\omega}$.
除了对于很简单的情况，这一过程一般没有解析的方法。

-------

*娈分推断 variational inference (Bayesian)*（我第一次听说）
------------------------------

因为通常无法准确计算 *后验分布*，所以定义一个

> *变分推断 variational distribution*: $q_{\bm{\theta}}(\bm{\omega})$

通过最小化 Kullback–Leibler (KL) divergence 或者最大化 evidence lower bound (ELBO) 来实现
- 尽可能地解释、拟合、接近数据的分布
- 尽可能地接近先验分布（起到 Occam razor 的作用）

变分推断使用 *最优化* 替代了 Bayesian 推断中的 *marginalizing* 的过程，即使用微分代替了积分。
计算微分通常更简单。
这一方法属于 Bayesian modelling 的经典技巧。

这一方法尽可能多地 Bayesian modelling 的优势：
- 复杂模型和解释数据之间的平衡
- 生成包括模型不确定性的概率模型

This technique does not
scale to large data (evaluating R
qθ(ω) log p(Y|X,ω)dω requires calculations over the
entire dataset), and the approach does not adapt to complex models (models in which
this last integral cannot be evaluated analytically). Recent advances in VI allow us to
circumvent these difficulties, and we will get back to this topic later in §3.1.

核心思想是用 可以处理的 相对简单的 概率分布，去近似真实的分布。

----------

> *Kullback–Leibler (KL) divergence*: 
$ {\rm KL}(q\_\theta(\bm{\omega})||p(\bm{\omega}||\bm{X},\bm{Y})) = \int q\_\theta(\bm{\omega}) \log \frac{q\_\theta(\bm{\omega})}{p(\bm{\omega}|\bm{X},\bm{Y})}\, {\rm d}\bm{\omega}$

> *Lower evidence bound*:
$ \mathcal{L}\_{\rm VI} = \int q\_\theta(\bm{\omega})\, \log p(\bm{Y}|\bm{X},\bm{\omega})\, {\rm d}\bm{\omega} - {\rm KL}( q\_\theta(\bm{\omega})||p(\bm{\omega}) ) $
>
> 这里作者定义的 $\mathcal{L}$ 看起来很奇怪，其它地方定义为 
> $ \log p(\bm{Y}|\bm{X}) - {\rm KL}(q\_\theta(\bm{\omega})||p(\bm{\omega}|\bm{X},\bm{Y})) $
> 或者
> $ \mathbb{E}\[\log p(\bm{\omega},\bm{Y}|\bm{X})\] + \mathbb{H}(\bm{\omega}) $
> 经验证都是相等的（todo: 需要检查，待更深入理解后）

最小化 KL divergence 可以得到 $p(\bm{\omega}|\bm{X},\bm{Y})$ 的近似 $q^\*\_\theta(\bm{\omega})$, 然后就可以代入 (eq-1) 中进行近似推理。

等价于 最大化 $\mathcal{L}\_{\rm VI}$。

本质上有 $ \log p(\bm{Y}|\bm{X}) = \mathcal{L} + {\rm KL} $，由于 $\rm KL$ 非负，所以最小化 KL 等价最大化 $\mathcal{L}$。

这里讲了更多的关于 KL divergence 和 $\mathcal{L}$ 的原理：
[Xitong YANG, Understanding the Variational Lower Bound](https://xyang35.github.io/2017/04/14/variational-lower-bound/)，其中提到关于计算方面的考虑，为什么通常选择最大化 $\mathcal{L}$。



Bayesian neural networks
========================


HMC
---

Hamiltonian Monte Carlo, also Hybrid Monte Carlo

was suggested for posterior inference, a technique based on dynamical
simulation that does not rely on any prior assumptions about the form of the posterior
distribution.

HMC makes use of Hamiltonian dynamics in
MCMC [Duane et al., 1987], following Newton’s laws of motion [Newton, 1687].

HMC
for example, even though shown to obtain good results, does not scale to large data
[Neal, 1995], and it is difficult to explain the technique to non-experts.




Markov chain Monte Carlo (MCMC) methods
=======================================

