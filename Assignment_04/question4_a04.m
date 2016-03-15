clear
p_reward = 1;%probability of reward
p_no_rward = 1 - p_reward;%probability of no reward
T = 100;%trials
alpha = 0.1;
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
    V(t) = V(t-1) + alpha*(r(t) - V(t-1));
    PE(t) = r(t) - V(t-1);
    LR(t) = 1/t;
end

remove_reward_trial = 101;
r(remove_reward_trial) = 0;
V(remove_reward_trial) = V(remove_reward_trial-1) + alpha*(r(remove_reward_trial) - V(remove_reward_trial-1));
PE(remove_reward_trial) = r(remove_reward_trial) - V(remove_reward_trial-1);
PE(remove_reward_trial)

return_reward_trial = 102;
r(return_reward_trial) = 2;
V(return_reward_trial) = V(return_reward_trial-1) + alpha*(r(return_reward_trial) - V(return_reward_trial-1));
PE(return_reward_trial) = r(return_reward_trial) - V(return_reward_trial-1);
PE(return_reward_trial)

















































