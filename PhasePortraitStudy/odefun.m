function dudt = odefun(t,u)
dudt = zeros(2,1);
dudt(1) = u(2);
dudt(2) = sin(u(1))/(1+cos(u(1))^2);
end

