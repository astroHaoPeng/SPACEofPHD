---
title: IMU Calibration Learning Notes
comments: true
mathjax: true
abbrlink: c29a807c
categories:
  - - Academics
    - Calibration
  - - Notes
    - Web Post Note
  - - Techniques
    - Hardwares
tags:
  - IMU
  - Calibration
  - Estimation
date: 2019-10-08 10:46:52
updated: 2019-10-11 10:48:53
---


# 问题

- 学习 attitude estimation 算法
  - QUEST
  - TRIAD

<!-- more -->

# Learning Materials

## Posts

[从零开始的 IMU 状态模型推导](https://fzheng.me/2016/11/20/imu_model_eq/#2-3-%E5%89%8D%E7%BD%AE3-%E9%AB%98%E6%96%AF%E7%99%BD%E5%99%AA%E5%A3%B0%E4%B8%8E%E9%9A%8F%E6%9C%BA%E6%B8%B8%E8%B5%B0)
- 理论推导比较全面
- 只讲了 IMU 状态模型，没有涉及 error model，不适合做calibration

[IMU校正以及姿态融合](https://blog.csdn.net/shenshikexmu/article/details/80013444)
- 有对应的 GitHub 代码
- 应该算 batch least square estimation，因为使用了三次 MATLAB 中的 `lsqnonlin` 函数 (Solve nonlinear least-squares (nonlinear data-fitting) problems)
- 



## Papers

### Mark E Pittelkau, “Autonomous On-Board Calibration of Attitude Sensors and Gyros,” 20th International Symposium on Space Flight Dynamics, 2007, p. 10.

> Parameter tracking is achieved by modeling the calibration parameters as constants driven by white process noise. (sec 1.2, 1st paragraph)

Flight Dynamics Analysis Branch (FDAB) at the NASA GSFC use (all batch least-squares methods)
- the Davenport algorithm (IRUCAL), main IMU (gyro) calibration tool [8--10] 
  - typical telemetry and maneuver durations required:
    - 6 hrs on Terra [11, p.346]
    - 11 orbtis on EUVE [28]
    - 9 hrs on WIRE [11, p.343]
    - 12 maneuvers over 2 days on Aqua [3]
  - sequential Davenport IRU calibration algorithm [1, 3, 13]
  - recursive formulation of the Davenport algorithm [14]
- the Delta-Bias and BICal algorithms, to estimate gyro calibration parameters [11, 12]
- ALICAL and ALIQUEST, attitude sensor misalignments, separately from Davenport IRU calibration

On-board real-time calibration using EKF, two NASA spacecrafts, IMU calibration <mark>（都是*深空任务*，暂时不仔细研究这些文献）</mark>
- Spitzer Space Telescope (SIRTF) [19, 20]
  - every four days, using motions during science observations, previously use dedicated calibration maneuvers
- Cassini [21, 22]
  - at least twice per year, using dedicated calibration maneuvers

Attitude sensor and payload alignment calibration, performed separately
- Spitzer, start tracker and payload sensor alignment, 27 parameters, estimated on board in real-time, KF

Draper Inertial Stellar Compass (ISC), on-board real-time calibration
- three MEMS gyros
- Draper APS star tracker
- Atmel TSC695F processor
- 27-state Kalman filter, with a square root (factorized) covaraince [23--26] <mark>（需要研究一下这几篇文献）</mark>

> The attitude estimation error is less sensitive to calibration parameter error in regions where the angular rate is small, so larger calibration error can be tolerated in those regions. <mark>（不理解，看不懂，作者没有给出参考文献）</mark>

Practical limits in the standard deviation of error, square root of the diagonal of the covariance matrix (will not be reached for a very long time with practical values for the parameter process noise)
- several degrees per hour for the <mark>gyro bias</mark>
- 100,000 ppm for the <mark>gyros' scale factors</mark>
- 3 degrees for the <mark>gyro axis misalignments</mark>
- 3 degrees for the <mark>attitude sensor misalignments</mark>


### Mark E Pittelkau, “Survey of Calibration Algorithms for Spacecraft Attitude Sensors and Gyros”, Advances in the Astronautical Sciences, vol. 129, 2007, pp. 1--55.

Most gyro (or IMU) calibration algorithms are at attitude-dependent. Two exceptions are a magnetometer-based algorithm and transfer alignment. Filtering methods for gyro calibration often include attitude sensor alignment calibration. 

An attitude-dependent algorithm explicitly includes attitude in the algorithm. The attitude is either estimated as part of the calibration algorithm, or it is estimated separately from the misalignments and is an input to the calibration algorithm. An attitude-independent calibration algorithm does not explicitly include attitude in the algorithm.

Attitude sensor alignment calibration algorithms
- attitude-dependent
  - explicitly includes attitude in the algorithm
  - The attitude is either estimated as part of the calibration algorithm, 
  - or it is estimated separately from the misalignmentsand is an input to the calibration algorithm
- attitude-independent
  - does not explicitly include attitude in the algorithm

Algorithms:
- attitude-<mark>in</mark>dependent
  - Desjardins
  - Shuster, Chitre, and Niebur [7]
  - Shuster, Bierman, and Pitone [9--13, 18].
    - Shuster's focus was on alignment calibration of vector sensors, rather than gimbals, so the parameters are a rotational misalignments each comprising three small-angle rotations. (p. 654)
  - This relative alignment calibration algorithm was applied to alignment calibration of two Fixed-Head Star Trackers (FHSTs) on the EUVE and UARS spacecraft [14].
- attitude-dependent
  - ALICAL (p. 659)
    - because of the unobservability the estimates may not converge, even though the loss function is minimized.
    - was used to estimate relative alignment of two star trackers on the Aqua spacecraft [22].
    - both used on the UARS attitude sensors were two fixed-headstar trackers (FHST) and a fine sun sensor
    - This algorithm has been used to estimate relative tracker misalignments on MESSENGER [176] and other spacecraft.
  - ALIQUEST (p. 659)
    - A major disadvantage of ALIQUEST is that there may be relatively fewsensors available from which to construct the reference attitude, and those sensors should have no relative alignment error.
    - both used on the UARS attitude sensors were two fixed-headstar trackers (FHST) and a fine sun sensor

Comments on other researchers:
- Shuster's focus was on alignment calibration of vector sensors, rather than gimbals, so the parameters are a rotational misalignments each comprising three small-angle rotations. (p. 654)

> One common beliefis that misalignments about the boresight of a Darrow field-of-view sensor are not observable (or poorly observable) and do not have to be estimated. This is shown in [13] to be incorrect. (p. 657)

> Shuster's analysis does not mention that the payload can also move relative to the attitude sensors, and it is the payload pointing that is important. Since the payload alignment is usually performed separately by payload specialists rather than attitude system engineers, it would seem sufficient to fix the body reference frame to the reference sensor and to estimate relative misalignments. (p. 657)

> The misalignment vector common to all attitude sensors is unobservable, and is known only to
within the uncertainty imposed by orbit insertion (launch-shock and other) effects and prelaunch
alignment uncertainty. (p. 657) <mark>（这部分有没有可以改进？）</mark>


> See more here: {% post_link note-pittelkau-survey-2007 %}



### Mark E. Pittelkau, “Sensors for Attitude Determination”, Encyclopedia of Aerospace Engineering, Richard Blockley and Wei Shyy, eds., Chichester, UK: John Wiley & Sons, Ltd, 2010, p. eae297. [[Link]](http://doi.wiley.com/10.1002/9780470686652.eae297).

MEMS gyros are not used on board spacecraft due to their large noise, bias, and drift, and because they have not yet been space-qualified. :thinking_face: (3rd section, 1st paragraph)

讲了很多 Gyroscope 误差的细节。
- Bias, scale factor error, and random error can be modeled similarly for all types of gyros.
- Misalignment of the gyro axes results in inaccurate computation of angular rate and attitude from the gyro measurements. 

**Allen variance**: 
Allan variance is a method of analyzing a
sequence of data in the time domain, to
measure frequency stability in oscillators. This
method can also be used to determine the
intrinsic noise in a system as a function of the
averaging time. The method is simple to
compute and understand, it is one of the most
popular methods today for identifying and
quantifying the different noise terms that exist in
inertial sensor data. The results from this
method are related to five basic noise terms
appropriate for inertial sensor data. These are
quantization noise, angle random walk, bias
instability, rate random walk, and rate ramp. (see [here](http://cache.freescale.com/files/sensors/doc/app_note/AN5087.pdf))

### Ye. Somov, S. Butyrin, H. Siguerdidjane, Ch. Hajiyev, and V. Fedosov, “In-flight Calibration of Attitude Determination Systems for Information Mini-satellites*”, IFAC Proceedings Volumes, vol. 46, Jan. 2013, pp. 393–398. [[Link]](http://www.sciencedirect.com/science/article/pii/S1474667015363552).

strap-down inertial navigation system (SINS) （以下内容在原文中的断句有些模糊）
- three-axial electrostatic micro-accelerometer (MAC)
- an inertial measurement unit (IMU)
  - based on gyro sensors
- an astronomical system (AS)
  - based on star trackers (STs)
- multi-head Sun sensor (SS) and three-axial magnetic sensor (MS) <mark>（这是什么？一个组合在一起的系统？）</mark>

### [Deep Kalman Filter: Simultaneous Multi-Sensor Integration and Modelling; A GNSS/IMU Case Study](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5982094/)


# Attitude Estimation

## TRIAD
1. Chris Hall, “Chapter Four Attitude Determination”, Mar. 2003. [[Link]](http://www.dept.aoe.vt.edu/~cdhall/courses/aoe4140/attde.pdf).
1. Sergei Tanygin, and Malcolm D Shuster, “The Many Triad Algorithms”, AAS 07-104, 2007, pp. 1--19. [[Link]](http://www.malcolmdshuster.com/Pub_2007c_C_TRIADs_SIT.pdf).


## QUEST
1. Chris Hall, “Chapter Four Attitude Determination”, Mar. 2003. [[Link]](http://www.dept.aoe.vt.edu/~cdhall/courses/aoe4140/attde.pdf).


--------

# Sensors

- attitude sensors, 给出姿态信息
  - star tracker
  - magnetometer
  - rate integrating gyroscope
- angular rate sensor, 给出角速度信息
  - rate gyroscope
  - 
- accelerometer

## MEMS Gyros

An orthogonal frame
- drive direction
- sense direction
- rotation axis


# 借鉴仿真数据

1. Hyosang Yoon, Kathleen M. Riesing, and Kerri Cahoy, “Kalman Filtering for Attitude and Parameter Estimation of Nanosatellites Without Gyroscopes”, Journal of Guidance, Control, and Dynamics, vol. 40, 2017, pp. 2272–2288. [[Link]](https://doi.org/10.2514/1.G002649).

