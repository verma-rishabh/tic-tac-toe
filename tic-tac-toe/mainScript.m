close all
clear all
clc
disp('player is X')
disp('computer is O')
disp('Enter number to play 1 4 7');
disp('                     2 5 8');
disp('                     3 6 9');
state_m=gen();
%Q=[5*ones(140,513,9)];
load('Q1.mat');
grid=2+zeros(3,3);
p_win=0;
c_win=0;
gamma=1;
alpha=0.5;
epsilon=0.1;
episodes=5;                             %number of total episodes
while(episodes)
   % clc;
   
   grid=2+zeros(3,3);
    episodes=episodes-1
stp1i=1;
stc1i=1;

rot=4;
dum=1;
while(dum)
    [t,at1] = max(Q(stp1i,stc1i,:));
    at1_r=amap(at1,rot);
    [dum,x]=action(at1_r,grid,0);
          if dum==1
              Q(stp1i,stc1i,at1)=-Inf;
          end
end
if( rand<epsilon )         % explore ... with a random action 
      dum=1;
      stp1i;
      stc1i;
          while(dum)
          tmp=randperm(find(Q(stp1i,stc1i,:)>-Inf)); 
          at1=tmp(1); 
          at1_r=amap(at1,rot);
          [dum,x]=action(at1_r,grid,0);
          if dum==1
              Q(stp1i,stc1i,at1)=-Inf;
          end
          end
end

    if( rand<.5 )         % first turn
      grid=player1(grid);
      [stp1,stc1,rot]=cal_state_new(grid);
      stp1i=find(state_m==stp1);
      stc1i=stc1+1;
      dum=1;
    while(dum)
    [t,at1] = max(Q(stp1i,stc1i,:));
    at1_r=amap(at1,rot);
    stp1i;
    stc1i;
    [dum,x]=action(at1_r,grid,0);
          if dum==1
              Q(stp1i,stc1i,at1)=-Inf;
          end
    end
      if( rand<epsilon )         % explore ... with a random action 
      dum=1;
          while(dum)
          tmp=randperm(find(Q(stp1i,stc1i,:)>-Inf)); 
          at1=tmp(1);
          at1_r=amap(at1,rot);
          [dum,x]=action(at1_r,grid,0);
          if dum==1
              Q(stp1i,stc1i,at1)=-Inf;
          end
          end
      end
    end
  % begin the episode
  while( 1 ) 
        %at1
        at1_r=amap(at1,rot);
        computer=at1_r
      [val,grid]=action(at1_r,grid,0);    %0=> computer has taken action
      result=rules(grid);
      if ((result~=2) || isempty(find(~(grid-2))))
        
          if result~=2
      if result==1
          rew=0;
          matrix=display1(grid)
          disp('comp is winner')
          c_win=c_win+1;
      else
          rew=-100;
          matrix=display1(grid)
          disp('player1 is winner')
          p_win=p_win+1;
      end
          else
              rew=-1;
              disp('Tie')
          end
      Q(stp1i,stc1i,at1) = Q(stp1i,stc1i,at1) + alpha*( rew - Q(stp1i,stc1i,at1) ); 
      save Q.mat Q;
      break; 
    end
      grid=player1(grid);
      result=rules(grid);
      if ((result~=2) || isempty(find(~(grid-2))))
          
      if (result~=2)
          
      if result==1
          rew=0;
          matrix=display1(grid)
          disp('comp is winner')
          c_win=c_win+1;
      else
          rew=-100;
          matrix=display1(grid)
          disp('player1 is winner')
          p_win=p_win+1;
      end
      else
          rew=-1;
          disp('Tie')
      end
      Q(stp1i,stc1i,at1) = Q(stp1i,stc1i,at1) + alpha*( rew - Q(stp1i,stc1i,at1) ); 
      save Q.mat Q;
      break; 
    end
      
      [stp2,stc2,rot]=cal_state_new(grid);
      stp2i=find(state_m==stp2);
      stc2i=stc2+1;
      dum=1;
      while(dum)
      [t,at2] = max(Q(stp2i,stc2i,:));                    %considering only max action because implementing Q-learning
      stp2i ;
      stc2i;
      at2_r=amap(at2,rot);
      at2_r;
      [dum,x]=action(at2_r,grid,0);
          if dum==1
              Q(stp2i,stc2i,at2)=-Inf;
          end
      end
  
    rew=-1;
    Q(stp1i,stc1i,at1) = Q(stp1i,stc1i,at1) + alpha*( rew + gamma*Q(stp2i,stc2i,at2) - Q(stp1i,stc1i,at1) ); 
  dum=1;
      while(dum)
      [t,at2] = max(Q(stp2i,stc2i,:)); 
      stp2i;
      stc2i;
      at2_r=amap(at2,rot);
      [dum,x]=action(at2_r,grid,0);
          if dum==1
              Q(stp2i,stc2i,at2)=-Inf;
          end
      end
      if( rand<epsilon )         % explore ... with a random action for next turn
      dum=1;
          while(dum)
          tmp=randperm(find(Q(stp2i,stc2i,:)>-Inf)); 
          at2=tmp(1);
          at2_r=amap(at2,rot);
          [dum,x]=action(at2_r,grid,0);
          if dum==1
              Q(stp2i,stc2i,at2)=-Inf;
          end
          end
      end
   
    stp1i = stp2i; stc1i = stc2i; at1 = at2; 
    
   
  end 
end
comp_win=c_win/(p_win+c_win)                     % win % 
save Q1.mat Q;                          % saving Q

 