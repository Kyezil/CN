function dydt = f(t, y)
  A = 50; b = 0.2; Cd = 0.65; g = 9.81;
  dydt = -2/(3*A)*Cd*b*sqrt(2*g)*y^(3/2);
end

function [X,Y] = apartatA()
  y0 = 0.75; n = 4;
  [X, Y] = eulerend(@f, [0,120], y0, n);
  plot(X,Y, '-o');
  legend('evolucio aigua 2 min');
end

function [X,Y] = apartatB()
  y0 = 0.75; n = 1;
  [X, Y] = rungeKutta4(@f, [0,120], y0, n);
  plot(X,Y, '-o');
  legend('evolucio aigua 2 min');
end

function [err1, err2] = apartatC()
  sol = 0.383;
  [x1,y1] = apartatA();
  [x2,y2] = apartatB();
  err1 = abs(y1(end) - sol);
  err2 = abs(y2(end) - sol);
end

function apartatD()
  sol = 0.383;
  [err1, err2] = apartatC();
  n = 1;
  err = err1;
  while (err >= err2)
    ++n;
    [x,y] = eulerend(@f, [0,120], 0.75, n);
    err = abs(y(end) - sol);
  end
  n
end


function [x,Y] = rungeKutta4(f,interval,y0,n)
  a = interval(1);
  b = interval(2);
  h = (b-a)./n;
  x = [a];
  y = y0;
  Y = [y0];
  for i=2:n+1
    xi = x(i) = h.*(i - 1);
    k1 = f(xi, y);
    k2 = f(xi + h/2, y + h*k1/2);
    k3 = f(xi + h/2, y + h*k2/2);
    k4 = f(xi + h, y + h*k3);
    y = y + h/6*(k1 + 2*k2 + 2*k3 + k4);
    Y(end + 1) = y;
  end
end