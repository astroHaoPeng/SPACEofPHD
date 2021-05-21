---
title: Daily Reading Logs (Clean up regularly)
comments: true
mathjax: false
abbrlink: aab1a29c
categories:
  - Others
date: 2020-06-30 15:39:43
updated:
hide: true
tags:
---

# Academics 

## 2020-07-09

[[Discussion] [Research] Variational Bayesian Inference vs Monte-Carlo Dropout for Uncertainty Quantification in DL](https://www.reddit.com/r/MachineLearning/comments/emt4ke/discussion_research_variational_bayesian/)
- chrisorm: 
  - Regarding variational methods, I'm not really sure these are a panacea either. Bayes by backdrop etc normally make heavy independence assumptions to make things tractable.
  - To me, uncertainty estimates in deep learning are still really open problems.
- forthispost96: I was fortunate enough to talk to a few ML Scientists from Deepmind who were working on similar content and even they said implementing these Bayesian networks becomes a hassle.
- margaret_spintz: 
  - You could say that enough samples would cover your estimated approximate posterior, but this is certainly not the 'true' posterior. MC-Dropout makes strong assumptions on the distributional form of this approximation, and the objective it minimises is only questionably Bayesian (https://arxiv.org/abs/1807.01969). (未读)
  - MC-Dropout is at best a variational method.
  - Currently there's push back into how well suited (mean field) variational methods are (including MC-Dropout) to neural networks (https://arxiv.org/abs/1909.00719). （未读）
  - I'd float <mark>an alternative method</mark> you didn't mention: <mark>ensembles</mark> (https://arxiv.org/abs/1612.01474). These often outperform variational methods and are arguably simpler and more scalable, e.g. (https://arxiv.org/abs/1906.01620). Finally some work explores the connection between ensembles and Bayesian posteriors (https://arxiv.org/abs/1810.05546).
  - 


## 2020-06-30

[Reddit: [Discussion] Confidence Intervals for Forecasting](https://www.reddit.com/r/MachineLearning/comments/fk3qgm/discussion_confidence_intervals_for_forecasting/)
- 

[TF blog: Regression with Probabilistic Layers in TensorFlow Probability](https://blog.tensorflow.org/2019/03/regression-with-probabilistic-layers-in.html)
- Note that in this example we are **training both P(w) and Q(w)**. This training corresponds to using **Empirical Bayes** or **Type-II Maximum Likelihood**. We used this method so that we wouldn't need to specify the location of the prior for the slope and intercept parameters, which can be tough to get right if we do not have prior knowledge about the problem. Moreover, if you set the priors very far from their true values, then the posterior may be unduly affected by this choice. **A caveat of using Type-II Maximum Likelihood is that you lose some of the regularization benefits over the weights.** If you wanted to do a proper Bayesian treatment of uncertainty (if you had some prior knowledge, or a more sophisticated prior), you could use a non-trainable prior (see Appendix B).

[RG: Is it possible to get confidence intervals in LSTM forecasting?](https://www.researchgate.net/post/Is_it_possible_to_get_confidence_intervals_in_LSTM_forecasting)
- use simulations of multiple predictions to then calculate the prediction intervals
- predict the parameters of a predefined distribution
- predict forecast quantiles directly: Amazon's MQ-RNN forecaster uses this approach <mark>(check this)</mark>

[Prediction interval around LSTM time series forecast](https://datascience.stackexchange.com/questions/24403/prediction-interval-around-lstm-time-series-forecast)
- 

## 2020-06-29

[Gaussian process 的重要组成部分——关于那个被广泛应用的Kernel的林林总总](https://zhuanlan.zhihu.com/p/35396322)

[Pontryagin duality](https://en.wikipedia.org/wiki/Pontryagin_duality)

[隐马尔可夫模型](https://zh.wikipedia.org/wiki/%E9%9A%90%E9%A9%AC%E5%B0%94%E5%8F%AF%E5%A4%AB%E6%A8%A1%E5%9E%8B)

[Latent variable](https://en.wikipedia.org/wiki/Latent_variable)

[Latent variable model](https://en.wikipedia.org/wiki/Latent_variable_model)

[An Introduction to Latent Variable Models ](http://www.biostat.jhsph.edu/~kbroche/Aging%20-%20PDF/Intro%20to%20Latent%20Variable%20Models.pdf)

[Stochastic (partial) differential equations and Gaussian processes, Simo Särkkä, Aalto University, Finland](http://gpss.cc/gpss17/slides/spde-lecture.pdf)

[Gaussian Process Regression using Spectral Mixture Kernel in GPflow](https://github.com/imsrgadich/gprsm)




# Other interests