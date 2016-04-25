function likeliehood = likeliehood_beta(beta, rsk, EVsafe, EVrisk)

for x = 1:length(beta)
    for i = 1:24
        for j = 1:12
            if rsk(i,j) == 1
                cp(i,j) = 1 / (1 + exp(beta(x) * (EVsafe(j) - EVrisk(j))));
            else
                cp(i,j) = 1 / (1 + exp(beta(x) * (EVrisk(j) - EVsafe(j))));
            end
        end
    end
    likeliehood(x) = sum(sum(log(cp)));
end
