% Demonstration of the longitudinal model
% for aerodynamic coefficients and equations of motion of the GTM.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:torbjoern.cunis@onera.fr>
% * Created:    2017-02-22
% * Changed:    2018-05-18
%
% This file is part of GTMpw -- Piece-wise polynomial model of the GTM
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
% * |F|        :  thrust,                                       lbf
% * |V|        :  airspeed,                                     ft/s
% * |Vdot|     :  change in airspeed,                           ft/s^2
%%


%% Equations of motion
% piece-wise model
[C] = piecewise;

% phugoid motion
[Vdot, gammadot, qhatdot, thetadot, qosc] = phugoid(C);

% system description
% with states X = [V gamma qhat alpha]^T, inputs U = [eta T]^T
f = @(X, U) [
                Vdot(X,U)
            gammadot(X,U)
             qhatdot(X,U)
            thetadot(X,U) - gammadot(X,U)
];

% find trim condition for eta = 0, T = 0
opts = optimoptions('fsolve', 'Algorithm', 'Levenberg-marquardt');
x0 = fsolve(@(x) f(x, [-deg2rad(1.5); 5]), [150; 0; 0; 0.1], opts)

% simulate elevator deflection by 5 degree
[T, Xt] = ode45(@(~,x) f(x, [-deg2rad(1.5); 5]), [0 25], x0);


% plot system response
figure(1)
subplot(2,2,1)
plot(T, Xt(:,1))
xlabel('time (s)')
ylabel('airspeed (m/s)')

subplot(2,2,2)
plot(T, rad2deg(Xt(:,2)))
xlabel('time (s)')
ylabel('inclination (deg)')

subplot(2,2,3)
plot(T, rad2deg(qosc(Xt')))
xlabel('time (s)')
ylabel('pitch-rate (deg)')

subplot(2,2,4)
plot(T, rad2deg(Xt(:,4)))
xlabel('time (s)')
ylabel('angle of attack (deg)')


%% Aerodynamic coefficients
% polynomial sub-models and switching point
[~, alpha0, ~, C1, C2] = piecewise;

% plot lift coefficient over angle of attack
figure(2)
clf
fplot(@(a) C.lift(deg2rad(a), 0, 0), [-5 70], '-')
hold on
% plot polynomial sub-models
fplot(@(a) C1.lift(deg2rad(a), 0, 0), [-5 70], '--')
fplot(@(a) C2.lift(deg2rad(a), 0, 0), [-5 70], '-.')
% plot switching point
plot(rad2deg(alpha0), C.lift(alpha0, 0, 0), 'k*')
set(gca, 'YLim', [-.5 1.5])
legend('piece-wise', 'low angle', 'high angle', 'joint')
xlabel('angle of attack (deg)')
ylabel('lift coefficient (-)')


%% Partial derivatives
% of the aerodynamic coefficients
[~, ~, dC] = piecewise;

% plot d(Cm)/d(eta) over angle of attack and elevator
figure(3)
clf
fcontour(@(a,e) dC.m.deta(deg2rad(a),deg2rad(e),0), [0 60 -30 30], 'Fill', 'on')
hold on
colorbar
% plot zero-derivative curve
fcontour(@(a,e) dC.m.deta(deg2rad(a),deg2rad(e),0), [0 60 -30 30], 'r--', 'LevelList', 0)
xlabel('angle of attack (deg)')
ylabel('elevator deflection (deg)')
