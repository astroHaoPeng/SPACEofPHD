---
title: Tensorflow and Keras
comments: true
mathjax: false
abbrlink: 7665f2a
date: 2020-04-29 14:10:00
updated: 2020-07-29 18:14:23
categories:
  - [Techs, Software]
  - [Academics, Machine Learning]
tags:
---

If you are looking at this post, it means you are also pretty much a newbie to `TensorFlow`, like me, as of 2020-07-29.


# tensorflow.keras

`Keras` is already part of `TensorFlow`, so, use `from tensorflow.keras import ***`, not ~~`from keras import ***`~~.

> TensorFlow backend

## Early stopping
[EarlyStopping](https://keras.io/callbacks/#earlystopping)


`model.fit(..., callbacks=[EarlyStopping(monitor='val_loss', patience=5, verbose=1, mode='min', restore_best_weights=True)], ...)`



# Reproducibility of results

> TL;DR\
> Set all random seeds\
> Use `tensorflow.keras` instead standalone `keras`\
> Use `model.predict_on_batch(x).numpy()` for predicting speed.


Put this at the very beginning should work. 
```python
import os, random
import numpy as np
import tensorflow as tf
random.seed(42)  # python random seed
np.random.seed(42)  # numpy random seed
tf.random.set_seed(42)  # tensorflow randome seed
os.environ['TF_DETERMINISTIC_OPS'] = '1'  # ensure GPU reproducibility
```

- [How to Get Reproducible Results with Keras](https://machinelearningmastery.com/reproducible-results-neural-networks-keras/)

Update all codes to `tf.keras` SEEMS solved the reproducibility problem.

BUT, the speed is 10x slower than using `keras` directly.
After some digging, I find a workaround:
- Use `model.predict_on_batch(x)` to do sequential predictions.
  - Because `model.predict()` will trigger the same calculation path as in `model.fit()`, including gradient computation or something I don't understand. See [here](https://github.com/tensorflow/tensorflow/issues/33340) for details.
  - Also, use `model(x)` for predicting seems speed up a lot.
  - Using `model.compile(..., experimental_run_tf_function=False)` seems also speed up a lot.
- This will cause another problem, the returned value should be a `ndarray`, but somehow I got a `tftensor`. So, I need to use `model.predict_on_batch(x).numpy()` to get the `ndarray` from the `tftensor` explicitly. 
  - I guess this is a bug and would be fixed in the future, because the docs say `predict_on_batch()` always returns a numpy.

`predict()` v.s. `predict_on_batch()`:
- `predict()` is used for training
- `predict_on_batch()` is used for pure predicting
- They have a huge speed difference on small testing data. Guess I would never understand the background causes.



# About Pure TensorFlow

GradientTape 是新版的自动微分器
> [TensorFlow学习（四）：梯度带(GradientTape)，优化器(Optimizer)和损失函数(losses)](https://blog.csdn.net/xierhacker/article/details/53174558)


# General Optimization

[(Not read yet) An overview of gradient descent optimization algorithms](https://ruder.io/optimizing-gradient-descent/)
