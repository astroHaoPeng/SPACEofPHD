---
title: CubeSat Attitude Subsystem and Others
comments: true
mathjax: false
abbrlink: d8533416
categories:
  - Summaries
  - [Academics, Aerospace]
date: 2020-05-16 19:00:03
updated: 2020-05-22 12:36:56
tags:
---

Excerpt some information about the attitude subsystem of CubeSats.

<!-- more -->

# JPL Missions

[JPL missions](https://www.jpl.nasa.gov/cubesat/missions/)

## ASTERIA (JPL + MIT) (August 14, 2017)
- 6U CubeSat (roughly 10 x 20 x 30 cm, 10 kg)
- A set of commercial reaction wheels provided coarse attitude control.
  - Blue Canyon Technologies (Attitude Control Subsystem), 
- Fine pointing control was achieved by tracking a set of guide stars on the CMOS sensor and moving the piezoelectric stage to compensate for residual pointing errors.
  - Ecliptic Enterprises (Focal Plane), 
- Vulcan Wireless (Telecommunications Subsystem), 
- Spaceflight Industries (Flight Computer), 
- pointing stability better than 0.5 arcseconds RMS over 20 minutes 
- pointing repeatability of 1 milliarcsecond RMS from orbit-to-orbit.

Papers to read:
- Pong, C. M., Sternberg, D. C., and Chen, G. T., “Adaptations of Guidance, Navigation, and Control Verification and Validation Philosophies for Small Spacecraft,” Guidance and Control 2019, Advances in the Astronautical Sciences, Breckenridge, CO, February 2019.https://trs.jpl.nasa.gov/handle/2014/46649
- Donner, A., Smith, M.W., "ASTERIA Lessons Learned", Small Satellite Reliability Initiative (SSRI), Technical Interchange Meeting 4 (TIM-4), Boulder, CO, November 2018, https://www.nasa.gov/smallsat-institute/reliability-working-group-4.
- Smith, M. W., Donner, A., Knapp, M., Pong, C. M., Smith, C., Luu, J., Di Pasquale, P., Bocchino, R. L., Jr., Campuzano, B., Loveland, J., Colley, C., Babuscia, A., White, M., Krajewski, J., Seager, S., “On-Orbit Results and Lessons Learned from the ASTERIA Space Telescope Mission,” Proceedings of the 32rd Annual AIAA/USU Conference on Small Satellites, Logan, UT, August 2018, SSC18-I-08, https://digitalcommons.usu.edu/smallsat/2018/all2018/255/.
- Pong, C. M., "On-Orbit Performance & Operation of the Attitude & Pointing Control Subsystems on ASTERIA", Proceedings of the 32rd Annual AIAA/USU Conference on Small Satellites, Logan, UT, August 2018, SSC18-PI-34, https://digitalcommons.usu.edu/smallsat/2018/all2018/361/.
- Bocchino, R., Canham, T., Watney, G., Reder, L., Levison, J., "F Prime: An Open-Source Framework for Small-Scale Flight Software Systems," Proceedings of the 32rd Annual AIAA/USU Conference on Small Satellites, Logan, UT, August 2018, SSC-18-XII-04, https://digitalcommons.usu.edu/smallsat/2018/all2018/328/.

Open source:
- [A Flight Software and Embedded Systems Framework](https://nasa.github.io/fprime/), [GitHub Repo](https://github.com/nasa/fprime)


## CubeRRT (May 21, 2018) (NASA CSLI Program)
The CubeRRT bus is being developed by Blue-Canyon Technologies.

todo: 查姿态信息

## GRIFEX (January 31, 20151)
3U CubeSat

todo: 查姿态信息

## INSPIRE (TBD)
- Star tracker 
- Cold-Gas ACS

todo: 查姿态信息

## IPEX (December 5, 2013)
1U

IPEX is intended to demonstrate automated ground and flight operations of onboard autonomous processing of instrument data to validate the IPM capabilities and approach.

todo: 查姿态信息

## IRIS (TBS)
0.5U

No attitude control.

## ISARA (November 10, 2017)
3U

- A high accuracy MAI-400 Attitude Determination and Control System (ADACS) is used to achieve the required 0.2° pointing accuracy.

todo: 查姿态信息

## Lunar Flashlight (November, 2020 (SLS EM-1)) (PI: Dr. Barbara Cohen (GSFC))
6U

heritage elements from predecessor systems including:
- JPL's INSPIRE (INterplanetary NanoSpacecraft in a Relevant Environment), 
- MARCO (MARs CubeSat One) 
- JPL’s experience with spectrometers, including the Moon Mineralogy Mapper (M3). 

The mission will demonstrate a path where 6U CubeSats could, at a much lower cost than previously thought possible, explore, locate and estimate size and composition of ice deposits on the Moon.

todo: 查姿态信息

## MarCO (May 5, 2018 (with Insight))
6U

Each MarCO's attitude-control system combines a star tracker, Sun sensors, gyroscopes and three-axis reaction wheels for monitoring and adjusting orientation. Accelerating a reaction wheel rotates the spacecraft in the opposite direction from the direction the wheel is spinning.

MarCO's propulsion system uses compressed R236FA gas, a common propellant in fire extinguishers. 
Each MarCO has eight thrusters that can release this cold-gas propellant in different directions from a single, shared tank. 

The thrusters will operate for trajectory adjustments and for desaturating the reaction wheels. 
- MarCO is pioneering CubeSat use of propellant for desaturating attitude-control reaction wheels; Earth-orbiting CubeSats typically control attitude with electromagnet devices that “push” against Earth’s magnetic field, an option not available to MarCO in deep space.

Technology suppliers for MarCO include: 
- Blue Canyon Technologies of Boulder, Colorado, for the attitude-control system; 
- VACCO Industries of South El Monte, California, for the propulsion system; 
- AstroDev of Ann Arbor, Michigan, for electronics; 
- MMA Design LLC, also of Boulder, for solar arrays; 
- Tyvak Nano-Satellite Systems Inc., a Terran Orbital Company in San Luis Obispo, California, for the CubeSat dispenser system.

[Attitude Determination, Control, and Propulsion](https://directory.eoportal.org/web/eoportal/satellite-missions/m/marco)
- Blue Canyon Technologies is providing 
  - the XACT (fleXible ADCS Cubesat Technology) attitude control unit, which includes
    - a star tracker, 
    - gyro, 
    - coarse sun sensors, 
    - 3-axis reaction wheels. 
  - Several modifications have been made to the base unit to include 
    - an additional coarse sun sensor 
    - control of the thruster system. 
  - In addition, the software has been modified to account for deep space trajectories and related items.

The onboard micro propulsion system, built by Vacco, contains 8 thrusters – 4 canted for attitude control, and 4 for TCMs (Trajectory Correction Maneuvers). Vacco’s single tank design houses all electronics, valves, and propellant. The propellant is R-236FA, a cold-gas propellant often used in fire extinguishers. MarCO uses a cold gas propulsion system with a capability of 755 Ns, providing in excess of 40 m/s of TCM ΔV, enough for what is needed for a Mars-bound mission. The thrusters will operate for trajectory adjustments and for desaturating the reaction wheels. -The XACT system commands the thrusters to fire both for reaction wheel desaturation, as well as for the TCMs. For safety, power control of the propulsion system is maintained by the C&DH.

## MCubed-2 (December 5, 2013 on L-39)

- MCubed-2 utilizes a passive magnetic attitude control subsystem to achieve a proper orientation for Earth-imaging. 
  - The assembly consists of a single permanent magnet aligned on one CubeSat body axis, along with additional magnetic hysteresis materials aligned on each additional perpendicular body axis.
- 


## RainCube (May 21, 2018 (NASA CSLI Program))
6U

- sensors
  - 3 reaction wheels
  - 3 torque coils
  - 2 star trackers
  - 1 IMU
- the vehicle operating in LVLH (Local Vertical Local Horizontal) attitude for one continuous orbit of radar operations and three orbits of sun-pointing to recharge.

<img src="{% asset_path RaInCube_AutoD.jpeg%}" width="400px" title="Cited from [eoportal.org](https://directory.eoportal.org/web/eoportal/satellite-missions/r/raincube) (image credit: NASA/JPL RainCube Team).">

## TEMPEST-D (May 21, 2018)
6U

- includes an ultra-precise attitude control system that allows for accurate knowledge and fine-pointing of the satellite payload.
- BCT XACT-50 (fleXible ADCS Cubesat Technology-50) for 6U CubeSats
- Spacecraft Pointing Accuracy, ±0.003º (1σ) for 2 axes; ±0.007º (1σ) for 3rd axis



# Shanghai Engineering Centre for Microsatellites

## STU-2A
3U

- Design:
  - Attitude Determination Precision ≤1°(3σ)
  - Pointing Accuracy ≤2°(3σ)
  - Attitude Stabilization Precision ≤0.1°/sqyat
- The basic algorithm is TRIAD, which determines the attitude by use of the knowledge from two non-parallel measuring vectors.
- A UKF algorithm is combined into the TRIAD algorithm to improve the attitude accuracy.

<img src="{% asset_path STU-2A.png%}" width="400px" title="ADCS Subsystem Architecture.">
