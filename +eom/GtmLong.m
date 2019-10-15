classdef GtmLong < aerootools.EOM3
% Longitudinal equations of motion for the Generic Transport Model.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:tcunis@umich.edu>
% * Created:    2019-10-15
% * Changed:    2019-10-15
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|    :  angle of attack,                              rad
% * |gamma|    :  flight-path angle,                            rad
% * |gammadot| :  change in flight-path angle,                  rad/s
% * |eta|      :  elevator deflection,                          rad
% * |rho|      :  air density,                                  kg/m^3
% * |b|        :  reference aerodynamic span,                   m
% * |c|        :  reference (mean) aerodynamic coord,           m
% * |Cdrag|    :  aerodynamic drag coefficient,                 -
% * |Clift|    :  aerodynamic lift coefficient,                 -
% * |Cm|       :  aerodynamic coefficient moment body y-axis,   -
% * |Cx|       :  aerodynamic coefficient force body x-axis,    -
% * |Cz|       :  aerodynamic coefficient force body z-axis,    -
% * |g|        :  gravitational constant,                       m/s^2
% * |Iy|       :  inertia y-axis,                               kg-m^2
% * |m|        :  aircraft mass,                                kg
% * |M|        :  pitch moment, body y-axis,                    N-m
% * |q|        :  pitch rate, body y-axis,                      rad/s
% * |qhat|     :  normalized pitch rate, body y-axis            rad
% * |S|        :  reference wing aera,                          m^2
% * |T|        :  thrust,                                       N
% * |V|        :  airspeed,                                     m/s
% * |Vdot|     :  change in airspeed,                           m/s^2
%%
%
% See also aerotools.EOM3
%
%%

properties (Access=protected)
    AC;
    AM;
end

methods
    function obj = GtmLong(am, ac, g)
        % Instance of longitudinal equations of motion
        % with aircraft model |AM|, aerodynamic coefficients |AC|, and
        % optional gravitational constant |g|.
        obj.AM = am;
        
        if nargin > 1
            obj.AC = ac;
            obj.AC.g = g;
        else
            [obj.AC, obj.AC.g] = gtm2si;
        end
    end
end

methods (Static)
    function par = mu(varargin)
        % Parameters mu = [eps]
        %
        % Overriding EOM3.mu
        par = eom.pkg.GtmParameters(varargin{:});
    end
end

methods (Access=protected)
    function CD = Cdrag(obj, X, U, mu, varargin)
        % aerodynamic drag coefficient
        %
        % implementing EOM3.Cdrag
        qhat = obj.qhat(X,U,mu,varargin{:});
        
        CD = obj.AM.Cdrag(alpha(X),eta(U),qhat,eps(mu));
    end
    
    function CL = Clift(obj, X, U, mu, varargin)
        % aerodynamic lift coefficient
        %
        % implementing EOM3.Clift
        qhat = obj.qhat(X,U,mu,varargin{:});
        
        CL = obj.AM.Clift(alpha(X),eta(U),qhat,eps(mu));
    end
    
    function CM = Cm(obj, X, U, mu, varargin)
        % aerodynamic pitch-moment coefficient
        %
        % implementing EOM3.Cm
        qhat = obj.qhat(X,U,mu,varargin{:});
        
        CM = obj.AM.Cm(alpha(X),eta(U),qhat,eps(mu));
    end
    
    function CX = Cx(obj, X, U, mu, varargin)
        % aerodynamic coefficient force x-axis
        qhat = obj.qhat(X,U,mu,varargin{:});
        
        CX = obj.AM.Cx(alpha(X),eta(U),qhat,eps(mu));
    end
    
    function CZ = Cz(obj, X, U, mu, varargin)
        % aerodynamic coefficient force z-axis
        qhat = obj.qhat(X,U,mu,varargin{:});
        
        CZ = obj.AM.Cz(alpha(X),eta(U),qhat,eps(mu));
    end
    
    function moment = M(obj, varargin)
        % aerodynamic/thrust pitch moment 
        % taking into account cg-cgref offset
        % and vertical engine displacement
        % 
        % overriding EOM3.M
        cgref = obj.AC.cgref;
        cg  = obj.AC.cg;
        l_t = obj.AC.l_t;
        
        % aerodynamic pitch moment
        M0 = obj.M@aerootools.EOM3(varargin{:});
        
        % aerodynamic forces body axes
        X = obj.XAf(varargin{:});
        Z = obj.ZAf(varargin{:});
        
        % thrust force (along body x-axis)
        F = obj.thrust(varargin{:});

        moment = M0 ...
                 - X*(cg(3)-cgref(3)) ...
                 + Z*(cg(1)-cgref(1)) ...
                 + l_t*F;
    end
end

methods (Access=private)
    function force = XAf(obj, X, varargin)
        % aerodynamic force body x-axis
        rho = obj.AC.rho;
        S   = obj.AC.S;
        
        force = 0.5*rho*V(X).^2*S.*obj.Cx(X,varargin{:});
    end
    
    function force = ZAf(obj, X, varargin)
        % aerodynamic force body z-axis
        rho = obj.AC.rho;
        S   = obj.AC.S;
        
        force = 0.5*rho*V(X).^2*S.*obj.Cz(X,varargin{:});
    end
end

end        