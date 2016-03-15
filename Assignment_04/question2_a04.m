clear
p_reward = 0.5;%probability of reward
p_no_rward = 1 - p_reward;%probability of no reward
T = 100;%trials

if rand(1) <= p_reward
    V(1) = 1;
else
    V(1) = 0;
end

LR(1) = 1;
for t = 2:T
    if rand(1) <= p_reward
        r(t) = 1;
    else
        r(t) = 0;
    end
    V(t) = V(t-1) + 1/t*(r(t) - V(t-1));
    PE(t) = r(t) - V(t-1);
    LR(t) = 1/t;
end

figure(1); clf; hold on;
plot(1:T, V)
xlabel('Trial Number (T)')
ylabel('Average Reward of Trial T (V)')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
%saveFigurePdf(gcf, '~/Documents/MATLAB/Assignment_02/q3_fig1.pdf')
saveas(figure(1),'fig1_question2_A04_comparison.pdf')






figure(2); clf; hold on;
plot(1:T, PE)
plot(1:T, r)
xlabel('Trial Number (T)')
ylabel('Reward (red) and Prediction Error (blue)')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
%saveFigurePdf(gcf, '~/Documents/MATLAB/Assignment_02/q3_fig1.pdf')
saveas(figure(2),'fig2_question2_A04_prediction_error.pdf')




figure(3); clf; hold on;
plot(1:T, LR)
xlabel('Trial Number (T)')
ylabel('Reward (red) and Prediction Error (blue)')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
%saveFigurePdf(gcf, '~/Documents/MATLAB/Assignment_02/q3_fig1.pdf')
saveas(figure(3),'fig3_question2_A04_learning_rate.pdf')


T = 10000;
V(1) = r(1)
for t = 2:T
    if rand(1) <= p_reward
        r(t) = 1;
    else
        r(t) = 0;
    end
    V(t) = V(t-1) + 1/t*(r(t) - V(t-1));
    PE(t) = r(t) - V(t-1);
    LR(t) = 1/t;
end


p_reward = 0.1;
for t = 10001:T+100
    if rand(1) <= p_reward
        r(t) = 1;
    else
        r(t) = 0;
    end
    V(t) = V(t-1) + 1/t*(r(t) - V(t-1));
    PE(t) = r(t) - V(t-1);
    LR(t) = 1/t;
end
x = 10001:T+100

figure(4); clf; hold on;
plot(V(end-99:end))
xlabel('Trial Number (T)')
ylabel('Average Reward with Sudden Change in Probability of Reward (V)')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
%saveFigurePdf(gcf, '~/Documents/MATLAB/Assignment_02/q3_fig1.pdf')
saveas(figure(4),'fig4_question2_A04_sudden_change_in_prob.pdf')



