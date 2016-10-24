function FT3 = f3(t, k = 2)
  % evalua la funcio de la extensio a tres varetes
  % [IN] t del domini de f3
  % [OUT] f3(t)
  t1 = t(1);t2 = t(2);t3 = t(3);
  FT3 = [ k*cos(t1)*(14*sin(t1)/3 + 3*sin(t2) + sin(t3)) - 5*sin(t1),
         k*cos(t2)*(8*sin(t2)/3 + 3*sin(t1) + sin(t3)) - 3*sin(t2),
         k*cos(t3)*(2*sin(t3)/3 + sin(t2) + sin(t1)) - sin(t3)];
         
endfunction


function JFT3 = df3(t, k1 = 2, k2 = 1.5) 
  % evalua numericament la jacobiana de la funcio de la extensio a tres varetes
  % [IN] t del domini de f3
  % [OUT] Jf3(t)
  t1 = t(1); t2 = t(2); t3 = t(3);
  JFT3 = [k1*14/3*cos(t1)*cos(t1) - k1*sin(t1)*(14/3*sin(t1) + 3*sin(t2) + sin(t3)) - k2*5*cos(t1) ,k1*3*cos(t1)*cos(t2) ,k1*cos(t1)*cos(t3)
  k1*3*cos(t1)*cos(t2), k1*8/3*cos(t2)*cos(t2) - k1*sin(t2)*(3*sin(t1) + 8/3*sin(t2) + sin(t3)) - k2*3*cos(t2), k1*cos(t2)*cos(t3)
   k1*cos(t1)*cos(t3), k1*cos(t2)*cos(t3), k1*2/3*cos(t3)*cos(t3) - k1*sin(t3)*(sin(t1) + sin(t2) + 2/3*sin(t3)) - k2*cos(t3)];
endfunction
