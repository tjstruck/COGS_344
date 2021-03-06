clear
A = 1;%Drift rate
c = 1;%noise
y0 = 0;%Inital condition
z = 0.5;%threashold to a decision
T0 = 0.5;%inital time
N = 1000;
dt = 0.01;
y(1) = y0;
i = 1;

zNorm = z/A;

aNorm = (A/c)^2;

x0 = y0/A;

ER = 1/(1 + exp(2 * zNorm * aNorm)) - ((1 - exp(-2 * x0 * aNorm)) / (exp(2 * zNorm * aNorm) - exp(-2 * zNorm * aNorm)));

[avg_acc, avg_r_time, acc] = simulate_manyDecisions_A03(A, c, y0, z, T0, dt, y, i, N);

1 - ER;

DT = zNorm * tanh(zNorm * aNorm) + (((2 * zNorm * (1 - exp(-2 * x0 * aNorm))) / (exp(2 * zNorm * aNorm) - exp(-2 * zNorm * aNorm))) - x0);

RT = DT + T0;

disp(['The Predicted Accuracy = ' num2str(1-ER)])
disp(['The Average Simulated Accuracy For This Run = ' num2str(avg_acc)])
disp(['The Predicted Reaction Time = ' num2str(RT)])
disp(['The Average Simulated Reaction Time For This Run = ' num2str(avg_r_time)])
disp(['The absolute difference between the predicted and the simulation = ' num2str(abs(avg_r_time-RT))])
%disp(['The threashold that was crossed was ' num2str(z*sign(y(i)))])