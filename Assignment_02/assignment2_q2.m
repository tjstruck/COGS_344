clear
D = 10;
f = 0.6;
M = 10;


for m = 1:M
    isChoiceCorrect(m) = simulate_oneDecision(D, f);
end

mean(isChoiceCorrect)