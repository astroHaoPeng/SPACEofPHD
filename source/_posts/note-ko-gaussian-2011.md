---
title: Notes of Gaussian Process for Dynamic Systems
comments: true
mathjax: true
abbrlink: d82d0c1a
date: 2019-11-07 12:49:27
updated: 2020-10-05 07:13:49
categories:
tags:
---


> Jonathan Ko, “Gaussian Process for Dynamic Systems”, PhD Thesis, University of Washington, 2011.


Bayes filter equation in Eq. 4.1 (p.34) has a typo (should be $\propto$, not $=$)
$$
p(x_t|z_{1:t},u_{1:t-1}) \propto p(z_t|x_t) \int \textcolor{red}{p(x_t|x_{t-1},u_{t-1})} \textcolor{green}{p(x_{t-1}|z_{1:t-1},u_{1:t-2})} dx_{t-1}
$$

- $\textcolor{red}{Red}$ part is **dynamics model**, describing how the state $x$ evolves in time based on the control input $u$ (p.34)
- $\textcolor{green}{Green}$ part is **observation model**, describing the **likelihood** of making an observation $z$ given the state $x$
- GP-BayesFilter improves these two parts.

The dynamics model maps the state and control $(x_t,u_t)$ to the state transition $\Delta x_t = x_{t+1} - x_t$.
So, the training data is 
$$ D_p = <(X,U),X'> $$
The observation model maps from the state $x_t$ to the observation $z_t$.
So, the training data is 
$$ D_o = <X,Z> $$

The resulting GP dynamics and observation models are (p.44)
$$
p(x_t|x_{t-1},u_{t-1}) \approx \mathcal{N}(\text{GP}_\mu([x_{t-1},u_{t-1}],D_p), \text{GP}_\Sigma([x_{t-1},u_{t-1}],D_p))
$$
and
$$
p(z_t|x_t) \approx \mathcal{N}(\text{GP}_\mu(x_t,D_o), \text{GP}_\Sigma(x_t,D_o))
$$


# 4 Filtering and State Estimation with Gaussian

## 4.2 Related Work

> The key novelty in this work is to not only consider the mean of the previous states, but also their uncertainty.
> ...
> The drawback is that it requires large amounts of training data which may not be available for highly complex, high dimensional systems.




## 4.3 GP Bayesian FIlters

### 4.3.1 GP Dynamics and Observation Models

> Training data:
> - a sampling from the dynamics and observations of the system
> - assumption that it is representative of the system, that is, that the training data covers those parts of the state space that are visited during normal operation
> - explore the behavior of GP models when this is not the case in Section 4.4.3 （？？看并总结这小节）
> - Dynamics model maps the state and control, $(\bm{x}_t, \bm{u}_t)$, to the state transition $\Delta\bm{x}_t = \bm{x}_{t+1} - \bm{x}_t$
> - Observation model maps from the state, $\bm{x}_t$, to the observation, $\bm{z}_t$.

> GP-BayesFilters represent models for vectorial outputs by learning a different GP for each output dimension. Since the output dimensions are now independent of each other, the resulting noise covariances are diagonal matrices. （没有使用multi-output GP）

> (p.45) We call the combination of GP and parametric models *Enhanced-GP* (EGP) models.\
> Essentially, EGP models learn the residual output after factoring the contributions of the parametric model.


## 4.6 Summary

> We thus conjucture that GP-BayesFilters are <mark>most useful</mark> when <mark>high accuracy is needed</mark> or for <mark>difficult to model dynamical systems</mark>.

> We extend work on GP latent variable models to handle cases in which <mark>no ground truth</mark> is available for GP <mark>input values</mark>. <mark>（为什么这里强调是 input values？）</mark>

# 5 Learning Latent States with GPs

> GPBF-Learn
> - Inputs: 
>   - temporal sequences of observations 
>   - and control inputs 
>   - along with partial information about the underlying state of the system
> - Determine a state sequence that best matches the above inputs.
> - These states are then used along with the control and observations to learn a GP-BayesFilter.

这个state sequence是什么意思？最后学到的GPBF的输入是什么？

> (p.74) optimizing over both the latent space $X$ and the hyperparameters $\theta_y$.

likelihood function 和 standard GP 的完全一样，只是优化变量多了 $X$。

> (p.74) requires a good initialization to avoid local maxima. Typically, such initializations are done via PCA or Isomap.



# 6 System Control with Gaussian Processes

## 6.1 Gaussian Process for Reinforcement Learning

使用训练好的 GPKF

### 6.1.3 GP Reinforcement Learning

GP-based simulator + RL component

> Once the parameters of a GP are learned from training data, the GP can be used to simulate the evolution of the dynamics process. 

训练好的GP-KF中的预测部分，其实就是动力学模型，所以可以直接拿来作 simulator 生成 RL 在计算过程中需要的仿真轨道。
