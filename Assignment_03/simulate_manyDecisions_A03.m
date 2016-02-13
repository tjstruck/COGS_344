function [avg_acc, avg_r_time, acc, r_time] = simulate_manyDecisions_A03(A, c, y0, z, T0, dt, y, i, N)
for n = 1:N
    i = 1;
    y(1) = y0;
    while (y(i) < z) && (y(i) > -z)
        r = randn(1);
        dW=sqrt(dt)*r;
        dy=A*dt+c*dW;
        y(i+1)=y(i)+dy;
        i = i + 1;
    end
    if y(i) > z
        acc(n) = 1;
    elseif y(i) < -z
        acc(n) = 0;
    end
    r_time(n) = T0 + dt * i;
end

avg_acc = mean(acc);
avg_r_time = mean(r_time);