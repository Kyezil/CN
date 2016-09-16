function FX = eval_f(x)
  % evalua una funcio determinada
  % [IN] x del domini de f
  % [OUT] f(x)
  p = [1, -4, 7, -21, 6, 18];
  FX = polyval(p, x);
endfunction

function errors = secant(start, niter = 10, tol = 1e-16)
  % usa el metode de la secant per trobar un zero usant x d'aprox inicial
  % [IN] x aproximacio inicial de la solucio
  x0 = start(1); x1 = start(2);
  f0 = eval_f(x0); f1 = eval_f(x1);
  errors = [ abs(f1 - f0) ];
  for k = 2:niter
	m = (f1 - f0)/(x1 - x0);
	x2 = x1 - f1/m;
	r = abs(x2 - x1);
	errors = [ errors r ];
    printf("Iteration %d, solució %f, r = %f\n", k, x, r);
	if (abs(x2 - x1) < tol)
		break;
	endif
	x0 = x1; x1 = x2;
  endfor
  printf("Solution %f\n", x);
endfunction

function plot_f()
  % plot function f
  x = linspace(0,5,100);
  y = eval_f(x);
  plot(x, y);
endfunction
