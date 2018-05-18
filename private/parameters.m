% Design parameters of the generic transport model
% in imperial units.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:torbjoern.cunis@onera.fr>
% * Created:    2017-06-23
% * Changed:    2017-06-23
%
% This file is part of GTMpw -- Piece-wise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|    :  angle of attack,                              rad
% * |gamma|    :  flight-path angle,                            rad
% * |rho|      :  air density,                                  slugs/ft^3
% * |b|        :  reference aerodynamic span,                   ft
% * |c|        :  reference (mean) aerodynamic coord,           ft
% * |g|        :  gravitational constant,                       ft/s^2
% * |Iy|       :  rotational inertia body y-axis                slugs-ft^2
% * |l_t|      :  engine location, body z-axis,                 ft
% * |m|        :  aircraft mass,                                slugs
% * |S|        :  reference wing aera,                          ft^2
% * |w|        :  aircraft weight,                              lbf
% * |x_cg|     :  center of gravity, body x-axis,               ft
% * |x_cgref|  :  reference center of gravity, body x-axis,     ft
% * |z_cg|     :  center of gravity, body z-axis,               ft
% * |z_cgref|  :  reference center of gravity, body y-axis,     ft
%%

GTM = AC_baseparams_T2();
% mean engine position left/right (ft x ft x ft), body frame
eng_pos = (GTM.engl_pos+GTM.engr_pos)/2;
% engine location with respect to cg (ft x ft x ft), body frame
eng_loc = (eng_pos - GTM.cg_pos0);

b   = GTM.b;
c   = GTM.Cbar;
S   = GTM.S;
w   = GTM.w0;

x_cg    = GTM.cg_pos0(1);       x_cgref = GTM.ref_cg(1);
y_cg    = GTM.cg_pos0(2);       y_cgref = GTM.ref_cg(2);
z_cg    = GTM.cg_pos0(3);       z_cgref = GTM.ref_cg(3);
l_t = eng_loc(3);

rho = 0.002321756525427;                         % at GTM standard altitude
g   = convacc(9.80665, 'm/s^2', 'ft/s^2');                %standard gravity

m = w/g;

Ix = GTM.Inertia0(1);
Iy = GTM.Inertia0(2);
Iz = GTM.Inertia0(3);

Ixz = GTM.Inertia0(4);
Iyz = 0;
Ixy = 0;


%% Clear local variables
clear GTM eng_pos eng_loc
