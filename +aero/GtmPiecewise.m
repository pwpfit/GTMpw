classdef GtmPiecewise < aero.pkg.GtmAeroModel & aerootools.coeffs.PiecewiseModel
% Piecewise polynomial 6-DOF aerodynamic coefficients of the GTM.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:tcunis.edu>
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|    :  angle of attack,                                  rad
% * |alpha0|   :  low-angle of attack boundary                      rad
% * |Cpre|     :  low-angle of attack coefficient(s)                -
% * |Cpost|    :  high-angle of attack coefficient(s)               -
%
%% See
%
% See also aerootools.coeffs.AbstractAeroModel
%
%%

properties
    alpha0;
    pre;
    post;
end

methods
    function obj = GtmPiecewise
        % GTMFULLENVELOPE
        
        import aero.pkg.*
        obj.pre = GtmPreStall;
        obj.post = GtmPostStall;
        
        obj.alpha0 = obj.pre.alpha0;
    end
end

end