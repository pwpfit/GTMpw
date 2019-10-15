classdef GtmPreStall < aero.pkg.GtmAeroModel & aerootools.coeffs.AeroXZModel
% Pre-stall aerodynamics model for the Generic Transport Model.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:torbjoern.cunis@onera.fr>
% * Created:    2019-03-15
% * Changed:    2019-03-15
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|    :  angle of attack,                                  rad
% * |alpha0|   :  low-angle of attack boundary                      rad
% * |Cl|       :  aerodynamic coefficient moment body x-axis,       -
% * |Cm|       :  aerodynamic coefficient moment body y-axis,       -
% * |Cn|       :  aerodynamic coefficient moment body z-axis,       -
% * |Cx|       :  aerodynamic coefficient force body x-axis,        -
% * |Cy|       :  aerodynamic coefficient force body y-axis,        -
% * |Cz|       :  aerodynamic coefficient force body z-axis,        -
%
%% 

properties
    alpha0;
end

properties (Access=protected)
    C1 = struct;
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
    function obj = GtmPreStall
        %%GTMPRESTALL
        
        % include generate functions
        fullenvelope_xzm;
        fullenvelope_yln;
        
        obj.alpha0 = alpha0;
        
        obj.m_Cx = Cx;
        obj.m_Cy = Cy;
        obj.m_Cz = Cz;
        obj.m_Cl = Cl;
        obj.m_Cm = Cm;
        obj.m_Cn = Cn;

        %% Sub-functions
        % longitudinals coefficients
        obj.C1.X = @(varargin) obj.m_Cx.alpha1(varargin{:}) + obj.m_Cx.beta1(varargin{:}) +   obj.m_Cx.xi1(varargin{:}) ...
                               + obj.m_Cx.eta1(varargin{:}) + obj.m_Cx.zeta1(varargin{:}) + obj.m_Cx.qhat1(varargin{:});

        obj.C1.Z = @(varargin) obj.m_Cz.alpha1(varargin{:}) + obj.m_Cz.beta1(varargin{:}) +   obj.m_Cz.xi1(varargin{:}) ...
                               + obj.m_Cz.eta1(varargin{:}) + obj.m_Cz.zeta1(varargin{:}) + obj.m_Cz.qhat1(varargin{:});

        obj.C1.m = @(varargin) obj.m_Cm.alpha1(varargin{:}) + obj.m_Cm.beta1(varargin{:}) +   obj.m_Cm.xi1(varargin{:}) ...
                               + obj.m_Cm.eta1(varargin{:}) + obj.m_Cm.zeta1(varargin{:}) + obj.m_Cm.qhat1(varargin{:});

        % lateral coefficients
        obj.C1.Y = @(varargin) obj.m_Cy.beta1(varargin{:}) +   obj.m_Cy.xi1(varargin{:})  + obj.m_Cy.phat1(varargin{:}) ...
                               + obj.m_Cy.eta1(varargin{:}) + obj.m_Cy.zeta1(varargin{:}) + obj.m_Cy.rhat1(varargin{:});

        obj.C1.l = @(varargin) obj.m_Cl.beta1(varargin{:}) +   obj.m_Cl.xi1(varargin{:})  + obj.m_Cl.phat1(varargin{:}) ...
                               + obj.m_Cl.eta1(varargin{:}) + obj.m_Cl.zeta1(varargin{:}) + obj.m_Cl.rhat1(varargin{:});

        obj.C1.n = @(varargin) obj.m_Cn.beta1(varargin{:}) +   obj.m_Cn.xi1(varargin{:})  + obj.m_Cn.phat1(varargin{:}) ...
                               + obj.m_Cn.eta1(varargin{:}) + obj.m_Cn.zeta1(varargin{:}) + obj.m_Cn.rhat1(varargin{:});

    end
    
    function N = nargin(obj)
        % number of inputs
        N = -nargin(obj.m_Cx.alpha1) - 1;
    end
    
    function CX = Cx(obj,varargin)
        varargin = obj.extend(varargin);
        CX = obj.C1.X(varargin{:});
    end
    
    function CZ = Cz(obj,varargin)
        varargin = obj.extend(varargin);
        CZ = obj.C1.Z(varargin{:});
    end
    
    function CM = Cm(obj,varargin)
        varargin = obj.extend(varargin);
        CM = obj.C1.m(varargin{:});
    end
    
    function CY = Cy(obj,varargin)
        varargin = obj.extend(varargin);
        CY = obj.C1.Y(varargin{:});
    end
    
    function CL = Cl(obj,varargin)
        varargin = obj.extend(varargin);
        CL = obj.C1.l(varargin{:});
    end
    
    function CN = Cn(obj,varargin)
        varargin = obj.extend(varargin);
        CN = obj.C1.n(varargin{:});
    end
    
    function s = str(~)
        s = 'pw1';
    end
end

end
