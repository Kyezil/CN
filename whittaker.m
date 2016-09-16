function FX = eval_f(x)
  % evalua una funcio determinada
  % [IN] x del domini de f
  % [OUT] f(x)
  p = [1, -4, 7, -21, 6, 18];
  FX = polyval(p, x);
endfunction

function errors = whittaker(start, niter = 10, tol = 1e-15)
  % usa el metode de la secant per trobar un zero usant x d'aprox inicial
  % [IN] start = (x0, m) aprox inicial i valor constant m
  x0 = start(1); m = start(2);
  x1 = x0 + tol*2;
  errors = [];
  for k = 1:niter
    x1 = x0 - eval_f(x0)/m;
    r = abs((x1 - x0)/x1);
    errors = [ errors r ];
    printf("Iteration %d, solució %f, r = %e\n", k, x1, r);
    if (abs(x1 - x0) < tol)
      break;
    endif
    x0 = x1;
  endfor
  printf("Solution %f\n", x1);
endfunction

function plot_f()
  % plot function f
  x = linspace(0,5,100);
  y = eval_f(x);
  plot(x, y);
endfunction
