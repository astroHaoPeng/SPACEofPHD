---
title: Keras
comments: true
mathjax: false
date: 2020-04-29 14:10:00
updated:
abbrlink:
categories:
tags:
---

> TensorFlow backend

[EarlyStopping](https://keras.io/callbacks/#earlystopping)


`model.fit(..., callbacks=[EarlyStopping(monitor='val_loss', patience=5, verbose=1, mode='min', restore_best_weights=True)], ...)`



# Reproducibility of results

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