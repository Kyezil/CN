function [errors, sols] = newton(x0, f, df, niter = 10, tol = 1e-16, silent=false)
  % usa el metode de newton per trobar un zero usant x d'aprox inicial
  % [IN] x0     aproximacio inicial de la solucio
  % [IN] f      funcio que evalua f
  % [IN] df     funcio que evalua la derivada de f
  % [IN] niter  nombre maxim d'iteracions
  % [IN] tol    tolerancia sobre l'error relatiu 
  errors = []; sols = [ x0 ];
  for k = 1:niter
    x1 = x0 - f(x0)/df(x0);
    r = abs((x0 - x1)/x1);
    errors = [ errors r ]; sols = [ sols x1 ];
    printf("IT%d > sol = %f\tr = %e\n", k, x1, r);
    if (r < tol)
      break;
    endif
    x0 = x1;
  endfor
  printf("Solution %.16f\n", x1);
endfunction
