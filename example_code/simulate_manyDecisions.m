function fCorrect = simulate_manyDecisions(M, D, f)

% loop over M decisions
for m = 1:M
    isChoiceCorrect(m) = simulate_oneDecision(D, f);
end

% fraction correct
fCorrect = mean(isChoiceCorrect);