---
title: 'Reading Notes | Optimal Estimation of Dynamic Systems (Crassidis, 2011)'
categories:
  - [Notes, Book Note]
  - [Academics, Aerospace]
tags:
  - math
  - statistics
  - estimation
  - aerospace
  - draft
comments: true
mathjax: true
abbrlink: 7eefaeb9
date: 2019-06-18 10:05:00
updated:
---

{% note info %}
John L. Crassidis, and John L. Junkins, Optimal Estimation of Dynamic Systems, CRC Press, 2011.

**Corrections to the book** can be found at [here](http://ancs.eng.buffalo.edu/index.php/Optimal_Estimation_of_Dynamic_Systems_2nd_Edition).
{% endnote %}

# Chapter 2 Probability Concepts in Least Squares

## 2.5. Maximum Likelihood Estimation

<!-- more -->

## 2.6. Properties of Maximum Likelihood Estimation

Invariance Principle

Consistent Estimator

Asymptotically Gaussian Property

Asymptotically Efficient Property

## 2.7. Bayesian Estimation

### 2.7.1. MAP Estimation

Maximum a posteriori estimation (MAP)
- if the a priori distribution $p(\hat{\bm{x}})$ is uniform, then MAP estimation is equivalent to maximum likelihood (MLL) estimation.
- asymptotic consistency and efficiency
- MAP estimator converges to MLL estimator for large samples
- obeys the invariance principle

### 2.7.2. Minimum Risk Estimation

assume $\bm{x}$ is distributed by the a posteriori function $p(\bm{x}|\tilde{\bm{y}})$

assign a cost to any loss suffered due to errors in the estimate

The risk funtion is
$$ J_{\rm MR}(\bm{x}^*) = \int_{-\infty}^{\infty} c(\bm{x}^*|\bm{x}) p(\bm{x}|\tilde{\bm{y}}) d\bm{x}   \tag{2.171}$$
[WHAT'S THE RELATION TO GP ?? LOOKS LIKE A PREDICTIVE DISTRIBUTION.]

{% note warning %}
For these reasons (see p97), minimum risk approaches are often avoided in practical estimation problems, although the relationship between decision theory and optimal estimation is very interesting.
{% endnote %}



## 2.8. Advanced Topics (not read yet)

### 2.8.1. Nonuniqueness of the Weight Matrix

### 2.8.2. Analysis of Covariance Errors

### 2.8.3. Ridge Estimation

### 2.8.4. Total Least Squares



# 3. Sequential State EStimation

## 3.2. Full-Order Estimators

*Ackermann's formula*

### 3.2.1. Discrete-Time Estimators

Discrete state-space representation
$$
\begin{aligned}
\bm{x}_{k+1} &= \Phi \bm{x}_k + \Gamma \bm{u}_k\\
\bm{y}_k &= H \bm{x}_k + D \bm{u}_k
\end{aligned}
\tag{A.122}
$$

$$
\begin{aligned}
\hat{\bm{x}}_{k+1}^- &= \Phi \hat{\bm{x}}_k^+ + \Gamma\bm{u}_k\\
\hat{\bm{x}}_k^+ &= \hat{\bm{x}}_k^- + K [\tilde{\bm{y}}-H\hat{\bm{x}}_k^-]
\end{aligned}
\tag{3.20}
$$

## 3.3. The Discrete-Time Kalman Filter

The *Kalman filter* provides a rigorous theoretical approach to "place" the poles of the estimator, based upon stochastic processes for the measurement error and model error.

- both discrete-time dynamic models and measurements
- both continuous-time dynamic models and measurements
- continuous-time dynamic models with discrete-time measurements

### 3.3.1. Kalman Filter Derivation

[INSERT TABLE 3.1 HERE]
<img src="{% asset_path table-3-1-discrete-time-kalman-filter.png%}" width="80%">

$$
\bm{x}_{k+1} = \Phi_k \bm{x}_k + \Gamma_k \bm{u}_k + \Upsilon_k \bm{w}_k
\tag{3.27a}
$$
$$
\tilde{\bm{y}}_k = H_k \bm{x}_k + \bm{v}_k
\tag{3.27b}
$$

assuming the errors are not correlated forward or backward in time, so that
$$
E\{ \bm{v}_k \bm{v}_j^T \} = \begin{cases}
0 & k \neq j \\
R_k & k = j
\end{cases}
\tag{3.28}
$$
and
$$
E\{ \bm{w}_k \bm{w}_j^T \} = \begin{cases}
0 & k \neq j \\
Q_k & k = j
\end{cases}
\tag{3.29}
$$

$$
\tilde{\bm{x}}_{k+1}^- = \Phi_k \tilde{\bm{x}}_k^+ - \Upsilon_k \bm{w}_k
\tag{3.33}
$$

$$
\newcommand{\xm}[1]{\tilde{\bm{x}}_{ #1}^{-}}
\newcommand{\xmT}[1]{\tilde{\bm{x}}_{ #1}^{-T}}
\newcommand{\xp}[1]{\tilde{\bm{x}}_{ #1}^{+}}
\newcommand{\xpT}[1]{\tilde{\bm{x}}_{ #1}^{+T}}
\newcommand{\wk}{\bm{w}_k}
\newcommand{\wkT}{\bm{w}_k^T}
\newcommand{\E}[1]{E\{ #1 \}}
\begin{aligned}
P_{k+1}^- 
&\equiv E\{ \xm{k+1} \xmT{k+1} \} \\
&= \E{ \Phi_k \xp{k}\xpT{k} \Phi_k^T } + \E{\Upsilon_k\wk\wkT\Upsilon_k^T} \\
&\phantom{=} - \E{\Phi_k\xp{k}\wkT\Upsilon_k^T} - \E{\Upsilon_k\wk\xpT{k}\Phi_k^T}  \\
\end{aligned}
\tag{3.34}
$$
where $\bm{w}_k^+$ and $\tilde{\bm{x}}_k^+$ are uncorrelated since $\tilde{\bm{x}}_{k+1}^-$ (not $\tilde{\bm{x}}_k$) directly depends on $\bm{w}_k$.

$$
P_{k+1}^- = \Phi_k P_k^+ \Phi_k^T - \Upsilon_k Q_k \Upsilon_k^T
\tag{3.35}
$$

$$
\tilde{\bm{x}}_k^+ = (I - K_k H_k) \tilde{\bm{x}}_k^- + K_k \bm{v}_k
\tag{3.37}
$$

$$
\newcommand{\xm}[1]{\tilde{\bm{x}}_{ #1}^{-}}
\newcommand{\xmT}[1]{\tilde{\bm{x}}_{ #1}^{-T}}
\newcommand{\xp}[1]{\tilde{\bm{x}}_{ #1}^{+}}
\newcommand{\xpT}[1]{\tilde{\bm{x}}_{ #1}^{+T}}
\newcommand{\wk}{\bm{w}_k}
\newcommand{\wkT}{\bm{w}_k^T}
\newcommand{\E}[1]{E\{ #1 \}}
\begin{aligned}
P_k^+ 
&\equiv \E{ \xp{k}\xpT{k} } \\
&= \E{ (I - K_k H_k) \xm{k} \xmT{k} (I - K_k H_k)^T } + \E{ K_k\bm{v}_k\bm{v}_k^TK_k^T } \\
&\phantom{=} + \E{(I - K_k H_k) \xm{k} \bm{v}_k^T K_k^T} + \E{ K_k \bm{v}_k \xmT{k} (I - K_k H_k)^T }
\end{aligned}
\tag{3.38}
$$


### 3.3.2 Stability and Joseph's Form

Another form for $P_{k+1}$ that ensures to be positive definite:

Using
$$
P_k^+ = [I-K_kH_k]P_k^-[I-k_kH_k]^T + K_kR_kK_k^T  \tag{3.39}
$$
instead of
$$
P_k^+ = [I-K_kH_k]P_k^-    \tag{3.44}
$$

Proof: see p149--151.

### 3.3.3. Information Filter and Sequential Processing

> handle large measurement vectors

The information filter may be more computationally efficient than the traditional Kalman filter when the size of the measurement vector is much larger than the size of the state vector.

Another more commonly used approach is to use sequential processing.\
processing one measurement at a time, then the tain and covariance are updated until all measurements at each sampling instant have been processed.

### 3.3.4. Steady-State Kalman Filter

For time-invariant systems the error covariance $P$ reaches a steady-state value very quickly.\
Therefore, a constant gain $K$ can be pre-computed using the steady-state covariance.\
The solution is <mark>suboptimal</mark> in the strictest sense but can save a lot in computations.

### 3.3.5. Relationship to Least Squares Estimation

The Kalman filter can be derived using a least squares type loss function
$$
J = \frac{1}{2}(\hat{\bm{x}}_0-\bm{x}_0)^T\mathcal{Pa}_0(\hat{\bm{x}}_0-\bm{x}_0)
+ \frac{1}{2} \sum_{i=1}^k (\tilde{\bm{y}}-H_i\hat{\bm{x}}_i)^T R_i^{-1} (\tilde{\bm{y}}-H_i\hat{\bm{x}}_i)   \tag{3.109}
$$
subject to the constraint
$$
\hat{\bm{x}}_{i+1} = \Phi(i+1,i)\hat{\bm{x}}_i,\quad i=1,2,\dots,k-1    \tag{3.110}
$$


### 3.3.6. Correlated Measurement and Process Noise

Consider the correlation between $\bm{w}_{k-1}$ and $\bm{v}_k$
$$
E\{ \bm{w}_{k-1} \bm{v}_k^T \} = S_k
\tag{3.127}
$$
because only $\bm{w}_{k-1}$ and $\bm{v}_k$ affect the measurement at the same time (3.27a substituted into 3.27b), as shown below,
$$
\begin{aligned}
\tilde{\bm{y}}_k &= H_k \bm{x}_k + \bm{v}_k \\
&= H_k \left( \Phi_{k-1} \bm{x}_{k-1} + \Gamma_{k-1} \bm{u}_{k-1} + \Upsilon_{k-1} \bm{w}_{k-1}  \right) + \bm{v}_k.
\end{aligned}
$$

In Eq. (3.38), 
$$
\newcommand{\xm}[1]{\tilde{\bm{x}}_{ #1}^{-}}
\newcommand{\xmT}[1]{\tilde{\bm{x}}_{ #1}^{-T}}
\newcommand{\xp}[1]{\tilde{\bm{x}}_{ #1}^{+}}
\newcommand{\xpT}[1]{\tilde{\bm{x}}_{ #1}^{+T}}
\newcommand{\wk}{\bm{w}_k}
\newcommand{\wkT}{\bm{w}_k^T}
\newcommand{\E}[1]{E\{ #1 \}}
\begin{aligned}
P_k^+ 
&\equiv \E{ \xp{k}\xpT{k} } \\
&= \E{ (I - K_k H_k) \xm{k} \xmT{k} (I - K_k H_k)^T } + \E{ K_k\bm{v}_k\bm{v}_k^TK_k^T } \\
&\phantom{=} + \E{(I - K_k H_k) \xm{k} \bm{v}_k^T K_k^T} + \E{ K_k \bm{v}_k \xmT{k} (I - K_k H_k)^T },
\end{aligned}
\tag{3.38}
$$
the following expectation is not zero:
$$
E\{\tilde{\bm{x}}_k^-\bm{v}_k^T\} = E\{ \left( \Phi_{k-1}\tilde{\bm{x}}_{k-1}^+ - \Upsilon_{k-1}\bm{w}_{k-1} \right) \bm{v}_k^T \}
= - E\{ \Upsilon_{k-1}\bm{w}_{k-1} \bm{v}_k^T \} = - \Upsilon_{k-1} S_k
\tag{3.128}
$$

This leads to different covariance update 
$$
P_{k}^+ = \dots \quad \color{red} (\text{Only use its trace to derive } K_k)
\tag{3.129}
$$
and Kalman gain (still by minimizing the above $P_{k}^+$)
$$
K_k = \dots
\tag{3.130}
$$
which could simplify Eq. (3.129) to the final covariance update formula
$$
P_k^+ = \dots \quad \color{red} (\text{Use this one for propagation})
$$

> (AN APPLICATION EXAMPLE, refined by me) 
> an aircraft flying through a field of random turbulence. 
> The effect of turbulence in the aircraft's acceleration is modeled as process noise on $\bm{w}_{k-1}$. 
> Since any sensor mounted on an aircraft is also corrupted by turbulence, the measurement error $\bm{v}_k$ is correlated with the process noise $\bm{w}_{k-1}$. 




### 3.3.7. Cramer-Rao Lower Bound

[see wikipedia](https://en.wikipedia.org/wiki/Cram%C3%A9r%E2%80%93Rao_bound):\
In its simplest form, the bound states that the variance of any unbiased estimator is at least as high as the inverse of the Fisher information.\


### 3.3.8. Orthogonality Principle

the orthogonality of the estimate and its error
$$
E\{\hat{\bm{x}}_k^+\tilde{\bm{x}}_k^{+T}\} = 0   \tag{3.152}
$$
where
$$
\tilde{\bm{x}}_k^+ \equiv \hat{\bm{x}}_k^+ - \bm{x}_k   \tag{3.32}
$$

This orthogonality principle is extremely important in the derivation of the linear quadratic-Gaussian controller of Sec. 8.6.

### Example 3.3: derive the process noise

<mark>For the real system (where there is always a random process term)</mark>:

Continuous system:

$$
\begin{aligned}
\dot{\theta} &= \tilde{\omega} - \beta - \eta_v \\
\dot{\beta} &= \eta_u
\end{aligned}
$$

Discrete system:

Let $\Delta t = t_{k+1} - t_{k}$.

$$
\begin{aligned}
\theta_{k+1} - \theta_{k} &= \int_{t_k}^{t_{k+1}} [\tilde{\omega} - \beta - \eta_v] d\tau \\
&= \int_{t_k}^{t_{k+1}} \tilde{\omega} d\tau - \int_{t_k}^{t_{k+1}} \textcolor{red}{\beta(\tau)} d\tau - \int_{t_k}^{t_{k+1}} \eta_v d\tau\\
&= \int_{t_k}^{t_{k+1}} \tilde{\omega} d\tau 
- \left[ \beta_k \Delta t + \int_{t_k}^{t_{k+1}} (t_{k+1} - \tau) \eta_u(\tau)d\tau \right]
- \int_{t_k}^{t_{k+1}} \eta_v d\tau \quad \text{[see Eq. eg.3.3.x1]}\\
&= \int_{t_k}^{t_{k+1}} \tilde{\omega} d\tau 
- \beta_k \Delta t - \int_{t_k}^{t_{k+1}} \left[ \eta_v(\tau) + (t_{k+1} - \tau)\eta_u(\tau) \right] d\tau \\
\\
\beta_{k+1} - \beta_{k} &= \int_{t_k}^{t_{k+1}} \eta_u d\tau 
\quad\Rightarrow\quad \textcolor{red}{\beta(\tau) = \beta_k + \int_{t_k}^{\tau} \eta_u(\nu) d\nu} \\
\end{aligned}
$$

$$
\begin{aligned}
\int_{t_k}^{t_{k+1}} \textcolor{red}{\beta(\tau)} d\tau &= 
\int_{t_k}^{t_{k+1}} \left[ \textcolor{red}{\beta_k + \int_{t_k}^{\tau} \eta_u(\nu) d\nu} \right] d\tau \\
&= \int_{t_k}^{t_{k+1}} \textcolor{red}{\beta_k} d\tau + \int_{t_k}^{t_{k+1}} \textcolor{red}{\int_{t_k}^{\tau} \eta_u(\tau) d\tau} d\tau \\
&= \textcolor{red}{\beta_k} \Delta t + \textcolor{magenta}{\int_{t_k}^{t_{k+1}} \int_{t_k}^{\tau} \eta_u(\nu) d\nu d\tau }\\
&= \beta_k \Delta t + \textcolor{magenta}{\int_{t_k}^{t_{k+1}} (t_{k+1} - \tau) \eta_u(\tau) d\tau } \quad \text{[see Eq. eg.3.3.x2]}\\
\end{aligned}
\tag{eg.3.3.x1}
$$

$$
\begin{aligned}
\textcolor{magenta}{\int_{t_k}^{t_{k+1}} \left[ \int_{t_k}^{\tau} \eta_u(\nu) d\nu \right] d\tau} 
&= \int_{t_k}^{t_{k+1}} \left[ \left[ \tau \int_{t_k}^\tau \eta_u(\nu)d\nu \right]' - \tau \eta_u(\tau) \right] d\tau   \quad \text{[see Eq. eg.3.3.x3]}\\
&= \int_{t_k}^{t_{k+1}} \left[ \tau \int_{t_k}^\tau \eta_u(\nu)d\nu \right]' d\tau - \int_{t_k}^{t_{k+1}} \tau \eta_u(\tau) d\tau \\
&= t_{k+1} \int_{t_k}^{t_{k+1}} \eta_u(\nu)d\nu - \cancel{t_k \int_{t_k}^{t_k} \eta_u(\nu)d\nu} - \int_{t_k}^{t_{k+1}} \tau \eta_u(\tau) d\tau \\
&= \textcolor{magenta}{\int_{t_k}^{t_{k+1}} (t_{k+1} - \tau) \eta_u(\tau) d\tau}
\end{aligned}
\tag{eg.3.3.x2}
$$

$$
\left[ \tau \int_{t_k}^\tau \eta_u(\nu)d\nu \right]' 
= \textcolor{red}{\int_{t_k}^\tau \eta_u(\nu)d\nu} + \tau \eta_u(\tau) 
\quad \text{[integration by parts]}
\tag{eg.3.3.x3}
$$

{% note info %}
{% tabs [Series derivation (kept for my own record)], -1%}
<!-- tab [Series derivation (kept for my own record)] -->
> [Keep for records. Only after using the following series derivation, I realized I should have used *integration by parts*.]
> 
> Assuming $\{ \tau_1, \tau_2, \cdots, \tau_n \}$, where $\tau_1 = t_k$ and $\tau_n = t_{k+1}$, and $\nu_i=\tau_i$.
> $$
> \begin{aligned}
> \int_{t_k}^{t_{k+1}} \int_{t_k}^{\tau} \eta_u(\nu) d\nu d\tau
> &= \lim_{n\rightarrow\infin} \sum_{i = 1}^{n} \sum_{j=1}^{i} \eta_u(\nu_j) \delta\nu \delta\tau \\
> &= \lim_{n\rightarrow\infin} \{ \eta_u(\nu_1) \\
> &\phantom{=}+ \eta_u(\nu_1) + \eta_u(\nu_2) \\
> &\phantom{=}+ \eta_u(\nu_1) + \eta_u(\nu_2) + \eta_u(\nu_3) \\
> &\phantom{=}+ \cdots \\
> &\phantom{=}+ \eta_u(\nu_1) + \eta_u(\nu_2) + \eta_u(\nu_3) + \cdots + \eta_u(\nu_n) \} \cdot \delta\nu \delta\tau \\
> &= \lim_{n\rightarrow\infin} \sum_{i=1}^{n} (n-i+1) \eta_u(\nu_i) \delta\nu \delta\tau \\
> &= \lim_{n\rightarrow\infin} \sum_{i=1}^{n} (n-i+1)\delta\tau \eta_u(\nu_i)\delta\nu \\
> &= \lim_{n\rightarrow\infin} \sum_{i=1}^{n} (t_{k+1}-\tau_i) \eta_u(\nu_i)\delta\nu \\
> &= \int_{t_k}^{t_{k+1}} (t_{k+1}-\tau) \eta_u(\tau) d\tau
> \end{aligned}
> $$
<!-- endtab -->
{% endtabs %}
{% endnote %}

<mark>For the estimation system</mark>:

Continuous system:
$$
\begin{aligned}
\dot{\hat{\theta}} &= \tilde{\omega} - \hat{\beta} \\
\dot{\hat{\beta}} &= 0
\end{aligned}
$$

Discrete system:
$$
\begin{aligned}
\hat{\theta}_{k+1} - \hat{\theta}_k
&= \int_{t_k}^{t_{k+1}} \dot{\hat{\theta}}(\tau) d\tau \\
&= \int_{t_k}^{t_{k+1}} [\tilde{\omega}(\tau) - \hat{\beta}(\tau)] d\tau \\
&= \int_{t_k}^{t_{k+1}} \tilde{\omega}(\tau) d\tau - \hat{\beta}_k \Delta t 
\\
\hat{\beta}_{k+1} - \hat{\beta}_k &= 0\\
\end{aligned}
$$

<mark>Then, we have the final discrete-time error propagation equation</mark>
$$
\begin{aligned}
\theta_{k+1} - \hat{\theta}_{k+1} &= \theta_k - \hat{\theta}_k \\
&\phantom{=} + \left\{ \cancel{\int_{t_k}^{t_{k+1}} \tilde{\omega} d\tau} 
- \beta_k \Delta t - \int_{t_k}^{t_{k+1}} \left[ \eta_v(\tau) + (t_{k+1} - \tau)\eta_u(\tau) \right] d\tau \right\}\\
&\phantom{=} - \left\{ \cancel{\int_{t_k}^{t_{k+1}} \tilde{\omega} d\tau} - \hat{\beta}_k \Delta t \right\} \\
&= \theta_k - \hat{\theta}_k 
- (\beta_k - \hat{\beta}_k) \Delta t 
+ \textcolor{magenta}{\int_{t_k}^{t_{k+1}} \left[ - \eta_v(\tau) - (t_{k+1} - \tau)\eta_u(\tau) \right] d\tau} \\
&\equiv \theta_k - \hat{\theta}_k 
- (\beta_k - \hat{\beta}_k) \Delta t + \textcolor{magenta}{p_k}
\\
\beta_{k+1} - \hat{\beta}_{k+1} &= \beta_{k} - \hat{\beta}_{k} + \textcolor{magenta}{\int_{t_k}^{t_{k+1}} \eta_u d\tau} \\
&\equiv \beta_{k} - \hat{\beta}_{k} + \textcolor{magenta}{q_k}
\end{aligned}
$$

The discrete process noise is 
$$
\newcommand{\E}[1]{E\left\{ #1\right\}}
Q = \begin{bmatrix} Q_{11} & Q_{12} \\ Q_{21} & Q_{22} \end{bmatrix}
\equiv \begin{bmatrix} \E{p_k^2} & \E{p_kq_k} \\ \E{q_kp_k} & \E{q_k^2} \end{bmatrix}
$$

$$
\newcommand{\E}[1]{E\left\{ #1\right\}}
\newcommand{\I}{\int_{t_k}^{t_{k+1}}}
\begin{aligned}
\E{p_k^2} 
&= \E{ \left( \I \left[ - \eta_v(\tau) - (t_{k+1} - \tau)\eta_u(\tau) \right] d\tau \right)^2 } \\
&= \E{ \I  \textcolor{red}{\I \left[ - \eta_v(\nu) - (t_{k+1} - \nu)\eta_u(\nu) \right] \left[ - \eta_v(\tau) - (t_{k+1} - \tau)\eta_u(\tau) \right] d\nu} d\tau  } \\
&-------- \text{(Paused) (Expand the red integrand)} \\
& \left[ \eta_v(\nu) +(t_{k+1} - \nu)\eta_u(\nu) \right] \left[ \eta_v(\tau) + (t_{k+1} - \tau)\eta_u(\tau) \right] \\
&= \left[ \eta_v(\nu) +(t_{k+1} - \nu)\eta_u(\nu) \right] \eta_v(\tau) + \left[ \eta_v(\nu) +(t_{k+1} - \nu)\eta_u(\nu) \right] (t_{k+1} - \tau)\eta_u(\tau)\\
&= \eta_v(\nu)\eta_v(\tau) 
+ (t_{k+1} - \nu)\eta_v(\tau)\eta_u(\nu) 
+ (t_{k+1} - \tau)\eta_v(\nu)\eta_u(\tau) 
+ (t_{k+1} - \nu)(t_{k+1} - \tau)\eta_u(\nu)\eta_u(\tau) \\
&-------- \text{(Integrate each expanded integrand)} \\
&\I \eta_v(\nu)\eta_v(\tau) d\nu = \eta_v^2(\tau)\\
&\I (t_{k+1} - \nu)\eta_v(\tau)\eta_u(\nu) d\nu = (t_{k+1} - \tau)\eta_v(\tau)\eta_u(\tau) = 0   \quad[\sigma_v \text{ and } \sigma_u \text{ uncorrelated?}] \\
&\I (t_{k+1} - \tau)\eta_v(\nu)\eta_u(\tau) d\nu = (t_{k+1} - \tau)\eta_v(\tau)\eta_u(\tau) = 0   \quad[\sigma_v \text{ and } \sigma_u \text{ uncorrelated?}]\\
&\I (t_{k+1} - \nu)(t_{k+1} - \tau)\eta_u(\nu)\eta_u(\tau) d\nu = (t_{k+1} - \tau)^2\nu_u^2(\tau) \\
&-------- \text{(continued)}\\
&= \I \E{ \eta_v^2(\tau) } d\tau + \I (t_{k+1}-\tau)^2\E{ \eta_u^2(\tau) } d\tau \\
&= \I \E{ \eta_v^2(\tau) } d\tau + \sigma_u^2 \I (t_{k+1}-\tau)^2 d\tau \\
&= \sigma_v^2\Delta t + \sigma_u^2 \left. \frac{-(t_{k+1}-\tau)^3}{3} \right|_{t_k}^{t_{k+1}}  \\
&= \sigma_v^2\Delta t + \sigma_u^2\frac{\Delta t^3}{3} \\
\end{aligned}
$$

$$
\newcommand{\E}[1]{E\left\{ #1\right\}}
\newcommand{\I}{\int_{t_k}^{t_{k+1}}}
\begin{aligned}
\E{p_k q_k} 
&= \E{ \left( \I \left[ - \eta_v(\tau) - (t_{k+1} - \tau)\eta_u(\tau) \right] d\tau \right) \left( \int_{t_k}^{t_{k+1}} \eta_u d\tau \right) } \\
&= \E{ \I \I \left[ - \eta_v(\tau) - (t_{k+1} - \tau)\eta_u(\tau) \right] \eta_u(\nu) d\nu d\tau } \\
&= - \E{ \I \I \left[\eta_v(\tau)\eta_u(\nu) + (t_{k+1} - \tau)\eta_u(\tau)\eta_u(\nu) \right] d\nu d\tau } \\
&= -\E{ \I \eta_v(\tau)\eta_u(\tau) d\tau + \I (t_{k+1} - \tau)\eta_u^2(\tau) d\tau } \\
&= 0 - \I (t_{k+1} - \tau)\E{\eta_u^2(\tau)} d\tau \\
&= \sigma_u^2 \left. \frac{(t_{k+1} - \tau)^2}{2} \right|_{t_k}^{t_{k+1}} 
= - \sigma_u^2 \frac{\Delta t^2}{2}
\end{aligned}
$$

$$
\newcommand{\E}[1]{E\left\{ #1\right\}}
\newcommand{\I}{\int_{t_k}^{t_{k+1}}}
\begin{aligned}
\E{q_k^2} &= \E{ \left( \int_{t_k}^{t_{k+1}} \eta_u d\tau \right)^2 } \\
&= \I \E{\eta_u^2} d\tau = \sigma_u^2 \Delta t
\end{aligned}
$$


---------------
### MY-QUESTION-1: If bias is not estimated (Not in the book, double check this!)
<mark>For the real system</mark>:

Continuous system:

$$
\begin{aligned}
\dot{\theta} &= \tilde{\omega} - \beta_\text{ML} - \eta_v \\
\end{aligned}
$$

Discrete system:

Let $\Delta t = t_{k+1} - t_{k}$.

$$
\begin{aligned}
\theta_{k+1} - \theta_{k} &= \int_{t_k}^{t_{k+1}} [\tilde{\omega} - \beta_\text{ML} - \eta_v] d\tau \\
&= \int_{t_k}^{t_{k+1}} \tilde{\omega} d\tau - \int_{t_k}^{t_{k+1}} \beta_\text{ML}(\tau) d\tau - \int_{t_k}^{t_{k+1}} \eta_v d\tau\\
&= \int_{t_k}^{t_{k+1}} \tilde{\omega} d\tau 
- \beta_{\text{ML},k} \Delta t
- \int_{t_k}^{t_{k+1}} \eta_v d\tau
\end{aligned}
$$

<mark>For the estimation system</mark>:

Continuous system:
$$
\dot{\hat{\theta}} = \tilde{\omega} - \beta_\text{ML}
$$

Discrete system:
$$
\begin{aligned}
\hat{\theta}_{k+1} - \hat{\theta}_k
&= \int_{t_k}^{t_{k+1}} \dot{\hat{\theta}}(\tau) d\tau \\
&= \int_{t_k}^{t_{k+1}} \left[ \tilde{\omega}(\tau) - \beta_\text{ML}(\tau) \right] d\tau \\
&= \int_{t_k}^{t_{k+1}} \tilde{\omega}(\tau) d\tau - \beta_{\text{ML},k} \Delta t
\end{aligned}
$$

<mark>Then, we have the final discrete-time error propagation equation</mark>
$$
\begin{aligned}
\theta_{k+1} - \hat{\theta}_{k+1} &= \theta_k - \hat{\theta}_k \\
&\phantom{=} + \left\{ \cancel{\int_{t_k}^{t_{k+1}} \tilde{\omega} d\tau} 
- \bcancel{\beta_{\text{ML},k} \Delta t} - \int_{t_k}^{t_{k+1}} \eta_v(\tau) d\tau \right\}\\
&\phantom{=} - \left\{ \cancel{\int_{t_k}^{t_{k+1}} \tilde{\omega} d\tau} - \bcancel{\beta_{\text{ML},k} \Delta t} \right\} \\
&= \theta_k - \hat{\theta}_k 
+ \textcolor{magenta}{\int_{t_k}^{t_{k+1}} - \eta_v(\tau) d\tau} \\
&\equiv \theta_k - \hat{\theta}_k 
+ \textcolor{magenta}{p_k}
\end{aligned}
$$

$$
\newcommand{\E}[1]{E\left\{ #1\right\}}
\newcommand{\I}{\int_{t_k}^{t_{k+1}}}
\begin{aligned}
\E{p_k^2} 
&= \E{ \left( \I - \eta_v(\tau) d\tau \right)^2 } \\
&= \E{ \I  \textcolor{red}{\I \eta_v(\nu) \eta_v(\tau) d\nu} d\tau  } \\
&= \E{ \I  \textcolor{red}{\eta_v^2(\tau)} d\tau  } \\
&= \I \E{ \eta_v^2(\tau) } d\tau \\
&= \sigma_v^2\Delta t
\end{aligned}
$$

---------------

### MY-QUESTION-2: Other process noise?

The above derivations only considered the process noise due to
1. the difference between the `real system model` and the `estimation system model`;
2. the time discretization.

So, it doesn't consider the process noise due to other differences to the `reality` (not the `real system model`). If so, do we need an additional term to compensate for additional uncertainties?\
~~(Is my speculation correct?)~~ Maybe not, because the `real system model` is also a model of the `reality`.

Can I just simply increase $\sigma_v$ and $\sigma_u$ to reflect other model errors?
Because the `real system model` is an approximation of the `reality` and the last term $\bm{\eta}_v$ should include or absorb all the differences to `reality`.
Similar for $\sigma_u$.\
<mark>(Is this speculation correct?)</mark> 



## 3.4. The Continuous-Time Kalman Filter

## 3.5. The Continuous-Discrete Kalman Filter

$$
\begin{aligned}
\dot{\bm{x}}(t) &= F(t)\bm{x}(t) + B(t)\bm{u}(t) + G(t)\bm{w}(t)\\
\tilde{\bm{y}}_k &= H_k\bm{x}_k + \bm{v}_k
\end{aligned}
$$

[INSERT TABLE 3.7]
<img src="{% asset_path table-3-7-continous-discrete-kalman-filter.png%}" width="80%">

The continuous-time propagation model equation does not involve the measurement directly.
The covariance propagation follows a continuous-time Lyapunov differential equation.

the sample times of the measurements need not occur in regular intervals.
In fact, different measurement sets can be spread out over various time intervals.

The real beauty of the continuous-discreteKalman filter is that it can handle different
scattered measurement sets quite easily.


QUESTIONS:
- During the propagation, how is $G(t)Q(t)G(t)^T$ handled?
  - This is just a normal term.
  - $G(t)\bm{w}_t$ shall be handled as a random term.
- How is it handled in Orekit? 


## 3.6. Extended Kalman Filter

The problem with this nonlinear model is that a Gaussian input does not necessarily produce a Gaussian output (unlike the linear case).

The fundamental concept of this filter involves the notion that the true state is sufficiently close to the estimated state. 
Therefore, the error dynamics can be represented fairly accurately by a linearized first-order Taylor series expansion.

[INSERT TABLE 3.8]
<img src="{% asset_path table-3-8-continous-time-extended-kalman-filter.png%}" width="80%">

A steady-state gain cannot be found, because $F(t)$ and $H(t)$ in Table 3.8 will not be constant in general.


**Another approach** involves linearizing about the normal (a priori) state vector $\bar{\bm{x}}(t)$ instead of the current estiamte $\hat{\bm{x}}(t)$.

This gives the ***linearized Kalman filter***.
In general, the linearized Kalman filter is less accurate than the extended Kalman filter since $\bar{\bm{x}}(t)$ is usually not as close to the truth as is $\hat{\bm{x}}(t)$.
However, since the nominal state is known a priori the gain $K(t)$ can be pre-computed and stored, which reduces the on-line computational burden.


[INSERT TABLE 3.9]
<img src="{% asset_path table-3-9-continous-discrete-extended-kalman-filter.png%}" width="80%">


{% note warning %}
Proving convergence in the extended Kalman filter is difficult (if not impossible!) even for simple systems where the initial condition is not well known.\
But it is often robust to initial condition errors, which can often be **verified through simulation**.
{% endnote %}


***iterated extended Kalman filter***:\
local iteration at step $k$, until no longer improved.

***nonlinear smoother*** back to time $t_{k-1}$ (see Sec. 5.1.3):\
The reference trajectory over $[t_{k-1},t_k)$ can also be improved once the measurement $\tilde{\bm{y}}_k$ is given.



## 3.7. Unscented Filtering (not needed for now)

## 3.8. Constrained Filtering (not needed for now)

## 3.9. Summary

All important formulas are summarized here.


# 4. Advanced Topics in Sequential State Estimation ()

# 5. Batch State Estimation (to read later)

Smoothing ??
## 5.1

### 5.1.3. (utilized in Sec. 7.4., to read)


# 6. Parameter Estimation: Applications (to read now)

## 6.2. Global positioning System Navigation


## 6.4. Orbit Determination

Gaussian Least Squares Differential Correction (GLSDC)

$$
??
\tag{6.53}
$$

$$
??
\tag{6.54}
$$

$$ F \equiv \frac{\partial\bm{f}}{\partial\bm{x}} = \begin{bmatrix}0_{3\times3}&I_{3\times3}\\F_{21}&0_{3\times3}\end{bmatrix}    \tag{6.57}$$
$$ \frac{\partial \bm{h}}{\partial\bm{x}} = \begin{bmatrix}H_{11}&0_{3\times3}\end{bmatrix} $$



# 7. Estimation of Dynamic Systems: Applications

## 7.1. Attitude Estimation
$$
\dot{\mathbf{q}} = \frac{1}{2} \Omega(\bm{\omega}) \mathbf{q}
\tag{7.1}
$$

### 7.1.2. Discrete-Time Attitude Estimation

The following approach is named "power series approach", which is used to derive a discrete approximation to the continuous propagation.
Here, the example in the book is for the discrete quaternion propagation of the kinematic equation
$$
\dot{\mathbf{q}} = \frac{1}{2} \Omega(\bm{\omega}) \mathbf{q}
\tag{7.1}
$$

$$
\newcommand{\ww}[0]{\hat{\bm{\omega}}}
\newcommand{\IwI}[0]{\|\hat{\bm{\omega}}\|}
\newcommand{\OO}[0]{\Omega}
\OO(\ww) = \begin{bmatrix} -[\ww\times] & \ww \\ -\ww^T & 0 \end{bmatrix} = \begin{bmatrix} 0 & -w3 & w2 & w1 \\ w3 & 0 & -w1 & w2 \\ -w2 & w1 & 0 & w3 \\ -w1 & -w2 & -w3 & 0 \end{bmatrix}
$$

$$
\newcommand{\ww}[0]{\hat{\bm{\omega}}}
\newcommand{\IwI}[0]{\|\hat{\bm{\omega}}\|}
\newcommand{\OO}[0]{\Omega}
\begin{aligned}
\OO^2(\ww) &= -\IwI^2 I_{4\times4} \\
\OO^3(\ww) &= -\IwI^2 \OO(\ww) \\
&\cdots \\
\OO^{2k}(\ww) &= (-1)^k\IwI^{2k} I_{4\times4} \quad(k\geq0, \textcolor{blue}{\OO^0=I_{4\times4} \text{ does satisfy.}})\\
\OO^{2k+1}(\ww) &= (-1)^k\IwI^{2k} \OO(\ww) \\
\end{aligned}
\tag{7.36}
$$

$$
\newcommand{\ww}[0]{\hat{\bm{\omega}}}
\newcommand{\IwI}[0]{\|\hat{\bm{\omega}}\|}
\newcommand{\OO}[0]{\Omega}
\begin{aligned}
\exp\left[ \frac{1}{2}\OO(\ww)t \right] &= \sum_{j=0}^{\infty} \frac{\left[ \frac{1}{2}\OO(\ww)t \right]^j}{j!} \\
&= \sum_{k=0}^{\infty} \frac{\left[ \frac{1}{2} t \right]^{(2k)} (-1)^k\IwI^{2k} I_{4\times4} }{(2k)!} 
+ \sum_{k=0}^{\infty} \frac{\left[ \frac{1}{2} t \right]^{(2k+1)} (-1)^k\IwI^{2k} \OO(\ww) }{(2k+1)!} \\
&= I_{4\times4} \textcolor{red}{ \sum_{k=0}^{\infty} \frac{(-1)^k \left[ \frac{1}{2} \IwI t \right]^{(2k)} }{(2k)!} }
+ \frac{\OO(\ww)}{\IwI} \textcolor{magenta}{ \sum_{k=0}^{\infty} \frac{(-1)^k \left[ \frac{1}{2} \IwI t \right]^{(2k+1)}   }{(2k+1)!} } \\
&= I_{4\times4} \textcolor{red}{\cos\left( \frac{1}{2} \IwI t \right)} + \frac{\OO(\ww)}{\IwI} \textcolor{magenta}{\sin\left( \frac{1}{2} \IwI t \right)}
\end{aligned}
\tag{7.35+37+38}
$$

Now I derive the approximation to the state transition matrix $\Phi$, whose ODE is
$$
\dot{\Phi} = F(t) \Phi
$$

$$
\newcommand{\wx}[0]{[\hat{\bm{\omega}}\times]}
F(t) = \begin{bmatrix} -\wx & -I_{3\times3} \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix} 
%= \begin{bmatrix} 0 & -w_3 & w_2 & \vdots \\ w_3 & 0 & -w_1 & -I_{3\times3} \\ -w_2 & w_1 & 0 & \vdots \\ \cdots & \bm{0}_{3\times3} & \cdots & \bm{0}_{3\times3} \end{bmatrix}
$$

$$
\newcommand{\wx}[0]{[\hat{\bm{\omega}}\times]}
\newcommand{\IwI}{\|\hat{\bm{\omega}}\|}
\begin{aligned}
\wx &= \begin{bmatrix} 0 & -w_3 & w_2 \\ w_3 & 0 & -w_1 \\ -w_2 & w_1 & 0 \end{bmatrix} \\
\wx^2 &= \begin{bmatrix} -w_3^2-w_2^2 & w_1w_2 & w_3w_1 \\
w_1w_2 & -w_3^2-w_1^2 & w_2w_3 \\
w_1w_3 & w_2w_3 & -w_1^2-w_2^2 
\end{bmatrix} \\
\wx^3 &= -\IwI^2 \wx \\
\wx^4 &= -\IwI^2 \wx^2 \\
\wx^5 &= \IwI^4 \wx \\
\wx^6 &= \IwI^4 \wx^2 \\
&\cdots \\
\wx^{2k} &= (-1)^{k-1}\IwI^{2k-2} \wx^2 \quad(k>0,\textcolor{red}{\wx^0 = I_{3\times3} \text{ does NOT satisfy.}})\\
\wx^{2k+1} &= (-1)^k\IwI^{2k}\wx \quad\textcolor{blue}{(\wx^1 = \wx \text{ does satisfy.})}
\end{aligned}
$$

$$
\newcommand{\wx}[0]{[\hat{\bm{\omega}}\times]}
\begin{aligned}
F^2(t) &= \begin{bmatrix} \wx^2 & \wx \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix} 
= \wx \begin{bmatrix} \wx & I_{3\times3} \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix} \\
%= \begin{bmatrix} w_3^2+w_2^2 & w_1w_2 & w_3w_1 & 0 & -w_3 & w_2 \\
%w_1w_2 & w_3^2+w_1^2 & w_2w_3 & w_3 & 0 & -w_1 \\
%w_1w_3 & w_2w_3 & w_1^2+w_2^2 & -w_2 & w_1 & 0 \\
%\cdots & \bm{0}_{3\times3} & \cdots & \cdots & \bm{0}_{3\times3} & \cdots
%\end{bmatrix} \\
F^3(t) &= \begin{bmatrix} -\wx^3 & -\wx^2 \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix} = -\wx^2 \begin{bmatrix} \wx & I_{3\times3} \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix} \\
%F^4(t) &= \begin{bmatrix} \wx^4 & \wx^3 \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix} = \wx^3 \begin{bmatrix} \wx & I_{3\times3} \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix} \\
&\cdots \\
F^{k}(t) &= \begin{bmatrix} (-1)^k\wx^{k} & (-1)^k\wx^{k-1} \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix} \\
%&= (-1)^k\wx^{k-1} \begin{bmatrix} \wx & I_{3\times3} \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix} = (-1)^k\wx^{k-1} F(t)
\end{aligned}
$$

$$
\newcommand{\wx}[0]{[\hat{\bm{\omega}}\times]}
\newcommand{\IwI}{\|\hat{\bm{\omega}}\|}
\begin{aligned}
F^{2k}(t) &= \begin{bmatrix} \wx^{2k} & \wx^{2k-1} \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix} 
\quad(k>0, \textcolor{red}{F^0(t) = \begin{bmatrix} I_{3\times3} & \bm{0}_{3\times3} \\ \bm{0}_{3\times3} & I_{3\times3} \end{bmatrix} \text{ does NOT satisfy.}})
\\
F^{2k+1}(t) &= \begin{bmatrix} -\wx^{2k+1} & -\wx^{2k} \\ \bm{0}_{3\times3} & \bm{0}_{3\times3} \end{bmatrix}
\quad\textcolor{blue}{(F^1(t) = F^1 \text{ does satisfy.})}
\end{aligned}
$$

$$
\newcommand{\wx}[0]{[\hat{\bm{\omega}}\times]}
\begin{aligned} 
\Phi \equiv \begin{bmatrix} \Phi_{11} & \Phi_{12} \\ \Phi_{21} & \Phi_{22} \end{bmatrix} 
&= \exp\left[ F(t) t \right] \\
&= \sum_{j=0}^{\infty} \frac{\left[ F(t) t \right]^j}{j!} \\
&= F^0 + \sum_{k=1}^{\infty} \frac{t^{2k}F^{2k}}{(2k)!} + \sum_{k=0}^{\infty} \frac{t^{2k+1}F^{2k+1}}{(2k+1)!} \\
\end{aligned}
$$

$$
\newcommand{\wx}[0]{[\hat{\bm{\omega}}\times]}
\newcommand{\IwI}{\|\hat{\bm{\omega}}\|}
\begin{aligned}
\Phi_{11}
&= I_{3\times3} + \left[ \sum_{k=1}^{\infty} \frac{\wx^{2k} t^{2k}}{(2k)!} \right] + \sum_{k=0}^{\infty} \frac{-\wx^{2k+1} t^{2k+1}}{(2k+1)!} \\
&= I_{3\times3} + \left[ \textcolor{red}{\sum_{k=1}^{\infty} \frac{(-1)^{k-1}\IwI^{2k-2} \wx^2 t^{2k}}{(2k)!}} \right] + \textcolor{magenta}{\sum_{k=0}^{\infty} \frac{-(-1)^k\IwI^{2k}\wx t^{2k+1}}{(2k+1)!}} \\
&= I_{3\times3} + \left[ \frac{\wx^2}{\IwI^2} + \textcolor{red}{\sum_{k=0}^{\infty} \frac{(-1)^{k-1}\IwI^{2k-2} \wx^2 t^{2k}}{(2k)!}} \right] + \textcolor{magenta}{\sum_{k=0}^{\infty} \frac{-(-1)^k\IwI^{2k}\wx t^{2k+1}}{(2k+1)!}} \\
&= I_{3\times3} + \frac{\wx^2}{\IwI^2} \textcolor{red}{- \frac{\wx^2}{\IwI^2} \sum_{k=0}^{\infty} \frac{(-1)^{k}\IwI^{2k} t^{2k}}{(2k)!}}
\textcolor{magenta}{ - \frac{\wx}{\IwI} \sum_{k=0}^{\infty} \frac{(-1)^k\IwI^{2k+1} t^{2k+1}}{(2k+1)!}} \\
&= I_{3\times3} + \frac{\wx^2}{\IwI^2} \textcolor{red}{- \cos(\IwI t)} \textcolor{magenta}{- \sin(\IwI t)}
%\\
%\wx^{2k} &= (-1)^{k-1}\IwI^{2k-2} \wx^2 \\
%\wx^{2k+1} &= (-1)^k\IwI^{2k}\wx
\end{aligned}
\tag{Derivation of 7.45b}
$$

$$
\newcommand{\wx}[0]{[\hat{\bm{\omega}}\times]}
\newcommand{\IwI}{\|\hat{\bm{\omega}}\|}
\begin{aligned}
\Phi_{12}
&= \left[ \sum_{k=1}^{\infty} \frac{\wx^{2k-1} t^{2k}}{(2k)!} \right] 
+ \sum_{k=0}^{\infty} \frac{-\wx^{2k} t^{2k+1}}{(2k+1)!} \\
&= \left[ \sum_{k=1}^{\infty} \frac{(-1)^{k-1}\IwI^{2(k-1)}\wx t^{2k}}{(2k)!} \right] 
+ \left[ -\wx^0 t + \sum_{k=1}^{\infty} \frac{-(-1)^{k-1}\IwI^{2k-2}\wx^2 t^{2k+1}}{(2k+1)!} \right] \\
&= \left[ -\frac{\wx}{\IwI^2} \sum_{k=1}^{\infty} \frac{(-1)^k\IwI^{2k} t^{2k}}{(2k)!} \right] 
+ \left[ - I_{3\times3} t + \frac{\wx^2}{\IwI^3} \sum_{k=1}^{\infty} \frac{(-1)^{k}\IwI^{2k+1} t^{2k+1}}{(2k+1)!} \right] \\
&= \left[ \frac{\wx}{\IwI^2} \textcolor{red}{-\frac{\wx}{\IwI^2} \sum_{k=0}^{\infty} \frac{(-1)^k\IwI^{2k} t^{2k}}{(2k)!}} \right] 
+ \left[ - I_{3\times3} t - \frac{\wx^2\IwI t}{\IwI^3} \textcolor{magenta}{+ \frac{\wx^2}{\IwI^3} \sum_{k=0}^{\infty} \frac{(-1)^{k}\IwI^{2k+1} t^{2k+1}}{(2k+1)!}} \right] \\
&= \frac{\wx}{\IwI^2} \textcolor{red}{-\frac{\wx}{\IwI^2} \cos(\IwI t)} - I_{3\times3} t - \frac{\wx^2\IwI t}{\IwI^3} \textcolor{magenta}{+ \frac{\wx^2}{\IwI^3} \sin(\IwI t)} \\
%\\
%\wx^{2k} &= (-1)^{k-1}\IwI^{2k-2} \wx^2 \\
%\wx^{2k+1} &= (-1)^k\IwI^{2k}\wx \\
%\wx^{2k-1} &= (-1)^{k-1}\IwI^{2(k-1)}\wx
\end{aligned}
\tag{Derivation of 7.45c}
$$

$$
\Phi_{21} = \bm{0}_{3\times3}  \tag{Derivation of 7.45d}
$$

$$
\Phi_{21} = I_{3\times3}  \tag{Derivation of 7.45e}
$$


$$
\newcommand{\Dt}{\Delta t}
\newcommand{\wx}{[\hat{\bm{\omega}}\times]}
\newcommand{\wn}{\|\hat{\bm{\omega}}\|}
\newcommand{\sinwnt}{\sin(\wn\Dt)}
\newcommand{\coswnt}{\cos(\wn\Dt)}
\begin{aligned}
\Phi_{11} &= I_{3\times3} - \wx \frac{\sinwnt}{\wn} + \wx^2 \frac{1-\coswnt}{\wn^2}, \\
\Phi_{12} &= \wx \frac{1-\coswnt}{\wn^2} - I_{3\times3}\Dt - \wx^2 \frac{\wn\Dt - \sinwnt}{\wn^3}
\end{aligned}
\tag{7.45b and c in the book}
$$

## 7.3. Orbit EStimation




## 7.4. Target Tracking of Aircraft

The algorithm for orbit determination is essentially equivalent to the nonlinear fixed-point smoother in Sec. 5.1.3 with a covariance reset.
[CHECK THIS!!!]

only need to analytically compute Eqs. 6.53, 6.54, 6.57, 6.67.


# Appendix B. Matrix Properties

# Appendix E. Computer Software

All the MATLAB codes are available at 
http://ancs.eng.buffalo.edu/index.php/Optimal_Estimation_of_Dynamic_Systems_2nd_Edition

