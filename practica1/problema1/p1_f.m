function par = par(t)
  par = [2*cos(t) - cos(2*t), 2*sin(t) - sin(2*t)];
endfunction

function FT = f(t, p)
  % evalua una funcio determinada
  % [IN] t del domini de f
  % [OUT] f(t)
  X = 2*cos(t) - cos(2*t);
  Y = 2*sin(t) - sin(2*t);
  DX = -2*sin(t) + 2*sin(2*t);
  DY = 2*cos(t) - 2*cos(2*t);
  FT = (X - p(1))*DX + (Y - p(2))*DY;
endfunction
