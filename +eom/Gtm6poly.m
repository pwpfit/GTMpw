classdef Gtm6poly < eom.Gtm6dof & aerootools.pkg.PolyApproximations
% Polynomial 6-DOF equations of motion for the Generic Transport Model.
%
% Trigonometric and other non-polynomial functions are replaced by Taylor
% approximations (see aerotools.pkg.POLYAPPROXIMATIONS).
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
% See also aerootools.EOM6, eom.GTM6DOF
%
%%

properties (Access=protected)
    %AC     -- inherited from Gtm6dof
    %AM     -- inherited from Gtm6dof
    
    X0;
end

methods
    function obj = Gtm6poly(x0, varargin)
        % Instance of longitudinal equations of motion
        % with reference trim condition |x0|
        % with aircraft model |AM|, aerodynamic coefficients |AC|, and
        % optional gravitational constant |g|.
        obj@eom.Gtm6dof(varargin{:});

        obj.X0 = eom.Gtm6dof.X(x0);
    end
end

methods
    %mu(varargin)       -- inherited from Gtm6poly
    
    function states = X(obj,varargin)
        % 6-DOF polynomial state vector
        %
        % Overriding EOM6.X
        states = eom.pkg.Gtm6PolyStates(obj.X0,varargin{:});
    end
end

methods
%     function func = f(obj, varargin)
%         % System's function
%         % 
%         % Overriding EOM6.f
%         varargin{1} = obj.X(obj.X0,varargin{1});
%         
%         func = obj.f@EOM6(varargin{:});
%     end
   
    function out = g(obj, varargin)
        % System's output function
        %
        % Overriding EOM6.g
        varargin{1} = obj.X(obj.X0,varargin{1});
        
        out = obj.g@aerootools.EOM6(varargin{:});
    end
end

methods (Access=protected)
    %Cr(obj, X, U, mu, varargin)    -- inherited from Gtm6dof
    %Cq(obj, X, U, mu, varargin)    -- inherited from Gtm6dof
    %Qf(obj, varargin)              -- inherited from Gtm6dof
end

end