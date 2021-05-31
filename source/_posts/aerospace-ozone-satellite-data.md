---
title: aerospace-ozone-satellite-data
comments: true
mathjax: false
abbrlink: 8842be7
categories:
  - Summaries
  - [Academics, Aerospace]
tags:
  - Ozone
  - Remote Sensing
  - Academics
  - Aerospace
  - Data Source
  - draft
date: 2020-11-23 16:58:06
updated:
---

# NASA Goddard Earth Sciences Data Information and Services Center (GESDISC)

## AIRS on EOS Aqua (Atmospheric Infrared Sounder on NASA's Aqua Satellite) (Level 3 product)

### AIRS/Aqua L3 Daily Standard Physical Retrieval (AIRS-only) 1 degree x 1 degree V006 (AIRS3STD)

https://disc.gsfc.nasa.gov/datasets/AIRS3STD_006/summary?keywords=ozone\
The Atmospheric Infrared Sounder (AIRS) is a **grating spectrometer** (R = 1200) aboard the second Earth Observing System (EOS) polar-orbiting platform, EOS Aqua.
~~In combination with the Advanced Microwave Sounding Unit (AMSU) and the Humidity Sounder for Brazil (HSB), AIRS constitutes an innovative atmospheric sounding group of visible, infrared, and microwave sensors.~~ 
The AIRS Only **Level 3 Daily Gridded Product** contains standard retrieval means, standard deviations and input counts. 
Each file covers **a temporal period of 24 hours** for either the descending (equatorial crossing North to South @1:30 AM local time) or ascending (equatorial crossing South to North @1:30 PM local time) orbit. 
The data starts at the international dateline and **progresses westward** (as do the subsequent orbits of the satellite) so that neighboring gridded cells of data are no more than a swath of time apart (about 90 minutes). 
~~The two parts of a scan line crossing the dateline are included in separate L3 files, according to the date, so that data points in a grid box are always coincident in time.~~ 
The edge of the AIRS Level 3 gridded cells is at the date line (the 180E/W longitude boundary). 
~~When plotted, this produces a map with 0 degrees longitude in the center of the image unless the bins are reordered.~~ 
~~This method is preferred because the left (West) side of the image and the right (East) side of the image contain data farthest apart in time.~~ 
~~The gridding scheme used by AIRS is the same as used by TOVS Pathfinder to create Level 3 products.~~ 
The daily Level 3 products have gores between satellite paths where there is no coverage for that day. 
The geophysical parameters have been averaged and binned into 1 x 1 deg grid cells, from -180.0 to +180.0 deg longitude and from -90.0 to +90.0 deg latitude. 
~~For each grid map of 4-byte floating-point mean values there is a corresponding 4-byte floating-point map of standard deviation and a 2-byte integer grid map of counts.~~ 
~~The counts map provides the user with the number of points per bin that were included in the mean and can be used to generate custom multi-day maps from the daily gridded products.~~
~~ The thermodynamic parameters are: Skin Temperature (land and sea surface), Air Temperature at the surface, Profiles of Air Temperature and Water Vapor, Tropopause Characteristics, Column Precipitable Water, Cloud Amount/Frequency, Cloud Height, Cloud Top Pressure, Cloud Top Temperature, Reflectance, Emissivity, Surface Pressure, Cloud Vertical Distribution.~~ 
The trace gases parameters are: **Total Amounts and Vertical Profiles of** Carbon Monoxide, Methane, and **Ozone**. 
~~The actual names of the variables in the data files should be inferred from the Processing File Description document.~~

[Get Data](https://airs.jpl.nasa.gov/data/get-data/standard-data/)


https://airs.jpl.nasa.gov/data/readers-tools/\
https://disc.gsfc.nasa.gov/information/documents?title=AIRS%20Documentation\
[AIRS Version 7 Level 3 Product User Guide](https://docserver.gesdisc.eosdis.nasa.gov/public/project/AIRS/V7_L3_Product_User_Guide.pdf)\
[Batched readme files in tar fromat for IDL and Matlab swath and grid data.](http://docserver.gesdisc.eosdis.nasa.gov/repository/Mission/AIRS/3.8_ScienceDataSoftwareTools/IDL_MATLAB_READERS.tar.gz)\
[Batched files in tar format, with sample Input/Output](http://docserver.gesdisc.eosdis.nasa.gov/repository/Mission/AIRS/3.8_ScienceDataSoftwareTools/V6_FORTRAN_C_READERS.tar.gz)




## AIRS/Aqua L3 Daily Support Product (AIRS-only) 1 degree x 1 degree V006 (AIRS3SPD)

https://disc.gsfc.nasa.gov/datasets/AIRS3SPD_006/summary?keywords=ozone

The L3 support products are similar to the L3 standard products but contain fields which are not fully validated, or are inputs or intermediary values. Because no quality control information is available for some of these fields, values from failed retrievals may be included.


## AIRS/OMI (Level 2 and 3)

https://aura.gsfc.nasa.gov/omi.html

The Ozone Monitoring Instrument (OMI) instrument can distinguish between aerosol types, such as smoke, dust, and sulfates, and measures cloud pressure and coverage, which provides data to derive tropospheric ozone.

OMI derives its heritage from NASA's Total Ozone Mapping Spectrometer (TOMS) instrument and the European Space Agency (ESA) Global Ozone Monitering Experiment (GOME) instrument (on the ERS-2 satellite). It can measure many more atmospheric constituents than TOMS and provides much better ground resolution than GOME (13 km x 25 km for OMI vs. 40 km x 320 km for GOME).

OMI measures ozone profiles (in the UV) complimentary to those measured by TES and HIRDLS (in the IR) and MLS (in the microwave).

OMI measures the total column amount of atmospheric ozone NO2 as well as lower atmospheric dust, smoke, and other aerosols.

OMI is a nadir-viewing wide-field-imaging spectrometer, giving <mark>daily global coverage</mark>.

## Aura validation data center (AVDC)

https://avdc.gsfc.nasa.gov/index.php

Data archived at the AVDC originates from several special Aura validation campaigns, NASA aircraft and balloon deployments, ......


## OMPS-NPP L3 NM Ozone (O3) Total Column 1.0 deg grid daily V2 (OMPS_NPP_NMTO3_L3_DAILY)

https://disc.gsfc.nasa.gov/datasets/OMPS_NPP_NMTO3_L3_DAILY_2/summary?keywords=ozone

The OMPS-NPP **L3 NM Ozone (O3) Total Column** 1.0 deg grid daily product provides total ozone measurements from the Ozone Mapping and Profiling Suite (OMPS) Nadir-Mapper (NM) instrument on the Suomi-NPP satellite.
The **level-3 gridding algorithm** is used to combine the orbital OMPS cross track measurements into a daily map product with a fixed global grid. 
~~Grid cells are computed as weighted averages of a given parameter derived for the field-of-views that overlay the given cell.~~ 
~~The current version of this product includes UV aerosol index and reflectivity at 331 nm retrievals as well.~~

Each granule contains data for a full day. 
Spatial coverage is global (-90 to 90 degrees latitude), with **a resolution of 1.0 degree in longitude and 1.0 degree in latitude**, and array size of 360 by 180. 
The files are written using the Hierarchical Data Format Version 5 or **HDF5**. 

[README Document](https://snpp-omps.gesdisc.eosdis.nasa.gov/data/SNPP_OMPS_Level3/OMPS_NPP_NMTO3_L3_DAILY.2/doc/README.OMPS_NPP_NMTO3_L3_DAILY.2.pdf)




# JPL: AIRS/OMI Combined Products (Using Level 2 AIRS and OMI)

https://tes.jpl.nasa.gov/multi-instrument-products/airs-omi/

The AIRS/OMI level 2 (L2) ozone profile product has a spatial sampling and the retrieval characteristics of ozone profiles equivalent to TES L2 standard data product, demonstrating the feasibility of extending TES L2 data record via a multiple spectral retrieval approach.

We refer the reader to the [TES Data Users’ Guide  [Herman and Kulawik, Eds., 2018]](https://tes.jpl.nasa.gov/pdf/TES_Level_2_Data_Users_Guide_V7.0.pdf) for details on the data structure, \
but recommend the user treat the joint AIRS/OMI version 1 as <mark>preliminary data</mark>


----------

# Mission

Mission | Instrument | Data product | Operator/Provider/Maintainer
----    | --------- | --------- | --------- 
Arus | AIRS | L2, L3 | Goddard
Arus | OMI | L2, L3 | Goddard
Arus | AIRS/OMI combined |  | JPL
Suomi-NPP | OMPS | L3 | Goddard <mark>（这个似乎是我想要的！！！）</mark>


Abbr. | Full
------|-----
OMI | Ozone Monitoring Instrument
OMPS | Ozone Mapping and Profiling Suite
OMPS/NM | Nadir-Mapper
