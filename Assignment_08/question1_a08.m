clear

b = [0:0.001:1];
p_b = 1/length(b);
p_b = repmat(p_b,1,length(b));


figure(1); clf; hold on;
plot(b,p_b, '-y')
xlabel('Bias')
ylabel('Prior Probability Bias')
ylim([0, 1e-2])
set(gca, 'fontsize', 12)
saveas(figure(1),'question1_fig1_A07_uniform_bias.pdf')

p_17h = b.^17;
p_8t = (1-b).^8;

d = p_17h.*p_8t;

first_step_posterior = b.*p_b;



figure(2); clf; hold on;
plot(b,first_step_posterior, '-y')
xlabel('Bias')
ylabel('Posterior Probability Bias')
%ylim([0, 1e-2])
set(gca, 'fontsize', 12)
saveas(figure(2),'question1_fig2_A07_prosterior_heads.pdf')

d = [1,1,1,0,1,0,1,1,1,0,1,1,1,0,0,1,0,1,1,1,0,0,1,1,1];

for i = 1:length(first_step_posterior)
    post(i,1) = 1/length(b);%first_step_posterior(i);
end
post(:,1) = post(:,1)/sum(post(:,1));

for t = 1:25
    for i = 1:length(b)
        if d(t) == 1
            post(i,t+1) = post(i,t).*b(i);
        else
            post(i,t+1) = post(i,t).*(1-b(i));
        end
    end
    post(:,t+1) = post(:,t+1)./sum(post(:,t+1));
end

time = [1:25];

figure(3); clf; hold on;
plot(post)
xlabel('Bias')
ylabel('Posterior Probability Bias')
%ylim([0, 1e-2])
set(gca, 'fontsize', 12)
saveas(figure(3),'question1_fig3_A07_posterior_over_time.pdf')

figure(4); clf; hold on;
imagesc(post)
xlabel('Bias')
ylabel('Posterior Probability Bias')
%ylim([0, 1e-2])
set(gca, 'ydir', 'normal')
saveas(figure(4),'question1_fig4_A07_imagecs_posterior_over_time.pdf')

for t = 1:25
    mew(t) = sum(post(:,t).*b(:));
end


p_reward = 0.5;%probability of reward
p_no_rward = 1 - p_reward;%probability of no reward
T = 25;%trials

for t = 1:T
    if rand(1) <= p_reward
        r(t) = 1;
    else
        r(t) = 0;
    end
    V(t) = sum(r)/t;
end


figure(5); clf; hold on;
plot(mew)
plot(V)
xlabel('Bias')
ylabel('Posterior Probability Bias')
legend('Baysian Average Overtime', 'Brute force reward')
%ylim([0, 1e-2])
set(gca, 'fontsize', 12)
saveas(figure(5),'question1_fig5_A07_mean_posterior_over_time.pdf')


%the difference if that the brute force mean should end up being around 0.5
%, aka similar chance to a fair coin, after many trials but it is random so 
%it takes many trials (original was 100 trials.

%The Baysian prior's mean will always evolve in the same way since the data
%is set to a specific outcome and will end up at the same mean after X 
%number of trials everytime it is simulated.


