---
title: Python for SPACE.of.PHD (keep updating)
comments: true
mathjax: false
abbrlink: d8d3f23a
date: 2020-02-16 16:46:18
updated: 2020-04-29 12:27:59
categories:
tags:
---


Previously, I used MATLAB for my research. 
I'm familiar with the development environment in the MATLAB IDE. 

Now I'm trying to migrate everything into Python, and of course there rises many problems. 
This blog is used to track all my problems and, more importantly, solutions.


<!-- more -->


# Python environment

After some searching, comparison, and trials, I decide to:
- Use `conda` to manage packages, more specifically, `Anaconda`.
- `conda` can manage virtual environments.

Summary of my commonly used `conda` commands:
- `conda activate`
- `conda list`
- `conda install`

Remember to add `conda-forge` as the secondary source.

Sometimes people need to use `pip` to install some less standard packages, but for me, that's never a problem.


# Pythons IDEs and Setups for Scientific Studies

## PyCharm

No reason not to use PyCharm on a powerful enough platform, by which I mean several CPU cores, enough RAMs, a large display, and a fast network. 

> My platform: macOS Catalina, Version 10.15.3, which is full with annoying bugs.

### Problems and Solutions of PyCharm

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


## Spyder


## VS Code



# Learning Materials

- [MATLAB vs Python: Why and How to Make the Switch](https://realpython.com/matlab-vs-python/)


- [Probabilistic Programming in Python: PyMC3](https://docs.pymc.io/)