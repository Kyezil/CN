function FT = f(t, k = 2)
  % evalua una funcio determinada
  % [IN] t del domini de f
  % [OUT] f(t)
  FT = [ k*cos(t(1))*(8*sin(t(1)) + 3*sin(t(2))) - 9*sin(t(1)),
         k*cos(t(2))*(3*sin(t(1)) + 2*sin(t(2))) - 3*sin(t(2))];
         
endfunction


function JFT = df(t, k = 2)
  % evalua una funcio determinada
  % [IN] t del domini de f
  % [OUT] f(t)
  JFT = [ k*(-sin(t(1))*(8*sin(t(1)) + 3*sin(t(2))) + 8*cos(t(1))^2) - 9*cos(t(1)) 3*k*cos(t(1))*cos(t(2))
          3*k*cos(t(1))*cos(t(2)) k*(-sin(t(2))*(3*sin(t(1)) + 2*sin(t(2))) + 2*cos(t(2))^2) - 3*cos(t(2))];
         
endfunction