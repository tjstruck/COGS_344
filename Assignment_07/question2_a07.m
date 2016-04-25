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
saveas(figure(1),'question2_fig1_A07_uniform_probability_angle.pdf')


p_hiss_angle_given_angle = exp(cos(theta_vals - pi/6)/(pi/10))/sum(exp(cos(theta_vals - pi/6)/(pi/10)));

% figure(2); clf; hold on;
% plot(theta_vals,p_hiss_angle_given_angle)
% xlabel('Angle (theta)')
% ylabel('Probability of Angle')
% %ylim([0, 2e-4])
% set(gca, 'fontsize', 12)
% saveas(figure(1),'question2_fig2_A07_heard_a_hiss.pdf')


p_sight_angle_given_angle = exp(cos(theta_vals - pi/3)/(pi/7))/sum(exp(cos(theta_vals - pi/6)/(pi/7)));

% figure(3); clf; hold on;
% plot(theta_vals,p_sight_angle_given_angle)
% xlabel('Angle (theta)')
% ylabel('Probability of Angle')
% %ylim([0, 2e-4])
% set(gca, 'fontsize', 12)
% saveas(figure(1),'question2_fig3_A07_saw_something.pdf')

joint_p = (exp(cos(theta_vals - pi/3)/(pi/7)) .* exp(cos(theta_vals - pi/6)/(pi/10)));
joint_p = joint_p/sum(joint_p);

% figure(4); clf; hold on;
% plot(theta_vals,joint_p)
% xlabel('Angle (theta)')
% ylabel('Probability of Angle')
% %ylim([0, 2e-4])
% set(gca, 'fontsize', 12)
% saveas(figure(1),'question2_fig4_A07_joint_of_sight_and_sound.pdf')


figure(2); clf; hold on;
plot(theta_vals,p_hiss_angle_given_angle, '-y')
plot(theta_vals,p_sight_angle_given_angle, '-r')
plot(theta_vals,joint_p, '-k')
legend('Hiss Angle Pobability', 'Sound Angle Pobability', 'Hiss and Sound Angle Pobability')
xlabel('Angle (theta)')
ylabel('Probability of Angle')
%ylim([0, 2e-4])
set(gca, 'fontsize', 12)
saveas(figure(2),'question2_fig2_A07_probability_where_is_Voldemort.pdf')


max_p = find(joint_p==max(joint_p));

spell_a_prob = sum(joint_p(int16(length(joint_p)+max_p-(pi/4*1000)):end)) + sum(joint_p(1:max_p+int16((pi/4*1000))));

disp(['Spell A has a ', num2str(spell_a_prob), ' chance to hit'])

spell_b_prob = sum(joint_p(max_p-int16((pi/16*1000)):max_p+int16((pi/16*1000))));

disp(['Spell B has a ', num2str(spell_b_prob), ' chance to hit'])




for i = 1:1000
    shoot = rand;
    if shoot <= spell_a_prob
        spell_a_damage(i) = 1;
    else
        spell_a_damage(i) = 0;
    end
    
    if shoot <= spell_b_prob
         spell_b_damage(i) = 10;
    else
        spell_b_damage(i) = 0;
    end
    
end

avg_spell_a_damage = mean(spell_a_damage);
avg_spell_b_damage = mean(spell_b_damage);
disp(['Spell A does ', num2str(avg_spell_a_damage), ' on average'])
disp(['Spell B does ', num2str(avg_spell_b_damage), ' on average'])

