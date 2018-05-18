% THIS FILE HAS BEEN WRITTEN BY pwfitobject/tomatlab.m %
%
% This file is part of GTMpw -- Piece-wise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%%

alpha0 = 2.8119e-01;

%% Cy.beta(alpha,beta,varargin)
Cy.beta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 8.8641e-17 - 5.1297e-17.*alpha - 1.0862e+00.*beta + 3.7363e-17.*alpha.^2 - 1.8513e-01.*alpha.*beta - 2.3959e-16.*beta.^2 + 4.7811e-17.*alpha.^3 + 7.3357e-01.*alpha.^2.*beta - 5.3008e-17.*alpha.*beta.^2 + 2.1274e-01.*beta.^3 ;
Cy.beta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 7.7001e-17 - 2.2337e-18.*alpha - 8.8695e-01.*beta + 2.0472e-17.*alpha.^2 - 8.6657e-01.*alpha.*beta - 4.8406e-16.*beta.^2 + 1.0905e-17.*alpha.^3 + 6.3679e-01.*alpha.^2.*beta + 2.0284e-16.*alpha.*beta.^2 + 2.1274e-01.*beta.^3 ;

%% Cl.beta(alpha,beta,varargin)
Cl.beta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 9.3944e-17 + 2.0958e-17.*alpha - 6.5909e-02.*beta + 3.8557e-17.*alpha.^2 - 2.9752e-01.*alpha.*beta - 3.2458e-16.*beta.^2 + 1.0418e-16.*alpha.^3 + 1.1908e+00.*alpha.^2.*beta + 1.3721e-16.*alpha.*beta.^2 - 9.7001e-03.*beta.^3 ;
Cl.beta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 9.6676e-17 + 2.1820e-17.*alpha + 1.4452e-02.*beta + 5.1137e-17.*alpha.^2 - 2.7742e-01.*alpha.*beta - 3.3656e-16.*beta.^2 - 7.4350e-17.*alpha.^3 + 1.0290e-01.*alpha.^2.*beta + 1.6512e-16.*alpha.*beta.^2 - 9.7001e-03.*beta.^3 ;

%% Cn.beta(alpha,beta,varargin)
Cn.beta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.1563e-18 + 2.7371e-17.*alpha + 1.1644e-01.*beta - 1.1568e-17.*alpha.^2 - 2.2327e-02.*alpha.*beta - 1.4151e-16.*beta.^2 - 3.3198e-17.*alpha.^3 - 3.6328e-01.*alpha.^2.*beta + 5.4928e-16.*alpha.*beta.^2 + 5.5694e-02.*beta.^3 ;
Cn.beta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 8.8195e-18 + 2.2199e-19.*alpha + 1.4968e-01.*beta - 1.8489e-17.*alpha.^2 - 2.7898e-01.*alpha.*beta - 1.4441e-18.*beta.^2 - 9.8930e-18.*alpha.^3 + 1.2912e-01.*alpha.^2.*beta + 1.0850e-16.*alpha.*beta.^2 + 5.5694e-02.*beta.^3 ;

%% Cy.xi(alpha,beta,xi,varargin)
Cy.xi1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 3.2493e-18 + 1.2507e-15.*alpha + 3.2252e-01.*beta - 2.0249e-02.*xi - 6.5574e-17.*alpha.^2 - 4.1045e-01.*alpha.*beta + 1.5209e-02.*alpha.*xi - 5.6647e-16.*beta.^2 - 6.5634e-16.*beta.*xi - 1.8447e-15.*xi.^2 + 7.0343e-17.*alpha.^3 + 3.1407e+00.*alpha.^2.*beta + 2.1719e-02.*alpha.^2.*xi + 1.0791e-15.*alpha.*beta.^2 + 1.9823e-15.*alpha.*beta.*xi + 4.3561e-16.*alpha.*xi.^2 - 5.3177e-01.*beta.^3 + 9.0618e-03.*beta.^2.*xi - 7.0303e-01.*beta.*xi.^2 + 7.5008e-04.*xi.^3 ;
Cy.xi2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 3.5733e-16 - 2.3736e-17.*alpha + 1.0262e+00.*beta - 2.0356e-02.*xi + 1.8459e-17.*alpha.^2 - 2.6349e+00.*alpha.*beta + 2.6226e-02.*alpha.*xi - 2.0692e-16.*beta.^2 - 8.4168e-17.*beta.*xi - 1.8417e-15.*xi.^2 - 3.6891e-17.*alpha.^3 + 2.1521e+00.*alpha.^2.*beta - 1.6111e-02.*alpha.^2.*xi - 1.7428e-16.*alpha.*beta.^2 + 8.0424e-17.*alpha.*beta.*xi + 2.3052e-16.*alpha.*xi.^2 - 5.3177e-01.*beta.^3 + 9.0618e-03.*beta.^2.*xi - 7.0303e-01.*beta.*xi.^2 + 7.5008e-04.*xi.^3 ;

%% Cl.xi(alpha,beta,xi,varargin)
Cl.xi1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 4.8202e-19 + 1.0954e-16.*alpha + 1.3078e-02.*beta - 7.0049e-02.*xi - 2.3837e-17.*alpha.^2 - 1.7058e-03.*alpha.*beta + 3.5987e-02.*alpha.*xi + 1.3022e-16.*beta.^2 - 6.2604e-17.*beta.*xi - 4.0402e-16.*xi.^2 + 1.4654e-18.*alpha.^3 + 2.8642e-01.*alpha.^2.*beta + 2.3009e-01.*alpha.^2.*xi - 2.4044e-16.*alpha.*beta.^2 + 2.6603e-16.*alpha.*beta.*xi - 3.8460e-16.*alpha.*xi.^2 - 4.6703e-02.*beta.^3 + 2.6963e-02.*beta.^2.*xi - 4.2809e-02.*beta.*xi.^2 + 3.9073e-02.*xi.^3 ;
Cl.xi2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 3.1559e-17 - 7.3846e-18.*alpha + 7.8003e-02.*beta - 4.5774e-02.*xi + 7.4186e-19.*alpha.^2 - 1.9472e-01.*alpha.*beta + 1.3172e-02.*alpha.*xi + 6.7244e-17.*beta.^2 - 1.1633e-17.*beta.*xi - 5.8827e-16.*xi.^2 - 4.9582e-18.*alpha.^3 + 1.5170e-01.*alpha.^2.*beta + 4.2153e-03.*alpha.^2.*xi - 4.9914e-17.*alpha.*beta.^2 - 2.1170e-17.*alpha.*beta.*xi + 2.8399e-16.*alpha.*xi.^2 - 4.6703e-02.*beta.^3 + 2.6963e-02.*beta.^2.*xi - 4.2809e-02.*beta.*xi.^2 + 3.9073e-02.*xi.^3 ;

%% Cn.xi(alpha,beta,xi,varargin)
Cn.xi1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 1.0525e-18 + 1.4278e-16.*alpha + 6.6566e-02.*beta - 4.4472e-03.*xi - 1.1566e-17.*alpha.^2 - 5.7781e-02.*alpha.*beta - 1.5152e-03.*alpha.*xi + 5.9964e-17.*beta.^2 - 2.4739e-17.*beta.*xi - 4.4280e-17.*xi.^2 + 6.5560e-18.*alpha.^3 + 3.4412e-01.*alpha.^2.*beta + 4.3128e-02.*alpha.^2.*xi - 5.1928e-16.*alpha.*beta.^2 + 9.6952e-17.*alpha.*beta.*xi - 4.7356e-16.*alpha.*xi.^2 - 1.0985e-01.*beta.^3 + 3.7800e-03.*beta.^2.*xi - 9.3942e-02.*beta.*xi.^2 + 1.6435e-02.*xi.^3 ;
Cn.xi2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 3.9172e-17 - 3.2018e-18.*alpha + 1.2951e-01.*beta - 6.8744e-03.*xi + 2.5678e-18.*alpha.^2 - 2.3747e-01.*alpha.*beta + 2.4052e-02.*alpha.*xi - 8.7738e-17.*beta.^2 + 6.9572e-18.*beta.*xi - 2.6644e-16.*xi.^2 - 6.6125e-18.*alpha.^3 + 1.8707e-01.*alpha.^2.*beta - 1.7100e-02.*alpha.^2.*xi - 4.2703e-17.*alpha.*beta.^2 - 7.3130e-18.*alpha.*beta.*xi + 2.5585e-16.*alpha.*xi.^2 - 1.0985e-01.*beta.^3 + 3.7800e-03.*beta.^2.*xi - 9.3942e-02.*beta.*xi.^2 + 1.6435e-02.*xi.^3 ;

%% Cy.eta(alpha,beta,eta,varargin)
Cy.eta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 6.1842e-19 - 1.2521e-15.*alpha - 3.2252e-01.*beta - 1.3362e-18.*eta + 1.9968e-17.*alpha.^2 + 4.1045e-01.*alpha.*beta + 4.0632e-16.*alpha.*eta + 1.5435e-16.*beta.^2 + 2.7564e-16.*beta.*eta - 5.3868e-16.*eta.^2 - 7.1529e-17.*alpha.^3 - 3.1407e+00.*alpha.^2.*beta - 5.6586e-15.*alpha.^2.*eta + 1.6840e-15.*alpha.*beta.^2 - 1.0834e-15.*alpha.*beta.*eta - 2.4984e-16.*alpha.*eta.^2 + 5.3177e-01.*beta.^3 - 1.0975e-16.*beta.^2.*eta - 4.0246e-16.*beta.*eta.^2 - 6.8925e-16.*eta.^3 ;
Cy.eta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 3.5738e-16 + 2.3286e-17.*alpha - 1.0262e+00.*beta - 9.6999e-17.*eta - 1.8351e-17.*alpha.^2 + 2.6349e+00.*alpha.*beta - 6.3793e-18.*alpha.*eta + 7.3744e-16.*beta.^2 + 3.3128e-17.*beta.*eta - 3.9168e-16.*eta.^2 + 3.6271e-17.*alpha.^3 - 2.1521e+00.*alpha.^2.*beta + 1.6532e-17.*alpha.^2.*eta - 8.9697e-17.*alpha.*beta.^2 - 1.6484e-16.*alpha.*beta.*eta - 4.7180e-16.*alpha.*eta.^2 + 5.3177e-01.*beta.^3 - 1.9425e-16.*beta.^2.*eta - 3.8435e-16.*beta.*eta.^2 - 5.8519e-16.*eta.^3 ;

%% Cl.eta(alpha,beta,eta,varargin)
Cl.eta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 1.5658e-17 + 1.6793e-17.*alpha - 1.3078e-02.*beta - 2.9314e-18.*eta - 4.4867e-17.*alpha.^2 + 1.7058e-03.*alpha.*beta - 4.8568e-18.*alpha.*eta + 6.4416e-17.*beta.^2 + 6.3149e-19.*beta.*eta + 6.1796e-19.*eta.^2 + 1.6182e-17.*alpha.^3 - 2.8642e-01.*alpha.^2.*beta + 4.4188e-18.*alpha.^2.*eta - 6.1591e-16.*alpha.*beta.^2 - 4.4427e-17.*alpha.*beta.*eta + 3.6774e-18.*alpha.*eta.^2 + 4.6703e-02.*beta.^3 + 2.0987e-17.*beta.^2.*eta - 1.5103e-17.*beta.*eta.^2 + 0.0000e+00.*eta.^3 ;
Cl.eta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 7.2231e-18 - 1.0534e-17.*alpha - 7.8003e-02.*beta - 2.0479e-18.*eta - 4.8987e-17.*alpha.^2 + 1.9472e-01.*alpha.*beta + 9.4627e-19.*alpha.*eta - 2.0496e-16.*beta.^2 - 3.2825e-17.*beta.*eta + 7.2319e-18.*eta.^2 - 2.9518e-18.*alpha.^3 - 1.5170e-01.*alpha.^2.*beta - 1.6234e-17.*alpha.^2.*eta + 3.3076e-16.*alpha.*beta.^2 + 8.0210e-18.*alpha.*beta.*eta + 1.9675e-17.*alpha.*eta.^2 + 4.6703e-02.*beta.^3 + 2.4593e-17.*beta.^2.*eta - 1.5632e-18.*beta.*eta.^2 + 0.0000e+00.*eta.^3 ;

%% Cn.eta(alpha,beta,eta,varargin)
Cn.eta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 2.2325e-17 + 1.8789e-17.*alpha - 6.6566e-02.*beta - 4.6432e-18.*eta - 5.4309e-17.*alpha.^2 + 5.7781e-02.*alpha.*beta - 1.1358e-17.*alpha.*eta + 1.9375e-16.*beta.^2 - 1.6301e-17.*beta.*eta + 6.6264e-18.*eta.^2 + 1.5342e-17.*alpha.^3 - 3.4412e-01.*alpha.^2.*beta + 1.0757e-17.*alpha.^2.*eta - 6.8753e-16.*alpha.*beta.^2 - 4.3881e-16.*alpha.*beta.*eta + 6.3621e-18.*alpha.*eta.^2 + 1.0985e-01.*beta.^3 + 3.9531e-18.*beta.^2.*eta - 2.7028e-17.*beta.*eta.^2 + 0.0000e+00.*eta.^3 ;
Cn.eta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 1.0095e-17 - 2.2257e-17.*alpha - 1.2951e-01.*beta - 5.0002e-18.*eta - 5.7516e-17.*alpha.^2 + 2.3747e-01.*alpha.*beta + 1.3276e-18.*alpha.*eta - 1.1525e-16.*beta.^2 - 1.4291e-16.*beta.*eta + 1.7250e-17.*eta.^2 - 4.1884e-18.*alpha.^3 - 1.8707e-01.*alpha.^2.*beta + 1.3320e-17.*alpha.^2.*eta + 4.0800e-16.*alpha.*beta.^2 + 5.3110e-17.*alpha.*beta.*eta + 1.9935e-17.*alpha.*eta.^2 + 1.0985e-01.*beta.^3 + 1.2217e-17.*beta.^2.*eta - 1.3572e-17.*beta.*eta.^2 + 0.0000e+00.*eta.^3 ;

%% Cy.zeta(alpha,beta,zeta,varargin)
Cy.zeta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.2973e-19 - 1.0096e-16.*alpha - 1.2914e-02.*beta - 3.4738e-03.*zeta + 5.1939e-17.*alpha.^2 + 4.1459e-02.*alpha.*beta + 8.0010e-02.*alpha.*zeta + 4.9625e-16.*beta.^2 - 1.7178e-16.*beta.*zeta - 1.0863e-16.*zeta.^2 + 1.6123e-18.*alpha.^3 - 2.8446e-01.*alpha.^2.*beta - 5.9467e-01.*alpha.^2.*zeta - 2.2704e-15.*alpha.*beta.^2 + 4.4115e-16.*alpha.*beta.*zeta + 1.2662e-16.*alpha.*zeta.^2 - 1.5257e-03.*beta.^3 - 9.3977e-03.*beta.^2.*zeta + 4.1175e-03.*beta.*zeta.^2 + 8.9334e-02.*zeta.^3 ;
Cy.zeta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 2.8652e-17 + 1.6691e-17.*alpha - 9.8729e-02.*beta - 7.6189e-02.*zeta - 1.4156e-18.*alpha.^2 + 3.3326e-01.*alpha.*beta + 2.2109e-01.*alpha.*zeta - 1.2209e-16.*beta.^2 - 2.2817e-18.*beta.*zeta - 1.7514e-17.*zeta.^2 - 2.0012e-18.*alpha.^3 - 2.3687e-01.*alpha.^2.*beta - 1.7672e-01.*alpha.^2.*zeta - 3.6364e-17.*alpha.*beta.^2 + 2.0478e-17.*alpha.*beta.*zeta - 1.1882e-16.*alpha.*zeta.^2 - 1.5257e-03.*beta.^3 - 9.3977e-03.*beta.^2.*zeta + 4.1175e-03.*beta.*zeta.^2 + 8.9334e-02.*zeta.^3 ;

%% Cl.zeta(alpha,beta,zeta,varargin)
Cl.zeta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.4812e-18 - 3.8162e-16.*alpha - 1.5820e-02.*beta - 8.0897e-02.*zeta + 1.7147e-17.*alpha.^2 + 1.9110e-01.*alpha.*beta + 6.9300e-02.*alpha.*zeta + 1.4872e-16.*beta.^2 + 2.5373e-16.*beta.*zeta + 5.5560e-17.*zeta.^2 - 3.6618e-17.*alpha.^3 - 1.0122e+00.*alpha.^2.*beta - 1.2142e-01.*alpha.^2.*zeta + 2.0228e-16.*alpha.*beta.^2 - 1.1790e-15.*alpha.*beta.*zeta - 1.5445e-17.*alpha.*zeta.^2 + 6.0666e-02.*beta.^3 + 4.1823e-02.*beta.^2.*zeta + 7.8914e-03.*beta.*zeta.^2 + 1.2394e-01.*zeta.^3 ;
Cl.zeta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 1.0705e-16 + 8.0800e-18.*alpha - 6.8976e-02.*beta - 1.0361e-01.*zeta - 7.3848e-18.*alpha.^2 + 1.1779e-01.*alpha.*beta + 1.6512e-01.*alpha.*zeta + 2.8833e-16.*beta.^2 - 5.2595e-17.*beta.*zeta + 4.2575e-17.*zeta.^2 + 3.4064e-18.*alpha.^3 - 7.9121e-02.*alpha.^2.*beta - 1.7497e-01.*alpha.^2.*zeta - 2.1065e-16.*alpha.*beta.^2 + 6.1091e-18.*alpha.*beta.*zeta + 2.0366e-16.*alpha.*zeta.^2 + 6.0666e-02.*beta.^3 + 4.1823e-02.*beta.^2.*zeta + 7.8914e-03.*beta.*zeta.^2 + 1.2394e-01.*zeta.^3 ;

%% Cn.zeta(alpha,beta,zeta,varargin)
Cn.zeta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.0977e-17 + 1.6664e-16.*alpha + 3.1931e-03.*beta - 1.2156e-01.*zeta + 3.9806e-17.*alpha.^2 + 9.3868e-02.*alpha.*beta + 1.6024e-01.*alpha.*zeta - 3.9083e-16.*beta.^2 - 4.9794e-16.*beta.*zeta - 2.0843e-16.*zeta.^2 - 9.7453e-18.*alpha.^3 + 3.9315e-01.*alpha.^2.*beta - 4.9337e-01.*alpha.^2.*zeta + 2.1490e-16.*alpha.*beta.^2 + 1.5125e-15.*alpha.*beta.*zeta + 2.0708e-16.*alpha.*zeta.^2 + 1.0767e-01.*beta.^3 - 2.8702e-02.*beta.^2.*zeta + 2.2053e-02.*beta.*zeta.^2 + 1.8507e-03.*zeta.^3 ;
Cn.zeta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 5.9751e-17 + 4.2484e-18.*alpha + 4.5099e-01.*beta - 3.0355e-01.*zeta - 2.0198e-18.*alpha.^2 - 1.7547e+00.*alpha.*beta + 7.9072e-01.*alpha.*zeta - 3.1682e-16.*beta.^2 - 2.0392e-17.*beta.*zeta - 2.1330e-16.*zeta.^2 - 9.4585e-19.*alpha.^3 + 1.3036e+00.*alpha.^2.*beta - 4.3382e-01.*alpha.^2.*zeta - 2.4421e-16.*alpha.*beta.^2 - 6.9254e-17.*alpha.*beta.*zeta + 2.7344e-16.*alpha.*zeta.^2 + 1.0767e-01.*beta.^3 - 2.8702e-02.*beta.^2.*zeta + 2.2053e-02.*beta.*zeta.^2 + 1.8507e-03.*zeta.^3 ;

%% Cy.phat(alpha,phat,varargin)
Cy.phat1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 1.9417e-13 + 2.9993e-13.*alpha + 2.2807e+00.*phat + 4.3567e-13.*alpha.^2 - 7.1660e+00.*alpha.*phat + 3.9769e+01.*phat.^2 - 5.1395e-13.*alpha.^3 - 5.4568e+01.*alpha.^2.*phat + 6.8939e+02.*alpha.*phat.^2 + 8.1936e+03.*phat.^3 ;
Cy.phat2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 6.8430e-14 + 8.0580e-14.*alpha + 2.7141e+00.*phat - 4.8670e-13.*alpha.^2 - 3.3368e+01.*alpha.*phat + 3.0865e+03.*phat.^2 - 1.1521e-13.*alpha.^3 + 3.3135e+01.*alpha.^2.*phat - 1.0146e+04.*alpha.*phat.^2 + 8.1936e+03.*phat.^3 ;

%% Cl.phat(alpha,phat,varargin)
Cl.phat1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 7.3976e-12 - 9.7523e-12.*alpha - 1.4046e+01.*phat - 5.2464e-11.*alpha.^2 - 1.3426e+01.*alpha.*phat + 2.5305e+01.*phat.^2 + 6.1230e-11.*alpha.^3 + 1.7581e+02.*alpha.^2.*phat + 1.2475e+03.*alpha.*phat.^2 - 9.8845e+05.*phat.^3 ;
Cl.phat2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 2.9749e-12 - 5.8855e-13.*alpha + 3.3645e+00.*phat + 5.7873e-11.*alpha.^2 - 3.3324e+01.*alpha.*phat + 3.4611e+02.*phat.^2 + 1.9487e-11.*alpha.^3 + 2.6371e+01.*alpha.^2.*phat + 1.0659e+02.*alpha.*phat.^2 - 9.8845e+05.*phat.^3 ;

%% Cn.phat(alpha,phat,varargin)
Cn.phat1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 2.3049e-15 - 3.4689e-14.*alpha - 2.1063e+00.*phat + 2.3747e-13.*alpha.^2 - 1.8124e+00.*alpha.*phat - 1.3593e+02.*phat.^2 - 2.6879e-13.*alpha.^3 + 6.4789e+01.*alpha.^2.*phat - 2.9610e+02.*alpha.*phat.^2 + 4.4505e+03.*phat.^3 ;
Cn.phat2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 3.4473e-14 - 2.2087e-14.*alpha + 8.8503e+00.*phat - 2.5697e-13.*alpha.^2 - 2.8449e+01.*alpha.*phat - 8.7948e+02.*phat.^2 - 1.1668e-13.*alpha.^3 + 2.0942e+01.*alpha.^2.*phat + 2.3482e+03.*alpha.*phat.^2 + 4.4505e+03.*phat.^3 ;

%% Cy.rhat(alpha,rhat,varargin)
Cy.rhat1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 2.4108e-13 + 6.6005e-13.*alpha + 4.4179e+01.*rhat + 5.6367e-13.*alpha.^2 + 4.9371e+01.*alpha.*rhat + 2.8917e+03.*rhat.^2 - 6.1231e-13.*alpha.^3 + 9.2222e+01.*alpha.^2.*rhat - 5.0415e+03.*alpha.*rhat.^2 + 1.0357e+04.*rhat.^3 ;
Cy.rhat2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 2.1864e-13 - 6.6313e-13.*alpha + 2.2267e+02.*rhat - 6.2181e-13.*alpha.^2 - 6.7641e+02.*alpha.*rhat + 5.4585e+03.*rhat.^2 - 3.3912e-13.*alpha.^3 + 4.1586e+02.*alpha.^2.*rhat - 1.4170e+04.*alpha.*rhat.^2 + 1.0357e+04.*rhat.^3 ;

%% Cl.rhat(alpha,rhat,varargin)
Cl.rhat1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.1935e-11 - 1.5841e-11.*alpha + 9.6789e+00.*rhat - 8.4567e-11.*alpha.^2 + 4.3079e+01.*alpha.*rhat - 1.5899e+01.*rhat.^2 + 9.8675e-11.*alpha.^3 + 4.8546e+01.*alpha.^2.*rhat + 2.4349e+02.*alpha.*rhat.^2 - 1.5931e+06.*rhat.^3 ;
Cl.rhat2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 4.7619e-12 - 1.1385e-12.*alpha - 7.8430e+00.*rhat + 9.3263e-11.*alpha.^2 + 1.8147e+02.*alpha.*rhat + 1.4963e+01.*rhat.^2 + 3.1301e-11.*alpha.^3 - 2.2203e+02.*alpha.^2.*rhat + 1.3373e+02.*alpha.*rhat.^2 - 1.5931e+06.*rhat.^3 ;

%% Cn.rhat(alpha,rhat,varargin)
Cn.rhat1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 4.5765e-14 - 8.5171e-14.*alpha - 9.6458e+00.*rhat + 2.2365e-13.*alpha.^2 - 1.4456e+01.*alpha.*rhat - 1.5481e+03.*rhat.^2 - 2.8456e-13.*alpha.^3 - 5.3131e+01.*alpha.^2.*rhat + 3.1888e+03.*alpha.*rhat.^2 + 4.3134e+03.*rhat.^3 ;
Cn.rhat2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 1.5627e-13 + 4.1612e-13.*alpha - 2.7260e+01.*rhat - 2.4748e-13.*alpha.^2 + 4.1592e+01.*alpha.*rhat - 8.3782e+02.*rhat.^2 + 2.1410e-14.*alpha.^3 - 2.9673e+01.*alpha.^2.*rhat + 6.6279e+02.*alpha.*rhat.^2 + 4.3134e+03.*rhat.^3 ;

