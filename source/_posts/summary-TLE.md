---
title: All about Two-Line Elements
comments: true
categories:
  - Summaries
  - [Academics, Aerospace]
tags:
  - TLE
  - aerospace
  - notes
mathjax: true
abbrlink: '2e650864'
date: 2018-06-13 14:40:41
updated: 2019-07-24 14:02:51
---

This is some collections and summaries of TLE-related papers in my Zotero collection.
Questions and discussions are welcomed.

Publications summarized here are all worth studying.

(Some notes are in Chinese.)

<!-- more -->

# Reviewing Papers about TLE

> Vallado, D. A., and Cefola, P. J., “Two-line element sets–practice and use,” 63rd International Astronautical Congress, Naples, Italy, 2012.
> 
> 总结了2012前已有的关于 TLE 的应用和精度的研究

> Vallado, D., Virgili, B., and Flohrer, T., “Improved SSA Through Orbit Determination of Two-Line Element Sets,” 6th European Conference on Space Debris, Darmstadt, Germnay.: 2013.
> 
> 2013年进一步拓展了上文中的研究到更多的轨道类型


# Generation of TLE sets

目前没有关于如何更新和生成 TLE 的确切信息。

Vallado 通过各种渠道，给出如下描述 [^vallado_fundamentals_1997]：
- JSpOC 每天收集若干次观测数据；
- 观测通过初始的验证和 association 后，进入 OD 环节；
- 使用 SGP4 和数值积分器对观测数据分别进行两次定轨；
- 大约每 8 小时进行一次 snapshot，然后数据通过 space-track.org 公开发布。

STK provides two ways to generate TLE sets based on measurement.

## <mark>IMPORTANT: Enhanced TLE sets</mark> 
Since 2013 the way TLEs are generated has changed significantly for many objects. 
TLEs are now fit to pseudo-observations generated from extrapolated higher-order orbital-theory solutions (Hejduk et al., 2013), as opposed to observations from the SSN directly.
These new TLEs (referred to as enhanced TLEs) are found to differ significantly in terms of errors and behaviour compared to old TLEs (from hereon classic TLEs). [^geul_tle_2017]\
A more obvious distinction between these two types is the argument of latitude (AOL) associated with their state at the TLE epoch. 
The AOL of classic TLEs is around zero degrees (i.e., at the ascending node) and around 90 degrees for enhanced TLEs.


# Intrinsic Problems of TLE

最根本的限制是 TLE 自身的精度不足，没有 covariance 信息，而且 TLE 还会包括 mis-tagged 数据，缺少轨道机动信息。
[^vallado_fundamentals_1997].

TBD.


# Generate Covariance of TLE

TLE has not covariance information published together. 
But covariance is important to 

Peterson et al. [^peterson_covariance_2001] introduced the software `COVGEN` and proposed the pair-wise differencing technique to approximate the TLE covariance.
<mark>I have not find publicly available data yet. Please leave a message if you have.</mark>
> Peterson attempted to generate general error information by relying solely upon the publicly available TLE data. The program used in constructing the error is COVGEN (COVariance GENeration). The COVGEN program produced an estimate of the error and error growth for a given object. It processed a time series of TLEs for a specific object and found the differences in satellite-based coordinate system, performed a quadratic least squares estimate to determine the error growth. Due to uniqueness of its solution and independence on observation residuals, COVGEN provided an independent measure of consistency of the TLEs covariances produced by the true observation residuals. In addition, the COVGEN methodology is adaptable enough that any type of ephemeris data can be used and will produce a covariance comparable in quality to the input data. [^bai_orbital_2017]

Osweiler [^osweiler_covariance_2006] used a similar pair-wise differencing approach in his Master's thesis. 
His method seems to be a simplified version compared to `COVGEN`.
> Osweiler estimated covariance matrix and autocorrelation function of state vector using only publicly available TLEs. He also evaluated the variances and covariances for satellites in different orbits as they change over time. In addition to analyzing the consistency of the covariance estimates, the dependability of propagated TLE state vectors with respect to the length of prediction was evaluated by using the autocorrelation relationship. [^bai_orbital_2017]

Mason [^mason_development_2013] developed a MATLAB tool using Osweiler's approach, adding comparisons to POE and `HPOP` model in STK.

Deguine et al. (CNES) [^deguine_covariance_2002] using the same differencing but they approximate the temporal evolution of the mean error using a 4-th order polynomial, the diagonal of the covariance matrix using a quadrate polynomial, and the other elements in the covariance matrix using a 4-th order polynomial. 
Their method has been tested on four RSOs, among which one of them is operated by CNES and they have accurate true state and covariance information.




# Applications of TLE in Publications

## Space debris related

- Horstmann, A., Kebschull, C., Müller, S., Gamper, E., Hesselbach, S., Soggeberg, K., Ben Larbi, M. K., Becker, M., Lorenz, J., Wiedemann, C., and Stoll, E., “Survey of the Current Activities in the Field of Modeling the Space Debris Environment at TU Braunschweig,” Aerospace, vol. 5, Apr. 2018, p. 37.

Two Line Elements that are provided by JSpOC have a low precision due to the analytic SGP4-propagation theory, which can amount to several hundred
meters [41,42], whereas precise orbit data is not accessible to publicity.

## Improving TLE orbit prediction accuracy

> Levit, C., and Marshall, W., “Improved orbit predictions using two-line elements,” Advances in Space Research, vol. 47, 2011, pp. 1107–1115.
>
> The fitting period is initially set to ten days, typical of the period over which US Space Surveillance Network observations are fitted when generating TLEs for LEO objects (Danielson et al., 2000).
> 
> (p6) Our Initial manual experiments suggested that different fitting periods were optimal for different orbit categories. 
These results are consistent with Alfriend et al. (2002), Danielson et al. (2000).


> - Salvatore Alfano, and David Finkleman, “On selecting satellite conjunction filter parameters,” Acta Astronautica, vol. 99, 2014, pp. 193–200. [[Link]](http://dx.doi.org/10.1016/j.actaastro.2014.02.004).
> 
> In practice, the <mark>three day</mark> interval is the trustworthy lifetime of TLE data. 
Uncertainty often grows unacceptably large when orbit elements are propagated over longer than a few days because there are natural phenomena with measureable effects that occur within that time scale.






# Avaiable SGP4 code

## Space-Track.org
**SGP4 Software Files** by Space-Track.org is available here:\
`SGP4_small_V7.9_LINUX64.tar.gz https://www.space-track.org/documentation#stModal \
(Login required. Account is free.)

> Air Force Space Command (AFSPC) has approved the public release of the unclassified Simplified General Perturbations #4 (SGP4) propagator. SGP4 is an analytic method based on a general perturbation theory for generating ephemerides for satellites in earth-centered orbits. It is the proper means for correctly propagating a USSTRATCOM 18th Space Control Squadron (18 SPCS) Two Line Element (TLE).
> 
> The intent of the public release of SGP4 is to ensure all organizations which operate space systems have a propagator compatible with data products produced by 18 SPCS and to foster interoperability with our partners and allies.

## CelesTrak.com

http://celestrak.com/publications/AIAA/2006-6753/

## Others

https://github.com/astroHaoPeng/tleAnalysis/blob/master/propagation/SGP4.m \
This is a different implementation.
还没有仔细看过这个是否正确。


<!-- Abbreviations -->

*[AFSPC]: US Air Force Space Command
*[HPOP]: High Precision Orbit Propagator, a part of STK.
*[JSpOC]: Joint Space Operations Center, operated by US Air Force Space Command (AFSPC).
*[STK]: Now know as Systems Tool Kit, while previous known as Satellite Tool Kit, belongs to Analytical Graphics，Inc (AGI).
*[POE]: Precise Orbit Ephemeris from the Center for Space Research (CSR) at the University of Texas at Austin.
*[CNES]: Centre National d’Etudes Spatiales

<!-- References -->

[^vallado_fundamentals_1997]: Vallado, D., Virgili, B., and Flohrer, T., “Improved SSA Through Orbit Determination of Two-Line Element Sets,” 6th European Conference on Space Debris, Darmstadt, Germnay.: 2013.

[^peterson_covariance_2001]: Glenn E Peterson, Robert G Gist, and Daniel L Oltrogge, “Covariance Generation for Space Objects using Public Data,” AAS/AIAA Space Flight Mechanics Meeting, Santa Barbara, CA: 2001, p. 16.

[^deguine_covariance_2002]: Béatrice Deguine, Jacques Foliard, Fernand Alby, T. Donath, J. Bouchard, and C. Quillien, “Covariance Modelling In Satellite Collision Risk Activities,” AIAA/AAS Astrodynamics Specialist Conference and Exhibit, Monterey, California: American Institute of Aeronautics and Astronautics, 2002. [[Link]](https://arc.aiaa.org/doi/abs/10.2514/6.2002-4631).

[^osweiler_covariance_2006]: Victor P. Osweiler, “Covariance Estimation and Autocorrelation of NORAD Two-Line Element Sets,” AIR FORCE INST OF TECH WRIGHT-PATTERSON AFB OH SCHOOL OF ENGINEERING AND MANAGEMENT, AIR FORCE INST OF TECH WRIGHT-PATTERSON AFB OH SCHOOL OF ENGINEERING AND MANAGEMENT, 2006. [[Link]](http://www.dtic.mil/docs/citations/ADA446817).

[^mason_development_2013]: James Mason, Development of a MATLAB/STK TLE Accuracy Assessment Tool, in support of the NASA Ames Space Traffic Management Project, 2009. [[Link]](http://arxiv.org/abs/1304.0842).

[^bai_orbital_2017]: Lei Chen, Xian-Zong Bai, Yan-Gang Liang, and Ke-Bo Li, “Orbital Error Analysis Based on Historical Data,” Orbital Data Applications for Space Objects, Springer, Singapore, 2017, pp. 77–105. [[Link]](https://link.springer.com/chapter/10.1007/978-981-10-2963-9_3).

[^geul_tle_2017]: Jacco Geul, Erwin Mooij, and Ron Noomen, “TLE uncertainty estimation using robust weighted differencing,” Advances in Space Research, 2017. [[Link]](http://www.sciencedirect.com/science/article/pii/S0273117717301515).
