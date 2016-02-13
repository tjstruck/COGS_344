clear

% parameters of the model

% number of decisions
M = 1000;

% number of dots
D = 100;

% probability in correct direction
f = 0.8;

% number of timesteps (i.e. nFrames - 1)
T = 1;

% loop over M decisions
for m = 1:M
    isChoiceCorrect(m) = simulate_oneDecision(D, f);
end

% fraction correct
mean(isChoiceCorrect)