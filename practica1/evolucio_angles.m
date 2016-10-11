function [errors, sols] = newton_raphson_especial(k0, x0, fname, jname, niter = 10, tol = 1e-15)
  % usa el metode de newton raphson per resoldre un sistema eq no lineal amb aprox inicial
  % [IN]  x0 aproximacio inicial de la solucio
  % [IN]  fname nom de la funcio
  % [IN]  J aproximacio de la jacobiana
  % [IN]  niter nombre maxim d'iteracions
  % [IN]  tol tolerancia de l'error relatiu
  errors = []; sols = [];
  for k = 1:niter
    dx = -feval(jname, x0, k0)\feval(fname, x0, k0);
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

function sol = adapter(k)
  [err, sol] = newton_raphson_especial(k, [1,1]', 'f', 'df');
  sol = sol(:, end);
endfunction

function [sols] = evolucio_angles(a, b, n)
  k = linspace(a, b, n);
  sols = []
  for i=1:n
    sol = adapter(k(i));
    sols(:,end+1) = sol;
  endfor
  plot(k, sols(1,:), 'r', k, sols(2, :), 'b');
endfunction