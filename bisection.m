function FX = eval_f(x)
    % evalua una funcio determinada
    % [IN] x del domini de f
    % [OUT] f(x)
    p = [1, -4, 7, -21, 6, 18];
    FX = polyval(p, x);
endfunction

function errors = bisection(start, niter = 10, tol = 1e-15)
  % usa el metode de la biseccio per trobar zeros en l'interval [a0,b0]
  % [IN] start = (x0,a) interval de cerca inicial
  x0 = start(1); a = start(2);
  s0 = eval_f(x0) >= 0;
  errors = [];

  for k = 1:niter
    if (abs(x0 - a) < tol)
      break;
    endif

    if (s0 && eval_f(a) >= 0)
      disp("error: interval no valid");
      return;
    endif

    x1 = x0 + (a - x0)/2;
    r = abs(1 - x0/x1);
    errors = [errors r];
    printf("It %d: interval [%f, %f], r = %e\n", k, x0, a, r);

    s1 = eval_f(x1) >= 0;
    if (s1 != s0)
      a = x0;
    endif
    x0 = x1; s0 = s1;
  endfor
  printf("Solution %f\n", x0);
endfunction

function plot_f()
  % plot function f
  x = linspace(0,5,100);
  y = eval_f(x);
  plot(x, y);
endfunction
