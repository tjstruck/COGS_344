clear
A = 1;%Drift rate
c = 1;%noise
y0 = 0;%Inital condition
z = 0.5;%threashold to a decision
T0 = 0.5;%inital time
N = 10000;
dt = 0.01;
y(1) = y0;
i = 1;

[avg_acc, avg_r_time] = simulate_manyDecisions_A03(A, c, y0, z, T0, dt, y, i, N)

%disp(['Reaction Time = ' num2str(dt*i)])
%disp(['The threashold that was crossed was ' num2str(z*sign(y(i)))])