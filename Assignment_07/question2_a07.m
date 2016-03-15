clear

theta_vals =[0:0.001:2*pi];

for i = 1:length(theta_vals)
    uniform_p_theta(i) = 1/length(theta_vals);
end

figure(1); clf; hold on;
plot(theta_vals,uniform_p_theta)
xlabel('Angle (theta)')
ylabel('Probability of Angle')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig1_question2_A07_uniform_probability_angle.pdf')


p_hiss_angle_given_angle = exp(cos(theta_vals - pi/6)/(pi/10))/sum(exp(cos(theta_vals - pi/6)/(pi/10)));

figure(2); clf; hold on;
plot(theta_vals,p_hiss_angle_given_angle)
xlabel('Angle (theta)')
ylabel('Probability of Angle')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig2_question2_A07_heard_a_hiss.pdf')


p_sight_angle_given_angle = exp(cos(theta_vals - pi/6)/(pi/7))/sum(exp(cos(theta_vals - pi/6)/(pi/7)));

figure(3); clf; hold on;
plot(theta_vals,p_sight_angle_given_angle)
xlabel('Angle (theta)')
ylabel('Probability of Angle')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig3_question2_A07_saw_something.pdf')

joint_p = p_hiss_angle_given_angle.*p_sight_angle_given_angle;

figure(4); clf; hold on;
plot(theta_vals,joint_p)
xlabel('Angle (theta)')
ylabel('Probability of Angle')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(1),'fig4_question2_A07_joint_of_sight_and_sound.pdf')








