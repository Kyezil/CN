function FX = eval_f(x)
  % evalua una funcio determinada
  % [IN] x del domini de f
  % [OUT] f(x)
  p = [1, -4, 7, -21, 6, 18];
  FX = polyval(p, x);
endfunction

function FX = eval_df(x)
  % evalua la derivada de f en x
  % [IN] on evaluar la derivada
  % [OUT] f'(x)
  dp = [5,-16, 21, -42, 6];
  FX = polyval(dp, x);
endfunction

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

function plot_f()
  % plot function f
  x = linspace(0,5,100);
  y = eval_f(x);
  plot(x, y);
endfunction
