function [mat] = display1(grid)
mat=[' ' ' ' ' ';' ' ' ' ' ';' ' ' ' ' '];
mat=char(mat);
for i=1:9
    if grid(i)==1
       mat(i)='O';
    end
    if grid(i)==0
       mat(i)='X';
    end
    if grid(i)==2
       mat(i)='-';
    end
end