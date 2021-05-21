---
title: Extended Kalman Filter for Attitude Estimation
comments: true
mathjax: true
abbrlink: 50ba6ade
date: 2020-05-21 19:22:27
updated: 2020-05-21 22:23:35
categories:
  - Drafts
  - [Academics, Aerospace]
tags:
  - draft
---

Learned something about the attitude estimation EKF used in several books and papers.
Try to note something here to clarify their relationships.

The only thing I'm sure about is:\
The `quaternion attitude` + `gyro bias` estimator is widely used in practice.

<!-- more -->

{% note info no symbol %}
> [0] E.J. Lefferts, F.L. Markley, and M.D. Shuster, “Kalman Filtering for Spacecraft Attitude Estimation”, Journal of Guidance, Control, and Dynamics, vol. 5, Sep. 1982, pp. 417–429.

这里讲的三种形式，第一种和第三种应该是等价的。\
与 [3] 中 6.2.4 应该是等价的<mark>（还没有完全搞明白）</mark>
{% endnote %}



{% note info no symbol %}
> [1] Hanspeter Schaub, and John L. Junkins, Analytical Mechanics of Space Systems (Second Edition), Reston, VA: American Institute of Aeronautics and Astronautics, 2009.

详细讨论了 quaternion based kinematics，但是没有讲 attitude estimation 相关的东西。\
阅读笔记在另一篇单独的 post 里。
{% endnote %}



{% note info no symbol %}
> [2] John L. Crassidis, and John L. Junkins, Optimal Estimation of Dynamic Systems, CRC Press, 2011.

`7.1.2 Discrete-Time Attitude Estimation` 给出了全部推导（有一点是只给了推导方法），得到的 EKF 与 [0] 中的第 3 种应该是等价的；用了 multiplicative quaternion error 的推导方法。\
和下面 [3] 中的推导基本相同，符号不同。
{% endnote %}



{% note info no symbol %}
> [3] F. Landis Markley, and John L. Crassidis, Fundamentals of Spacecraft Attitude Determination and Control, New York, NY: Springer New York, 2014.

`6.2.4 Mission Mode Kalman Filter` 中的 filter 与 [4] 中 `7.10 Recursive Attitude Plus Gyro Bias Estimation` 的 filter 基本相同，除了差一个正负号

<img src="{% asset_path 2014_markley_crassidis_eq-6-93_Qk.png%}" width="400px" title="书里（p.260）有这个公式的详细推导">

在前面几个小节还讲了 calibrate 所有 gyro error parameters 的 EKF。

缺失的推导，基本可以在 [2] 中找到。
{% endnote %}



{% note info no symbol %}
> [4] Harold L. Hallock, Gary Welter, David G. Simpson, and Christopher Rouff, ACS without an attitude, London: Springer, 2017.

Folks in the NASA/GSFC flight software branch pretty much use “Kalman filter” to mean a recursive filter for attitude-plus-gyro bias estimation - well, at least until recently.

<img src="{% asset_path 2017_hallock_ACS_eq-7-29_Qk.png%}" width="400px" title="书里（p.150）有这个公式，把推导指向了 [0]，但是实际 [0] 中没有给出推导，在 [2] 和 [3] 中有推导。">

有一个疑问（哪一页？）：为什么地面定轨之后，可以直接上传误差 quaternion，然后星上可以自动更正用过去的误差，来修正当前的姿态？
是因为 EKF 使用了误差 quaternion 推导？还是因为什么 bilinear 之类的性质？
<mark>（！！完全没有搞明白）</mark>
{% endnote %}



{% note info no symbol %}
> [5] Yaguang Yang, Spacecraft Modeling, Attitude Determination, and Control Quaternion-based Approach, Boca Raton, FL : CRC Press, 2019. | “A science publishers book.”: CRC Press, 2019.

用的是同时包含 dynamics and kinematics 的 EKF，与其它几个不同。
{% endnote %}


{% note warning %}
> [11] Valdemir Carrara, Hélio Koiti Kuga, Philipe M Bringhenti, and Manoel J M de, “Attitude Determination, Control and Operating Modes for CONASAT Cubesats”, 24th International Symposium on Space Flight Dynamics (ISSFD), Laurel, MD: 2014, p. 19.

我现在实现的是这篇文献中的算法，与 [0] 等价，[0] 与 [2], [3] 等价，所以应该暂时没有大的错误。\
对 transition matrix 和 process noise 的近似，我没有完全按照 [2] 中的公式进行近似，可以修改一下。
{% endnote %}
