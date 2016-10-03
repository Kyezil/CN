function [dx] = numeric_derivative(x, fname, h = 1e-10)
  % aproxima el valor de la derivada
  % [IN]  x punt on s'ha de calcular la derivada
  % [IN]  fname nom de la funcio
  % [IN]  h infinitessimal de derivacio
  n = length(x);
  dx = [];
  for j = 1:n
    dx = [dx (feval(fname, x + h*eye(n)(:,j)) - feval(fname, x))/h];
  endfor
endfunction
