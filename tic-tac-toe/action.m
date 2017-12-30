 function [val,grid] = action(at,grid,p)

 
 t_grid=~(grid-2);
  grid;
  val=1;
  if t_grid(at)~=1
      val=1;
  
  else
      val=0;
    if p==1
      grid(at)=0;
    else
      grid(at)=1;
    end
  end
 end