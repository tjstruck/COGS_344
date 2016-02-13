clear
A = 1;%Drift rate
c = 1;%noise
y0 = 0;%Inital condition
z_vals = [0.1:0.01:1.0];%threashold to a decision
T0 = 0.5;%inital time
N = 1000;
dt = 0.01;
y(1) = y0;
i = 1;

ITI = 1;%inter-trial interval
r_correct = 1;%Reward for the correct answer
r_incorrect = 0;%Reward for the incorrect answer


for i = 1:length(z_vals)
    z = z_vals(i);
    [avg_acc, avg_r_time] = simulate_manyDecisions_A03(A, c, y0, z, T0, dt, y, i, N);

    zNorm = z/A;
    aNorm = (A/c)^2;
    x0 = y0/A;
    ER(i) = 1/(1 + exp(2 * zNorm * aNorm)) - ((1 - exp(-2 * x0 * aNorm)) / (exp(2 * zNorm * aNorm) - exp(-2 * zNorm * aNorm)));

    DT(i) = zNorm * tanh(zNorm * aNorm) + (((2 * zNorm * (1 - exp(-2 * x0 * aNorm))) / (exp(2 * zNorm * aNorm) - exp(-2 * zNorm * aNorm))) - x0);

    RT(i) = DT(i) + T0;

    RR(i) = ((1 - ER(i)) * r_correct + ER(i) * r_incorrect) / (DT(i) + T0 + ITI);
end

figure(1); clf; hold on;
plot(z_vals, ER)
xlabel('Threashold to make a decision (z)')
ylabel('Error Rate (ER)')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
%saveFigurePdf(gcf, '~/Documents/MATLAB/Assignment_02/q3_fig1.pdf')
saveas(figure(1),'fig1_A03_q4_ER_v_z.pdf')


figure(2); clf; hold on;
plot(z_vals, DT)
xlabel('Threashold to make a decision (z)')
ylabel('Decsision Time (DT)')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
%saveFigurePdf(gcf, '~/Documents/MATLAB/Assignment_02/q3_fig1.pdf')
saveas(figure(2),'fig1_A03_q4_DT_v_z.pdf')


for i = 1:length(z_vals)
    if RR(i) == max(RR)
        break
    end
end

figure(3); clf; hold on;
plot(z_vals(i),RR(i),'*')
plot(z_vals, RR)
xlabel('Threashold to make a decision (z)')
ylabel('Reward Rate (RR)')
legend(['Best z value = ' num2str(z_vals(i))])
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
%saveFigurePdf(gcf, '~/Documents/MATLAB/Assignment_02/q3_fig1.pdf')
saveas(figure(3),'fig1_A03_q4_RR_v_z.pdf')

disp(['The Optimal z for the Best Reward Rate is ' num2str(z_vals(i))])
disp(['The Best Predicted Error Rate at z = ' num2str(z_vals(i)) ' is ' num2str(ER(i))])
disp(['The Best Predicted Reaction Time at z = ' num2str(z_vals(i)) ' is ' num2str(RT(i)) ' seconds'])
%disp(['The Average Simulated Reaction Time For This Run = ' num2str(avg_r_time)])















