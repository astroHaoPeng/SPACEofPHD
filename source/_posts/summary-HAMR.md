---
title: High Area-to-Mass Ratio (HAMR) 文献摘要
categories:
  - Notes
tags:
  - Paper Notes
  - HAMR
  - Fokker-Planck-Kolmogorov
  - FPK equation
abbrlink: f0398937
date: 2016-04-25 11:09:14
updated: 2017-06-15 00:00:00
---

## brack_inorbit_2017

> In-Orbit Tracking of High Area-to-Mass Ratio Space Objects

这篇的intro介绍了许多新内容，值得学习


## Singla, Puneet. 2016. “Certain Thoughts on Uncertainty Analysis for Dynamical Systems.” Department of Mechanical and Aerospace Engineering, University of Texas at Arlington, August 17. http://lairs.eng.buffalo.edu/wiki/images/a/ac/SinglaTalk.pdf.

> The fusion of observational data with numerical simulation promises to provide greater understanding of physical phenomenon than either approach alone can achieve.

> The most critical challenge here is to provide a quantitative assessment of how closely our estimates reflect reality in the presence of model uncertainty as well as measurement errors and uncertainty.

> Uncertainty Propagation: Nonlinear Systems
> - Approximate Solution to exact problem: Multiple-model estimation method, Unscented Kalman Filter (UKF), Monte Carlo (MC) methods.
> - Exact solution to approximate problem: Extended Kalman Filter (EKF), Gaussian closure, Stochastic Linearization...

这两者的区别在哪里？为什么EKF是exact solution？

**Fokker-Planck-Kolmogorov equation (FPKE)**

> With sufficient number of Gaussian components, any pdf can be approximated as closely as desired.

<img src="{% asset_path FPKE_history.png%}" width="80%" title="Fokker-Planck-Kolmogorov equation history, from (Singla, Puneet. 2016).">
