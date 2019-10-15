classdef Gtm6dof < aerootools.EOM6
% 6-DOF equations of motion for the Generic Transport Model.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:tcunis@umich.edu>
% * Created:    2019-03-17
% * Changed:    2019-03-17
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|    :  angle of attack,                              rad
% * |gamma|    :  flight-path inclination angle,                rad
% * |gammaAir| :  air-path inclination angle                    rad
% * |gammadot| :  change in inclination angle,                  rad/s
% * |zeta|     :  rudder deflection,                            rad
% * |eta|      :  elevator deflection,                          rad
% * |Theta|    :  pitch angle,                                  rad
% * |mu|       :  air-path bank angle,                          rad
% * |xi|       :  aileron deflection,                           rad
% * |rho|      :  air density,                                  kg/m^3
% * |Phi|      :  roll angle,                                   rad
% * |chi|      :  air-path/flight-path azimuth,                 rad
% * |Psi|      :  heading angle,                                rad
% * |b|        :  reference aerodynamic span,                   m
% * |c|        :  reference (mean) aerodynamic coord,           m
% * |Cl|       :  aerodynamic coefficient moment body x-axis,   -
% * |Cm|       :  aerodynamic coefficient moment body y-axis,   -
% * |Cn|       :  aerodynamic coefficient moment body z-axis,   -
% * |Cx|       :  aerodynamic coefficient force body x-axis,    -
% * |Cy|       :  aerodynamic coefficient force body y-axis,    -
% * |Cz|       :  aerodynamic coefficient force body z-axis,    -
% * |F|        :  thrust,                                       N
% * |g|        :  gravitational constant,                       m/s^2
% * |I*|       :  inertia *-axis,                               kg-m^2
% * |L|        :  roll moment, body x-axis,                     N-m
% * |m|        :  aircraft mass,                                kg
% * |M|        :  pitch moment, body y-axis,                    N-m
% * |N|        :  yaw moment, body z-axis,                      N-m
% * |p|        :  roll rate, body x-axis,                       rad/s
% * |q|        :  pitch rate, body y-axis,                      rad/s
% * |r|        :  yaw rate, body z-axis,                        rad/s
% * |*hat|     :  normalized * rate,                            rad
% * |S|        :  reference wing aera,                          m^2
% * |VA|       :  airspeed,   VA = |uA vA wA|                   m/s
% * |VK|       :  path speed, VK = |uK vK wK|                   m/s
% * |VW|       :  wind speed,                                   m/s
% * |Vdot|     :  change in speed,                              m/s^2
% * |x_cg|     :  center of gravity, body x-axis,               m
% * |x_cgref|  :  reference center of gravity, body x-axis,     m
% * |z_cg|     :  center of gravity, body z-axis,               m
% * |z_cgref|  :  reference center of gravity, body y-axis,     m
% * |Xf|       :  force body x-axis,                            N
% * |Yf|       :  force body y-axis,                            N
% * |Zf|       :  force body z-axis,                            N
%
%% See
%
% See also aerootools.EOM6
%%

properties (Access=protected)
    AC;
    AM;
end

methods
    function obj = Gtm6dof(am, ac, g)
        % Instance of 6-DOF equations of motion
        % with aircraft model |AM|, aerodynamic coefficients |AC|, and
        % optional gravitational constant |g|.
        obj.AM = am;
        
        if nargin > 1
            obj.AC = ac;
            obj.Ac.g = g;
        else
            [obj.AC, obj.AC.g] = gtm2si;
        end
    end
end

methods (Static)
    function par = mu(varargin)
        % Parameters mu = [eps]
        %
        % Overriding EOM6.mu
        par = eom.pkg.GtmParameters(varargin{:});
    end
end

methods (Access=protected)
    function CR = Cr(obj, X, U, mu, varargin)
        % aerodynamic force coefficients
        %
        % implementing EOM6.Cr
        what = obj.omegahat(X,U,mu,varargin{:});
        
        CR = [
            obj.AM.Cx(alpha(X),beta(X),xi(U),eta(U),zeta(U),what(1),what(2),what(3),eps(mu));
            obj.AM.Cy(alpha(X),beta(X),xi(U),eta(U),zeta(U),what(1),what(2),what(3),eps(mu));
            obj.AM.Cz(alpha(X),beta(X),xi(U),eta(U),zeta(U),what(1),what(2),what(3),eps(mu));
        ];
    end
    
    function CQ = Cq(obj, X, U, mu, varargin)
        % aerodynamic moment coefficients
        %
        % implementing EOM.Cq
        what = obj.omegahat(X,U,mu,varargin{:});
        
        CQ = [
            obj.AM.Cl(alpha(X),beta(X),xi(U),eta(U),zeta(U),what(1),what(2),what(3),eps(mu));
            obj.AM.Cm(alpha(X),beta(X),xi(U),eta(U),zeta(U),what(1),what(2),what(3),eps(mu));
            obj.AM.Cn(alpha(X),beta(X),xi(U),eta(U),zeta(U),what(1),what(2),what(3),eps(mu));
        ];
    end
    
    function QF = Qf(obj, varargin)
        % aerodynamic/thrust moments body axis system
        % taking into account cg-cgref offset
        % and vertical engine displacement
        cgref = obj.AC.cgref;
        cg  = obj.AC.cg;
        l_t = obj.AC.l_t;
        
        % aerodynamic moments body axes
        QF0 = obj.Qf@aerootools.EOM6(varargin{:});
        
        % aerodynamic forces body axes
        RF = obj.RAf(varargin{:});
        
        % thrust force (along body x-axis)
        F = obj.thrust(varargin{:});
        
        QF = QF0 ...
             + cross(RF, cg-cgref) ...
             + [0; l_t*F; 0];
    end
end

end