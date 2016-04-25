clear
load riskyChoiceData

EVrisk = P .* V;

for i = 1:length(EVrisk)
    fraction_risk(i) = mean(rsk(:,i));
    EVsafe(i) = 10;
end

figure(1); clf; hold on;
plot(EVrisk - EVsafe, fraction_risk, 'o')
% legend('Data', 'Best fit line','Location','northwest')
xlabel('Difference in Expected (EV risk - EV safe)')
ylabel('Fraction Risk Takers')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(1),'question1_fig1_A11_fraction_given_difference_in_risk.pdf')

beta = 1;
p_choose = 1 / (1 + exp(beta * (EVrisk(1) - EVsafe(1))));

for i = 1:24
    for j = 1:12
        if rsk(i,j) == 1
            cp(i,j) = 1 / (1 + exp(beta * (EVsafe(j) - EVrisk(j))));
        else
            cp(i,j) = 1 / (1 + exp(beta * (EVrisk(j) - EVsafe(j))));
        end
    end
end

log(cp);

sum(sum(log(cp)));
beta = [0:0.01:1];
likeliehood = likeliehood_beta(beta, rsk, EVsafe, EVrisk);


figure(2); clf; hold on;
plot(beta, likeliehood)
%legend('Gamble 1 Chosen', 'Gamble 2 Chosen')
xlabel('Beta')
ylabel('Log Likeliehood')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(2),'question1_fig2_log_likeliehood_given_beta.pdf')

for i = 1:length(likeliehood)
    if likeliehood(i) == max(likeliehood)
        best_beta = beta(i);
    end
end

disp(['Maximum likeliehood is at beta = ', num2str(best_beta)])

for i = 1:21
    EV_risk(i) = i - 1;
    EV_safe(i) = 10;
end

for i = 1:length(EV_risk)
    p_risk(i) = 1 / (1 + exp(best_beta * (EV_safe(i) - EV_risk(i))));
end

figure(3); clf; hold on;
plot(EVrisk - EVsafe, fraction_risk, 'o')
plot(EV_risk - EV_safe, p_risk)
legend('Data', 'Best fit line','Location','northwest')
xlabel('Difference in Expected (EV risk - EV safe)')
ylabel('Fraction Risk Takers')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(3),'question1_fig1_A11_fraction_given_difference_in_risk_bestfit.pdf')













