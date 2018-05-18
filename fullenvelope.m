function [C, C1, C2, alpha0] = fullenvelope
% Piece-wise defined, 6-DOF aerodynamic coefficients of the GTM
% identified by the pwpfit toolbox.
%
%% Usage and description
%
%   [C, Cpre, Cpost, alpha'] = piecewise
%
% Returns the piece-wise polynomial model of the full-envelope aerodynamic
% coefficients:
%
% * |C|      -- piece-wise defined polynomial model;
% * |Cpre|   -- low-angle of attack polynomial model;
% * |Cpost|  -- high-angle of attack polynomial model;
% * |alpha'| -- low-angle of attack boundary;
%
% All models are structs with fields |X|, |Y|, |Z|, |l|, |m|, |n|,
% representing the force and moment coefficients in the respective body
% axes.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:torbjoern.cunis@onera.fr>
% * Created:    2017-07-09
% * Changed:    2017-05-18
%
% This file is part of GTMpw -- Piece-wise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|  :  angle of attack,                                    rad
% * |Cl|     :  aerodynamic coefficient moment body x-axis,         -
% * |Cm|     :  aerodynamic coefficient moment body y-axis,         -
% * |Cn|     :  aerodynamic coefficient moment body z-axis,         - 
% * |Cx|     :  aerodynamic coefficient force body x-axis,          -
% * |Cy|     :  aerodynamic coefficient force body y-axis,          -
% * |Cz|     :  aerodynamic coefficient force body z-axis,          -
%%

ift = @(c, t, e) t.*c + e.*(1-c);

% include generate functions
fullenvelope_xzm;
fullenvelope_yln;

%% Sub-functions
% longitudinals coefficients
C1.X = @(varargin) Cx.alpha1(varargin{:}) + Cx.beta1(varargin{:}) + Cx.xi1(varargin{:}) ...
                   + Cx.eta1(varargin{:}) + Cx.zeta1(varargin{:}) + Cx.qhat1(varargin{:});
C2.X = @(varargin) Cx.alpha2(varargin{:}) + Cx.beta2(varargin{:}) + Cx.xi2(varargin{:}) ...
                   + Cx.eta2(varargin{:}) + Cx.zeta2(varargin{:}) + Cx.qhat2(varargin{:});

C1.Z = @(varargin) Cz.alpha1(varargin{:}) + Cz.beta1(varargin{:}) + Cz.xi1(varargin{:}) ...
                   + Cz.eta1(varargin{:}) + Cz.zeta1(varargin{:}) + Cz.qhat1(varargin{:});
C2.Z = @(varargin) Cz.alpha2(varargin{:}) + Cz.beta2(varargin{:}) + Cz.xi2(varargin{:}) ...
                   + Cz.eta2(varargin{:}) + Cz.zeta2(varargin{:}) + Cz.qhat2(varargin{:});

C1.m = @(varargin) Cm.alpha1(varargin{:}) + Cm.beta1(varargin{:}) + Cm.xi1(varargin{:}) ...
                   + Cm.eta1(varargin{:}) + Cm.zeta1(varargin{:}) + Cm.qhat1(varargin{:});
C2.m = @(varargin) Cm.alpha2(varargin{:}) + Cm.beta2(varargin{:}) + Cm.xi2(varargin{:}) ...
                   + Cm.eta2(varargin{:}) + Cm.zeta2(varargin{:}) + Cm.qhat2(varargin{:});

% lateral coefficients
C1.Y = @(varargin) Cy.beta1(varargin{:})   + Cy.xi1(varargin{:})   + Cy.eta1(varargin{:}) ...
                   + Cy.zeta1(varargin{:}) + Cy.phat1(varargin{:}) + Cy.rhat1(varargin{:});
C2.Y = @(varargin) Cy.beta2(varargin{:})   + Cy.xi2(varargin{:})   + Cy.eta2(varargin{:}) ...
                   + Cy.zeta2(varargin{:}) + Cy.phat2(varargin{:}) + Cy.rhat2(varargin{:});

C1.l = @(varargin) Cl.beta1(varargin{:})   + Cl.xi1(varargin{:})    + Cl.eta1(varargin{:}) ...
                   + Cl.zeta1(varargin{:}) + Cl.phat1(varargin{:}) + Cl.rhat1(varargin{:});
C2.l = @(varargin) Cl.beta2(varargin{:})   + Cl.xi2(varargin{:})    + Cl.eta2(varargin{:}) ...
                   + Cl.zeta2(varargin{:}) + Cl.phat2(varargin{:}) + Cl.rhat2(varargin{:});

C1.n = @(varargin) Cn.beta1(varargin{:})   + Cn.xi1(varargin{:})    + Cn.eta1(varargin{:}) ...
                   + Cn.zeta1(varargin{:}) + Cn.phat1(varargin{:}) + Cn.rhat1(varargin{:});
C2.n = @(varargin) Cn.beta2(varargin{:})   + Cn.xi2(varargin{:})    + Cn.eta2(varargin{:}) ...
                   + Cn.zeta2(varargin{:}) + Cn.phat2(varargin{:}) + Cn.rhat2(varargin{:});


%% Piece-wise defined functions
% forces body axes
C.X = @(alpha, varargin) ift(alpha <= alpha0, C1.X(alpha, varargin{:}), C2.X(alpha, varargin{:}));
C.Y = @(alpha, varargin) ift(alpha <= alpha0, C1.Y(alpha, varargin{:}), C2.Y(alpha, varargin{:}));
C.Z = @(alpha, varargin) ift(alpha <= alpha0, C1.Z(alpha, varargin{:}), C2.Z(alpha, varargin{:}));

% moments body axes
C.l = @(alpha, varargin) ift(alpha <= alpha0, C1.l(alpha, varargin{:}), C2.l(alpha, varargin{:}));
C.m = @(alpha, varargin) ift(alpha <= alpha0, C1.m(alpha, varargin{:}), C2.m(alpha, varargin{:}));
C.n = @(alpha, varargin) ift(alpha <= alpha0, C1.n(alpha, varargin{:}), C2.n(alpha, varargin{:}));


end
