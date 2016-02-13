clear
D = 10;
f = 0.6;

for i = 1:D
    if rand <= f
        isCorrect(i) = 1;
    else
        isCorrect(i) = 0;
    end
end

N_correct = sum(isCorrect);
N_incorrect = D - sum(isCorrect);

if N_correct > N_incorrect
    isChoiceCorrect = 1;
elseif N_correct < N_incorrect
    isChoiceCorrect = 0;
elseif N_correct == N_incorrect
    isChoiceCorrect = rand <= 0.5;
end

isChoiceCorrect





