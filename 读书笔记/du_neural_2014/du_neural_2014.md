# Neural Networks and Statistical Learning
[1] K.-L. Du and M. N. S. Swamy, Neural Networks and Statistical Learning. London: Springer London, 2014.


# Hopfield Network 

>The continuos Hopfield network has dominated the techniqeus for optimization problems, especially for combinatiorial problems. 

>Hopfiled神经网络是一种递归神经网络，由约翰·霍普菲尔德在1982年发明。Hopfield网络是一种结合存储系统和二元系统的神经网络。它保证了向局部极小的收敛，但收敛到错误的局部极小值（local minimum），而非全局极小（global minimum）的情况也可能发生。Hopfiled网络也提供了模拟人类记忆的模型。[(WikiPedia)](https://zh.wikipedia.org/wiki/Hopfield%E7%A5%9E%E7%BB%8F%E7%BD%91%E7%BB%9C)

>联想记忆功能是离散Hopfield网络的一个重要应用范围。[(百度百科：Hopfield神经网络)](https://baike.baidu.com/item/HopField%E7%A5%9E%E7%BB%8F%E7%BD%91%E7%BB%9C)

!! 可以用在组合优化

**暂时用不到这个算法**





# SVM
>SVM is based on the statistical learning theory and is particularly useful for classification with small sample sizes. SVM has been used for classification, regression, and clustering. Thanks to its successful application in the SVM, the kernel method has aroused wide interest. (p2)

Kolmogorov定理保证：三层网络，足够多节点，可以任意精度近似连续函数。
- \[71\] Hecht-Nielsen, R. (1987). Kolmogorov’s mapping neural network existence theorem. In Proceedings of the 1st IEEE International Conference on Neural Networks (Vol. 3, pp. 11–14). San Diego, CA.
- \[81\] Kolmogorov, A. N. (1957). On the representation of continuous functions of several variables by superposition of continuous functions of one variable and addition. Doklady Akademii Nauk USSR, 114(5), 953–956.




## 2.10 Neural Networks as Universal Machines

### 2.10.3
>A three-layer feedforward network with a sufficient number of hidden units can approximate any continuous function to any degree of accuracy. This is guaranteed by Kolmogorov’s theorem [71, 81]. (p49)

>Kolmogorov’s theorem is the famous solution to Hilbert’s 13th problem. According to olmogorov’s theorem, a continuous multivariate function on a compact set can be expressed using superpositions and compositions of a finite number of singlevariable functions. 

Kolmogorov’s theorem --> Hecht-Nielsen theorem --> Stone–Weierstrass theorem (a generalization of the Weierstrass theorem)

>The Stone–Weierstrass theorem [118] is a generalization of the Weierstrass theorem, and is usually **used for verifying a model’s approximation capability to dynamic systems**.


### 2.11.3 LASSO

一种选择模型、选择模型自变量的算法。

>随着科技的进步，收集数据的技术也有了很大的发展。因此如何有效地从数据中挖掘出有用的信息也越来越受到人们的关注。统计建模无疑是目前处理这一问题的最有效的手段之一。在模型建立之初，为了尽量减小因缺少重要自变量而出现的模型偏差，人们通常会选择尽可能多的自变量。但实际建模过程中通常需要寻找对响应变量最具有解释性的自变量子集—即模型选择(或称变量选择、特征选择)，以提高模型的解释性和预测精度。所以模型选择在统计建模过程中是极其重要的问题。
>
>Lasso 的基本思想是在回归系数的绝对值之和小于一个常数的约束条件下，使残差平方和最小化，从而能够产生某些严格等于0 的回归系数，得到可以解释的模型。
>
>在分析这种模型的时候，人们根据问题本身的的专业理论及有关经验，常常把各种与因变量有关的自变量引进模型，其结果是把一些对因变量影响很小的，有些甚至没有影响的自变量也选入模型中。这样一来，不但计算量大，而且估计和预测的精度也会下降。此外，在一些情况下，某些自变量的观测数据获得代价昂贵，如果这些自变量本身对因变量的影响很小或根本没有影响，但我们不加选择都引到模型中，势必造成观测数据收集和模型应用费用不必要的加大。
>
>模型选择本质上是寻求模型稀疏表达的过程，而这种过程可以通过优化一个“损失”十“惩罚”的函数问题来完成。[(转载 - Lasso思想及算法)](http://blog.sciencenet.cn/blog-252888-711579.html)

>Lasso回归，和岭回归非常类似。[来源](http://www.jianshu.com/p/b628c90e1c1c)






## 3.1 
神经元的专业名称：
McCulloch–Pitts neuron == linear threshold gate

## 3.5
>Parallel perceptrons trained with the p-delta rule provide results comparable to that of MLP, madaline, decision tree (C4.5) and SVM, despite its simplicity [4]. (p75)





## 4.3
>BP with momentum.
>
>The momentum term can effectively magnify the descent in almost-flat steady downhill regions of the error surface by 1− 1τ. In regions with high fluctuations (due to high learning rates), the momentum has a stabilizing effect. The momentum term actually inserts secondorder information in the training process that performs like the CG method. The momentum term effectively smoothes the oscillations and accelerates the convergence. The role of the momentum term is shown in Fig. 4.2. BP with momentum is analyzed and the conditions for convergence are given in [128]. (p88)

总的来说 momentum 项可以使收敛过程更平滑，避免震荡。


## 4.4 Incremental Learning Versus Batch Learning

Incremental learning 的训练通常比 Batch learning 快，但是通常效果不如 batch learning 快。

后续的研究暂时用不上。


## 4.6 Optimizing Network Structure 优化网络结构

！！目前最需要的技术

>- sensitiviey-based methods
>- penalty-based methods






# 16 SVM
## 16.1 Intro
>SVM [12, 201] is one of the most popular nonparametric classification algorithms. It is optimal and is based on computational learning theory [200, 202]. The goal of SVM is to minimize the VC dimension by finding the optimal hyperplane between classes, with the maximal margin, where the margin is defined as the distance of the closest point in each class to the separating hyperplane. (p469)






# \# Math \# 

## Regularization
通过添加正则化项来解决病态的优化问题

>Regularization, in mathematics and statistics and particularly in the fields of machine learning and inverse problems, is a process of introducing additional information in order to solve an ill-posed problem or to prevent overfitting. 
> 
>A theoretical justification for regularization is that it attempts to impose Occam's razor on the solution, as depicted in the figure. From a Bayesian point of view, many regularization techniques correspond to imposing certain prior distributions on model parameters. [(Widipedia)](https://en.wikipedia.org/wiki/Regularization_(mathematics))

Regularization can be motivated as a technique to improve the generalizability of a learned model. \[不太懂\]



# \# Others \# 

[原版：7 Types of Regression Techniques you should know](https://www.analyticsvidhya.com/blog/2015/08/comprehensive-guide-regression/)

[翻译：回归系列之入门篇](http://www.jianshu.com/p/b628c90e1c1c)

**目前不太适用的：**
线性回归，Logistic回归，多项式回归，Stepwise回归，Ridge回归（岭回归），Lasso回归，ElasticNet回归（约等于Ridge回归+Lasso回归）

都是通常的回归算法，应用不到。




