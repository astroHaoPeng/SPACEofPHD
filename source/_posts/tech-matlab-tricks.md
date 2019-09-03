---
title: My MATLAB Tricks and Functions
categories:
  - - Techniques
    - Software
  - - Notes
    - Others
tags:
  - MATLAB
  - tricks
abbrlink: b5ad18d4
mathjax: false
comments: true
date: 2017-06-05 00:00:00
updated: 2019-06-28 17:59:15
---

`inputParser`

(run across at: GPstuff-4.7/gp/gp_pred.m)


`linkprop`

`Hatchfill`

`Hatchfill2`

<!-- more  -->

# 需要掌握的一些 MATLAB 函数

`/lang/assert`

`/strfun/string`


# Bugs

## `websave`

`websave` will convert the space in an query to `+`, not `%20`, which could cause troubles.

```matlab
url = 'https://www.space-track.org/ajaxauth/login';
query = ['https://www.space-track.org/basicspacedata/',...
        'query/class/tle/',...
        'EPOCH/',start,'--',stop,'/NORAD_CAT_ID/',norad_id,'/',...
        'orderby/TLE_LINE1 ASC/format/tle'];
websave(filename, url, 'identity',username, 'password',password, 'query',query, options);
```

After a log digging, the problems exists at\
`matlab.net.internal.urlencode(str, noEncodeChars, true);`\
This `true` is hard-coded and will set to "encode space as + instead of %20", according to the comments in the function.

There is not easy solution to this, as of 2019/08/01.
