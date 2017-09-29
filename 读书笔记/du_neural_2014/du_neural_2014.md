# Neural Networks and Statistical Learning
[1] K.-L. Du and M. N. S. Swamy, Neural Networks and Statistical Learning. London: Springer London, 2014.

# Hopfield Network 

The continuos Hopfield network has dominated the techniqeus for optimization problems, especially for combinatiorial problems. 

Hopfiled神经网络是一种递归神经网络，由约翰·霍普菲尔德在1982年发明。Hopfield网络是一种结合存储系统和二元系统的神经网络。它保证了向局部极小的收敛，但收敛到错误的局部极小值（local minimum），而非全局极小（global minimum）的情况也可能发生。Hopfiled网络也提供了模拟人类记忆的模型。[\[WikiPedia\]](https://zh.wikipedia.org/wiki/Hopfield%E7%A5%9E%E7%BB%8F%E7%BD%91%E7%BB%9C)

联想记忆功能是离散Hopfield网络的一个重要应用范围。[\[百度百科：Hopfield神经网络\]](https://baike.baidu.com/item/HopField%E7%A5%9E%E7%BB%8F%E7%BD%91%E7%BB%9C)

!! 可以用在组合优化

**暂时用不到这个算法**





# 2.10
A three-layer feedforward network with a sufficient number of hidden units can approximate any continuous function to any degree of accuracy. This is guaranteed by Kolmogorov’s theorem [71, 81]. (p49)
三层网络，足够多节点，可以任意精度近似连续函数。





# SVM
SVM is based on the statistical learning theory and is particularly useful for classification with small sample sizes. SVM has been used for classification, regression, and clustering. Thanks to its successful application in the SVM, the kernel method has aroused wide interest. (p2)


# 16 SVM
## 16.1 Intro
SVM [12, 201] is one of the most popular nonparametric classification algorithms. It is optimal and is based on computational learning theory [200, 202]. The goal of SVM is to minimize the VC dimension by finding the optimal hyperplane between classes, with the maximal margin, where the margin is defined as the distance of the closest point in each class to the separating hyperplane. (p469)

