clear
Va(1) = 0;
Vb(1) = 0;
r = 1;
T = 100;
alpha = 0.1;

delta(1)  = r - (Va(1) + Vb(1));

for t = 2:T
    if rand(1) <= 0.5
        r = 1
        delta(t) = r - (Va(t-1) + 0);
        Va(t) = Va(t-1) + alpha * delta(t);
        Vb(t) = Vb(t-1);
    else
        r = 0
        delta(t) = r - (Va(t-1) + Vb(t-1));
        Va(t) = Va(t-1) + alpha * delta(t);
        Vb(t) = Vb(t-1) + alpha * delta(t);
    end
end



figure(1); clf; hold on;
plot(Va)
plot(Vb)
xlabel('Trial Number (T)')
ylabel('Average Reward of Trial T (V)')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig1_question3_A05_inhibition_model_Va_and_Vb_vs_Trials.pdf')

disp(['Final value of Va is ', num2str(Va(end))])
disp(['Final value of Vb is ', num2str(Vb(end))])






