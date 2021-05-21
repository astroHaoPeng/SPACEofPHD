---
title: Summary of Convolutional Neural Network (CNN)
comments: true
mathjax: false
abbrlink: 3cafbf50
date: 2020-04-27 13:11:02
updated: 2020-07-27 12:01:12
categories:
  - [Academics, Machine Learning]
  - Summaries
tags:
---

I use CNN for time series prediction (1D), not for image works (2D or 3D).

# Learning Materials

- [Introduction to 1D Convolutional Neural Networks in Keras for Time Sequences](https://blog.goodaudience.com/introduction-to-1d-convolutional-neural-networks-in-keras-for-time-sequences-3a7ff801a2cf)
  - 各种细节都讲得很详细，尤其是 1D 和 2D 的对比，其实没有什么本质差别
  - 下面这个图基本总结了使用 `Keras.layers.Conv1D` 的所有要点
  - 
  - 此文有[中文翻译](https://zhuanlan.zhihu.com/p/49831396)。

<img src="{% asset_path 1_Y117iNR_CnBtBh8MWVtUDg.png %}" width="700px" title="Very helpful to understand what the input and output dimensions of Keras Conv1d layers are. <br> (Credit: Nils Ackermann, Introduction to 1D Convolutional Neural Networks in Keras for Time Sequences)">


- [How to Develop 1D Convolutional Neural Network Models for Human Activity Recognition](https://machinelearningmastery.com/cnn-models-for-human-activity-recognition-time-series-classification/)
  - time series classification
  - two 1D CNN layers, followed by a dropout layer for regularization, then a pooling layer. <mark>为什么这样？</mark>
    - It is common to define CNN layers in groups of two in order to give the model a good chance of learning features from the input data. <mark>为什么这样？</mark>
    - CNNs learn very quickly, so the dropout layer is intended to help slow down the learning process
    - The pooling layer ... consolidating them to only the most essential elements.
  - After the CNN and pooling, the learned features are flattened to one long vector
  - a standard configuration of 64 parallel feature maps and a kernel size of 3 <mark>(Where comes this "standard" configuration?)</mark>
  - a multi-headed model, where each head of the model reads the input time steps using a different sized kernel.

<!-- more -->

## to read

- [CNN中千奇百怪的卷积方式大汇总](https://zhuanlan.zhihu.com/p/29367273)
- [变形卷积核、可分离卷积？卷积神经网络中十大拍案叫绝的操作。](https://zhuanlan.zhihu.com/p/28749411)

# Extensions

## Stacked with RNN

> an effective approach might be to combine CNNs and RNNs in this way: first we use convolution and pooling layers to reduce the dimensionality of the input. This would give us a rather compressed representation of the original input with higher-level features. (from [here](https://stats.stackexchange.com/a/403655))



# 一点想法

像Fourier analysis这种，用一组完备的基函数，去表示任意一个函数，这种研究，wavelet analysis, taylor expansion，这些感觉都是一个思路，只是不同的基函数。

那么，有没有研究用 非正交的、非完备的、冗余很大的 一组基函数，去展开任意一个函数的数学分支？

感觉这个和现在的各种机器学习的骚操作很像啊……
