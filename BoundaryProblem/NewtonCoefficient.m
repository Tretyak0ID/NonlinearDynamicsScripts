function [A, B, F] = NewtonCoefficient(lambda, t, u)
%Вычисление коэффициентов для рассчета методом Ньютона
global N h lambda

B = 1/(h^2);
A = -2/(h^2);

F = (lambda.*t'.^2-1).*exp(u)+(1-lambda);
F(1)= F(1)+A*u(1) + B*u(2);
F(N-1) = F(N-1)+B*u(N-2)+A*u(N-1);

for i = 2:N-2
    F(i)     = F(i)+B*u(i-1) + A*u(i) + B*u(i+1);
end

end

