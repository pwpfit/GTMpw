% Open-loop simulation of the GTM steep spiral motion with a piecewise
% polynomial aerodynamic coefficient model.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:tcunis@umich.edu>
% * Created:    2019-10-14
% * Changed:    2019-10-14
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% Variables, constants, and their units
%
% * |f|        :  system function, dx/dt = f(x,u)
% * |x|        :  state vector
% * |u|        :  input vector
%
%%

% aerodynamic coefficients
pw = aero.GtmPiecewise;

% UNCOMMENT to use smooth blending of 
% low and high angle-of-attack polynomials
% pw = aero.GtmBlended(.05);

% equations of motion
sys = eom.Gtm6dof(pw);

% steep spiral (steady-state of GTM high-fidelity simulation)
% states in wind frame: V, alpha, beta, p, q, r, Phi, Theta, Psi
% states in body frame: u, v, w, p, q, r, Phi, Theta, Psi
x0 = sys.X.wind2body(43.32,deg2rad(20.05),-deg2rad(7.55), -deg2rad(122.9),deg2rad(49.1),-deg2rad(45.4), -deg2rad(47.3),-deg2rad(61.5),0);
% inputs: xi, eta, zeta, F
u0 = [0; deg2rad(-30); 0; 0];


%% Simulate open-loop
% integrate state ode
[T,xt] = ode45(@(~,x) sys.f(x,u0), [0 10], x0);
% simulate output
yt = sys.g(xt,repmat(u0',size(xt,1),1));
% convert to state & output objects
Xt = sys.X(xt);
Yt = sys.Y(yt);


%% Plot
figure

% plot position in earth-fixed coordinates
plot3(yg(Yt), xg(Yt), -zg(Yt), 'o-', 'MarkerIndices', 1);

ylabel('longitudinal position (m)')
xlabel('lateral position (m)')
zlabel('vertical position (m)')
view(145,15)


%% Polynomial approximation
% of the equations of motion
psys = eom.Gtm6poly(x0,pw.post);

[T1,x1] = ode45(@(~,x) psys.f(x,u0), [0 10], x0);
X1 = psys.X(x1);

figure
subplot(3,1,1)
plot(T,VA(Xt), T1,VA(X1));
xlabel('time (s)')
ylabel('airspeed (m/s)')

subplot(3,1,2)
plot(T,rad2deg(alpha(Xt)), T1,rad2deg(alpha(X1)));
xlabel('time (s)')
ylabel('angle of attack (deg)')
legend('real', 'polynomial')

subplot(3,1,3)
plot(T,rad2deg(phi(Xt)), T1,rad2deg(phi(X1)));
xlabel('time (s)')
ylabel('bank angle (deg)')

