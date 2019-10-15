classdef (Abstract) GtmAeroModel < aerootools.coeffs.AbstractAeroModel
% Abstract super-class for GTM aerodynamic models.
%
% Provides legacy methods for implementation as structs (deprecated).
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:tcunis@umich.edu>
% * Created:    2019-03-15
% * Changed:    2019-03-15
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|    :  angle of attack,                                  rad
% * |Cdrag|    :  aerodynamic drag coefficient,                     -
% * |Clift|    :  aerodynamic lift coefficient,                     -
% * |Cl|       :  aerodynamic coefficient moment body x-axis,       -
% * |Cm|       :  aerodynamic coefficient moment body y-axis,       -
% * |Cn|       :  aerodynamic coefficient moment body z-axis,       -
% * |Cx|       :  aerodynamic coefficient force body x-axis,        -
% * |Cy|       :  aerodynamic coefficient force body y-axis,        -
% * |Cz|       :  aerodynamic coefficient force body z-axis,        -
%
%% See
%
% See also aerootools.coeffs.AbstractAeroModel,
%
%%

methods
    function CX = X(obj, varargin)
        % Coefficient force body x-axis.
        CX = obj.legacy(@Cx,varargin{:});
    end
    
    function CY = Y(obj, varargin)
        % Coefficient force body y-axis.
        CY = obj.legacy(@Cy,varargin{:});
    end
    
    function CZ = Z(obj, varargin)
        % Coefficient force body z-axis.
        CZ = obj.legacy(@Cz,varargin{:});
    end
    
    function CL = l(obj, varargin)
        % Coefficient moment body x-axis.
        CL = obj.legacy(@Cl,varargin{:});
    end
    
    function CM = m(obj, varargin)
        % Coefficient moment body y-axis.
        CM = obj.legacy(@Cm,varargin{:});
    end
    
    function CN = n(obj, varargin)
        % Coefficient moment body z-axis.
        CN = obj.legacy(@Cn,varargin{:});
    end
    
    function Cl = lift(obj, varargin)
        % Lift coefficient.
        Cl = obj.legacy(@Clift,varargin{:});
    end
    
    function Cd = drag(obj, varargin)
        % Drag coefficient.
        Cd = obj.legacy(@Cdrag,varargin{:});
    end
end

methods (Access=private)
    function coeff = legacy(obj, Chan, varargin)
        warning('GTM:Aero:Deprecated', 'Deprecated. Use %s instead.', func2str(Chan));
        
        coeff = Chan(obj,varargin{:});
    end
end

end