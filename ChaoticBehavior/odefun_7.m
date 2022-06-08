function dudt = odefun_7(t,u,lambda)
dudt = zeros(2,1);
dudt(1) = u(2);
dudt(2) = u(1) - lambda.*u(2).^2.*cos(2.*t)-u(1)^3;
end


