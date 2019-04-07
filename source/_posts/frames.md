---
title: frames
comments: true
date: 2019-01-24 16:00:27
updated: 2019-01-24 16:00:27
categories:
tags:
---

# Different frames

EME2000 == J2000 (https://en.wikipedia.org/wiki/Earth-centered_inertial)

ICRF == J2000 (for JPL)
- The ephemerides aren't precise enough to see the difference between the hundredths of arc second difference between the J2000 and ICRF frames. (https://space.stackexchange.com/questions/26259/what-is-the-difference-between-gcrs-and-j2000-frames)

Geocentric Celestial Reference Frame (GCRF) is the Earth-centered counterpart of the International Celestial Reference Frame. (https://en.wikipedia.org/wiki/Earth-centered_inertial)

TEME: 

http://itrf.ensg.ign.fr/



## geocentric system, rotational, ECEF

ECEF: Earth-Centered, Earth-Fixed
- == ECR (https://en.wikipedia.org/wiki/ECEF)
- a geographic and Cartesian coordinate system (save above)

ECR: Earth-Centered Rotational
- == ECEF

ITRS: International Terrestrial Reference **System**
- Realizations of the ITRS are produced by the IERS ITRS Product Center (ITRS-PC) under the name International Terrestrial Reference Frames (ITRF).

ITRF: International Terrestrial Reference Frame
- a realization of ITRS (https://en.wikipedia.org/wiki/International_Terrestrial_Reference_System_and_Frame)
- The difference between the latest WGS84 and the latest ITRF is only a few centimeters. (same above)
- Practical navigation systems are in general referenced to a specific ITRF solution, or to their own coordinate systems which are then referenced to an ITRF solution. (same above)

WGS84: World Geodetic System
- a standard for use in cartography, geodesy, and satellite navigation including GPS. (wikipedia)
- It comprises (wikipedia)
  - a standard coordinate system for the Earth, 
  - a standard spheroidal reference surface (the datum or reference ellipsoid) for raw altitude data, 
  - a gravitational equipotential surface (the geoid) that defines the nominal sea level.

BCRS: barycentric celestial reference system (https://en.wikipedia.org/wiki/Barycentric_celestial_reference_system)
- The focus of the BCRS is on astronomy: exploration of the Solar System and the universe.



## geocentric system, inertial

IERS: International Earth Rotation and Reference Systems Service.
- maintained ITRS and ITRF solutions

GCRS: Geocentric Celestial Reference System (https://en.wikipedia.org/wiki/Barycentric_celestial_reference_system)
- BCRS centered at Earth
- The focus of the GCRS is somewhat more on the navigation of Earth satellites and the geophysical applications they support. The proper functioning of the Global Positioning System (GPS) is directly dependent upon the accuracy of satellite measurements as supported by the GCRS.

GCRF: Geocentric Celestial Reference Frame



## centered at the barycenter of the Solar System

ICRS: International Celestial Reference **System**

ICRF: International Celestial Reference Frame
- a realization of ICRS
- The ICRF is now the standard reference frame used to define the positions of the planets (including the Earth) and other astronomical objects. (https://en.wikipedia.org/wiki/International_Celestial_Reference_Frame)


## others

Most excerpted from Orekit Frames: (https://www.orekit.org/site-orekit-9.2/architecture/frames.html)

MOD: Mean Of Date frame = J2000 + precession evolution

TOD: True Of Date frame = J2000 + precession evolution + nutation

GTOD: Greenwich True Of Date frame = J2000 + precession evolution + Greenwich Apparent Sidereal Time

GCRF --> EME2000
- rotations along three axis, very tiny angles (from Orekit source code, ``EME2000Provider()``)


## softwares
There are two software libraries of IAU-sanctioned algorithms for manipulating and transforming among the BCRS and other reference systems: 
- the Standards of Fundamental Astronomy (SOFA) system 
- the Naval Observatory Vector Astrometry Subroutines (NOVAS).


IERS: International Earth Rotation and Reference Systems Service



A Terrestrial Reference frame provides a set of coordinates of some points located on the Earth's surface



GCRS = GCRF = ICRF = ICRS: small difference with EME2000
所以，skyfield得到的结果，应该不需要转换到EME2000中，可以直接在GCRF下使用
  可以测试orekit中两个坐标系相差多少
https://space.stackexchange.com/questions/26259/what-is-the-difference-between-gcrs-and-j2000-frames


EOP: Earth Orientation Parameters
