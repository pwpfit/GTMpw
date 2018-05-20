# GTMpw : Piece-wise polynomial model of the GTM

Over the past decades, the Generic Transport Model (GTM) developed by NASA and Boeing (https://software.nasa.gov/software/LAR-17625) has contributed significantly to analysis and control approaches of civil aircraft. This repository provides an open-source, full-envelope model of the aerodynamic coefficients and equations of motions of the GTM by piece-wise polynomial data fitting.

## Usage & License

For the use of the equations of motion code, it is required to have the [GTM Design Simulation](https://github.com/nasa/GTM_DesignSim) installed. After cloning the `GTMpw` main repository, it might therefore necessary to do `git submodule init` to resolve the dependencies. Finally, please make sure that the folder `gtm/gtm_design/config` can be found by MATLAB.

`GTMpw` is published under the GNU General Public License v3 (GPL-3). `GTM_DesignSim` is published under NASA Open Source Agreement v1.3 as *GTM Design Simulation, LAR-17625: Flight Dynamics Simulation of a Generic Transport Model.*

## References

Torbjørn Cunis et al. *Piece-wise polynomial model of the aerodynamic coefficients of the generic transport model and its equations of motion*. Technical Report, ONERA -- The French Aerospace Lab & French Civil Aviation School, Toulouse, France, 2018.
