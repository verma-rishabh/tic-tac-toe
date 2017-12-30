function [action] = amap(at,r)
%x=[1 7 9 3];
%y=[2 4 8 6];
x=[1 3 9 7];
y=[2 6 8 4];

for i=1:r
if find(x==at)
    at=x(mod(find(x==at),4)+1);
end

if find(y==at)
    at=y(mod(find(y==at),4)+1);
end
end

action=at;

end