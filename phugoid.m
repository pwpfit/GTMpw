function [ Vdot, gammadot, varargout ] = phugoid( C, Eq )
% Longitudinal phugoid model
% derived from the GTM design simulation by the pwpfit toolbox.
%
%% Usage and description
%
%   [Vdot, gammadot, M] = phugoid(C)
%   [...] = phugoid(..., Eq)
%
% Returns change of flight speed |Vdot|, change of flight-path angle
% |gammadot|, and pitch moment |M| as functions of flight speed,
% flight-path angle, elevator deflection, thrust, angle of attack, and
% normalized pitch rate.
%
%
%   [Vdot, gammadot, qdot, Thetadot, qosc] = phugoid(...)
%
% Returns change of pitch angle |Thetadot| and change of normalized pitch
% rate |qdot|, too, as well as the output pitch rate |qosc| as function of
% flight speed and normalized pitch rate.
%
% Given aerodynamic coefficients must be functions of angle of attack, 
% elevator deflection, and normalized pitch rate. Aerodynamic coefficients 
% can be given either for force body x- and z-axis and moment body y-axis,
%
%   Cx, Cz, Cm; 
%
% or aerodynamic lift and drag force and moment body y-axis, 
%
%   Clift, Cdrag, Cm.
%
% If the equilibrium point |Eq| is given, non-linear functions are 
% represented by their polynomial approximiation around Eq, where 
%
%   Eq = [V0 gamma0 eta0 T0 alpha0 qhat0]^T.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:torbjoern.cunis@onera.fr>
% * Created:    2016-12-14
% * Changed:    2018-05-18
%
% This file is part of GTMpw -- Piece-wise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|    :  angle of attack,                              rad
% * |gamma|    :  flight-path angle,                            rad
% * |gammadot| :  change in flight-path angle,                  rad/s
% * |eta|      :  elevator deflection,                          rad
% * |rho|      :  air density,                                  slugs/ft^3
% * |b|        :  reference aerodynamic span,                   ft
% * |c|        :  reference (mean) aerodynamic coord,           ft
% * |Cdrag|    :  aerodynamic drag coefficient,                 -
% * |Clift|    :  aerodynamic lift coefficient,                 -
% * |Cm|       :  aerodynamic coefficient moment body y-axis,   -
% * |Cx|       :  aerodynamic coefficient force body x-axis,    -
% * |Cz|       :  aerodynamic coefficient force body z-axis,    -
% * |g|        :  gravitational constant,                       ft/s^2
% * |l_t|      :  engine location, body z-axis,                 ft
% * |m|        :  aircraft mass,                                slugs
% * |M|        :  pitch moment, body y-axis,                    lbf-ft
% * |qosc|     :  pitch rate, body y-axis,                      rad/s
% * |qhat|     :  normalized pitch rate, body y-axis            rad
% * |S|        :  reference wing aera,                          ft^2
% * |F|        :  thrust,                                       lbf
% * |V|        :  airspeed,                                     ft/s
% * |Vdot|     :  change in airspeed,                           ft/s^2
% * |x_cg|     :  center of gravity, body x-axis,               ft
% * |x_cgref|  :  reference center of gravity, body x-axis,     ft
% * |z_cg|     :  center of gravity, body z-axis,               ft
% * |z_cgref|  :  reference center of gravity, body y-axis,     ft
%%

% GTM parameters in imperial units
parameters;


%% Polynomials
if exist('Eq', 'var') && isreal(Eq)
    % sine partial sum (order 5 polynomial)
    sin3 = @(x) x - x^3/6 + x^5/120;

    % cosine partial sum (order 4 polynomial)
    cos3 = @(x) 1 - x^2/2 + x^4/24;

    % inverse partial sum (order 3 polynomial)
    inv = @(x, x0) 1/x0 - 1/x0^2*(x-x0) + 2/x0^3*(x-x0)^2 - 6/x0^4*(x-x0)^3;
else
    % non-polynomial functions
    sin3 = @sin;
    cos3 = @cos;
    
    inv = @(x, x0) 1/x;
    
    % default equilibrium
    Eq = zeros(5, 1);
end


%% States & Inputs
V     = @(X) X(1,:);
gamma = @(X) X(2,:);
alpha = @(X) X(4,:);
qhat  = @(X) X(3,:);
eta   = @(U) U(1,:);
T     = @(U) U(2,:);

V0 = Eq(1);


%% Inline functions for aerodynamic coefficients
if isfield(C, 'lift')
    [C.x, C.z] = convcoeff(C.drag, C.lift, 'xz', sin3, cos3);
else
    [C.drag, C.lift] = convcoeff(C.x, C.z, 'draglift', sin3, cos3);
end


%% Output
% from Normalized pitch rate
% in rad/s
qosc = @(X, U)    ...
            2*V(X).*qhat(X)/c;

%% Pitch moment
% as given by the GTM simulation, cf. block GTM_T2/Aero/Coeff. Eval.

% pitch moment in lbf-ft
% [M]    = [rho]*[V]^2*[S]*[c]*[Cm] ~ [rho]*[V]^2*[S]*[c]*[Cz]*[x_cg] 
%                                              ~ [m]*[g]*[x_cg] ~ [l_t]*[T]
%        = (1 slug/ft^3)*(1 ft/s)^2*(1 ft^2)*(1 ft)
%                                ~ (1 slug/ft^3)*(1 ft/s)^2*(1 ft^2)*(1 ft)
%                             ~ (1 slug)*(1 ft/s^2)*(1 ft) ~ (1 ft)*(1 lbf)
%        =  1 slug*ft^2/s^2 = (1 slug*ft/s^2)*(1 ft)
%        =  1 lbf-ft.
M = @(X, U)         ...
         (                                                                  ...
           0.5*rho*V(X).^2*S*c.*C.m(alpha(X),eta(U),qhat(X))                ...
           - 0.5*rho*V(X).^2*S.*C.z(alpha(X),eta(U),qhat(X))*(x_cgref-x_cg) ...
           + 0.5*rho*V(X).^2*S.*C.x(alpha(X),eta(U),qhat(X))*(z_cgref-z_cg) ...
           + l_t*T(U)                                                       ...
         );
                 
%% Phugoid model
% extended model including pitch rate
% based on KDC+2013, Eq. (10)

% change in speed, in ft/s^2
% [Vdot] = ([T] ~ [rho]*[V]^2*[S]*[Cdrag] ~ [m]*[g])/[m]
%        = (1 lbf ~ (1 slug/ft^3)*(1 ft/s)^2*(1 ft^2)
%                                           ~ (1 slug)*(1 ft/s^2))/(1 slug)
%        = (1 slug*ft/s^2 ~ 1 slug*ft/s^2 ~ 1 slug*ft/s^2)/(1 slug)
%        =  1 ft/s^2.
Vdot = @(X, U)      ...
              (                                                         ...
                T(U).*cos3(alpha(X))                                    ...
                - 0.5*rho*V(X).^2*S.*C.drag(alpha(X), eta(U), qhat(X))  ...
                - m*g*sin3(gamma(X))                                    ...
              )/m;

% change in flight-path angle, in rad/s = s^-1
% [gammadot] = ([T] ~ [rho]*[V]^2*[S]*[Clift] ~ [m]*[g])/([m]*[V])
%        = (1 lbf ~ (1 slug/ft^3)*(1 ft/s)^2*(1 ft^2)
%                                ~ (1 slug)*(1 ft/s^2))/((1 slug)*(1 ft/s))
%        = (1 slug*ft/s^2 ~ 1 slug*ft/s^2 ~ 1 slug*ft/s^2)/(1 slug*ft/s)
%        = (1 slug*ft/s^2)/(1 slug*ft/s)
%        =  1 s^-1
gammadot = @(X, U)  ...
              (                                                         ...
                T(U).*sin3(alpha(X))                                    ...
                + 0.5*rho*V(X).^2*S.*C.lift(alpha(X), eta(U), qhat(X))  ...
                - m*g*cos3(gamma(X))                                    ...
              ).*inv(V(X), V0)/m;

% change in pitch rate, in rad/s^2
qdot = @(X, U)    ...
              (                         ...
                0.5*c/Iy*M(X, U)        ...
                - qhat(X).*Vdot(X, U)   ...
              ).*inv(V(X), V0);
                              
% change in pitch angle, in rad/s
Thetadot = @(X, U)	...
                2*V(X)/c.*qhat(X);
                              
                              
%% Return
if nargout <= 3
    varargout = {M};
else
    varargout = {qdot Thetadot qosc};
end

end
