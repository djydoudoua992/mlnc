function [OptimalPolicy] = MonteCarloBatchOptimisation(T, R, Initial, Absorbing, gamma, epsilon, n, N)

A = length(T(1,1,:)); % number of actions 
OptimalPolicy = GetUnbiasedPolicy(Absorbing, A);

for i = 1:N
    Q = MonteCarloEstimation(T, R, Initial, Absorbing, OptimalPolicy, gamma, n);
    OptimalPolicy = eGreedyPolicyFromQ(Q, Absorbing, epsilon);
end
