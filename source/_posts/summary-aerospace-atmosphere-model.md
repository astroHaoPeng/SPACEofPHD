---
title: aerospace-atmosphere-model
comments: true
mathjax: false
abbrlink: f359ceb0
categories:
  - - Summaries
  - - Academics
    - Aerospace
tags:
  - atmosphere model
  - draft
date: 2019-07-05 11:02:13
updated:
---


# DTM2000

See Orekit implementation [here](https://www.orekit.org/site-orekit-development/apidocs/org/orekit/forces/drag/atmosphere/DTM2000.html).

It is described in the paper: 

> The DTM-2000 empirical thermosphere model with new data assimilation and constraints at lower boundary: accuracy and properties
S. Bruinsma, G. Thuillier and F. Barlier\
> Journal of Atmospheric and Solar-Terrestrial Physics 65 (2003) 1053–1070

This model provides dense output for altitudes beyond 120 km.

The model needs geographical and time information to compute general values, but also needs space weather data : mean and instantaneous solar flux and geomagnetic indices.

Mean solar flux is (for the moment) represented by the F10.7 indices. Instantaneous flux can be set to the mean value if the data is not available. Geomagnetic activity is represented by the Kp indice, which goes from 1 (very low activity) to 9 (high activity).

All these data can be found on the [NOAA (National Oceanic and Atmospheric Administration) website](http://sec.noaa.gov/Data/index.html).