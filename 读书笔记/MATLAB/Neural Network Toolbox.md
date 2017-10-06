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



----------------
[here](https://cn.mathworks.com/help/nnet/gs/fit-data-with-a-neural-network.html)

If the performance on the training set is good, but the test set performance is significantly worse, which could indicate **overfitting**, then reducing the number of neurons can improve your results. 

## [Divide Data for Optimal Neural Network Training](https://cn.mathworks.com/help/nnet/ug/divide-data-for-optimal-neural-network-training.html)
See "Dividing the Data" for more discussion of the data division process.

``net.divideFcn``存储函数，``net.divideParam``存储不同的`divideFcn`的变量
- `dividerand`
	- `net.divideParam.trainRatio`, `net.divideParam.valRatio`, `net.divideParam.testRatio`
- `divideblock`
	- similar parameter with `dividerand`
	- using three contiguous blocks of the original data set 
- `divideint`
	- similar parameter with `dividerand`
	- divided by an interleaved method
- `divideind`
	- `net.divideParam.trainInd`, `net.divideParam.valInd`, `net.divideParam.testInd`

？？是否可以人为指定

### [Improve Neural Network Generalization and Avoid Overfitting](https://cn.mathworks.com/help/nnet/ug/improve-neural-network-generalization-and-avoid-overfitting.html)
??

--------------------

``fitnet``

# 选择训练函数

[Choose a Multilayer Neural Network Training Function](https://cn.mathworks.com/help/nnet/ref/fitnet.html)
- **`trainlm`**: Levenberg-Marquardt 
	-  In general, on function approximation problems, for networks that contain up to a few hundred weights, the Levenberg-Marquardt algorithm will have the fastest convergence.
	- In many cases, trainlm is able to obtain lower mean square errors than any of the other algorithms tested.
	- In addition, trainlm performance is relatively poor on pattern recognition problems. 
- `trainbr`: Bayesian regularization training algorithm
- **`trainbfg`**: BFGS Quasi-Newton
	- The performance of trainbfg is similar to that of trainlm. 
- ~`trainrp`~: Resilient Backpropagation 
	- The trainrp function is the fastest algorithm on **pattern recognition** problems. However, it does not perform well on function approximation problems.
	- When training large networks, and when training pattern recognition networks, trainscg and trainrp are good choices. Their memory requirements are relatively small, and yet they are much faster than standard gradient descent algorithms. [Ref](https://cn.mathworks.com/help/nnet/ug/train-and-apply-multilayer-neural-networks.html)
- **`trainscg`**: Scaled *Conjugate Gradient*
	- The SCG algorithm is almost as fast as the LM algorithm on function approximation problems (faster for large networks) and is almost as fast as trainrp on pattern recognition problems. 
	- When training large networks, and when training pattern recognition networks, trainscg and trainrp are good choices. Their memory requirements are relatively small, and yet they are much faster than standard gradient descent algorithms. [Ref](https://cn.mathworks.com/help/nnet/ug/train-and-apply-multilayer-neural-networks.html)
- `traincgb`: *Conjugate Gradient* with Powell/Beale Restarts
- `traincgf`: Fletcher-Powell *Conjugate Gradient*
- `traincgp`: Polak-Ribiére *Conjugate Gradient*
- `trainoss`: One Step Secant
- `traingdx`: Variable Learning Rate Gradient Descent
	- usually much slower than the other methods
- `traingdm`: Gradient Descent with Momentum
- `traingd`: Gradient Descent





-------------
# 一些定义

## [卷积神经网路](https://zh.wikipedia.org/wiki/%E5%8D%B7%E7%A7%AF%E7%A5%9E%E7%BB%8F%E7%BD%91%E7%BB%9C)

卷积神经网路（Convolutional Neural Network, CNN）是一种*前馈神经网络*，它的人工神经元可以响应一部分覆盖范围内的周围单元，对于*大型图像处理*有出色表现。

卷积神经网路由一个或多个卷积层和顶端的全连通层（对应经典的神经网路）组成，同时也包括关联权重和池化层（pooling layer）。
这一结构使得卷积神经网路能够利用输入数据的二维结构。
与其他深度学习结构相比，卷积神经网路在*图像和语音识别方面*能够给出更好的结果。

