---
title: GPstuff Learning Notes (GPstuff document v4.6)
comments: true
mathjax: true
abbrlink: 8ac3fab1
date: 2019-11-21 10:21:51
updated: 2019-12-03 11:31:31
categories:
tags:
---

阅读 GPstuff 包中的函数的源代码，对其中注释做的笔记，在 official document 中有些内容没有写。

<!-- more -->
# 理论部分摘抄和注释

## From prior to posterior predictive

<span style="color:red">Bayes</span>

Bayes inference

Observation model: $\bm{y}|\bm{f},\phi \sim \prod_{i=1}^n p(y_i|f_i,\phi)$

GP prior: $f(\bm{x})|\theta \sim \mathcal{GP}\left(m(\bm{x}), k(\bm{x},\bm{x}'|\theta)\right)$

hyperprior: $\vartheta \triangleq [\theta,\phi] \sim p(\theta)p(\phi)$

The <mark>latent function</mark> value $f(\bm{x})$ at fixed $\bm{x}$ is called a <mark>latent variable</mark>.

Any set of function values $\bm{f} \triangleq [f_1,f_2,\dots]^T$ has a multivariate Gaussian distribution
$$
p(\bm{f}|\bm{X},\theta) = N(\bm{f}|\bm{0},\bm{K}_{f,f})
$$

Predict the values $\tilde{\bm{f}}$ at new input locations $\tilde{\bm{X}}$, the <mark>joint distribution</mark> is
$$
\begin{bmatrix}
    \bm{f}\\ \tilde{\bm{f}} 
\end{bmatrix}| \bm{X}, \tilde{\bm{X}}, \theta 
    \sim N\left(\bm{0}, \begin{bmatrix}
                            K_{f,f} & K_{f,\tilde{f}}\\
                            K_{\tilde{f},f} & K_{\tilde{f},\tilde{f}}
                        \end{bmatrix}\right)
$$

The <mark>conditional distribution of $\tilde{\bm{f}}$ given $\bm{f}$</mark> is
$$
\tilde{f} | \bm{f},\bm{X},\tilde{\bm{X}}, \theta \sim N(\bm{K}_{\tilde{f},f}\bm{K}_{f,f}^{-1}\bm{f},\, \bm{K}_{\tilde{f},\tilde{f}}-\bm{K}_{\tilde{f},f}\bm{K}_{f,f}^{-1}\bm{K}_{f,\tilde{f}})
$$

So the <mark>conditional distribution of the latent function $f(\tilde{\bm{x}})$</mark> is also a GP with
- conditional mean function: $\textcolor{green}{\mathbb{E}_{\tilde{\bm{f}}|\bm{f},\theta,\phi}[f(\tilde{\bm{x}})]} = k(\tilde{\bm{x}},\bm{X}|\theta) \bm{K}_{f,f}^{-1} \bm{f}$
- conditional covariance function: $\textcolor{green}{\text{Cov}_{\tilde{\bm{f}}|\bm{f},\theta,\phi}[f(\tilde{\bm{x}})]} = k(\tilde{\bm{x}},\tilde{\bm{x}}') - k(\tilde{\bm{x}},\bm{X}|\theta)\bm{K}_{f,f}^{-1}k(\bm{X},\tilde{\bm{x}}'|\theta)$ <span style="color:red">（不确定等号左边的符号是否正确）</span>

<span style="color:red">以上只是纯理论推导，在没有获得相应的观察的情况下，所以没有涉及到$\bm{y}$，只涉及到了 latent variables $\bm{f}(\bm{x})$ and latent function $\bm{f}$。\
以下开始考虑取得观测数据后的推理。</span>

First inference step is to form <mark>the conditional posterior of the latenet variables $\bm{f}$ given the parameters $\vartheta$</mark> ($\mathcal{D}\triangleq\{\bm{X},\bm{y}\}$) </mark> <span style="color:red">（这里暂时假设已经取得，依赖于 observation model 的选择或设计，在后面会讨论如何计算，实际上除了经典GP都需要用近似方法）</span>
$$
p(\bm{f}|\mathcal{D},\theta,\phi) = \frac{ \overbrace{p(\bm{y}|\bm{f},\phi)}^\text{observation model} \overbrace{p(\bm{f}|\bm{X},\theta)}^\text{GP prior} }{ \int p(\bm{y}|\bm{f},\phi) p(\bm{f}|\bm{X},\theta) d\bm{f} \textcolor{green}{\triangleq p(\bm{y}|\bm{X},\vartheta)}}
\tag{8}
$$


After this, we can marginalize over the parameters $\vartheta$ to obtain the <mark>marginal posterior distribution for the latent vriables $\bm{f}$</mark>
$$
p(\bm{f}|\mathcal{D}) = \int \overbrace{p(\bm{f}|\mathcal{D},\theta,\phi)}^\text{see above} \overbrace{p(\theta,\phi|\mathcal{D})}^\text{hyperprior} d\theta d\phi
$$

The <mark>conditional posterior predictive distribution $p(\tilde{f}|\mathcal{D},\vartheta,\tilde{\bm{x}})$ can be evaluated exactly or approximated, </mark> <span style="color:red">（同样，在后面会讨论如何计算，这里暂时假设已经取得）</span>
$$
\color{red}
\begin{aligned}
p(\tilde{f}|\mathcal{D},\vartheta,\tilde{\bm{x}}) 
&= \int p(\tilde{f},\bm{f}|\mathcal{D},\vartheta,\tilde{\bm{x}}) \, d\bm{f} \\
&= \int \overbrace{ p(\tilde{f}|\bm{f},\bm{X},\vartheta,\tilde{\bm{x}}) }^\text{got from GP prior} \cdot \overbrace{ p(\bm{f}|\mathcal{D},\vartheta) }^\text{got from Bayes' theorem} \, d\bm{f} \\
&\text{(Not sure if this is correct.)}
\end{aligned}
$$

The <mark>posterior predictive distribution $p(\tilde{f}|\mathcal{D},\tilde{\bm{x}})$</mark> is obtained by marginalizing out the parameters $\vartheta$ from $p(\tilde{f}|\mathcal{D},\vartheta,\tilde{\bm{x}})$.

~~The <mark>posterior joint predictive distribution $p(\tilde{\bm{y}}|\mathcal{D},\theta,\phi,\tilde{\bm{x}})$</mark> requires integration over $p(\tilde{f}|\mathcal{D},\vartheta,\tilde{\bm{x}})$.~~ (Usually not used.)

The <mark>marginal predicted distribution for individual $\tilde{y}_i$</mark> is
$$
p(\tilde{y}_i|\mathcal{D},\tilde{\bm{x}}_i,\theta,\phi) = \int p(\tilde{y}_i|\tilde{f}_i,\phi) p(\tilde{f}_i|\mathcal{D},\tilde{\bm{x}}_i,\theta,\phi) \, d\tilde{f}_i
\tag{10}
$$

If the parameters are considered fixed, using GP's marginalization and conditionalization properties (still Gaussian), we can evaluate the <mark>posterior predictive mean $m_p(\tilde{f}|\mathcal{D},\theta,\phi)$</mark> from the conditional mean $\color{green}\mathbb{E}_{\tilde{\bm{f}}|\bm{f},\theta,\phi}[\tilde{\bm{f}}]$ (where $\tilde{\bm{f}} \triangleq f(\tilde{\bm{x}})$) <span style="color:red">（前面推导已经得到）</span>, through marginalizing out the latent variables $\bm{f}$,
$$
m_p(\tilde{f}|\mathcal{D},\theta,\phi) 
= \int \textcolor{green}{\mathbb{E}_{\tilde{\bm{f}}|\bm{f},\theta,\phi}[\tilde{\bm{f}}]}\, p(\bm{f}|\mathcal{D},\theta,\phi) d\bm{f}
\xlongequal{\text{\color{red}代入并保留只与$f$相关的量}} k(\tilde{\bm{x}},\bm{X}|\theta) \bm{K}_{f,f}^{-1} \mathbb{E}_{\bm{f}|\mathcal{D},\theta,\phi}[\bm{f}]
\tag{11}
$$

The posterior predictive covariance between any set of latent variables $\tilde{\bm{f}}$ is <span style="color:red">（这一步的推导是利用了[Wikipedia: Law of total covariance](https://en.wikipedia.org/wiki/Law_of_total_covariance)）</span>
$$
\begin{aligned}
\text{Cov}_{\tilde{\bm{f}}|\mathcal{D},\theta,\phi} [\tilde{\bm{f}}]
&= \mathbb{E}_{\bm{f}|\mathcal{D},\theta,\phi}\left[ \textcolor{green}{\text{Cov}_{\tilde{\bm{f}}|\bm{f},\theta,\phi}[\tilde{\bm{f}}]} \right]
+ \text{Cov}_{\bm{f}|\mathcal{D},\theta,\phi}\left[ \textcolor{green}{\mathbb{E}_{\tilde{\bm{f}}|\bm{f},\theta,\phi}[\tilde{\bm{f}}]} \right] \\
&= \overbrace{\textcolor{green}{\text{Cov}_{\tilde{\bm{f}}|\bm{f},\theta,\phi}[\tilde{\bm{f}}]}}^{\text{independent of $\bm{f}$}} 
+ \underbrace{\text{Cov}_{\bm{f}|\mathcal{D},\theta,\phi}\left[ k(\tilde{\bm{x}},\bm{X}|\theta) \bm{K}_{f,f}^{-1} \bm{f}] \right]}_{k(\tilde{\bm{x}},\bm{X})\bm{K}_{f,f}^{-1}\text{Cov}_{\bm{f}|\mathcal{D},\theta,\phi}[\bm{f}]\bm{K}_{f,f}^{-1}k(\bm{X},\tilde{\bm{x}}')}
\end{aligned}
$$

> 参考 [Wikipedia: Law of total covariance](https://en.wikipedia.org/wiki/Law_of_total_covariance)： $\text{Cov}[X,Y] = \mathbb{E}\left[ \text{Cov}[X,Y|Z]] + \text{Cov}[\mathbb{E}[X|Z], \mathbb{E}[Y|Z] \right]$

Then, the <mark>posterior predictive covariance function $k_p(\tilde{\bm{x}},\tilde{\bm{x}}'|\mathcal{D},\theta,\phi)$</mark> is
$$
k_p(\tilde{\bm{x}},\tilde{\bm{x}}'|\mathcal{D},\theta,\phi) 
= k(\tilde{\bm{x}},\tilde{\bm{x}}'|\theta) - k(\tilde{\bm{x}},\bm{X}|\theta)\left( \bm{K}_{f,f}^{-1}-\bm{K}_{f,f}^{-1}\text{Cov}_{\bm{f}|\mathcal{D},\theta,\phi}\bm{K}_{f,f}^{-1} \right) k(\bm{X},\tilde{\bm{x}}'|\theta)
\tag{13}
$$

So, even if the exact posterior $p(\tilde{f}|\mathcal{D},\theta,\phi) is not available$

## From latents $\bm{y}$ to observations $\bm{y}$

<span style="color:red">Bayes</span>

Gaussian observation model: $y_i \sim N(f_i,\sigma^2)$
$$
p(y_i|f_i,\theta,\overbrace{\phi}^\text{includes $\sigma$}) = \dots
$$

<mark>Marginal likelihood $p(\bm{y}|\bm{X},\theta,\sigma^2)$</mark> is
$$
p(\bm{y}|\bm{X},\theta,\sigma^2) = N(\bm{y}|\bm{0},\bm{K}_{f,f}+\sigma^2\bm{I})
$$

The <mark>conditional posterior of latent variables $\bm{f}$</mark> has analytical solution now, <span style="color:red">(should be done through completing the square. Bishop's book or GPML book should have details.)</span>
$$
\bm{f}|\mathcal{D},\theta,\phi \sim N( \bm{K}_{f,f}(\bm{K}_{f,f}+\sigma^2\bm{I})^{-1}\bm{y},\quad \bm{K}_{f,f}-\bm{K}_{f,f}(\bm{K}_{f,f}+\sigma^2\bm{I})^{-1}\bm{K}_{f,f} )
\tag{15}
$$

Since the conditional posterior of $\bm{f}$ is Gaussian, the posterior process is still a GP, whose mean and covariance function is obtained from Eqs. (11) and (13).

$$
\tilde{f}|\mathcal{D},\theta,\phi \sim \mathcal{GP}(m_p(\tilde{\bm{x}}),\quad k_p(\tilde{\bm{x}},\tilde{\bm{x}}')))
\tag{16}
$$

<span style="color:red">以上公式(15)直接给出了 $\mathbb{E}_{\bm{f}|\mathcal{D},\theta,\phi}[\bm{f}]$ 和 $\text{Cov}_{\bm{f}|\mathcal{D},\theta,\phi}[\bm{f}]$，代入到(11)和(13)中就得到$m_p$ 和 $k_p$。</span>



--------------

# Digging into Demos

## `demo_inputdependentnoise.m`

<mark>All `'type','FULL'`.</mark>

`lik_inputdependentnoise` + `gpcf_sexp + gpcf_exp` (`prior_t` for `lengthScale_prior` and `magnSigma2_prior`) + `'latent_method', 'Laplace'` + `gp_optim`

`lik_t` + `gpcf_sexp` + `'latent_method', 'Laplace'` + `gp_optim`

`1D` and `2D` data

> (line 241) <mark>if flat priors are used</mark>, there might be need to increase gp.latent_opt.maxiter for laplace algorithm to converge properly. `gp.latent_opt.maxiter=1e6`; <mark>（？？这有可能是我算不出来的原因）</mark>

## `demo_regression_robust.m`

<mark>All `'type','FULL'`.</mark>

`lik_gaussian` (`prior_logunif`) + `gpcf_sexp` (`prior_t` and `prior_sqrtunif`) + `gp_optim`

`lik_t` (`prior_loglogunif`, `prior_logunif`) + `gpcf_sexp` + `'latent_method', 'EP'` + `gp_optim`

`lik_t` (`prior_logunif`) + `gpcf_sexp` + <mark>`'latent_method', 'MCMC'`</mark> + <mark>`gp_mc`</mark> 


-----------------------


# 研究具体代码实现

> Note! If the prior is 'prior_fixed' then the parameter in question is considered fixed and it is not handled in optimization, grid integration, MCMC etc.

整个代码包用 structure 实现了类似 OOP 的形式，因为开发时候 MATLAB 对 OOP 的支持还很差。
导致代码很难定位。

## 设置GP结构`gp_set`

`type` - Type of Gaussian process
- 'FULL'   full GP (default)
- 'FIC'    fully independent conditional sparse approximation（需要inducing point `X_u`）
- 'PIC'    partially independent conditional sparse approximation
- 'CS+FIC' compact support + FIC model sparse approximation
- 'DTC'    deterministic training conditional sparse approximation
- 'SOR'    subset of regressors sparse approximation
- 'VAR'    variational sparse approximation


`infer_params` - String defining which parameters are inferred. The default is `covariance+likelihood`.
- 'covariance'     = infer parameters of the covariance functions
- 'likelihood'     = infer parameters of the likelihood
- 'inducing'       = infer inducing inputs (in sparse approximations): W = gp.X_u(:)    
- 'covariance+likelihood' = infer covariance function and likelihood parameters （有什么具体的区别？不是很明白）
- 'covariance+inducing' = infer covariance function parameters and inducing inputs
- 'covariance+likelihood+inducing'


> The additional fields <mark>when the likelihood is not Gaussian</mark> (lik is not `lik_gaussian` or `lik_gaussiansmt`) are:

### `latent_method` and `latent_opt`
`latent_method` - <mark>Method for marginalizing over latent values （什么意思？用likelihood计算predictive时需要对$f^*$进行marginalization，需要对latent value进行积分。参见GPstuff Doc Eq. (10) ）</mark>. Possible methods are 'Laplace' (default), 'EP' and 'MCMC'.\
`latent_opt`    - Additional option structure for the chosen latent method. See default values for options below.
- 'MCMC'
  - method - Function handle to function which samples the latent values @esls (default), @scaled_mh or @scaled_hmc
  - f      - 1xn vector of latent values. The default is [].
- 'Laplace'
  - optim_method  - Method to find the posterior mode: 'newton' (default except for lik_t), 'stabilized-newton', 'fminuc_large', or 'lik_specific' (applicable and default for lik_t)
  - tol
- 'EP'
- 'robust-EP'



> The additional fields needed in sparse approximations are:

`X_u`          - Inducing inputs, no default, has to be set when FIC, PIC, PIC_BLOCK, VAR, DTC, or SOR is used.

`Xu_prior`     - Prior for inducing inputs. The default is prior_unif.

## `gp_optim` Optimize paramaters of a Gaussian process


## `gp_mc`

- `hmc_opt` - Options structure for HMC sampler (see hmc2_opt). **When this is given the <mark>covariance function and likelihood parameters</mark> are sampled with hmc2** (respecting infer_params option). 

- `sls_opt` - Options structure for slice sampler (see sls_opt). **When this is given the <mark>covariance function and likelihood parameters</mark> are sampled with sls (respecting infer_params option)**.

- `latent_opt` - Options structure for latent variable sampler. **When this is given the <mark>latent variables</mark> are sampled with function stored in the gp.fh.mc field in the GP structure.** See gp_set. <mark>（在`gp_set`中设置的 `'latent_method','MCMC','latent_opt',struct('method',@scaled_mh)` 与这里的 `latent_opt` 不同！！比如在这个例子中，这里的 `latent_opt` 实际是设置 `scaled_mh` 的 option。这里容易混淆！）</mark>

- `lik_hmc_opt` - Options structure for HMC sampler (see hmc2_opt). **When this is given <mark>the parameters of the likelihood</mark> are sampled with hmc2.** This can be used to have different hmc options for covariance and likelihood parameters.

- `lik_sls_opt` - Options structure for slice sampler (see sls_opt). <mark>When this is given the <mark>parameters of the likelihood</mark> are sampled with hmc2.</mark> This can be used to have different hmc options for covariance and likelihood parameters.

- `lik_gibbs_opt` - Options structure for Gibbs sampler. Some likelihood function parameters need to be sampled with Gibbs sampling (such as lik_smt). The Gibbs sampler is implemented in the respective lik_* file.




## `*_pak` and `*_unpak`
- Combine \* parameters into one vector.
- Extract \* parameters from the vector.

For `lik_*_pak` and `lik_*_unpak`, this is a mandatory subfunction used for example in energy and gradient computations (calculated by `gp_eg` through calling `gp_e` and `gp_g`).




# 我要用的 likelihood function

## `lik_gaussian` Create a Gaussian likelihood structure

- sigma2       - variance [0.1]
- sigma2_prior - prior for sigma2 [prior_logunif] <mark>（相当于默认$\log(\sigma^2)$是uniform的，所以并不是在$[0,+\inf)$完全uniform的？）</mark>
- n            - number of observations per input (See using average observations below) （不要用这个参数，这个是用来平均 sigma2 的。）

## `lik_t` Create a Student-t likelihood structure 
```
%                  __ n
%      p(y|f, z) = || i=1 C(nu,s2) * (1 + 1/nu * (y_i - f_i)^2/s2 )^(-(nu+1)/2)
%
```

Parameters for Student-t likelihood [default]
- sigma2       - scale squared [1]
- nu           - degrees of freedom [4] （这是 degree of freedom 通常是固定的）
- sigma2_prior - prior for sigma2 [prior_logunif] （为什么是logunif?）
- nu_prior     - prior for nu [prior_fixed] 

Can be infered by:
- Laplace approximation (need `lik_t_ll`, `lik_t_llg`, `lik_t_llg2`, `lik_t_llg3`)
- MCMC (need `lik_t_ll`, `lik_t_llg`)
- EP (need `lik_t_llg2`, `lik_t_tiltedMoments`, `lik_t_siteDeriv`)
- robust-EP (need `lik_t_tiltedMoments2`, `lik_t_siteDeriv2`)


## `lik_gaussiansmt` Create a Gaussian scale mixture likelihood structure with priors producing approximation of the Student's t
The parameters of this likelihood can be inferred only by Gibbs sampling by calling GP_MC.







# 我要用的 covariance function

## `gpcf_sexp` Create a squared exponential (exponentiated quadratic) covariance function

- magnSigma2        - magnitude (squared) [0.1]
- lengthScale       - length scale for each input. [1] This can be either scalar - corresponding to an isotropic function or vector defining own length-scale for - each input direction. <mark>（为每个输入定义不同的length scale，自动选择）</mark>
- magnSigma2_prior  - prior for magnSigma2  [prior_logunif] <mark>（为什么是logunif？保正？）</mark>
- lengthScale_prior - prior for lengthScale [prior_t] <mark>（为什么是prior_t？不需要保正？）</mark>
- metric            - metric structure used by the covariance function [] （不懂）
- selectedVariables - vector defining which inputs are used [all] selectedVariables is short hand for using metric_euclidean with corresponding components
- kalman_deg        - Degree of approximation in type 'KALMAN' [6]（不懂）

实际使用中，把 `demo_regression1.m` 中的 
`lengthScale_prior` 从 `prior_unit` 换成 `prior_logunit`，
`magnSigma2_prior` 从 `prior_logunit` 换成 `prior_unit`，
对 MAP 结果的影响并不大。（猜测是因为在优化过程中，并没有取到对应的负的值，所以没有产生错误，因为在 `inputParser.parse` 中明确要求了 `magnSigma2` 和 `lengthScale` 必须为正。


### 子函数

`gpcf_sexp_lp`: Evaluate the log prior of covariance function parameters, returns $\log p(\theta)$





# 我要用的 priors

## `prior_unif` 

## `prior_sqrtunif` Uniform prior structure for the square root of the parameter
意思是参数如果是 $\theta$ ，那么 $p(\sqrt\theta) \sim \text{Uniform}$ 。
适合于比较把 $\sigma^2$ 整体当作一个参数的情况，然后要求 $\sigma$ 是均匀分布。<mark>（但是这里应该是要求正数才对吧？）</mark>

## `prior_logunif` Uniform prior structure for the logarithm of the parameter
意思是参数如果是 $\theta$ ，那么 $p(\log\theta) \sim \text{Uniform}$ 。

## `prior_t` Student-t prior structure
Parameters for Student-t prior [default]
- mu       - location [0]
- s2       - scale [1]
- nu       - degrees of freedom [4]
- mu_prior - prior for mu [prior_fixed] （这里居然是 fixed，为什么？是否合理？）
- s2_prior - prior for s2 [prior_fixed] （这里居然是 fixed，为什么？是否合理？）
- nu_prior - prior for nu [prior_fixed] （这里居然是 fixed，为什么？是否合理？）

如果参数是 $\theta$ ，那么 $\theta \sim \mathcal{ST}(\mu,\sigma^2,\nu)$ 。
默认参数都是固定的。
<mark>（$\mu$是任意的？$sigma^2$是正的？$\nu$必须是整数）</mark>

在`prior_t_pak`中对`s2`和`nu`进行了`log`变换

查demo中对`prior_t`的prior是怎么设置的。
- `/Volumes/ExternalDisk/git-collections/gpstuff/gp/demo_hierprior.m` pl=prior_t('mu_prior',prior_t); <mark>未看</mark>




# Other hidden functions

## `gp_eg` calls `gp_e`, `gp_g`

- GP_EG: Evaluate the energy function (un-normalized negative marginal log posterior) and its gradient
- GP_E: Evaluate the energy function (un-normalized negative log marginal posterior)
- GP_G: Evaluate the gradient of energy (GP_E) for Gaussian Process

The energy is minus log posterior cost function:
$$
E = EDATA + EPRIOR - \log p(\bm{Y}|\bm{X},\theta) - \log p(\theta)
$$

where $\theta$ represents the parameters (lengthScale, magnSigma2...), $\bm{X}$ is inputs and $\bm{Y}$ is observations (regression) or latent values (non-Gaussian likelihood). 


-----------------------

# 目前实验碰到的一些结论和问题

- (not sure why) 不用 `lik_gaussiansmt`
- `lik_inputdependentnoise()` 只支持 `'type','FULL'`，参见 `gpla_e.m` line 162 的 switch，在 FIC 没有相应的支持
- `'latent_method','MCMC'` 不能和 `gp_optim` 配合使用：(100\% sure)
  - 设置`FIC` 时，在 `gp_g <- gp_eg` 中 line 556 只计算 gradient w.r.t. Gaussian likelihood function parameters，没有考虑 non-Gaussian + MCMC 的情况。
  - `PIC` line 755 同样没有
  - `CS+FIC` line 996 同样没有
  - `DTC`, `VAR`, `SOR` line 1179 同样没有
  - `KALMAN` 不确定
- derivative observations have not been implemented for sparse GPs !!! (see `gp_trcov.m` line 54)
- 在 `gp_set/latent_method` 设置用来 sample latent variables 的算法。 (see `gp_mc` line 341)
- 在使用 `lik_t` + `gp_mc` 时候，必须显示地设置 `latent_opt` 和 `lik_hmc_opt`，不然在 `gp_mc` 中采样时候会出现少对一种进行采样的情况。（不确定）（也不确定对其它likelihood的情况）

## 经验
```
Matrix dimensions must agree.
Error in fminscg (line 182)
    xplus = x + sigma*d;
```
- 报这个错误通常是因为在 `gp_g` 中没有处理相应的 gradient，注意选择匹配的 latent_method。

## 实验记录

1. `FULL` + `lik_gaussian` + `gpcf-sexp` + `MAP` 成功
2. `FULL` + `lik_gaussian` + `gpcf-sexp` + `MCMC` 成功
3. `FIC` + `lik_gaussian` + `gpcf-sexp` + `MAP` 成功
4. `FIC` + `lik_gaussian` + `gpcf-sexp` + `MCMC` 成功
5. `FULL` + `lik_t` + `jitter-1e-3` + `ARD` + `Laplace` + train-only-around-15-steps: 效果完美，输出的1,2,3-SD coverage始终是100% <mark>（为什么overfitting会这么严重？？？）</mark>
6. `FULL` + `lik_t` + `jitter-1e-3` + `Laplace` + train-only-9-steps: 需要把 jitter 减小，有效果，但不好。
7. `FIC-25` + `lik_t` + `jitter-1e-3` + `ARD` + `Laplace` + train-only-around-15-steps:
8. `FULL` + `lik_t` + `jitter-1e-6` + `ARD` + `Laplace` + train-200 + sample-100-no-thining: 效果很好，PML=1.29%, QML123=100%，大约1056秒
9. `FIC-25` + `covariance+likelihood+inducing` + `lik_t` + `jitter-1e-6` + `ARD` + `Laplace` + train-200 + sample-100-thin-60-1: 效果很好，PML=3.97%，QML123=100%，大约需要计算4个小时

不成功的实验：
10. `FIC-25` + `covariance+likelihood+inducing` + `lik_t` + `jitter-1e-6` + `ARD` + `Laplace` + train-1000 + sample-100-thin-60-1: 算了14个多小时只采样完16个……
11. `FULL` + `lik_t` + `jitter-1e-6` + `ARD` + `'latent_method', 'MCMC'` + train-200 + sampleXXX: 相比于实验8，没有任何regression效果，怀疑某些参数的设置有问题


测试以下并总结原因：

1. `FIC-25` + `lik_t` + `MCMC` + `gp_mc` + `GPz-init`：lengthScale 优化出来的结果都一样
1. `FULL` + `lik_t` + `Lapalace` + `gpcf-sexp` + `MAP` 
1. `FULL` + `lik_t` + `Lapalace` + `gpcf-sexp` + `MCMC` 
2. `FULL` + `lik_t` + `EP` + `gpcf-sexp` + `MAP` 
3. `FULL` + `lik_t` + `EP` + `gpcf-sexp` + `MCMC` 
2. `FULL` + `lik_t` + `MCMC` + `gpcf-sexp` + `MAP` 
2. `FULL` + `lik_t` + `MCMC` + `gpcf-sexp` + `MAP` 

## 问题

怎么实现early stop?

怎么实现 relevance vector machine (RVM)?

怎么实现 GPz?




