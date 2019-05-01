---
title: 概率统计知识整理
comments: true
abbrlink: de0c06bd
date: 2019-04-15 14:43:39
updated: 2019-04-23 15:01:35
categories: Knowledge base
tags: [math, statistics, summary]
mathjax: true
---

# TODO
已有但未完成的posts的整理：（争取5月底前完成）

- {% post_link moments-method %}

- {% post_link bishop-pattern-2006 %}

- {% post_link almosallam-heteroscedastic-2017%}
<!-- [阅读笔记：Heteroscedastic Gaussian processes for uncertain and incomplete data]() -->

- {% post_link estimation-method%}
<!-- [estimation-method]() -->

- {% post_link all-about-bayesian%}
<!-- [all-about-bayesian]() -->

- {% post_link markov-chain-monte-carlo %}
<!-- [markov-chain-monte-carlo]() -->

- {% post_link RN-gal-uncertainty-2016 %}
<!-- [博士论文 "Uncertainty in Deep Learning" 阅读笔记]() -->

- {% post_link steinwart-support-2008%}

<!-- more -->

# 博文整理阅读记录

## 概率分布
### Student T-distribution
[T分布：一个被啤酒厂发现的关键统计概念](https://blog.csdn.net/lengxiao1993/article/details/81985399)
> 用样本均值计算出来的方差始终（无论样本均值小于或是大于总体实际均值）比用总体均值计算出来的方差要小
> 
> 高斯分布和学生分布是统计学和机器学习中最为重要的连续概率分布的一部分。 t-分布可以用作总体方差未知， 或样本集较小时高斯分布的占位符。 这两种分布有着非常严格和正式的关联关系。

## 假设检验

### T检验
从两个角度通俗和严谨解释了“假设检验”相关的很多概念：p值，H0假设，Ha假设，拒绝假设……
基本上需要的概念全部有了。\
总的来说就是要做一件事：根据再有数据，检验发现 H0 假设很不可能，所以非 H0 （即 Ha）是很可能的。（TODO: 验证这种理解是否正确）
- [决策与风险 胡江堂](https://cosx.org/2008/12/decision-and-risk/)
  - 太浅显，随便看看就好。
- [假设检验初步 胡江堂](https://cosx.org/2010/11/hypotheses-testing)
  - 搜集数据之前，想证明的结论 = Ha；想拒绝的结论 = H0（方便逻辑 / 统计推断的形式）
  - > 需要注意的是，在这里，我强调的是先提出需要检验的假设，然后再搜集收据。这是统计推断的原则之一。如果看到了数据之后再提出假设，你几乎可以得到所有你想要的结果，这是不好的机会主义的倾向。强调这些，是因为在学校里，我们大多是看了别人搜集好的数据之后再做统计练习。
  - 弃真错误$\alpha$，置信水平$1-\alpha$，取伪错误
  - > 在我们的假设检验里，我们认为犯一类错误的后果比犯第二类错误的后果更为严重。
  - p值：H0 为真时，比所得到的样本观察结果更极端的结果出现的概率
    - > 如果 P 值很小，就表明，在原假设为真的情况下出现的那个分布里面，只有很小的部分，比出现的这个事件（比如，Q）更为极端。没多少事件比 Q 更极端，那就很有把握说原假设不对了。
  - > **判定法则**: P 值小于显著性水平α，拒绝原假设。

其实上面两篇只讲了“t-检验”，还有很多不同的[统计检验](https://zh.wikipedia.org/wiki/%E5%81%87%E8%A8%AD%E6%AA%A2%E5%AE%9A)，比如
<img src="{% asset_path wiki-chart.png%}" width="400px" title="参见“特效检验”一行">

### 卡方检验 (Chi-)
[卡方檢定 ON THE CROSS：PEARSON, YATES, FISHER 與精確檢定](https://molecular-service-science.com/2012/08/10/chi-squared-test-pearson-yates-and-fisher/)

## No Free Lunch Theorems

[機器學習裡不存在的免費午餐：NO FREE LUNCH THEOREMS](https://molecular-service-science.com/2017/12/04/no-free-lunch-theorems-in-machine-learning/)
> 也就是說，雖然 AlphaGo 的強大史無前例，但即使不考慮任何技術性細節，直接把超能演算法組合套用在其它問題的計算，也不太可能常常獲得所謂的「免費午餐」。
> 
> NFL 真正帶給我們的啟發是：盲目追求最佳演算法是沒有意義的，但是透過合理使用領域 & 專家知識在特定的議題上，我們將能得到超越(甚至大幅超越)隨機演算法平均的結果。


# 问题


# 感悟

