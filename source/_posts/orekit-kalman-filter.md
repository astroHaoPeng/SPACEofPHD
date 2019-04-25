---
title: Orekit 中 SequentialEstimator 的 Kalman Filter
tags:
  - Software
  - Orekit
  - Astrodynamics
  - Estimation
categories: Software
comments: true
mathjax: true
abbrlink: 4de12de9
date: 2019-04-23 15:03:16
updated: 2019-04-25 10:52:29
---





# EKF

积分`state`时使用$\dot\bm{x} = f(\bm{x})$，没有process noise。\
积分state transition matrix时使用$\partial f/\partial \bm{x}$，同样没有process noise。\
最后计算`covariance`时需要添加process noise $Q$，可以假设依赖于时间$t$。


# covert from RSW to Inertial

RSW === LVLH in Orekit.

`lofCartesianProcessNoiseMatrix` (变量名错误) $Q^{RSW}$
- GP-prediction covariance, a diagonal 6 x 6 matrix.

`jacLofToInertial` $J_{R2I} = J_{RSW\rightarrow Inertial} = \frac{\partial X^{Inertial}}{\partial X^{RSW}}$
- **Question?** Is there a loss of information at this step?

`jacParametersWrtCartesian` $J_{P2C} = J_{Par.\rightarrow Cart.} = \frac{\partial Par.}{\partial Cart.} = \frac{\partial Par.}{\partial X^{Inertial}}$
- If the *parameters* used to represent the orbit is *inertial Cartesian*, then this should be $I_6$.
- Otherwise, it's not.

Finial conversion:
$$
Q^{Inertial} = Q^{Par.} 
= \frac{\partial Par.}{\partial X^{Inertial}} \frac{\partial X^{Inertial}}{\partial X^{RSW}}
Q^{RSW} 
\left(\frac{\partial X^{Inertial}}{\partial X^{RSW}}\right)^T \left(\frac{\partial Par.}{\partial X^{Inertial}}\right)^T \\
= J_{P2C} \cdot J_{R2I} \cdot Q^{RSW} J_{R2I}^T \cdot J_{P2C}^T
$$

## inverse: from Inertial to RSW
Simple:
$$
J_{R2I}^{-1} \cdot J_{P2C}^{-1} \cdot Q^{Inertial} \cdot J_{P2C}^{-T} \cdot J_{R2I}^{-T} = Q^{RSW}
$$
