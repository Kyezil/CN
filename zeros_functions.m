function FX = eval_f(x)
    % evalua una funcio determinada
    % [IN] x del domini de f
    % [OUT] f(x)
    p = [1, -4, 7, -21, 6, 18];
    FX = polyval(p, x);
endfunction

function errors = bisection(a0, b0, niter = 10, tol = 1e-16)
  % usa el metode de la biseccio per trobar zeros en l'interval [a0,b0]
  % [IN] (a0,b0) interval de cerca inicial
  sign_left = eval_f(a0) >= 0;
  if (sign_left && eval_f(b0) >= 0)
    disp("interval no valid");
    return;
  endif

  a = a0;
  b = b0;
  last = 0;
  errors = [];
  for k = 1:niter
    mig = a + (b-a)/2;
	r = abs((last - mig)/mig);
	errors = [errors log(r)];
	printf("Iteration %d, interval [%f, %f], r = %f\n", k, a, b);
	if (abs(last - mig) < tol)
	  break;
	endif
	last = mig;
    sign_mig = eval_f(mig) >= 0;
    if (sign_mig == sign_left) a = mig;
    else b = mig;
    endif
  endfor
  printf("Solution %f\n", (a+b)/2);
endfunction

function plot_f()
  % plot function f
  x = linspace(0,5,100);
  y = eval_f(x);
  plot(x, y);
endfunction

