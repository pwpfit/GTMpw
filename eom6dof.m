function [ air, path, rate, att ] = eom6dof( C )
% 6-DOF equations of model of the GTM.
%
%% Usage and description
%
%   [air, path, rate, att] = eom6dof(C)
%
% Returns the changes in air-path |air|, flight-path |path|, body rates
% |rate|, and attitude |att| as functions of airspeed, angle of attack,
% side-slip angle; flight-path azimuth, inclination, and bank angle; body
% rates; and surface deflections as well as thrust force.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:torbjoern.cunis@onera.fr>
% * Created:    2017-06-23
% * Changed:    2018-05-18
%
% This file is part of GTMpw -- Piece-wise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|    :  angle of attack,                              rad
% * |beta|     :  side-slip angle,                              rad
% * |gamma|    :  flight-path inclination angle,                rad
% * |zeta|     :  rudder deflection (zeta < 0 iff N > 0),       rad
% * |eta|      :  elevator deflection (eta < 0 iff M > 0),      rad
% * |theta|    :  pitch angle,                                  rad
% * |mu|       :  flight-path bank angle,                       rad
% * |xi|       :  aileron deflection (xi < 0 iff L > 0),        rad
% * |rho|      :  air density,                                  slugs/ft^3
% * |phi|      :  bank angle,                                   rad
% * |chi|      :  flight-path azimuth angle,                    rad
% * |psi|      :  heading angle,                                rad
% * |b|        :  reference aerodynamic span,                   ft
% * |c|        :  reference (mean) aerodynamic coord,           ft
% * |g|        :  gravitational constant,                       ft/s^2
% * |l_t|      :  engine location, body z-axis,                 ft
% * |m|        :  aircraft mass,                                slugs
% * |p|        :  yaw rate, body y-axis,                        rad/s
% * |q|        :  pitch rate, body y-axis,                      rad/s
% * |r|        :  roll rate, body y-axis,                       rad/s
% * |*hat|     :  normalized rates, body y-axes                 rad
% * |*_cg|     :  center of gravity, body axes,                 ft
% * |*_cgref|  :  reference center of gravity, body axes,       ft
% * |Cl|       :  aerodynamic coefficient moment body x-axis,   -
% * |Cm|       :  aerodynamic coefficient moment body y-axis,   -
% * |Cn|       :  aerodynamic coefficient moment body z-axis,   -
% * |Cx|       :  aerodynamic coefficient force body x-axis,    -
% * |Cy|       :  aerodynamic coefficient force body y-axis,    -
% * |Cz|       :  aerodynamic coefficient force body z-axis,    -
% * |L|        :  yaw moment, body y-axis,                      lbf-ft
% * |M|        :  pitch moment, body y-axis,                    lbf-ft
% * |N|        :  roll moment, body y-axis,                     lbf-ft
% * |S|        :  reference wing aera,                          ft^2
% * |F|        :  thrust,                                       lbf
% * |V|        :  airspeed,                                     ft/s
%%

% GTM parameters in imperial units
parameters;

%% state & input vector
% X = [V alpha beta | mu gamma chi | phat qhat rhat | phi theta psi]
   V = @(X) X(1);	alpha = @(X) X(2);	beta = @(X) X(3);
  mu = @(X) X(4);   gamma = @(X) X(5);   chi = @(X) X(6);
phat = @(X) X(7);    qhat = @(X) X(8);  rhat = @(X) X(9);
 phi = @(X) X(10);  theta = @(X) X(11);  psi = @(X) X(12);
 
% U = [xi eta zeta | F]
  xi = @(U) U(1);     eta = @(U) U(2);  zeta = @(U) U(3);    F = @(U) U(4);

%% Conversion normalized rates -> body rates
   p = @(X) 2*V(X)*phat(X)/b;
   q = @(X) 2*V(X)*qhat(X)/c;
   r = @(X) 2*V(X)*rhat(X)/b;
   
%% Aerodynamic coefficients
Cx = @(X,U) C.X(alpha(X),beta(X),xi(U),eta(U),zeta(U),phat(X),qhat(X),rhat(X));
Cy = @(X,U) C.Y(alpha(X),beta(X),xi(U),eta(U),zeta(U),phat(X),qhat(X),rhat(X));
Cz = @(X,U) C.Z(alpha(X),beta(X),xi(U),eta(U),zeta(U),phat(X),qhat(X),rhat(X));

Cl = @(X,U) C.l(alpha(X),beta(X),xi(U),eta(U),zeta(U),phat(X),qhat(X),rhat(X));
Cm = @(X,U) C.m(alpha(X),beta(X),xi(U),eta(U),zeta(U),phat(X),qhat(X),rhat(X));
Cn = @(X,U) C.n(alpha(X),beta(X),xi(U),eta(U),zeta(U),phat(X),qhat(X),rhat(X));


%% Forces & moments body axes
Xf = @(X,U) 0.5*rho*S*V(X)^2*Cx(X,U) + F(U);
Yf = @(X,U) 0.5*rho*S*V(X)^2*Cy(X,U);
Zf = @(X,U) 0.5*rho*S*V(X)^2*Cz(X,U);

Lf = @(X,U) 0.5*rho*S*V(X)^2*b*Cl(X,U) + Yf(X,U)*(z_cg-z_cgref) - Zf(X,U)*(y_cg-y_cgref);
Mf = @(X,U) 0.5*rho*S*V(X)^2*c*Cm(X,U) + Zf(X,U)*(x_cg-x_cgref) - Xf(X,U)*(z_cg-z_cgref) + l_t*F(U);
Nf = @(X,U) 0.5*rho*S*V(X)^2*b*Cn(X,U) + Xf(X,U)*(y_cg-y_cgref) - Yf(X,U)*(x_cg-x_cgref);


%% Resulting forces and moments
% effective lift-force, drag-force, side-force
Leff = @(X,U)   Xf(X,U)*sin(alpha(X)) - Zf(X,U)*cos(alpha(X));  %- m*g*cos(gamma(X))*cos(mu(X));
Deff = @(X,U) -(Xf(X,U)*cos(alpha(X)) + Zf(X,U)*sin(alpha(X)))*cos(beta(X)) - Yf(X,U)*sin(beta(X)) + m*g*sin(gamma(X));
Qeff = @(X,U) -(Xf(X,U)*cos(alpha(X)) + Zf(X,U)*sin(alpha(X)))*sin(beta(X)) + Yf(X,U)*cos(beta(X));% + m*g*cos(gamma(X))*sin(mu(X));
   
% resulting moments
Lp = @(X,U) Lf(X,U) - q(X)*r(X)*(Iz-Iy) + p(X)*q(X)*Ixz;
Mq = @(X,U) Mf(X,U) - p(X)*r(X)*(Ix-Iz) - (p(X)^2-r(X)^2)*Ixz;
Nr = @(X,U) Nf(X,U) - p(X)*q(X)*(Iy-Ix) - p(X)*q(X)*Ixz;


%% Changes of air velocity
air.Vdot    = @(X,U) -Deff(X,U)/m;
air.betadot = @(X,U) Qeff(X,U)/(m*V(X));


%% Changes of air path
path.gammadot = @(X,U) (Leff(X,U)*cos(mu(X)) - m*g*cos(gamma(X)))/(m*V(X));
path.chidot   = @(X,U) Leff(X,U)*sin(mu(X))/(m*V(X));


%% Changes of rates
pdot = @(X,U) (Iz*Lp(X,U) + Ixz*Nr(X,U))/(Ix*Iz-Ixz^2);
qdot = @(X,U)          Mq(X,U)          /     Iy;
rdot = @(X,U) (Ixz*Lp(X,U) + Ix*Nr(X,U))/(Ix*Iz-Ixz^2);

rate.phatdot = @(X,U) (0.5*b*pdot(X,U) - air.Vdot(X,U)*phat(X))/V(X);
rate.qhatdot = @(X,U) (0.5*c*qdot(X,U) - air.Vdot(X,U)*qhat(X))/V(X);
rate.rhatdot = @(X,U) (0.5*b*rdot(X,U) - air.Vdot(X,U)*rhat(X))/V(X);


%% Change of attitude
% conversion from air path and aerodynamic angles
sintheta = @(X) cos(alpha(X))*cos(beta(X))*sin(gamma(X)) + cos(alpha(X))*sin(beta(X))*sin(mu(X))*cos(gamma(X)) + sin(alpha(X))*cos(mu(X))*cos(gamma(X));
costheta = @(X) sqrt(1 - sintheta(X)^2);
tantheta = @(X) sintheta(X)/costheta(X);

sinphi = @(X) (-sin(beta(X))*sin(gamma(X)) + cos(beta(X))*sin(mu(X))*cos(gamma(X)))/costheta(X);
cosphi = @(X) sqrt(1 - sinphi(X)^2);

att.phidot   = @(X,~) p(X) + q(X)*sinphi(X)*tantheta(X) + r(X)*cosphi(X)*tantheta(X);
att.thetadot = @(X,~)        q(X)*cosphi(X)             - r(X)*sinphi(X);
att.psidot   = @(X,~)        q(X)*sinphi(X)/costheta(X) + r(X)*cosphi(X)/costheta(X);


end

