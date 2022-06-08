function root = dichotomy(a, b, fun, time, len)
x0 = a;
x1 = b;
    for i = 1:1:len
        x2 = (x1+x0)/2;
        if(interp1(time(1:end-2), fun(1:end-2),x2,'linear')==0)
            root = x2;
            return
        else if (interp1(time, fun,x2,'linear')*interp1(time, fun,x0,'linear') > 0)
            x0 = x2;
            else
            x1 = x2;
            end  
        end
    end
    root = x2;
end

