---
title: Summary of Recurrent Neural Network (RNN) and Long Short-Term Memory (LSTM) 
comments: true
mathjax: false
abbrlink: 1f9bc6a1
date: 2020-03-29 13:31:15
updated: 2020-04-21 22:46:05
categories:
- Summaries
- [Notes, Web Post Notes]
tags:
- ANN
- RNN
- LSTM
- Machine Learning
---

# Learning Materials

I collect some posts about LSTM and RNN here, with some useful excerpts as well as my thoughts. 

## RNN

- [使用Keras中的RNN模型进行时间序列预测](http://resuly.me/2017/08/16/keras-rnn-tutorial/)
    - 用语言详细讲了LSTM的运行过程，每一步会生成什么，传递什么
    - 详细讲了`LSTM`层的`return_sequence`参数的作用
    - `return_sequence=False` 被用于 RNN 层与 Feedforward 层（卷积神经网络、Fully-connected神经网络等）之间连接的桥梁


### RNN 的拓展

- [DARNN:一种新的时间序列预测方法——基于双阶段注意力机制的循环神经网络](https://zhuanlan.zhihu.com/p/36440240)
  - 还没有仔细看

## LSTM 

<!-- more -->

部分内容参见另一篇 Autoencoder 的文章 {% post_link summary-autoencoder %}

- [Understanding LSTM Networks](https://colah.github.io/posts/2015-08-Understanding-LSTMs/)
  - 几个问题
    - `sigmoid` 层的输出始终在 [0, 1]， `tanh` 层的输出始终在 [-1, 1]，最终的输出是 element-wise multiply，所以每个元素都在 [-1, 1] 之间
  - 变种 LSTM 效果都差不多，个别情况特殊 RNN 更好
    - Greff, et al. (2015) do a nice comparison of popular variants, finding that they’re all about the same. 
    - Jozefowicz, et al. (2015) tested more than ten thousand RNN architectures, finding some that worked better than LSTMs on certain tasks.
  - the remarkable results people are achieving with RNNs. Essentially all of these are achieved using LSTMs.
  - 其它拓展：Attention; Grid LSTMs; Work using RNNs in generative models; 

<img src="{% asset_path lstm-chain.png %}" width="500px" title="The horizontal line running through the top of the diagram is the cell state. <br> Talking about stateless or stateful is about this state. <br> (Credit: Understanding LSTM Networks)">


- （完全看懂）[Step-by-step understanding LSTM Autoencoder layers](https://towardsdatascience.com/step-by-step-understanding-lstm-autoencoder-layers-ffab055b6352)（重点参考 LSTM 部分）
  - 详细解释了LSTM层的作用机理。
  - Keras 中的 LSTM 在开启 `return_sequence=True` 时会返回每个 recurrent 的 time step 的输出
    - 如果是 `return_sequence=False` 则只返回最后一个输出，然后如果下一层是一个LSTM层，需要配合 `RepeatVector` 把这唯一的一层复制为相应的 time steps 一样多的层数，然后再输入到下一层
    - 如果是做 time series 重建的话，每层都不能改变 length 的，所以如果不用 `return_sequence=False` 就需要用 `RepeatVector` 复制
  - `TimeDistributed` 层的描述比较晦涩。
    - 前面最后一层 LSTM 的输出，每个 time step 的 features 个数与实际需要的不同，所以需要把每一个 time step 上 LSTM 的值输出为正确的 feature 个数
    - 可以每个 time step 都构造一个 `Dense` 层来完成这个变换，但是使用 `TimeDistributed` 可以只构造一个 `Dense`，然后自动应用到所有的 time step 上，这也就对应了官方文档中描述的 *applies a layer to every temporal slice of an input*，而这个时间层就是 *the dimension of index one*，注意这里的 index one 实际上因为 Python 是 *Zero-based numbering* 所以指的是 **the second dimension**。
    - 至于官方文档后面说的 *used with arbitrary layers* 就更混乱了，其实意思就是可以用 `TimeDistributed` 把输入的自定义层，按 `index-1` 为划分，自动应用到从输入的 `index-2` 开始的后面维度构成的 tensor （为什么没有 `index-0` 什么事儿呢？因为它是训练数据的个数，通常是不确定的，而且不影响定义各种层的操作，每个训练 sample 最终都会被执行这段的前半部分讨论的操作）
  - 另一个相关的描述：We could output the model with another LSTM layer with one neuron and `return_sequences=True` parameter, but using a `TimeDistributed` layer wrapping a `Dense` layer we will have the same weights for each outputted time-step. (from [silver medalTime-series forecasting with LSTM autoencoders](https://www.kaggle.com/dimitreoliveira/time-series-forecasting-with-lstm-autoencoders))
  - 其实就是把时间序列排成2D-array，然后每层自动连接起来
  - 【问题】如果`return_sequences=False`的话，是否还可以从 LSTM 连接到 LSTM layer？


<img src="{% asset_path fig_from_step-by-step-understanding-lstm.png %}" width="600px" title="See how two LSTM layers with <code>return_sequence=True</code> are connected. <br> (Credit: Chitta Ranjan, Step-by-step understanding LSTM Autoencoder layers)">


- （仔细读完了）[Understanding Stateful LSTM Recurrent Neural Networks in Python with Keras](https://machinelearningmastery.com/understanding-stateful-lstm-recurrent-neural-networks-python-keras/)
  - multi-class classification problem
    - the log loss function (called `categorical_crossentropy` in Keras)
    - using the `ADAM` optimization function.
  - the **Keras implementation** <mark>resets the network state after each training batch</mark>
  - making the LSTM layers stateful and manually resetting the state of the network at the end of the epoch
    - This is truly how the LSTM networks are intended to be used.
    - 但是在做预测时，预测数据往往没有这种顺序性（有办法回避这个问题吗？）
  - the Keras “stateful” LSTM was really only a shortcut to replaying the first n-sequences, but didn’t really help us learn a generic model of the alphabet.
    - fixed length, batch size 1, stateful LSTM == variable length, stateless LSTM (I'm not 100% sure about this.)
  - Variable-Length Input
    - **zero padding**. Here, we use left-hand-side (prefix) padding with the Keras built in `pad_sequences()` function.
    - 所以实际上还是fixed-length输入，只不过是用无意义的数据来padding了输入序列，还是无法超过最大序列
  - 
  - <mark>我的一些总结：</mark>从上一个图中可以看出来，`state` 在初始值时，会被输入 `X` 逐渐赋值
    - 如果每个batch_size重置，则每次重新fit整个batch；
    - 如果两个相邻batch之间没有联系，比如shuffled training data，不重置就不合理；
    - 但是如果是ordered training data，就可以保留下来，可以保持训练的连贯性；
    - 代价是做prediction时必须使用同样的batch_size，因为在batch操作时必须提前知道batch_size是多少才能批量保留前一个状态，而且要与training data的顺序有连贯性。（如果取了 `batch_size=1` 则没有这些限制了，比较tricky）
    - 一种折衷的方法是，手动在每个epoch进行重置，而不是在每个batch进行重置。
  - （注意）使用 `stateful=True` 时，要注意经常进行 `model.reset_states()` 的操作，不然会导致后续的预测依赖前面的预测。这篇post中Stateful LSTM for a One-Char to One-Char Mapping部分的代码，每次预测完都要重置，所谓的 **cold start**。
  

- [Stateful and Stateless LSTM for Time Series Forecasting with Python](https://machinelearningmastery.com/stateful-stateless-lstm-time-series-forecasting-python/)
  - <mark>rolling-forecast scenario</mark> will be used, also called walk-forward model validation.
    - A model will be used to make a forecast for the time step, then the actual expected value from the test set will be taken and made available to the model for the forecast on the next time step.
    - This mimics a real-world scenario where new Shampoo Sales observations would be available each month and used in the forecasting of the following month.
  - Data Preparation
    - <mark>Transform the time series data so that it is stationary</mark>: a lag=1 differencing to remove the increasing trend in the data
    - to rescale the data to values between -1 and 1 to meet the default hyperbolic tangent activation function of the LSTM model. （必须这样吗？似乎是必须的）
  - A batch size of 1; online training; will have some variance
  - A stateless LSTM does not shuffle input patterns during training because the network aims to learn the sequence of patterns. We will test a stateless LSTM with and without shuffling.
    - 效果：
  - the stateless configurations <mark>may be more stable</mark>.
  - Review of Findings
    - Resetting state when making one-step predictions with a stateful LSTM may improve performance on the test set.
    - Fitting a stateful LSTM and seeding it on the training dataset and not performing any resetting of state during training or prediction may result in better performance on the test set.
  - （结论）用一个例子对比了各种不同参数设置的 LSTM 的效果，感觉没有太大的质的变化，预测的结果都在比较接近的范围内。
    - 使序列是 stationary 似乎是特别重要的一个性质（为什么？）

### Application of LSTM on Time Series

- [Time-series forecasting with LSTM autoencoders](https://www.kaggle.com/dimitreoliveira/time-series-forecasting-with-lstm-autoencoders)
  - 用纯 LSTM 做预测：LSTM(10) -- LSTM(6) -- LSTM(1) -- Dense(10) -- Dense(10) -- Dense(1)
  - 用 LSTM autoencoder：LSTM(12) -- LSTM(6) -- LSTM(1) -- RepeatVector(12) -- LSTM(12) -- LSTM(6) -- TimeDistributed(Dense(1))
    - 为什么后面的 decoder 是先12再6？故意反过来的？
    - 然后把 original time series 中的最后一个值，和 encoder （直到 LSTM(1)）的值作为新的输入，训练一个新的网络 Dense(10) -- Dense(10) -- Dense(1) 来做预测
  - 实际上是用 encoder 作为一个数据压缩的工具，把完整长度的 time series 压缩成较短的输入，然后再训练一个预测网络。
  - 【感觉这篇讲的东西没有什么用】

- [Deep Learning for Time Series Forecasting](https://www.kaggle.com/dimitreoliveira/deep-learning-for-time-series-forecasting)
  - MLP for Time Series Forecasting
    - Dense(100) -- Dense(1)
  - CNN for Time Series Forecasting
    - Conv1D(64) -- MaxPooling1D(2) -- Flatten() -- Dense(50) -- Dense(1)
  - LSTM for Time Series Forecasting
    - LSTM(50) -- Dense(1)
  - CNN-LSTM for Time Series Forecasting （没有看懂）
    - TimeDistributed(Conv1D(64)) -- TimeDistributed(MaxPooling1D(2)) -- TimeDistributed(Flatten()) -- LSTM(50) -- Dense(1)
  - [从最终的结果上看，似乎效果都差不多](https://www.kaggle.com/dimitreoliveira/deep-learning-for-time-series-forecasting#Comparing-models)，最简单的MLP反而是testing RMSE最好的……
  - 这篇比较有意思，基于这篇，
    - 测试了MLP的性能确实不错
    - <mark>下一步测试CNN的性能</mark>
    - 目前使用LSTM没有得到好的效果
  

- [从RNN到LSTM，性能良好的神经网络到底是如何工作的？](https://www.jianshu.com/p/279d8c7efdcd)
  - 注意力机制（Attention Mechanism）在很多任务中对性能有着很大的影响。
    - 在生成第二个单词的时候，根据目标端的隐藏层状态和源端的每一个隐藏层之间做相似度的计算，根据规划得到一个权重的得分，接着生成一个上下文的Attention Layer，借助于这个Attention Layer作用于生成第二个词的过程，进而生成正确的翻译。
  - LSTM
    - 通过加入这几个门限，实际在循环网络结构ct-1到ct传播的过程中，只有一些较少的线性操作，并没有乘法操作。这样的好处在于它的gradient flow没有被过多的干扰，即整个流程中梯度的传播是非常通畅的，这样就解决了RNN中梯度爆炸或者梯度消失的问题。
  - GRU
    - 它将forget gate和input gate合成一个update gate，这个gate用于综合控制cell的读和写，这样可以简化LSTM的参数，此外它还将cell state和hidden state进行合并。总体而言，它是一个比LSTM更加简化的结构，在训练上更加容易（参数少）。
  - RNNs的阿喀琉斯之踵
    - 1、RNNs对层次信息的表示能力和卷积能力都存在一些不足。因此产生了一些如Deep RNN、Bidirectional RNN和Hierarchical RNN的变种，都希望通过更层次化的网络结构来弥补这种不足。
    - 2、RNNs的并行度很低。它的当前时刻的隐藏层的状态依赖于之前时间的状态，并且训练和解码的并行度都很低。
  - 为了解决上面的问题，提出了一种新的神经网络的架构——Transformer
    - Transformer使用简单的FF-NN替代了GRU，这样就直接解决了在训练中难以并行的问题。
    - 这时引入了一个Positional Encoding，对于每个位置都有一个Embedding来存储位置信息。
    - 【细节未看】



# Criticism

- [The fall of RNN / LSTM](https://towardsdatascience.com/the-fall-of-rnn-lstm-2d1594c74ce0)
  - It is the year 2014 and LSTM and RNN make a great come-back from the dead.
  - Then in the following years (2015–16) came ResNet and Attention. （这是什么？）
  - Also attention showed that MLP network could be replaced by averaging networks influenced by a context vector.
  - Problem
    - memory-bandwidth-bound computation
    - not a good match for hardware acceleration
  - 似乎是主要在讨论 translation problem，不确定这里的讨论是否适用于所有 time series problem
  - .
  - 这篇也有[中文翻译](https://zhuanlan.zhihu.com/p/35701746)


- [When to Use MLP, CNN, and RNN Neural Networks -- see section "When to Use Recurrent Neural Networks?"](https://machinelearningmastery.com/when-to-use-mlp-cnn-and-rnn-neural-networks/)
  - RNNs in general and LSTMs in particular have received the most success when working with sequences of words and paragraphs, generally called natural language processing.
  - RNNs and LSTMs have been tested on time series forecasting problems, but the results have been poor, to say the least. Autoregression methods, even linear methods often perform much better. LSTMs are often outperformed by simple MLPs applied on the same data.
    - see this for more: [On the Suitability of Long Short-Term Memory Networks for Time Series Forecasting](https://machinelearningmastery.com/suitability-long-short-term-memory-networks-time-series-forecasting/) <mark>（还没有仔细研究）</mark>
  

- [On the Suitability of Long Short-Term Memory Networks for Time Series Forecasting]https://machinelearningmastery.com/suitability-long-short-term-memory-networks-time-series-forecasting/
  - Last Updated on August 5, 2019
  - 主要是针对一篇2001年的论文展开的讨论，分析了在两种经典时间序列上的LSTM的效果
  - 评论中有很多有意思的讨论 (copy-pasted from the comments below the article; use "in-page search" function to find the following exact replies)
    - Thank you for this informative article. While I have not trained any LSTM RNNs on my time series data, I’ve found that plain jane feed forward DNNs that are feature engineered correctly and use sliding window CV predicts OOS as expected. Essentially, it is not necessary for my data to have to mess with LSTMs at all. And my features aren’t all iid... I suppose this illustrates the versatility of DNNs.
    - MLPs with a window do very well on small time series forecasting problems.
    - I agree that along with MLP’s , LSTM’s have an advantage over more classical statistical approaches like ARIMA : they can fit non-linear functions and moreover , you do not need to specify the type of non-linearity . There also lies the danger : regularisation is absolutely crucial to avoid overfitting .
    - Why use data hungry algorithm like lstm when similar results can be obtained using a machine learning or time series methods?
    - After getting my results from comparing MLPs and LSTMs on a data, I came to the conclusion that MLPs are much more efficient than LSTMs, when using constant number of lags (let’s say 7 days before) to predict 4 days ahead. Would You create a tutorial on using LSTMs with dynamic lag time?

