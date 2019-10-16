# GTMpw : Piecewise polynomial model of the Generic Transport Model

Over the past decades, the Generic Transport Model (GTM) developed by NASA and Boeing ([NASA/LAR-17625](https://software.nasa.gov/software/LAR-17625)) has contributed significantly to analysis and control approaches of civil aircraft. This repository provides an open-source, full-envelope model of the aerodynamic coefficients and equations of motions of the GTM by piecewise polynomial data fitting.

## Usage & License

For the use of the equations of motion code, it is required to have the [GTM Design Simulation](https://github.com/nasa/GTM_DesignSim) installed. After cloning the `GTMpw` main repository, it might therefore necessary to do `git submodule init` to resolve the dependencies. Finally, please make sure that the folder `gtm/gtm_design/config` can be found by MATLAB.

- `GTMpw` is published under the GNU General Public License v3 (GPL-3) and available at GitHub under [pwpfit/GTMpw](https://gihub.com/pwpfit/gtmpw). 
- `GTM_DesignSim` is published under NASA Open Source Agreement v1.3 as *GTM Design Simulation, LAR-17625: Flight Dynamics Simulation of a Generic Transport Model.*
- `AErOOtools` is published under the GNU Lesser General Public License v2.1 (LGPL-2.1) and available at GitHub under [tcunis/AErOOtools](https://github.com/tcunis/aerootools).

## References

Torbjørn Cunis et al. *Piecewise polynomial modeling for control and analysis of aircraft dynamics beyond stall*. Journal of Guidance, Control, and Dynamics 42(4)949-957, 2019. [doi:10.2514/1.G003618](https://doi.org/10.2514/1.G003618)

Torbjørn Cunis et al. *Piecewise polynomial model of the aerodynamic coefficients of the generic transport model and its equations of motion*. Technical Report, ONERA -- The French Aerospace Lab & French Civil Aviation School, Toulouse, France, 2018. [hal-01808649](https://hal.archives-ouvertes.fr/hal-01808649)
