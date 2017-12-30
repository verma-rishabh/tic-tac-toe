function [state_m] = gen

x=[0 0 0;0 0 1;0 1 0;0 1 1;1 0 0;1 0 1;1 1 0;1 1 1];
state_m=[];
for i=1:length(x)
    for j=1:length(x)
        for k=1:length(x)
            grid=[x(i,:);x(j,:);x(k,:)];
            [number,dum]=cal_state_new(grid);
            if (find(state_m==number))
            else
            state_m=[state_m;number];    
            end
        end
    end
end
state_m=sort(state_m);
end          
