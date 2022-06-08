global N h lambda
N = 100;
h = 2/N;
epsilon = 10^(-12);

t = [-1+h:h:1-h];
u_old = zeros(length(t),1);
u_new = zeros(length(t),1);

for lambda = 0:0.5:1
    while(1)
        u_old = u_new;
        [A,B,F] = NewtonCoefficient(lambda, t, u_old);
        u_new = NewtonsRefinement(u_old, t, A, B, F);
        
        if(max(abs(u_old-u_new))<epsilon)
            if(lambda == 0 | lambda==0.5 | lambda==1)
                figure; hold on; grid on; title('\lambda = ', lambda)
                plot(t,u_new)
            end
            break;
        end
    end
end