---
title: Reading Notes of Analytical Mechanics of Space Systems (Second Edition)
comments: true
mathjax: true
abbrlink: 95a90a1
date: 2020-05-19 12:01:26
updated:
categories:
  - [Notes, Book Note]
tags:
---

> Hanspeter Schaub, and John L. Junkins, Analytical Mechanics of Space Systems (Second Edition), Reston, VA: American Institute of Aeronautics and Astronautics, 2009.

I just roughly read section 3, mainly about the attitude basics and kinematics.

<!-- more -->


# 3. Rigid Body Kinematics

## 3.2 Direction Cosine Matrix



Use the shorthand **vectrix notation** ~~（这里似乎和linear algebra中对basis的表示不同：linear algebra中通常把基底也表示为列向量，但是这里把基底作为了行向量，所以在后续对[C]的定义和运算中，就会存在一个转置T的区别。）~~ <mark>（已经搞明白了，见本节后面的中文讨论）</mark>
$$
\{\hat{\bm{n}}\} \equiv 
\begin{Bmatrix} \hat{\bm{n}}_1 \\ \hat{\bm{n}}_2 \\ \hat{\bm{n}}_3 \end{Bmatrix}
\qquad
\{\hat{\bm{b}}\} \equiv 
\begin{Bmatrix} \hat{\bm{b}}_1 \\ \hat{\bm{b}}_2 \\ \hat{\bm{b}}_3 \end{Bmatrix}
\tag{3.1}
$$
$\mathcal{B}$ is a generic rigid body;\
$\mathcal{N}$ can be a inertial coordinate system.

$$
\hat{\bm{b}}_1 = \cos\alpha_{11}\hat{\bm{n}}_1 + \cos\alpha_{12}\hat{\bm{n}}_2 + \cos\alpha_{13}\hat{\bm{n}}_3
\tag{3.2}
$$
where $\alpha_{ij}$ is the angle between $\hat{\bm{b}}_i$ and $\hat{\bm{b}}_j$.

The direction cosine matrix is
$$
\{\hat{\bm{b}}\} = [C] \{\hat{\bm{n}}\} = \dots
\tag{3.5}
$$
$$
\{\hat{\bm{n}}\} = [C]^T \{\hat{\bm{b}}\} = \dots
\tag{3.7}
$$
where $C_{ij} = \{\hat{\bm{b}}\}_i \cdot \{\hat{\bm{n}}_j\} = \cos\alpha_{ij}$.

In a standard coordinate transformation setting, the $[C]$ matrix is typically not restricted to projecting one set of base vectors from one reference frame onto another. Rather, the most powerful feature of the direction cosine is the ability to **directly project (or transform) an arbitrary vector, with components written in one reference frame, into a vector with components written in another reference frame.**\
<mark>（vector是固定不动的，只是对components in frame进行变换。这是[passive transformation](https://en.wikipedia.org/wiki/Active_and_passive_transformation)。）</mark>

$$
\bm{v} 
= \{\bm{v}_b\}^T\{\hat{\bm{b}}\} 
= \{v_{b_1},v_{b_2},v_{b_3}\} \begin{Bmatrix} \hat{\bm{b}}_1 \\ \hat{\bm{b}}_2 \\ \hat{\bm{b}}_3 \end{Bmatrix}
= v_{b_1}\hat{\bm{b}}_1 + v_{b_2}\hat{\bm{b}}_2 + v_{b_3}\hat{\bm{b}}_3
\tag{3.15}
$$
$$
\bm{v} 
= \{\bm{v}_n\}^T\{\hat{\bm{n}}\} 
= \{v_{n_1},v_{n_2},v_{n_3}\} \begin{Bmatrix} \hat{\bm{n}}_1 \\ \hat{\bm{n}}_2 \\ \hat{\bm{n}}_3 \end{Bmatrix}
= v_{n_1}\hat{\bm{n}}_1 + v_{n_2}\hat{\bm{n}}_2 + v_{n_3}\hat{\bm{n}}_3
\tag{3.16}
$$

Using Eq. (3.5) or (3.7)
$$
\bm{v} 
= \{\bm{v}_b\}^T\{\hat{\bm{b}}\} 
= \textcolor{red}{\{\bm{v}_b\}^T [C]} \{\hat{\bm{n}}\}
= \textcolor{red}{\{\bm{v}_n\}^T} \{\hat{\bm{n}}\}
$$
So,
$$
\{\bm{v}_b\} = [C] \{\bm{v}_n\}
\tag{3.17}
$$

(p.84)\
Let us use the following notation to label the various direction cosine matrices.
The matrix $[BN]$ maps vectors written in the N frame into vectors written in the $\mathcal{B}$ frame. 
Analogously, the matrix $[FB]$ maps vectors in the $\mathcal{B}$ frame into $\mathcal{F}$ frame vectors and so on.


{% note info no-icon %}
My derivation below:

If the basis of the frame is expressed as in the linear algebra,

$$
\bm{b}_1 = \cos\alpha_{11}\bm{n}_1 + \cos\alpha_{12}\bm{n}_2 + \cos\alpha_{13}\bm{n}_3
$$

$$
\{\bm{b}_1, \bm{b}_2, \bm{b}_3\} = \{\bm{n}_1, \bm{n}_2, \bm{n}_3\} 
\begin{bmatrix}
    \cos\alpha_{11} & \cos\alpha_{21} & \cos\alpha_{31} \\
    \cos\alpha_{12} & \cos\alpha_{22} & \cos\alpha_{32} \\
    \cos\alpha_{13} & \cos\alpha_{23} & \cos\alpha_{33} 
\end{bmatrix}
= \{\bm{n}_1, \bm{n}_2, \bm{n}_3\} [C]^T
$$

$$
\{\bm{b}_1, \bm{b}_2, \bm{b}_3\} \begin{pmatrix} v_{b_1} \\ v_{b_2} \\ v_{b_3} \end{pmatrix} 
= \{\bm{n}_1, \bm{n}_2, \bm{n}_3\} \textcolor{red}{[C]^T \begin{pmatrix} v_{b_1} \\ v_{b_2} \\ v_{b_3} \end{pmatrix}} 
= \{\bm{n}_1, \bm{n}_2, \bm{n}_3\} \textcolor{red}{\begin{pmatrix} v_{n_1} \\ v_{n_2} \\ v_{n_3} \end{pmatrix}}
$$

$$
\begin{pmatrix} v_{b_1} \\ v_{b_2} \\ v_{b_3} \end{pmatrix} = [C] \begin{pmatrix} v_{n_1} \\ v_{n_2} \\ v_{n_3} \end{pmatrix}
\tag{same to 3.17}
$$

<mark>【结论】</mark>结果是一样的，$[C] = [BN]$ maps vector components in $\mathcal{N}$ to components in $\mathcal{B}$.

？？基底的表达方式，并没有改变 $[C]$ 的本质形式，只是会影响向量与基底的表达形式，所以不会影响到

？？矛盾：$[BN]$ 即把 $\mathcal{N}$ 变到 $\mathcal{B}$，又把 $\{\}^N$ 变到 $\{\}^B$？\
抑或，$[BN]$ 把 $\{\}^N$ 变到 $\{\}^B$，$[BN]^{-1}$ 把 $\mathcal{N}$ 变到 $\mathcal{B}$ \
$[BN]$ 是对坐标进行变换，是 active transformation？\
$[BN]^{-1}$ 是对变量进行变换，是 passive transformation？\
书中把基底的表达加了一个转置，导致 $[BN]^{-1}$ 同时成为了两种变换，为什么不会产生矛盾？\
或者说矛盾被隐藏在哪里？看后续文章中定义新坐标系的时候，是否都使用列向量的形式定义坐标系。
**！！基底和坐标都表示为了列向量，基底和坐标本来（在代数中的定义）应该是直接相乘的，现在变成了转置后相乘（更改了定义，所以隐藏了矛盾？只是形式上坐标系和向量的表述不统一了，似乎没有其它的矛盾。80%确定）**

{% endnote %}

$$
[\dot{C}] = - [\tilde{\bm{\omega}}] [C]
\tag{3.27}
$$

$$
[\dot{BN}] = - [\tilde{\bm{\omega}}_{\mathcal{B}/\mathcal{N}}] [BN]
\tag{3.28}
$$
where the skew-symmetric tilde matrix is
$$
[\tilde{\bm{\bm{\omega}}}] = 
\begin{bmatrix} 0&-\omega_3&\omega_2 \\ \omega_3&0&-\omega_1 \\ -\omega_2&\omega_1&0 \end{bmatrix}
$$



## 3.3 Euler Angles

The kinematic differential equation of the (3-2-1) Euler angles

$$
\begin{pmatrix} \dot\psi\\\dot\theta\\\dot\phi \end{pmatrix}
= \frac{1}{\cos\theta} \begin{bmatrix} 0&\sin\phi&\cos\phi \\ 0&\cos\phi\cos\theta&-\sin\phi\cos\theta \\ \cos\theta&\sin\phi\sin\theta&\cos\phi\sin\theta \end{bmatrix}
\phantom{\begin{matrix}\\\\\\\end{matrix}}^\mathcal{B} \begin{pmatrix} \omega_1\\\omega_2\\\omega_3 \end{pmatrix}
\tag{3.57}
$$

Kinematic equations for other sets of Euler angles can be obtained similarly, see Appendix B of the textbook.

## 3.4 Principal Rotation Vector

> (p.102) \
> the principal rotation vector is not well suited for use in small motion feedback control type applications where the reference state is the zero rotation. 
> 
> less attractive to describe large arbitrary rotations as compared to some other, closely related, attitude parameters that will be presented in the next few sections.


## 3.5 Euler Parameters (Quaternions)
Another popular set of attitude coordinates are the four Euler parameters (quaternions).

$$
\bm{\beta} = (\beta_0 , \beta_1, \beta_2, \beta_3 )^T
$$

$$
\begin{aligned}
\beta_0 &= \pm \frac{1}{2} \sqrt{C_{11}+C_{22}+C_{33}+1} \\
\beta_1 &= ( C_{23} - C_{32} ) / (4\beta_0) \\
\beta_2 &= ( C_{31} - C_{13} ) / (4\beta_0) \\
\beta_3 &= ( C_{12} - C_{21} ) / (4\beta_0)
\end{aligned}
\tag{3.94}
$$


If $[BN]$ defines DCM that transform vector components in $\mathcal{N}$ to those in $\mathcal{B}$, 
then the converted quaternion $\bm{\beta}$ describes the attitude of the $\mathcal{B}$ frame relative to the $\mathcal{N}$ frame.

Kinematic equations (taking the derivative of $\beta_i$, then substituting $\dot{C}_{ij}$ from Eq.(3.27), and using Eq.(3.94) to turn back to $\beta_i$):
$$
\begin{pmatrix}\dot\beta_0\\\dot\beta_1\\\dot\beta_2\\\dot\beta_3\end{pmatrix} 
= \frac{1}{2} \begin{bmatrix}
                0&-\omega_1&-\omega_2&-\omega_3\\
                \omega_1&0&\omega_3&-\omega_2\\
                \omega_2&-\omega_3&0&\omega_1\\
                \omega_3&\omega_2&-\omega_1&0
                \end{bmatrix}
\begin{pmatrix}\beta_0\\\beta_1\\\beta_2\\\beta_3\end{pmatrix}
\tag{3.104}
$$

$$
\begin{pmatrix}\dot\beta_0\\\dot\beta_1\\\dot\beta_2\\\dot\beta_3\end{pmatrix} 
= \frac{1}{2} \begin{bmatrix}
                \beta_0&-\beta_1&-\beta_2&-\beta_3\\
                \beta_1&\textcolor{red}{\beta_0}&\textcolor{green}{-\beta_3}&\textcolor{green}{\beta_2}\\
                \beta_2&\textcolor{green}{\beta_3}&\textcolor{red}{\beta_0}&\textcolor{green}{-\beta_1}\\
                \beta_3&\textcolor{green}{-\beta_2}&\textcolor{green}{\beta_1}&\textcolor{red}{\beta_0}
                \end{bmatrix}
\begin{pmatrix}0\\\omega_1\\\omega_2\\\omega_3\end{pmatrix}
\tag{3.105}
$$
More concisely,
$$
\dot{\bm{\beta}} = \frac{1}{2} [B(\bm{\beta})] \, {}^\mathcal{B}\bm{\omega}
\tag{3.106}
$$
with
$$
[B(\bm{\beta})] = \begin{bmatrix}
                    -\beta_1&-\beta_2&-\beta_3\\
                    \textcolor{red}{\beta_0}&\textcolor{green}{-\beta_3}&\textcolor{green}{\beta_2}\\
                    \textcolor{green}{\beta_3}&\textcolor{red}{\beta_0}&\textcolor{green}{-\beta_1}\\
                    \textcolor{green}{-\beta_2}&\textcolor{green}{\beta_1}&\textcolor{red}{\beta_0}
                  \end{bmatrix}
\tag{3.107}
$$

Define $\bm{\epsilon} = (\beta_1,\beta_2,\beta_3)^T$, then
$$
\dot\beta_0 = \frac{1}{2} \bm{\epsilon}^T\bm{\omega} = \frac{1}{2} \bm{\omega}^T \bm{\epsilon}  \tag{3.111}
$$
$$
\dot{\bm{\epsilon}} = \frac{1}{2} [T] \, \bm{\omega}  \tag{3.112}
$$
with
$$
[T(\beta_0,\bm{\epsilon})] = \textcolor{red}{\beta_0 [I_{3\times3}]} + \textcolor{green}{[\tilde{\bm{\epsilon}}]}  \tag{3.113}
$$


## 3.9 Homogeneous Transformations

Consider both translation and rotation, 
$$
{}^\mathcal{N}\bm{r}_p = {}^\mathcal{N}\bm{r}_{\mathcal{B}/\mathcal{N}} + [NB] {}^\mathcal{B}\bm{r}_p  \tag{3.197}
$$

Define **homogeneous transformation**,
$$
[\mathcal{NB}] = \begin{bmatrix} NB & {}^\mathcal{N}\bm{r}_{\mathcal{B}/\mathcal{N}} \\ \bm{0}_{1\times3} & 1 \end{bmatrix}
\tag{3.198}
$$
and the position vector
$$
{}^\mathcal{B}\bm{p} = \begin{bmatrix}
    {}^\mathcal{N}\bm{r}_p \\ 1
\end{bmatrix}
\tag{3.199}
$$
then we have
$$
{}^\mathcal{N}\bm{p} = [\mathcal{NB}] \, {}^\mathcal{B}\bm{p}
\tag{3.200}
$$

This formula is very convenient when computing the position coordinate of a chain of bodies such as are typically found in **robotics applications**.