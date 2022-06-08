function [u_out, v_out] = PoincareMapping(u_0, v_0, lambda)
    [time,uv] = ode45(@(t,u) odefun_7(t,u,lambda), [0:0.1:pi], [u_0, v_0]);
    u_out     = uv(end,1);
    v_out     = uv(end,2);
end

