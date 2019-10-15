classdef Gtm6PolyStates < aerootools.pkg.EOM6AbstractStates
% States of the polynomial 6-DOF equations of motion of the GTM.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:tcunis@umich.edu>
% * Created:    2019-03-18
% * Changed:    2019-03-18
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% See also
%
% See aerootools.pkg.EOM6STATES, eom.GTM6POLY
%
%%

properties (Access=protected)
    vel;
    rate;
    att;
    
    X0;
    
    air;
end

methods
    function obj = Gtm6PolyStates(x0, varargin)
        if nargin == 1 && isa(x0,'eom.pkg.Gtm6PolyStates')
            % copy
            varargin = {x0};
            x0 = x0.X0;
        end
        
        obj@aerootools.pkg.EOM6AbstractStates(varargin{:});
        
        import aerootools.pkg.EOM6States aerootools.pkg.EOM6BodyRate
        import eom.pkg.*
        obj.X0 = EOM6States(x0);
        
        % polynomial sub-states
        obj.vel = Gtm6PolyVelocity(   Vf(obj.X0), obj.v(1:3,:));
        obj.rate = EOM6BodyRate(obj.v(4:6,:));
        obj.att = Gtm6PolyAttitude(omega(obj.X0), obj.v(7:end,:));
        
        obj.air = Gtm6PolyAirPath(   VAg(obj.X0), obj.vel, obj.att);
    end
end

end