function [acc, r_time] = simulate_oneDecisions_A03(A, c, y0, z, T0)

while (y(i) < z) & (y(i) > -z)
    r = randn(1);
    dW=sqrt(dt)*r;
    dy=A*dt+c*dW;
    y(i+1)=y(i)+dy;
    i = i + 1; 
end
if y(end) > z
    acc = 1;
elseif y(end) < -z
    acc = 0;
end
r_time = T0 + dt * i;