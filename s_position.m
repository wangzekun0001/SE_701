function P =  s_position(omega,s,r) %等分位置,s位置，总位置信息
p = zeors(length(omega)); %初始化 （）
p = max(1-abs(omega-s)/r,0); %目标每个位置的
P = 1 - prod(1-p,1);%下一秒位置