function [avg_acc, avg_r_time] = simulate_manyDecisions_A03Test(A, c, y0, z, T0, dt, N)
for n = 1:N
    [acc, r_time] = simulate_oneDecisions_A03(A, c, y0, z, T0)
    acc_v(n) = acc
    r_time_v = r_time
end

avg_acc = mean(acc);
avg_r_time = mean(r_time);