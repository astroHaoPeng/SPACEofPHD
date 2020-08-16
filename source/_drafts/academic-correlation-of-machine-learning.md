---
title: Thoughts on Correlation in the Machine Learning Approach
comments: true
mathjax: true
abbrlink: 4cb96e6e
date: 2020-08-11 15:51:24
updated: 2020-08-13 23:56:41
categories:
tags:
---

The quotations are anonymous comments from the reviewing of one of my manuscript. 

This post is some of my thoughts to answer these questions.
Since they are so tangly, I decide to write them down for my own reviewing.

Contents here will be edited frequently and I don't even guarantee they are close to correct.
So, read at your own risk.

(End of pseudo-disclaimer.)

------------

I'm happy to take any criticism and answer any question.


> One issue with the fusion strategy is that it does not consider the correlation between the EKF prediction and the Gaussian process prediction. 
> To show that the fusion strategy indeed yields more accurate and consistent error bounds than the EKF, Monte Carlo results or a summary of the Monte Carlo results should be presented. 
> The results in the figures appear to be individual sample trajectories instead of the ensemble means of the prediction errors over time.

<!-- more -->

> As a general comment, the fusion architecture does not seem to be well thought out. 
> The machine learning approach is treated as generating a measurement. 
> This “measurement” appears to depend upon previous estimates as some element of that is ingested by the machine learning process. 
> As such, there is a time correlation that exists between the “measurement” from the machine learning process and the extended Kalman filter estimate against which the “measurement” is processed. 
> However, no such correlation is accounted for in the output of the fusion step.



> Pg. 11, Eq. (27): It would seem that the machine learning process depends on past state histories, particularly on past estimated states and past true states. As such, this process creates temporal correlations. How are those taken into account in this model?



> Pg. 13, Eq. (28): Why are there no correlations produced as part of the ML “pseudo-measurement”?



> Pg. 13, Eqs. (33) and (34): With respect to a comment from the previous review, this update makes the assumption that all of the restrictions of the Kalman filter hold. 
> The ML-based “pseudo-measurement” depends on prior measurement data. 
> Processing according to (33) and (34) therefore requires time-wise correlations to be accounted for, which they are not. 
> Please address this in the paper to an extent where it can be understood whether or not this is acceptable.


{% note danger %}
(TL;DR) The GP prediction has <mark>no correlation</mark> with the EKF prediction.
They are <mark>independent</mark>.
{% endnote %}

In the training data, the input of the GP model consists of the consistency error
$$
\newcommand{\eConsistencyBm}{\bm{e}_{\rm C}}
\newcommand{\xPredicted}{\hat{\bm{x}}}
\newcommand{\xEstimated}{\hat{\bm{x}}}
\eConsistencyBm(t_{i-1};t_i) = \xEstimated(t_{i-1}) - \xPredicted(t_{i-1};t_i),
$$
(actually several pairs of $\bm{e}_{\rm C}$ but here for simplicity we only discuss with one) 
and the output of the GP model is
$$
\newcommand{\rsw}{\mathsf{RSW}}
\newcommand{\A}{\bm{A}_{\rm I2R}(t_j)}
\newcommand{\xTrue}{\bm{x}_{\rm T}}
\newcommand{\xPredicted}{\hat{\bm{x}}}
\bm{e}_{\rm T}^\rsw(t_j;t_i) = \A \cdot \left[ \xTrue(t_j) - \xPredicted(t_j;t_i) \right].
$$
The predictive mean and variance of the trained GP model is $\bm{e}_{\rm ML}$ and $\Sigma_{\rm ML}$.
$\Sigma_{\rm ML}$ only contains diagonal element $\sigma_{\rm ML}$ since we are using a separate GP model for each component (here implies an assumption that all six components are uncorrelated, which is however, irrelevant to the "correlation" the reviewer discussed.)

At the first sight, it seems that because $\bm{e}_{\rm T}$ is related to $\bm{x}_{\rm T}$ and $\hat{\bm{x}}$ thus it is correlated with them.

But, the definition of `correlation` is
> ([Wikipedia](https://en.wikipedia.org/wiki/Correlation_and_dependence)) In statistics, correlation or dependence is any statistical relationship, whether causal or not, between two random variables or bivariate data.

Since $\bm{x}_{\rm T}$ is not a random variable, $\bm{e}_{\rm ML}$ is not correlated to it.

$\hat{\bm{x}}$ is a sample of the random variable. 
Its variance should be $\hat{\sigma}$ (diagonal elements of $P$).

When we collecting training data $\bm{e}_{\rm T}$, $\hat{\bm{x}}$ is treated with is a different meaning.
Originally, it is a sample of the random variable which EKF models.
Now, it is treated as a single point value of a sample of a random process (namely, random function) at $\bm{e}_{\rm C}$.
This random process will be modeled by GP via learning.

So, the (co)variance information of $\hat{\bm{x}}$ is not included or involved in the generating of $\bm{e}_{\rm ML}$ and $\sigma_{\rm ML}$.

Then there comes another two questions: 
1) Do they have overlapping covariance information? 
2) Are these any information being re-used if we fuse them?

{% note success %}
**The answer to question-1 is: No, they don't.**

$\sigma_{\rm EKF}$ is quantifying how far $\hat{\bm{x}}$ is statistically away from $\bm{x}_{\rm T}$ based on the framework of EKF estimation, i.e., the value <mark>$\bm{e}_{\rm EKF} \equiv \bm{e}_{\rm T} = \bm{x}_{\rm T} - \hat{\bm{x}}$</mark>.

While, $\sigma_{\rm ML}$ is describing how far $\bm{e}_{\rm ML}$ is away from the corresponding value on latent function $\bm{f}$ that the GP model is trying to rebuilt from data.

Notice that $\sigma_{\rm ML}$ is <mark>NOT</mark> quantifying how far $\bm{e}_{\rm ML}$ is away from the true error $\bm{e}_{\rm T}$ that the EKF will make, i.e., the value <mark>$\bm{e}_{\rm T} - \bm{e}_{\rm ML}        = ( \bm{x}_{\rm T} - \hat{\bm{x}} ) - ( \bm{x}_{\rm ML} - \hat{\bm{x}} )         \equiv \bm{x}_{\rm T} - \bm{x}_{\rm ML}$</mark>, where $\bm{x}_{\rm ML}$ is the predicted state from the ML models.
(Notice that $\bm{x}_{\rm ML}$ doesn't explicitly appear during the calculation. The ML models don't need to generate $\bm{x}_{\rm ML}$ first in order to calculate $\bm{e}_{\rm ML}$.)
\
Why? Because if we assume it was, we are actually assuming the latent function $\bm{f}$ for GP is exactly the same to "the EKF prediction errors as a function of the consistency error", if it exists.
However, EKF couldn't tell us if there is such a relationship or function.

As a conclusion, $\hat{\sigma}_{\rm EKF}$ and $\sigma_{\rm ML}$ don't have overlapping information, simply because they are describing different things.
{% endnote %}

{% note primary %}
**Thea answer to question-2 is: No, no re-use.**

From question-1, we know that they cannot be fused as they have nothing to fuse with each other.
So, no-reuse.
But this conclusion is meaningless.

In order to fuse them, we need to add an assumption here (identical to the one we discussed in question-1):
> The latent function "the EKF prediction errors as a function of the consistency error" really exists and the mapping relationship can be (at least partially) captured by the trained ML models.

*[[ The following discussion is all under this assumption. ]]*

From question-1 we know that: \
$\sigma_{\rm EKF} \leftrightarrow \bm{e}_{\rm T} = \bm{x}_{\rm T} - \hat{\bm{x}}$ \
$\sigma_{\rm ML} \leftrightarrow \bm{e}_{\rm T} - \bm{e}_{\rm ML} = \bm{x}_{\rm T} - ( \hat\bm{x} - \bm{e}_{\rm ML}) = \bm{x}_{\rm T} - \bm{x}_{\rm ML}$ (comes out of the assumption)\
It is clear that $\bm{x}_{\rm ML}$ is defined depending on $\hat\bm{x}$, how come that the two covariance is uncorrelated?

The seeming contradiction is that this second equation is only a artificial formulation to define the pseudo-measurement $\bm{x}_{\rm ML}$, which is not the actually procedure of generating $\sigma_{\rm ML}$ and $\bm{e}_{\rm ML}$:
- Thinking this from the classical way (like deriving various correlations in estimation theory), $\bm{x}_{\rm ML}$ is obtained based on $\hat{\bm{x}}$, and its covariance $\sigma_{\rm some}$ is obtained at the same time by analyzing the relationship between them. Then $\bm{e}_{\rm ML}$ is obtained as a by-product of subtracting $\bm{x}_{\rm ML}$ and $\bm{x}_{\rm T}$ and surly the covariance $\sigma_{\rm ML}$ is dependent on $\sigma_{\rm some}$. (This rational is completely correct, but it is simply not the case for the ML approach.)
- What actually happens for the ML approach is, $\bm{e}_{\rm ML}$ and $\sigma_{\rm ML}$ is generated at first, directly from the trained GP models, without even knowing about $\hat{\bm{x}}$ and $\sigma_{\rm EKF}$. Without the assumption we made, $\bm{e}_{\rm ML}$ and $\sigma_{\rm ML}$ have no physical meaning, and they cannot be fused with $\hat{\bm{x}}$ and $\sigma_{\rm EKF}$ which have clear physical meanings.
- In other words, whether EKF generate $(\hat{\bm{x}}', \sigma'_{\rm EKF})$ or $(\hat{\bm{x}}'', \sigma''_{\rm EKF})$, it doesn't affect the trained ML models to generate the same prediction $(\bm{e}_{\rm ML}, \sigma_{\rm ML})$. The only difference is the pseudo-measurement is changed from $\hat{\bm{x}}' - \bm{e}_{\rm ML}$ to $\hat{\bm{x}}'' - \bm{e}_{\rm ML}$, but the covariance is not changed and doesn't depend on the current EKF prediction.

We could analogy this pseudo-measurement to the sun sensor measurement for an attitude EKF. 
Although the sun sensor is measuring the same physical meaning, its covariance is obtained independent of the EKF estimation, therefore we could safely assume the measurement noise is independent of the EKF covariance.
So, the key point is the measurement covariance is obtained independently. 
Here, $\sigma_{\rm ML}$ is obtained independent of $\sigma_{\rm EKF}$, at the same epoch.


So, the remaining suspicion is that: \
Since $\sigma_{\rm ML}$ is generated by trained ML models but the training is based on historical data, is $\sigma_{\rm ML}$ related to previous $\sigma_{\rm EKF}$?

I believe they are independent too.
The reasoning is like this:
1. (as also stated under question-1) $\sigma_{\rm EKF}$ is not even collected for training data.
2. $\sigma_{\rm ML}$, or $\sigma_{\rm GP}$ particularly, quantifies the ML model's confidence about its prediction, which is related to the data density and the ML parameter design.
3. In other words (may not be rigorous), all the values which EKF treats as samples of some random variables, are treated as samples of a completely different random process.
{% endnote %}



------------

> Another limitation of the proposed fusion architecture is that there is no feedback. 
> As constructed, this is appropriate, given the previously mentioned issue. 
> However, if a conservative data fusion rule, such as covariance intersection, is used, then feedback is permitted, as the covariance interaction rule does not double count information. This would enable the data from the machine learning process to be leveraged in the filter directly and would facilitate better closed-loop behaviors.



Assuming the feedback is to prevent double counting information, as explained above, no information is reused although the definition of "pseudo-measurement" creates this illusion.

This definition is necessary because what we want to explore is indeed the feasibility to give the ML output a physical meaning and test it.

The covariance intersection (CI) is of course feasible and may even lead to better performance for the ML approach.
However, this can be left for a future extension to seek for the best fusion strategy.
For the present, the focus is the simplicity of EKF and the feasibility of this naive fusion strategy.



