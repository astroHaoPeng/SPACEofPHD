---
title: Multivariate Gaussian Processes (GP) theories and packages
categories:
  - - Techniques
    - Software
  - - Academics
    - Math
abbrlink: 76e7ddf2
date: 2019-05-20 14:41:22
updated: 2019-05-20 14:41:51
---

# Posts

[【答疑解惑III】说说高斯过程中的多维输入和多维输出](https://zhuanlan.zhihu.com/p/51012226)
> 经典的高斯过程模型的输出必然只能是单输出的\
> ARD的kernel的引入使得高斯过程模型自然自带feature selection的能力，这就是GP相对于其他机器学习模型的有优势之一\

> 比如基于Matlab的SheffieldML/multigp，\
> 基于Python的GPy(以前记得没有的哈，不过最近在其中发现了gp_multiout_regression.py， 因而想必也是可以多维输出的哦！由于写着是回归，想必应该也是只能做多维输出的回归吧！), \
> 另外理论上基于GPy的GPflow应该也是可以的哈！不过没有亲测哦！

> 第一步：所有training output构成矩阵后（因为每一个点是一个向量，所以堆叠后所有training可以构成矩阵）向量化，当然也可以说直接就把每个点直接堆叠构成一个更长的向量。只不过这个一个更长的向量的可以分为d段，每一段对应这一个output。\
> 第二部：核函数重构，即采取kronecker product的方式将核函数与output相关性矩阵结合，构造一个新的大的covariance matrix。\
> 第三部：首先回归或是分类
> 
> 这里可以参考的文献有[2][3][4][5],都有比较详细的介绍。\
> [2] Bonilla, Edwin V., Kian M. Chai, and Christopher Williams. "Multi-task Gaussian process prediction."Advances in neural information processing systems. 2008.\
> [3] Boyle, Phillip, and Marcus Frean. "Dependent gaussian processes."Advances in neural information processing systems. 2005.\
> [4] Alvarez, Mauricio A., Lorenzo Rosasco, and Neil D. Lawrence. "Kernels for vector-valued functions: A review."Foundations and Trends® in Machine Learning4.3 (2012): 195-266.\
> [5] Wang, Bo, and Tao Chen. "Gaussian process regression with multiple response variables."Chemometrics and Intelligent Laboratory Systems142 (2015): 159-165.

# Packages

## gptp_multi_output
[`Magica-Chen/gptp_multi_output`](https://github.com/Magica-Chen/gptp_multi_output)

It has two good publications:
- Chen, Zexun, and Bo Wang. "How priors of initial hyperparameters affect Gaussian process regression models." Neurocomputing 275 (2018): 1702-1710.
- Chen, Zexun, Bo Wang, and Alexander N. Gorban. "Multivariate Gaussian and Student $-t $ Process Regression for Multi-output Prediction." arXiv preprint arXiv:1703.04455 (2017).

Both STP and GP, both univariate and multivariate.

This guy (Zexun Chen (陈泽汛)) maintains the collection in Zhihu: \
蓦风星吟，高斯世界下的Machine Learning, https://zhuanlan.zhihu.com/gpml2016

Authors' own comments at Zhihu:
> 不过目前功能还不是很完善，有关于初始超参仍有一些问题，外加局限于回归以及还没有实现加入一些对于大dataset的加速的方法。



## GPmat
[`SheffieldML/GPmat`](https://github.com/SheffieldML/GPmat)

The Sheffield group summarizes all their independent repos since 2015 in this big one.
- > The GPmat toolbox is the 'one stop shop' on github for a number of dependent toolboxes, each of which used to be released independently. Since May 2015 each toolbox is a sub-directory within GPmat. They are included as subtrees from the relevant repositories.

## multigp
[`SheffieldML/multigp`](https://github.com/SheffieldML/multigp)

Seems not integrated into the above `GPmat` yet.


## MTGP
[MTGP - A multi-task Gaussian Process Toolbox](http://www.robots.ox.ac.uk/~davidc/publications_MTGP.php)
> 蓦风星吟：另外就是最近有小伙伴推荐的一个MTGP - A multi-task Gaussian Process Toolbox，同样也木有用过，不过看上去还不错呢，至少功能明确。