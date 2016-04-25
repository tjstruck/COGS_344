clear

Egame1 = .25*100 + 0.75*0;

Egame2 = 1.0*24;

disp(['Expected value for Gamble 1 is ', num2str(Egame1)])
disp(['Expected value for Gamble 2 is ', num2str(Egame2)])
disp(['Expected value theory would say that Gamble 1 would be chosen'])


x = [0:200];
Egame1 = 0.25*x + 0.75*0;

figure(1); clf; hold on;
plot(x, Egame1)
%legend('Hiss Angle Pobability', 'Sound Angle Pobability', 'Hiss and Sound Angle Pobability')
xlabel('Dollars ($)')
ylabel('Expected payoff')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(1),'question1_fig1_A10_expected_value_as_a_function_of_X.pdf')


x1 = [25:200];
Egame1 = 0.25*x1 + 0.75*0;
x2 = [0:24];
Egame2 = 0.25*x2 + 0.75*0;

% for i = 0:200
%     if i < 25
%         expected_value_theory_choice(i+1) = 0;
%     else
%         expected_value_theory_choice(i+1) = 1;
%     end
% end

figure(2); clf; hold on;
plot(x1,Egame1)
plot(x2,Egame2)
legend('Gamble 1 Chosen', 'Gamble 2 Chosen')
xlabel('Dollars ($)')
ylabel('Expected payoff')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(2),'question2_fig2_A10_expected_choice.pdf')


sigma = 5;


for x = 0:200
    for n = 1:100
        Egame1_new(n) = 0.25*x + sigma*randn;
        Egame2_new(n) = 1. * 24;
    end
    prob_choose_game1(x+1) = sum(Egame1_new > Egame2_new)/100;
end
x = 0:200;
figure(3); clf; hold on;
plot(x, prob_choose_game1)
%legend('Gamble 1 Chosen', 'Gamble 2 Chosen')
xlabel('Dollars ($)')
ylabel('Probability of Choosing Gamble 1')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(3),'question3_fig3_A10_probability_of_choosing_gamble_1_with_noise_and_sigma_5.pdf')




sigma = 20;


for x = 0:200
    for n = 1:100
        Egame1_new(n) = 0.25*x + sigma*randn;
        Egame2_new(n) = 1. * 24;
    end
    prob_choose_game1(x+1) = sum(Egame1_new > Egame2_new)/100;
end
x = 0:200;




beta = sqrt(pi)/sigma;


for x = 0:200
    prob_Egame1_formula(x+1) = 1/(1 + exp(beta * (24 - 0.25*x)));
end
x = 0:200;

figure(4); clf; hold on;
plot(x, prob_choose_game1)
plot(x, prob_Egame1_formula)
%legend('Gamble 1 Chosen', 'Gamble 2 Chosen')
xlabel('Dollars ($)')
ylabel('Probability of Choosing Gamble 1')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(4),'question4_and_5_fig4_A10_probability_of_choosing_gamble_1_with_noise_vs_formula.pdf')






beta = [0.1, 0.2, 0.5, 1, 10];
figure(5); clf; hold on;
for i = 1:length(beta)
    for z = 0:100
        softmax_formula(z+1) = 1/(1 + exp(beta(i) * (50 - z)));
        if z > 50
            max_choice(z+1) = 1;
        else
            max_choice(z+1) = 0;
        end
        
    end
    plot(0:100, softmax_formula)
end
plot(0:100, max_choice)
legend('Beta = 0.1', 'Beta = 0.2', 'Beta = 0.5', 'Beta = 1', 'Beta = 10','Maximize Choice', 'Location','southeast')
xlabel('Z')
ylabel('Probability of Z')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(5),'question6_fig5_A10_softmax.pdf')











