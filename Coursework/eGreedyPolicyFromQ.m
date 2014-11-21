function [eGreedyPolicy] = eGreedyPolicyFromQ(Q, Absorbing, epsilon)

S = length(Q(:,1)); % number of states
A = length(Q(1,:)); % number of actions 
eGreedyPolicy = zeros(S,A);

for s = 1:S
    if Absorbing(s)
        continue
    end
    [~, optimalA] = max(Q(s,:));
    for a = 1:A
        if a == optimalA
            eGreedyPolicy(s,a) = 1 - epsilon + epsilon/A;
        else
            eGreedyPolicy(s,a) = epsilon/A;
        end
    end
end


