function errors = newton(x0, niter = 10, tol = 1e-16)
  % usa el metode de newton per trobar un zero usant x d'aprox inicial
  % [IN] x0 aproximacio inicial de la solucio
  errors = [];
  for k = 1:niter
  dx = eval_df(x0); % todo
  x1 = x0 - eval_f(x0)/dx;
  r = abs ((x0 - x1)/x1);
  errors = [ errors r ];
    printf("Iteration %d, solució %f, r = %f\n", k, x1, r);
  if (abs(x1 - x0) < tol)
    break;
  endif
  x0 = x1;
  endfor
  printf("Solution %f\n", x1);
endfunction
