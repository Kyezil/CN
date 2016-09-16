function errors = newton(x, niter = 10, tol = 1e-16)
  % usa el metode de newton per trobar un zero usant x d'aprox inicial
  % [IN] x aproximacio inicial de la solucio
  errors = [];
  for k = 1:niter
	x_new = x - eval_f(x)/eval_df(x);
	r = abs ((x - x_new)/x_new);
	errors = [ errors log(r) ];
    printf("Iteration %d, solució %f, r = %f\n", k, x, r);
	if (abs(x_new - x) < tol)
		break;
	endif
	x = x_new;
  endfor
  printf("Solution %f\n", x);
endfunction