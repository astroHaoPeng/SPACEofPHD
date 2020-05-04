---
title: Summary of Autoencoder and Variations
comments: true
mathjax: true
abbrlink: ac2f4940
date: 2020-01-07 14:30:53
updated: 2020-04-19 23:59:14
categories:
  - Summaries
tags:
  - Autoencoder
  - Machine Learning
---


# Learning Materials

## Autoencoder

- [一文看懂AutoEncoder模型演进图谱](https://flashgene.com/archives/42935.html)
  - “深度推荐系统”
  - AutoEncoder; Denoising AutoEncoder; Sparse AutoEncoder; CNN/LSTM AutoEncoder; 
  - <mark>生成模型引入AutoEncoder</mark> --> Variational AutoEncoder (VAE是一个里程碑式的研究成果，倒不是因为他是一个效果多幺好的生成模型，主要是提供了一个结合概率图的思路来增强模型的鲁棒性。后续有很多基于VAE的扩展，包括infoVAE、betaVAE和factorVAE等。)
  - <mark>将GAN的思路引入AutoEncoder</mark> --> Adversarial AutoEncoder
- [自动编码器：各种各样的自动编码器](https://keras-cn.readthedocs.io/en/latest/legacy/blog/autoencoder/)
  - https://blog.keras.io/building-autoencoders-in-keras.html
  - 通常情况下，使用自编码器做数据压缩，性能并不怎么样。
  - 自编码器在实际应用中用的很少，2012年人们发现在卷积神经网络中使用自编码器做逐层预训练可以训练深度网络
  - 到了2015年底，通过使用残差学习（ResNet）我们基本上可以训练任意深度的神经网络。<mark>（查这个用ResNet的训练方法）</mark>
  - 自编码器并<mark>不是一个真正的无监督学习的算法，而是一个自监督的算法</mark>。
  - > 如果你的输入是序列而不是2D的图像，那么你可能想要使用针对序列的模型构造自编码器，如LSTM。要构造基于LSTM的自编码器，首先我们需要一个LSTM的编码器来将输入序列变为一个向量，然后将这个向量重复N此，然后用LSTM的解码器将这个N步的时间序列变为目标序列。
  - > 自监督学习是监督学习的一个实例，其标签产生自输入数据。要获得一个自监督的模型，你需要<mark>想出一个靠谱的目标跟一个损失函数</mark>，问题来了，<mark>仅仅把目标设定为重构输入可能不是正确的选项</mark>。<mark>（为什么？）</mark>
  - 基本上，要求模型在像素级上精确重构输入不是机器学习的兴趣所在，学习到高级的抽象特征才是。
  - 事实上，当你的主要任务是分类、定位之类的任务时，那些对这类任务而言的最好的特征基本上都是重构输入时的最差的那种特征。
- [MATLAB: Train Stacked Autoencoders for Image Classification](https://www.mathworks.com/help/deeplearning/examples/train-stacked-autoencoders-for-image-classification.html)
  - This example showed how to <mark>train a stacked neural network</mark> to classify digits in images <mark>using autoencoders</mark>.

- [利用Autoencoder进行无监督异常检测](http://sofasofa.io/tutorials/anomaly_detection/)
  - 直接使用还原误差 (reconstruction error) 的 mean absolute error (MAE) 作为判断异常的标准，不用再接一个分类网络
  - 参考是了[这里](https://medium.com/@curiousily/credit-card-fraud-detection-using-autoencoders-in-keras-tensorflow-for-hackers-part-vii-20e0c85301bd)

<!-- more -->

- [Building Autoencoders in Keras](https://blog.keras.io/building-autoencoders-in-keras.html)
  - 官方出品，值得参考
  - Autoencoders are data-specific
  - Usually not good at data compression
  - They are rarely used in practical applications. 
  - In 2012 they briefly found an application in greedy layer-wise pretraining for deep convolutional neural networks [1], but this quickly fell out of fashion as we started realizing that better random weight initialization schemes were sufficient for training deep networks from scratch.
  - Autoencoders are not a true unsupervised learning technique, they are a self-supervised technique
  - Today two interesting practical applications of autoencoders are 
    - <mark>data denoising</mark> (which we feature later in this post), and 
    - <mark>dimensionality reduction</mark> for data visualization.
  - 有 Variational AE 的实现例子


- [A Gentle Introduction to LSTM Autoencoders](https://machinelearningmastery.com/lstm-autoencoders/)
  - 讲了 Prediction LSTM Autoencoder，<mark>需要研究一下，借鉴过来</mark>



## VAE
- [变分自编码器VAE：原来是这么一回事 | 附开源代码](https://zhuanlan.zhihu.com/p/34998569)
  - 它本质上就是在我们常规的自编码器的基础上，对 encoder 的结果（在VAE中对应着计算均值的网络）加上了“高斯噪声”，使得结果 decoder 能够对噪声有鲁棒性；而那个额外的 KL loss（目的是让均值为 0，方差为 1），事实上就是相当于对 encoder 的一个正则项，希望 encoder 出来的东西均有零均值。
  - 说白了，重构的过程是希望没噪声的，而 KL loss 则希望有高斯噪声的，两者是对立的。所以，VAE 跟 GAN 一样，内部其实是包含了一个对抗的过程，只不过它们两者是混合起来，共同进化的。
  - 一句话，VAE 的名字中“变分”，是因为它的推导过程用到了 KL 散度及其性质。


- [Implementing Variational Autoencoders in Keras: Beyond the Quickstart Tutorial](http://louistiao.me/posts/implementing-variational-autoencoders-in-keras-beyond-the-quickstart-tutorial/)
  - when combined, Keras' building blocks are powerful enough to encapsulate most variants of the variational autoencoder and more generally, recognition-generative model combinations for which the generative model belongs to a large family of deep latent Gaussian models (DLGMs) <mark>（查这个DLGM是什么？）</mark>
    - study variational autoencoders as a special case of variational inference in deep latent Gaussian models using inference networks
    - use Keras to implement them in a modular fashion such that they can be easily adapted to approximate inference in tasks beyond unsupervised learning, and with complicated (non-Gaussian) likelihoods.
  - The goal of this post is to propose a clean and elegant alternative implementation that takes better advantage of Keras' modular design.
    - This first post will lay the groundwork for a series of future posts that explore ways to extend this basic modular framework to implement the cutting-edge methods proposed in the latest research......
  - analytically intractable and cannot be evaluated in closed-form
    - To circumvent this intractability we turn to variational inference, which formulates inference as an optimization problem.
  - evidence lower bound (ELBO)
    - a lower bound to the log marginal likelihood
  - simultaneously maximizing it with respect to θ and ϕ gets us two birds with one stone.
    - minimize KL divergence
    - *approximately* maximizes the log marginal likelihood
  - the form of the approximate posterior $q_\phi(\bm{z}|\bm{x})$, which can be viewed as a probabilistic encoder.
  - Classically, inference networks are known as recognition models, and have now been used for decades in a wide variety of probabilistic methods. 
    - When composed end-to-end, the recognition-generative model combination can be seen as having an autoencoder structure. 
    - Indeed, this structure contains the variational autoencoder as a special case, and also the now less fashionable Helmholtz machine [4]. 
    - Even more generally, this recognition-generative model combination constitutes a widely-applicable approach currently known as amortized variational inference, which can be used to perform approximate inference in models that lie beyond even the large class of deep latent Gaussian models.
  - 【问题】最后得到的结果，和直接定义 `loss` 实现的 Autoencoder 似乎没有区别。
- [Tutorial - What is a variational autoencoder?](https://jaan.io/what-is-variational-autoencoder-vae-tutorial/)
  - 与上一篇类似，从 probability modeling 的角度解读了 autoencoder
  - 我对其中的概论和推导还不是很熟悉，勉强可以看懂
  - 对应的[代码在这里](https://github.com/altosaar/variational-autoencoder/blob/master/train_variational_autoencoder_tensorflow.py#L25)
  - 


<!-- more -->

# todo

- [ ] CNN/LSTM AutoEncoder 有可能相关，与异常识别
- [ ] 变分自编码器（Variational autoencoder，VAE）：编码数据的分布（较复杂）<mark>（这个可能也可以用于异常识别）</mark>
- [ ] 

