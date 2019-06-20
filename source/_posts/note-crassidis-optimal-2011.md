---
title: Reading Notes | Optimal Estimation of Dynamic Systems (Crassidis, 2011)
categories:
  - [Notes, Book Notes]
  - [Academics, Aerospace]
tags:
  - math
  - statistics
  - estimation
  - aerospace
comments: true
mathjax: true
abbrlink:
date: 2019-06-18 10:05:00
updated:
---

{% note info %}
John L. Crassidis, and John L. Junkins, Optimal Estimation of Dynamic Systems, CRC Press, 2011.

Corrections to the book can be found at: http://ancs.eng.buffalo.edu/index.php/Optimal_Estimation_of_Dynamic_Systems_2nd_Edition
{% endnote %}


## 2.5. Maximum Likelihood Estimation

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


QUESTIONS:
- During the propagation, how is $G(t)Q(t)G(t)^T$ handled?
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
The reference trajectory over $[t_{k-1],t_k)$ can also be improved once the measurement $\tilde{\bm{y}}_k$ is given.



## 3.7. Unscented Filtering (not read yet)

## 3.8. Constrained Filtering (not read yet)

## 3.9. Summary

All important formulas are summarized here.


# 4. Advanced Topics in Sequential State Estimation ()

# 5. Batch State Estimation (to read later)

Smoothing ??



# 6. Parameter Estimation (to read now)

## 6.2. Global positioning System Navigation

## 6.4. Orbit Determination



# 7. Estimation of Dynamic Systems: Applications

## 7.3. Orbit EStimation

## 7.4. Target Tracking of Aircraft




# Appendix B. Matrix Properties

# Appendix E. Computer Software

All the MATLAB codes are available at 
http://ancs.eng.buffalo.edu/index.php/Optimal_Estimation_of_Dynamic_Systems_2nd_Edition

