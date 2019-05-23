---
title: Notes on MATLAB Neural Network Toolbox
categories: 
  - [Techniques, Software]
  - [Notes, Others]
tags:
  - MATLAB
  - neural network
  - ANN
abbrlink: f0398937
mathjax: true
comments: true
date: 2017-06-05 00:00:00
updated: 2017-06-05 00:00:00
---

# 神经网络工具箱学习摘要

both shallow and deep NN

- classification
- **regression** (这里主要是针对这部分功能的学习摘要，其它网络还有很多不同的内容)
- clustering
- dimensionality reducetion
- *time-series forecasting*: long short-term memory (LSTM) deep learning networks
- *dynamic system modeling and control*

For small training sets, you can quickly apply deep learning by performing transfer learning with pretrained deep network models (GoogLeNet, AlexNet, VGG-16, and VGG-19) and models from the Caffe Model Zoo. (什么东西？)

支持 CPU 和 GPU 并行
支持 Amazon EC2 P2 GPU instances （是什么？）

# 主要函数
<!-- more -->
## `feedforwardnet(hiddenSizes,trainFcn)`

每层与前一层相连

>Feedforward networks can be used for any kind of input to output mapping. A feedforward network with one hidden layer and enough neurons in the hidden layers, can fit any finite input-output mapping problem.

**一层隐藏层的网络具有全局近似的能力。**

>Specialized versions of the feedforward network include fitting (fitnet) and pattern recognition (patternnet) networks. A variation on the feedforward network is the cascade forward network (cascadeforwardnet) which has additional connections from the input to every layer, and from each layer to all following layers.

默认性能函数是 mean square error `mse`。

### `fitne` 和 `patternnet`

两种特殊化的前馈网络，都调用 `feedforwardnet` 创建网络。

`fitnet` 和 `patternnet` 的异同
- 隐藏层默认全部是 `tansig`。
- 输出层函数不同，前者默认为 `purelin`，后者默认为 `tansig`。
- `performFcn` 可能不同（待确认）。


## `cascadeforwardnet`

与 `feedforwardnet` 不同，与所有前面的层都相连，不只是前一层。

**暂时没有用到**，不清楚应用在什么情况。

# 主要的 methods

- `train` 会自动调用  `configure` 并且 `init` 网络。
  - `configure` 设置输入输出的数量和范围；设置 preprocessing 和 postprocessing；初始化 weights。(**被 `train` 自动调用**)
  - `init` 根据 `net.initFcn` 和 `net.initParam` 初始化权重。(**被 `configure` 自动调用**)

# MATLAB 给出的一些建议

- While two-layer feedforward networks can potentially learn virtually any input-output relationship, feedforward networks with more layers might learn complex relationships more quickly. For most problems, it is best to start with two layers, and then increase to three layers, if the performance with two layers is not satisfactory. [(ref)](https://cn.mathworks.com/help/nnet/ug/create-configure-and-initialize-multilayer-neural-networks.html) 先从 one hidden layer 开始尝试，效果不好时，增加网络深度。
- For most problems, when using the Neural Network Toolbox™ software, batch training is significantly faster and produces smaller errors than incremental training. [(ref)](https://cn.mathworks.com/help/nnet/ug/train-and-apply-multilayer-neural-networks.html) 优先使用 batch training。
- To ensure that a neural network of good accuracy has been found, retrain several times. [(ref)](https://cn.mathworks.com/help/nnet/ug/train-and-apply-multilayer-neural-networks.html)
- If the test curve had increased significantly before the validation curve increased, then it is possible that some overfitting might have occurred. [(ref)](https://cn.mathworks.com/help/nnet/ug/analyze-neural-network-performance-after-training.html)
- `tansig`: This is mathematically equivalent to tanh(N). It differs in that it runs faster than the MATLAB implementation of tanh, but the results can have very small numerical differences. This function is a good tradeoff for neural networks, where speed is important and the exact shape of the transfer function is not.




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


-----------------

# 提高 generalization 效果和防止 overfitting

[Improve Neural Network Generalization and Avoid Overfitting](https://cn.mathworks.com/help/nnet/ug/improve-neural-network-generalization-and-avoid-overfitting.html#bss4gz0-38)



这部分结果需要在进行所有操作前，就有所了解，并在设计网络和算法的过程中随时关注和思考。



一些直观的技巧：

- 重新训练，因为每次初始化是随机的
- 训练多个 ANN 平均它们的结果
- ​




<a name="regularization"></a>

## Regularization

>It is possible to improve generalization if you modify the performance function by adding a term that consists of the mean of the sum of squares of the network weights and biases **msereg=γ∗msw+(1−γ)∗mse**, where γ is the performance ratio
>
>Using this performance function causes the network to have smaller weights and biases, and this forces the network response to be smoother and less likely to overfit.

- 修正性能函数
  - 设置 `net.performParam.regularization`
  - 问题：不好取最优的正则化参数：过大会导致过拟合；过小会导致学习效果差。
- Automated Regularization (trainbr)
  - provides a measure of how many network parameters (weights and biases) are being effectively used by the network.
  - The [`trainbr`](https://cn.mathworks.com/help/nnet/ref/trainbr.html) algorithm generally works best when the network inputs and targets are scaled so that they fall approximately in the range [−1,1]. 通过 pro- post- processing 实现。
  - When using [`trainbr`](https://cn.mathworks.com/help/nnet/ref/trainbr.html), it is important to let the algorithm run until the effective number of parameters has converged. 要充分训练





## Early stopping

使用 validation data。

相关参数：[终止条件](#stopCriteria)中的 `max_fail`；划分数据的 `divideFcn` 和其参数。



------------

# 以上：需要掌握的一般概念

----------------
# 以下：一边学习一边实践的工作流程

---------------------

# 1. 组织训练数据

[here](https://cn.mathworks.com/help/nnet/gs/fit-data-with-a-neural-network.html)

## 划分数据

[Divide Data for Optimal Neural Network Training](https://cn.mathworks.com/help/nnet/ug/divide-data-for-optimal-neural-network-training.html)

用 `help nndivide` 查看所有函数

``net.divideFcn``存储函数，``net.divideParam``存储不同的`divideFcn`的变量
- `dividerand`
  - `net.divideParam.trainRatio`, `net.divideParam.valRatio`, `net.divideParam.testRatio`
- `divideblock`
  - similar parameter with `dividerand`
  - using three contiguous blocks of the original data set 
- `divideint`
  - similar parameter with `dividerand`
  - divided by an interleaved method
- [`divideind`](https://cn.mathworks.com/help/nnet/ref/divideind.html)
- - net.divideParam.trainInd`, `net.divideParam.valInd`, `net.divideParam.testInd`




### 人为指定 validation 数据

设置数据集 `dataForTraining` 和 `dataForValidating` ，组成整体的训练集，然后用 `divideind` 来指定相应的指标。

如果有测试集的话，同理。



## 训练数据的权重

`[net,tr] = train(net,X,T,Xi,Ai,EW)`

- `Xi` 和 `Ai` 一般用 `preparets` 生成，为空时输入 `{}`。
- `EW` 的大小为 **输出变量个数 x 训练集大小**。



<a name="pro-pose"></a>
## 选择：proprecessing 和 postprocessing 函数

这部分虽然是处理数据，但是嵌套在 ANN 的训练过程中实现的，对 inputs 和 outputs 实际是类似透明的！

[Choose Neural Network Input-Output Processing Functions](https://www.mathworks.com/help/nnet/ug/choose-neural-network-input-output-processing-functions.html)

`% For a list of all processing functions type: help nnprocess`

It is standard practice to normalize the inputs before applying them to the network.

Generally, the normalization step is applied to both the input vectors and the target vectors in the data set.

| [`mapminmax`](https://cn.mathworks.com/help/nnet/ref/mapminmax.html) | Normalize inputs/targets to fall in the range [−1, 1] |
| ---------------------------------------- | ---------------------------------------- |
| [`mapstd`](https://cn.mathworks.com/help/nnet/ref/mapstd.html) | Normalize inputs/targets to have zero mean and unity variance |
| [`processpca`](https://cn.mathworks.com/help/nnet/ref/processpca.html) | Extract principal components from the input vector |
| [`fixunknowns`](https://cn.mathworks.com/help/nnet/ref/fixunknowns.html) | Process unknown inputs                   |
| [`removeconstantrows`](https://cn.mathworks.com/help/nnet/ref/removeconstantrows.html) | Remove inputs/targets that are constant  |

- `feedforwardnet` 默认的是 `removeconstantrows` 和 `mapminmax`。
- 这两个函数的处理对外层的计算透明，不需要直接操作。
  - 输入在被用来训练前，已经进行了处理
  - 输出在用来计算性能函数前，也已经进行了处理。
  - 此处的 proprecess 和 postprecess 应该不是互逆的概念，输入后是关于数据进行处理，输出前是关于raw outputs 进行处理；不是 scale 和 unscale 的关系；与性能函数中的 `normalization` 属性应该是不冲突的（**待确认！！**）










--------------------
# 2. 训练网络


## 选择：ANN 的初始化

使用默认设置即可。

调用 `net = init(net)` 初始化网络。
在 `init`内部 会调用 `net.initFcn` 进行初始化。
`net.initFcn = ‘initlay’` 调用 `net.layers{i}.initFcn` 对每层进行初始化。
常用的默认初始化算法
- [`initnw`](https://cn.mathworks.com/help/nnet/ref/initnw.html)  使用 Nguyen-Widrow 初始化算法。
  - distribute the active region of each neuron in the layer approximately evenly across the layer's input space. （不懂）
  - 含有一维的随机性，需要设置随机数种子保证结果可重现
  - 激活函数 transfer function 设置了有限的有效输入区间。比如，`tansig` 为 [-2, 2]，但 `purelin` 为 [-Inf, Inf]。
  - 调用：
    - `net.initFcn = 'initlay'`
    - `net.layers{i}.initFcn = 'initnw'`
- [`initwb`](https://cn.mathworks.com/help/nnet/ref/initwb.html) 使用每个权重自己的初始化函数。
  - 调用：
    - `net.initFcn = 'initlay'`
    - `net.layers{i}.initFcn = 'initwb'`
    - `net.inputWeights{i,j}.initFcn = 自定义函数`
  - 最常用的自定义函数包括 `rands`，生成 [-1, 1] 之间的随机数。




`feedforwardnet` 默认设置所有层的初始化算法为 Nguyen-Widrow 初始化算法 [`initnw`](https://cn.mathworks.com/help/nnet/ref/initnw.html)。
- 默认 `net.initFcn = 'initlay'`。
- 默认 `net.layers{i}.initFcn = 'initnw'`。




## 选择：性能函数 performance function

For a list of all performance functions type: `help nnperformance`

- [`mae`](https://cn.mathworks.com/help/nnet/ref/mae.html): mean absolute error

  - 无参数
  - [`trainlm`  不支持](https://cn.mathworks.com/help/nnet/ref/trainlm.html#btk7rr9-1)

- [`mse`](https://cn.mathworks.com/help/nnet/ref/mse.html) : mean squared normalized error （通常用这个）

  - `regularization`, default 0, 在 0--1 之间取值。（什么作用？？）

    - `net.performParam.regularization = 0.01;`

    - > The greater the regularization value, the more squared weights and biases are included in the performance calculation relative to errors. The default is 0, corresponding to no regularization.

    - 实现方式：`perf = perf * (1-reg) + sum(perfwb) * reg;` see ['Regularization'](#regularization)

  - `normalization`, default `'none'`, 在 `'none'`, `'standard'`[-2,2], `'percent'`[-1,1] 之中取值。

    - `net.performParam.normalization = 'standard'`

    - > This feature is useful for networks with multi-element outputs. It ensures that the relative accuracy of output elements with differing target value ranges are treated as equally important, instead of prioritizing the relative accuracy of the output element with the largest target value range. （什么意思？？）

    - [(another ref)](https://cn.mathworks.com/help/nnet/ug/normalize-errors-of-multiple-outputs.html) 

- [`sse`](https://cn.mathworks.com/help/nnet/ref/sse.html?searchHighlight=sse&s_tid=doc_srchtitle): sum squared error 

  - `regularization` 
  - `normalization`
  - `squaredWeighting`：`true`则权重作用在平方误差上；`false` 则作用在平方前的误差绝对值上
    - 为什么有这样一个设置？为什么 `mse` 没有？
  - ​




## 选择：激活函数

For a list of functions, type: `help nntransfer`

用在隐层

- [tansig](https://cn.mathworks.com/help/nnet/ref/tansig.html) - Symmetric sigmoid transfer function. 双曲正切
  - tansig(n) = 2/(1+exp(-2\*n))-1
  - 和 `tanh(n)` 数学上一样，数值误差很小，ANN 中使用速度更快
- [logsig](https://cn.mathworks.com/help/nnet/ref/logsig.html) - Logarithmic sigmoid transfer function. 对数S函数
  - logsig(n) = 1 / (1 + exp(-n))
- [elliotsig](https://cn.mathworks.com/help/nnet/ref/elliotsig.html?s_tid=doc_ta) - Elliot sigmoid transfer function.
- [radbas]() - Radial basis transfer function.
  - exp(-n^2)
- [radbasn]() - Radial basis normalized transfer function.
  - exp(-n^2) / sum(exp(-n^2))

用在输出层：
- [purelin](https://cn.mathworks.com/help/nnet/ref/purelin.html) - Linear transfer function.

暂时用不到
- ~~compet - Competitive transfer function.~~
- ~~softmax - Soft max transfer function.~~
- ~~[hardlim](https://cn.mathworks.com/help/nnet/ref/hardlim.html?searchHighlight=hardlim&s_tid=doc_srchtitle) - Positive hard limit transfer function.~~
  - 1 if n ≥ 0, 0 otherwise
- ~~[hardlims](https://cn.mathworks.com/help/nnet/ref/hardlims.html) - Symmetric hard limit transfer function.~~
  - 1 if n ≥ 0, -1 otherwise
  - 函数的 s 表示对称
- ~~netinv - Inverse transfer function.~~(不懂)
- ~~[poslin](https://cn.mathworks.com/help/nnet/ref/poslin.html) - Positive linear transfer function.~~
  - n if n >= 0, 0 if n <= 0
- ~~[satlin](https://cn.mathworks.com/help/nnet/ref/satlin.html) - Positive saturating linear transfer function. 正线性有界~~
- ~~[satlins](https://cn.mathworks.com/help/nnet/ref/satlins.html) - Symmetric saturating linear transfer function. 有界对称线性~~
- ~~[tribas](https://cn.mathworks.com/help/nnet/ref/tribas.html?s_tid=doc_ta) - Triangular basis transfer function.~~



## 选择：训练函数

对于 multilayer feedforward 网络，使用性能函数相对于权重的 gradient 或者 Jacobian 的优化方法，效果突出。

> For training multilayer feedforward networks, any standard numerical optimization algorithm can be used to optimize the performance function, but there are a few key ones that have shown excellent performance for neural network training. These optimization methods use either the gradient of the network performance with respect to the network weights, or the Jacobian of the network errors with respect to the weights. 
>
> The gradient and the Jacobian are calculated using a technique called the backpropagation algorithm, which involves performing computations backward through the network. The backpropagation computation is derived using the chain rule of calculus and is described in Chapters 11 (for the gradient) and 12 (for the Jacobian) of [HDB96].


``fitnet``

[Choose a Multilayer Neural Network Training Function](https://cn.mathworks.com/help/nnet/ref/fitnet.html)

**目前来看，按照 `trainlm` `trainscg` `trainbfg` `trainbr` 的顺序测试即可。**

-  [**`trainlm`**](https://cn.mathworks.com/help/nnet/ref/trainlm.html) : Levenberg-Marquardt （优先选择）
  -  In general, on function approximation problems, for networks that contain up to a few hundred weights, the Levenberg-Marquardt algorithm will have the fastest convergence. 在大多数函数回归问题上又快又好。
  -  In many cases, trainlm is able to obtain lower mean square errors than any of the other algorithms tested.
  -  In addition, trainlm performance is relatively poor on pattern recognition problems. 在模式识别问题上效果不够好。
  -  As the number of parameters increases, the computation required in the LM algorithm increases geometrically. 
  -  计算需要用到 Jacobian，所以只支持 `mse` 和 `sse` 。
-  [**`trainscg`**](https://cn.mathworks.com/help/nnet/ref/trainscg.html): Scaled *Conjugate Gradient* （权重数量多时训练较快）
  - The SCG algorithm is almost as fast as the LM algorithm on function approximation problems (faster for large networks) and is almost as fast as trainrp on pattern recognition problems. 
-  [**`trainbfg`**](https://cn.mathworks.com/help/nnet/ref/trainbfg.html): BFGS Quasi-Newton
  - The performance of trainbfg is similar to that of trainlm. 与 L-M 类似（？？区别在哪里？何时使用）
  - the computation required does increase geometrically with the size of the network, because the equivalent of a matrix inverse must be computed at each iteration. （计算量几何增大）
-  [`trainbr`](https://cn.mathworks.com/help/nnet/ref/trainbr.html?searchHighlight=trainbr&s_tid=doc_srchtitle): Bayesian regularization training algorithm
  - Bayesian regularization has been implemented 包含了自动正则化 [(ref)](https://cn.mathworks.com/help/nnet/ug/improve-neural-network-generalization-and-avoid-overfitting.html#bss4gz0-40)
  - The [`trainbr`](https://cn.mathworks.com/help/nnet/ref/trainbr.html) algorithm generally works best when the network inputs and targets are scaled so that they fall approximately in the range [−1,1]. [(ref)](https://cn.mathworks.com/help/nnet/ug/improve-neural-network-generalization-and-avoid-overfitting.html#bss4gz0-40)
  - When using [`trainbr`](https://cn.mathworks.com/help/nnet/ref/trainbr.html), it is important to let the algorithm run until the effective number of parameters has converged. [(ref)](https://cn.mathworks.com/help/nnet/ug/improve-neural-network-generalization-and-avoid-overfitting.html#bss4gz0-40)
  - ！！有待仔细学习
-  ​
-  **【以下暂时用不到】**
-  ~~`trainrp`: Resilient Backpropagation~~  （在模式识别效果最好，暂时用不到）
  - The trainrp function is the fastest algorithm on **pattern recognition** problems. However, it does not perform well on function approximation problems.
  - When training large networks, and when training pattern recognition networks, trainscg and trainrp are good choices. Their memory requirements are relatively small, and yet they are much faster than standard gradient descent algorithms. [Ref](https://cn.mathworks.com/help/nnet/ug/train-and-apply-multilayer-neural-networks.html)
  - When training large networks, and when training pattern recognition networks, trainscg and trainrp are good choices. Their memory requirements are relatively small, and yet they are much faster than standard gradient descent algorithms. [Ref](https://cn.mathworks.com/help/nnet/ug/train-and-apply-multilayer-neural-networks.html)
-  `traincgb`: *Conjugate Gradient* with Powell/Beale Restarts
-  `traincgf`: Fletcher-Powell *Conjugate Gradient*
-  `traincgp`: Polak-Ribiére *Conjugate Gradient*
-  `trainoss`: One Step Secant
-  `traingdx`: Variable Learning Rate Gradient Descent
  - usually much slower than the other methods
-  `traingdm`: Gradient Descent with Momentum
-  `traingd`: Gradient Descent



### 概念：`train` 和 `adapt` 的区别 

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
  - [solved] 使用 `trainc` 或者 `trainr` 进行 `train` 时，也是 incremental，有何区别？猜测不是依赖数据点进行 incremental，而是根据 `net.inputs` 的个数进行，所以与 `adapt` 不同。（见[如下引用](#解释trainc)）

><a name="解释trainc"></a>[Adaption and training of networks have different purposes.](https://cn.mathworks.com/matlabcentral/answers/92991-is-there-a-difference-between-incremental-training-using-adapt-and-train-in-neural-network-toolbox-6)
>
>Training is the problem where there are a fixed set of known input and target vectors and the solution is a network that properly maps inputs to targets. The solution network **does not continue learning** once it has been trained.
>
>Adaption is the problem where there is a sequence of input and target **vectors** which is **unlimited**. The solution is a network with initial conditions and an adaptive algorithm. The network is to continue learning as it is used because it is assumed that **the nature of the input/target signals will change over time** or that their nature will be different in unknown ways in different contexts where the network will be used.
>
>Incremental learning can be used either for training or adaption. For training it is rarely the most efficient method. **Batch learning** is almost always **more efficient** as at each training step the whole dataset is used to determine changes. However, incremental training can be done (often less efficiently) by repeatedly updating the network to vectors in some order, over and over. Examples of incremental training are TRAINC (cycles over vectors) and TRAINR (presents vectors in random order).
>
>Note that if **TRAINC** or **TRAINR** are called with data defining multiple time-series, they will update the network for one whole time-series at a time, cycling or randomly picking another time-series for each training step. So **in this case incremental does not mean just one input/target vector is being applied**.
>
>In contrast, adaptive algorithms are usually incremental as the network will get data incrementally when actually used. A true batch adaptive algorithm would have to collect a quickly growing dataset which would grow without bounds as the network was used, which is almost always impractical. (There are adaptive algorithms which fall between strict incremental and batch, but we have not released one yet.) TRAINS updates the network incrementally according to timesteps of the data. Calling ADAPT will update a network for a time sequence and also return the network's outputs for that time period. Unlike with training, the network's outputs during adaption are relevant - the network output as it is learned is expected to be used.





-------------------
<a name="stopCriteria"></a>
## 选择：训练终止条件
(按个人的使用频率排序)
- 最大迭代次数 `net.trainParam.epochs`
- 最小梯度 `net.trainParam.min_grad`
  - If the magnitude of the gradient is less than 1e-5, the training will stop. This limit can be adjusted by setting the parameter `net.trainParam.min_grad`. 
- 最小目标性能 `net.trainParam.goal`
- 最大 validation fails to decrease 次数 `net.trainParam.max_fail`
  - The number of validation checks represents the number of successive iterations that the validation performance fails to decrease. If this number reaches 6 (the default value), the training will stop. In this run, you can see that the training did stop because of the number of validation checks. You can change this criterion by setting the parameter `net.trainParam.max_fail`. 
- 最大训练时间 `net.trainParam.time`




# 3. 改进网络

## 训练效果评价

- 所有训练函数返回 training record 作为第 2 个参数 `tr`
- 画图函数
  - `plotperf(tr)`
  - `plotregression(trTarg, trOut, 'Train', vTarg, vOut, 'Validation', tsTarg, tsOut, 'Testing')`
    - `ploterrhist`Plot error histogram
    - `plotfit`Plot function fit
    - `plotperform`Plot network performance
    - `plotregression`Plot linear regression
    - `plottrainstate`Plot training state values

改进网络效果的方法包括

- 重新初始化，重新训练
- 增加隐藏节点个数
- 换其它训练函数，比如 Bayesian regularization training 方法 `trainbr`。（为什么推荐用这个）
- 增加训练集

其实还有很多要考虑的因素，MATLAB 在这里的建议太过笼统和保守，没有太大意义。





## [并行计算加速](https://cn.mathworks.com/help/nnet/ug/neural-networks-with-parallel-and-gpu-computing.html)

### CPU

设置 `useParallel` 为 `yes` 即可。

- 算法天然支持，MATLAB天然支持
- 多核，多CPU，分布式

### GPU

两种激活方式：

- call `train` and `sim` with the parameter argument `'useGPU'` set to `'yes'` （推荐）
- 使用 `nndata2gpu` 形式的训练数据

>Many MATLAB functions automatically execute on a GPU when any of the input arguments is a gpuArray. Normally you move arrays to and from the GPU with the functions `gpuArray` and `gather`. However, for neural network calculations on a GPU to be efficient, matrices need to be transposed and the columns padded so that the first element in each column aligns properly in the GPU memory. Neural Network Toolbox provides a special function called [`nndata2gpu`](https://cn.mathworks.com/help/nnet/ref/nndata2gpu.html) to move an array to a GPU and properly organize it. [(ref)](https://cn.mathworks.com/help/nnet/ug/neural-networks-with-parallel-and-gpu-computing.html)

一些细节：

- 在某些简单硬件或者在 GPU 上的指数函数没有硬件实现，导致 `tansig` 较慢，可以使用 `elliotsig`  代替。
- GPU 不支持基于 Jacobian 的训练算法

支持分布式多 GPU 计算。



## 通用

- If the performance on the training set is good, but the test set performance is significantly worse, which could indicate **overfitting**, then reducing the number of neurons can improve your results.  
- ​










-------------
# 其它相关定义

## [CNN 卷积神经网路](https://zh.wikipedia.org/wiki/%E5%8D%B7%E7%A7%AF%E7%A5%9E%E7%BB%8F%E7%BD%91%E7%BB%9C)

卷积神经网路（Convolutional Neural Network, CNN）是一种*前馈神经网络*，它的人工神经元可以响应一部分覆盖范围内的周围单元，对于*大型图像处理*有出色表现。

卷积神经网路由一个或多个卷积层和顶端的全连通层（对应经典的神经网路）组成，同时也包括关联权重和池化层（pooling layer）。
这一结构使得卷积神经网路能够利用输入数据的二维结构。
与其他深度学习结构相比，卷积神经网路在*图像和语音识别方面*能够给出更好的结果。





# ！！待解决的一些问题

## 什么是 Dynamic Networks 和 Static Network 

## 像 `tansig` 这样的函数，是即当成函数，又当成面向对象的类在使用

需要学习如何理解 MATLAB 的面向对象