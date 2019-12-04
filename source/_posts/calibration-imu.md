---
title: IMU Calibration Learning Notes
comments: true
mathjax: true
abbrlink: c29a807c
categories:
  - - Academics
    - Calibration
  - - Notes
    - Web Post Notes
  - - Techniques
    - Hardwares
tags:
  - IMU
  - Calibration
  - Estimation
date: 2019-10-08 10:46:52
updated: 2019-10-11 10:48:53
---

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

[Deep Kalman Filter: Simultaneous Multi-Sensor Integration and Modelling; A GNSS/IMU Case Study](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5982094/)