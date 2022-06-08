function dudt = odefun_6(t,u)
dudt = zeros(2,1);
dudt(1) = u(2);
dudt(2) = -u(1)^2 + 2/(1+u(1)^2);
end

