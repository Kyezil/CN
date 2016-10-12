function [errors, sols] = bisection(start, f, niter = 10, tol = 1e-15, silent = false)
  % usa el metode de la biseccio per trobar zeros en un interval
  % [IN] start  interval inicial de cerca, de R2
  % [IN] f		  funcio que evalua f
  % [IN] niter  nombre maxim d'iteracions
  % [IN] tol    tolerancia sobre l'error relatiu
  x0 = start(1); a = start(2);
  s0 = f(x0) >= 0;
  sA = f(a) >= 0;
  errors = []; sols = [];
  for k = 1:niter
    if (abs((x0 - a)/x0) < tol)
      break;
    endif
    
    if (a > x0)
      [x0, a] = deal(a, x0);
      [s0, sA] = deal(sA, s0);
    endif

    if (s0 == sA)
      disp("error: interval no valid");
      return;
    endif
    
    x1 = x0 + (a - x0)/2; % punt mig
    r = abs(1 - x0/x1);
    errors = [ errors r ];
    sols = [ sols x1 ];
  
  	if !silent
	 		 printf("IT%2d > [%f, %f]\tr = %e\n", k, x0, a, r);
	 	endif

    s1 = f(x1) >= 0;
    if (s1 == s0)
      x0 = x1; s0 = s1;
    else
      a = x1; sA = s1;
    endif
  endfor
  if !silent
	  printf("Solution %.16f\n", x0);
	endif
endfunction
