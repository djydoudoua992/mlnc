function [OptimalPolicy] = Sarsa(T, R, Initial, Absorbing, gamma, epsilon, alpha, maxsteps, episodes)

S = length(T(:,1,1)); % number of states - introspecting transition matrix
A = length(T(1,1,:)); % number of actions - introspecting transition matrix
Q = zeros(S, A); % i.e. state-action value function estimate
Policy = GetUnbiasedPolicy(Absorbing, A);

for i=1:episodes
  priorState = DrawFromDist(Initial);
  priorAction = DrawFromDist(Policy(priorState,:)); % get action
  for j=1:maxsteps
    postState = DrawFromDist(T(:,priorState,priorAction));
    reward = R(postState,priorState,priorAction);
    if Absorbing(postState) ~= 1
        postAction = DrawFromDist(Policy(postState,:));
    else
      Q(priorState,priorAction) = (1-alpha)*Q(priorState,priorAction) + alpha*(reward);
      break;
    end
    Q(priorState,priorAction) = (1-alpha)*Q(priorState,priorAction) + alpha*(reward + gamma*Q(postState,postAction));
    priorState = postState;
    priorAction = postAction;
  end
  Policy = eGreedyPolicyFromQ(Q, Absorbing, epsilon);
end
  OptimalPolicy = GreedyPolicyFromQ(Q, Absorbing);
end