function [grid] = player(grid)
dum=1;

atp = randperm(9);
for i=1:length(atp)
    [dum,grid]=action(atp(i),grid,1);  %player=1
if dum==0
    break
end
end
end