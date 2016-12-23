%Modificacio de la quadratura de Simpson adaptativa per retornar la divisio de [a, b] resultant
function [res, x] = simpAdav(f, a, b, tol) 
  [res, x] = simpAdav2(f, a, b, tol/(b - a)); %dividim la tolerancia per la 
                                              %longitud de l'interval per compensar
                                              %l'augment de l'error calculat a 
                                              % l'apartat a)
  x = [a x b];
end

function  [res, x] = simpAdav2(f, a, b, tol) 
  x = [];
  mid = (a + b)/2;
  res1 = integral_newton(f, a, mid, 3, 0)(1);
  res2 = integral_newton(f, mid, b, 3, 0)(1);
  res = res1 + res2;
  s = integral_newton(f, a, b, 3, res)(1);
  err = abs(s - res);
  if err >= tol*(b - a)
    [res1, x1] = simpAdav2(f, a, mid, tol);
    [res2, x2] = simpAdav2(f, mid, b, tol);
    x = [x1 mid x2];
    res = res1 + res2;
  endif
end