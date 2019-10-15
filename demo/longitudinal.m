% Demonstration of the longitudinal model
% for aerodynamic coefficients and equations of motion of the GTM.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:tcunis.edu>
% * Created:    2017-02-22
% * Changed:    2019-10-15
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |alpha|    :  angle of attack,                              rad
% * |alpha0|   :  low-angle of attack boundary                  rad
% * |gamma|    :  flight-path angle,                            rad
% * |gammadot| :  change in flight-path angle,                  rad/s
% * |eta|      :  elevator deflection,                          rad
% * |Cdrag|    :  aerodynamic drag coefficient,                 -
% * |Clift|    :  aerodynamic lift coefficient,                 -
% * |Cm|       :  aerodynamic coefficient moment body y-axis,   -
% * |qosc|     :  pitch rate, body y-axis,                      rad/s
% * |qhat|     :  normalized pitch rate, body y-axis            rad
% * |F|        :  thrust,                                       N
% * |V|        :  airspeed,                                     m/s
% * |Vdot|     :  change in airspeed,                           m/s^2
%%


%% Equations of motion
% piecewise model
pw = aero.GtmPiecewise;

% system description longitudinal motion
% with states X = [V gamma qhat alpha]^T, inputs U = [eta T]^T
sys = eom.GtmLong(pw);

% find trim condition for eta = 0, T = 20 N
import aerootools.findtrim
x0 = findtrim(@sys.f, [35; 0; 0; 0.1], [0; 20]);

% simulate elevator deflection by 5 degree
[T, xt] = ode45(@(~,x) sys.f(x, [-deg2rad(5); 20]), [0 25], x0);

% convert to state objects
X0 = sys.X(x0);
Xt = sys.X(xt);

% plot system response
figure(1)
subplot(2,2,1)
plot(T, V(Xt))
xlabel('time (s)')
ylabel('airspeed (m/s)')

subplot(2,2,2)
plot(T, rad2deg(gamma(Xt)))
xlabel('time (s)')
ylabel('inclination (deg)')

subplot(2,2,3)
plot(T, rad2deg(q(Xt)))
xlabel('time (s)')
ylabel('pitch-rate (deg/s)')

subplot(2,2,4)
plot(T, rad2deg(alpha(Xt)))
xlabel('time (s)')
ylabel('angle of attack (deg)')


%% Aerodynamic coefficients
% polynomial sub-models and switching point

% plot lift coefficient over angle of attack
figure(2)
clf
fplot(@(a) Clift(pw,deg2rad(a), 0, 0), [-5 70], '-')
hold on
% plot polynomial sub-models
fplot(@(a) Clift(pw.pre,deg2rad(a), 0, 0), [-5 70], '--')
fplot(@(a) Clift(pw.post,deg2rad(a), 0, 0), [-5 70], '-.')
% plot switching point
plot(rad2deg(pw.alpha0), Clift(pw,pw.alpha0, 0, 0), 'k*')
set(gca, 'YLim', [-.5 1.5])
legend('piecewise', 'low angle', 'high angle', 'joint')
xlabel('angle of attack (deg)')
ylabel('lift coefficient (-)')

