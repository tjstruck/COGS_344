clear

% number of decisions
M = 100;

% number of dots
D = 100;

% probability in correct direction
f_vals = [0.5:0.01:0.8];

% number of timesteps (i.e. nFrames - 1)
T = 1;

% loop over values of f
for i = 1:length(f_vals)
    f = f_vals(i);
    fCorrect(i) = simulate_manyDecisions(M, D, f);
end


% plot result
figure(1); clf; hold on;
plot(f_vals, fCorrect)
xlabel('fraction dots moving in correct direction, f')
ylabel('probability of correct answer')
xlim([0.5 0.8])
set(gca, 'fontsize', 24)
saveFigurePdf(gcf, '~/Desktop/fig')