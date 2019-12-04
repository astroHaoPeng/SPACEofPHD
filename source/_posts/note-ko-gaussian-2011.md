---
title: Notes of Gaussian Process for Dynamic Systems
comments: true
mathjax: true
abbrlink: d82d0c1a
date: 2019-11-07 12:49:27
updated:
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





