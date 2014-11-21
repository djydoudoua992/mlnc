function [] = DisplayPolicy(Policy, ActionNames, Locs, Shape)

S = length(Policy);
A = length(Policy(1,:));
Action = zeros(S);

for s = 1:S
  for a = 1:A
    if Policy(s,a) == 1
	    %disp(strcat('Policy(',StateNames(s,:),')=',ActionNames(a,:)))
        Action(s) = ActionNames(a,:);
        if char(Action(s)) == 'N'
            Action(s) = '��';
        elseif char(Action(s)) == 'E'
            Action(s) = '��';
        elseif char(Action(s)) == 'W'
            Action(s) = '��';
        else
            Action(s) = '��';
        end
    end
  end
end
DisplayGrid(char(Action),Locs,Shape);
end