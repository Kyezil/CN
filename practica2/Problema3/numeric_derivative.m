function [dx] = numeric_derivative(x, f, h = 1e-10)
  % aproxima el valor de la derivada
  % [IN]  x punt on s'ha de calcular la derivada
  % [IN]  f funcio que avalua f
  % [IN]  h infinitessimal de derivacio
  n = length(x);
  dx = [];
  for j = 1:n
    dx = [dx (f(x + h*eye(n)(:,j)) - f(x))/h];
  endfor
  dx = dx';
endfunction
