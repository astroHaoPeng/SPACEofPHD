---
title: Reading Notes | Markov chain Monte Carlo algorithms for Gaussian processes
comments: true
categories:
  - - Notes
    - Book Note
tags:
  - book
  - Machine Learning
  - Gaussian Processes
mathjax: true
abbrlink: 7f6588b9
date: 2019-06-08 13:15:27
updated:
---

{% note info %}
Michalis K. Titsias, Magnus Rattray, and Neil D. Lawrence, “Markov chain Monte Carlo algorithms for Gaussian processes,” Bayesian Time Series Models, David Barber, A. Taylan Cemgil, and Silvia Chiappa, eds., Cambridge: Cambridge University Press, 2011, pp. 295–316. [[Link]](https://www.cambridge.org/core/product/identifier/CBO9780511984679A119/type/book_part).
{% endnote %}

Estimate latent function 
$$f(\bm{x})$$

Observations 
$$y_i = f_i + \epsilon_i$$

Joint distribution is
$$ p(\bm{y},\bm{f}) = p(\bm{y}|\bm{f}) p(\bm{f}) $$

Applying Bayes' rule and posterior over $\bm{f}$ is
$$ p(\bm{f}|\bm{y}) = \frac{p(\bm{y}|\bm{f})p(\bm{f})}{\int p(\bm{y}|\bm{f})p(\bm{f})\,{\rm d}\bm{f}} $$

<mark>Predict</mark> the function value $\bm{f}_*$ at an unseen inputs $\bm{X}_*$
$$ \textcolor{blue}{p(\bm{f}_*|\bm{y})} = \int p(\bm{f}_*|\bm{f}) p(\bm{f}|\bm{y})\,{\rm d}\bm{f} $$
where $p(\bm{f}_*|\bm{f})$ is the conditional GP prior given by,
$$ p(\bm{f}_*|\bm{f}) = \mathcal{N}(\bm{f}_*|\circ,\circ) $$

<mark>Predict</mark> $\bm{y}_*$ corresponding to $\bm{f}_*$ is
$$ \textcolor{red}{p(\bm{y}_*|\bm{y})} = \int p(\bm{y}_*|\bm{f}_*) \textcolor{blue}{p(\bm{f}_*|\bm{y})} \,{\rm d}\bm{f}_* $$


In a mainstream machine learning application involving ***large datasets*** and where fast inference is required, deterministic methods are usually preferred simply because they are faster.\
In contrast, in <mark>applications related to scientific questions</mark> that need to be carefully addressed by carrying out a <mark>statistical data analysis</mark>, <mark>MCMC is preferred</mark>.