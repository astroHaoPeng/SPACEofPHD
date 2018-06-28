---
title: 博士论文 "Uncertainty in Deep Learning" 阅读笔记
date: 2018-06-16 15:09:29
updated: 2018-06-27 17:47:51
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
$ {\rm KL}(q_\theta(\bm{\omega})||p(\bm{\omega}||\bm{X},\bm{Y})) = \int q_\theta(\bm{\omega}) \log \frac{q_\theta(\bm{\omega})}{p(\bm{\omega}|\bm{X},\bm{Y})}\, {\rm d}\bm{\omega}$

> *(Evidence Lower Bound (ELOB)*:
$ \mathcal{L}_{\rm VI} = \int q_\theta(\bm{\omega})\, \log p(\bm{Y}|\bm{X},\bm{\omega})\, {\rm d}\bm{\omega} - {\rm KL}( q_\theta(\bm{\omega})||p(\bm{\omega}) ) $
>
> 这里作者定义的 $\mathcal{L}$ 看起来~~很奇怪~~，其它地方定义为 
> $ \log p(\bm{Y}|\bm{X}) - {\rm KL}(q_\theta(\bm{\omega})||p(\bm{\omega}|\bm{X},\bm{Y})) $
> 或者
> $ \mathbb{E}\[\log p(\bm{\omega},\bm{Y}|\bm{X})\] + \mathbb{H}(\bm{\omega}) $
> 经验证都是相等的（todo: 需要检查，待更深入理解后）
>
> 补充：根据[这里](http://jorbe.sinaapp.com/2017/09/23/variational_and_variational_bayes_methods/)，论文作者定义的 ELOB 是通常定义。

最小化 KL divergence 可以得到 $p(\bm{\omega}|\bm{X},\bm{Y})$ 的近似 $q^\*_\theta(\bm{\omega})$, 然后就可以代入 (eq-1) 中进行近似推理。

等价于 最大化 $\mathcal{L}_{\rm VI}$。

本质上有 $ \log p(\bm{Y}|\bm{X}) = \mathcal{L} + {\rm KL} $，由于 $\rm KL$ 非负，所以最小化 KL 等价最大化 $\mathcal{L}$。

这里讲了更多的关于 KL divergence 和 $\mathcal{L}$ 的原理：
[Xitong YANG, Understanding the Variational Lower Bound](https://xyang35.github.io/2017/04/14/variational-lower-bound/)，其中提到关于计算方面的考虑，为什么通常选择最大化 $\mathcal{L}$。

更多的关于贝叶斯推断的学习笔记整理在这里：{% post_link Academics/all-about-bayesian %}



Bayesian neural networks
========================

Hinton 和 Van Camp 提出和采用把 $q(\bm{\omega})$ 分散为独立分布的乘积。

Neal 提出和采用 HMC 直接对后验分布采样。


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


使用高斯先验，收敛到 GP。
Neal
[1995] further studied different prior distributions in Bayesian NNs, and showed that in
the limit of the number of units the model would converge to various stable processes,
depending on the prior used (for example, the model would converge to a Gaussian
process when a Gaussian prior is used).




Markov chain Monte Carlo (MCMC) methods
=======================================

更多详细内容整理在：{% post_link markov-chain-monte-carlo %}




Bayesian Deep Learning
======================

Monte Carlo estimators in variational inference
-----------

在优化 $\mathcal{L}$ 时，需要计算积分相对 $q_\theta(\bm{\omega})$ 的偏微分。可以采用 Monte Carlo estimator 近似。

$$ I(\theta) = \frac{\partial}{\partial \theta} \int f(x) p_\theta(x)\, {\rm d}x $$

- score function estimator $\hat{I}_1$ (likelihood ratio estimator). Variance 较高，实际中常与 *variance reduction technique* 一同使用。

$$ \frac{\partial}{\partial \theta} \int f(x) p_\theta(x)\, {\rm d}x 
 = \int f(x) \frac{\partial}{\partial \theta} p_\theta(x)\, {\rm d}x 
 = \int f(x) \frac{\partial \log p_\theta(x)}{\partial \theta} p_\theta(x)\, {\rm d}x 
$$

- pathwise derivative estimator $\hat{I}_2$ (re-parametrisation trick, infinitesimal perturbation analysis, and stochastic backpropagation). 假设 $p_\theta(x)$ 可以改写为无参数的分布 $p(\epsilon)$，则 $ x = g(\theta,\epsilon) $ 是确定的可微的双参数变换。

$$\begin{aligned} 
\frac{\partial}{\partial \theta} \int f(x) p_\theta(x)\, {\rm d}x &= \frac{\partial}{\partial \theta} \int f(x) \left( \int p_\theta(x,\epsilon)\, {\rm d}\epsilon \right)\, {\rm d}x \\\\
 &= \frac{\partial}{\partial \theta} \iint f(x) p_\theta(x|\epsilon) p(\epsilon)\, {\rm d}\epsilon{\rm d}x \\\\
 &= \frac{\partial}{\partial \theta} \int \left( \int f(x) \sigma\left(x-g(\theta,\epsilon)\right)\, {\rm d}x \right) p(\epsilon)\, {\rm d}\epsilon \\\\
 &= \frac{\partial}{\partial \theta} \int f(g(\theta,\epsilon))p(\epsilon)\, {\rm d}\epsilon \\\\
 &= \int f'(g(\theta,\epsilon)) \frac{\partial}{\partial \theta} g(\theta,\epsilon) p(\epsilon)\, {\rm d}\epsilon
\end{aligned}$$

- characteristic function estimator $\hat{I}_3$. 依赖于 Gaussian 分布的特征函数。$\frac{\partial}{\partial \mu}$ 与 $\hat{I}_2$ 完全相同，

$$ \frac{\partial}{\partial \sigma} \int f(x) p_\theta(x)\, {\rm d}x
  = 2\sigma \cdot \frac{1}{2} \int f''(x) p_\theta (x)\, {\rm d}x
$$

通常对 Variance 的估计，$\hat{I}_1 > \hat{I}_2 > \hat{I}_3$，作者提出一个条件可以判断什么时候 2，3 比 1 更优（没有仔细研究，感觉用处不大）。作者在后文中重点使用 $\hat{I}_2$。

[comment]: # ( {% asset_img algorithm-1.png %} )

[comment]: # ( {% asset_img algorithm-2.png %} )

作者证明，当选择的 $p(\omega)$ 满足一定条件时，使用 dropout 训练得到的 NN 就是 BNN。



Model Uncertainty in BNN
------------------------

注意区分 预测方差 $q_\theta(\bm{y}|\bm{x})$ 和 后验方差 $q_\theta(\bm{\omega})$。


(Predictive variance and posterior variance). It is important to note the
difference between the variance of the approximating distribution qθ(ω) and the
variance of the predictive distribution qθ(y|x) (eq. (3.15)).

### 对 regression 问题：

We will perform moment-matching and estimate the first two moments of the predictive
distribution empirically. The first moment can be estimated as follows:

（证明过程在 pp47--48）

一阶矩 / first moment: $ \hat{\mathbb{E}}[\bm{y}^\*] = \frac{1}{T} \sum f^{\hat{\bm{\omega}}}(\bm{x}^\*) $

二阶矩 / second raw moment: $ \hat{\mathbb{E}}[(\bm{y}^\*)^T(\bm{y}^\*)] = \tau^{-1}\bm{I} + \frac{1}{T} \sum f^{\hat{\bm{\omega}}}(\bm{x}^\*)^T f^{\hat{\bm{\omega}}}(\bm{x}^\*) $

预测方差 / predictive variance: $ \hat{\rm Var}[\bm{y}^\*] = \tau^{-1}\bm{I} + \frac{1}{T} \sum f^{\hat{\bm{\omega}}}(\bm{x}^\*)^T f^{\hat{\bm{\omega}}}(\bm{x}^\*) - \hat{\mathbb{E}}[y^\*]^T \hat{\mathbb{E}}[y^\*] $

（利用了 $\mathbb{E}[x^2] = \mathbb{E}(x)^2 + {\rm Var}(x)$，通过一、二阶矩来计算方差。）

本论文中，实际计算中，$f^{\hat{\bm{\omega}}}(\bm{x}^\*)$ 为使用 $T=10000$ 次 Dropout 训练的输出。

其中 $tau$ 的模型精度，在 p18 给出定义 $p(\bm{y}|\bm{x},\bm{\omega}) = \mathcal{N}(\bm{y};f^\bm{\omega}(\bm{x}),\tau^{-1}\bm{I})$，可能理解为在输出中添加方差为 $\tau^{-1}$ 的噪声。

> 问题：
> - 应用到目前的轨道预测问题时，$\tau$ 是否应该是个常数？
> - 如果不是常数，怎么拓展到 $\tau(\Delta t)$？
>
> 在 Gauss Processes Regression 中存在同样的问题。但是 GPR 中似乎拓展比较容易（？待确认）。

作者 Gal 在代码中应该是使用 Bayesian Optimization 的办法，对 $\tau$ 进行遍历找到合适的参数。


### 对 classification 问题：（有对应的几种策略，暂时用不到，未看）



### 现实中的几个局限性：
1. 训练时间不变，测试时间变T倍，但是对于GPU计算影响不大，因为有mini-batch; 
2. 模型的uncertainty没有很好的办法进行校准，现实中会导致对不同的数据集不确定性不同（没太看懂）; 
3. 变分推断VI已知会低估predictive variance。






具体研究开源的代码
===============

4.3 Quantitative comparison
---------------------------

https://github.com/yaringal/DropoutUncertaintyExps

这部分好像没有 regression，不过代码更简单、基础一些。

~~YearPredictionMSD~~

repo 中没有 data：data too big to fit in repo; please get in touch for dataset

**bostonHousing**

- from keras.models import Sequential
- from keras.layers.core import Dense, Dropout, Activation

使用了 Keras 中直接有的 Dropout 来实现网络的 construct 和 train。

这部分代码是预测时的关键步骤：

算 log-likelihood 做什么？ # We compute the test log-likelihood

Gal 的代码是 2016 年的版本：DropoutUncertaintyExps。
实验部分可以运行。
Bayesian Optimization 参数的部分，spearmint 和 tensorflow=1.1.0 要求的 protobuf 版本依赖。（暂时没有解决，不会配置）



4.2
----

Gal 主要实现了 4 种 VI 算法：
- Bernoulli approximating distribution, implemented as **dropout**:
- Multiplicative Gaussian approximating distribution, implemented as multiplicative
Gaussian noise (MGN):
- fully factorised Gaussian distribution
- mixture of Gaussians (MoG) with two mixture components, factorised over
the rows of the weight matrices





4.6 Heteroscedastic uncertainty
-------------------------------

https://github.com/yaringal/HeteroscedasticDropoutUncertainty


Homoscedastic regression assumes identical observation noise for every input
point x. Heteroscedastic regression, on the other hand, assumes that observation noise
can vary with input x [Le et al., 2005].
- Homoscedastic/同方差的
- Heteroscedastic/异方差的

Heteroscedastic uncertainty 每个数据点 $\bm{x}$ 的观测噪音不同。


