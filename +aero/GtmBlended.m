classdef GtmBlended < aero.pkg.GtmAeroModel & aerootools.coeffs.BlendedModel
% Blended piecewise polynomial 6-DOF aerodynamic coefficients of the GTM.
%
% Models for regions of low and high-angles of attack are blended into each
% other using the Heavyside quasi-continuous step function.
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
% * |eps|      :  variable blending parameter                       -
% * |mu|       :  constant blending parameter                       -
%
%% See
%
% See also aero.pkg.GtmPiecewise, aerootools.coeffs.AbstractAeroModel,
%   aerootools.coeffs.BlendedModel
%
%%

properties
    alpha0;
    pre;
    post;
end

methods
    function obj = GtmBlended(varargin)
        % GTMBLENDED
        obj@aerootools.coeffs.BlendedModel(varargin{:});
        
        import aero.pkg.*
        obj.pre = GtmPreStall;
        obj.post = GtmPostStall;
        
        obj.alpha0 = obj.pre.alpha0;
    end
end

end