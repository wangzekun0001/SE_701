function lambda =GetLambda(target,s,B,r,lambda,dt) %single agent, multi-agents should be ok
if lambda == 0
    randoml = rand;
    if randoml > 0.5
        lambda = lambda + 1;
    else
        lambda = lambda - 1;
    end
end
lambdadot = zeros(length(s));
for i = 1:length(target)
    for j = 1:length(s)
        lambdadot = lambdadot - abs(target(i)-s(j))*B/r*(target(i)-s(j));
    end
end
lambda = lambda + lambdadot * dt
end

