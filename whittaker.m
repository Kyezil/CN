function [errors sols] = whittaker(start, fname, niter = 10, tol = 1e-15)
  % usa el metode de whittaker per trobar un zero de f
  % [IN] start(0) aproximacio inicial
  % [IN] start(1) valor de m, parametre de whittaker
  % [IN] fname    funcio que evalua f
  % [IN] niter    nombre maxim d'iteracions
  % [IN] tol      tolerancia sobre l'error relatiu
  x0 = start(1); m = start(2);
  errors = []; sols = [];
  for k = 1:niter
    x1 = x0 - feval(fname, x0)/m;
    r = abs((x1 - x0)/x1);
    errors = [ errors r ];
    sols = [ sols x1 ];
    printf("IT%d > sol = %f\tr = %e\n", k, x1, r);
    if (r < tol)
      break;
    endif
    x0 = x1;
  endfor
  printf("Solution %.16f\n", x1);
endfunction
