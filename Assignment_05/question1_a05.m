clear
Va(1) = 0;
Vb(1) = 0;
r = 1;
T = 100;
alpha = 0.1;
for t = 2:T
    Va(t) = Va(t-1) + alpha * (r - Va(t-1));
    Vb(t) = 0;
end

for t = 2:T
    Va(t+99) = Va(t+99-1) + alpha * (r - Va(t+99-1));
    Vb(t+99) = Vb(t+99-1) + alpha * (r - Vb(t+99-1));
end

figure(1); clf; hold on;
plot(Va)
plot(Vb)
xlabel('Trial Number (T)')
ylabel('Average Reward of Trial T (V)')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig1_question1_A05_Va_and_Vb_vs_Trials.pdf')

disp(['Final value of Va is ', num2str(Va(end))])
disp(['Final value of Vb is ', num2str(Vb(end))])





