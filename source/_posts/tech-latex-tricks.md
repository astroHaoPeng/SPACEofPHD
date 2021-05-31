---
title: My LaTeX Tricks
comments: true
mathjax: true
abbrlink: 514e25fd
date: 2019-05-23 16:04:48
updated: 2020-03-24 17:33:17
categories: 
  - [Techniques, Software]
tags:
  - LaTeX
  - tricks
---

{% note success %}
:mortar_board:\
:smirk: Writing neat $\LaTeX$ is fun and enjoyable.\
:rocket:
{% endnote %}

# Useful Commands

Some commands that are not easy to search for. 

<!-- more -->

## `\phantom{}`
Use `\phantom{}` (/'fæntəm/) to generate a empty space with desired horizontal length. 
[Google results of "latex phantom".](https://www.google.com/search?q=latex+phantom&rlz=1C5CHFA_enUS803US807&oq=latex+phantom&aqs=chrome..69i57.233j0j1&sourceid=chrome&ie=UTF-8)

For example:
```
\begin{aligned}
A &= B + C + D\\
  &\phantom{=} + E
\end{aligned}
```
generates (Notice the alignment at the beginning of the second line)
$$
\begin{aligned}
A &= B + C + D\\
  &\phantom{=} + E
\end{aligned}
$$

## `\raisebox{}{}`
The baseline of an image is at the bottom. You could use \raisebox to shift it up. Use half of \height, which stands for the height of the box to be raised.

```latex
\raisebox{-.5\height}{\includegraphics{some_picture}}
```

# My Preambles

## Common
```latex
%%%%%%%% personal preamble starts %%%%%%%%
% better to keep the importing order

\graphicspath{ {./figs/} }             % path to figures
\DeclareGraphicsExtensions{.pdf,.png}  % loading types and orders of figures

% to-be-clarified
%\usepackage{mathtools} % mathtools 取代 amsmath
\usepackage{amssymb,bm}

\usepackage{color}

\usepackage{hyperref} % color the hyperlink rather than box it %%% already loaded in aiaa-pretty
\hypersetup{colorlinks=true,linkcolor=blue,citecolor=blue,breaklinks=true,urlcolor=blue}

\usepackage[all]{hypcap} % make the hyperlink to point at the upper border of a figure of table, rather than to point to its caption.

% [must use]
\urlstyle{same} % use same font for hyperlink

% [must use]
\usepackage{breakcites}

% [must use]
\usepackage{cleveref}
\crefname{equation}{Eq.}{Eqs.} \Crefname{equation}{Equation}{Equations}
\crefname{figure}{Fig.}{Figs.} \Crefname{figure}{Figure}{Figures}
\crefname{table}{Table}{Tables} \Crefname{table}{Table}{Tables}
\crefname{section}{Sec.}{Secs.} \Crefname{section}{Section}{Sections}% allow refer to multiple equations and change cross-reference name

% [optional function]
%\usepackage{threeparttable} % 在 table 下面添加注释
\usepackage{multirow}

\usepackage{subfigure}
%\usepackage{placeins} % 使用 \FloatBarrier 可以控制图片在subsection中

%\usepackage{setspace}  %
%\onehalfspacing        % set line space to 1.5
%\doublespacing         % set line space to 2.0

%\usepackage{listings}                                % include codes
%\lstset{basicstyle=\small\ttfamily,breaklines=true}  % setting codes format

\usepackage[yyyymmdd,hhmmss]{datetime}  % define data sequence

% to-be-clarified
\DeclareMathSizes{10.95}{10.95}{7}{5}  % vary math fonts

%%%%%%%% personal preamble ends %%%%%%%%
```


## Special for `pdflatex`

```latex
% [must use] & [put at the beginning]
% make ligatures copyable correctly
\usepackage[T1]{fontenc}     % oriented to output, that is, what fonts to use for printing characters
                             % [must use] make ligatures copyable

% [usually not necessary]
%\usepackage[utf8]{inputenc}  % allow input utf8 chars.
```

## Special for `xelatex`

```latex
% [not needed]
%\usepackage[T1]{fontenc}     % oriented to output, that is, what fonts to use for printing characters
                              % [must use] make ligatures copyable
% [not needed]
%\usepackage[utf8]{inputenc}  % allow input utf8 chars.
```


# Problems and Solutions 
Only keep a record of those ot easy to search for a solution.

## Half-solved

### Case-01
> ~~"Fragile" problem with `\caption` and `\newcommand` with an optional argument.~~
<!-- will get an error, so have to put them in a code block -->
```latex
Use a command with an optional parameter defined by `\newcommand[1][]{\ph}{#1}` will fail in the figure caption, 
if called via `\caption{\ph[k]}`, but success via `\caption{\ph}`.
Don't quite understand the background principle, but it is related to something called `fragile command` and `robust command`.
Many posts say it could be solved by replace `\newcommand` with `\DeclareRobustCommand`,
but in my case the **SOLUTION** is to use `\caption{\protect{\ph[k]}}` instead.
```
It turns out that this is incorrect, at least not fully correct. 
This problem roots in the template of `AAS.cls` for the American Astronautical Society (AAS) conference.
Using `\newline` rather than `\\` in the caption solves the problem perfectly.


## Completely-solved


# Workflows

When | Then
:----- | :--------------
Prepare a single equation. | `codecogs` is best.
Write one paragraph including both inline and display equations. | `vscode + markdown plugin` is better, then copy-paste to texstudio.
Revise context and equations. | `texsutio inline preview` is more convenient.