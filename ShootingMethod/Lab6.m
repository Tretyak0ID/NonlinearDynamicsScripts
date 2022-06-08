clc; clear; clf; format long;

%-----------------Phace-space-plot-----------------
H = @(u,v) 1/2*v.^2 + 1/3.*u.^3 - 2.*atan(u);

hold on; grid on;
u=-7:0.01:7;
v=-7:0.01:7;
[U,V]=meshgrid(u,v);

contour(U,V,H(U,V), [0.1 0.1]);
contour(U,V,H(U,V), [0.5 0.5]);
contour(U,V,H(U,V), [1 1]);
contour(U,V,H(U,V), [1.2365 1.2365]);
contour(U,V,H(U,V), [2 2]);
contour(U,V,H(U,V), [4 4]);

legend('C=1/10', 'C=1/2', 'C=1', 'C=1.2365', 'C=2', 'C=4')
title('Phace space'); xlabel('u'); ylabel('du/dt')

%-----------------Dirichlet-problem-----------------
dudt = zeros(1,201);

for i = 1:1:200
    [time,u_buff] = ode45(@(t,u) odefun_6(t,u), [0:0.1:pi], [0 i*0.01-0.01]);
    dudt(i) = u_buff(end,1);
end
figure; hold on; grid on; title("u(pi,0,u_0')"); xlabel("uo'");
plot([0:0.01:2-0.02], dudt(1:end-2));

%clarification
root = dichotomy(0.8, 0.85, dudt, [0:0.01:2], 100);
display("root u_0' = " + root)

%profile plot
[time,u] = ode45(@(t,u) odefun_6(t,u), [0:0.01:pi], [0 root]);
figure; hold on; grid on; title('Solve Dirichlet problem profile'); xlabel('t'); ylabel('u(t)')
plot(time, u(:,1), '-m');

%-----------------Neuman-problem-----------------
lenght_time = 320;
start_time  = -1;

delta1      = zeros(1,lenght_time);
delta2      = zeros(1,lenght_time);
u0          = zeros(1,lenght_time);

for i = 1:1:lenght_time
    u0(i)         = i*0.01-0.01+start_time;
    [time,u_buff] = ode45(@(t,u) odefun_6(t,u), [0:0.01:3*pi/2], [u0(i) 0]);
    
    delta1(i)     = u_buff(end,1);
    delta2(i)     = u_buff(end,2);
end

delta1 = delta1 - u0;

figure; hold on; grid on; title("delta_{1,2}"); xlabel("uo");
plot(u0, delta1); plot(u0, delta2);
legend('\Delta_1', '\Delta_2');

%clarification
root1 = dichotomy(-0.7, -0.6, delta2, u0, 100);
root2 = dichotomy(2.1, 2.2, delta2, u0, 100);
display("first root u_0' = " + root1)
display("second root u_0' = " + root2)

%profile plot
[time1,u1] = ode45(@(t,u) odefun_6(t,u), [0:0.01:3*pi/2], [root1 0]);
[time2,u2] = ode45(@(t,u) odefun_6(t,u), [0:0.01:3*pi/2], [root2 0]);
[time3,u3] = ode45(@(t,u) odefun_6(t,u), [0:0.01:3*pi/2], [1 0]);
figure; hold on; grid on; title('Solve periodic profile'); xlabel('t'); ylabel('u(t)')
plot(time1, u1(:,1), '-m'); plot(time2, u2(:,1), '-b'); plot(time3, u3(:,1), '-c');
legend('first root', 'second root', 'balance point')