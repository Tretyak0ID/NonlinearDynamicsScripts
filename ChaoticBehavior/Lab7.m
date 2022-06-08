lambda    = [0 0.005 0.01 0.1];
start_dot = [-1 0.5; -1 0.4 ; -1 0.3; 0.5 1; 0.5 1.5; 0.5 1.2; 1 0.4 ; 1 0.3; 1 0.5; 0.01 0.01;  -0.01 -0.01];

for l = lambda
    figure; hold on; grid on; title('Lambda = ', l); xlabel('u'); ylabel("u'");
    
    for i = 1:length(start_dot(:,1))
        
        u_0 = start_dot(i,1);
        v_0 = start_dot(i,2);
        
        for j = 1:300
            [u_0, v_0] = PoincareMapping(u_0, v_0, l);
            plot(u_0, v_0, '.b');
        end
    end
end