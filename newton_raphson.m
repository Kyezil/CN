function [errors, sol] = newton_raphson(fname, jname, x0, niter = 10, tol = 1e-15)
  % usa el metode de newton raphson per resolder un sistema eq no lineal amb aprox inicial
  % [IN] fname nom de la funcio
  % [IN] J aproximacio de la jacobiana
  % [IN] x0 aproximacio inicial de la solucio
  % [IN] niter nombre maxim d'iteracions
  % [IN] tol tolerancia de l'error relatiu
  %[L U] = lu(feval(jname, x0));
  errors = [];
  for k = 1:niter
    dx = -feval(jname, x0)\feval(fname, x0);
    x1 = x0 + dx;
    r = norm(x0 - x1)/norm(x1);
    errors = [ errors log(r) ];
    printf("Iteration %d, solució %s, r = %e\n", k, mat2str(x1), r);
    if (r < tol)
      break;
    endif
    x0 = x1;
  endfor
  sol = x1;
  printf("Solution %s\n", mat2str(sol));
endfunction
