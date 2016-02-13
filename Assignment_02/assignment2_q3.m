D = 100;
M = 1000;
f_vals = [0.5:0.05:0.8];

for i = 1:length(f_vals)
    f = f_vals(i);
    avg_acc(i) = simulate_manyDecisions(M, D, f);
end


figure(1); clf; hold on;
plot(f_vals, avg_acc)
xlabel('Proportion of dots moving in the correct direction (f)')
ylabel('Probability of correct answer')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
%saveFigurePdf(gcf, '~/Documents/MATLAB/Assignment_02/q3_fig1.pdf')
saveas(figure(1),'fig1_q3.pdf')
















