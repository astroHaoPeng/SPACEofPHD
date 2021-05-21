---
title: Quaternion in Aerospace (Draft) (something is incorrect!)
comments: true
mathjax: true
abbrlink: 5934ce57
date: 2020-05-18 10:53:32
updated:
categories:
tags:
---


I ran across this [document page of pytransform3d](https://rock-learning.github.io/pytransform3d/rotations.html#euler-angles), and it claims:

> There are two different quaternion conventions: Hamilton’s convention defines `ijk = -1` and the JPL convention (from NASA’s Jet Propulsion Laboratory, JPL) defines `ijk = 1`. We use Hamilton’s convention.

It's not new to know about different definitions (mostly the sequency differs), but what is this `ijk=1` definition? First time to hear about.

Then I continue diving into the [reference source](https://arxiv.org/pdf/1801.07478.pdf) it provided.

Only after this, I found that the problem is not only about the sequence of the components, but about something more fundamental.
So I put down this summary for my future reference.

# $(q_0, q_1, q_2, q_3)$ or $(q_1, q_2, q_3, q_4)$ ?

The answer is it doesn't matter that much.
This is not a mathematical or fundamental difference.

Equations can be easily converted.
Codes can be easily modified.

# $ij=k$ or $ij=-k$

This is about math!

> 1. Harold L. Hallock, Gary Welter, David G. Simpson, and Christopher Rouff, ACS without an attitude, London: Springer, 2017.
- (p.16) Alternatively, one could follow a different convention with quaternion multiplication. Many authors prefer a convention that, although not expressed as such, essentially redefines Hamilton’s hyper-complex commutation relations (Eq. 1.5b above) into $i j = -k, k j = -i, ki = -j$


The quaternion representation is one of
the best characterizations, and this chapter will focus on this representation. The
presentation in this chapter follows the style of [99, 205, 219].


# Which one is used in references?

Will keep updating as I read more references...

## Using $ij=k$ and $(q_0, q_1, q_2, q_3)$
1. Yaguang Yang, Spacecraft Modeling, Attitude Determination, and Control Quaternion-based Approach, Boca Raton, FL : CRC Press, 2019. | “A science publishers book.”: CRC Press, 2019. [[Link]](https://www.taylorfrancis.com/books/9780429822148).


## Using $ij=k$ and $(q_1, q_2, q_3, q_4)$
1. Harold L. Hallock, Gary Welter, David G. Simpson, and Christopher Rouff, ACS without an attitude, London: Springer, 2017.


## Using $ij=-k$ and $(q_1, q_2, q_3, q_4)$

还是没有搞明白为什么这就相当于重新定义了 $ij=-k$

1. F. Landis Markley, and John L. Crassidis, Fundamentals of Spacecraft Attitude Determination and Control, New York, NY: Springer New York, 2014.
1. Malcolm D. Shuster, “The nature of the quaternion”, The Journal of the Astronautical Sciences, vol. 56, Sep. 2008, pp. 359–373.

1. Hanspeter Schaub, and John L. Junkins, Analytical Mechanics of Space Systems (Second Edition), Reston, VA: American Institute of Aeronautics and Astronautics, 2009.\
(p.107) 似乎是默认了与 Rotation matrix 顺序一致的一种，即 $ij=-k$