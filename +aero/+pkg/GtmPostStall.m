classdef GtmPostStall < aero.pkg.GtmAeroModel & aerootools.coeffs.AeroXZModel
% Post-stall aerodynamics model for the Generic Transport Model.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:torbjoern.cunis@onera.fr>
% * Created:    2019-03-15
% * Changed:    2019-03-15
%
%% Variables, constants, and their units
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|    :  angle of attack,                                  rad
% * |Cl|       :  aerodynamic coefficient moment body x-axis,       -
% * |Cm|       :  aerodynamic coefficient moment body y-axis,       -
% * |Cn|       :  aerodynamic coefficient moment body z-axis,       -
% * |Cx|       :  aerodynamic coefficient force body x-axis,        -
% * |Cy|       :  aerodynamic coefficient force body y-axis,        -
% * |Cz|       :  aerodynamic coefficient force body z-axis,        -
%
%% 

properties (Access=protected)
    C2 = struct;
end

properties (Access=private)
    m_Cx;
    m_Cy;
    m_Cz;
    m_Cl;
    m_Cm;
    m_Cn;
end
    
methods
    function obj = GtmPostStall
        %%GTMPIECEWISE
        
        % include generate functions
        fullenvelope_xzm;
        fullenvelope_yln;
        
        obj.m_Cx = Cx;
        obj.m_Cy = Cy;
        obj.m_Cz = Cz;
        obj.m_Cl = Cl;
        obj.m_Cm = Cm;
        obj.m_Cn = Cn;

        %% Sub-functions
% longitudinals coefficients
        obj.C2.X = @(varargin) obj.m_Cx.alpha2(varargin{:}) + obj.m_Cx.beta2(varargin{:}) +   obj.m_Cx.xi2(varargin{:}) ...
                               + obj.m_Cx.eta2(varargin{:}) + obj.m_Cx.zeta2(varargin{:}) + obj.m_Cx.qhat2(varargin{:});

        obj.C2.Z = @(varargin) obj.m_Cz.alpha2(varargin{:}) + obj.m_Cz.beta2(varargin{:}) +   obj.m_Cz.xi2(varargin{:}) ...
                               + obj.m_Cz.eta2(varargin{:}) + obj.m_Cz.zeta2(varargin{:}) + obj.m_Cz.qhat2(varargin{:});

        obj.C2.m = @(varargin) obj.m_Cm.alpha2(varargin{:}) + obj.m_Cm.beta2(varargin{:}) +   obj.m_Cm.xi2(varargin{:}) ...
                               + obj.m_Cm.eta2(varargin{:}) + obj.m_Cm.zeta2(varargin{:}) + obj.m_Cm.qhat2(varargin{:});

        % lateral coefficients
        obj.C2.Y = @(varargin) obj.m_Cy.beta2(varargin{:})  +  obj.m_Cy.xi2(varargin{:})  + obj.m_Cy.phat2(varargin{:}) ...
                               + obj.m_Cy.eta2(varargin{:}) + obj.m_Cy.zeta2(varargin{:}) + obj.m_Cy.rhat2(varargin{:});

        obj.C2.l = @(varargin) obj.m_Cl.beta2(varargin{:})  +  obj.m_Cl.xi2(varargin{:}) +  obj.m_Cl.phat2(varargin{:}) ...
                               + obj.m_Cl.eta2(varargin{:}) + obj.m_Cl.zeta2(varargin{:}) + obj.m_Cl.rhat2(varargin{:});

        obj.C2.n = @(varargin) obj.m_Cn.beta2(varargin{:})  +  obj.m_Cn.xi2(varargin{:}) +  obj.m_Cn.phat2(varargin{:}) ...
                               + obj.m_Cn.eta2(varargin{:}) + obj.m_Cn.zeta2(varargin{:}) + obj.m_Cn.rhat2(varargin{:});

    end
    
    function N = nargin(obj)
        % number of inputs
        N = -nargin(obj.m_Cx.alpha2) - 1;
    end
    
    function CX = Cx(obj,varargin)
        varargin = obj.extend(varargin);
        CX = obj.C2.X(varargin{:});
    end
    
    function CZ = Cz(obj,varargin)
        varargin = obj.extend(varargin);
        CZ = obj.C2.Z(varargin{:});
    end
    
    function CM = Cm(obj,varargin)
        varargin = obj.extend(varargin);
        CM = obj.C2.m(varargin{:});
    end
    
    function CY = Cy(obj,varargin)
        varargin = obj.extend(varargin);
        CY = obj.C2.Y(varargin{:});
    end

    function CL = Cl(obj,varargin)
        varargin = obj.extend(varargin);
        CL = obj.C2.l(varargin{:});
    end
    
    function CN = Cn(obj,varargin)
        varargin = obj.extend(varargin);
        CN = obj.C2.n(varargin{:});
    end
    
    function s = str(~)
        s = 'pw2';
    end
end

end
