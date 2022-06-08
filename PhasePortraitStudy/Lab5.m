clc; clear; clf;
syms v u
f = @(u) sin(u)./(1+cos(u).^2);

%-----------------Phace-space-plot-----------------
H = @(u,v) 1/2*v.^2+atan(cos(u));

hold on; grid on;
u=-7:0.01:7;
v=-7:0.01:7;
[U,V]=meshgrid(u,v);

contour(U,V,H(U,V), [0.25 0.25]);
contour(U,V,H(U,V), [0.5 0.5]);
contour(U,V,H(U,V), [pi/4 pi/4]);
contour(U,V,H(U,V), [1 1]);
contour(U,V,H(U,V), [2 2]);
contour(U,V,H(U,V), [4 4]);

legend('C=1/4', 'C=1/2', 'C=pi/4', 'C=1', 'C=2', 'C=4')
title('Phace space'); xlabel('u'); ylabel('du/dt')

%-----------------Research-solution-----------------

%Cycle solves
[t_cycle1,u_cycle1] = ode45(@(t,u) odefun(t,u), [-10:0.1:10], [3 0]);
[t_cycle2,u_cycle2] = ode45(@(t,u) odefun(t,u), [-10:0.1:10], [3 0.5]);
[t_cycle3,u_cycle3] = ode45(@(t,u) odefun(t,u), [-10:0.1:10], [3 0.75]);

figure; hold on; grid on; title('Cycle solves'); xlabel('t'); ylabel('u')
plot(t_cycle1, u_cycle1(:,1))
plot(t_cycle2, u_cycle2(:,1))
plot(t_cycle3, u_cycle3(:,1))
legend('[u_0, du/dt_0]=[3 0]', '[u_0, du/dt_0]=[3 0.5]', '[u_0, du/dt_0]=[3 0.75]')

%Rotational solves
[t_rotate1,u_rotate1] = ode45(@(t,u) odefun(t,u),[-10:0.1:10], [0 1]);
[t_rotate2,u_rotate2] = ode45(@(t,u) odefun(t,u),[-10:0.1:10], [0 2]);
[t_rotate3,u_rotate3] = ode45(@(t,u) odefun(t,u),[-10:0.1:10], [3 3]);

figure; hold on; grid on; title('Rotate solves'); xlabel('t'); ylabel('u')
plot(t_rotate1, u_rotate1(:,1))
plot(t_rotate2, u_rotate2(:,1))
plot(t_rotate3, u_rotate3(:,1))
legend('[u_0, du/dt_0]=[0 1]', '[u_0, du/dt_0]=[0 2]', '[u_0, du/dt_0]=[3 3]')

%Separatrix
[t_sep1,u_sep1] = ode45(@(t,u) odefun(t,u),[0:0.1:75], [1e-3,1e-3/sqrt(2)]);
[t_sep2,u_sep2] = ode45(@(t,u) odefun(t,u),[0:0.1:75], [-1e-10, 0]);

figure; hold on; grid on; title('Separatrix solves'); xlabel('t'); ylabel('u')
plot(t_sep1, u_sep1(:,1)); plot(t_sep2, u_sep2(:,1))