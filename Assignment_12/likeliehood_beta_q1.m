function likeliehood = likeliehood_beta(beta, rsk, EVsafe, EVrisk)


for j = 1:12
    if rsk(j) == 1
        cp(j) = 1 / (1 + exp(beta * (EVsafe(j) - EVrisk(j))));
    else
        cp(j) = 1 / (1 + exp(beta * (EVrisk(j) - EVsafe(j))));
    end
end
likeliehood = sum(sum(log(cp)));

