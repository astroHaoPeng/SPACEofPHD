---
title: My LaTeX Tricks
comments: true
mathjax: true
abbrlink: 514e25fd
date: 2019-05-23 16:04:48
updated: 2019-05-23 16:04:59
categories: 
  - [Techniques, Softwares]
tags:
  - LaTeX
---

> Write $\LaTeX$ is entertaining.

# Special Commands

Some commands that are not easy to search for. 

## \phantom
Use `\phantom{}` (/'fæntəm/) to generate a empty space with desired horizontal length. 
[Google results of "latex phantom".](https://www.google.com/search?q=latex+phantom&rlz=1C5CHFA_enUS803US807&oq=latex+phantom&aqs=chrome..69i57.233j0j1&sourceid=chrome&ie=UTF-8)

For example:
```latex
\begin{aligned}
A &= B + C \\
  &\phantom{=} + D
\end{aligned}
```
generates
$$
\begin{aligned}
A &= B + C \\
  & + D,
\end{aligned}
$$

while
```latex
\begin{aligned}
A &= B + C + D\\
  &\phantom{=} + E\\
  &\phantom{= B} + E\\
  &\phantom{= B+C} + E\\
\end{aligned}
```
generates
$$
\begin{aligned}
A &= B + C + D\\
  &\phantom{=} + E\\
  &\phantom{= B} + E\\
  &\phantom{= B+C} + E.
\end{aligned}
$$

Notice the alignment at the beginning of the second line.
