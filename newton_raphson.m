function [errors, sols] = newton_raphson(x0, fname, jname, niter = 10, tol = 1e-15)
  % usa el metode de newton raphson per resoldre un sistema eq no lineal amb aprox inicial
  % [IN]  x0 aproximacio inicial de la solucio
  % [IN]  fname nom de la funcio
  % [IN]  J aproximacio de la jacobiana
  % [IN]  niter nombre maxim d'iteracions
  % [IN]  tol tolerancia de l'error relatiu
  errors = []; sols = [];
  for k = 1:niter
    dx = -feval(jname, x0)\feval(fname, x0);
    x1 = x0 + dx;
    r = norm(x0 - x1)/norm(x1);
    errors = [ errors r];
    sols = [ sols x1 ];
    printf("IT%2d > sol = %s\tr = %e\n", k, mat2str(x1, 5), r);
    x0 = x1;
    if (r < tol)
      break;
    endif
  endfor
  printf("Solution %s\n", mat2str(x0, 16));
endfunction
