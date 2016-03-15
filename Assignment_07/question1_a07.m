clear

b = [0:0.001:1];
p_t = 1-b;
p_h = b;

figure(1); clf; hold on;
plot(b,p_h)
xlabel('Bias (b)')
ylabel('Probability of One Heads')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig1_question1_A07_probability_one_head.pdf')

figure(1); clf; hold on;
plot(b,p_t)
xlabel('Bias (b)')
ylabel('Probability of One Tails')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig2_question1_A07_probability_one_tail.pdf')

p_17h = b.^17;
p_8t = (1-b).^8;

p_17h_8t = p_17h.*p_8t;

figure(1); clf; hold on;
plot(b,p_17h_8t)
xlabel('Bias (b)')
ylabel('Probability of 17 Heads and 8 Tails')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig3_question1_A07_probability_17_heads_8_tails.pdf')


uniform_posterior = (p_17h_8t.*(1/length(b)))./sum(p_17h_8t)

figure(1); clf; hold on;
plot(b,uniform_posterior)
xlabel('Bias (b)')
ylabel('Uniform Posterior Probability')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig4_question1_A07_uniform_posterior.pdf')


h_b1 = [1:-0.002:0.002]
h_b2 = [0:0.002:1]


h_b3 = horzcat(h_b1,h_b2)

hermione_posterior = (p_17h_8t.*(h_b3))./sum(p_17h_8t)

figure(1); clf; hold on;
plot(b,h_b3)
xlabel('Bias (b)')
ylabel('Hermione Prior Probability')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig5_question1_A07_hermione_prior.pdf')



figure(1); clf; hold on;
plot(b,hermione_posterior)
xlabel('Bias (b)')
ylabel('Hermione Posterior Probability')
%xlim([0.5 0.8])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig6_question1_A07_hermione_posterior.pdf')








