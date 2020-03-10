---
title: Reading Notes | Survey of Calibration Algorithms for Spacecraft Attitude Sensors and Gyros
comments: true
mathjax: true
abbrlink: pittelkau-survey-2007
date: 2019-12-11 15:06:25
updated:
categories:
tags:
---

> Mark E Pittelkau, “Survey of Calibration Algorithms for Spacecraft Attitude Sensors and Gyros”, Advances in the Astronautical Sciences, vol. 129, 2007, pp. 1--55.


# 1. Introduction

The purpose of this paper is to present an overview of the various calibration algorithms, to examine their merits, and to show where and how they have been applied.

This survey extends back to 1969, although there were some relatively minor developments before that time.

This survey focuses mainly on methods rather than applications.

A critical review of the literature is provided, including strengths and weaknesses of algorithms and an assessment of results and conclusions in the literature.

<!-- more -->

An emphasis on <mark>gyro calibration</mark>. 
It is a <mark>more difficult</mark> subject than alignment calibration, there is more literature on gyro calibration than alignment calibration, and because *gyro calibration often includes attitude sensor alignment calibration*.
<mark>（经常包含了misalignment calibration）</mark>

Many similar developments in sensor calibration for <mark>navigation systems</mark>, which preceded <mark>spacecraft attitude and navigation systems</mark> by at least a decade.\
Navigation sensors:
- Gyros, accelerometers, altimeters, velocity sensors, depth and sonar sensors, GPS receivers

A comparison and contrast of navigation sensor calibration with spacecraft sensor calibration would be a useful extension of this survey. 

For each algorithm, discuss:
- optimality, 
- computational and storage requirements,  
- utility: the range of application: hardware compatibility; real-time v.s. non real-time v.s. ground-based processing

- Attitude sensor alignment and transfer function calibration
- Gyro calibration

## 1.1 

Most gyro (or IMU) calibration algorithms are attitude-dependent, two exceptions are a magnetometer-based algorithm and transfer alignment.

## 2.1 Batch Least-Squares Methods for Alignment Calibration

DesJardins' method (focusing on gimbals):

$$
\bm{w}_i\cdot\bm{w}_j = (A\bm{v}_i) \cdot (A\bm{v}_j) = \bm{v}_i\bm{v}_j
\tag{3}
$$

Effective attitude-independent measurement
$$
z = \bm{w}_i \cdot \bm{w}_j - \bm{v}_i \cdot \bm{v}_j
\tag{4}
$$

There is not fixed reference in the body axes in which all the trackers can be aligned.

Shuster's focus was on <mark>alignment calibration of vector sensors</mark>, rather than gimbals, so the parameters are a rotational misalignments each comprising three small-angle rotations.

In [7], Shuster extended desJardins' work by introducing <mark>pre-launch alignment information</mark> into the alignment calibration algorithm so that <mark>absolute misalignments</mark> can be estimated, and also developed a <mark>maximum likelihood estimator</mark> to estimate sensor measurement variances.

$$
L = \frac{1}{2} \sum_{i,j;i\neq j} b_{ij} \left| \bm{w}_i \cdot M_i^T M_j \bm{w}_j - \bm{v}_i \cdot \bm{v}_j \right| ^2
\tag{6}
$$
where $b_{ij}$ are error weightings. <mark>（怎么确定？）</mark>

Using a linear model to facilitate computation, $M_i\approx I-[\theta_i\times]$ ($\theta_i$ is a small rotation vector), then the loss function is
$$
L_\text{post} = \frac{1}{2} \sum_{i,j;i\neq j} b_{ij} \left| \bm{w}_i \cdot \bm{w}_j - \bm{v}_i \cdot \bm{v}_j - (\bm{w}_i\times\bm{w}_j) \cdot (\bm{\theta}_i-\bm{\theta}_j) \right| ^2
\tag{7}
$$

A misalignment common to all attitude sensors is not observable in (3) and (7), because any attitude transformation $T\bm{w}$ of $\bm{w}$ does not affect (3).
So, one has to:
- choose one sensor as a body reference without misalignment
- introduce prior information to minimize the deviation of the sensor misalignments from their pre-launch values <mark>（不理解）</mark>

Prior information is 
$$
L_\text{prior} = \frac{1}{2} \sum_{i,j;i\neq j} \theta_i^T[P(-)]^{-1}\theta_j
$$
$P(-)$ is the covariance of the prior misalignments, assumed to be block diagonal (no better information).

The total loss function is then
$$
L = L_\text{prior} + L_\text{post}
$$



> Shuster's analysis does not mention that the payload can also move relative to the attitude sensors, and it is the payload pointing that is important. 
> Since the *payload alignment is usually performed separately by payload specialists* rather than attitude system engineers, it would seem <mark>sufficient</mark> to fix the body reference frame to the reference sensor and <mark>to estimate relative misalignments</mark>. 
> Nevertheless, it is important to ensure that the relative alignment between the payload and the body reference sensor is stable.


## 2.2 Reference Frames For Sensor Alignment

通过把 reference vector 定义为 combination of measurements，分散 misalignment error。

## 2.3 Augmented QUEST Algorithms for Alignment Calibration (Attitude-dependent)

The ALICAL and ALIQUEST algorithms [21, 27, 28] are very similar to the algorithm above. 

Estimate sensor alignments by minimizing a Wahba loss function
$$
L = \sum_{i,j} w_i | N_i M_i \hat{Q}_{i,j}^\text{sensor} - A_j \hat{R}_{i,j}^\text{GCI}
$$
- at time $j$
- $A_j$, body attitude DCM
- $R_{i,j}^\text{GCI}$, reference vector for sensor $i$
- $\hat{Q}_{i,j}^\text{sensor}$, observation vector from sensor $i$
- $N_i$, nominal sensor-to-body mounting (alignment) transformation for sensor $i$
- $M_i$, <mark>alignment correction</mark> for sensor $i$
- $w_i$, error weighting

Attitude is explicit in the algorithms.

ALICAL
- assume $M_i$ is fixed, using QUEST to solve for $A_j$
- given $A_j$, using QUEST to solve for $M_i$
- repeat until convergence
- ? (final step) adjust the alignments to resolve the unobservable degrees of freedom <mark>（不明白怎么操作，这里没有讲，需要看具体文献）</mark>

> Because of the <mark>unobservability （[12]里讲了这个，待看）</mark> the estimates may not converge, even though the loss function is minimized. 

ALQUEST\
- $A_j$ is obtained from one or more reference sensors that are not parameterized with misalignments.
- sensors that produce a quaternion "measurement"
  - a pair of pseudo-measurement vectors are constructed from this quaternion
- DISADVANTAGE: [21]
  - may be few sensors available
  - these sensors should have no relative alignment error <mark>（为什么是relative？）</mark>

A much simpler method for quaternion measurements is to average the relative error between the two star trackers. Have been used on MESSENGER [176]. <mark>（不懂）</mark>

这里提到的这两种算法的应用，都要求有 star sensor。


## 2.4 Kalman Filter Methods for Alignment Calibration

The attitude sensor misalignments may not be measured simultaneously, or the measurements may not be concurrently available due to occultation of one or more attitude sensors.





# 4 Gyro Calibration

## 4.1 Early Gyro Calibration Algorithms



Gyro calibration
- considering two gyros at a time
- <mark>gyro bias</mark> is determined by controlling the attitude of the spacecraft with the gyros and by using the star trackers to observe the drift of the stars in the two fields of view.
- <mark>Scale factor estimation</mark> is accomplished by rotating the spacecraft 360 or 720 degrees, starting from a given pair of stars in the two trackers, so that the same stars are observed after the rotation.
  - repeated using negative rotations
  - several maneuvers at various positive and negative angular rates about the sense axiss of each gyro 


## 4.2 Davenport gyro calibration algorithm

A batch least-squares method.

<mark>没有看懂</mark>

## 4.3 Sequential and Recursive Davenport IRU Calibration Algorithms

Sequential Davenport IRU calibration

Modified Davenport algorithm that is recursive in the gyro data

## 4.4 Delta-Bias IRU Calibration Algorithm

<mark>没有看懂</mark>

The Delta-Bias IRU calibration algorithm was used on UARS, RXTE, and Terra to compare and check results from the Davenport algorithm. It proved useful on UARSand RXTE because periods of unusable and unavailable data did not detract from the performance of the algorithm [81].




## 4.5 Augmented QUEST Algorithms for Gyro Calibration

### 4.5.1 BICal IRU Calibration Algorithm (ground processing)

The BICal algorithm has several advantages over the Davenport algorithm: BICal uses attitude
data in addition to gyro data during maneuvers, it is not restricted to constant-rate maneuvers, and a separate bias can be estimated for each maneuver segment so that the segments can be separated by long periods of time.


### 4.5.



## 6.3 RIMU Error Modeling






--------------

# 我的整理

IMU calibration parameters
- bias
- scale factor
- misalignment

# 任务汇总

- <mark>MEMS gyros</mark> in a spinning sounding rocket [131], EKF in [128, 129]
- TIMED spacecraft [132], EKF in [127, 129]
- 

