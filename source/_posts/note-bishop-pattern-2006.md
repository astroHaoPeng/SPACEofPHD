---
title: Reading Notes | PRML (Bishop 2006)
comments: true
categories:
  - [Notes, Book Notes]
tags:
  - book
  - machine learning
  - Bayesian inference
mathjax: true
abbrlink: 97ae8555
date: 2018-09-26 16:15:43
updated: 2019-06-07 12:09:43
---

{% note info %}
Christopher M. Bishop, <mark>Pattern recognition and machine learning</mark>, New York: Springer, 2006.
{% endnote %}

This reading note is served as <mark>a quick reference and short summary</mark> of the PRML book.
Read the book first.
It is *incorrect* to trying to understand the book through reading this post.

Basically, I was just trying to simplify the book by extracting only useful definitions, equations, formulas, and explanations.
So, to understand the context here, one should <mark>study the PRML book first</mark>.

{% note success %}
(p23) This book places a strong emphasis on the Bayesian viewpoint, reflecting the huge growth in the practical importance of Bayesian methods in the past few years, while also discussing useful frequentist concepts as required.
{% endnote %}


<!--# Relationship among Sections-->

<!-- more -->


<mark>TODO:</mark>
- see (#15-decision-theory), something about loss functions
- ~~see (#23-gaussian-distribution)~~
- ~~see (#35-evidence-approximation)~~
- see all sections **marked as (to read)**.
- see (#57-bayesian-neural-networks)
- see (#64-gaussian-processes)
- see (#9-mixture-models-and-em-expectation-maximization)




# 1. Introduction

## 1.2 Probability Theory

Bayes' theorem
$$ p(Y|X) = \frac{p(X|Y)p(Y)}{p(X)}. $$
The denominator can be expanded as a summation 
$$ p(X) = \sum_Y p(X|Y) p(Y), $$
which can be viewed as the normalization constant required to ensure that the sum of the conditional probability $p(Y|X)$ over all values of $Y$ equals one. 

Define $p(\mathcal{D}|w)$ as *likelihood function*, Bayes' theorem is stated in words
$$ posterior \propto likelihood \times prior,   \tag{1.44}$$
where all of these quantities are viewed as functions of $\bm{w}$.

In both the **Bayesian** and **frequentist** paradigms, the **likelihood function** $p(\mathcal{D}|\bm{w})$ plays a central role. However, the manner in which it is used is **fundamentally different** in the two approaches:
- Frequentist setting, $\bm{w}$ is considered to be a fixed parameter; its value is determined by an 'estimator', and error bars on this estimate are obtained by considering the distribution of possible data sets $\mathcal{D}$.
  - a widely used frequentist estimator, <mark>maximum likelihood</mark>: $\bm{w}$ is set to maximize the likelihood function $p(\mathcal{D}|\bm{w})$.
  - one approach to determine frequentist error bars is the <mark>bootstrap</mark>: resampling $L$ times from the original $N$ data points with replacement.
- Bayesian viewpoint, there is only a single data set $\mathcal{D}$ (the one observed), the uncertainty is expressed through a probability distribution over $\bm{w}$.
> Not quite understand yet... (as of 2019/06/07)

{% note warning %}
(p23) There has been much controversy and debate associated with the relative merits of the frequentist and Bayesian paradigms, which have not been helped by the fact that there is no unique frequentist, or even Bayesian, viewpoint.

This book places a strong emphasis on the Bayesian viewpoint, reflecting the huge growth in the practical importance of Bayesian methods in the past few years, while also discussing useful frequentist concepts as required.
{% endnote %}

### 1.2.4 The Gaussian ditribution

The maximum likelihood approach systematically underestimates the variance of the ditribution.
This is an example of a phenomenon called bias and is related to the problem of over-fitting encountered in the context of polynomial curve fitting.

Note that the bias of the maximum likelihood solution becomes less significant as the number $N$ of data points increases, and in the limit $N\lim\inf$ the maximum likelihood solution for the variance equals the true variance of the distribution that generated the data.

Adopting a Bayesian approach will automatically lead to an unbiased estimation of the variance.

### 1.2.5 Curve fitting re-visited

The sum-of-squares error function has arisen as a consequence of maximizing likelihood under the assumption of a Gaussian noise distribution.

Introduce a prior distribution over the polynomial coefficients $\bm{w}$, for simplicity, a Gaussian distritution
$$ p(\bm{w}|\alpha) = \mathcal{N}(\bm{w}|0,\alpha^{-1}\bm{I})   \tag{1.65}$$
<mark>Variables such as $\alpha$, which controls the distribution of model parameters, are called *hyperparameters*.</mark>
Then, using Bayes' theorem, the posterior distribution is
$$ p(\bm{w}|\bm{x},\bm{t},\alpha,\beta) \propto p(\bm{t}|\bm{x},\bm{w},\beta) p(\bm{w}|\alpha)  \tag{1.66} $$
Finding the most probable value of $\bm{w}$ given the data by maximing the posterior distribution is called *maximum posterior, MAP*.


### 1.2.6 Bayesian curve fitting

Discuss about how to make prediction using the Bayesian fitting in Sec. 1.2.5.

> The first term in (1.71) represents the uncertainty in the predicted value of $\bm{t}$ due to the noise on the target variables and was expressed already in the maximum likelihood predictive distribution (1.64) through $\beta^{-1}_ML$. 
> However, the second term arises from the uncertainty in the parameters $\bm{w}$ and is a consequence of the Bayesian treatment.

## 1.3 Model Selection

One major drawback of cross-validation is that the number of training runs that must be performed is increased by a factor of $S$, and this can prove problematic for models in which the training is itself computationally expensive.

We need a better approach. Ideally, this should rely only on the training data and should allow multiple hyperparameters and model types to be compared in a single training run.
We therefore need to find a measure of performance which depends only on the training data and 
which does not suffer from bias due to over-fitting.

Historically various 'information criteria' have been proposed:
- Akaike information criterion, AIC, $\ln p(\mathcal{D}|\bm{w}_{\rm ML}) - M$
- Bayesian information criterion, BIC (see Sec.4.4.1)
- ...
Such criteria do not take account of the uncertainty in the mdoel parameters; tend to favour overly simple models.

In Sec. 3.4, a fully Bayesian approach lead to that complexity penalties arise in a natural and principled way.

<span style="color:red">
[THIS IS EXACTLY THE TECHNIQUE WE NEED FOR THE MACHINE LEARNING APPROACH STUDY.]
</span>

# 1.4 The Curse of Dimensionality

# 1.5 Decision Theory

From 1.5.1 to 1.5.4 discuss decision theory in the context of calssification problem.
## 1.5.1 Minimizing the misclassification rate
## 1.5.2 Minimizing the expected loss
## 1.5.3 The reject option
## 1.5.4 Inference and decision


## 1.5.5 Loss functions for regression


# 1.6 Information Theory

Suppose that a sender wishes to transmit the value of a random variable to a receiver.
The average amount of information that they transmit in the process is obtained by taking the expectation of (1.92) with respect to the distribution $p(x)$ and is given by 
$$ H[x] = -\sum p(x) \log_2 p(x).  \tag{1.93}$$
This important quantity is called the entropy of the random variable $x$.

This relation between entropy and shortest coding length is a general one.T
he *noiseless coding theorem* (Shannon, 1948) states that the entropy is a lower bound on the number of bits needed to transmit the state of a random variable. 

$$ H = \frac{1}{N}\ln W = \frac{1}{N}\ln N! - \frac{1}{N}\sum_i\ln n_i !  \tag{1.95} $$
$$ 
\begin{aligned}
H &= \lim_{N\rightarrow\infin} \frac{1}{N} (N\ln N - N) - \frac{1}{N}\sum_i (n_i \ln n_i - n_i) \\
  &= \lim_{N\rightarrow\infin} \ln N - \frac{1}{N} \sum_i n_i \ln n_i\\
  &= - \lim_{N\rightarrow\infin} \sum_i \frac{n_i}{N} \ln\frac{n_i}{N} = -\sum_i p_i\ln p_i
\end{aligned}
\tag{1.97}
$$

The entropy of the random variable $X$ is defined as 
$$ H[p] = - \sum_i p(x_i) \ln p(x_i)  \tag{1.98}$$

For a density defined over multiple continuous variables, denoted collectively by the vector $x$, the <mark>differential entropy</mark> is given by 
$$ H[\bm{x}] = - \int p(\bm{x}) \ln p(\bm{x]}) {\rm d}x   \tag{1.104}$$

*Conditional entropy* of $\bm{y}$ given $\bm{x}$:
$$ H[\bm{x}|\bm{y}] = H[\bm{y}|\bm{x}] + H[\bm{x}] $$


## 1.6.1 RElative entropy and mutual information

Relate the ideas of information theory to pattern recognition.

Unknown $p(\bm{x})$, modelled using an approximation $q(\bm{x})$.\
If construct a coding scheme for the purpose of transmitting values of $\bm{x}$ to a receiver, then the average additional amount of information required to specify the value of $\bm{x}$ as a result of using $q(\bm{x})$ instead of $p(\bm{x})$ is given by\
<mark>relative entropy</mark>, or <mark>Kullback-Leibler divergence, KL divergence</mark>:
$$ {\rm KL}(p||q) = - \int p(\bm{x}) \ln \left\{\frac{q(\bm{x})}{p(\bm{x})}\right\} {\rm d}\bm{x}  \tag{1.113}$$
- KL divergence is **not symmetric**.

Approximate the unknown $p(\bm{x})$ with some parametric $q(\bm{x}|\bm{\theta})$.\
Minimize the KL divergence between $p$ and $q$ with respect to $\bm{\theta}$ to determine $\bm{\theta}$.\
Observed a finite set of $\bm{x}_n$, for $1,\dots,N$, drawn from $p(\bm{x})$, then the expectation with respect to $p$ can be approximated by a finite sum over $\bm{x}_n$, so that
$$ {\rm KL}(p||q) \approx \sum_{n=1}^N \left\{-\ln q(\bm{x}_n|\bm{\theta})+\ln p(\bm{x}_n)\right\}  \tag{1.119}$$

> Minimizing this Kullback-Leibler divergence is equivalent to maximizing the likelihood function.

# 2 PROBABILITY DISTRIBUTIONS

## 2.3 Gaussian Distribution

> (p79) This section will be rather more technically involved than some of the earlier sections, and will require familiarity with various matrix identities.
> However, we strongly encourage the reader to become proficient in manipulating Gaussian distributions using the techniques presented here as this will prove invaluable in understanding the more complex models presented in later chapters.

Gaussian Distribution:
$$
\mathcal{N}(\bm{x}|\bm{\mu},\Sigma) = \frac{1}{(2\pi)^{D/2}} \frac{1}{|\Sigma|^{1/2}} \exp \left[ -\frac{1}{2}(\bm{x}-\bm{\mu})^T \Sigma^{-1} (\bm{x}-\bm{\mu}) \right]
\tag{2.42}
$$
- $D$ is dimension of $\bm{x}$.

These equations are used for <mark>``completing the square''</mark>:
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



### 2.3.3 Bayes’ theorem for Gaussian variables
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

### 2.3.4 Maximum likelihood for the Gaussian

Given a dataset $\bm{X}=\{\bm{x}_1,\dots,\bm{x}_N\}^T$ drawn independently from a multivariate Gaussian distribution.

Likelihood:
$$ \ln p(\bm{X}|\bm{\mu},\Sigma)   \tag{2.118 left}$$

Maximum likelihood estimations:
$$ \bm{\mu}_{\rm ML} = \frac{1}{N} \sum_{n=1}^N \bm{x}_n   \tag{2.121}$$
$$ \Sigma_{\rm ML} = \frac{1}{N} \sum_{n=1}^N (\bm{x}_n-\bm{\mu}_{\rm ML}) (\bm{x}_n-\bm{\mu}_{\rm ML})^T $$

Expectation of the maximum likelihood estimate:
$$ \mathbb{E}[\bm{\mu}_{\rm ML}] = \frac{1}{N} \sum \mathbb{E}[\bm{x}_n] = \mathbb{E}[\bm{x}_n]   \tag{2.123}$$
$$ 
\begin{aligned}
\mathbb{E}[\Sigma_{\rm ML}] 
&= \mathbb{E}\left[ \frac{1}{N} \sum_n \left( \bm{x}_n^2 - 2\bm{\mu}_{\rm ML}\bm{x}_n + \bm{\mu}_{\rm ML}^2 \right) \right]\\
&= \frac{1}{N} \mathbb{E}\left[ \sum_n \bm{x}_n^2 - 2N\bm{\mu}_{\rm ML}^2 + N\bm{\mu}_{\rm ML}^2 \right]\\
&= \frac{1}{N} \mathbb{E}\left[ \sum_n \bm{x}_n^2 - N\bm{\mu}_{\rm ML}^2 \right]\\
&= \mathbb{E}[\bm{x}_n^2] - \mathbb{E}[\bm{\mu}_{\rm ML}^2] \\
&= \mathbb{E}[\bm{x}_n^2] - \frac{1}{N^2}\sum_{n,m}\mathbb{E}\left[\bm{x}_n\bm{x}_m\right] \\
&= \mathbb{E}[\bm{x}_n^2] - \frac{1}{N^2}N\mathbb{E}[\bm{x}_n^2]\\
&= \frac{N-1}{N} \mathbb{E}[\bm{x}_n^2] = \frac{N-1}{N} \Sigma
\end{aligned}
\tag{2.124 + derivation}
$$
Correct the biased estimate in Eq. (2.124) as:
$$ \tilde{\Sigma} = \frac{1}{N-1} \sum_n (\bm{x}_n-\bm{\mu}_{\rm ML}) (\bm{x}_n-\bm{\mu}_{\rm ML})^T $$

> (p97) Maximum likelihood framework gave point estimates for the parameters $\bm{\mu}$ and $\Sigma$.

### 2.3.5 Sequential estimation

### 2.3.6 Bayesian inference for the Gaussian (p.97)
Did not finish this part of reading.

### 2.3.7 Student's t-distribution

Student's t-distribution is obtained by adding up an infinite number of Gaussian distributions having the same means but different precisions.\
This can be interpreted as an infinite mixture of Gaussians.\
This gives the t-distribution an important property called *robustness*, which means that it is much less sensitive than the Gaussian to the presence of a few data points which are *outliers*.

### 2.3.8 Periodic variables

### 2.3.9 Mixtures of Gaussians

> By using a sufficient number of Gaussians and by adjusting their means and covariances as well as the coefficients in the linear combination, almost any continuous density can be approximated to arbitrary accuracy. <span style="color:red">(Why it is "almost"? An counterexample?)</span>

$$ \ln p(\bm{X}|\bm{\pi},\bm{\mu},\bm{\Sigma}) = \dots \tag{2.193} $$

The likelihood function is now much more complex than with a single Gaussian, due to the presence of the summation over $k$ inside the logarithm.

The maximum likelihood solution for the parameters no longer has a closed-form analytical solution. Alternatively,
- to sue iterative numerical optimization techniques
- <mark>expectation maximization</mark> (see [Chapter 6](#94-the-em-algorithm-in-general)).


{% note info %}
All the probatility distributions above are specific examples of a broad class of distributions called the <mark>exponential family</mark>.
{% endnote %}


## 2.4. The Exponential Family
> The probability distributions that we have studied so far in this chapter (with the exception of the Gaussian mixture) are specific examples of a broad class of distributions called the exponential family (Duda and Hart, 1973; Bernardo and Smith, 1994).

> Members of the exponential family have many important properties in common, and it is illuminating to discuss these properties in some generality.

## 2.5 Nonparametric Methods (p.120)


> Throughout this chapter, we have focussed on the use of probability distributions having specific functional forms governed by a small number of parameters whose values are to be determined from a data set. This is called the parametric approach to density modelling.

Two widely used nonparametric techniques for desnity estimation:
- kernel estimators
- nearest neighbours

Both the K-nearest-neighbour method and the kernel density estimator require the entire training data set to be stored.

These nonparametric methods are still severely limited.\
Simple parametric models are very restricted in terms of the forms of distribution that they can represent.\
Subsequent chapters will show how to achieve density models that are **very flexible** and yet for which the **complexity** of the models can be **controlled independently of the size of the training set**.\
<span style="color:red">[TODO: summarize how the following chapters achieves this !]</span>




# 3 Linear Models for Regression

From a probabilistic perspective, we aim to model the predictive distribution $p(t|\bm{x})$ because this expresses our uncertainty about the value of $t$ for each value of $\bm{x}$.\
From this **conditional distribution** we can make predictions of $t$, for any new value of $\bm{x}$, in such a way as to minimize the expected value of a suitably chosen loss function.
- So, the ultimate goal of regression is to find $p(t|\bm{x})$ !


## 3.1 Linear Basis Function Model

$$y=\bm{w}^T\bm{\phi}(\bm{x})  \tag{3.3}$$
where $\bm{w}=(w_0,\omega_1,\dots,w_{M-1})^T$, $\bm{\phi}=(\phi_0,\phi_1,\dots,\phi_{M-1})^T$


### 3.1.1 Maximum likelihood and least squares

$$t=y(\bm{x},\bm{w})+\epsilon  \tag{3.7}$$

$$p(t|\bm{x},\bm{w},\beta) = \mathcal{N}(t|y(\bm{x},\bm{w}),\beta^{-1})  \tag{3.8}$$

Above two equations imply an assumed priori distribution, the observation model.


Now consider a data set of inputs $X = \{\bm{x}_1,\dots,\bm{x}_N\}$ with corresponding target values $\bm{t}=\{t_1,\dots,t_N\}$.

ASSUMPTION: data points in $(X, \bm{t})$ are drawn independently from the distribution (3.8).

LIKELIHOOD function:
$$p(\bm{t}|\bm{X},\bm{w},\beta) = \prod_{n=1}^{N} \mathcal{N}(t_n|\bm{w}^T\bm{\phi}(\bm{x}_n),\beta^{-1})   \tag{3.10}$$
- $X$ is usually omitted for simplicity

Log-likelihood function:
$$\ln p(\bm{t}|\bm{w},\beta) = \sum_{n=1}^N \ln \left( \frac{1}{2\pi\beta^{-1/2}} \exp\left[ -\frac{\beta}{2} (\bm{t}_n-\bm{w}^T\bm{\phi}(\bm{x}_n))^T(\bm{t}_n-\bm{w}^T\bm{\phi}(\bm{x}_n)) \right] \right)$$
$$= -\frac{N}{2}\ln(2\pi) + \frac{N}{2}\ln\beta - \frac{\beta}{2} \sum_{n=1}^{N}\|\bm{t}_n-\bm{w}^T\bm{\phi}(\bm{x}_n)\|^2  \tag{3.11 + 3.12}$$

> Note that in supervised learning problems such as regressions, we are not seeking to model the distribution of the input variables.\
> Thus we will drop the explicit $\bm{x}$ from expressions.

<!-- $$
\mathcal{N}(\bm{x}|\bm{\mu},\Sigma) = \frac{1}{(2\pi)^{D/2}} \frac{1}{|\Sigma|^{1/2}} \exp \left[ -\frac{1}{2}(\bm{x}-\bm{\mu})^T \Sigma^{-1} (\bm{x}-\bm{\mu}) \right]
\tag{2.42}
$$ -->

Having written down the likelihood function, we can use *maximum likelihood* to determine $\bm{w}$ and $\beta$.
(Take gradient, and then set this gradient to zero gives)

MAX LIKELIHOOD results: 

Weights $\bm{w}_\text{ML}$:
$$ \bm{w}_\text{ML}=(\Phi^T\Phi)^{-1}\Phi^T\bm{t}    \tag{3.15} $$
where 
$$ \Phi^\dagger \equiv (\Phi^T\Phi)^{-1}\Phi^T   \tag{3.17} $$
is known as the **Mossre-Penrose pseudo-inverse** of the matrix $\Phi$.

Precision parameter $\beta_{\rm ML}$:
$$ \frac{1}{\beta} = \frac{1}{N} \sum_{n=1}^N \{t_n-\bm{w}_{\rm ML}^T\phi(\bm{x_n})\}^2   \tag{3.21} $$

### 3.1.2 Geomertry of least square

### 3.1.3 Sequential learning

### 3.1.4 Regularized least squares

sum-of-squares of the weight vector elements:\
*weight decay* in machine learning literature\
*parameter shrinkage* in statistics

other regularizers:
- lasso

### 3.1.5 Multiple outputs



> (p.147) In above discussions, assumed the form and number of basis functions are both fixed.


## 3.2 The Bias-Variance Decomposition

As we have seen in earlier chapters (FORGOT WHERE...), the phenomenon of over-fitting is really an unfortunate property of maximum likelihood and does not arise when we marginalize over parameters in a Bayesian setting.


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

<mark>Empirical Bayes</mark> (**statistics literature**)
== <mark>type 2 maximum likelihood</mark> (**statistics**)
== <mark>generalized maximum likelihood</mark> (**statistics**)
== <mark>evidence approximation</mark> (**machine learning literature**)

There are two approaches to the maximization of the log marginal likelihood (log evidence): (p.166)
**(These two approaches converge to the same solution.)**
1. Evaluate the evidence function analytically and then set its derivative equal to zero to obtain re-estimation equations for $\alpha$ and $\beta$ (in Section 3.5.2).
2. Use a technique called the expectation maximization (EM) algorithm (in Section 9.3.4).



### 3.5.1 Evaluation of the evidence function

MARGINAL LIKELIHOOD function over the weight parameters $\bm{w}$:\
see Eq.(3.8) and Eq.(3.52);\
using Eq.(2.115)
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

### 3.5.2 Maximizing the evidence function

$\alpha$ is determined by purely looking at the training data.

$$ \text{define the eigenvector equation: } \left(\beta\Phi^T\Phi\right)\bm{u}_i = \lambda_i \bm{u}_i  \tag{3.87}$$
$$ \gamma = \sum_i \frac{\gamma_i}{\alpha+\gamma_i}    \tag{3.91}$$
$$ \alpha = \frac{\gamma}{\bm{m}_N^T\bm{m_N}}   \tag{3.92}$$

This is an implicit solution for $\alpha$ and it can be solved iteratively:\
initial guess -> $\bm{m}_N$ from Eq.(3.53) -> $\lambda_i$ from Eq.(3.87) -> $\gamma$ from EQ.(3.91) -> re-estimate $\alpha$.

Similar for $\beta$.



## 3.6 Limitations of Fixed Basis Functions

models comprising linear combinations of fixed, nonlinear basis functions

significant short comings:\
the number of basis functions needs to grow rapidly with the dimensionality of the input space, often exponentially

SVM and NN both use some good properties to alleviate this problem.
- data vectors typically lie close to a nonlinear manifold whose intrinsic dimensionality is smaller
  - support vector machine, relevence vector machine, and neural network all use this one
- target variables may have significant dependente on only a small number of possible directions
  - neural netowok uses this one


# 4. Linear Models for classification (not read)


# 5. Neural Network (not read)

## 5.7 Bayesian Neural Networks (to read)

# 6. Kernel Methods (not read)

## 6.4 Gaussian Processes (to read)


# 7. Sparse Kernel Mathod (not read)

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



# 8. Graphical Models (to read)

## 8.4. Inference in Graphical Models (to read)



# 9. Mixture Models and EM (expectation maximization)

## 9.4. The EM Algorithm in General

> The expectation maximization algorithm, or EM algorithm, is a general technique for <mark>finding maximum likelihood solutions</mark> for probabilistic models having latent variables (Dempster et al., 1977; McLachlan and Krishnan, 1997). (p.450)

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
> - In the <mark>E step</mark>, the lower bound $\mathcal{L}(q, \bm{\theta}^{\rm old})$ is maximized with respect to $q(\bm{Z})$ while holding $\bm{\theta}^{\rm old}$ fixed.
> - In the <mark>M step</mark>, the distribution $q(\bm{Z})$ is held fixed and the lower bound $\mathcal{L}(q, \bm{\theta})$ is maximized with respect to $\bm{\theta}$ to give some new value $\bm{\theta}^{\rm new}$.

> The EM algorithm breaks down the potentially difficult problem of maximizing the likelihood function into two stages, the E step and the M step, each of which will often prove simpler to implement. (p.454)
> - The generalized EM, or GEM, algorithm addresses the problem of an intractable
M step.
> - We can similarly generalize the E step of the EM algorithm by performing a
partial, rather than complete, optimization of L(q, θ) with respect to q(Z) (Neal and
Hinton, 1999).

在需要使用 EM 时，还需要仔细研究这部分内容，理解不够深刻，还没有掌握到精髓所在。



# 10. Approximate Inference

> (p24) More recently, highly efficient deterministic approximation schemes ouch as variational Bayes and expectation propagation have been developed. These offer a complementary alternative to sampling methods and have allowed Bayesian techniques to be used in large-scale applications.

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

$$
\mathbb{E}[f] = \int f(\bm{z}) p(\bm{z})\, \rm{d}\bm{z} \tag{11.1}
$$

## 11.1 Basic Sampling Algorithms

### 11.1.1 transform using the inverse accumulative distribution function

### 11.1.2 rejection sampling

### 11.1.3 adaptive rejection sampling

adaptive rejection Metropolis sampling


Rejection sampling\
\- exponential decrease of acceptance rate with dimensionality\
\- play a role as a subroutine in more sophisticated algorithms for sampling in high dimensional spaces\

### 11.1.4 importance sampling

Use a proposal distribution $q(\bm{z})$, easy to draw samples, to calculate Eq. 11.1:
$$
\begin{aligned}
\mathbb{E}[f] = \int f(\bm{z}) p(\bm{z})\, {\rm d}\bm{z}
= \int f(\bm{z}) \frac{p(\bm{z})}{q(\bm{z})} q(\bm{z})\, {\rm d}\bm{z}
\approx \frac{1}{L}\sum_{l=1}^L \frac{p(\bm{z}^{(l)})}{q(\bm{z}^{(l)})} f(\bm{z}^{(l)})
\end{aligned}
\tag{11.19}
$$
where $r_l=p(\bm{z}^{(l)})/q(\bm{z}^{(l)})$ is the <mark>importance weights</mark>.

When $p(\bm{z})$ can only be evaluated up to a normalized constant, $p(\bm{z})=\tilde{p}(\bm{z})/Z_p$, using a similar proposal distribuion $q(\bm{z})=\tilde{q}(\bm{z})/Z_q$, then we have,
$$
\mathbb{E}[f] = \int f(\bm{z}) p(\bm{z})\, {\rm d}\bm{z}
= \frac{Z_q}{Z_p} \int f(\bm{z}) \frac{\tilde{p}(\bm{z})}{\tilde{q}(\bm{z})} \tilde{q}(\bm{z})\, {\rm d}\bm{z}
\approx \frac{Z_q}{Z_p} \frac{1}{L}\sum_{l=1}^L \tilde{r}_l f(\bm{z}^{(l)}).
\tag{11.20}
$$
And because
$$
\frac{Z_p}{Z_q} = \frac{1}{Z_q} \int \tilde{p}(\bm{z}){\rm d}\bm{z}
= \frac{1}{\textcolor{red}{Z_q}} \int \frac{\tilde{p}(\bm{z})}{\tilde{q}(\bm{z})} \textcolor{red}{\tilde{q}(\bm{z})}\, {\rm d}\bm{z}
= \int \frac{\tilde{p}(\bm{z})}{\tilde{q}(\bm{z})} \textcolor{red}{q(\bm{z})}\, {\rm d}\bm{z}
\approx \frac{1}{L}\sum_{l=1}^L \tilde{r}_l
\tag{11.21}
$$
we then have
$$
\mathbb{E}[f] = \sum_{l=1}^L \omega_l f(\bm{z}^{(l)})   \tag{11.22}
$$
with
$$
\omega_l = \frac{\tilde{r}_l}{\sum_m \tilde{r}_m}   \tag{11.23}
$$

Other improvements:\
\- likelihood weighted sampling
\- self-importance sampling

### 11.1.5 Sampling-importance-resampling

### 11.1.6 Sampling and the EM algorithm

[Forget EM algorithm? See here.](#94-The-EM-Algorithm-in-General)

*Monte Carlo EM algorithm*: *stochastic EM*

IP algorithm


## 11.2 Markov Chain Monte Carlo

(p24) Monte Carlo methods are very flexible and can be applied to a wide range of models. However, they are computationally intensive and have mainly been used for small-scale problems.

MCMC is a big framework: sample from many classes of distributions; scales well with the space dimension.

A central goal in designing MCMC methods is to avoid random walk behaviour.

*basic Metropolis algorithm*:\
assume proposal distribution is symmetric, $q(\bm{z}_A|\bm{z}_B) = q(\bm{z}_B|\bm{z}_A)$,\
candidate sample is accepted with probability $A(\bm{z}^*)=\min \left( 1,\frac{\tilde{p}(\bm{z}^*)}{\tilde{p}(\bm{z}^{(\tau)}} \right)$\
at each step $\tau$, if the candiate $\bm{z}^*$ is acceptable, $\bm{z}^{(\tau+1)}=\bm{z}^*$, otherwise, $\bm{z}^{(\tau+1)}=\bm{z}^{(\tau)}$.

### 11.2.1 Markov chains

### 11.2.2 The Metropolis-Hastings algorithm



## 11.3 Gibbs Sampling

Gibbs sampling is a MCMC algorithm; a special case of the Metropolis-Hasting algorithm.


## 11.4 Slice Sampling

## 11.5 The Hybrid Monte Carlo Algorithm

Key points:\
\- Hamiltonian dynamics\
\- leapfrog integration\
\- Metropolis algorithm

~~这章与很多文献中的 Hamiltonian Monte Carlo 的关系是什么？~~
感觉是一样的。\
是同样的东西，see [MCMC: <mark>Hamiltonian Monte Carlo (a.k.a. Hybrid Monte Carlo</mark>)
](https://theclevermachine.wordpress.com/2012/11/18/mcmc-hamiltonian-monte-carlo-a-k-a-hybrid-monte-carlo/).

### 11.5.1 Dynamical systems


### 11.5.2 Hybrid Monte Carlo

see [MCMC: Hamiltonian Monte Carlo (a.k.a. Hybrid Monte Carlo)
](https://theclevermachine.wordpress.com/2012/11/18/mcmc-hamiltonian-monte-carlo-a-k-a-hybrid-monte-carlo/)

## 11.6 Estimating the Partition Function
If we write 
$$ p_E(\bm{z}) = \frac{1}{Z_E} \exp(-E(\bm{z})) $$
then the normalization constant $Z_E$ is known as the partition function. 
K
nowledge of the value of $Z_E$ can be useful for Bayesian model comparison since it represents the <mark>model evidence</mark> (the probability of the observed data given the model). 



> (stopped here last time)


# 12. Continuous Latent Variables

## 12.4. Nonlinear Latent Variable Models (to read)



# 13. Sequential Data (not read for now)

# 14. Combining Models (not read for now)
## 14.1. Bayesian Model Averaging
## 14.2. Committees
## 14.3. Boosting
## 14.4. Tree-based Models

------------------

# Some Terms

(p25) The maximum of a distribution is known as its <mark>mode</mark>.

(p28) for consistency with the notation in later chapters, we define a <mark>precision parameter</mark> parameter $\beta$ corresponding to the inverse variance of the distribution. 

(p30) Variables such as $\alpha$, which controls the distribution of model parameters, are called <mark>hyperparameters</mark>.

(p30) Finding the most probable value of $\bm{w}$ given the data by maximing the posterior distribution is called <mark>maximum posterior, MAP</mark>.

(p120) <mark>Parametric approach</mark> to density modelling: 
the use of probability distributions having specific functional forms governed by a small number of parameters whose values are to be determined from a data set.

(p120) <mark>Nonparametric approaches</mark> to density estimation that make few assumptions about the form of the distribution.

(p165) empirical Bayes (statistics) == type 2 maximum likelihood (statistics) == generalized maximum likelihood (statistics) == evidence approximation (machine learning)




# 疑问

1. complete-data log likelihood, p536
2. complete-data parameter posterior $p(\bm{\theta}|\bm{Z},\bm{X})$, p537