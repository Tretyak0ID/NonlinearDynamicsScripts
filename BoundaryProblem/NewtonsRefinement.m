function u_new = NewtonsRefinement(u_old, t, A, B, F)
global N h lambda

%Уточнение решения метода Ньютона

u_new = zeros(1,N);
matrix = zeros(N-1);

matrix(1,1:2) = [A - (lambda*t(1)^2 - 1)*exp(u_old(1)),A];
matrix(N-1,N-2:N-1) = [B,A-(lambda*t(N-1)^2-1)*exp(u_old(N-1))];

for i = 2:N-2
    matrix(i,i)   = A-(lambda*t(i)^2-1)*exp(u_old(i));
    matrix(i,i-1) = B;
    matrix(i,i+1) = B;
end
u_new = u_old - matrix\F;

end

