classdef Gtm6PolyAttitude < aerootools.pkg.EOM6Attitude & aerootools.pkg.PolyApproximations
% Attitude vector of the polynomial 6-DOF equations of motion of the GTM.
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
% See aerootools.pkg.EOM6ATTITUDE, eom.pkg.GTM6POLYSTATES
%
%%

properties (Access=protected)
    Phi0;
end

methods
    function obj = Gtm6PolyAttitude(x0, varargin)
        if nargin == 1 && isa(x0,'eom.pkg.Gtm6PolyAttitude')
            % copy
            varargin = {x0};
            x0 = x0.Phi0;
        end
        
        obj@aerootools.pkg.EOM6Attitude(varargin{:});
        
        import aerootools.pkg.EOM6Attitude
        obj.Phi0 = EOM6Attitude(x0);
    end
end

end