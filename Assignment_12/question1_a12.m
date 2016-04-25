clear
load riskyChoiceData

EVrisk = P .* V;

for i = 1:length(EVrisk)
    fraction_risk(i) = mean(rsk(:,i));
    EVsafe(i) = 10;
end




beta = [0:0.01:1];

for x = 1:length(beta)
    likeliehood(x) = likeliehood_beta_q1(beta(x), rsk(2,:), EVsafe, EVrisk);
end





func = @(x) -likeliehood_beta_q1(x, rsk(2,:), EVsafe, EVrisk);

for x = 1:length(beta)
    LL(x) = sum(func(beta(x)));
end

figure(1); clf; hold on;
plot(beta, likeliehood)
plot(beta, LL)
legend('Normal Log Likelihood', 'Negative Log Likelihood')
xlabel('Beta')
ylabel('Log Likeliehood')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(1),'question1_fig1_subject_2_log_likeliehood_given_beta.pdf')


beta0 = 0.5;
UB = inf;
LB = 0;

beta_fit = fmincon(func, beta0, [],[],[],[], LB, UB);






func = @(x,i) -likeliehood_beta_q1(x, rsk(i,:), EVsafe, EVrisk);

for i = 1:24
    func = @(x) -likeliehood_beta_q1(x, rsk(i,:), EVsafe, EVrisk);
    beta_fit(i) = fmincon(func, beta0, [],[],[],[], LB, UB);
%     fits(i) = func(beta_fit,i);
end


figure(2); clf; hold on;
for i = 1:24
    plot(beta_fit(i), func(beta_fit(i)),'.')
end

% legend('Normal Log Likelihood', 'Negative Log Likelihood')
xlabel('Beta Fit')
ylabel('Log Likeliehood')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(2),'question4_fig2_beta_fit_plot.pdf')




figure(3); clf; hold on;
hist(beta_fit)
% legend('Normal Log Likelihood', 'Negative Log Likelihood')
xlabel('Beta Fit')
ylabel('Frequency')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(3),'question6_fig3_beta_fit_histagram.pdf')

for i = 1:21
    EV_risk(i) = i - 1;
    EV_safe(i) = 10;
end

for x = 1:length(beta_fit)
    for i = 1:length(EV_risk)
        p_risk(x,i) = 1 / (1 + exp(beta_fit(x) * (EV_safe(i) - EV_risk(i))));
    end
    
end
figure(4); clf; hold on
plot(EV_safe - EV_risk, p_risk)
% legend('Normal Log Likelihood', 'Negative Log Likelihood')
xlabel('Difference in Expected Value')
ylabel('Probability Risk')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(4),'question7_fig4_choice_curves.pdf')



















% likeliehood = likeliehood_beta_q2(beta, rsk(:,2), EVsafe, EVrisk);


% figure(1); clf; hold on;
% plot(beta, likeliehood)
% %legend('Gamble 1 Chosen', 'Gamble 2 Chosen')
% xlabel('Beta')
% ylabel('Log Likeliehood')
% %ylim([0, 2e-4])
% set(gca, 'fontsize', 12)
% saveas(figure(1),'question1_fig2_log_likeliehood_given_beta.pdf')

% for i = 1:length(likeliehood)
%     if likeliehood(i) == max(likeliehood)
%         best_beta = beta(i);
%     end
% end
% 
% disp(['Maximum likeliehood is at beta = ', num2str(best_beta)])
% 
% 










