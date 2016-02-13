% clear the workspace so you don't have random variables hanging around
clear 

% number of dots
D = 100;

% probability in correct direction
f = 0.8;

% number of timesteps (i.e. nFrames - 1)
T = 1;

% number moving in correct direction

% loop over all dots
for i = 1:D
    
    % is dot i moving in the correct direction?
    if rand < f
        isCorrect(i) = 1;
    else
        isCorrect(i) = 0;
    end
    
end

% compute number going in correct way and incorrect way
N_correct = sum(isCorrect);
N_incorrect = D - N_correct;

% make decision
isChoiceCorrect = N_correct > N_incorrect;

if N_correct > N_incorrect
    
    % correct choice made
    isChoiceCorrect = 1;
    
elseif N_incorrect > N_correct
    
    % incorrect choice made
    isChoiceCorrect = 0;
    
elseif N_correct == N_incorrect
    
    % guess 50-50 chance of being correct
    isChoiceCorrect = rand < 0.5;
    
end