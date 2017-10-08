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



--------------------

[Choose Neural Network Input-Output Processing Functions](https://www.mathworks.com/help/nnet/ug/choose-neural-network-input-output-processing-functions.html)

It is standard practice to normalize the inputs before applying them to the network.

Generally, the normalization step is applied to both the input vectors and the target vectors in the data set.



----------------------

[Neural Network Training Concepts](https://cn.mathworks.com/help/nnet/ug/neural-network-training-concepts.html?searchHighlight=Training%20Styles&s_tid=doc_srchtitle)

Incremental training is usually done with adapt; batch training is usually done with train.

两种不同的训练模式：
- `train` 为 Batch Training 
	- **计算完所有训练集后更新**
	- 可使用的训练方法更多
	- 不是所有的方法都支持 GPU
	- 一次完成指定的 epoch 或者达到收敛条件（待确认）
- `adapt` 为 Incremental Training 
	- **计算一个训练集更新一次，每个训练集可能不止一个数据点**
	- 仅当训练集为 cell 时是 incremental training，如果是矩阵则为 batch training。
	- 仅计算一次训练集，即一个 epoch，需要手动迭代
- 两者可使用的训练算法不完全相同
- **问题**
	- [solved] `train` 内部是否调用 `adpat` 进行进行计算？猜测是这样，但是为何两者可用的算法又不同？代码中未见明显的互相调用。
	-	[？？] 使用 `trainc` 或者 `trainr` 进行 `train` 时，也是 incremental，有何区别？猜测不是依赖数据点进行 incremental，而是根据 `net.inputs` 的个数进行，所以与 `adapt` 不同。（待确认）


？？什么是 Dynamic Networks 和 Static Network 


-------------
# 一些定义

## [卷积神经网路](https://zh.wikipedia.org/wiki/%E5%8D%B7%E7%A7%AF%E7%A5%9E%E7%BB%8F%E7%BD%91%E7%BB%9C)

卷积神经网路（Convolutional Neural Network, CNN）是一种*前馈神经网络*，它的人工神经元可以响应一部分覆盖范围内的周围单元，对于*大型图像处理*有出色表现。

卷积神经网路由一个或多个卷积层和顶端的全连通层（对应经典的神经网路）组成，同时也包括关联权重和池化层（pooling layer）。
这一结构使得卷积神经网路能够利用输入数据的二维结构。
与其他深度学习结构相比，卷积神经网路在*图像和语音识别方面*能够给出更好的结果。

