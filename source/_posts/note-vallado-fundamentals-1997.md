---
title: Reading Notes of "Fundamentals of Astrodynamics and Applications" by Dr. Vallado
catagories: 读书笔记
tags:
  - 读书笔记
  - 轨道动力学
  - orbital dynamics
  - astrodynamics
categories:
  - [Notes, Book Notes]
mathjax: true
abbrlink: 20909fdd
updated: 2018-06-20 12:17:48
date: 2018-06-12 10:03:30
---

> Vallado, D. A., Fundamentals of Astrodynamics and Applications, New York, NY: The McGraw-Hill Companies, Inc., 1997.

<!-- more -->

### 1.4.3 Satellite-based Systems

<img src="{% asset_path Table-1-2-summary-coordinate-systems.png%}" width="400px">

#### Perifocal Coordinate System, PQW

#### Satellite Coordinate System, RSW
R - radial\
S - along-track\
W - cross-track

We sometimes use a roll-pitch-yaw coordinate system (RPY) in attitude dynamics and
instrument pointing to provide an "airplane-like" reference system for satellites.\
Equivalent **axis directions** are: R-pitch, S-roll, and W-yaw.\
In fact: roll == S, pitch == -R, yaw == -W

#### Satellite Coordinate System, NTW
N - in orbital plane, normal to the velocity vector, not radial\
T - tangential to the orbit, velocity direction\
W - normal to the orbital plan, cross-track

#### Equinoctial Coordinate System, EQW



## 6.4 Angle-only observations

> Topocentric values for satellites in low-Earth orbits can differ greatly from geocentric $\alpha$ and $\delta$ because they're nearby.

Right ascension $\alpha$ and declination $\delta$ 总是在 topocentric 系下观测得到，没有办法直接得到 geocentric 下的结果。
- 通常是拍照卫星，然后与背景的恒星比较，来确定角度。
- 恒星距离很远，topocentric 和 geocentric 差别很小，但对于卫星区别很大

> It's important to know all three methods because each solves one aspect of the problem. The Laplacian method fits only the middle point but is usually close to the other data points.
> - The Laplace method fits only the middle point but is usually close to the other data points. <mark>Works poorly for near-Earth satellites.</mark>
> - The Gaussian method fits data to all three points and is valid for all the data. <mark>Better suited for near-Earth satellites,</mark> but the formulation limits the
spread of data (usually less than 60${}^\circ$ apart).
> - The double $r$-iteration is effective for large spreads in the data, as in the case of <mark>multiple observing locations</mark>.

估计的基本方法有以下几种 (p387)：
- Laplacian: 只拟合中间观测点，对近地卫星效果差
- Gaussian: 拟合所有观测点，对观测点分布有要求，通常小于60度
- double r-iteration: 观测点大范围分布（比如多观测站），对各种轨道都可用

### 6.4.1 Laplace's Method
### 6.4.2 Gaussian Determination
### 6.4.3 Double r-iteration



## 10.6 Predicting Satellite Look Angles

Visibility checks

<img src="{% asset_path Figure-10-180-Determing-visibility.png%}" width="400px">



TLE
===

p140: 
$B^* = \frac{1}{2} \frac{C_D A}{m} \rho_0$.\
Ballistic Coefficient $BC = \frac{R_{\rm Earth}\rho_0}{2B^*}$. 


定轨 Orbit Determination
=======================

Sensor site 的一些基本信息：
- p415: In fact, a typical sensor site's observation of a pass by a satellite usually results in hundreds of observations which are very close together.

观测/测量精度/Accuracy/Uncertainty
- p731: In general, along-track errors are greatest because we can't get precise timing information. Cross-track errors are usually better, typically resulting from a sensor's misalignment. Radial errors are usually the smallest.
- 根据 Figure 8-14 可以判断 range 和 angular 观测的精度 trade-off

![](vallado-fundamentals-1997/Figure-8-14.png "range and angular measurement accuracy trade-off, roughly")
<!-- 需要调整图片大小 -->


其它
---

(p732) Remember, least-squares techniques will estimate the average values, whereas filters can better track the time-varying values.