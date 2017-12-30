function [state_p,state_c,r] = cal_state_new(grid)
p_grid=~(grid);
m=[1 2 4;8 16 32;64 128 256];
min=Inf;
min_g=[];
min_p=[];
r=0;
for i=1:4
    temp=p_grid(1,:);                           %rotating anti clockwise
    p_grid(1,:)=flipud(p_grid(:,1));
    p_grid(:,1)=p_grid(3,:);
    p_grid(3,:)=flipud(p_grid(:,3));
    p_grid(:,3)=temp;
    value_p=sum(sum(m.*p_grid));
    temp=grid(1,:);
    grid(1,:)=flipud(grid(:,1));
    grid(:,1)=grid(3,:);
    grid(3,:)=flipud(grid(:,3));
    grid(:,3)=temp;
    if value_p<min
        r=i;
        min=value_p;
        min_g=grid;
        min_p=p_grid;
    end
end

c_grid=~(min_g-1);
state_c=sum(sum(m.*c_grid));
min_p;
state_p=min;

end