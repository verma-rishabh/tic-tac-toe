function [grid] = player1(grid)
prompt='Your turn = ';
matrix=display1(grid)
atp = input(prompt);
[dum,grid]=action(atp,grid,1); 
while(dum)
    [dum,grid]=action(atp,grid,1);  %player=1
    if dum==1
        prompt='Incorrect response re enter = ';
        atp = input(prompt);
    end
end
end