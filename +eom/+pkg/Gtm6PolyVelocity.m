classdef Gtm6PolyVelocity < aerootools.pkg.EOM6Velocity & aerootools.pkg.PolyApproximations
% Velocity vector of the polynomial 6-DOF equations of motion of the GTM.
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
% See aerootools.pkg.EOM6VELOCITY, eom.pkg.GTM6POLYSTATES
%
%%

properties (Access=protected)
    V0;
end

methods 
    function obj = Gtm6PolyVelocity(x0, varargin)
        if nargin == 1 && isa(x0,'eom.pkg.Gtm6PolyVelocity')
            % copy
            varargin = {x0};
            x0 = x0.V0;
        end
        
        obj@aerootools.pkg.EOM6Velocity(varargin{:});
        
        import aerootools.pkg.EOM6Velocity
        obj.V0 = EOM6Velocity(x0);
    end
    
    function vel = norm(obj,varargin)
        vel = obj.sqrt(norm2(obj,varargin{:}), norm2(obj.V0,varargin{:}));
    end
    
    function vel = invnorm(obj,varargin)
        vel = obj.invsqrt(norm2(obj,varargin{:}), norm2(obj.V0,varargin{:}));
    end
    
    function ang = alpha(obj)
        % Overriding EOM6Velocity.alpha
        %
        %   sin(alpha) = w/Ve
        %
        % where Ve is longitudinal velocity norm
        ang = obj.asin(w(obj).*invnorm(obj,true));
    end
end

end
    