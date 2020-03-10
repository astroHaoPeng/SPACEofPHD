---
title: Pythons IDEs and Setups for Scientific Studies
comments: true
mathjax: false
abbrlink: 4f5f96bf
date: 2020-02-29 16:31:41
updated:
categories:
tags:
---



Previously, I used MATLAB for my research. 
I'm familiar with the development environment in the MATLAB IDE. 

Now I'm trying to migrate everything into Python, and of course there rises many problems. 
This blog is used to track all my problems and, more importantly, solutions.


# PyCharm

No reason not to use PyCharm on a powerful enough platform, by which I mean several CPU cores, enough RAMs, a large display, and a fast network. 

> My platform: macOS Catalina, Version 10.15.3, which is full with annoying bugs.

## Python environment

After some searching, comparison, and trials, I decide to:
- Use `conda` to manage packages, more specifically, `Anaconda`.
- `conda` can manage virtual environments.

Summary of useful `conda` commands:



## Problems and Solutions

Interactive Debug Console is not on. 
- Click in the menu bar, `Tools | Python Console`
- Toggle on in the Preferences, `Build, Execution, Deployment > Console > Always show debug console`

Matplotlib is always blocking. After plotting one figure, you must close it to continue other operations, or it will always stay in front.
- Unsolved yet.
- https://stackoverflow.com/questions/28269157/plotting-in-a-non-blocking-way-with-matplotlib/42674363
- https://youtrack.jetbrains.com/issue/PY-23413?_ga=2.211083607.370055198.1583008297-1851937972.1579559522

No `External Documentation URL` (not sure if these are correct)
- `numpy`: https://docs.scipy.org/doc/numpy/reference/generated/{class.name}.html#{module.name}.{element.qname}
- 