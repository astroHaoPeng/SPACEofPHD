both shallow and deep NN

- classification
- *regression*
- clustering
- dimensionality reducetion
- *time-series forecasting*: long short-term memory (LSTM) deep learning networks
- *dynamic system modeling and control*

For small training sets, you can quickly apply deep learning by performing transfer learning with pretrained deep network models (GoogLeNet, AlexNet, VGG-16, and VGG-19) and models from the Caffe Model Zoo. (什么东西？)

支持 CPU 和 GPU 并行
支持 Amazon EC2 P2 GPU instances （是什么？）

-----------
[here](https://cn.mathworks.com/products/neural-network/features.html#classification%252C-regression%252C-and-clustering-of-shallow-networks)

# Supervised Networks

包含四种Supervised networks
- feedforward（重点）
  - one-way connections from input to output layers
  - prediction, pattern recognition, and nonlinear function fitting
- radial basis（可看）
  - alternative, fast method for designing nonlinear feedforward networks
  - generalized regression and probabilistic neural networks
- dynamic (Liyang)
  - use memory and recurrent feedback connections to recognize spatial and temporal patterns in data
  - time-series prediction, *nonlinear dynamic system modeling*, and *control* systems applications
- learning vector quantization（暂时不用）
  - classifying patterns that are not linearly separable




-------------
# 一些定义

## [卷积神经网路](https://zh.wikipedia.org/wiki/%E5%8D%B7%E7%A7%AF%E7%A5%9E%E7%BB%8F%E7%BD%91%E7%BB%9C)

卷积神经网路（Convolutional Neural Network, CNN）是一种*前馈神经网络*，它的人工神经元可以响应一部分覆盖范围内的周围单元，对于*大型图像处理*有出色表现。

卷积神经网路由一个或多个卷积层和顶端的全连通层（对应经典的神经网路）组成，同时也包括关联权重和池化层（pooling layer）。
这一结构使得卷积神经网路能够利用输入数据的二维结构。
与其他深度学习结构相比，卷积神经网路在*图像和语音识别方面*能够给出更好的结果。

