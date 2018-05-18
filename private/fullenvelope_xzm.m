% THIS FILE HAS BEEN WRITTEN BY pwfitobject/tomatlab.m %
%
% This file is part of GTMpw -- Piece-wise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%%

alpha0 = 2.8119e-01;

%% Cx.alpha(alpha,varargin)
Cx.alpha1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 3.8738e-02 + 2.4361e-01.*alpha + 4.4526e+00.*alpha.^2 - 1.7398e+01.*alpha.^3 ;
Cx.alpha2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.8840e-02 - 1.3042e-01.*alpha + 1.6872e-01.*alpha.^2 - 2.2361e-02.*alpha.^3 ;

%% Cz.alpha(alpha,varargin)
Cz.alpha1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 1.6745e-02 - 5.2414e+00.*alpha - 1.8651e+00.*alpha.^2 + 2.8463e+01.*alpha.^3 ;
Cz.alpha2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 3.6481e-01 - 2.7114e+00.*alpha + 1.6467e+00.*alpha.^2 - 3.6909e-01.*alpha.^3 ;

%% Cm.alpha(alpha,varargin)
Cm.alpha1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.1917e-01 - 1.4654e+00.*alpha + 8.1301e+00.*alpha.^2 - 3.1986e+01.*alpha.^3 ;
Cm.alpha2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 2.4676e-01 - 2.8473e+00.*alpha + 2.7477e+00.*alpha.^2 - 1.1045e+00.*alpha.^3 ;

%% Cx.beta(alpha,beta,varargin)
Cx.beta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.2441e-02 - 4.8407e-02.*alpha + 3.2821e-03.*beta - 1.4326e+00.*alpha.^2 + 3.5364e-02.*alpha.*beta + 3.2877e-02.*beta.^2 + 5.4807e+00.*alpha.^3 - 1.3489e-01.*alpha.^2.*beta + 9.0929e-03.*alpha.*beta.^2 - 4.5928e-03.*beta.^3 ;
Cx.beta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 4.6271e-03 + 1.6026e-02.*alpha + 3.4722e-03.*beta - 2.3176e-02.*alpha.^2 - 3.7809e-03.*alpha.*beta + 5.2566e-02.*beta.^2 + 4.8404e-03.*alpha.^3 + 1.9193e-03.*alpha.^2.*beta - 6.0928e-02.*alpha.*beta.^2 - 4.5928e-03.*beta.^3 ;

%% Cz.beta(alpha,beta,varargin)
Cz.beta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 3.2919e-02 + 2.0410e-01.*alpha - 4.5568e-04.*beta + 1.7295e+00.*alpha.^2 - 9.1361e-03.*alpha.*beta + 6.5214e-02.*beta.^2 - 9.9297e+00.*alpha.^3 + 7.2590e-02.*alpha.^2.*beta + 2.8574e+00.*alpha.*beta.^2 - 3.0823e-16.*beta.^3 ;
Cz.beta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 2.1855e-01 + 6.9013e-01.*alpha + 1.7543e-02.*beta - 4.5154e-01.*alpha.^2 - 6.8144e-02.*alpha.*beta + 9.3940e-01.*beta.^2 + 2.9197e-02.*alpha.^3 + 5.4799e-02.*alpha.^2.*beta - 2.5147e-01.*alpha.*beta.^2 - 7.3406e-16.*beta.^3 ;

%% Cm.beta(alpha,beta,varargin)
Cm.beta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 9.3858e-03 - 2.2133e-01.*alpha + 5.1493e-03.*beta - 3.3040e+00.*alpha.^2 - 2.5021e-02.*alpha.*beta - 7.2545e-01.*beta.^2 + 1.3192e+01.*alpha.^3 + 1.9880e-01.*alpha.^2.*beta + 4.6179e-01.*alpha.*beta.^2 - 1.6095e-02.*beta.^3 ;
Cm.beta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 2.4661e-01 + 1.2907e+00.*alpha + 3.5963e-02.*beta - 1.9697e+00.*alpha.^2 - 8.6621e-02.*alpha.*beta - 1.0231e+00.*beta.^2 + 8.3816e-01.*alpha.^3 + 2.8144e-02.*alpha.^2.*beta + 1.5203e+00.*alpha.*beta.^2 - 1.6095e-02.*beta.^3 ;

%% Cx.xi(alpha,beta,xi,varargin)
Cx.xi1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 3.0530e-19 + 3.9801e-19.*alpha + 2.5313e-17.*beta + 7.6076e-17.*xi + 7.4217e-18.*alpha.^2 - 5.1193e-15.*alpha.*beta + 1.2174e-18.*alpha.*xi - 8.7831e-03.*beta.^2 + 1.2872e-02.*beta.*xi - 1.2419e-02.*xi.^2 + 2.0185e-17.*alpha.^3 + 2.0888e-14.*alpha.^2.*beta - 1.9769e-15.*alpha.^2.*xi - 7.0810e-02.*alpha.*beta.^2 - 1.4762e-01.*alpha.*beta.*xi + 6.2962e-02.*alpha.*xi.^2 + 1.7074e-17.*beta.^3 - 4.8220e-17.*beta.^2.*xi + 3.2092e-17.*beta.*xi.^2 + 3.6151e-17.*xi.^3 ;
Cx.xi2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 5.3106e-18 + 2.1398e-17.*alpha + 5.4038e-16.*beta - 1.8385e-16.*xi + 9.3730e-18.*alpha.^2 - 1.2447e-15.*alpha.*beta + 4.2634e-16.*alpha.*xi - 6.8025e-02.*beta.^2 - 3.5502e-02.*beta.*xi + 3.1876e-02.*xi.^2 + 2.5176e-19.*alpha.^3 + 6.5385e-16.*alpha.^2.*beta - 2.2541e-16.*alpha.^2.*xi + 1.3987e-01.*alpha.*beta.^2 + 2.4410e-02.*alpha.*beta.*xi - 9.4566e-02.*alpha.*xi.^2 + 1.5934e-17.*beta.^3 - 4.6894e-17.*beta.^2.*xi + 2.9736e-17.*beta.*xi.^2 + 3.7870e-17.*xi.^3 ;

%% Cz.xi(alpha,beta,xi,varargin)
Cz.xi1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.0766e-19 + 8.8550e-18.*alpha + 2.4205e-16.*beta - 6.5130e-17.*xi - 2.0761e-17.*alpha.^2 - 4.0272e-15.*alpha.*beta + 1.2837e-15.*alpha.*xi + 4.5459e-03.*beta.^2 - 8.8145e-02.*beta.*xi - 1.0312e-02.*xi.^2 + 1.4204e-17.*alpha.^3 + 6.9055e-15.*alpha.^2.*beta - 3.5939e-15.*alpha.^2.*xi - 3.2255e-01.*alpha.*beta.^2 + 4.4593e-01.*alpha.*beta.*xi - 9.5081e-02.*alpha.*xi.^2 + 5.1712e-16.*beta.^3 - 1.3315e-16.*beta.^2.*xi - 2.4286e-17.*beta.*xi.^2 - 8.5277e-18.*xi.^3 ;
Cz.xi2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.5861e-17 - 4.6479e-17.*alpha - 3.5515e-16.*beta - 1.1679e-17.*xi - 1.9157e-17.*alpha.^2 + 2.4522e-17.*alpha.*beta + 7.0386e-17.*alpha.*xi - 1.1219e-01.*beta.^2 + 6.1365e-02.*beta.*xi - 1.2402e-01.*xi.^2 - 2.6076e-19.*alpha.^3 - 7.5590e-18.*alpha.^2.*beta - 4.5851e-17.*alpha.^2.*xi + 9.2589e-02.*alpha.*beta.^2 - 8.5776e-02.*alpha.*beta.*xi + 3.0930e-01.*alpha.*xi.^2 + 5.1512e-16.*beta.^3 - 1.3982e-16.*beta.^2.*xi + 6.3975e-18.*beta.*xi.^2 - 7.0119e-18.*xi.^3 ;

%% Cm.xi(alpha,beta,xi,varargin)
Cm.xi1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 3.0653e-18 + 7.6208e-18.*alpha + 3.3859e-16.*beta - 6.0448e-17.*xi - 1.3610e-18.*alpha.^2 + 2.0449e-14.*alpha.*beta - 5.3912e-15.*alpha.*xi + 3.2086e-01.*beta.^2 + 3.1369e-02.*beta.*xi - 9.5863e-02.*xi.^2 + 1.2970e-16.*alpha.^3 - 8.7620e-14.*alpha.^2.*beta + 2.3483e-14.*alpha.^2.*xi - 9.3078e-01.*alpha.*beta.^2 + 2.5725e-03.*alpha.*beta.*xi - 4.7104e-01.*alpha.*xi.^2 - 2.6333e-16.*beta.^3 + 4.1898e-16.*beta.^2.*xi + 1.3878e-17.*beta.*xi.^2 - 5.8347e-17.*xi.^3 ;
Cm.xi2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 3.8779e-19 + 3.2704e-17.*alpha - 1.9443e-15.*beta + 7.3310e-16.*xi - 8.8279e-17.*alpha.^2 + 4.5545e-15.*alpha.*beta - 1.8614e-15.*alpha.*xi + 2.0109e-01.*beta.^2 + 4.1046e-02.*beta.*xi - 2.0526e-01.*xi.^2 + 1.1238e-18.*alpha.^3 - 2.4354e-15.*alpha.^2.*beta + 9.8815e-16.*alpha.^2.*xi - 5.0485e-01.*alpha.*beta.^2 - 3.1843e-02.*alpha.*beta.*xi - 8.1981e-02.*alpha.*xi.^2 - 2.6799e-16.*beta.^3 + 3.1798e-16.*beta.^2.*xi - 2.7659e-18.*beta.*xi.^2 - 2.9807e-17.*xi.^3 ;

%% Cx.eta(alpha,beta,eta,varargin)
Cx.eta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 7.8015e-19 + 1.1820e-17.*alpha - 1.0524e-02.*beta - 1.0770e-02.*eta + 6.5720e-17.*alpha.^2 + 1.2197e-02.*alpha.*beta + 2.6165e-01.*alpha.*eta + 1.8277e-03.*beta.^2 - 7.6918e-05.*beta.*eta - 1.6081e-01.*eta.^2 - 2.2061e-19.*alpha.^3 + 4.9911e-03.*alpha.^2.*beta - 7.7754e-01.*alpha.^2.*eta + 9.7369e-02.*alpha.*beta.^2 - 2.2296e-02.*alpha.*beta.*eta - 1.1667e-02.*alpha.*eta.^2 + 1.6990e-02.*beta.^3 - 1.8778e-03.*beta.^2.*eta - 9.4771e-03.*beta.*eta.^2 - 6.9607e-02.*eta.^3 ;
Cx.eta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 4.5100e-18 + 1.7965e-17.*alpha - 3.3313e-03.*beta - 2.3405e-02.*eta - 8.5708e-19.*alpha.^2 - 1.5590e-02.*alpha.*beta + 1.2328e-01.*alpha.*eta + 7.5303e-02.*beta.^2 - 8.0239e-03.*beta.*eta - 1.5360e-01.*eta.^2 - 8.9436e-18.*alpha.^3 + 1.2836e-02.*alpha.^2.*beta - 1.2564e-01.*alpha.^2.*eta - 1.6393e-01.*alpha.*beta.^2 + 5.9665e-03.*alpha.*beta.*eta - 3.7296e-02.*alpha.*eta.^2 + 1.6990e-02.*beta.^3 - 1.8778e-03.*beta.^2.*eta - 9.4771e-03.*beta.*eta.^2 - 6.9607e-02.*eta.^3 ;

%% Cz.eta(alpha,beta,eta,varargin)
Cz.eta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 4.8037e-18 - 5.6767e-17.*alpha - 3.2691e-02.*beta - 1.0865e+00.*eta - 1.4018e-16.*alpha.^2 + 1.4768e-01.*alpha.*beta - 5.7913e-03.*alpha.*eta + 2.9169e-02.*beta.^2 + 1.8500e-02.*beta.*eta + 1.9703e-02.*eta.^2 - 7.2242e-17.*alpha.^3 - 1.2040e-01.*alpha.^2.*beta + 1.7261e+00.*alpha.^2.*eta + 3.6176e-02.*alpha.*beta.^2 - 5.5222e-02.*alpha.*beta.*eta + 1.9420e-01.*alpha.*eta.^2 - 1.7587e-02.*beta.^3 + 6.1624e-01.*beta.^2.*eta + 2.4131e-02.*beta.*eta.^2 + 1.5176e+00.*eta.^3 ;
Cz.eta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 1.7077e-17 - 3.2925e-17.*alpha - 1.3254e-02.*beta - 1.3072e+00.*eta + 3.1961e-17.*alpha.^2 + 5.8083e-02.*alpha.*beta + 1.4288e+00.*alpha.*eta + 3.2080e-02.*beta.^2 + 2.0232e-03.*beta.*eta - 2.5966e-01.*eta.^2 - 1.8283e-18.*alpha.^3 - 4.7586e-02.*alpha.^2.*beta - 5.8349e-01.*alpha.^2.*eta + 2.5825e-02.*alpha.*beta.^2 + 3.3749e-03.*alpha.*beta.*eta + 1.1877e+00.*alpha.*eta.^2 - 1.7587e-02.*beta.^3 + 6.1624e-01.*beta.^2.*eta + 2.4131e-02.*beta.*eta.^2 + 1.5176e+00.*eta.^3 ;

%% Cm.eta(alpha,beta,eta,varargin)
Cm.eta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 9.4787e-18 - 2.1217e-16.*alpha - 1.0714e-01.*beta - 3.7061e+00.*eta - 8.5490e-16.*alpha.^2 + 4.1236e-01.*alpha.*beta - 1.4353e-01.*alpha.*eta + 6.0913e-02.*beta.^2 + 5.2533e-02.*beta.*eta - 4.8058e-01.*eta.^2 - 3.2166e-16.*alpha.^3 - 1.3621e-01.*alpha.^2.*beta + 1.0402e+01.*alpha.^2.*eta + 4.3417e-01.*alpha.*beta.^2 - 4.5417e-02.*alpha.*beta.*eta + 2.8566e+00.*alpha.*eta.^2 + 1.2858e-02.*beta.^3 + 1.3760e+00.*beta.^2.*eta + 2.2147e-01.*beta.*eta.^2 + 2.5441e+00.*eta.^3 ;
Cm.eta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 9.0770e-17 - 2.5379e-16.*alpha - 3.8420e-03.*beta - 3.5888e+00.*eta + 4.7176e-16.*alpha.^2 + 5.2741e-03.*alpha.*beta + 2.4883e+00.*alpha.*eta + 2.6816e-01.*beta.^2 + 3.8297e-02.*beta.*eta + 1.4769e-01.*eta.^2 - 4.1430e-18.*alpha.^3 + 5.0203e-03.*alpha.^2.*beta - 4.4130e-01.*alpha.^2.*eta - 3.0286e-01.*alpha.*beta.^2 + 5.2134e-03.*alpha.*beta.*eta + 6.2221e-01.*alpha.*eta.^2 + 1.2858e-02.*beta.^3 + 1.3760e+00.*beta.^2.*eta + 2.2147e-01.*beta.*eta.^2 + 2.5441e+00.*eta.^3 ;

%% Cx.zeta(alpha,beta,zeta,varargin)
Cx.zeta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 6.0574e-19 + 4.1914e-18.*alpha + 1.0524e-02.*beta + 2.2420e-17.*zeta + 7.3003e-18.*alpha.^2 - 1.2197e-02.*alpha.*beta - 3.9235e-16.*alpha.*zeta + 1.3826e-02.*beta.^2 + 3.8685e-02.*beta.*zeta - 5.3999e-02.*zeta.^2 + 3.7717e-17.*alpha.^3 - 4.9911e-03.*alpha.^2.*beta + 1.0116e-15.*alpha.^2.*zeta - 1.9687e-01.*alpha.*beta.^2 - 1.4068e-01.*alpha.*beta.*zeta + 6.4158e-02.*alpha.*zeta.^2 - 1.6990e-02.*beta.^3 - 1.6447e-17.*beta.^2.*zeta + 1.3878e-17.*beta.*zeta.^2 - 6.3603e-19.*zeta.^3 ;
Cx.zeta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 5.7112e-18 + 2.5029e-17.*alpha + 3.3313e-03.*beta + 3.1916e-17.*zeta + 8.5124e-18.*alpha.^2 + 1.5590e-02.*alpha.*beta - 1.3803e-16.*alpha.*zeta - 9.7320e-02.*beta.^2 - 2.0055e-02.*beta.*zeta - 4.0271e-02.*zeta.^2 - 4.9938e-19.*alpha.^3 - 1.2836e-02.*alpha.^2.*beta + 8.7249e-17.*alpha.^2.*zeta + 1.9840e-01.*alpha.*beta.^2 + 6.8217e-02.*alpha.*beta.*zeta + 1.5337e-02.*alpha.*zeta.^2 - 1.6990e-02.*beta.^3 - 2.5562e-17.*beta.^2.*zeta + 5.1207e-18.*beta.*zeta.^2 + 1.2461e-17.*zeta.^3 ;

%% Cz.zeta(alpha,beta,zeta,varargin)
Cz.zeta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 7.8673e-19 + 4.7622e-17.*alpha + 3.2691e-02.*beta + 5.5994e-17.*zeta - 3.5687e-18.*alpha.^2 - 1.4768e-01.*alpha.*beta + 5.9558e-16.*alpha.*zeta - 2.3854e-02.*beta.^2 - 2.3987e-02.*beta.*zeta + 2.2055e-02.*zeta.^2 - 6.2034e-18.*alpha.^3 + 1.2040e-01.*alpha.^2.*beta - 3.9564e-15.*alpha.^2.*zeta + 1.7126e-02.*alpha.*beta.^2 + 8.4828e-02.*alpha.*beta.*zeta - 5.5445e-02.*alpha.*zeta.^2 + 1.7587e-02.*beta.^3 + 1.0665e-17.*beta.^2.*zeta + 4.3368e-18.*beta.*zeta.^2 + 1.7719e-17.*zeta.^3 ;
Cz.zeta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.7463e-17 - 1.2157e-17.*alpha + 1.3254e-02.*beta - 2.1615e-16.*zeta - 3.8578e-18.*alpha.^2 - 5.8083e-02.*alpha.*beta + 4.9973e-16.*alpha.*zeta - 4.7359e-02.*beta.^2 - 8.7811e-03.*beta.*zeta - 6.3173e-03.*zeta.^2 + 8.1228e-19.*alpha.^3 + 4.7586e-02.*alpha.^2.*beta - 2.5276e-16.*alpha.^2.*zeta + 1.0072e-01.*alpha.*beta.^2 + 3.0751e-02.*alpha.*beta.*zeta + 4.5458e-02.*alpha.*zeta.^2 + 1.7587e-02.*beta.^3 + 2.2290e-17.*beta.^2.*zeta + 1.0382e-17.*beta.*zeta.^2 - 1.9268e-17.*zeta.^3 ;

%% Cm.zeta(alpha,beta,zeta,varargin)
Cm.zeta1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 4.0023e-18 + 5.4762e-17.*alpha + 1.0714e-01.*beta + 1.1124e-16.*zeta - 4.4274e-17.*alpha.^2 - 4.1236e-01.*alpha.*beta + 1.2202e-16.*alpha.*zeta - 2.6546e-01.*beta.^2 - 1.9087e-01.*beta.*zeta + 1.5594e-01.*zeta.^2 - 1.0657e-16.*alpha.^3 + 1.3621e-01.*alpha.^2.*beta - 2.4280e-15.*alpha.^2.*zeta + 3.3702e-01.*alpha.*beta.^2 + 7.9410e-01.*alpha.*beta.*zeta - 2.5950e-01.*alpha.*zeta.^2 - 1.2858e-02.*beta.^3 - 1.5996e-16.*beta.^2.*zeta - 2.7756e-17.*beta.*zeta.^2 + 3.6377e-17.*zeta.^3 ;
Cm.zeta2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 4.7905e-17 - 1.1520e-16.*alpha + 3.8420e-03.*beta - 2.5642e-16.*zeta - 2.4616e-17.*alpha.^2 - 5.2741e-03.*alpha.*beta + 8.6143e-16.*alpha.*zeta - 3.1629e-01.*beta.^2 + 1.8960e-01.*beta.*zeta + 9.6452e-02.*zeta.^2 - 1.6092e-18.*alpha.^3 - 5.0203e-03.*alpha.^2.*beta - 5.1619e-16.*alpha.^2.*zeta + 5.1779e-01.*alpha.*beta.^2 - 5.5901e-01.*alpha.*beta.*zeta - 4.7936e-02.*alpha.*zeta.^2 - 1.2858e-02.*beta.^3 - 8.6970e-17.*beta.^2.*zeta + 3.5773e-17.*beta.*zeta.^2 - 7.3699e-17.*zeta.^3 ;

%% Cx.qhat(alpha,qhat,varargin)
Cx.qhat1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 1.3564e-03 - 6.4981e-03.*alpha + 6.3167e+01.*qhat + 7.5517e-02.*alpha.^2 + 6.7700e+02.*alpha.*qhat + 4.4064e+05.*qhat.^2 + 1.2635e-01.*alpha.^3 + 1.1931e+03.*alpha.^2.*qhat + 2.2813e+06.*alpha.*qhat.^2 - 1.0434e+06.*qhat.^3 ;
Cx.qhat2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 3.7979e-02 - 1.7644e-01.*alpha + 1.2600e+03.*qhat + 2.4511e-01.*alpha.^2 - 4.1513e+03.*alpha.*qhat + 1.7508e+06.*qhat.^2 - 9.6750e-02.*alpha.^3 + 3.2265e+03.*alpha.^2.*qhat - 2.3783e+06.*alpha.*qhat.^2 - 1.0434e+06.*qhat.^3 ;

%% Cz.qhat(alpha,qhat,varargin)
Cz.qhat1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 6.9842e-03 + 9.0833e-02.*alpha - 1.8751e+03.*qhat - 2.0281e-01.*alpha.^2 - 1.8724e+03.*alpha.*qhat + 4.2434e+06.*qhat.^2 - 2.8280e-01.*alpha.^3 - 4.7458e+03.*alpha.^2.*qhat - 1.5335e+07.*alpha.*qhat.^2 - 1.6698e+05.*qhat.^3 ;
Cz.qhat2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 4.9500e-02 - 4.1059e-01.*alpha - 5.2749e+03.*qhat + 9.7686e-01.*alpha.^2 + 1.1599e+04.*alpha.*qhat - 3.0512e+06.*qhat.^2 - 6.7690e-01.*alpha.^3 - 9.6546e+03.*alpha.^2.*qhat + 1.0607e+07.*alpha.*qhat.^2 - 1.6698e+05.*qhat.^3 ;

%% Cm.qhat(alpha,qhat,varargin)
Cm.qhat1 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) - 2.0991e-02 - 3.2743e-02.*alpha - 2.3835e+03.*qhat + 4.9587e-01.*alpha.^2 - 1.9942e+02.*alpha.*qhat + 1.7924e+06.*qhat.^2 + 9.0791e-01.*alpha.^3 + 1.5744e+03.*alpha.^2.*qhat + 7.2671e+06.*alpha.*qhat.^2 - 2.9802e+09.*qhat.^3 ;
Cm.qhat2 = @(alpha,beta,xi,eta,zeta,phat,qhat,rhat,varargin) 1.1483e-01 - 4.1200e-01.*alpha - 6.6224e+02.*qhat + 4.3061e-01.*alpha.^2 - 8.1865e+03.*alpha.*qhat + 6.0628e+06.*qhat.^2 - 1.7224e-01.*alpha.^3 + 8.2090e+03.*alpha.^2.*qhat - 7.9199e+06.*alpha.*qhat.^2 - 2.9802e+09.*qhat.^3 ;

