function y = tret(f, aprox)
  [X,Y] = eulerend(f, [0 1], [0 aprox], 100);
  y = Y(end, 1);
end

%exemple amb metode del tret
function ex1d()
  % y'' + y = 0
  % y(0) = 1, y(1) = 1
  n = 100;
  f = @(x,y) [y(2);-y(1)];
  % trobar y'(0) = alpha
  g = @(ap) tret(f, ap) - 1;
  y0 = [0 fzero(g, 1)];
  [X,Y] = eulerend(f, [0 1], y0, n);
  plot(X,Y(:, 1));
end
