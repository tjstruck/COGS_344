clear
p_reward = 0.5;%probability of reward
p_no_rward = 1 - p_reward;%probability of no reward
T = 100;%trials

for t = 1:T
    if rand(1) <= p_reward
        r(t) = 1;
    else
        r(t) = 0;
    end
    V(t) = sum(r)/t;
end

figure(1); clf; hold on;
plot(1:T, V)
xlabel('Trial Number (T)')
ylabel('Average Reward of Trial T (V)')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
%saveFigurePdf(gcf, '~/Documents/MATLAB/Assignment_02/q3_fig1.pdf')
saveas(figure(1),'fig1_question1_A04_brute_force.pdf')