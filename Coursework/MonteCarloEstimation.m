function [Q] = MonteCarloEstimation(T, R, Initial, Absorbing, Policy, gamma, n)

S = length(T);
A = length(T(1,1,:));
Q = zeros(S, A); 
alpha = 0.8;

for i = 1:n
    trace = GetTrace(T, R, Initial, Absorbing, Policy);
    traceLength = length(trace(:,1));
    return_t = trace(traceLength,1);
    for t=traceLength-1:-1:1
        s = trace(t,2);
        a = trace(t,3);
        Q(s,a) = (1-alpha)*Q(s,a) + alpha*return_t;
        return_t = return_t*gamma + trace(t,1);
    end
end