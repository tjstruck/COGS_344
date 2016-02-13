function avg_acc = simulate_manyDecisions(M, D, f)
for m = 1:M
    isChoiceCorrect(m) = simulate_oneDecision(D, f);
end
avg_acc = mean(isChoiceCorrect);