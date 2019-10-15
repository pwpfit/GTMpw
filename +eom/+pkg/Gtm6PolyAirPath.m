classdef Gtm6PolyAirPath < aerootools.pkg.EOM6AirPath & aerootools.pkg.PolyApproximations
% Air path vector of the polynomial 6-DOF equations of motion of the GTM.
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
% See aerootools.pkg.EOM6AIRPATH, eom.pkg.GTM6POLYSTATES
%
%%

properties (Access=protected)
    Va0;
end

methods 
    function obj = Gtm6PolyAirPath(x0, varargin)
        if nargin == 1 && isa(x0,'eom.pkg.Gtm6PolyAirPath')
            % copy
            varargin = {x0};
            x0 = x0.V0;
        end
        
        obj@aerootools.pkg.EOM6AirPath(varargin{:});
        
        import aerootools.pkg.EOM6AirPath
        obj.Va0 = EOM6AirPath(x0);
    end
    
    function vel = norm(obj)
        vel = obj.sqrt(norm2(obj), norm2(obj.Va0));
    end
    
    function vel = invnorm(obj)
        vel = obj.invsqrt(norm2(obj), norm2(obj.Va0));
    end
end

end
    