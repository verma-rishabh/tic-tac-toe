function [result] = rules(grid)
%[i,j]=size(grid);
p=~grid;   %players action (0)
c=~(grid-1); %computers action (1)
result=2;
for i=1:3
    
    if ((sum(p(i,:))==3) || (sum(p(:,i))==3) || (sum([p(1,1),p(2,2),p(3,3)])==3) || (sum([p(1,3),p(2,2),p(3,1)])==3))
    result=0;
    end


    if ((sum(c(i,:))==3) || (sum(c(:,i))==3) || (sum([c(1,1),c(2,2),c(3,3)])==3) || (sum([c(1,3),c(2,2),c(3,1)])==3))
    result=1;
    end

end