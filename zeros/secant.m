function [errors sols] = secant(x, f, niter = 10, tol = 1e-16, silent=false)
  % usa el metode de la secant per trobar un zero de f
  % [IN] x      aproximacio inicial, de R2
  % [IN] f      funcio que evalua f
  % [IN] niter  nombre maxim d'iteracions
  % [IN] tol    tolerancia sobre l'error relatiu
  x0 = x(1); x1 = x(2);

  f0 = f(x0); f1 = f(x1);
  r = abs((x1 - x0)/x1);
  if !silent
   printf("IT1 > sol = %f\tr = %e\n", x1, r);
  endif
  errors = [ r ]; sols = [ x0, x1 ];
  for k = 2:niter
    if (r < tol)
      break;
    endif
    m = (f1 - f0)/(x1 - x0);
    x2 = x1 - f1/m;
    r = abs((x2 - x1)/x2);
    errors = [ errors r ];
    sols = [ sols x2 ];
    if !silent
      printf("IT%d > sol = %f\tr = %e\n", k, x2, r);
    endif
    x0 = x1; x1 = x2;
    f0 = f1; f1 = f(x1);
  endfor
  printf("Solution %.16f\n", x1);
endfunction
