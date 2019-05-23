---
title: Reading Notes of PRML (Bishop2016)
comments: true
categories:
  - [Notes, Book Notes]
tags:
  - book
  - machine learning
mathjax: true
abbrlink: 97ae8555
date: 2018-09-26 16:15:43
updated: 2018-10-10 17:35:14
---

> Christopher M. Bishop, <mark>Pattern recognition and machine learning</mark>, New York: Springer, 2006.

This reading note is served as <mark>a quick reference and short summary</mark> of the PRML book.
Read the book first.
It is *incorrect* to trying to understand the book through reading this post. 

Basically, I was just trying to simplify the book by extracting only useful definitions, equations, formulas, and explanations. 
So, to understand the context here, one should <mark>study the PRML book first</mark>. 

# Relationship among Sections

(TBD)

<!-- {% mermaid sequenceDiagram %}
{% endmermaid %} -->


<!-- more -->

# 1

## 1.2 Probability Theory

> The first term in (1.71) represents the uncertainty in the
predicted value of t due to the noise on the target variables and was expressed already
in the maximum likelihood predictive distribution (1.64) through β
−1
ML. However, the
second term arises from the uncertainty in the parameters w and is a consequence
of the Bayesian treatment.

# 2

## 2.3 Gaussian Distribution
Gaussian Distribution:
$$
\mathcal{N}(\bm{x}|\bm{\mu},\Sigma) = \frac{1}{(2\pi)^{D/2}} \frac{1}{|\Sigma|^{1/2}} \exp \left[ -\frac{1}{2}(\bm{x}-\bm{\mu})^T \Sigma^{-1} (\bm{x}-\bm{\mu}) \right]
\tag{2.42}
$$
- $D$ is dimension of $\bm{x}$.

These equations are used for ``completing the square''。
$$
\begin{aligned}
-\frac{1}{2}(\bm{x}-\bm{\mu})^T\Sigma^{-1}(\bm{x}-\bm{\mu}) &= 
-\frac{1}{2}(\bm{x}_a-\bm{\mu}_a)^T\Lambda_{aa}^{-1}(\bm{x}_a-\bm{\mu}_a) 
-\frac{1}{2}(\bm{x}_a-\bm{\mu}_a)^T\Lambda_{ab}^{-1}(\bm{x}_b-\bm{\mu}_b) \\
&\phantom{=} -\frac{1}{2}(\bm{x}_b-\bm{\mu}_b)^T\Lambda_{ba}^{-1}(\bm{x}_a-\bm{\mu}_a) 
-\frac{1}{2}(\bm{x}_b-\bm{\mu}_b)^T\Lambda_{bb}^{-1}(\bm{x}_b-\bm{\mu}_b)    \end{aligned}
\tag{2.70}$$
$$
-\frac{1}{2}(\bm{x}-\bm{\mu})^T\Sigma^{-1}(\bm{x}-\bm{\mu}) = -\frac{1}{2} \bm{x}^T\Sigma^{-1}\bm{x} + \bm{x}^T\Sigma^{-1}\bm{\mu} + \text{terms independent of } \bm{x}    \tag{2.71}$$

### Conditional Gaussian distributions

> Some properties of Gaussian distributions are most naturally expressed in terms of the covariance, whereas others take a simpler form when viewed in terms of the precision. (p.85)

Covariance Matrix:
$$\Sigma = \Lambda^{-1} = \left[\begin{matrix} \Sigma_{aa} & \Sigma_{ab} \\ \Sigma_{ba} & \Sigma_{bb}\end{matrix}\right]$$

Precision Matrix:
$$\Lambda = \Sigma^{-1} = \left[\begin{matrix} \Lambda_{aa} & \Lambda_{ab} \\ \Lambda_{ba} & \Lambda_{bb}\end{matrix}\right]$$

Conversion between covariance and precision matrixes.
$$\left[\begin{matrix} A&B \\ C&D \end{matrix}\right]^{-1} = \left[\begin{matrix} M & -MBD^{-1} \\ -D^{-1}CM & D^{-1}+D^{-1}CMBD^{-1} \end{matrix}\right]$$
- $M = (A-BD^{-1}C)^{-1}$

Consider the functional dependence of (2.70) on $\bm{x}_a$ in which $\bm{x}_b$ is regarded as a constant: 
- pick out all terms that are second order in $\bm{x}_a$ 
- consider all of the terms that are linear in $\bm{x}_a$

$$\bm{\mu}_{a|b} = \bm{\mu}_a-\Lambda_{aa}^{-1}\Lambda_{ab}(\bm{x}_b-\bm{\mu}_b)  =  \bm{\mu}_a + \Sigma_{ab}\Sigma_{bb}^{-1}(\bm{x}_b-\bm{\mu}_b)  \tag{2.81}$$
$$\Sigma_{a|b} = \Lambda_{aa}^{-1}  =  \Sigma_{aa}-\Sigma_{ab}\Sigma_{bb}^{-1}\Sigma_{ba}   \tag{2.82}$$

$$p(\bm{x}_a|\bm{x}_b) = \mathcal{N}(\bm{\mu}_{a|b},\Lambda_{aa}^{-1})   \tag{2.96}$$

### Marginal Gaussian distributions

> For a marginal distribution, the mean and covariance are most simply expressed
in terms of the partitioned covariance matrix, in contrast to the conditional
distribution for which the partitioned precision matrix gives rise to simpler expressions. (p.89)

MARGINAL distribution:
$$p(\bm{x}_a) = \int p(\bm{x}_a,\bm{x}_b) \cdot \rm{d}\bm{x}_b$$

Procedure:
- Pick out terms in (2.70) that involves $\bm{x}_b$: $-\frac{1}{2}\bm{x}_b^T\Lambda_{bb}\bm{x}_b + \bm{x}_b^T\bm{m}$, where $\bm{m}=\Lambda_{bb}\bm{\mu}_b-\Lambda_{ba}(\bm{x}_a-\bm{\mu}_a)$.
- Completing the square:$-\frac{1}{2}(\bm{x}_b-\Lambda_{bb}^{-1}\bm{\mu}_b)\Lambda_{bb}(\bm{x}_b-\Lambda_{bb}^{-1}\bm{\mu}_b) + \frac{1}{2}\bm{m}^T\Lambda_{bb}^{-1}\bm{m}$
- Integrating exponential of this quadratic form over $\bm{x}_b$: 
    - first term is an unnormalized Gaussian, results is reciprocal of the normalization coefficient
    - second term goes into $p(\bm{x}_a)$ as following
- Combining the second term with the terms from (2.70) that depend on $\bm{x}_a$, then complete the square.

$$\Sigma_{aa} = (\Lambda_{aa}-\Lambda_{ab}\Lambda_{bb}^{-1}\Lambda_{ba})^{-1}   \tag{2.88}$$

$$p(\bm{x}_a) = \mathcal{N}(\bm{x}_a|\bm{\mu}_a,\Sigma_{aa})   \tag{2.98}$$



### Bayes’ theorem for Gaussian variables
GIVEN:
- Gaussian marginal distribution $p(\bm{x}) = \mathcal{N}(\bm{x}|\bm{\mu},\Lambda^{-1})$
- Gaussian conditional distribution $p(\bm{y}|\bm{x}) = \mathcal{N}(\bm{y}|A\bm{x}+\bm{b},L^{-1})$
    - $A$ and $L$ are PRECISION matrixes

WANT:
- Marginal distribution
$$p(\bm{y}) = \mathcal{N}(\bm{y}|A\bm{\mu}+\bm{b},L^{-1}+A\Lambda^{-1}A^T) \tag{2.111 or 2.115}$$
- Conditional distribution 
$$p(\bm{x}|\bm{y}) = \mathcal{N}(\Sigma[A^TL(\bm{y}-\bm{b})+A\bm{\mu}],\Sigma))\tag{2.112 or 2.116}$$
$$\Sigma = (\Lambda+A^TLA)^{-1}$$

### Bayesian inference for the Gaussian (p.97)
Did not finish this part of reading.


## 2.4. The Exponential Family 
> The probability distributions that we have studied so far in this chapter (with the exception of the Gaussian mixture) are specific examples of a broad class of distributions called the exponential family (Duda and Hart, 1973; Bernardo and Smith, 1994). 

> Members of the exponential family have many important properties in common, and it is illuminating to discuss these properties in some generality.

## 2.5. Nonparametric Methods (p.120)

> Throughout this chapter, we have focussed on the use of probability distributions
having specific functional forms governed by a small number of parameters whose
values are to be determined from a data set. This is called the parametric approach
to density modelling.


## 3.1 Linear Basis Function Model

$$y=\bm{w}^T\bm{\phi}(\bm{x})$$

where $\bm{w}=(w_0,\omega_1,\dots,w_{M-1})^T$, $\bm{\phi}=(\phi_0,\phi_1,\dots,\phi_{M-1})^T$

$$t=y(\bm{x},\bm{w})+\epsilon$$
$$p(t|\bm{x},\bm{w},\beta) = \mathcal{N}(t|y(\bm{x},\bm{w}),\beta^{-1}) \tag{3.8}$$

Now consider a data set of inputs $X = \{\bm{x}_1,\dots,\bm{x}_N\}$ with corresponding target values $\bm{t}=\{t_1,\dots,t_N\}$.

ASSUMPTION: data points in $(X, \bm{t})$ are drawn independently from the distribution (3.8).

LIKELIHOOD function:
$$p(\bm{t}|\bm{X},\bm{w},\beta) = \prod_{n=1}^{N} \mathcal{N}(t_n|\bm{w}^T\bm{\phi}(\bm{x}_n),\beta^{-1})   \tag{3.10}$$
- $X$ is usually omitted for simplicity

Log-likelihood function:
$$\ln p(\bm{t}|\bm{w},\beta) = \sum_{n=1}^N \ln \left( \frac{1}{2\pi\beta^{-1/2}} \exp\left[ -\frac{\beta}{2} (\bm{t}_n-\bm{w}^T\bm{\phi}(\bm{x}_n))^T(\bm{t}_n-\bm{w}^T\bm{\phi}(\bm{x}_n)) \right] \right)$$
$$= -\frac{N}{2}\ln(2\pi) + \frac{N}{2}\ln\beta - \frac{\beta}{2} \sum_{n=1}^{N}\|\bm{t}_n-\bm{w}^T\bm{\phi}(\bm{x}_n)\|^2  \tag{3.11 + 3.12}$$

<!-- $$
\mathcal{N}(\bm{x}|\bm{\mu},\Sigma) = \frac{1}{(2\pi)^{D/2}} \frac{1}{|\Sigma|^{1/2}} \exp \left[ -\frac{1}{2}(\bm{x}-\bm{\mu})^T \Sigma^{-1} (\bm{x}-\bm{\mu}) \right]
\tag{2.42}
$$ -->

Having written down the likelihood function, we can use *maximum likelihood* to determine $\bm{w}$ and $\beta$.
(Take gradient, and then set this gradient to zero gives)

MAX LIKELIHOOD weights $\bm{w}_\text{ML}$:
$$\bm{w}_\text{ML}=(\Phi^T\Phi)^{-1}\Phi^T\bm{t}    \tag{3.15}$$

## 3.3 Bayesian Linear Regression

> We therefore turn to a Bayesian treatment of linear regression, which will
avoid the over-fitting problem of maximum likelihood, and which will also lead to
automatic methods of determining model complexity using the training data alone. (p.152)

CONJUGATE PRIOR distribution of $\bm{w}$ w.r.t. the LIKELIHOOD in Eq.3.10 (conjugate means both prior and posterior are the same distribution):
$$p(\bm{w})=\mathcal{N}(\bm{w}|\bm{m}_0,S_0)    \tag{3.48}$$

POSTERIOR distribution: (completing the square, or directly using Eq.2.116) (is Gaussian due to the choice of CONJUGATE prior)
$$p(\bm{w}|\bm{t}) = \mathcal{N}(\bm{w}|\bm{m}_N,S_N)   \tag{3.49}$$
$$\bm{m}_N = S_N(S_0^{-1}\bm{m}_0+\beta\Phi^T\bm{t})$$
$$S_N^{-1}=S_0^{-1}+\beta\Phi^T\Phi$$

MAXIMUM POSTERIOR WEIGHT: (The posterior distribution is Gaussian, its mode coincides with its mean.) 
$$\bm{w}_\text{MAP} = \bm{m}_N$$
[Or, solve $\partial \ln p(\bm{w}|\bm{t})/\partial \bm{w} = 0$ to get the MAP weights.]

If $S_0$ is infinitely broad, $S_0^{-1}\rightarrow0$, then the mean $\bm{m}_N$ reduces to the maximum likelihood weights $\bm{w}_\text{ML}$ in Eq.3.15.

> ([Wikipedia: Maximum a posteriori estimation](https://en.wikipedia.org/wiki/Maximum_a_posteriori_estimation)) In Bayesian statistics, a maximum a posteriori probability (MAP) estimate is an estimate of an unknown quantity, that equals the mode of the posterior distribution. The MAP can be used to obtain a point estimate of an unobserved quantity on the basis of empirical data. It is closely related to the method of maximum likelihood (ML) estimation, but employs an augmented optimization objective which incorporates a prior distribution (that quantifies the additional information available through prior knowledge of a related event) over the quantity one wants to estimate. MAP estimation can therefore be seen as a regularization of ML estimation.
> 
> While only mild conditions are required for MAP estimation to be a limiting case of Bayes estimation (under the 0-1 loss function),[1] it is not very representative of Bayesian methods in general. This is because MAP estimates are point estimates, whereas Bayesian methods are characterized by the use of distributions to summarize data and draw inferences: thus, Bayesian methods tend to report the posterior mean or median instead, together with credible intervals.
> 
> 一种点估计方法。

> [另一个参考博客：MLE vs MAP](https://wiseodd.github.io/techblog/2017/01/01/mle-vs-map/)


In the following book, usually takes:
$$p(\bm{w}|\alpha) = \mathcal{N}(\bm{w}|\bm{0},\alpha^{-1}\bm{I})   \tag{3.52}$$

LOG POSTERIOR of $\bm{w}$:
$$\ln p(\bm{w}|\bm{t})=-\frac{\beta}{2}\sum_{n=1}^N \{t_n-\bm{w}^T\bm{\phi}(\bm{x}_n)\}^2 - \frac{\alpha}{2}\bm{w}^T\bm{w} + \text{const w.r.t. } \bm{w},    \tag{3.55}$$
which is equivalent to add a quadratic regularization term with coefficient $\lambda=\alpha/\beta$. 
> Maximization of this posterior distribution with respect to w is therefore equivalent
to the minimization of the sum-of-squares error function with the addition of a
quadratic regularization term, corresponding to ~~Eq.3.27~~ with $\lambda=\alpha/\beta$.

Then, we have [Similar to how we get Eq.3.49, let gradient be zero, or use Gaussian distribution's property.]
$$\bm{m}_N = \beta S_N\Phi^T\bm{t}  \tag{3.53}$$
$$S_N^{-1}=\alpha\bm{I}+\beta\Phi^T\Phi \tag{3.54}$$


PREDICTED distribution: (input vectors $X$ are omitted in the conditioning statements to simplify the notation) ($\bm{x}$ is the new value, $t$ is its prediction)
$$p(t|\bm{t},\alpha,\beta)=\int p(t|\bm{w},\beta)p(\bm{w}|\bm{t},\alpha,\beta)\cdot {\rm d}\bm{w}   \tag{3.57}$$
$$= \mathcal{N}(t|\bm{m}_N^T\bm{\phi}(\bm{x}),\sigma_N^2(\bm{x}))   \tag{3.58}$$
where
$$\sigma_N^2(\bm{x}) = \beta^{-1} + \bm{\phi}(\bm{x})^T S_N \bm{\phi}(\bm{x})       \tag{3.59}$$

> The first term in (3.59) represents the noise on the data. 
> 
> The second term reflects the uncertainty associated with the parameters $\bm{w}$.
> 
> Because the noise process and the distribution of $\bm{w}$ are independent Gaussians, their variances are additive.


## 3.4 Bayesian Model Comparison

> The **model evidence** is sometimes also called the **marginal likelihood** because it can be viewed as a likelihood function over the space of models, in which the parameters have been marginalized out. (p.162)

Our uncertainty is expressed through a prior probability distribution $p(\mathcal{M}_i)$. Given a training set $\mathcal{D}$, we then wish to evaluate the posterior distribution

$$p(\mathcal{M}_i|\mathcal{D}) \propto p(\mathcal{D}|\mathcal{M_i}) p(\mathcal{M}_i)    \tag{3.66}$$

The model evidence $p(\mathcal{D}|\mathcal{M}_i)$ expresses the preference shown by the data for different models.

## 3.5 Evidence Apparoximation

[$\bm{w}_{\rm MAP}$ 是可以解析得到的，但是 $\alpha$ 和 $\beta$ 需要用某种参数估计的方法得到 point estimation，便是这一章节要解决的问题。]

> Full Bayesian treatment of the linear basis function model, we introduce prior distributions over the hyperparameters $\alpha$ and $\beta$ and make predictions by marginalizing with respect to these hyperparameters as well as with respect to the parameters $\bm{w}$. 
>
> However, although we can integrate analytically over either $\bm{w}$ or over the hyperparameters, the complete marginalization over all of these variables is analytically intractable. Here we discuss an approximation in which we set the hyperparameters to specific values determined by maximizing the marginal likelihood function obtained by first integrating over the parameters $\bm{w}$.
> 
> 通过最大化把权重积分掉的marginal likelihood设置所有的超参数（学习过程），最终预测时对权重进行积分。

Empirical Bayes (statistics literature) 
== type 2 maximum likelihood (statistics) 
== generalized maximum likelihood (statistics) 
== evidence approximation (machine learning literature)

There are two approaches to the maximization of the log marginal likelihood (log evidence): (p.166) 
**(These two approaches converge to the same solution.)**
1. Evaluate the evidence function analytically and then set its derivative equal to zero to obtain re-estimation equations for $\alpha$ and $\beta$ (in Section 3.5.2). 
2. Use a technique called the expectation maximization (EM) algorithm (in Section 9.3.4). 

### 3.5.1 Evaluation of the evidence function

MARGINAL LIKELIHOOD function: see Eq.(3.8) and Eq.(3.52); using Eq.(2.115)
$$p(\bm{t}|\alpha,\beta)=\int p(\bm{t}|\bm{w},\beta) p(\bm{w}|\alpha)\cdot {\rm d}\bm{w}    \tag{3.77}$$
$$=\left(\frac{\beta}{2\pi}\right)^{N/2} \left(\frac{\alpha}{2\pi}\right)^{M/2} \int \exp\{-E(\bm{w})\} \cdot {\rm d}\bm{w} \tag{3.78}$$
where
$$E(\bm{w}) = \beta E_D(\bm{w}) + \alpha E_W(\bm{w}) = \frac{\beta}{2}\|\bm{t}-\Phi\bm{w}\|^2 + \frac{\alpha}{2}\bm{w}^T\bm{w}  \tag{3.79}$$
completing the square
$$E(\bm{w}) = E(\bm{m_N}) + \frac{1}{2}(\bm{w}-\bm{m}_N)^T A (\bm{w}-\bm{m}_N)  \tag{3.80}$$
where 
$$A = \alpha\bm{I} + \beta\Phi^T\Phi    \tag{3.81}$$
$$E(m_N)=\frac{\beta}{2}\|\bm{t}-\Phi\bm{w}\|^2+\frac{\alpha}{2}\bm{m}_N^T\bm{m}_N  \tag{3.82}$$
$$\bm{m}_N=\beta A^{-1}\Phi^T\bm{t} \tag{3.84}$$
Seeing $A=S_N^{-1}$ in Eq.(3.54), Eq.(3.84) is equivalent to Eq.(3.53). 

Then,
$$\int \exp\{-E(\bm{w})\} \cdot{\rm d}\bm{w} = \exp\{-E(\bm{m}_N)\}(2\pi)^{M/2}|A|^{-1/2}   \tag{3.85}$$

LOG MARGINAL LIKELIHOOD function:
$$\ln p(\bm{t}|\alpha,\beta) = \frac{M}{2}\ln\alpha + \frac{N}{2}\ln\beta - E(\bm{w}) - \frac{1}{2}\ln|A| - \frac{N}{2}\ln{2\pi}    \tag{3.86}$$


## 3.6 Limitations of Fixed Basis Functions


# 7

## 7.2 Relevance Vector Machines

> However, the key difference in the RVM is that we introduce a separate hyperparameter αi for each of the weight parameters wi instead of a single shared hyperparameter. (p.346)

$$p(\bm{w}|\bm{\alpha}) = \prod_{i=1}^M \mathcal{N}(w_i|0,\alpha_i^{-1})    \tag{7.80}$$
where $\alpha_i$ represents the precision of the corresponding parameter $w_i$.

$$p(\bm{w}|\bm{t},X,\bm{\alpha},\beta) = \mathcal{N}(\bm{w}|\bm{m},\Sigma)  \tag{7.81}$$
where
$$\bm{m} = \beta\Sigma\Phi^T\bm{t}  \tag{7.82}$$
$$\Sigma = (A+\beta\Phi^T\Phi)^{-1}     \tag{7.83}$$
and they are determined by maximizing the marginal likelihood function
$$p(\bm{t}|X,\bm{\alpha},\beta) = \int p(\bm{t}|X,\bm{\beta},\bm{w})p(\bm{w}|\bm{\alpha}) \cdot {\rm d}\bm{w}    \tag{7.84}$$
$$\log p(\bm{t}|X,\bm{\alpha},\beta) = \ln \mathcal{N}(\bm{t}|0,C) = \frac{1}{2} \left[ N\ln(2\pi) + \ln|C| + \bm{t}^TC^{-1}\bm{t} \right]   \tag{7.85}$$
where 
$$C = \beta^{-1}I + \Phi A^{-1} \Phi^T     \tag{7.86}$$

> The values of $\bm{\alpha}$ and $\beta$ are determined using type-2 maximum likelihood, also known as the evidence approximation, in which we maximize the marginal likelihood function obtained by integrating out the weight parameters. (p.347)

> It is worth emphasizing, however, that this mechanism (of automatic relevance determination) for achieving sparsity in probabilistic models through automatic relevance determination is quite general and can be applied to any model expressed as an adaptive linear combination of basis functions.
> 
> （稀疏性来自于应用automatic relevance determination, ARD算法；与SVM类似）

PREDICTIVE distribution: (after finding optimum $\bm{\alpha}^*$ and $\beta^*$)
$$
\begin{aligned}
p(t|\bm{x},X,\bm{t},\bm{\alpha}^*,\beta^*) &= \int p(t|\bm{x},\bm{w},\beta^*) p(\bm{w}|X,\bm{t},\bm{\alpha}^*,\beta^*) \cdot {\rm d}\bm{w}\\
 &= \mathcal{N}(\bm{m}^T\bm{\phi}(\bm{x})),\sigma^2(\bm{x})    \tag{7.90}
\end{aligned}
$$
where
$$\sigma^2(\bm{x})=(\beta^{*})^{-1} + \bm{\phi}(\bm{x})^T\Sigma\bm{\phi}(\bm{x})    \tag{7.91}$$


> The principal disadvantage of the RVM compared to the SVM is that training
involves optimizing a nonconvex function, and training times can be longer than for a
comparable SVM.

> More significantly, in the relevance vector
machine the parameters governing complexity and noise variance are determined
automatically from a single training run



# 9. Mixture Models and EM (expectation maximization)

## 9.4. The EM Algorithm in General

> The expectation maximization algorithm, or EM algorithm, is a general technique for finding maximum likelihood solutions for probabilistic models having latent variables (Dempster et al., 1977; McLachlan and Krishnan, 1997). (p.450)

denote all of the observed variables by $\bm{X}$ 
and all of the hidden variables by $\bm{Z}$ (also referred to as *latent variables*). 
The joint distribution $p(\bm{X},\bm{Z}|\bm{\theta})$ is governed by a set of parameters denoted $\bm{\theta}$. 
The likelihood function is
$$p(\bm{X}|\bm{\theta}) = \sum_{\bm{Z}} p(\bm{X},\bm{Z}|\bm{\theta})    \tag{9.69}$$
where we suppose that direct optimization of $p(\bm{X}|\bm{\theta})$ is difficult, but the optimization
of the complete-data likelihood function $p(\bm{X},\bm{Z}|\bm{\theta})$ is significantly easier. 

Introduce a distribution $q(\bm{Z})$ defined over the latent variables, the following decomposition hold
$$\ln p(\bm{X}|\bm{\theta}) = \mathcal{L}(q,\bm{\theta}) + {\rm KL}(q\|p)   \tag{9.70}$$
where
$$\mathcal{L}(q,\bm{\theta}) = \sum_{\rm Z} q(\bm{Z}) \ln\left\{ \frac{p(\bm{X},\bm{Z}|\bm{\theta})}{q(\bm{Z})} \right\}   \tag{9.71}$$
$${\rm KL}(q\|p) = -\sum_{\bm{Z}} q(\bm{Z})\ln \left\{ \frac{p(\bm{Z}|\bm{X},\bm{\theta})}{q(\bm{Z})} \right\}    \tag{9.72}$$
where KL is the <mark>Kullback-Leibler divergence</mark> between
$q(\bm{Z})$ and the *posterior distribution* $p(\bm{Z}|\bm{X}, \bm{\theta})$. 

> The EM algorithm is a two-stage iterative optimization technique for finding maximum likelihood solutions. (p.451)
> - In the E step, the lower bound $\mathcal{L}(q, \bm{\theta}^{\rm old})$ is maximized with respect to $q(\bm{Z})$ while holding $\bm{\theta}^{\rm old}$ fixed.
> - In the M step, the distribution $q(\bm{Z})$ is held fixed and the lower bound $\mathcal{L}(q, \bm{\theta})$ is maximized with respect to $\bm{\theta}$ to give some new value $\bm{\theta}^{\rm new}$.

> The EM algorithm breaks down the potentially difficult problem of maximizing the likelihood function into two stages, the E step and the M step, each of which will often prove simpler to implement. (p.454)
> - The generalized EM, or GEM, algorithm addresses the problem of an intractable
M step.
> - We can similarly generalize the E step of the EM algorithm by performing a
partial, rather than complete, optimization of L(q, θ) with respect to q(Z) (Neal and
Hinton, 1999).

在需要使用 EM 时，还需要仔细研究这部分内容，理解不够深刻，还没有掌握到精髓所在。



# 10. Approximate Inference

Tasks:
- Evaluation of the posterior distribution $p(\bm{X}|\bm{X})$ given the observed data $\bm{X}$.
- Evaluation of the expectations with respect to $p(\bm{X}|\bm{Z})$.

Difficulties:
- The dimensionality of the latent space is too high.
- The posterior distribution is very complex such that expectations are not analytically tractable.

Approximateion schemes:
- (Sec. 10) Deterministic (never exact results; some scale well to large applications)
  - Laplace approximateion in Sec. 4.4
  - Variational Bayes (or, variational inference): minimize $KL(q||p)$
  - Expectation propagation: minimize $KL(p||q)$
- (Sec. 11) Stochastic (exact results given infinite computational resources; computationally demanding, small-scale problem.)
  - MCMC
  - ...



## 10.1. Variational Inference

Entropy $H[p] = \int p(x)\ln p(x)\, dt$ is a functional.

The approximation l
Restricting the range of functions over which the optimization of the functional is performed.


$$
\mathcal{L}(q) = \int q(\bm{Z}) \ln\left\{ \frac{p(\bm{X},\bm{Z})}{q(\bm{Z})} \right\}   \tag{10.3}
$$

$$
q(\bm{Z}) = \prod_{i=1}^M q_i(\bm{Z}_i)   \tag{10.5}
$$

Substitute (10.5) into (10.3) and then dissect out the dependence on one of the fastors $q_j(\bm{Z}_j)$,




# 11. Sampling Methods

<mark>Approximate inference methods based on numerical sampling</mark> is also known as <mark>Monte Carlo techniques</mark>.

For most situations, posterior (/pɑ'stɪrɪɚ/) distribution is required primarily for the purpose of evaluating expectations, for example, in order to make predictions. 

## 11.1 Basic Sampling Algorithms

- transform using the inverse accumulative distribution function
- rejection sampling
- adaptive rejection sampling
  - adaptive rejection Metropolis sampling
- importance sampling 
 
> (stopped here last time)