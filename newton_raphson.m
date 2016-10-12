function [errors, sols] = newton_raphson(x0, f, df, niter = 10, tol = 1e-15, silent=false)
  % usa el metode de newton raphson per resoldre un sistema eq no lineal amb aprox inicial
  % [IN]  x0 aproximacio inicial de la solucio
  % [IN]  f, funcio que avalua f
  % [IN]  df, funcio que avalua la jacobiana de f
  % [IN]  niter nombre maxim d'iteracions
  % [IN]  tol tolerancia de l'error relatiu
  errors = []; sols = [];
  for k = 1:niter
    dx = -df(x0)\f(x0);
    x1 = x0 + dx;
    r = norm(x0 - x1)/norm(x1);
    errors = [ errors r];
    sols = [ sols x1 ];
    if !silent
    	printf("IT%2d > sol = %s\tr = %e\n", k, mat2str(x1, 5), r);
   	endif
    x0 = x1;
    if (r < tol)
      break;
    endif
  endfor
  if !silent
  	printf("Solution %s\n", mat2str(x0, 16));
  endif
endfunction
