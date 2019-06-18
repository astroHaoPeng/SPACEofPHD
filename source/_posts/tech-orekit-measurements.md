---
title: Measurements in Orekit
tags:
  - Software
  - Orekit
  - Astrodynamics
categories:
  - - Techniques
    - Software
comments: true
mathjax: true
abbrlink: 50f9c78e
date: 2019-06-04 17:25:34
updated: 2019-06-04 17:25:34
---



`AngularRaDec(final GroundStation station, final Frame referenceFrame, ...`
给出的是 topocentric Ra/Dec。

从`theoreticalEvaluation()`的代码中可以看出，
Station-satellite vector expressed in inertial frame 是一个 vector (not a state)，转换到 Field transform from inertial to reference frame at station's reception date 后，对得到的 state 求解 Ra/Dec。\
实质上，等价于，把 reference frame 平移到 station's location，然后在这个新的frame中求解 Ra/Dec，即 topocentric Ra/Dec。

另一方面，参考 Vallado1997 书中 6.4 Angle-only observations 的说明，angle-only observation 没有办法直接得到 range information，所以得到的只能是 topocentric Ra/Dec。


