function [errors sols] = secant(x, fname, niter = 10, tol = 1e-16)
  % usa el metode de la secant per trobar un zero de f
  % [IN] x      aproximacio inicial, de R2
  % [IN] fname  funcio que evalua f
  % [IN] niter  nombre maxim d'iteracions
  % [IN] tol    tolerancia sobre l'error relatiu
  x0 = x(1); x1 = x(2);

  f0 = feval(fname, x0); f1 = feval(fname, x1);
  r = abs((x1 - x0)/x1);
  printf("IT1 > sol = %f\tr = %e\n", x1, r);
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
    printf("IT%d > sol = %f\tr = %e\n", k, x2, r);
    x0 = x1; x1 = x2;
    f0 = f1; f1 = feval(fname, x1);
  endfor
  printf("Solution %.16f\n", x1);
endfunction