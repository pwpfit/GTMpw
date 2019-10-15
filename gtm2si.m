function [GTM, gSI] = gtm2si
% Outputs GTM parameters in SI.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:tcunis@umich.edu>
% * Created:    2017-06-08
% * Changed:    2016-06-08
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units                        Output      GTM
%
% * |rho|      :  air density,                                  kg/m^3      slugs/ft^3 
% * |b|        :  reference aerodynamic span,                   m           ft 
% * |c|        :  reference (mean) aerodynamic coord,           m           ft 
% * |g|        :  gravitational constant,                       m/s^2       ft/s^2 
% * |I*|       :  rotational inertia body *-axis                kg-m^2      slugs-ft^2  
% * |l_t|      :  engine vertical offset, body z-axis,          m           ft 
% * |m|        :  aircraft mass,                                kg          slugs 
% * |S|        :  reference wing aera,                          m^2         ft^2 
% * |w|        :  aircraft weight,                              N           lbf 
% * |cg|       :  center of gravity, body axes,                 m           ft 
% * |cgref|    :  reference center of gravity, body axes,       m           ft 
%%

% work-around for unit conversion
gSI = 9.80665;  %convacc(g, 'ft/s^2', 'm/s^2');

ft2m    = 0.3048;   % 1m = 0.3048
slug2kg = 14.59390; % 1slug = 14.59390kg

% GTM parameters in imperial units
parameters;

GTM.b =   b*ft2m; %convlength(b, 'ft', 'm');
GTM.c =   c*ft2m; %convlength(c, 'ft', 'm');
GTM.S = S*ft2m^2; %convlength(1, 'ft', 'm')^2;
GTM.m =   m*slug2kg; %convmass(m, 'slug', 'kg');
GTM.w =   GTM.m*gSI; %convforce(w, 'lbf', 'N');

GTM.cg = [
          x_cg*ft2m %convlength(x_cg, 'ft', 'm')
          y_cg*ft2m %convlength(y_cg, 'ft', 'm')
          z_cg*ft2m %convlength(z_cg, 'ft', 'm')
];
GTM.cgref = [
          x_cgref*ft2m %convlength(x_cgref, 'ft', 'm')
          y_cgref*ft2m %convlength(y_cgref, 'ft', 'm')
          z_cgref*ft2m %convlength(z_cgref, 'ft', 'm')
];

GTM.l_t = l_t*ft2m; %convlength(l_t, 'ft', 'm');
GTM.rho = rho*slug2kg/ft2m^3; %convdensity(rho, 'slug/ft^3', 'kg/m^3');

GTM.I = [
           Ix    -Ixy    -Ixz
          -Ixy    Iy     -Iyz
          -Ixz   -Iyz     Iz
]*slug2kg*ft2m^2; %convmass(1, 'slug', 'kg')*convlength(1, 'ft', 'm')^2;


%% Output
if nargout == 0
fprintf('reference aerodynamic span,\t b = %f m\n', GTM.b);
fprintf('aerodynamic mean coord,\t c_a = %f m\n',   GTM.c);
fprintf('reference wing aera,\t S = %f m2\n',       GTM.S);
fprintf('aircraft weight,\t w = %f N\n',            GTM.w);
fprintf('center of gravity, x-axis,\t x_cg = %f m\n', GTM.cg(1));
fprintf('reference center of gravity, x-axis,\t x_cgref = %f m\n', GTM.cgref(1));
fprintf('center of gravity, z-axis,\t z_cg = %f m\n', GTM.cg(3));
fprintf('reference center of gravity, z-axis,\t z_cgref = %f m\n', GTM.cgref(3));
fprintf('engine vertical displacement,\t l_t = %f m\n', GTM.l_t);
fprintf('air density,\t rho = %f kg/m3\n', GTM.rho);
fprintf('aircraft mass,\t m = %f kg\n', GTM.m);
fprintf('inertia y-axis, Iy = %f kg m2\n', GTM.I(2,2));
end
